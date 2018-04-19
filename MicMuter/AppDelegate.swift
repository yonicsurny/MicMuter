//
//  AppDelegate.swift
//  MicMuter
//
//  Created by Yonic Surny on 16/04/2018.
//  Copyright © 2018 Aelptos. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet private weak var aboutWindow: NSWindow!
    
    private var menu = StatusMenu(title: "")
    private var statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    
    // MARK: - Lifecycle
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        setupViews()
    }
}

// MARK: - Private
extension AppDelegate {
    
    private func setupViews() {
        let view = StatusView()
        view.delegate = self
        statusItem.view = view
        menu.statusMenuDelegate = self
    }
}

// MARK: - StatusViewDelegate
extension AppDelegate: StatusViewDelegate {
    
    func statusViewShouldOpenMenu(_ view: StatusView) {
        statusItem.popUpMenu(menu)
    }
}

// MARK: - StatusMenuDelegate
extension AppDelegate: StatusMenuDelegate {
    
    func statusMenuShouldOpenAbout(_ menu: StatusMenu) {
        guard !aboutWindow.isVisible else { return }
        aboutWindow.center()
        let controller = NSWindowController(window: aboutWindow)
        aboutWindow.level = .floating // above all
        controller.showWindow(self)
    }
}
