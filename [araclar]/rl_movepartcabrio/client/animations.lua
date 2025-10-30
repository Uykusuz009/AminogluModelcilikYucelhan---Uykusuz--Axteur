AnimationsTable = {}

-- m4
AnimationsTable[603] = {
    timeMul = 1.2, -- Animasyonu% 20 yavaşlatır%

    components = {
        -- en arkadaki çatı
        ["krpcati3"] = {
            { time = 5000,    params = {0.01, -0.905, 0.422, 0, 0, 0} }, --sıfır konumu
			{ time = 7000,    params = {0.01, -0.905, 0.622, 0, 0, 0} },  --hafif kalkıyor
			{ time = 10000,    params = {0.01, -0.2, 0.522, -20, 0, 0} }, --toplanıyor
			{ time = 13000,    params = {0.01, -0.2, 0.522, -20, 0, 0} },  --beklyior
			{ time = 16000,    params = {0.01, -1.4, -0.1, -22, 0, 0} },  --bagaja giriyor
			{ time = 18500,    params = {0.01, -1.4, -0.1, -22, 0, 0} },  --bagaja giriyor
        },
		--üst çatı
        ["krpcati"] = {
            { time = 5000,    params = {0.01, -0.915, 0.415, 0,0,0} },  --konumu
			{ time = 6000,    params = {0.01, -0.915, 0.455, 0,0,0} },  --hafif kalkıyor
			{ time = 8000,    params = {0.01, -1.515, 0.355, 10,0,0} },  --toplanıyor
			{ time = 13000,    params = {0.01, -1.515, 0.355, 10,0,0} }, --toplanmasını bekliyor
			{ time = 16000,    params = {0.01, -2.65, -0.1, 0,0,0} }, --bagaja giriyor
			{ time = 18500,    params = {0.01, -2.65, -0.1, 0,0,0} }, --bagaja giriyor
        },
		["krpcati2"] = {
            { time = 13000,    params = {0.01, -0.91, 0.4155, 0,0,0} }, --bekliyor
			{ time = 16000,    params = {0.01, -2, -0.05, 0,0,0} },  --bagaja giriyor
			{ time = 18500,    params = {0.01, -2, -0.05, 0,0,0} },  --bagaja giriyor
        },

        -- -- arka kelebek camlar
        ["krpkelebek"] = {
            { time = 0,    params = {0.01, -0.91, 0.42, 0,0,0}, easing = "InOutQuad" },
			{ time = 2000,    params = {0.01, -0.91, 0.42, 5,0,0}, easing = "InOutQuad" },
            { time = 6000,    params = {0.01, -0.91, 0 , -20,0,0}  },
			{ time = 16000,    params = {0.01, -0.91, 0 , -20,0,0}  },
        },

        -- -- Bagaj
        ["krpbagaj"] = {
            { time = 10000,    params = {0, -1.678, 0.261, 0, 0, 0}, easing = "InOutQuad" }, --açılma süresi
            { time = 13000,    params = {0, -2, 0.65, 30, 0, 0} },  -- açılana kadar geçen süre
            { time = 16000,    params = {0, -2, 0.65, 30, 0, 0}, easing = "InOutQuad" }, --açılınca bekliyoruz
            { time = 18500,    params = {0, -1.678, 0.261, 0, 0, 0} },  --bagajı geri kapatıyoruz
        },
    }
}

--y7celhan porsche
AnimationsTable[429] = { -- y7celhan yerine araç id
    timeMul = 1.2, -- Animasyonu% 20 yavaşlatır%

    components = {
        ["y7celhan1"] = {  
            { time = 0,    params = {0, 0, 0, 0,0,0} },
            { time = 500, params = {0, -0.1, 0.1, 0, 0, 0} },
	    { time = 1000, params = {0, -0.6, 0, 0, 0, 0} },
	    { time = 2000, params = {0, -1, -0.5, 0, 0, 0} },
        },
        -- arka cam
        ["y7celhan2"] = {
            { time = 0,    params = {0, 0, 0, 0,0,0} },
            { time = 2000,    params = {0, -0.1, 0.3, 45,0,0} },
	    { time = 2000,    params = {0, -0.5, -0.3, 0,0,0} },
        },
    }
}

