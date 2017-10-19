//
//  ViewController.swift
//  RIghtSideMenuOpen
//
//  Created by Parth Changela on 13/11/16.
//  Copyright © 2016 Parth Changela. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController , UISearchBarDelegate, UISearchDisplayDelegate {
    
    //var searchResults:Array<>?
    //var ref: DatabaseReference!
    var dbref: DatabaseReference?
    //dbref?.child("kush").child(user.uid).setValue(["username": username])
    
    @IBOutlet weak var addParts: UIBarButtonItem!
    @IBOutlet weak var btnMenuOpen: UIBarButtonItem!
    
    //-----------------------------MAIN------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD:Navigate/ViewController.swift
        
        dbref = Database.database().reference()
        
=======
        scrollView.frame = view.frame
        imageArr = [#imageLiteral(resourceName: "CarParts"),#imageLiteral(resourceName: "compact-red-car-side-view-10034818"),#imageLiteral(resourceName: "Ferrari-599-GTO-Front-View")]
        for i in 0..<imageArr.count{
            let imageView = UIImageView()
            imageView.image = imageArr[i]
            imageView.contentMode = .scaleAspectFit
            let xPos = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.width)
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
            scrollView.addSubview(imageView)
        }
>>>>>>> dee85e996c32a8ec663085977b4110d947cdc3aa:Navigate/Navigate/ViewController.swift
        sideMenus()
        customizeNavBar()
        
        // Do any additional setup after loading the view, typically from a nib.
        dbref?.child("kush").childByAutoId().setValue("Hello Firebase")
        revealViewController().rightViewRevealWidth = 250
        btnMenuOpen.target = revealViewController()
        btnMenuOpen.action = #selector(SWRevealViewController.rightRevealToggle(_:))

    }

<<<<<<< HEAD:Navigate/ViewController.swift
    //----------------------------SWIPE SIDE MENUS-----------------------------------
=======
    @IBOutlet weak var scrollView: UIScrollView!
    var imageArr = [UIImage]()
>>>>>>> dee85e996c32a8ec663085977b4110d947cdc3aa:Navigate/Navigate/ViewController.swift
    func sideMenus(){
        if revealViewController() != nil {
            
            addParts.target = revealViewController()
            addParts.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
          
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    //--------------------CUSTOMIZE COLOUR MENU BAR --------------------------------
    func customizeNavBar(){
        navigationController?.navigationBar.tintColor = UIColor(red: 255/255, green:255/255, blue: 255/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 255, green:87/255, blue: 35/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    
    //-------- DO NOT DELETE - DEFAULT MEMORY ALLOCATION ---------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

