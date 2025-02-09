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

struct EditPurchaseDateView: View, OverTopable {
    let title: String
    let choices: [Date]
    let current: Date
    @State var updatedContent: Date
    let hasTwoButtons: Bool
    @Binding var showOverTop: Bool
    var update: (Date) -> ()
    
    init(
        title: String,
        choices: [Date] = [],
        current: Date,
        hasTwoButtons: Bool = false,
        showOverTop: Binding<Bool>,
        update: @escaping (Date) -> Void
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
                // Edit content View
                DatePicker(
                    "Purchaes Date",
                    selection: $updatedContent,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                HStack {
                    if hasTwoButtons {
                        Button("Clear") {
                            withAnimation {
                                showOverTop = false
                                update(Date.distantPast)
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
    EditPurchaseDateView(
        title: "Purchase Date",
        choices: [],
        current: Date.now,
        hasTwoButtons: true,
        showOverTop: .constant(false),
        update: { update in
            // This is the action that will come from the presenting view
        }
    )
}
