//
//  HomeView.swift
//  ToDo
//
//  Created by Ibbi Khan on 22/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    let name = DEFAULTS.string(forKey: "firstName") ?? "No Namew"
    @State var showActionSheet: Bool = false
    @Environment(\.managedObjectContext) var managedObjectContext
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
    }
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                TabView {

                            ViewTasks()
                                .tabItem {
                                    Image(systemName: "list.bullet.below.rectangle")
                            }
                            CategoriesTasks()
                                .tabItem {
                                    Image(systemName: "square.grid.2x2")
                            }
                }

                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .shadow(color:Color.init(UIColor.systemGray4), radius: 2, x: 0, y: 5)
                    .offset(x: geometry.size.width / 2 - 30, y: geometry.size.height - 80)
                    .onTapGesture {
                        self.showActionSheet.toggle()
                }
                .foregroundColor(TODO_PURPLE_COLOR)
            }

        }
        .sheet(isPresented: $showActionSheet) {
            AddTask(addTaskBoolean: self.$showActionSheet).environment(\.managedObjectContext, self.managedObjectContext)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
