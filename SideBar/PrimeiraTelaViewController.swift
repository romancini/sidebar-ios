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
    
    @IBOutlet weak var titleLabel: UINavigationItem!
    
    func updateSegmentedControlView(chave: String){
        if let data = UserDefaults.standard.data(forKey: "selections"),
            let selections = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Selections] {
            selections.forEach { pessoa in
                switch(pessoa.name){
                case chave + "0":
                    segmentedEveraldo.selectedSegmentIndex = pessoa.value
                case chave + "1":
                    segmentedFrederico.selectedSegmentIndex = pessoa.value
                case chave + "2":
                    segmentedSeverino.selectedSegmentIndex = pessoa.value
                case chave + "3":
                    segmentedJeremias.selectedSegmentIndex = pessoa.value
                case chave + "4":
                    segmentedTeobaldo.selectedSegmentIndex = pessoa.value
                default:
                    print("")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        switch titleLabel.title! {
        case "Pessoa 1":
            updateSegmentedControlView(chave: "primeiro")
        case "Pessoa 2":
            updateSegmentedControlView(chave: "segundo")
        case "Pessoa 3":
            updateSegmentedControlView(chave: "terceiro")
        case "Pessoa 4":
            updateSegmentedControlView(chave: "quarto")
        case "Pessoa 5":
            updateSegmentedControlView(chave: "quinto")
        default:
            print("")
        }
    }
    
    func updateSegmentedControlArchived(indice: String, segmentedIndex: Int){
        var chave: String
        switch titleLabel.title! {
        case "Pessoa 1":
            chave = "primeiro" + indice
        case "Pessoa 2":
            chave = "segundo" + indice
        case "Pessoa 3":
            chave = "terceiro" + indice
        case "Pessoa 4":
            chave = "quarto" + indice
        case "Pessoa 5":
            chave = "quinto" + indice
        default:
            chave = " " + indice
        }
        
        if let data = UserDefaults.standard.data(forKey: "selections"),
            var selections = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Selections] {
            selections.append(Selections(name: chave, value: segmentedIndex))
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: selections)
            UserDefaults.standard.set(encodedData, forKey: "selections")
        }
    }

    @IBAction func segmentedEveraldoAction(_ sender: UISegmentedControl) {
        updateSegmentedControlArchived(indice: "0", segmentedIndex: segmentedEveraldo.selectedSegmentIndex)
    }
    
    @IBAction func segmentedFredericoAction(_ sender: UISegmentedControl) {
        updateSegmentedControlArchived(indice: "1", segmentedIndex: segmentedFrederico.selectedSegmentIndex)
    }
    
    @IBAction func segmentedJeremiasAction(_ sender: UISegmentedControl) {
        updateSegmentedControlArchived(indice: "2", segmentedIndex: segmentedJeremias.selectedSegmentIndex)
    }
    
    @IBAction func segmentedSeverinoAction(_ sender: UISegmentedControl) {
        updateSegmentedControlArchived(indice: "3", segmentedIndex: segmentedSeverino.selectedSegmentIndex)
    }
    
    @IBAction func segmentedTeobaldoAction(_ sender: UISegmentedControl) {
        updateSegmentedControlArchived(indice: "4", segmentedIndex: segmentedTeobaldo.selectedSegmentIndex)
        
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
