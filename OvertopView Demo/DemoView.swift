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
    @State private var selectSize = false
    
    @State private var ageRange = "10 - 15"
    @State private var selectAgeRange = false
    
    @State private var bgColor:Color = .red
    @State private var purchaseDate = Date.now
    @State private var profile = Profile.sample
    
    var body: some View {
        NavigationStack {
            ZStack{
                bgColor.opacity(0.3)
                    .ignoresSafeArea()
                VStack {
                    VStack{
                        Text(profile.firstName)
                        Text(profile.lastName)
                        Text(profile.email)
                    }
                    .font(.title2)
                    .padding()
                    .background(bgColor.opacity(0.2), in: RoundedRectangle(cornerRadius: 20))
                    Text(currentSize)
                        .padding()
                        .background(.blue, in: RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                        .onTapGesture {
                            withAnimation {
                                selectSize = true
                            }
                        }
                    Text(ageRange)
                        .padding()
                        .background(.green, in: RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                        .onTapGesture {
                            withAnimation {
                                selectAgeRange = true
                            }
                        }
                    LabeledContent("Purchase Date",
                        value: purchaseDate,
                        format: .dateTime.year().month().day()
                    )
                        .padding()
                        .font(.title)
                    Spacer()
                }
            }
            .navigationTitle("OverTopView Demo")
        }
        .overTop(
            showOverTop: selectSize,
            overTopView: OverTopPickerView(
                title: "Select Size",
                choices: ["extra small", "small", "medium", "large", "large tall", "extra large", "extra large tall"],
                current: currentSize,
                showOverTop: $selectSize,
                update: { update in
                    currentSize = update
                }
            )
        )
        .overTop(
            showOverTop: selectAgeRange,
            overTopView: OverTopPickerView(
                title: "Select Age Range",
                choices: ["0 - 5", "6 - 10", "11 - 20", "21 - 30", "31 - 50", "50+"],
                current: ageRange,
                hasTwoButtons: true,
                showOverTop: $selectAgeRange,
                update: { newRange in
                    ageRange = newRange
                }
            )
        )
    }
}

#Preview {
    DemoView()
}
