txd = engineLoadTXD("m3gtr/m3gtr.txd")
engineImportTXD(txd, 475)
dff = engineLoadDFF("m3gtr/m3gtr.dff", 475)
engineReplaceModel(dff, 475)