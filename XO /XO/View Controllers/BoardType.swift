//
//  BoardType.swift
//  XO
//
//  Created by Baidetskyi Jurii on 17.01.2023.
//

import Foundation
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
            return UIImage()
        }
    }
        
        var tintColor: UIColor? {
            switch self {
            case .x:
                return UIColor.red
            case .o:
                return UIColor.blue
            case .empty:
                return UIColor.blue
            }
        }
}
