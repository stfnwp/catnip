from "../common/Definitions" import Color, ColorSet
import re
import strutils

proc initForground(): ColorSet = # (..)
    result.Black   = "\e[30m"   # BK
    result.Red     = "\e[31m"   # RD
    result.Green   = "\e[32m"   # GN
    result.Yellow  = "\e[33m"   # YW
    result.Blue    = "\e[34m"   # BE
    result.Magenta = "\e[35m"   # MA
    result.Cyan    = "\e[36m"   # CN
    result.White   = "\e[37m"   # WE


proc initForgroundBright(): ColorSet = # {..}
    result.Black   = "\e[30;1m" # BK
    result.Red     = "\e[31;1m" # RD
    result.Green   = "\e[32;1m" # GN
    result.Yellow  = "\e[33;1m" # YW
    result.Blue    = "\e[34;1m" # BE
    result.Magenta = "\e[35;1m" # MA
    result.Cyan    = "\e[36;1m" # CN
    result.White   = "\e[37;1m" # WE

proc initBackground(): ColorSet = # [..]
    result.Black   = "\e[40m"   # BK
    result.Red     = "\e[41m"   # RD
    result.Green   = "\e[42m"   # GN
    result.Yellow  = "\e[43m"   # YW
    result.Blue    = "\e[44m"   # BE
    result.Magenta = "\e[45m"   # MA
    result.Cyan    = "\e[46m"   # CN
    result.White   = "\e[47m"   # WE

proc initBackgroundBright(): ColorSet = # <..>
    result.Black   = "\e[40;1m" # BK
    result.Red     = "\e[41;1m" # RD
    result.Green   = "\e[42;1m" # GN
    result.Yellow  = "\e[43;1m" # YW
    result.Blue    = "\e[44;1m" # BE
    result.Magenta = "\e[45;1m" # MA
    result.Cyan    = "\e[46;1m" # CN
    result.White   = "\e[47;1m" # WE

const Forground*:        ColorSet = initForground()
const ForgroundBright*:  ColorSet = initForgroundBright()
const Background*:       ColorSet = initBackground()
const BackgroundBright*: ColorSet = initBackgroundBright()

const Default*: Color = "\e[0m" # !DT!

proc Colorize*(s: string): string =
    result = s
        .replace("(BK)", Forground.Black)
        .replace("(RD)", Forground.Red)
        .replace("(GN)", Forground.Green)
        .replace("(YW)", Forground.Yellow)
        .replace("(BE)", Forground.Blue)
        .replace("(MA)", Forground.Magenta)
        .replace("(CN)", Forground.Cyan)
        .replace("(WE)", Forground.White)
    
    result = result
        .replace("{BK}", ForgroundBright.Black)
        .replace("{RD}", ForgroundBright.Red)
        .replace("{GN}", ForgroundBright.Green)
        .replace("{YW}", ForgroundBright.Yellow)
        .replace("{BE}", ForgroundBright.Blue)
        .replace("{MA}", ForgroundBright.Magenta)
        .replace("{CN}", ForgroundBright.Cyan)
        .replace("{WE}", ForgroundBright.White)

    result = result
        .replace("[BK]", Background.Black)
        .replace("[RD]", Background.Red)
        .replace("[GN]", Background.Green)
        .replace("[YW]", Background.Yellow)
        .replace("[BE]", Background.Blue)
        .replace("[MA]", Background.Magenta)
        .replace("[CN]", Background.Cyan)
        .replace("[WE]", Background.White)

    result = result
        .replace("<BK>", BackgroundBright.Black)
        .replace("<RD>", BackgroundBright.Red)
        .replace("<GN>", BackgroundBright.Green)
        .replace("<YW>", BackgroundBright.Yellow)
        .replace("<BE>", BackgroundBright.Blue)
        .replace("<MA>", BackgroundBright.Magenta)
        .replace("<CN>", BackgroundBright.Cyan)
        .replace("<WE>", BackgroundBright.White)

    result = result.replace("!DT!", Default)
    
proc Uncolorize*(s: string): string =
    result = re.replace(s, re"\e(?:[@-Z\\-_]|\[[0-?]*[ -/]*[@-~])", "")

proc Reset*() =
    stdout.write(Default)