//
//  ViewController.swift
//  XO
//
//  Created by Baidetskyi Jurii on 19.07.2022.
//

import UIKit

// MARK: Enum

enum BordType {
    case x
    case o
    case empty
    
    var image: UIImage? {
        switch self {
        case .x:
            return UIImage(named: "icon.x")
        case .o:
            return UIImage(named: "icon.o")
        case .empty:
            return UIImage(systemName: "book")
        }
    }
}
class GameViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet var boardsButtons: [UIButton]!
    
    
    // MARK: Symbols
    
    private var gameStatusArray = [[BordType]]()
    
    var userSymbol: BordType = .x {
        didSet {
            if userSymbol == .x {
                computerSymbol = .o
            } else if userSymbol == .o {
                computerSymbol = .x
            }
        }
    }
    private var computerSymbol: BordType = .o

    override func viewDidLoad() {
        super.viewDidLoad()
        subLabel.text = ""
        
        setupDefaultBoardState()
        
        if userSymbol == .o {
            titleLabel.text = "Computer turn \(computerSymbol)"
            computerTurn()
        } else  {
            titleLabel.text = "Your turn \(userSymbol)"
        }
    }
    
    // MARK:  @IBAction func
    
    @IBAction func tapOnTryAgain(_ sender: Any) {
        setupDefaultBoardState()
        if userSymbol == .o {
            computerTurn()
        }
        
    }
    
    @IBAction func tapOnBoardButtons(_ sender: Any) {
        guard let clicketButton = sender as? UIButton else {
            return
        }
        
        let indexButton = clicketButton.tag
        clicketButton.setImage(UIImage(named: "icon.x"), for: .normal)
        
        let i = indexButton / 3, j = indexButton % 3
        if gameStatusArray[i][j] == .empty {
            gameStatusArray[i][j] = userSymbol
            updateBoard()
            if isWin(symbol: userSymbol) {
                subLabel.text = "You win!"
                return
            }
            if isEmptyCell {
                titleLabel.text = "Computer turn"
                computerTurn()
            } else {
                titleLabel.text = "Game is over("
            }
           
        } else {
            let alert = UIAlertController(title: "Error", message: "This place is not empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
    // MARK:  private func
    
    private func isWin(symbol: BordType) -> Bool {
        var diagonalCount = 0
        var diagonalCountTwo = 0
        for i in 0...gameStatusArray.count - 1 {
            var countRow = 0
            var countCell = 0
            for j in 0...gameStatusArray.count - 1 {
                if gameStatusArray[i][j] == symbol {
                    countRow += 1
                }
                if gameStatusArray[j][i] == symbol {
                    countCell += 1
                }
                if gameStatusArray[i][j] == symbol && i == j {
                    diagonalCount += 1
                }
                if gameStatusArray.count - 1 - j == j {
                    if gameStatusArray[i][j] == symbol {
                        diagonalCountTwo += 1
                    }
                }
            }
            if countRow == 3 || countCell == 3 {
                return true
            }
        }
        if diagonalCount == 3 || diagonalCountTwo == 3 {
            return true
        }
        return false
    }
    
    private var isEmptyCell: Bool {
        for i in 0..<gameStatusArray.count {
            for j in 0..<gameStatusArray[i].count {
                if gameStatusArray[i][j] == .empty {
                    return true
                }
            }
        }
        return false
    }
    
    private func computerTurn() {
        var i = Int.random(in: 0...2)
        var j = Int.random(in: 0...2)
        while gameStatusArray[i][j] != .empty {
            i = Int.random(in: 0...2)
            j = Int.random(in: 0...2)
        }
        gameStatusArray[i][j] = computerSymbol
        updateBoard()
        if isWin(symbol: computerSymbol) {
            subLabel.text = "Computer wins. Fatality!"
            return
        }
        if isEmptyCell {
            titleLabel.text = "You turn"
        } else {
            titleLabel.text = "Game is over("
        }
        
    }
    
    private func updateBoard() {
        boardsButtons.forEach { button in
            let i = button.tag / 3, j = button.tag % 3
            button.backgroundColor = .clear
            button.setTitle("", for: .normal)
            subLabel.text = ""
            
            
            button.setImage(gameStatusArray[i][j].image, for: .normal)
            
            if gameStatusArray[i][j] == .empty {
                button.backgroundColor = .black.withAlphaComponent(0.4)
            }
            }
        }
    
    private func setupDefaultBoardState () {
        gameStatusArray = [
            [.empty, .empty, .empty],
            [.empty, .empty, .empty],
            [.empty, .empty, .empty]
        ]
        updateBoard()
    }
}

