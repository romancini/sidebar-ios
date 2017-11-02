//
//  ResultadoViewController.swift
//  SideBar
//
//  Created by Ricardo Frangioti on 30/10/2017.
//  Copyright © 2017 com.ifsp. All rights reserved.
//

import UIKit

class ResultadoViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var imageViewResultado: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            if let data = UserDefaults.standard.data(forKey: "selections"),
                let selections = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Selections] {
                var incorrects = ""
                
                if (!checkEveraldo(valores: selections)) {
                    incorrects = "Everaldo "
                }
                
                if (!checkTeobaldo(valores: selections)) {
                    incorrects = incorrects + "Teobaldo "
                }
                
                if (!checkSeverino(valores: selections)) {
                    incorrects = incorrects + "Severino "
                }
                
                if (!checkJeremias(valores: selections)) {
                    incorrects = incorrects + "Jeremias "
                }
                
                if (!checkFrederico(valores: selections)) {
                    incorrects = incorrects + "Frederico "
                }
                
                if (incorrects != "") {
                    print("Estão incorretas as seguintes pessoas... " + incorrects)
                } else {
                    print("Parabéns fiadamãe!!!")
                }
            }
        }
        
    }
    
    func checkTeobaldo(valores: [Selections]) -> Bool {
        var result0: Bool = false
        var result1: Bool = false
        var result2: Bool = false
        var result3: Bool = false
        var result4: Bool = false
        valores.forEach{ pessoa in
            //Teobaldo é a primeira pessoa
            if (pessoa.name == "primeiro0" && pessoa.value == 2) {
                result2 = true
            }
            
            if (pessoa.name == "segundo0" && pessoa.value != 2) {
                result0 = true
            }
            
            if (pessoa.name == "terceiro0" && pessoa.value != 2) {
                result1 = true
            }
            
            if (pessoa.name == "quarto0" && pessoa.value != 2) {
                result3 = true
            }
            
            if (pessoa.name == "quinto0" && pessoa.value != 2) {
                result4 = true
            }
        }
        
        if (result0 && result1 && result2 && result3 && result4) {
            return true
        }
        
        return false
    }
    
    func checkSeverino(valores: [Selections]) -> Bool {
        var result0: Bool = false
        var result1: Bool = false
        var result2: Bool = false
        var result3: Bool = false
        var result4: Bool = false
        valores.forEach{ pessoa in
            //Severino é a segunda pessoa
            if (pessoa.name == "segundo0" && pessoa.value == 2) {
                result2 = true
            }
            
            if (pessoa.name == "primeiro0" && pessoa.value != 2) {
                result0 = true
            }
            
            if (pessoa.name == "terceiro0" && pessoa.value != 2) {
                result1 = true
            }
            
            if (pessoa.name == "quarto0" && pessoa.value != 2) {
                result3 = true
            }
            
            if (pessoa.name == "quinto0" && pessoa.value != 2) {
                result4 = true
            }
        }
        
        if (result0 && result1 && result2 && result3 && result4) {
            return true
        }
        
        return false
    }
    
    func checkEveraldo(valores: [Selections]) -> Bool {
        var result0: Bool = false
        var result1: Bool = false
        var result2: Bool = false
        var result3: Bool = false
        var result4: Bool = false
        valores.forEach{ pessoa in
            //Everaldo é a terceira pessoa
            if (pessoa.name == "terceiro0" && pessoa.value == 2) {
                result2 = true
            }
            
            if (pessoa.name == "primeiro0" && pessoa.value != 2) {
                result0 = true
            }
            
            if (pessoa.name == "segundo0" && pessoa.value != 2) {
                result1 = true
            }
            
            if (pessoa.name == "quarto0" && pessoa.value != 2) {
                result3 = true
            }
            
            if (pessoa.name == "quinto0" && pessoa.value != 2) {
                result4 = true
            }
        }
        
        if (result0 && result1 && result2 && result3 && result4) {
            return true
        }
        
        return false
    }
    
    func checkJeremias(valores: [Selections]) -> Bool {
        var result0: Bool = false
        var result1: Bool = false
        var result2: Bool = false
        var result3: Bool = false
        var result4: Bool = false
        valores.forEach{ pessoa in
            //Jeremias é a quarta pessoa
            if (pessoa.name == "quarto0" && pessoa.value == 2) {
                result2 = true
            }
            
            if (pessoa.name == "primeiro0" && pessoa.value != 2) {
                result0 = true
            }
            
            if (pessoa.name == "segundo0" && pessoa.value != 2) {
                result1 = true
            }
            
            if (pessoa.name == "terceiro0" && pessoa.value != 2) {
                result3 = true
            }
            
            if (pessoa.name == "quinto0" && pessoa.value != 2) {
                result4 = true
            }
        }
        
        if (result0 && result1 && result2 && result3 && result4) {
            return true
        }
        
        return false
    }
    
    func checkFrederico(valores: [Selections]) -> Bool {
        var result0: Bool = false
        var result1: Bool = false
        var result2: Bool = false
        var result3: Bool = false
        var result4: Bool = false
        valores.forEach{ pessoa in
            //Fred é a quinta pessoa
            if (pessoa.name == "quinto0" && pessoa.value == 2) {
                result2 = true
            }
            
            if (pessoa.name == "primeiro0" && pessoa.value != 2) {
                result0 = true
            }
            
            if (pessoa.name == "segundo0" && pessoa.value != 2) {
                result1 = true
            }
            
            if (pessoa.name == "terceiro0" && pessoa.value != 2) {
                result3 = true
            }
            
            if (pessoa.name == "quarto0" && pessoa.value != 2) {
                result4 = true
            }
        }
        
        if (result0 && result1 && result2 && result3 && result4) {
            return true
        }
        
        return false
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
