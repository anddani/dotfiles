Config { font = "xft:DejaVu Sans Mono:style=Regular:pixelsize=12:antialias=true:hinting=false"
       , additionalFonts = ["xft:Siji:style=Regular:size=9", "xft:FuraCode Nerd Font:style=Thin:size=7"]
       , bgColor = "#282A36" -- Black
       , fgColor = "#E6E6E6" -- Bright grey
       , alpha = 255
       , position = TopSize C 100 32
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = True
       , hideOnStart = False
       , allDesktops = True
       , overrideRedirect = True
       , commands = [ Run Cpu ["-t", "<fc=#8BE9FD><fn=1>\xe0c2</fn></fc> <total>", "-L","3","-H","50",
                               "--high","#FF5555", "-S", "True", "-w", "3",
                               "-c", "0"] 10
                    , Run Memory [ "-t","<fc=#FF79C6><fn=1>\xe0c5</fn></fc> <usedratio>",
                      "-S", "True", "-w", "3", "-c", "0"] 10
                    , Run Volume "default" "Master" ["-t", "<status> <volume>%"
                        , "--", "-O", "<fc=#FF6E67><fn=1>\xe05d</fn></fc>"
                        , "-o", "<fc=#FF6E67><fn=1>\xe052</fn></fc>"] 10
                    , Run Date "<fc=#BD93F9><fn=1>\xe016</fn></fc> %a %b %d %H:%M" "date" 60
                    , Run XMonadLog
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "  %XMonadLog% }{ %default:Master%    %cpu%    %memory%    %date%   "
}