--audi r8
AnimationsTable[415] = {
    timeMul = 1.2, -- Animasyonu% 20 yavaşlatır%

    components = {
        -- üst çatı
        ["revalcati"] = {
			{ time = 5500,    params = {0, 0, 0, 0, 0, 0} }, --bekliyor
			{ time = 6000,    params = {0, 0.2, 0.2, 50, 0, 0} }, --katlanıyor
			{ time = 7000,    params = {0, -0.3, 0.5, 160, 0, 0} }, --bagaja giriyor
			{ time = 11000,    params = {0, -0.3, 0.5, 160, 0, 0} }, --bagaja giriyor
        },
		--orta kısım
        ["revalcati2"] = {
            { time = 5500,    params = {0, 0, 0, 0,0,0} },  --sıfır konumu
			{ time = 7000,    params = {0, 0, 0, 70,0,0} },  --katlanıyor
			{ time = 11000,    params = {0, 0, 0, 70,0,0} },  --katlanıyor
        },
		--arka kelebek
		["revalcati3"] = {
			{ time = 0,    params = {0, 0, 0, 0,0,0} }, --sıfır konumu
			{ time = 1000,    params = {0, 0, -0.2, -30,0,0} }, --açılıyor
			{ time = 4500,    params = {0, 0, -0.2, -30,0,0} }, --bagajın açılmasını bekliyor
			{ time = 5500,    params = {0, 0, -0.4, 0,0,0} }, --kapanıyor
			{ time = 11000,    params = {0, 0, -0.4, 0,0,0} }, --kapanıyor
        },
        -- -- Bagaj
        ["revalbagaj"] = {
            { time = 2000,    params = {0, -0.78, 0.185, 0, 0, 0}, easing = "InOutQuad" }, --açılma süresi
			{ time = 3500,    params = {0, -0.85, 0.25, -10, 0, 0}, easing = "InOutQuad" }, --açılmaya hazırlanıyor
			{ time = 5000,    params = {0, -1.5, 0.4, 0, 0, 0}, easing = "InOutQuad" }, --açılma süresi
			{ time = 7500,    params = {0, -1.5, 0.4, 0, 0, 0}, easing = "InOutQuad" }, --bagaja toplanmalarını bekliyor
			{ time = 9500,    params = {0, -0.85, 0.25, -10, 0, 0}, easing = "InOutQuad" }, --kapanıyor
			{ time = 11000,    params = {0, -0.78, 0.185, 0, 0, 0}, easing = "InOutQuad" }, --kapanmayı tamamladı
        },
    }
}
--huracan
AnimationsTable[502] = {
    timeMul = 1.2, -- Animasyonu% 20 yavaşlatır%

    components = {
        -- üst çatı
        ["revalcati"] = {
			{ time = 2000,    params = {0, 0, 0, 0, 0, 0} }, --bekliyor
			{ time = 3000,    params = {0, -0.6, 0, 0, 0, 0} }, --geri alınıyor
			{ time = 4000,    params = {0, -1, -0.3, 0, 0, 0} }, --bagaja giriyor
			{ time = 6000,    params = {0, -1, -0.3, 0, 0, 0} }, --beklyior
        },
		--orta kısım
        ["revalcati2"] = {
            { time = 2000,    params = {0, 0, 0, 0,0,0} },  --sıfır konumu
			{ time = 4000,    params = {0, -0.1, 0.5, 100,0,0} },  --katlanıp bagaja giriyor
			{ time = 6000,    params = {0, -0.1, 0.5, 100,0,0} },  --beklyior
        },
		--arka kelebek
		["revalcati3"] = {
			{ time = 2000,    params = {0, 0, 0, 0,0,0} }, --açılıyor
			{ time = 4000,    params = {0, -0.1, -0.2, 20,0,0} }, --katlanıp bagaja giriyor
			{ time = 6000,    params = {0, -0.1, -0.2, 20,0,0} }, --beklyior
        },
        -- -- Bagaj
        ["revalbagaj"] = {
            { time = 0,    params = {0, 0, 0, 0, 0, 0}, easing = "InOutQuad" }, --açılma süresi
			{ time = 2000,    params = {0, 0.1, 0.8, 30, 0, 0}, easing = "InOutQuad" }, --açılma süresi
			{ time = 4000,    params = {0, 0.1, 0.8, 30, 0, 0}, easing = "InOutQuad" }, --bekliyor
			{ time = 6000,    params = {0, 0, 0, 0, 0, 0}, easing = "InOutQuad" }, --geri kapanıyor
        },
    }
}
--s2000
AnimationsTable[480] = {
    timeMul = 1.2, -- Animasyonu% 20 yavaşlatır%

    components = {
        ["revalcati"] = {  
            { time = 0,    params = {0, 0, 0, 0,0,0} },
            { time = 1000, params = {0, -0.2, 0.6, 60, 0, 0} },
			{ time = 2200, params = {0, -1, 1, 160, 0, 0} },
        },
        -- arka cam
        ["revalcati2"] = {
            { time = 0,    params = {0, 0, 0, 0,0,0} },
            { time = 2000,    params = {0, -0.5, -0.2, 20,0,0} },
        },
    }
}
--jaguar
AnimationsTable[410] = {
    timeMul = 1.2, -- Animasyonu% 20 yavaşlatır%

    components = {
        ["revalcati"] = {  
            { time = 0,    params = {0, 0, 0, 0,0,0} },
            { time = 1000, params = {0, -0.3, 0.6, 60, 0, 0} },
			{ time = 2200, params = {0, -0.8, -0.5, 0, 0, 0} },
        },
        -- arka cam
        ["revalcati2"] = {
            { time = 0,    params = {0, 0, 0, 0,0,0} },
            { time = 2000,    params = {0, -0.7, -0.2, 20,0,0} },
        },
    }
}

local function setAnimationTime(model, mul)
    for n, t in pairs(AnimationsTable[model].components) do
        for i, k in ipairs(t) do
            if k.time then
                k.time = k.time * mul
            end
        end
    end
end

for model, t in pairs(AnimationsTable) do
    if t.timeMul then
        setAnimationTime(model, t.timeMul)
    end
end

addCommandHandler("dp", function (cmd, name)
    local v = localPlayer.vehicle
    v:resetComponentPosition(name)
    outputChatBox(inspect({v:getComponentPosition(name)}))
end)



-- Sitemiz : https://sparrow-mta.blogspot.com/

-- Facebook : https://facebook.com/sparrowgta/
-- İnstagram : https://instagram.com/sparrowmta/
-- YouTube : https://www.youtube.com/@TurkishSparroW/

-- Discord : https://discord.gg/DzgEcvy