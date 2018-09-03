-- TODO: Wifi status with different icons?
-- TODO: Battery status for both batteries
-- TODO: Add all icons
Config { font = "xft:DejaVu Sans Mono:style=Regular:size=12:antialias=true:hinting=false"
       , additionalFonts = ["xft:FontAwesome:size=12"]
       , bgColor = "#282A36" -- Black
       , fgColor = "#E6E6E6" -- Bright grey
       , alpha = 255
       , position = TopSize C 100 20
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = True
       , hideOnStart = False
       , allDesktops = True
       , overrideRedirect = True
       , commands = [ Run Date "<fc=#BD93F9><fn=1>\xf017</fn></fc> %a %b %d %H:%M" "date" 60
                    , Run Memory [ "-t", "<fc=#FF79C6><fn=1>\xf16c</fn></fc> <usedratio>"
                                 , "-S", "True"
                                 , "-w", "3"
                                 , "-c", "0"] 10
                    , Run Volume "default" "Master" [ "-t", "<status> <volume>%"
                                                    , "--"
                                                    , "-O", "<fc=#FF6E67><fn=1>\xf028</fn></fc>"     -- On
                                                    , "-o", "<fc=#FF6E67><fn=1>\xf026</fn></fc>"] 10 -- Off
                    , Run BatteryP ["BAT0", "BAT1"] [ "-t", "<fc=#8DB600><fn=1>\xf240</fn></fc> <acstatus>"
                                                    , "-L", "10"
                                                    , "-H", "60"
                                                    , "--"
                                                    , "-l", "red"
                                                    , "-m", "#ff00ff"
                                                    , "-h", "#8DB600"
                                                    , "-o", "<left>% (<timeleft>)"
                                                    , "-O", "Charging <left>%"
                                                    , "-i", "Charged"
                                                    ] 50
                    , Run XMonadLog
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %XMonadLog% }{ %default:Master% | %memory% | %battery% | %date% "
}
