import UIKit

extension UIColor {
    
    class func colorWithRGB(r:CGFloat, g:CGFloat, b:CGFloat,a:CGFloat)->UIColor
    {
        return UIColor(red:r/255.0 , green: g/255.0, blue: b/255.0, alpha: a )
    }
    
}



