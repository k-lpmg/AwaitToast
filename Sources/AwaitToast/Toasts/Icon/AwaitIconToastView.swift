//
//  AwaitIconToastView.swift
//  AwaitToast
//
//  Created by DongHeeKang on 02/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

class AwaitIconToastView: AwaitToastView<IconToastAppearance> {
    
    // MARK: - Constants
    
    private enum Const {
        static let imageSize = CGSize(width: 24, height: 24)
    }
    
    // MARK: - Properties
    
    let image: UIImage?
    let imageLocation: IconImageLocation
    let initialText: String?
    let endText: String?
    let initialAttributedString: NSAttributedString?
    let endAttributedString: NSAttributedString?
    
    // MARK: - UI Components
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        imageView.contentMode = appearance.imageContentMode
        imageView.tintColor = appearance.imageTintColor
        return imageView
    }()
    lazy var initialTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = appearance.numberOfLines
        label.textAlignment = appearance.textAlignment
        label.font = appearance.textFont
        label.textColor = appearance.textColor
        return label
    }()
    lazy var endTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = appearance.numberOfLines
        label.textAlignment = appearance.textAlignment
        label.font = appearance.textFont
        label.textColor = appearance.textColor
        return label
    }()
    
    // MARK: - Con(De)structor
    
    init(image: UIImage, imageLocation: IconImageLocation, initialText: String, endText: String, direction: ToastDirection) {
        self.image = image
        self.imageLocation = imageLocation
        self.initialText = initialText
        self.endText = endText
        self.initialAttributedString = nil
        self.endAttributedString = nil
        super.init(direction: direction)
        
        commonInit()
        initialTextLabel.text = initialText
        endTextLabel.text = endText
    }
    
    init(image: UIImage, imageLocation: IconImageLocation, initialAttributedString: NSAttributedString, endAttributedString: NSAttributedString, direction: ToastDirection) {
        self.image = image
        self.imageLocation = imageLocation
        self.initialText = nil
        self.endText = nil
        self.initialAttributedString = initialAttributedString
        self.endAttributedString = endAttributedString
        super.init(direction: direction)
        
        commonInit()
        initialTextLabel.attributedText = initialAttributedString
        endTextLabel.attributedText = endAttributedString
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overridden: AwaitToastView
    
    override func finish(duration: TimeInterval, completion: (() -> Void)? = nil) {
        let imageViewFrame = imageView.frame
        let initialTextLabelFrame = initialTextLabel.frame
        initialTextLabel.removeFromSuperview()
        imageView.removeFromSuperview()
        
        imageView.translatesAutoresizingMaskIntoConstraints = true
        contentView.addSubview(imageView)
        contentView.addSubview(endTextLabel)
        
        var frame = endTextLabelFrame
        frame.origin.x = initialTextLabelFrame.origin.x
        endTextLabel.frame = frame
        imageView.frame = CGRect(x: imageViewFrame.origin.x, y: frame.origin.y, width: Const.imageSize.width, height: Const.imageSize.height)
        
        UIView.animate(withDuration: duration, animations: {
            var endTextLabelFrame = self.endTextLabel.frame
            endTextLabelFrame.origin.y = self.endTextLabelToOriginY
            self.endTextLabel.frame = endTextLabelFrame

            let imageEdgeInsets = self.appearance.imageEdgeInsets
            var imageViewFrame = self.imageView.frame
            imageViewFrame.origin.y = endTextLabelFrame.midY - Const.imageSize.height/2 + imageEdgeInsets.top - imageEdgeInsets.bottom
            self.imageView.frame = imageViewFrame
        }) { (_) in
            completion?()
        }
    }
    
    // MARK: - Internal methods
    
    func commonInit() {
        contentView.addSubview(imageView)
        contentView.addSubview(initialTextLabel)
        layout()
    }
    
}

// MARK: - Layout

extension AwaitIconToastView {
    
    private func layout() {
        let titleEdgeInsets = appearance.titleEdgeInsets
        let imageEdgeInsets = appearance.imageEdgeInsets
        
        let imageViewTopConstant = imageEdgeInsets.top - imageEdgeInsets.bottom
        imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: imageViewTopConstant).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Const.imageSize.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Const.imageSize.height).isActive = true
        
        initialTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: titleEdgeInsets.top).isActive = true
        initialTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -titleEdgeInsets.bottom).isActive = true
        
        switch imageLocation {
        case .left:
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: imageEdgeInsets.left).isActive = true
            
            let textLabelLeftConstant = titleEdgeInsets.left + imageEdgeInsets.right
            initialTextLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: textLabelLeftConstant).isActive = true
            initialTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -titleEdgeInsets.right).isActive = true
        case .right:
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -imageEdgeInsets.right).isActive = true
            
            let textLabelRightConstant = titleEdgeInsets.right + imageEdgeInsets.left
            initialTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: titleEdgeInsets.left).isActive = true
            initialTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -textLabelRightConstant).isActive = true
        }
    }
    
}
