//
//  AwaitToastView.swift
//  AwaitToast
//
//  Created by DongHeeKang on 02/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

class AwaitToastView<A>: ToastView<A> where A: ToastAppearance {
    
    var endTextLabelFrame: CGRect {
        let titleEdgeInsets = appearance.titleEdgeInsets
        
        let originY: CGFloat
        switch direction {
        case .top:
            originY = -contentView.bounds.height
        case .bottom:
            originY = contentView.bounds.height
        }
        let originX = titleEdgeInsets.left
        let width = contentView.bounds.width - titleEdgeInsets.left - titleEdgeInsets.right
        let height = contentView.bounds.height - titleEdgeInsets.top - titleEdgeInsets.bottom
        return CGRect(x: originX, y: originY, width: width, height: height)
    }
    
    var endTextLabelToOriginY: CGFloat {
        return appearance.titleEdgeInsets.top
    }
    
    func finish(duration: TimeInterval, completion: (() -> Void)? = nil) {
        toastAbstractMethod()
    }
    
}
