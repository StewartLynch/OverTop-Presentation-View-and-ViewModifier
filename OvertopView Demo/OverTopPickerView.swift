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

struct OverTopPickerView: View {
    let title: String
    let choices: [String]
    let current: String
    @State var updatedContent: String
    let hasTwoButtons: Bool
    @Binding var showOverTop: Bool
    var update: (String) -> ()
    
    init(
        title: String,
        choices: [String],
        current: String,
        hasTwoButtons: Bool = false,
        showOverTop: Binding<Bool>,
        update: @escaping (String) -> Void
    ) {
        self.title = title
        self.choices = choices
        self.current = current
        self._updatedContent = State(initialValue: current)
        self.hasTwoButtons = hasTwoButtons
        self._showOverTop = showOverTop
        self.update = update
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground).opacity(showOverTop ? 0.4 : 1)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        showOverTop = false
                    }
                }
            VStack {
                Text(title)
                    .font(.title2)
                Picker("Make Selection", selection: $updatedContent) {
                    ForEach(choices, id: \.self) { choice in
                        Text(choice)
                    }
                }
                .pickerStyle(.wheel)
                HStack {
                    if hasTwoButtons {
                        Button("Cancel") {
                            withAnimation {
                                showOverTop = false
                            }
                        }
                        .buttonStyle(.bordered)
                    }
                    Button("Save") {
                        withAnimation {
                            showOverTop = false
                            update(updatedContent)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()
            .frame(width: 300)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
            )
            .offset(y: -100)
        }
    }
}

#Preview {
    OverTopPickerView(
        title: "Select Size",
        choices: ["extra small", "small", "medium", "large", "large tall", "extra large", "extra large tall"],
        current: "medium",
        hasTwoButtons: true,
        showOverTop: .constant(false),
        update: { update in
            print(update)
        }
    )
}
