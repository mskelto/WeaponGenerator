//
//  AddWeapon.swift
//  WeaponGenerator
//
//  Created by Marshall Skelton on 2/10/20.
//  Copyright © 2020 Marshall Skelton. All rights reserved.
//

import SwiftUI
import Combine

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
        }
    }
}

struct AddWeapon_Previews: PreviewProvider {
    static var previews: some View {
        AddWeapon()
    }
}
