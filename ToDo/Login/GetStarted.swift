//
//  GetStarted.swift
//  ToDo
//
//  Created by Ibbi Khan on 22/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct GetStarted: View {
    @EnvironmentObject var settings: UserSettings
    @State var createProfile: Bool = false
    
    var body: some View {
        VStack {
            Image("reminder")
            VStack(spacing: 30) {
                Text("Hello There").font(.largeTitle)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque erat in blandit luctus.").font(.body).fixedSize(horizontal: false, vertical: true)
                Button(action: {
                    self.createProfile = true
                }) {
                    Text("Get Started").fontWeight(.bold)
                    .padding(12)
                    .frame(width: 200)
                }
                .sheet(isPresented: $createProfile) {
                    CreateProfile(createProfile: self.$createProfile, didAddUser: {
                        (text) in
                        print(text)
                    })
                }
                .background(Color.green).cornerRadius(20).foregroundColor(.white)
            }
        }
        .padding(10)
    }
}

struct GetStarted_Previews: PreviewProvider {
    static var previews: some View {
        GetStarted()
    }
}
