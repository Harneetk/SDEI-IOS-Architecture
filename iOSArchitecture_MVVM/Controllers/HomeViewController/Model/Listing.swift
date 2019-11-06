//
//  Listing.swift
//  iOSArchitecture_MVVM
//
//  Created by Surjeet Singh on 14/03/2019.
//  Copyright © 2019 Surjeet Singh. All rights reserved.
//

import UIKit

final class Listing : Codable {
    let name : String?
    let subTitle : String?
    let enable : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case subTitle = "sub_title"
        case enable = "enable"
    }
    
    init(name: String, subTitle:String, enable:Bool) {
        self.name = name
        self.subTitle = subTitle
        self.enable = enable
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        subTitle = try values.decodeIfPresent(String.self, forKey: .subTitle)
        enable = try values.decodeIfPresent(Bool.self, forKey: .enable)
    }
    
}
