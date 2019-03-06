//
//  Icon.swift
//  AwaitToast
//
//  Created by DongHeeKang on 28/02/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

extension Toast {
    
    public static func icon(image: UIImage, imageLocation: IconImageLocation = .left, text: String, direction: ToastDirection = .top) -> Toast {
        return Icon(image: image, imageLocation: imageLocation, text: text, direction: direction)
    }
    
    public static func icon(image: UIImage, imageLocation: IconImageLocation = .left, attributedString: NSAttributedString, direction: ToastDirection = .top) -> Toast {
        return Icon(image: image, imageLocation: imageLocation, attributedString: attributedString, direction: direction)
    }
    
}

final private class Icon: DefaultToastProducer<IconToastAppearance> {
    
    init(image: UIImage, imageLocation: IconImageLocation, text: String, direction: ToastDirection) {
        super.init(view: IconToastView(image: image, imageLocation: imageLocation, text: text, direction: direction))
    }
    
    init(image: UIImage, imageLocation: IconImageLocation, attributedString: NSAttributedString, direction: ToastDirection) {
        super.init(view: IconToastView(image: image, imageLocation: imageLocation, attributedString: attributedString, direction: direction))
    }
    
}
