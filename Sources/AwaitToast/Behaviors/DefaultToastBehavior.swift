//
//  DefaultToastBehavior.swift
//  AwaitToast
//
//  Created by DongHeeKang on 02/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

public final class DefaultToastBehavior: ToastBehavior {
    
    static var shared: DefaultToastBehavior = .init()
    required init() {
    }
    
    public var isTappedDismissEnabled: Bool = true
    
    public var delay: TimeInterval = 0.0
    
    public var showDurarion: TimeInterval = 0.2
    
    public var duration: TimeInterval = 3.0
    
    public var dismissDuration: TimeInterval = 0.2
    
}
