//
//  contactViewController.swift
//  Navigate
//
//  Created by Sully Al Shemari on 2017-10-24.
//  Copyright © 2017 Dream Chasers. All rights reserved.
//

import UIKit

class contactViewController: UIViewController {

    @IBOutlet weak var btnMenuOpen: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnMenuOpen.target = revealViewController()
        btnMenuOpen.action = #selector(SWRevealViewController.rightRevealToggle(_:))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
