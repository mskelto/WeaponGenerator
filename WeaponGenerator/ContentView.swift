//
//  ContentView.swift
//  WeaponGenerator
//
//  Created by Marshall Skelton on 2/10/20.
//  Copyright © 2020 Marshall Skelton. All rights reserved.
//

import SwiftUI
import Firebase

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: AddWeapon()) {
                HStack {
                    Text("Add New Weapon")
                }
            }
            .navigationBarTitle(Text("Weapon Generator"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
