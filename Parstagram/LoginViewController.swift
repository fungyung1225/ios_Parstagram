//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Fung on 3/18/19.
//  Copyright © 2019 fungyung. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameLbl: UITextField!
    @IBOutlet weak var passwordLbl: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSigninBtn(_ sender: Any) {
        let username = usernameLbl.text!
        let password  = passwordLbl.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if(user != nil){
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onSignUpBtn(_ sender: Any) {
        let user = PFUser()
        user.username = usernameLbl.text//"myUsername"
        user.password = passwordLbl.text//"myPassword"
        
        user.signUpInBackground { (sucess, error) in
            if sucess{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)")
            }
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
