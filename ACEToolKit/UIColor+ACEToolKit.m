// UIColor+ACEToolKit.m
//
// Copyright (c) 2013 Stefano Acerbetti
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "ACEToolKit.h"

NSString * const AliceBlue = @"0xFFF0F8FF";
NSString * const AntiqueWhite = @"0xFFFAEBD7";
NSString * const Aqua = @"0xFF00FFFF";
NSString * const Aquamarine = @"0xFF7FFFD4";
NSString * const Azure = @"0xFFF0FFFF";
NSString * const Beige = @"0xFFF5F5DC";
NSString * const Bisque = @"0xFFFFE4C4";
NSString * const Black = @"0xFF000000";
NSString * const BlanchedAlmond = @"0xFFFFEBCD";
NSString * const Blue = @"0xFF0000FF";
NSString * const BlueViolet = @"0xFF8A2BE2";
NSString * const Brown = @"0xFFA52A2A";
NSString * const BurlyWood = @"0xFFDEB887";
NSString * const CadetBlue = @"0xFF5F9EA0";
NSString * const Chartreuse = @"0xFF7FFF00";
NSString * const Chocolate = @"0xFFD2691E";
NSString * const Coral = @"0xFFFF7F50";
NSString * const CornflowerBlue = @"0xFF6495ED";
NSString * const Cornsilk = @"0xFFFFF8DC";
NSString * const Crimson = @"0xFFDC143C";
NSString * const Cyan = @"0xFF00FFFF";
NSString * const DarkBlue = @"0xFF00008B";
NSString * const DarkCyan = @"0xFF008B8B";
NSString * const DarkGoldenrod = @"0xFFB8860B";
NSString * const DarkGray = @"0xFFA9A9A9";
NSString * const DarkGreen = @"0xFF006400";
NSString * const DarkKhaki = @"0xFFBDB76B";
NSString * const DarkMagenta = @"0xFF8B008B";
NSString * const DarkOliveGreen = @"0xFF556B2F";
NSString * const DarkOrange = @"0xFFFF8C00";
NSString * const DarkOrchid = @"0xFF9932CC";
NSString * const DarkRed = @"0xFF8B0000";
NSString * const DarkSalmon = @"0xFFE9967A";
NSString * const DarkSeaGreen = @"0xFF8FBC8F";
NSString * const DarkSlateBlue = @"0xFF483D8B";
NSString * const DarkSlateGray = @"0xFF2F4F4F";
NSString * const DarkTurquoise = @"0xFF00CED1";
NSString * const DarkViolet = @"0xFF9400D3";
NSString * const DeepPink = @"0xFFFF1493";
NSString * const DeepSkyBlue = @"0xFF00BFFF";
NSString * const DimGray = @"0xFF696969";
NSString * const DodgerBlue = @"0xFF1E90FF";
NSString * const Firebrick = @"0xFFB22222";
NSString * const FloralWhite = @"0xFFFFFAF0";
NSString * const ForestGreen = @"0xFF228B22";
NSString * const Fuchsia = @"0xFFFF00FF";
NSString * const Gainsboro = @"0xFFDCDCDC";
NSString * const GhostWhite = @"0xFFF8F8FF";
NSString * const Gold = @"0xFFFFD700";
NSString * const Goldenrod = @"0xFFDAA520";
NSString * const Gray = @"0xFF808080";
NSString * const Green = @"0xFF008000";
NSString * const GreenYellow = @"0xFFADFF2F";
NSString * const Honeydew = @"0xFFF0FFF0";
NSString * const HotPink = @"0xFFFF69B4";
NSString * const IndianRed = @"0xFFCD5C5C";
NSString * const Indigo = @"0xFF4B0082";
NSString * const Ivory = @"0xFFFFFFF0";
NSString * const Khaki = @"0xFFF0E68C";
NSString * const Lavender = @"0xFFE6E6FA";
NSString * const LavenderBlush = @"0xFFFFF0F5";
NSString * const LawnGreen = @"0xFF7CFC00";
NSString * const LemonChiffon = @"0xFFFFFACD";
NSString * const LightBlue = @"0xFFADD8E6";
NSString * const LightCoral = @"0xFFF08080";
NSString * const LightCyan = @"0xFFE0FFFF";
NSString * const LightGoldenrodYellow = @"0xFFFAFAD2";
NSString * const LightGray = @"0xFFD3D3D3";
NSString * const LightGreen = @"0xFF90EE90";
NSString * const LightPink = @"0xFFFFB6C1";
NSString * const LightSalmon = @"0xFFFFA07A";
NSString * const LightSeaGreen = @"0xFF20B2AA";
NSString * const LightSkyBlue = @"0xFF87CEFA";
NSString * const LightSlateGray = @"0xFF778899";
NSString * const LightSteelBlue = @"0xFFB0C4DE";
NSString * const LightYellow = @"0xFFFFFFE0";
NSString * const Lime = @"0xFF00FF00";
NSString * const LimeGreen = @"0xFF32CD32";
NSString * const Linen = @"0xFFFAF0E6";
NSString * const Magenta = @"0xFFFF00FF";
NSString * const Maroon = @"0xFF800000";
NSString * const MediumAquamarine = @"0xFF66CDAA";
NSString * const MediumBlue = @"0xFF0000CD";
NSString * const MediumOrchid = @"0xFFBA55D3";
NSString * const MediumPurple = @"0xFF9370DB";
NSString * const MediumSeaGreen = @"0xFF3CB371";
NSString * const MediumSlateBlue = @"0xFF7B68EE";
NSString * const MediumSpringGreen = @"0xFF00FA9A";
NSString * const MediumTurquoise = @"0xFF48D1CC";
NSString * const MediumVioletRed = @"0xFFC71585";
NSString * const MidnightBlue = @"0xFF191970";
NSString * const MintCream = @"0xFFF5FFFA";
NSString * const MistyRose = @"0xFFFFE4E1";
NSString * const Moccasin = @"0xFFFFE4B5";
NSString * const NavajoWhite = @"0xFFFFDEAD";
NSString * const Navy = @"0xFF000080";
NSString * const OldLace = @"0xFFFDF5E6";
NSString * const Olive = @"0xFF808000";
NSString * const OliveDrab = @"0xFF6B8E23";
NSString * const Orange = @"0xFFFFA500";
NSString * const OrangeRed = @"0xFFFF4500";
NSString * const Orchid = @"0xFFDA70D6";
NSString * const PaleGoldenrod = @"0xFFEEE8AA";
NSString * const PaleGreen = @"0xFF98FB98";
NSString * const PaleTurquoise = @"0xFFAFEEEE";
NSString * const PaleVioletRed = @"0xFFDB7093";
NSString * const PapayaWhip = @"0xFFFFEFD5";
NSString * const PeachPuff = @"0xFFFFDAB9";
NSString * const Peru = @"0xFFCD853F";
NSString * const Pink = @"0xFFFFC0CB";
NSString * const Plum = @"0xFFDDA0DD";
NSString * const PowderBlue = @"0xFFB0E0E6";
NSString * const Purple = @"0xFF800080";
NSString * const Red = @"0xFFFF0000";
NSString * const RosyBrown = @"0xFFBC8F8F";
NSString * const RoyalBlue = @"0xFF4169E1";
NSString * const SaddleBrown = @"0xFF8B4513";
NSString * const Salmon = @"0xFFFA8072";
NSString * const SandyBrown = @"0xFFF4A460";
NSString * const SeaGreen = @"0xFF2E8B57";
NSString * const SeaShell = @"0xFFFFF5EE";
NSString * const Sienna = @"0xFFA0522D";
NSString * const Silver = @"0xFFC0C0C0";
NSString * const SkyBlue = @"0xFF87CEEB";
NSString * const SlateBlue = @"0xFF6A5ACD";
NSString * const SlateGray = @"0xFF708090";
NSString * const Snow = @"0xFFFFFAFA";
NSString * const SpringGreen = @"0xFF00FF7F";
NSString * const SteelBlue = @"0xFF4682B4";
NSString * const Tan = @"0xFFD2B48C";
NSString * const Teal = @"0xFF008080";
NSString * const Thistle = @"0xFFD8BFD8";
NSString * const Tomato = @"0xFFFF6347";
NSString * const Transparent = @"0x00FFFFFF";
NSString * const Turquoise = @"0xFF40E0D0";
NSString * const Violet = @"0xFFEE82EE";
NSString * const Wheat = @"0xFFF5DEB3";
NSString * const White = @"0xFFFFFFFF";
NSString * const WhiteSmoke = @"0xFFF5F5F5";
NSString * const Yellow = @"0xFFFFFF00";
NSString * const YellowGreen = @"0xFF9ACD32";


CGFloat colorComponentFrom(NSString *string, NSUInteger start, NSUInteger length)
{
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

#pragma mark -

@implementation UIColor (ACEToolKit)

+ (UIColor *)colorWithHex:(int)hex
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0 alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    CGFloat alpha, red, blue, green;
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = colorComponentFrom(colorString, 0, 1);
            green = colorComponentFrom(colorString, 1, 1);
            blue  = colorComponentFrom(colorString, 2, 1);
            break;
            
        case 4: // #ARGB
            alpha = colorComponentFrom(colorString, 0, 1);
            red   = colorComponentFrom(colorString, 1, 1);
            green = colorComponentFrom(colorString, 2, 1);
            blue  = colorComponentFrom(colorString, 3, 1);
            break;
            
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = colorComponentFrom(colorString, 0, 2);
            green = colorComponentFrom(colorString, 2, 2);
            blue  = colorComponentFrom(colorString, 4, 2);
            break;
            
        case 8: // #AARRGGBB
            alpha = colorComponentFrom(colorString, 0, 2);
            red   = colorComponentFrom(colorString, 2, 2);
            green = colorComponentFrom(colorString, 4, 2);
            blue  = colorComponentFrom(colorString, 6, 2);
            break;
            
        default:
            return nil;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
