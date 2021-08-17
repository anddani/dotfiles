-- TODO: Wifi status with different icons?
-- TODO: Battery status for both batteries
-- TODO: Add all icons
Config { font = "xft:Fira Code:style=Regular:size=12:antialias=true:hinting=false"
       , additionalFonts = ["xft:Font Awesome 5 Free Solid:size=12", "xft:Font Awesome 5 Brands: size=12"]
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
                    , Run Brightness [ "-t", "<fc=#00BADD><fn=1>\xf108</fn></fc> <percent>%"
                                     , "--"
                                     , "-D", "intel_backlight" ] 50
                    , Run DiskU [("/", "<fc=#AB4642><fn=1>\xf0a0</fn></fc> <freep>%")] [ "-L", "20"
                                                                                       , "-H", "50"
                                                                                       , "-m", "1" ] 50
                    , Run Memory [ "-t", "<fc=#FF79C6><fn=1>\xf16c</fn></fc> <usedratio>"
                                 , "-S", "True"
                                 , "-w", "3"
                                 , "-c", "0" ] 10
                    , Run XMonadLog
                    , Run Battery [ "-t", "<fc=#8DB600><fn=1>\xf240</fn></fc> <acstatus>"
                                  , "-L", "10"
                                  , "-L", "10"
                                  , "-H", "60"
                                  , "-H", "60"
                                  , "--"
                                  , "--"
                                  , "-l", "red"
                                  , "-l", "red"
                                  , "-m", "#ff00ff"
                                  , "-m", "#ff00ff"
                                  , "-h", "#8DB600"
                                  , "-h", "#8DB600"
                                  , "-o", "<left>% (<timeleft>)"
                                  , "-o", "<left>% (<timeleft>)"
                                  , "-O", "Charging <left>%"
                                  , "-O", "Charging <left>%"
                                  , "-i", "Charged"] 50
                    , Run Volume "default" "Master" [ "-t", "<status> <volume>%"
                                                    , "--"
                                                    , "-O", "<fc=#FF6E67><fn=1>\xf028</fn></fc>" -- on
                                                    , "-o", "<fc=#FF6E67><fn=1>\xf026</fn></fc>" ] 10 -- off
                    , Run Kbd [("us", "US"), ("se", "SE")]
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %XMonadLog% }{ %bright% | %default:Master% | %memory% | %disku% | %battery% | %kbd% | %date% "
}
