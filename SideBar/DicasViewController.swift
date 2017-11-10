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
    
    func loadData(){
        let primeiro0 = Selections(name: "primeiro0", value: 1)
        let primeiro1 = Selections(name: "primeiro1", value: 1)
        let primeiro2 = Selections(name: "primeiro2", value: 1)
        let primeiro3 = Selections(name: "primeiro3", value: 1)
        let primeiro4 = Selections(name: "primeiro4", value: 1)
        
        let segundo0 = Selections(name: "segundo0", value: 1)
        let segundo1 = Selections(name: "segundo1", value: 1)
        let segundo2 = Selections(name: "segundo2", value: 1)
        let segundo3 = Selections(name: "segundo3", value: 1)
        let segundo4 = Selections(name: "segundo4", value: 1)
        
        let terceiro0 = Selections(name: "terceiro0", value: 1)
        let terceiro1 = Selections(name: "terceiro1", value: 1)
        let terceiro2 = Selections(name: "terceiro2", value: 1)
        let terceiro3 = Selections(name: "terceiro3", value: 1)
        let terceiro4 = Selections(name: "terceiro4", value: 1)
        
        let quarto0 = Selections(name: "quarto0", value: 1)
        let quarto1 = Selections(name: "quarto1", value: 1)
        let quarto2 = Selections(name: "quarto2", value: 1)
        let quarto3 = Selections(name: "quarto3", value: 1)
        let quarto4 = Selections(name: "quarto4", value: 1)
        
        let quinto0 = Selections(name: "quinto0", value: 1)
        let quinto1 = Selections(name: "quinto1", value: 1)
        let quinto2 = Selections(name: "quinto2", value: 1)
        let quinto3 = Selections(name: "quinto3", value: 1)
        let quinto4 = Selections(name: "quinto4", value: 1)
        
        var selections = [Selections]()
        selections.append(primeiro0)
        selections.append(primeiro1)
        selections.append(primeiro2)
        selections.append(primeiro3)
        selections.append(primeiro4)
        
        selections.append(segundo0)
        selections.append(segundo1)
        selections.append(segundo2)
        selections.append(segundo3)
        selections.append(segundo4)
        
        selections.append(terceiro0)
        selections.append(terceiro1)
        selections.append(terceiro2)
        selections.append(terceiro3)
        selections.append(terceiro4)
        
        selections.append(quarto0)
        selections.append(quarto1)
        selections.append(quarto2)
        selections.append(quarto3)
        selections.append(quarto4)
        
        selections.append(quinto0)
        selections.append(quinto1)
        selections.append(quinto2)
        selections.append(quinto3)
        selections.append(quinto4)
        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: selections)
        UserDefaults.standard.set(encodedData, forKey: "selections")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
           menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        if (UserDefaults.standard.data(forKey: "selections") == nil) {
            loadData()
        }
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
