//
//  SvgImageProcessor.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 29/3/21.
//

import UIKit
import SVGKit
import Kingfisher


/// football-data.org only provides .svg images and Kingfisher needs a image processor to set the ImageUI using .svg.
public struct SVGImgProcessor:ImageProcessor {
    public var identifier: String = "com.appidentifier.webpprocessor"
    public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            return image
        case .data(let data):
            let imsvg = SVGKImage(data: data)
            return imsvg?.uiImage
        }
    }
}
