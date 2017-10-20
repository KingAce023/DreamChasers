//
//  ViewController.swift
//  RIghtSideMenuOpen
//
//  Created by Parth Changela on 13/11/16.
//  Copyright © 2016 Parth Changela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addParts: UIBarButtonItem!
    @IBOutlet weak var btnMenuOpen: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
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
        sideMenus()
        customizeNavBar()
        // Do any additional setup after loading the view, typically from a nib.

        revealViewController().rightViewRevealWidth = 250
        btnMenuOpen.target = revealViewController()
        btnMenuOpen.action = #selector(SWRevealViewController.rightRevealToggle(_:))

    }

    @IBOutlet weak var scrollView: UIScrollView!
    var imageArr = [UIImage]()
    func sideMenus(){
        if revealViewController() != nil {
            
            addParts.target = revealViewController()
            addParts.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
          
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func customizeNavBar(){
        navigationController?.navigationBar.tintColor = UIColor(red: 255/255, green:255/255, blue: 255/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 255, green:87/255, blue: 35/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

