//
//  ProfileViewController.swift
//  Gallery
//
//  Created by Owen Cahyadi on 05/09/18.
//  Copyright © 2018 Owen Cahyadi. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {

    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserModel")
        
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                self.emailLabel.text = data.value(forKey: "email") as? String
                var separated = self.emailLabel.text?.components(separatedBy: "@")
                self.userNameLabel.text = separated?[0]
            }
            
        } catch {
            
            print("Failed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
