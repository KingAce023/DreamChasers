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
    
    @IBOutlet weak var partAdded: UILabel!
    
//<<<<<<< HEAD
    
    //-------- ADD TO INVENTORY BUTTON -------
    @IBAction func invList(_ sender: UIButton) {
        GlobalVariable.inventoryList.append(imageNameLabel.text!)
        print(GlobalVariable.inventoryList)
   
        //--------------This will reload the main page again----------------
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desViewController = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let newFrontViewController = UINavigationController.init(rootViewController:desViewController)
        revealViewController().pushFrontViewController(newFrontViewController, animated: true)
        //------------------------------------------------------------------
    }
 
    
    /* =======
   var dbref: DatabaseReference?
 >>>>>>> 22b9f77d21fa51084afd4f6626c2184e050419e4
 */
    
//------------ MAIN --------------------
 override func viewDidLoad() {
        super.viewDidLoad()

    // dbref = Database.database().reference()

        imageNameLabel.text = dataModel.imageName
        yearLabel.text = dataModel.imageYear
        priceLabel.text = dataModel.imagePrice

    // self.partAdded.isHidden = true
    // partAdded.text = "Part Added!"
    
        imageView.image = UIImage(named: dataModel.imageName)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*@IBAction func addToInventory(_ sender: Any) {
        let user = Auth.auth().currentUser?.uid
    self.dbref?.child("Users").child(user!).child("repairs").childByAutoId().setValue(imageNameLabel.text)
        //self.partAdded.isHidden = false
        
    }*/
    
    //--------Declaring a global variable-----------
    struct GlobalVariable{
        static var inventoryList = [String]()
    }
}
