//
//  ToastView.swift
//  AwaitToast
//
//  Created by DongHeeKang on 28/02/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

class ToastView<A>: UIView where A: ToastAppearance {
    
    // MARK: - NSLayoutConstraints
    
    private var contentViewTop: NSLayoutConstraint?
    
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
        
        backgroundColor = appearance.backgroundColor
        addSubview(contentView)
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Layout

extension ToastView {
    
    private func layout() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        let topConstant: CGFloat
        let bottomConstant: CGFloat
        switch direction {
        case .top:
            topConstant = UIApplication.shared.statusBarFrame.size.height
            bottomConstant = 0
        case .bottom:
            topConstant = 0
            if #available(iOS 11.0, *), let window = UIApplication.shared.keyWindow {
                bottomConstant = window.safeAreaInsets.bottom
            } else {
                bottomConstant = 0
            }
        }
        contentView.topAnchor.constraint(equalTo: topAnchor, constant: topConstant).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomConstant).isActive = true
    }
    
}
