//
//  ViewTasks.swift
//  ToDo
//
//  Created by Ibbi Khan on 23/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct ViewTasks: View {
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
        
        UITableView.appearance().backgroundColor = UIColor(red: 249/255, green: 252/255, blue: 255/255, alpha: 1)
        UITableViewCell.appearance().backgroundColor = UIColor(red: 249/255, green: 252/255, blue: 255/255, alpha: 1)
    }
    var body: some View {
        ZStack
            {
                TODO_BG_COLOR
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Hello Linda")
                                .font(.headline)
                            Text("You have 8 tasks today.")
                        }
                        Spacer()
                        Image(uiImage: self.getImage())
                            .resizable()
                            .frame(width: 60, height: 60, alignment: .center)
                            .scaledToFill()
                            .cornerRadius(30)
                    }
                    .padding()
                    List {
                        TaskViewRow()
                    }
                }
                
        }
    }
    fileprivate func getImage()->UIImage {
        let imageData = DEFAULTS.data(forKey: "displayImage")
        if let imageData = imageData {
            let image = UIImage(data: imageData)
            if let image = image {
                return image
            }
        }
        return UIImage(named: "default") ?? UIImage()
    }
}

struct ViewTasks_Previews: PreviewProvider {
    static var previews: some View {
        ViewTasks()
    }
}
