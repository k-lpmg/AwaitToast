//
//  ToastBehavior.swift
//  AwaitToast
//
//  Created by DongHeeKang on 02/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

protocol ToastBehavior {
    
    static var shared: Self { get set }
    
    init()
    
    var isTappedDismissEnabled: Bool { get set }
    
    var delay: TimeInterval { get set }
    
    var showDurarion: TimeInterval { get set}
    
    var dismissDuration: TimeInterval { get set }
    
}
