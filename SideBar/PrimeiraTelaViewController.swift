//
//  PrimeiraTelaViewController.swift
//  SideBar
//
//  Created by pos on 20/10/17.
//  Copyright © 2017 com.ifsp. All rights reserved.
//

import UIKit

class PrimeiraTelaViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var segmentedEveraldo: UISegmentedControl!
    @IBOutlet weak var segmentedFrederico: UISegmentedControl!
    @IBOutlet weak var segmentedJeremias: UISegmentedControl!
    @IBOutlet weak var segmentedSeverino: UISegmentedControl!
    @IBOutlet weak var segmentedTeobaldo: UISegmentedControl!
    
    var arrayPrimeiraPessoa: [Int] = [0,1,0,2,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        if let data = UserDefaults.standard.data(forKey: "selections"),
            let selections = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Selections] {
            selections.forEach({print( $0.name, $0.value)})
        } else {
            print("There is an issue")
        }
        
    }

    @IBAction func segmentedEveraldoAction(_ sender: UISegmentedControl) {
        arrayPrimeiraPessoa[0] = segmentedEveraldo.selectedSegmentIndex
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
