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

    @IBOutlet weak var chooseOButtonOutlet: UIButton! {
        didSet {
            chooseOButtonOutlet.layer.cornerRadius = 0.5 * chooseOButtonOutlet.bounds.size.width
        }
    }
    @IBOutlet weak var chooseXButtonOutlet: UIButton!{
        didSet {
            chooseXButtonOutlet.layer.cornerRadius = 0.5 * chooseXButtonOutlet.bounds.size.width
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
