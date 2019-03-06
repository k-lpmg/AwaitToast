//
//  ToastExampleTableViewController.swift
//  Example
//
//  Created by DongHeeKang on 03/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

import AwaitToast

final class ToastExampleTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    let sections = SectionType.allCases
    let settings = SettingCellType.allCases
    let defaultExamples = DefaultExampleCellType.allCases
    let awaitExamples = AwaitExampleCellType.allCases
    
    var currentToast: Toast?
    var currentAwaitToast: AwaitToast?
    var direction: ToastDirection = .top
    
    // MARK: - Overridden: UITableViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAppearance()
        setProperties()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .settings:
            return settings.count
        case .defaultExamples:
            return defaultExamples.count
        case .awaitExamples:
            return awaitExamples.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .settings:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingSwitchTableViewCell.reuseIdentifier, for: indexPath) as! SettingSwitchTableViewCell
            cell.indexPath = indexPath
            cell.delegate = self
            cell.configure(with: settings[indexPath.row])
            
            if let setting = SettingCellType(rawValue: indexPath.row) {
                switch setting {
                case .tapToDismiss:
                    cell.isSwitchOn = ToastBehaviorManager.default.isTappedDismissEnabled && ToastBehaviorManager.await.isTappedDismissEnabled
                case .topDirection:
                    cell.isSwitchOn = direction == .top
                }
            }
            return cell
        case .defaultExamples:
            let cell = tableView.dequeueReusableCell(withIdentifier: ExampleTableViewCell.reuseIdentifier, for: indexPath) as! ExampleTableViewCell
            cell.configure(with: defaultExamples[indexPath.row] as ExampleCellType)
            return cell
        case .awaitExamples:
            let cell = tableView.dequeueReusableCell(withIdentifier: ExampleTableViewCell.reuseIdentifier, for: indexPath) as! ExampleTableViewCell
            cell.configure(with: awaitExamples[indexPath.row] as ExampleCellType)
            return cell
        }
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let image = UIImage(named: "egg")!.withRenderingMode(.alwaysTemplate)
        
        switch sections[indexPath.section] {
        case .defaultExamples:
            guard let cellType = DefaultExampleCellType(rawValue: indexPath.row) else {return}
            
            switch cellType {
            case .default:
                currentToast = Toast.default(text: "Default toast", direction: direction)
                currentToast?.show()
            case .icon:
                currentToast = Toast.icon(image: image, text: "Icon toast", direction: direction)
                currentToast?.show()
            case .dismissDefaultLatestToast:
                Toast.latestDismiss()
            case .dismissAllToast:
                Toast.dismissAll()
            }
        case .awaitExamples:
            guard let cellType = AwaitExampleCellType(rawValue: indexPath.row) else {return}
            
            switch cellType {
            case .defaultAwait:
                currentAwaitToast?.finish()
                currentAwaitToast = AwaitToast.default(initialText: "Await default toast start", endText: "Await default toast end", direction: direction)
                currentAwaitToast?.show()
            case .finishDefaultAwait:
                currentAwaitToast?.finish()
            case .iconAwait:
                currentAwaitToast?.finish()
                currentAwaitToast = AwaitToast.icon(image: image, initialText: "Await icon toast start", endText: "Await icon toast end", direction: direction)
                currentAwaitToast?.show()
            case .finishIconAwait:
                currentAwaitToast?.finish()
            case .dismissAwaitLatestToast:
                AwaitToast.latestDismiss()
            case .dismissAllToast:
                AwaitToast.dismissAll()
            }
        default:
            break
        }
    }
    
    // MARK: - Private methods
    
    private func setAppearance() {
        ToastAppearanceManager.icon.imageTintColor = .white
    }
    
    private func setProperties() {
        title = "AwaitToast"
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(SettingSwitchTableViewCell.self, forCellReuseIdentifier: SettingSwitchTableViewCell.reuseIdentifier)
        tableView.register(ExampleTableViewCell.self, forCellReuseIdentifier: ExampleTableViewCell.reuseIdentifier)
    }
    
}

// MARK: - SettingSwitchTableViewCellDelegate

extension ToastExampleTableViewController: SettingSwitchTableViewCellDelegate {
    
    func settingSwitchTableViewCell(_ cell: SettingSwitchTableViewCell, switchUpdated isOn: Bool) {
        guard let type = SettingCellType(rawValue: cell.indexPath?.row ?? -1) else {return}
        switch type {
        case .tapToDismiss:
            ToastBehaviorManager.`default`.isTappedDismissEnabled = isOn
            ToastBehaviorManager.await.isTappedDismissEnabled = isOn
        case .topDirection:
            direction = isOn ? .top : .bottom
        }
    }
    
}
