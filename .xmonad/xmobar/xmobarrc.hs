-- TODO: Wifi status with different icons?
-- TODO: Battery status for both batteries
-- TODO: Add all icons
Config { font = "xft:Fira Code Retina:style=Regular:size=12:antialias=true:hinting=false"
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
                    , Run Memory [ "-t", "<fc=#FF79C6><fn=1>\xf16c</fn></fc> <usedratio>"
                                 , "-S", "True"
                                 , "-w", "3"
                                 , "-c", "0" ] 10
                    , Run XMonadLog
                    , Run Kbd [("us", "US"), ("se", "SE")]
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %XMonadLog% }{ %bright% | %default:Master% | %memory% | %disku% | %battery% | %kbd% | %date% "
}
