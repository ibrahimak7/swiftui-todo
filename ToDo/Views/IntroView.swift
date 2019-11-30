//
//  IntroView.swift
//  ToDo
//
//  Created by Ibbi Khan on 30/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
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

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
