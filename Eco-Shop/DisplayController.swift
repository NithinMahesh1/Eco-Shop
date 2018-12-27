//
//  DisplayController.swift
//  Eco-Shop
//
//  Created by nithin mahesh on 12/17/18.
//  Copyright © 2018 Code School. All rights reserved.
//

import UIKit

class DisplayController: UIViewController {

    @IBOutlet weak var labelOutput: UILabel!
    @IBOutlet weak var lnameOutput: UILabel!
    @IBOutlet weak var fnameOutput: UILabel!
    @IBOutlet weak var emailOutput: UILabel!
    
    var username: String?
    var lname: String?
    var fname: String?
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelOutput.text = username
        lnameOutput.text = lname
        fnameOutput.text = fname
        emailOutput.text = email
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
