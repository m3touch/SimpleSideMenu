//
//  MenuEnities.swift
//  SimpleSideMenu
//
//  Created by Marta on 20/09/16.
//  Copyright © 2016 Marta. All rights reserved.
//

import Foundation

struct SideMenuButton {
    
    let buttonId : Int
    let buttonName : String
    var buttonIconName : String?
    
    init(named name: String, index: Int) {
        buttonName = name
        buttonId = index
    }
}

typealias SideMenuSection = [SideMenuButton]
