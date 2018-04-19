//
//  ThemeService.swift
//  MicMuter
//
//  Created by Yonic Surny on 16/04/2018.
//  Copyright © 2018 Aelptos. All rights reserved.
//

import Foundation

struct ThemeService {
    
    /// Get whether the dark mode is enabled
    static var isInDarkMode: Bool {
        guard let setting = UserDefaults.standard.object(forKey: "AppleInterfaceStyle") as? String else { return false }
        return setting.lowercased() == "dark"
    }
}
