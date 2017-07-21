//
//  FontStyle.swift
//  Test0720
//
//  Created by 楊采庭 on 2017/7/21.
//  Copyright © 2017年 楊采庭. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func asiTextStyle23Font() -> UIFont {
        return UIFont.systemFont(ofSize: 20.0, weight: UIFontWeightHeavy)
    }
    
}

extension UIColor {
    
    class var asiBlack25: UIColor {
        return UIColor(white: 0.0, alpha: 0.25)
    }
    
}

extension UIImageView{
    func imageFrame()->CGRect{
        let imageViewSize = self.frame.size
        guard let imageSize = self.image?.size else{return CGRect.zero}
        let imageRatio = imageSize.width / imageSize.height
        let imageViewRatio = imageViewSize.width / imageViewSize.height
        if imageRatio < imageViewRatio {
            let scaleFactor = imageViewSize.height / imageSize.height
            let width = imageSize.width * scaleFactor
            let topLeftX = (imageViewSize.width - width) * 0.5
            return CGRect(x: topLeftX, y: 0, width: width, height: imageViewSize.height)
        }else{
            let scalFactor = imageViewSize.width / imageSize.width
            let height = imageSize.height * scalFactor
            let topLeftY = (imageViewSize.height - height) * 0.5
            return CGRect(x: 0, y: topLeftY, width: imageViewSize.width, height: height)
        }
    }
}
