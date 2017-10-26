//
//  Model.swift
//  SearchBar
//
//  Created by Shinkangsan on 12/20/16.
//  Copyright © 2016 Sheldon. All rights reserved.
//

import UIKit

//THIS IS WHERE YOU UPDATE THE STATIC ARRAY WITH THE FIREBASE DATABASE

class Model: NSObject {
    var imageName:String = ""
    var imageYear:String = ""
    var imagePrice:String = ""
    
    init(name:String,year:String,price:String) {
        self.imageName = name
        self.imageYear = year
        self.imagePrice = price
    }
    
//Note, the name MUST match the picture name from the Assets.xcassets folder, or else it will not populate.
    
    class func generateModelArray() -> [Model]{
        var modelAry = [Model]()
        
        modelAry.append(Model(name: "tire", year: "2000", price: "175 - 300"))
        modelAry.append(Model(name: "battery", year: "2010", price: "75 - 150"))
        modelAry.append(Model(name: "sparkPlug", year: "2008", price: "5 - 25"))
        modelAry.append(Model(name: "muffler", year: "2015", price: "75 - 125"))
        modelAry.append(Model(name: "breakPads", year: "2020", price: "50 - 100"))
        
        return modelAry
    }
}
