//
//  AppInstance.swift
//  Docsink
//
//  Created by Amit Kumar Shukla on 9/6/16.
//  Copyright (c) 2016 Docsink. All rights reserved.
//
// Use this class for storing shared instances

import Foundation

class AppInstance: NSObject {
   
    static let shared = AppInstance()
    var user:User?
    var authToken:String?
    
    override init() {
        super.init()
    }
}
