//
//  Selections.swift
//  SideBar
//
//  Created by pos on 27/10/17.
//  Copyright © 2017 com.ifsp. All rights reserved.
//

import Foundation

class Selections: NSObject, NSCoding {
    
    let name: String
    let value: Int
    init(name: String, value: Int) {
        self.name = name
        self.value = value
    }
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.value = decoder.decodeInteger(forKey: "value")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(value, forKey: "value")
    }
    
}

