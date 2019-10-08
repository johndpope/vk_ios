import UIKit

class ColorThemeHelper {
    
    static func setupDark() {
        isDark = true
        background = #colorLiteral(red: 0.005808433518, green: 0.00166301534, blue: 0.262986809, alpha: 1)
        onBackground = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let primary_color = #colorLiteral(red: 0.4392291903, green: 0.1222558096, blue: 0.9621943831, alpha: 1)
        let secondary_color =  #colorLiteral(red: 0, green: 0.9903071523, blue: 0.4053229094, alpha: 1)
        onPrimary = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        onSecondary = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        shadow = #colorLiteral(red: 0, green: 0.5730010867, blue: 0.556679666, alpha: 1)
        inactiveControls = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        titleOnPrimary = #colorLiteral(red: 0, green: 0.9903071523, blue: 0.4053229094, alpha: 1)
        tabBarAlpha = 0.8
            
        primary_r = 255*primary_color.rgba.red
        primary_g = 255*primary_color.rgba.green
        primary_b = 255*primary_color.rgba.blue
        
        secondary_r = 255*secondary_color.rgba.red
        secondary_g = 255*secondary_color.rgba.green
        secondary_b = 255*secondary_color.rgba.blue
        
        primary_contrast_30 = ColorThemeHelper.primary(tint: 30)
        primary_contrast_60 = ColorThemeHelper.primary(tint: 60)
        primary_contrast_90 = ColorThemeHelper.primary(tint: 90)
        primary_contrast_120 = ColorThemeHelper.primary(tint: 120)
        primary = ColorThemeHelper.primary(alpha: 1)
        primary_soft_30 = ColorThemeHelper.primary(tint: -30)
        primary_soft_60 = ColorThemeHelper.primary(tint: -60)
        primary_soft_90 = ColorThemeHelper.primary(tint: -90)
        primary_soft_120 = ColorThemeHelper.primary(tint: -120)
        
        secondary_constrast_30 = ColorThemeHelper.secondary(tint: 30)
        secondary_constrast_60 = ColorThemeHelper.secondary(tint: 60)
        secondary_constrast_90 = ColorThemeHelper.secondary(tint: 90)
        secondary_constrast_120 = ColorThemeHelper.secondary(tint: 120)
        secondary = ColorThemeHelper.secondary(alpha: 1)
        secondary_soft_30 = ColorThemeHelper.secondary(tint: -30)
        secondary_soft_60 = ColorThemeHelper.secondary(tint: -60)
        secondary_soft_90 = ColorThemeHelper.secondary(tint: -90)
        secondary_soft_120 = ColorThemeHelper.secondary(tint: -120)
 
    }
    
    
    static func setupLight() {
        isDark = false
        background = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        onBackground = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let primary_color = #colorLiteral(red: 0.01966415159, green: 0.4033825994, blue: 0.6502324939, alpha: 1)
        let secondary_color = #colorLiteral(red: 0.7069821954, green: 0.9474993348, blue: 0.01453028899, alpha: 1)
        onPrimary = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        onSecondary = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        shadow = #colorLiteral(red: 0.1490205228, green: 0.1489917934, blue: 0.1532951891, alpha: 1)
        inactiveControls = #colorLiteral(red: 0.1490205228, green: 0.1489917934, blue: 0.1532951891, alpha: 1)
        titleOnPrimary = #colorLiteral(red: 0.06316316873, green: 0.06318188459, blue: 0.06316071004, alpha: 1)
        tabBarAlpha = 1
        
        primary_r = 255*primary_color.rgba.red
        primary_g = 255*primary_color.rgba.green
        primary_b = 255*primary_color.rgba.blue

        secondary_r = 255*secondary_color.rgba.red
        secondary_g = 255*secondary_color.rgba.green
        secondary_b = 255*secondary_color.rgba.blue

        primary_contrast_30 = ColorThemeHelper.primary(tint: -30)
        primary_contrast_60 = ColorThemeHelper.primary(tint: -60)
        primary_contrast_90 = ColorThemeHelper.primary(tint: -90)
        primary_contrast_120 = ColorThemeHelper.primary(tint: -120)
        primary = ColorThemeHelper.primary(alpha: 1)
        primary_soft_30 = ColorThemeHelper.primary(tint: 30)
        primary_soft_60 = ColorThemeHelper.primary(tint: 60)
        primary_soft_90 = ColorThemeHelper.primary(tint: 90)
        primary_soft_120 = ColorThemeHelper.primary(tint: 120)
        
        secondary_constrast_30 = ColorThemeHelper.secondary(tint: -30)
        secondary_constrast_60 = ColorThemeHelper.secondary(tint: -60)
        secondary_constrast_90 = ColorThemeHelper.secondary(tint: -90)
        secondary_constrast_120 = ColorThemeHelper.secondary(tint: -120)
        secondary = ColorThemeHelper.secondary(alpha: 1)
        secondary_soft_30 = ColorThemeHelper.secondary(tint: 30)
        secondary_soft_60 = ColorThemeHelper.secondary(tint: 60)
        secondary_soft_90 = ColorThemeHelper.secondary(tint: 90)
        secondary_soft_120 = ColorThemeHelper.secondary(tint: 120)
        
        
    }
    
    
    
    
    static var background = UIColor.white
    static var onBackground = UIColor.black
    
