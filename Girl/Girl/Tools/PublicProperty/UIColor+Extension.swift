import UIKit
import Foundation

extension UIColor {
    
    /** 生成随机颜色*/
    class func randomColor() -> UIColor {
        
        return UIColor(red: randomValue(), green: randomValue(), blue: randomValue(), alpha: 1.0)
    }
    /** 生成随机数*/
    private class func randomValue() ->CGFloat {
        // 为什么 255，0~254，256 0~255
        return CGFloat(arc4random_uniform(256)) / 255
    }

    /** RGB*/
    class func colorWithRGB(r:CGFloat, g:CGFloat, b:CGFloat,a:CGFloat)->UIColor
    {
        return UIColor(red:r/255.0 , green: g/255.0, blue: b/255.0, alpha: a )
    }
    
}



