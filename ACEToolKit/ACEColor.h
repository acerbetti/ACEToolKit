// ACEColor.h
//
// Copyright (c) 2016 Stefano Acerbetti
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
// THE SOFTWARE.  Copyright (c) 2016 Stefano Acerbetti. All rights reserved.
//


#if TARGET_OS_IOS
#import <UIKit/UIKit.h>
#define ACEColor UIColor
typedef UIColor* ACEColorRef;
#else
#import <Cocoa/Cocoa.h>
#define ACEColor NSColor
typedef NSColor* ACEColorRef;
#endif

#define RGBCOLOR(r,g,b) [ACEColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [ACEColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

extern NSString * const ACEColorAliceBlue;
extern NSString * const ACEColorAntiqueWhite;
extern NSString * const ACEColorAqua;
extern NSString * const ACEColorAquamarine;
extern NSString * const ACEColorAzure;
extern NSString * const ACEColorBeige;
extern NSString * const ACEColorBisque;
extern NSString * const ACEColorBlack;
extern NSString * const ACEColorBlanchedAlmond;
extern NSString * const ACEColorBlue;
extern NSString * const ACEColorBlueViolet;
extern NSString * const ACEColorBrown;
extern NSString * const ACEColorBurlyWood;
extern NSString * const ACEColorCadetBlue;
extern NSString * const ACEColorChartreuse;
extern NSString * const ACEColorChocolate;
extern NSString * const ACEColorCoral;
extern NSString * const ACEColorCornflowerBlue;
extern NSString * const ACEColorCornsilk;
extern NSString * const ACEColorCrimson;
extern NSString * const ACEColorCyan;
extern NSString * const ACEColorDarkBlue;
extern NSString * const ACEColorDarkCyan;
extern NSString * const ACEColorDarkGoldenrod;
extern NSString * const ACEColorDarkGray;
extern NSString * const ACEColorDarkGreen;
extern NSString * const ACEColorDarkKhaki;
extern NSString * const ACEColorDarkMagenta;
extern NSString * const ACEColorDarkOliveGreen;
extern NSString * const ACEColorDarkOrange;
extern NSString * const ACEColorDarkOrchid;
extern NSString * const ACEColorDarkRed;
extern NSString * const ACEColorDarkSalmon;
extern NSString * const ACEColorDarkSeaGreen;
extern NSString * const ACEColorDarkSlateBlue;
extern NSString * const ACEColorDarkSlateGray;
extern NSString * const ACEColorDarkTurquoise;
extern NSString * const ACEColorDarkViolet;
extern NSString * const ACEColorDeepPink;
extern NSString * const ACEColorDeepSkyBlue;
extern NSString * const ACEColorDimGray;
extern NSString * const ACEColorDodgerBlue;
extern NSString * const ACEColorFirebrick;
extern NSString * const ACEColorFloralWhite;
extern NSString * const ACEColorForestGreen;
extern NSString * const ACEColorFuchsia;
extern NSString * const ACEColorGainsboro;
extern NSString * const ACEColorGhostWhite;
extern NSString * const ACEColorGold;
extern NSString * const ACEColorGoldenrod;
extern NSString * const ACEColorGray;
extern NSString * const ACEColorGreen;
extern NSString * const ACEColorGreenYellow;
extern NSString * const ACEColorHoneydew;
extern NSString * const ACEColorHotPink;
extern NSString * const ACEColorIndianRed;
extern NSString * const ACEColorIndigo;
extern NSString * const ACEColorIvory;
extern NSString * const ACEColorKhaki;
extern NSString * const ACEColorLavender;
extern NSString * const ACEColorLavenderBlush;
extern NSString * const ACEColorLawnGreen;
extern NSString * const ACEColorLemonChiffon;
extern NSString * const ACEColorLightBlue;
extern NSString * const ACEColorLightCoral;
extern NSString * const ACEColorLightCyan;
extern NSString * const ACEColorLightGoldenrodYellow;
extern NSString * const ACEColorLightGray;
extern NSString * const ACEColorLightGreen;
extern NSString * const ACEColorLightPink;
extern NSString * const ACEColorLightSalmon;
extern NSString * const ACEColorLightSeaGreen;
extern NSString * const ACEColorLightSkyBlue;
extern NSString * const ACEColorLightSlateGray;
extern NSString * const ACEColorLightSteelBlue;
extern NSString * const ACEColorLightYellow;
extern NSString * const ACEColorLime;
extern NSString * const ACEColorLimeGreen;
extern NSString * const ACEColorLinen;
extern NSString * const ACEColorMagenta;
extern NSString * const ACEColorMaroon;
extern NSString * const ACEColorMediumAquamarine;
extern NSString * const ACEColorMediumBlue;
extern NSString * const ACEColorMediumOrchid;
extern NSString * const ACEColorMediumPurple;
extern NSString * const ACEColorMediumSeaGreen;
extern NSString * const ACEColorMediumSlateBlue;
extern NSString * const ACEColorMediumSpringGreen;
extern NSString * const ACEColorMediumTurquoise;
extern NSString * const ACEColorMediumVioletRed;
extern NSString * const ACEColorMidnightBlue;
extern NSString * const ACEColorMintCream;
extern NSString * const ACEColorMistyRose;
extern NSString * const ACEColorMoccasin;
extern NSString * const ACEColorNavajoWhite;
extern NSString * const ACEColorNavy;
extern NSString * const ACEColorOldLace;
extern NSString * const ACEColorOlive;
extern NSString * const ACEColorOliveDrab;
extern NSString * const ACEColorOrange;
extern NSString * const ACEColorOrangeRed;
extern NSString * const ACEColorOrchid;
extern NSString * const ACEColorPaleGoldenrod;
extern NSString * const ACEColorPaleGreen;
extern NSString * const ACEColorPaleTurquoise;
extern NSString * const ACEColorPaleVioletRed;
extern NSString * const ACEColorPapayaWhip;
extern NSString * const ACEColorPeachPuff;
extern NSString * const ACEColorPeru;
extern NSString * const ACEColorPink;
extern NSString * const ACEColorPlum;
extern NSString * const ACEColorPowderBlue;
extern NSString * const ACEColorPurple;
extern NSString * const ACEColorRed;
extern NSString * const ACEColorRosyBrown;
extern NSString * const ACEColorRoyalBlue;
extern NSString * const ACEColorSaddleBrown;
extern NSString * const ACEColorSalmon;
extern NSString * const ACEColorSandyBrown;
extern NSString * const ACEColorSeaGreen;
extern NSString * const ACEColorSeaShell;
extern NSString * const ACEColorSienna;
extern NSString * const ACEColorSilver;
extern NSString * const ACEColorSkyBlue;
extern NSString * const ACEColorSlateBlue ;
extern NSString * const ACEColorSlateGray;
extern NSString * const ACEColorSnow;
extern NSString * const ACEColorSpringGreen;
extern NSString * const ACEColorSteelBlue;
extern NSString * const ACEColorTan;
extern NSString * const ACEColorTeal;
extern NSString * const ACEColorThistle;
extern NSString * const ACEColorTomato;
extern NSString * const ACEColorTransparent;
extern NSString * const ACEColorTurquoise;
extern NSString * const ACEColorViolet;
extern NSString * const ACEColorWheat;
extern NSString * const ACEColorWhite;
extern NSString * const ACEColorWhiteSmoke;
extern NSString * const ACEColorYellow;
extern NSString * const ACEColorYellowGreen;

/**
 * 'ACEColor' is a category to better manage the colors
 */
@interface ACEColor (ACEToolKit)

/** 
 * Returns a color ref from a hex value
 *
 * @return The desired color
 */
+ (ACEColorRef)colorWithHex:(int)hex;

/**
 * Returns a color ref from a hex string. Examples are provided
 *
 * @return The desired color
 */
+ (ACEColorRef)colorWithHexString:(NSString *)hexString;

@end
