//
//  ContentView.swift
//  WeaponGenerator
//
//  Created by Marshall Skelton on 2/10/20.
//  Copyright © 2020 Marshall Skelton. All rights reserved.
//

import SwiftUI
import Firebase
var Weapons: [Weapon] = []

struct ContentView: View {
    let globalWeaponList: [Weapon] = readWeaponData()
    var body: some View {
            //VStack {
        NavigationView {
            NavigationLink(destination: AddWeapon(), label: {
                Text("Add New Weapon")
            })
            List {
                Text(globalWeaponList.first?.weaponNameString() ?? "")
//                ForEach(globalWeaponList) {
//                    weaponObject in
//                    NavigationLink(destination : WeaponRow(weapon: weaponObject)) {
//
//                        Text("Weapon Row Area")
//                    }
//                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
func readWeaponData() -> [Weapon] {
    var items = [Weapon]()
    ref.child("weapon-generator-2ed08").child("Weapon").observe(DataEventType.value) { (snapshot) in
        for child in snapshot.children.allObjects as! [DataSnapshot] {
            var weapon: Weapon
            let jsonDecoder = JSONDecoder()
            do {
                try weapon = jsonDecoder.decode(Weapon.self, from: child.value as! Data)
                items.append(weapon)
            } catch {
                //do nothing
            }
            
        }
    }
    return items
}
