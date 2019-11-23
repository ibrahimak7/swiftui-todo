//
//  CreateProfile.swift
//  ToDo
//
//  Created by Ibbi Khan on 14/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct CreateProfile: View {
    @State var showPicker = false
    @State var imageToGet: UIImage? = nil
    @State var firstName = ""
    @State var lastName = ""
    @Binding var createProfile: Bool
    var didAddUser: ((String)->Void)?
    
    var body: some View {
        VStack {
            Text("Complete your profile first.")
                .padding(.top, 20)
                .font(.system(size: 20, weight: .bold, design: .rounded))
            if imageToGet == nil {
                VStack {
                    
                    Image.init(systemName: "camera.on.rectangle")
                        .foregroundColor(Color.purple)
                        .font(.system(size: 60))
                    .background(Color(red: 245/255, green: 245/255, blue: 245/255)
                        .frame(width: 160, height: 160, alignment: .center)
                        .cornerRadius(80))
                        .onTapGesture {
                                self.showPicker = true
                        }
                        .padding(.top, 60)
                    .padding(.bottom, 60)
                }
                
            }else{
                Image(uiImage: self.imageToGet!)
                .resizable()
                .scaledToFill()
                    .frame(width: 160, height: 160, alignment: .center)
                .cornerRadius(80)
            }
            VStack {
                Group {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }
                .padding(10)
                .background(Color(red: 245/255, green: 245/255, blue: 245/255))
                .cornerRadius(4)
                .font(Font.system(size: 18))
                
            }
            .padding(10)
            if self.isValid() {
                Group {
                    Button(action: {
                        print(self.firstName)
                        print(self.lastName)
                        self.createProfile = false
                        self.didAddUser?("added.")
                        
                    }) {
                        Text("Save Profile")
                        .padding(10)
                            .background(Color.blue)
                            .font(.system(size: 18))
                            .accentColor(Color.white)
                        .cornerRadius(8)
                    }
                }
            .padding()
            }
            Spacer()
        }
            
        .sheet(isPresented: $showPicker, onDismiss: {
            self.showPicker = false
        }) {
            ImagePicker(isShown: self.$showPicker, uiImage: self.$imageToGet)
        }
    }
    fileprivate func isValid()->Bool {
        if self.imageToGet == nil {
            return false
        }
        if self.firstName == "" || self.lastName == "" {
            return false
        }
        return true
    }
}

//struct CreateProfile_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CreateProfile(createProfile: true)
//    }
//}
