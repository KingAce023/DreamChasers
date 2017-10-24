//
//  Model.swift
//  SearchBar
//
//  Created by Shinkangsan on 12/20/16.
//  Copyright © 2016 Sheldon. All rights reserved.
//

import UIKit

class Model: NSObject {
    var imageName:String = ""
    var imageYear:String = ""
    var imagePrice:String = ""
    
    init(name:String,year:String,price:String) {
        self.imageName = name
        self.imageYear = year
        self.imagePrice = price
    }
    
    class func generateModelArray() -> [Model]{
        var modelAry = [Model]()
        
        modelAry.append(Model(name: "img0", year: "2000", price: "sheldon"))
        modelAry.append(Model(name: "img1", year: "2010", price: "xiaodan"))
        modelAry.append(Model(name: "img2", year: "2008", price: "wang"))
        modelAry.append(Model(name: "img3", year: "2015", price: "singleton"))
        modelAry.append(Model(name: "img4", year: "2020", price: "unknown"))
        
        return modelAry
    }
}
