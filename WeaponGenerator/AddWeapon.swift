//
//  AddWeapon.swift
//  WeaponGenerator
//
//  Created by Marshall Skelton on 2/10/20.
//  Copyright © 2020 Marshall Skelton. All rights reserved.
//

import SwiftUI
import Combine
import Firebase
var ref: DatabaseReference!

struct AddWeapon: View {
    @State var weaponName: String = ""
    @State var hitModifiers: String = ""
    @State var numHitModifiers: String = ""
    var body: some View {
        VStack {
            Text("Weapon Details")
                .font(.title)
            HStack {
                Text("Weapon Name:")
                TextField(" Enter weapon Name", text: $weaponName)
                    .border(Color.black)
            }
            HStack {
                Text("Hit Modifier:")
                    .fixedSize()
                TextField(" Enter Hit Modifiers", text: $hitModifiers)
                    .keyboardType(.numberPad)
                    .onReceive(Just(hitModifiers)) { newValue in
                        let filtered = newValue.filter { "-0123456789".contains($0) }
                        if filtered != newValue {
                            self.hitModifiers = filtered
                        }
                }
                .border(Color.black)
            }
            HStack {
                Text("how many dice:")
                    .fixedSize()
                TextField(" Enter Hit Modifiers", text: $numHitModifiers)
                    .keyboardType(.numberPad)
                    .onReceive(Just(numHitModifiers)) { newValue in
                        let filtered = newValue.filter { "-0123456789".contains($0) }
                        if filtered != newValue {
                            self.numHitModifiers = filtered
                        }
                }
                .border(Color.black)
            }
            HStack {
                Button(action: {
                    SaveWeapon(weaponName: self.weaponName, hitModifiers: self.hitModifiers, numHitModifiers: self.numHitModifiers)
                }) {
                    Text("Save")
                }
            }
        }
    }
}

struct AddWeapon_Previews: PreviewProvider {
    static var previews: some View {
        AddWeapon()
    }
}
func SaveWeapon(weaponName: String, hitModifiers: String, numHitModifiers: String) {
    ref = Database.database().reference()
    ref.child("Weapon").childByAutoId().setValue(["WeaponName": weaponName,
        "HitModifier": hitModifiers, "NumberOfDice": numHitModifiers])
}
