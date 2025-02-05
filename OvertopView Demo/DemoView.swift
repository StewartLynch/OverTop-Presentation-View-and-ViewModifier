//
//----------------------------------------------
// Original project: OvertopView Demo
// by  Stewart Lynch on 2025-02-05
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

struct DemoView: View {
    @State private var currentSize = "medium"
    @State private var ageRange = "10 - 15"
    var body: some View {
        NavigationStack {
            ZStack{
                Color.red.opacity(0.3)
                    .ignoresSafeArea()
                VStack {
                    Text(currentSize)
                        .padding()
                        .background(.blue, in: RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                    Text(ageRange)
                        .padding()
                        .background(.green, in: RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                    Spacer()
                    
                }
            }
            .navigationTitle("OverTopViewDemo")
        }
    }
}

#Preview {
    DemoView()
}
