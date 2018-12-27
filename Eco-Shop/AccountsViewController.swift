//
//  AccountsViewController.swift
//  Eco-Shop
//
//  Created by nithin mahesh on 12/16/18.
//  Copyright © 2018 nithin mahesh. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lnameTextField: UITextField!
    @IBOutlet weak var fnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.image = UIImage(named: "Accounts")?.withRenderingMode(.alwaysOriginal)
                // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nextTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "InputToDisplay", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "InputToDisplay"){
            let displayVC = segue.destination as! DisplayController
            displayVC.username = nameTextField.text
            displayVC.lname = lnameTextField.text
            displayVC.fname = fnameTextField.text
            displayVC.email = emailTextField.text
        }
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
