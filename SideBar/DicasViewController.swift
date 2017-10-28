//
//  DicasViewController.swift
//  SideBar
//
//  Created by pos on 27/10/17.
//  Copyright © 2017 com.ifsp. All rights reserved.
//

import UIKit

class DicasViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
           menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        let primeiro0 = Selections(name: "primeiro0", value: 1)
        let primeiro1 = Selections(name: "primeiro1", value: 1)
        let primeiro2 = Selections(name: "primeiro2", value: 1)
        let primeiro3 = Selections(name: "primeiro3", value: 1)
        let primeiro4 = Selections(name: "primeiro4", value: 1)
        
        var selections = [Selections]()
        selections.append(primeiro0)
        selections.append(primeiro1)
        selections.append(primeiro2)
        selections.append(primeiro3)
        selections.append(primeiro4)
        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: selections)
        UserDefaults.standard.set(encodedData, forKey: "selections")
        
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
