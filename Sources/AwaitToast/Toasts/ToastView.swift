//
//  ToastView.swift
//  AwaitToast
//
//  Created by DongHeeKang on 28/02/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

class ToastView<A>: UIView where A: ToastAppearance {
    
    // MARK: - Properties
    
    let appearance: A = A.shared
    let direction: ToastDirection
    
    // MARK: - UI Components
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: - Con(De)structor
    
    init(direction: ToastDirection) {
        self.direction = direction
        super.init(frame: .zero)
        
        setProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal methods
    
    func showContent(duration: TimeInterval) {
        addSubview(contentView)
        
        contentView.frame = getContentViewFrame()
        
        UIView.animate(withDuration: duration) {
            var frame = self.contentView.frame
            frame.origin.y = self.getContentViewToOriginY()
            self.contentView.frame = frame
        }
    }
    
    // MARK: - Private methods
    
    private func setProperties() {
        backgroundColor = appearance.backgroundColor
    }
    
    private func getContentViewFrame() -> CGRect {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        
        let originY: CGFloat
        let height: CGFloat
        switch direction {
        case .top:
            originY = -appearance.height
            height = bounds.height - statusBarSize.height
        case .bottom:
            originY = appearance.height
            if #available(iOS 11.0, *) {
                height = bounds.height - safeAreaInsets.bottom
            } else {
                height = bounds.height
            }
        }
        let width = UIScreen.main.bounds.width
        return CGRect(x: 0, y: originY, width: width, height: height)
    }
    
    private func getContentViewToOriginY() -> CGFloat {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        
        let toOriginY: CGFloat
        switch direction {
        case .top:
            toOriginY = statusBarSize.height
        case .bottom:
            toOriginY = 0
        }
        return toOriginY
    }
    
}
