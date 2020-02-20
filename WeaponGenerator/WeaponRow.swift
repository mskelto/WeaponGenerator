//
//  WeaponRow.swift
//  WeaponGenerator
//
//  Created by Marshall Skelton on 2/12/20.
//  Copyright © 2020 Marshall Skelton. All rights reserved.
//

import SwiftUI
import Firebase

struct WeaponRow: View {
    var weapon: Weapon
    var body: some View {
        HStack {
            Text(weapon.weaponName)
        }
    }
}

struct WeaponRow_Previews: PreviewProvider {
    static var previews: some View {
        WeaponRow(weapon: Weapon.init(weaponName: "weaponExample", hitModifier: "2", numberOfDice: "2", id: "1"))
    }
}


