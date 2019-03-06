//
//  AwaitToastBehavior.swift
//  AwaitToast
//
//  Created by DongHeeKang on 03/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

public final class AwaitToastBehavior: ToastBehavior {
    
    static var shared: AwaitToastBehavior = .init()
    required init() {
    }
    
    public var isTappedDismissEnabled: Bool = true
    
    public var delay: TimeInterval = 0.0
    
    public var showDurarion: TimeInterval = 0.2
    
    public var finishDurarion: TimeInterval = 0.2
    
    public var dismissDelayWhenFinish: TimeInterval = 0.4
    
    public var dismissDuration: TimeInterval = 0.2
    
}
