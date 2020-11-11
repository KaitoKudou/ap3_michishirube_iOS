//
//  UIImage+Extension.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/11/11.
//

import UIKit

extension UIImage {
    // 画像のサイズを変更する
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        return UIGraphicsImageRenderer(size: canvas, format: imageRendererFormat).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
}
