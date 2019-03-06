//
//  SettingSwitchTableViewCell.swift
//  Example
//
//  Created by DongHeeKang on 04/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

protocol SettingSwitchTableViewCellDelegate: NSObjectProtocol {
    func settingSwitchTableViewCell(_ cell: SettingSwitchTableViewCell, switchUpdated isOn: Bool)
}

final class SettingSwitchTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let reuseIdentifier = "SettingSwitchTableViewCell"
    
    // MARK: - Properties
    
    var indexPath: IndexPath?
    var isSwitchOn: Bool? = nil {
        didSet {
            guard let isSwitchOn = isSwitchOn else {return}
            settingSwitch.isOn = isSwitchOn
        }
    }
    weak var delegate: SettingSwitchTableViewCellDelegate?
    
    // MARK: - UI Components
    
    private let settingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .left
        label.textColor = .darkGray
        return label
    }()
    private let settingSwitch: UISwitch = {
        let settingSwitch = UISwitch()
        settingSwitch.translatesAutoresizingMaskIntoConstraints = false
        return settingSwitch
    }()
    
    // MARK: - Con(De)structor
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setProperties()
        setSelector()
        contentView.addSubview(settingLabel)
        contentView.addSubview(settingSwitch)
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal methods
    
    func configure(with type: SettingCellType) {
        settingLabel.text = type.title
    }
    
    // MARK: - Private methods
    
    private func setProperties() {
        selectionStyle = .none
    }
    
    private func setSelector() {
        settingSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
    }
    
    // MARK: - Private selector
    
    @objc private func switchValueChanged() {
        delegate?.settingSwitchTableViewCell(self, switchUpdated: settingSwitch.isOn)
    }
    
    
}

// MARK: - Layout

extension SettingSwitchTableViewCell {
    
    private func layout() {
        settingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        settingLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        settingSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        settingSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }
    
}