    static var shadow = UIColor.white
    static var primary_r: CGFloat  = 0
    static var primary_g: CGFloat  = 0
    static var primary_b: CGFloat  = 0
    
    static var secondary_r: CGFloat  = 0
    static var secondary_g: CGFloat  = 0
    static var secondary_b: CGFloat  = 0
    

    static var onPrimary = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) // #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static var titleOnPrimary = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) // #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    
    static var primary_contrast_30 = ColorThemeHelper.primary(tint: 30)
    static var primary_contrast_60 = ColorThemeHelper.primary(tint: 60)
    static var primary_contrast_90 = ColorThemeHelper.primary(tint: 90)
    static var primary_contrast_120 = ColorThemeHelper.primary(tint: 120)
    static var primary = ColorThemeHelper.primary(alpha: 1)
    static var primary_soft_30 = ColorThemeHelper.primary(tint: -30)
    static var primary_soft_60 = ColorThemeHelper.primary(tint: -60)
    static var primary_soft_90 = ColorThemeHelper.primary(tint: -90)
    static var primary_soft_120 = ColorThemeHelper.primary(tint: -120)
    
    static var onSecondary = UIColor.black
    
    static var secondary_constrast_30 = ColorThemeHelper.secondary(tint: 30)
    static var secondary_constrast_60 = ColorThemeHelper.secondary(tint: 60)
    static var secondary_constrast_90 = ColorThemeHelper.secondary(tint: 90)
    static var secondary_constrast_120 = ColorThemeHelper.secondary(tint: 120)
    static var secondary = ColorThemeHelper.secondary(alpha: 1)
    static var secondary_soft_30 = ColorThemeHelper.secondary(tint: 30)
    static var secondary_soft_60 = ColorThemeHelper.secondary(tint: 60)
    static var secondary_soft_90 = ColorThemeHelper.secondary(tint: 90)
    static var secondary_soft_120 = ColorThemeHelper.secondary(tint: 120)

    
    static let sectionHeaderAlpha: CGFloat = 0.95
    static var tabBarAlpha: CGFloat = 0.9
    static var inactiveControls = #colorLiteral(red: 0.2562765479, green: 0.2563257515, blue: 0.256270051, alpha: 1)
    
    
    
    static func primary(alpha: CGFloat) ->  UIColor {
        return  UIColor(displayP3Red: ColorThemeHelper.primary_r/255, green: ColorThemeHelper.primary_g/255, blue: ColorThemeHelper.primary_b/255, alpha: alpha)
    }
    
    static func primary(tint: CGFloat) ->  UIColor {
        return  UIColor(displayP3Red: (ColorThemeHelper.primary_r+tint)/255, green: (ColorThemeHelper.primary_g+tint)/255, blue: (ColorThemeHelper.primary_b+tint)/255, alpha: 1)
    }
  
    
    static func secondary(alpha: CGFloat) ->  UIColor {
          return  UIColor(displayP3Red: ColorThemeHelper.secondary_r/255, green: ColorThemeHelper.secondary_g/255, blue: ColorThemeHelper.secondary_b/255, alpha: alpha)
      }
      
    static func secondary(tint: CGFloat) ->  UIColor {
      return  UIColor(displayP3Red: (ColorThemeHelper.secondary_r+tint)/255, green: (ColorThemeHelper.secondary_g+tint)/255, blue: (ColorThemeHelper.secondary_b+tint)/255, alpha: 1)
    }
    
}


extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}
