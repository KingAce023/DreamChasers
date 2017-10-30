//
//  DetailViewController.swift
//  SearchBar
//
//  Created by Shinkangsan on 1/23/17.
//  Copyright © 2017 Sheldon. All rights reserved.
//

import UIKit
import Firebase

class DetailViewController: UIViewController {

    //from prev controller
    var dataModel:Model!
   
    //-----------VARIABLES---------------------
   
    //IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    weak var sourceController: ViewController?
    
    @IBOutlet weak var partAdded: UILabel!

    
//<<<<<<< HEAD
    
    //-------- ADD TO INVENTORY BUTTON -------
    @IBAction func invList(_ sender: UIButton) {
        let user = Auth.auth().currentUser?.uid
        self.dbref?.child("Users").child(user!).child("repairs").childByAutoId().setValue(imageNameLabel.text)
        self.partAdded.isHidden = false
        GlobalVariable.inventoryList.append(imageNameLabel.text!)
       
        //---- ADD TO CGRect ARRAY AND MAKES SURE THERE IS NO DUPLICATES (TEMPORARY SOLUTION) --------------------------
        if (imageNameLabel.text == "battery"){
            if GlobalVariable.car1.contains(CGRect(x:50, y: 50, width:50, height:50)) {
                print("BATTERY ALREADY EXISTS")
            }
            else{
                GlobalVariable.car1.append(CGRect(x: 50, y: 50, width: 50, height: 50))
            }
        }
        else if (imageNameLabel.text == "breakPads"){
            if GlobalVariable.car1.contains(CGRect(x: 340, y: 60, width: 40, height: 40)) {
                print("BREAKPADS ALREADY EXISTS")
            }
            else{
                GlobalVariable.car1.append(CGRect(x: 340, y: 60, width: 40, height: 40))
            }
        }
        else if (imageNameLabel.text == "tire"){
            if GlobalVariable.car1.contains(CGRect(x: 170, y: 90, width: 50, height: 40)) {
                print("TIRE ALREADY EXISTS")
            }
            else{
                GlobalVariable.car1.append(CGRect(x: 170, y: 90, width: 50, height: 40))
            }
        }
        else if (imageNameLabel.text == "muffler"){
            if GlobalVariable.car1.contains(CGRect(x: 270, y: 60, width: 20, height: 20)) {
                print("MUFFLER ALREADY EXISTS")
            }
            else{
                GlobalVariable.car1.append(CGRect(x: 270, y: 60, width: 20, height: 20))
            }
        }
        else if (imageNameLabel.text == "sparkPlug"){
            if GlobalVariable.car1.contains(CGRect(x: 120, y: 85, width: 40, height: 20)) {
                print("SPARKPLUG ALREADY EXISTS")
            }
            else{
                GlobalVariable.car1.append(CGRect(x: 120, y: 85, width: 40, height: 20))
            }
        }
        //--------------------------------------------------------------------------------
   
        //--------------This will reload the main page again----------------
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desViewController = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let newFrontViewController = UINavigationController.init(rootViewController:desViewController)
        revealViewController().pushFrontViewController(newFrontViewController, animated: true)
        //------------------------------------------------------------------
    }
 
    
   var dbref: DatabaseReference?

    
//------------ MAIN --------------------
 override func viewDidLoad() {
        super.viewDidLoad()

     dbref = Database.database().reference()

        imageNameLabel.text = dataModel.imageName
        yearLabel.text = dataModel.imageYear
        priceLabel.text = dataModel.imagePrice

     self.partAdded.isHidden = true
     partAdded.text = "Part Added!"
    
        imageView.image = UIImage(named: dataModel.imageName)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //--------Declaring a global variable-----------
    struct GlobalVariable{
        static var inventoryList = [String]()
        static var car1 = [CGRect]()
    }

}
