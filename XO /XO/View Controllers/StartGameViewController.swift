//
//  StartGameViewController.swift
//  XO
//
//  Created by Baidetskyi Jurii on 22.07.2022.
//

import UIKit

class StartGameViewController: UIViewController {
    private let chooseXSegueIdentifier = "chooseX"
    private let chooseOSegueIdentifier = "chooseO"

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gameVS = segue.destination as? GameViewController else {
            return
        }
        
        if segue.identifier == chooseXSegueIdentifier {
            gameVS.userSymbol = .x
        } else if segue.identifier == chooseOSegueIdentifier {
            gameVS.userSymbol = .o
        }
        
    }
    

}
