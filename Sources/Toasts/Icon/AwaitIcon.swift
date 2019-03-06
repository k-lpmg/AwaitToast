//
//  AwaitIcon.swift
//  AwaitToast
//
//  Created by DongHeeKang on 02/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

extension AwaitToast {
    
    public static func icon(image: UIImage, imageLocation: IconImageLocation = .left, initialText: String, endText: String, direction: ToastDirection = .top) -> AwaitToast {
        return AwaitIcon(image: image, imageLocation: imageLocation, initialText: initialText, endText: endText, direction: direction)
    }
    
    public static func icon(image: UIImage, imageLocation: IconImageLocation = .left, initialAttributedString: NSAttributedString, endAttributedString: NSAttributedString, direction: ToastDirection = .top) -> AwaitToast {
        return AwaitIcon(image: image, imageLocation: imageLocation, initialAttributedString: initialAttributedString, endAttributedString: endAttributedString, direction: direction)
    }
    
}

final private class AwaitIcon: AwaitToastProducer<IconToastAppearance> {
    
    init(image: UIImage, imageLocation: IconImageLocation, initialText: String, endText: String, direction: ToastDirection) {
        super.init(view: AwaitIconToastView(image: image, imageLocation: imageLocation, initialText: initialText, endText: endText, direction: direction))
    }
    
    init(image: UIImage, imageLocation: IconImageLocation, initialAttributedString: NSAttributedString, endAttributedString: NSAttributedString, direction: ToastDirection) {
        super.init(view: AwaitIconToastView(image: image, imageLocation: imageLocation, initialAttributedString: initialAttributedString, endAttributedString: endAttributedString, direction: direction))
    }
    
}

