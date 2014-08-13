// UIColor+ACEToolKit.h
//
// Copyright (c) 2014 Stefano Acerbetti
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

#import <UIKit/UIKit.h>

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

extern NSString * const AliceBlue;
extern NSString * const AntiqueWhite;
extern NSString * const Aqua;
extern NSString * const Aquamarine;
extern NSString * const Azure;
extern NSString * const Beige;
extern NSString * const Bisque;
extern NSString * const Black;
extern NSString * const BlanchedAlmond;
extern NSString * const Blue;
extern NSString * const BlueViolet;
extern NSString * const Brown;
extern NSString * const BurlyWood;
extern NSString * const CadetBlue;
extern NSString * const Chartreuse;
extern NSString * const Chocolate;
extern NSString * const Coral;
extern NSString * const CornflowerBlue;
extern NSString * const Cornsilk;
extern NSString * const Crimson;
extern NSString * const Cyan;
extern NSString * const DarkBlue;
extern NSString * const DarkCyan;
extern NSString * const DarkGoldenrod;
extern NSString * const DarkGray;
extern NSString * const DarkGreen;
extern NSString * const DarkKhaki;
extern NSString * const DarkMagenta;
extern NSString * const DarkOliveGreen;
extern NSString * const DarkOrange;
extern NSString * const DarkOrchid;
extern NSString * const DarkRed;
extern NSString * const DarkSalmon;
extern NSString * const DarkSeaGreen;
extern NSString * const DarkSlateBlue;
extern NSString * const DarkSlateGray;
extern NSString * const DarkTurquoise;
extern NSString * const DarkViolet;
extern NSString * const DeepPink;
extern NSString * const DeepSkyBlue;
extern NSString * const DimGray;
extern NSString * const DodgerBlue;
extern NSString * const Firebrick;
extern NSString * const FloralWhite;
extern NSString * const ForestGreen;
extern NSString * const Fuchsia;
extern NSString * const Gainsboro;
extern NSString * const GhostWhite;
extern NSString * const Gold;
extern NSString * const Goldenrod;
extern NSString * const Gray;
extern NSString * const Green;
extern NSString * const GreenYellow;
extern NSString * const Honeydew;
extern NSString * const HotPink;
extern NSString * const IndianRed;
extern NSString * const Indigo;
extern NSString * const Ivory;
extern NSString * const Khaki;
extern NSString * const Lavender;
extern NSString * const LavenderBlush;
extern NSString * const LawnGreen;
extern NSString * const LemonChiffon;
extern NSString * const LightBlue;
extern NSString * const LightCoral;
extern NSString * const LightCyan;
extern NSString * const LightGoldenrodYellow;
extern NSString * const LightGray;
extern NSString * const LightGreen;
extern NSString * const LightPink;
extern NSString * const LightSalmon;
extern NSString * const LightSeaGreen;
extern NSString * const LightSkyBlue;
extern NSString * const LightSlateGray;
extern NSString * const LightSteelBlue;
extern NSString * const LightYellow;
extern NSString * const Lime;
extern NSString * const LimeGreen;
extern NSString * const Linen;
extern NSString * const Magenta;
extern NSString * const Maroon;
extern NSString * const MediumAquamarine;
extern NSString * const MediumBlue;
extern NSString * const MediumOrchid;
extern NSString * const MediumPurple;
extern NSString * const MediumSeaGreen;
extern NSString * const MediumSlateBlue;
extern NSString * const MediumSpringGreen;
extern NSString * const MediumTurquoise;
extern NSString * const MediumVioletRed;
extern NSString * const MidnightBlue;
extern NSString * const MintCream;
extern NSString * const MistyRose;
extern NSString * const Moccasin;
extern NSString * const NavajoWhite;
extern NSString * const Navy;
extern NSString * const OldLace;
extern NSString * const Olive;
extern NSString * const OliveDrab;
extern NSString * const Orange;
extern NSString * const OrangeRed;
extern NSString * const Orchid;
extern NSString * const PaleGoldenrod;
extern NSString * const PaleGreen;
extern NSString * const PaleTurquoise;
extern NSString * const PaleVioletRed;
extern NSString * const PapayaWhip;
extern NSString * const PeachPuff;
extern NSString * const Peru;
extern NSString * const Pink;
extern NSString * const Plum;
extern NSString * const PowderBlue;
extern NSString * const Purple;
extern NSString * const Red;
extern NSString * const RosyBrown;
extern NSString * const RoyalBlue;
extern NSString * const SaddleBrown;
extern NSString * const Salmon;
extern NSString * const SandyBrown;
extern NSString * const SeaGreen;
extern NSString * const SeaShell;
extern NSString * const Sienna;
extern NSString * const Silver;
extern NSString * const SkyBlue;
extern NSString * const SlateBlue ;
extern NSString * const SlateGray;
extern NSString * const Snow;
extern NSString * const SpringGreen;
extern NSString * const SteelBlue;
extern NSString * const Tan;
extern NSString * const Teal;
extern NSString * const Thistle;
extern NSString * const Tomato;
extern NSString * const Transparent;
extern NSString * const Turquoise;
extern NSString * const Violet;
extern NSString * const Wheat;
extern NSString * const White;
extern NSString * const WhiteSmoke;
extern NSString * const Yellow;
extern NSString * const YellowGreen;

@interface UIColor (ACEToolKit)

+ (UIColor *)colorWithHex:(int)hex;
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
