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
    @State private var changeBackground = false
    
    @State private var purchaseDate: Date?
    @State private var changePurchaseDate = false
    
    @State private var profile = Profile.sample
    @State private var updateProfile = false
    
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
                        Button {
                            withAnimation {
                                updateProfile = true
                            }
                        } label: {
                            Image(systemName: "pencil.circle.fill")
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .font(.title2)
                    .padding()
                    .background(bgColor.opacity(0.2), in: RoundedRectangle(cornerRadius: 20))
                    .padding()
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
                    Group {
                        if let purchaseDate {
                            LabeledContent("Purchase Date",
                                           value: purchaseDate,
                                           format: .dateTime.year().month().day()
                            )
                        } else {
                            LabeledContent("Purchase Date", value: "Not Yet")
                        }
                    }
                    .padding()
                    .font(.title)
                    .onTapGesture {
                        withAnimation {
                            changePurchaseDate = true
                        }
                    }
                    Spacer()
                }
            }
            .toolbar {
                Button {
                    withAnimation {
                        changeBackground = true
                    }
                } label: {
                    Image(systemName: "gear")
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
        .overTop(
            showOverTop: changeBackground,
            overTopView: OverTopColorPickerView(
                title: "Change Background Color",
                choices:  [.red, .orange, .yellow, .green, .blue, .indigo, .purple],
                current: bgColor,
                showOverTop: $changeBackground,
                update: { color in
                    bgColor = color
                }
            )
        )
        .overTop(
            showOverTop: updateProfile,
            overTopView: ProfileEditView(
                title: "Update Profile",
                current: profile,
                showOverTop: $updateProfile,
                update: { update in
                    profile = update
                }
            )
        )
        .overTop(
            showOverTop: changePurchaseDate,
            overTopView: EditPurchaseDateView(
                title: "Purchase Date",
                current: purchaseDate ?? Date.now,
                hasTwoButtons: true,
                showOverTop: $changePurchaseDate,
                update: { newDate in
                    if newDate == Date.distantPast {
                        purchaseDate = nil
                    } else {
                        purchaseDate = newDate
                    }
                }
            )
        )
    }
}

#Preview {
    DemoView()
}
