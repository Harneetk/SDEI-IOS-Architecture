//
//  DetailViewModel.swift
//  iOSArchitecture_MVVM
//
//  Created by Surjeet Singh on 15/03/2019.
//  Copyright © 2019 Surjeet Singh. All rights reserved.
//

import UIKit

class DetailViewModel: BaseViewModel {
    
    private var listingObj: Listing?
    
    override init() {
        super.init()
    }
    
    convenience init(with object : Listing) {
        self.init()
        
        self.listingObj = object
    }
    
}
