//
//  ViewController.swift
//  FirebaseLoginEmail
//
//  Created by ios Developer on 2/7/17.
//  Copyright © 2017 ios Developer. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {
    @IBOutlet weak var segmentUrban: UISegmentedControl!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pwd: UITextField!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    var isCheckState:Bool = true
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
    }
    @IBAction func SegmentPressed(_ sender: UISegmentedControl)
    {
        isCheckState = !isCheckState
        if isCheckState
        {
            signInLabel.text = "SignIn"
            signInButton.setTitle("SignIn", for: .normal)
        }
        else
        {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
    }
    @IBAction func SignInPressed(_ sender: UIButton)
    { let uremail = email.text
        let urpwd = pwd.text
        if (uremail != nil),(urpwd != nil){
            if isCheckState{
                FIRAuth.auth()?.signIn(withEmail: uremail!, password: urpwd!, completion: {(user,error)in
                    if let u = user {
                        self.performSegue(withIdentifier: "gotoHome", sender: self)
                    }else{
                        //error
                    }
                })
            }
        
            
    }else{
            if (uremail != nil),(urpwd != nil){
                if isCheckState{
                    FIRAuth.auth()?.createUser(withEmail: uremail!, password: urpwd!, completion: {(user,error)in
                        if let u = user {
                            self.performSegue(withIdentifier: "gotoHome", sender: self)
                        }else{
                            //error
                        }
                    })
                }


    }
}
}
}


