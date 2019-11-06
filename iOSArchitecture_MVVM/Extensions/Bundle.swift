//
//  Bundle.swift
//  Patient
//
//  Created by Amit Kumar Shukla on 5/24/18.
//  Copyright © 2018 Amit Kumar Shukla. All rights reserved.
//

import Foundation

extension Bundle {
    var versionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
}
