//
//  String+Localizable.swift
//  MicMuter
//
//  Created by Yonic Surny on 16/04/2018.
//  Copyright © 2018 Aelptos. All rights reserved.
//

import Foundation

extension String {
    
    /// Get the localized string for which the current string is the key
    public var localized: String {
        var candidate = NSLocalizedString(self, comment: "")
        if candidate == self {
            // value is the same as key - try to find it in english
            if let path = Bundle.main.path(forResource: "Base", ofType: "lproj"), let bundle = Bundle(path: path) {
                candidate = bundle.localizedString(forKey: self, value: nil, table: nil)
            }
        }
        return candidate
    }
}
