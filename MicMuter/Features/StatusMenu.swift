//
//  StatusMenu.swift
//  MicMuter
//
//  Created by Yonic Surny on 17/04/2018.
//  Copyright © 2018 Aelptos. All rights reserved.
//

import Cocoa

protocol StatusMenuDelegate: class {
    func statusMenuShouldOpenAbout(_ menu: StatusMenu)
}

class StatusMenu: NSMenu {
    weak var statusMenuDelegate: StatusMenuDelegate?
    
    override init(title: String) {
        super.init(title: title)
        commonInit()
    }
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
        commonInit()
    }
    
    private func commonInit() {
        let aboutItem = NSMenuItem(title: Localizable.about_action.localized, action: #selector(onAboutItemClick(_:)), keyEquivalent: "")
        aboutItem.target = self
        addItem(aboutItem)
        
        let quitItem = NSMenuItem(title: Localizable.quit_action.localized, action: #selector(onQuitItemClick(_:)), keyEquivalent: "")
        quitItem.target = self
        addItem(quitItem)
    }
}

// MARK: - Actions
extension StatusMenu {
    
    /// Handle 'About' menu item click
    @IBAction private func onAboutItemClick(_ sender: NSMenuItem) {
        statusMenuDelegate?.statusMenuShouldOpenAbout(self)
    }
    
    /// Handle 'Quit' menu item click
    @IBAction private func onQuitItemClick(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
}
