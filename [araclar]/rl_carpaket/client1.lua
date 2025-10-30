
local sx, sy		= guiGetScreenSize()
local mods,dmods,exists,isimler = {},{},{},{} 

local yuklendi,dosyaisim = false,""

local movingOffsetX, movingOffsetY = 0, 0
local isMoving = false

local function downloadMods()
	for i, v in ipairs (dmods) do 
		local file = v.file;
		downloadFile(file);		
	end
end	

function table.find (tbl, index, value)
	for i, v in pairs (tbl) do 
		if v[index] == value then 
			return i;
		end
	end
	return false;
end	

addEvent ("loader.request", true);
addEventHandler ("loader.request", root,
	function (tbl)
		if tbl then 
			mods,dmods = tbl,{}
			local deaktifler = loadSetting("Araclar","mbLoader") or toJSON({})
			local deaktifler = fromJSON(deaktifler)
			for i,v in pairs(mods) do
				 isimler[v.file] = v.isim
				 local model = tostring(v.model)
				 if not deaktifler[model] then
					table.insert (dmods, {file = v.file, model = v.model,boyut=v.boyut});
				 end	
			end
			downloadMods();
		end
	end
);

function getMods()
	if mods then
		return mods,yuklendi
	end	
end

addEventHandler ("onClientResourceStart", resourceRoot, 
	function ()
		triggerServerEvent ("loader.onload", localPlayer);
		addEventHandler ("onClientRender", root, drawLoader);
		addEventHandler('onClientClick', getRootElement(),click)
	end
);

addEvent("loader.download", true)
addEventHandler("loader.download", root, function(model)
	downloadFile("files/"..model..".txd")
	downloadFile("files/"..model..".dff")
end)

addEventHandler ("onClientFileDownloadComplete", root,
	function (name, success)
		if ( source == resourceRoot ) then
			if success then
				local index = table.find (mods, "file", name);
				if index then 
					exists[name] = true;
					dosyaisim = isimler[name]
					local model = mods[index].model;
					if name:find (".dff") then
						local dff = engineLoadDFF (name)
						engineReplaceModel (dff, model);
					elseif name:find (".txd") then 
						local txd = engineLoadTXD (name);
						engineImportTXD(txd, model);
					elseif name:find (".col") then 
						local col = engineLoadCOL (name);
						engineReplaceCOL (col, model);
					end	
					tick = getTickCount()+2000;
				end	
			end
		end
	end
);	



function drawLoader ()
	if not dmods then return; end
	if next (dmods) then
		local count = 0;
		for _ in pairs (exists) do 
			count = count + 1;
		end
			
		if count == #dmods then 
			if getTickCount() > tick then 
				removeEventHandler ("onClientRender", root, drawLoader);
				triggerEvent("loader.finish",resourceRoot)
				removeEventHandler('onClientClick', getRootElement(),click)
				yuklendi = true
				return;
			end	
		end
 	    local percent = math.ceil((count/#dmods)*100)
 	    local percentCircle = math.ceil((count/#dmods)*360)
		
		if (isCursorShowing() and isMoving) then
				local cursorX, cursorY = getCursorPosition();
		
				cursorX = cursorX * sx;
				cursorY = cursorY * sy;
				
				barX = cursorX - movingOffsetX;
				barY = cursorY - movingOffsetY;
		end
	end	
end
