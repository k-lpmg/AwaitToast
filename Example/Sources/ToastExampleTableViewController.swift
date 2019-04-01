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
    let longTextExample = LongTextCellType.allCases
    
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
        case .longText:
            return longTextExample.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .settings:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingSwitchTableViewCell.reuseIdentifier, for: indexPath) as! SettingSwitchTableViewCell
            cell.indexPath = indexPath
            cell.delegate = self
            cell.configure(with: settings[indexPath.row].title)
            
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
        case .longText:
            let longTextCell = LongTextCellType(rawValue: indexPath.row)!
            switch longTextCell {
            case .automaticDimension:
                let cell = tableView.dequeueReusableCell(withIdentifier: SettingSwitchTableViewCell.reuseIdentifier, for: indexPath) as! SettingSwitchTableViewCell
                cell.indexPath = indexPath
                cell.delegate = self
                cell.configure(with: longTextCell.title)
                
                cell.isSwitchOn = ToastAppearanceManager.default.height == AutomaticDimension
                return cell
            case .longTestToast:
                let cell = tableView.dequeueReusableCell(withIdentifier: ExampleTableViewCell.reuseIdentifier, for: indexPath) as! ExampleTableViewCell
                cell.configure(image: UIImage(named: "longText")!, action: "Show", target: "Default long text")
                return cell
            }
        }
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch sections[indexPath.section] {
        case .defaultExamples:
            guard let cellType = DefaultExampleCellType(rawValue: indexPath.row) else {return}
            
            switch cellType {
            case .default:
                currentToast = Toast.default(text: "Default toast", direction: direction)
                currentToast?.show()
            case .icon:
                let image = UIImage(named: "egg")!.withRenderingMode(.alwaysTemplate)
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
                let image = UIImage(named: "egg")!.withRenderingMode(.alwaysTemplate)
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
        case .longText:
            guard let cellType = LongTextCellType(rawValue: indexPath.row) else {return}
            
            switch cellType {
            case .longTestToast:
                let text = """
                This is long text line 1
                This is long text line 2
                This is long text line 3
                This is long text line 4
                This is long text line 5
                This is long text line 6
                This is long text line 7
                This is long text line 8
                This is long text line 9
                This is long text line 10
                This is long text line 11
                This is long text line 12
                This is long text line 13
                """
                currentToast = Toast.default(text: text, direction: direction)
                currentToast?.show()
            default:
                break
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
        guard let indexPath = cell.indexPath else {return}

        switch sections[indexPath.section] {
        case .settings:
            guard let type = SettingCellType(rawValue: cell.indexPath?.row ?? -1) else {return}
            
            switch type {
            case .tapToDismiss:
                ToastBehaviorManager.default.isTappedDismissEnabled = isOn
                ToastBehaviorManager.await.isTappedDismissEnabled = isOn
            case .topDirection:
                direction = isOn ? .top : .bottom
            }
        case .longText:
            guard let type = LongTextCellType(rawValue: cell.indexPath?.row ?? -1) else {return}
            
            switch type {
            case .automaticDimension:
                ToastAppearanceManager.default.height = isOn ? AutomaticDimension : 96
            default:
                break
            }
        default:
            break
        }
    }
    
}
