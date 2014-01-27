if display.pixelHeight > 960 then -- for device with longer height e.g. iPhone 5 and most Android Devices.
    application = {
        content = {
            width = 1136,
            height = 640,
            scale = "zoomEven ", -- Stretch to fit entire screen. This will cause some objects to look flat or stretched.
            fps = 30,              -- But I advice to use this scale since some app stores rejects apps that will not display
            antialias = "true",    -- all objects properly.
        },
        imageSuffix = {
            ["@2x"] = 2,           -- For iPhone retina display. Apple requires that all apps support retina display.
        },
    }
else -- for devices with shorter height e.g. iPhone 4, 3GS, iPad, some Android phones.
    application = {
        content = {
            width = 960,
            height = 640,
            scale = "zoomEven ",
            fps = 30,
            antialias = "true",
        },
        imageSuffix = {
            ["@2x"] = 2,
        },
    }
end


-- application = {
--     content = {
--         width = 960,
--         height = 640, 
--         scale = "letterBox",
--         fps = 30,
        
        
--         imageSuffix = {
--             ["@2x"] = 2,
--         }
        
--     },

    --[[
    -- Push notifications

    notification =
    {
        iphone =
        {
            types =
            {
                "badge", "sound", "alert", "newsstand"
            }
        }
    }
    --]]    
-- }
