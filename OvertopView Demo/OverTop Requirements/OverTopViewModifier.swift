//
//----------------------------------------------
// Original project: OvertopView Demo
// by  Stewart Lynch on 2025-02-06
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

struct OverTopViewModifier<T: OverTopable>: ViewModifier {
    let showOverTop: Bool
    let overTopView: T
    func body(content: Content) -> some View {
        ZStack{
            content
            if showOverTop {
                overTopView
                    .zIndex(1)
            }
        }
    }
}

extension View {
    func overTop<T: OverTopable>(showOverTop: Bool, overTopView: T) -> some View {
        modifier(OverTopViewModifier(showOverTop: showOverTop, overTopView: overTopView))
    }
}
