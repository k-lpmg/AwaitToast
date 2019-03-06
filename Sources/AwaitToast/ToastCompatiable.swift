//
//  ToastCompatiable.swift
//  AwaitToast
//
//  Created by DongHeeKang on 28/02/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

protocol ToastCompatiable {
    static var operationQueue: OperationQueue { get set }
    func show()
    func dismiss()
}
