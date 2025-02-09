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

struct OverTopColorPickerView: View, OverTopable {
    var title: String
    var choices: [Color]
    var current: Color
    var hasTwoButtons: Bool
    @Binding var showOverTop: Bool
    var update: (Color) -> ()

    @State var updatedContent: Color

    init(
        title: String,
        choices: [Color],
        current: Color,
        hasTwoButtons: Bool = false,
        showOverTop: Binding<Bool>,
        update: @escaping (Color) -> ()
    ) {
        self.title = title
        self.choices = choices
        self.current = current
        self.hasTwoButtons = hasTwoButtons
        self._showOverTop = showOverTop
        self._updatedContent = State(initialValue: current)
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
                // Edut content view
                VStack {
                    ForEach(choices, id: \.self) { color in
                        color
                            .frame(height: 30)
                            .overlay(alignment: .trailing) {
                                Image(systemName: color == updatedContent ? "checkmark.circle" : "circle")
                                    .padding(.trailing)
                                    .foregroundStyle(.white)
                            }
                            .onTapGesture {
                                withAnimation {
                                    updatedContent = color
                                }
                            }
                    }
                }
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
    OverTopColorPickerView(
        title: "Choose a background color",
        choices: [.red, .orange, .yellow, .green, .blue, .indigo, .purple],
        current: .red,
        showOverTop: .constant(false),
        update: { update in
            
        }
    )
}
