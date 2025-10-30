txd = engineLoadTXD("y7celhan/y7celhan.txd")
engineImportTXD(txd, 567)
dff = engineLoadDFF("y7celhan/y7celhan.dff", 567)
engineReplaceModel(dff, 567)