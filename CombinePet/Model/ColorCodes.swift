//
//  ColorCodes.swift
//  CombinePet
//
//  Created by Macbook on 31.05.2024.
//

import Foundation
import SwiftUI

enum ColorCodes{
    case primary
    case success
    case failure
    case background
}

extension ColorCodes{
    func color()->Color{
        switch self {
        case .primary:
            return Color(
                red: 20/255,
                green: 100/255,
                blue: 78/255
            )
        case .success:
            return Color(
                red: 0,
                green: 0,
                blue: 0
            )
        case .failure:
            return Color(
                red: 219/255,
                green: 12/255,
                blue: 12/255
            )
        case .background:
            return Color(
                red: 239/255,
                green: 243/255,
                blue: 244/255,
                opacity: 1
            )
        }
    }
}
