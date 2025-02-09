//
//----------------------------------------------
// Original project: OvertopView Demo
// by  Stewart Lynch on 2025-02-08
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2025 CreaTECH Solutions. All rights reserved.


import SwiftUI

protocol OverTopable: View {
    associatedtype T
    var title: String { get }
    var choices: [T] { get }
    var current: T { get }
    var hasTwoButtons: Bool { get }
    var showOverTop: Bool { get set }
    var updatedContent: T { get set}
    var update: (T) -> () { get }
    
    init (
        title: String,
        choices: [T],
        current: T,
        hasTwoButtons: Bool,
        showOverTop: Binding<Bool>,
        update: @escaping (T) -> ()
    )
    
}
