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
        
        modelAry.append(Model(name: "img0", year: "2000", price: "234.25"))
        modelAry.append(Model(name: "img1", year: "2010", price: "32.45"))
        modelAry.append(Model(name: "img2", year: "2008", price: "44.97"))
        modelAry.append(Model(name: "img3", year: "2015", price: "19.99"))
        modelAry.append(Model(name: "img4", year: "2020", price: "45.75"))
        
        return modelAry
    }
}
