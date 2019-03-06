//
//  GlobalFunction.swift
//  AwaitToast
//
//  Created by DongHeeKang on 28/02/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

func toastAbstractMethod(file: StaticString = #file, line: UInt = #line) -> Swift.Never {
    toastFatalError("Abstract method", file: file, line: line)
}

func toastFatalError(_ lastMessage: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) -> Swift.Never  {
    fatalError(lastMessage(), file: file, line: line)
}
