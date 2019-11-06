//
//  UIColor+Hex.swift
//
//  Created by Surjeet Singh
//  Copyright © 2017 Surjeet Singh. All rights reserved.
//

import UIKit

extension UIColor {

     convenience init(_ hexString: String) {
        var hex = hexString
        if hex.hasPrefix("#") {
            hex = String(hex.dropFirst())
        }
        
        let hexVal = Int(hex, radix: 16)!
        self.init(red:CGFloat( (hexVal & 0xFF0000) >> 16 ) / 255.0,
                  green: CGFloat( (hexVal & 0x00FF00) >> 8 ) / 255.0,
                  blue: CGFloat( (hexVal & 0x0000FF) >> 0 ) / 255.0,
                  alpha: 1.0)

    }
    
    static func getRandomColor() -> UIColor{
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
   
    var hexString:NSString {
        let colorRef = self.cgColor.components
        let red:CGFloat = colorRef![0]
        let green:CGFloat = colorRef![1]
        let blue:CGFloat = colorRef![2]
        return NSString(format: "#%02lX%02lX%02lX", lroundf(Float(red * 255)), lroundf(Float(green * 255)), lroundf(Float(blue * 255)))
    }
    
    static func gradientColorFromTwoColor(_ firstColor:UIColor, _ secondColor:UIColor, _ resultColorCount:Int) -> [UIColor] {
        var colorArray = [UIColor]()
        let red1 = firstColor.redValue, green1 = firstColor.greenValue, blue1 = firstColor.blueValue, alpha1 = firstColor.alphaValue
        let red2 = secondColor.redValue, green2 = secondColor.greenValue, blue2 = secondColor.blueValue, alpha2 = secondColor.alphaValue
        
        colorArray.append(firstColor)
        let count = CGFloat(resultColorCount-2)
        for color in 1..<resultColorCount {
            let floatI = CGFloat(color)
            let color = UIColor(red:red1+floatI*((red2-red1)/count), green:green1+floatI*((green2-green1)/count), blue:blue1+floatI*((blue2-blue1)/count), alpha:alpha1+floatI*((alpha2-alpha1)/count))
            colorArray.append(color)
        }
        colorArray.append(secondColor)
        return colorArray
    }
    
    static func gradientColorFromColors(_ firstColor:UIColor, _ secondColor:UIColor, _ index:Int, _ maxCount:Int) -> UIColor {
       let red1 = firstColor.redValue, green1 = firstColor.greenValue, blue1 = firstColor.blueValue, alpha1 = firstColor.alphaValue
        let red2 = secondColor.redValue, green2 = secondColor.greenValue, blue2 = secondColor.blueValue, alpha2 = secondColor.alphaValue

        if index == 0 {
            return firstColor
        }
        if index == maxCount-1 {
            return secondColor
        }

        let count = CGFloat(maxCount)
        let idx = CGFloat(index)
        
        let color = UIColor(red:red1+idx*((red2-red1)/count), green:green1+idx*((green2-green1)/count), blue:blue1+idx*((blue2-blue1)/count), alpha:alpha1+idx*((alpha2-alpha1)/count))
        return color
    }
    
}

extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
}

