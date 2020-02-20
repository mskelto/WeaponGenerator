//
//  Weapon.swift
//  WeaponGenerator
//
//  Created by Marshall Skelton on 2/11/20.
//  Copyright © 2020 Marshall Skelton. All rights reserved.
//

import Foundation
import Firebase

struct Weapon: Identifiable, Codable {
    let id: String
    var weaponName: String = ""
    var hitModifier: String = ""
    var numberOfDice: String = ""
    init(weaponName: String, hitModifier:String, numberOfDice: String, id: String) {
        self.weaponName = weaponName
        self.hitModifier = hitModifier
        self.numberOfDice = numberOfDice
        self.id = id
    }
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let weaponName = value["WeaponName"] as? String,
            let hitModifier = value["HitModifier"] as? String,
            let numberOfDice = value["NumberOfDice"] as? String
            else {
                return nil
            }
        self.weaponName = weaponName
        self.hitModifier = hitModifier
        self.numberOfDice = numberOfDice
        self.id = snapshot.key
    }
    func toAnyObject() -> Any {
        return [
            "WeaponName": weaponName,
            "HitModifier": hitModifier,
            "NumberOfDice": numberOfDice
        ]
    }
    func weaponNameString() -> String {
        return weaponName
    }
}
