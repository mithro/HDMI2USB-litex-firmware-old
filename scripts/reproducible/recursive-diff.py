#!/usr/bin/env python3

import multiprocessing
import os
import subprocess
import sys
import time
import traceback

from progress.bar import Bar

outdir = sys.argv[1]
dir1 = sys.argv[2]
dir2 = sys.argv[3]

for i in range(0, min(len(dir1), len(dir2))):
	if dir1[i] != dir2[i]:
		break

common = dir1[:i]
print(common)

def get_files(dirname):
	return set(l.decode('utf-8') for l in subprocess.check_output("cd %s; find -type f" % dirname, shell=True).splitlines())


files1 = get_files(dir1) 
files2 = get_files(dir2)


allfiles = files1.union(files2)

skippedfiles = set()
goodfiles = set()
for filepath in allfiles:
	dirname, filename = os.path.split(filepath)
	if '.git' in dirname or 'conda' in dirname or "__pycache__" in dirname:
		skippedfiles.add(filepath)
	else:
		goodfiles.add(filepath)


print("Found %s files (skipping %s)" % (len(goodfiles), len(skippedfiles)))
#assert "./build/misoc/build/opsis_hdmi2usb-hdmi2usbsoc-opsis.par" in goodfiles
#assert "./third_party/misoc/build/opsis_hdmi2usb-hdmi2usbsoc-opsis.v" in goodfiles
#import pprint
#pprint.pprint(goodfiles)
#sys.exit()

counter=multiprocessing.Value('i', 0)

def check_file(filepath):
	try:
		dirname, filename = os.path.split(filepath)

		if filename.startswith("."):
			outfilename = "_"+filename[1:]
			assert outfilename not in allfiles
		else:
			outfilename = filename

		outfile = os.path.normpath(os.path.join(outdir, dirname, outfilename+".html"))

		outputdir = os.path.dirname(outfile)
		while not os.path.exists(outputdir):
			try:
				os.makedirs(outputdir)
			except FileExistsError:
				pass

		file1 = os.path.normpath(os.path.join(dir1, dirname, filename))
		file2 = os.path.normpath(os.path.join(dir2, dirname, filename))
		for f in (file1, file2):
			if os.path.exists(f):
				subprocess.check_call("sed -i -e's/%s[123456789]/opsis-soc-X/g' '%s'" % (common, f), shell=True)

		env = os.environ.copy()
		info = subprocess.check_output("objdump -D '%s' || true" % (file1,), shell=True, stderr=subprocess.STDOUT).decode('utf-8')
		if "UNKNOWN" in info:
			env['PATH']="%s/%s:%s" % (dir1, "/build/conda/lm32-elf/bin", os.environ['PATH'])

#		print("./diffoscope/bin/diffoscope --max-report-size 2000000000 --new-file --html %s %s %s" % (outfile, file1, file2))
		try:
			subprocess.call("./diffoscope/bin/diffoscope --max-report-size 200000000 --new-file --html '%s' '%s' '%s'" % (outfile, file1, file2), shell=True, env=env)
		except Exception as e:
			traceback.print_exc()
			return (filepath, e)

#		if not os.path.exists(outfile):
#			print("File %s was the same" % outfile)
#			with open(outfile, 'w') as f:
#				f.write("<html><body>%s and %s are the same.</body></html>" % (file1, file2))

		return (filepath, os.path.exists(outfile))
	except Exception as e:
		traceback.print_exc()
		raise
	finally:
		with counter.get_lock():
			counter.value += 1

pool = multiprocessing.Pool(30)

output = []

r = pool.map_async(check_file, sorted(goodfiles), callback=output.extend)
class FancyBar(Bar):
    message = 'Loading'
    fill = '*'
    suffix = '%(percent).1f%% - %(eta)ds'

    @property
    def avg(self):
        if self.index > 0:
            return (self.elapsed / self.index)
        else:
            return 0

bar = FancyBar('Processing', max=len(goodfiles))
while not r.ready():
	bar.goto(counter.value)
	time.sleep(0.1)
bar.goto(len(goodfiles))

assert len(output) == len(goodfiles), "%i != %i" % (len(output), len(goodfiles))
sumfile = os.path.join(outdir, "summary.txt")
with open(sumfile, "w") as f:
	for fname, diff in output:
		f.write("%s %s\n" % (["S", "D"][diff], fname))

sumhtml = os.path.join(outdir, "summary.html")
with open(sumhtml, "w") as f:
	f.write("""
<html>
<style>
* {
  font-family: Courier;
}

.S {
  color: green;
}
.D {
  color: red;
}
</style>
<body>
""")
	for fname, diff in output:
		f.write("<a href='./{1}.html' class='{0}'>{0} {1}</span><br>\n".format(["S", "D"][diff], fname))

	f.write("""
</body>
</html>
""")

while True:
	outdirs = set(l.decode('utf-8') for l in subprocess.check_output("find %s -type d -empty" % outdir, shell=True).splitlines())
	if not outdirs:
		break
	for d in outdirs:
		print("Removed %s as empty" % d)
		os.rmdir(d)

print(open(sumfile, "r").read())
