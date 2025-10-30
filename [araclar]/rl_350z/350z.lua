txd = engineLoadTXD("350z/350z.txd")
engineImportTXD(txd, 527)
dff = engineLoadDFF("350z/350z.dff", 527)
engineReplaceModel(dff, 527)