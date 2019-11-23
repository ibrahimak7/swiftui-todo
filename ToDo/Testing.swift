//
//  Testing.swift
//  ToDo
//
//  Created by Ibbi Khan on 22/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct Testing: View {
    @ObservedObject var settings = UserSetting()

    var body: some View {
        VStack {
            Text("Your score is \(settings.score)")
            Button(action: {
                self.settings.score += 1
            }) {
                Text("Increase Score")
            }
        }
    }
}
struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        Testing()
    }
}
class UserSetting: ObservableObject {
    @Published var score = 0
}
