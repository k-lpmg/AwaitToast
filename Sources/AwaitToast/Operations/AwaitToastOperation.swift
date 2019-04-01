//
//  AwaitToastOperation.swift
//  AwaitToast
//
//  Created by DongHeeKang on 02/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import Foundation

class AwaitToastOperation<A>: ToastOperation<A, AwaitToastBehavior> where A: ToastAppearance {
    
    // MARK: - Properties
    
    private var initialWorkItem: DispatchWorkItem?
    private lazy var finishWorkkItem: DispatchWorkItem = DispatchWorkItem { [weak self] in
        guard let self = self, let view = self.view as? AwaitToastView else {return}
        
        view.finish(duration: self.behavior.finishDurarion) {
            DispatchQueue.main.asyncAfter(deadline: .now() + self.behavior.dismissDelayWhenFinish, execute: {
                self.dismiss()
            })
        }
    }
    
    // MARK: - Overridden: Operation
    
    override func main() {
        initialWorkItem = DispatchWorkItem { [weak self] in
            guard let self = self else {return}
            
            self.showToast()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + behavior.delay, execute: initialWorkItem!)
    }
    
    override func cancel() {
        super.cancel()
        
        initialWorkItem?.cancel()
        dismiss()
    }
    
    // MARK: - Internal methods
    
    func finish() {
        DispatchQueue.main.async(execute: finishWorkkItem)
    }
    
}
