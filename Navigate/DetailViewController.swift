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
    var inventoryList = [String]()
    
    //IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var partAdded: UILabel!
    
<<<<<<< HEAD
    
    //-------- ADD TO INVENTORY -------
    
    @IBAction func invList(_ sender: UIButton) {
        inventoryList.append("John")
        performSegue(withIdentifier: "segue", sender: ViewController)
    }
    
    
    //----------Copy function --------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let populateList = segue.destination as! ViewController
        populateList.data = inventoryList
    }
    
    //------------ MAIN --------------------
=======
    var dbref: DatabaseReference?
>>>>>>> 22b9f77d21fa51084afd4f6626c2184e050419e4
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
    
    @IBAction func addToInventory(_ sender: Any) {
        let user = Auth.auth().currentUser?.uid
    self.dbref?.child("Users").child(user!).child("repairs").childByAutoId().setValue(imageNameLabel.text)
        self.partAdded.isHidden = false
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
