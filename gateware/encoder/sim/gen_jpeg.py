tb_core_data = open("tb_core.out")
tb_core_jpeg = open("tb_core.jpg", "wb")
datas = []
for data in tb_core_data:
    datas.append(int(data, 16))
tb_core_jpeg.write(bytes(datas))
