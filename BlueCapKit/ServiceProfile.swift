//
//  ServiceProfile.swift
//  BlueCap
//
//  Created by Troy Stribling on 6/21/14.
//  Copyright (c) 2014 gnos.us. All rights reserved.
//

import Foundation
import CoreBluetooth

class ServiceProfile {
    
    var characteristicProfiles = Dictionary<CBUUID, CharacteristicProfile>()

    let uuid : CBUUID!
    let name : String!
    
    var characteristics : [CharacteristicProfile] {
        return Array(self.characteristicProfiles.values)
    }
    
    init(uuid:String, name:String, profile:(service:ServiceProfile) -> ()) {
        self.name = name
        self.uuid = CBUUID.UUIDWithString(uuid)
        profile(service:self)
    }
    
    func addCharacteristic( characteristicProfile:CharacteristicProfile) {
        Logger.debug("ServiceProfile#createCharateristic: name=\(characteristicProfile.name), uuid=\(characteristicProfile.uuid.UUIDString)")
        self.characteristicProfiles[characteristicProfile.uuid] = characteristicProfile
    }
    
}