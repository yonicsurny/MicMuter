//
//  Localizable.swift
//  MicMuter
//
//  Created by Yonic Surny on 16/04/2018.
//  Copyright © 2018 Aelptos. All rights reserved.
//

import Foundation

enum Localizable: String {
    
    case about_action
    case about_text
    case quit_action
    case version_format
    
    var localized: String {
        return self.rawValue.localized
    }
}
