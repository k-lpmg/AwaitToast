//
//  ToastOperation.swift
//  AwaitToast
//
//  Created by DongHeeKang on 01/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import Foundation

class DefaultToastOperation<A>: ToastOperation<A, DefaultToastBehavior> where A: ToastAppearance {
    
    // MARK: - Properties
    
    private var workItem: DispatchWorkItem?
    
    // MARK: - Overridden: Operation
    
    override func main() {
        workItem = DispatchWorkItem { [weak self] in
            guard let self = self else {return}
            
            defer {
                DispatchQueue.main.asyncAfter(deadline: .now() + self.behavior.duration, execute: {
                    guard self.workItem?.isCancelled == false else {return}
                    
                    self.dismiss()
                })
            }
            
            self.showToast()
        }
        DispatchQueue.main.async(execute: workItem!)
    }
    
    override func cancel() {
        super.cancel()
        
        workItem?.cancel()
        dismiss()
    }
    
}
