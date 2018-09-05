//
//  LoginViewController.swift
//  Gallery
//
//  Created by Owen Cahyadi on 05/09/18.
//  Copyright © 2018 Owen Cahyadi. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onClickLogin(_ sender: UIButton) {
        if emailField.text == "" || passwordField.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please input email and password!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        } else {
            guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
            }
            
            let managedContext =
                appDelegate.persistentContainer.viewContext
            
            let entity =
                NSEntityDescription.entity(forEntityName: "UserModel",
                                           in: managedContext)!
            
            let model = NSManagedObject(entity: entity,
                                        insertInto: managedContext)
            
            model.setValue(self.emailField.text, forKeyPath: "email")
            model.setValue(self.passwordField.text, forKey: "password")
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
            
            UserDefaults.standard.set(true, forKey: "isLogin")
            
            self.performSegue(withIdentifier:"successLogin", sender: nil)
        }
    }
}
