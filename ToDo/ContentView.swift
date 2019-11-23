//
//  ContentView.swift
//  ToDo
//
//  Created by Ibbi Khan on 14/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContexxt
    @EnvironmentObject var settings: UserSettings
    var body: some View {
        Group {
            if settings.login {
                HomeView()
            }else{
                GetStarted()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        ContentView().environmentObject(UserSettings())
    }
}
class UserSettings: ObservableObject {
    @Published var login = DEFAULTS.bool(forKey: "login")
}
