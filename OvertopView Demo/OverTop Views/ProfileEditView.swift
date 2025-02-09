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

struct ProfileEditView: View, OverTopable {
    let title: String
    let choices: [Profile]
    let current: Profile
    @State var updatedContent: Profile
    let hasTwoButtons: Bool
    @Binding var showOverTop: Bool
    var update: (Profile) -> ()
    @FocusState var isFocused: Bool
    init(
        title: String,
        choices: [Profile] = [],
        current: Profile,
        hasTwoButtons: Bool = false,
        showOverTop: Binding<Bool>,
        update: @escaping (Profile) -> Void
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
                VStack {
                    TextField("First Name", text: $updatedContent.firstName)
                        .focused($isFocused)
                    TextField("Last Name", text: $updatedContent.lastName)
                    TextField("Email Address", text: $updatedContent.email)
                        .keyboardType(.emailAddress)
                }
                .textFieldStyle(.roundedBorder)
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
            .onAppear {
                isFocused = true
            }
        }
    }
}

#Preview {
    ProfileEditView(
        title: "Update Profile",
        choices: [],
        current: Profile.sample,
        showOverTop: .constant(false),
        update: { update in
            // This is the action that will come from the presenting view
        }
    )
}
