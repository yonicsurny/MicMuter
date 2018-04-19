//
//  StatusView.swift
//  MicMuter
//
//  Created by Yonic Surny on 17/04/2018.
//  Copyright © 2018 Aelptos. All rights reserved.
//

import Cocoa

protocol StatusViewDelegate: class {
    func statusViewShouldOpenMenu(_ view: StatusView)
}

class StatusView: NSView {
    weak var delegate: StatusViewDelegate?
    
    override func draw(_ dirtyRect: NSRect) {
        guard let image = currentButtonImage else { return }
        let rect = NSRect(x: (dirtyRect.size.width / 2.0) - (image.size.width / 2.0),
                          y: (dirtyRect.size.height / 2.0) - (image.size.height / 2.0),
                          width: image.size.width,
                          height: image.size.height)
        image.draw(in: rect, from: .zero, operation: .sourceOver, fraction: 1.0)
    }
}

extension StatusView {
    
    /// Handle left mouse button click (toggles (un)muted state)
    override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
        MicrophoneService.toggleMute()
        setNeedsDisplay(bounds)
    }
    
    /// Handle right mouse button click (presents menu)
    override func rightMouseDown(with event: NSEvent) {
        super.rightMouseDown(with: event)
        delegate?.statusViewShouldOpenMenu(self)
    }
}

extension StatusView {
    
    /// Get the current image to display (based on mute state and theme)
    private var currentButtonImage: NSImage? {
        if MicrophoneService.isMuted {
            return NSImage(named: ThemeService.isInDarkMode ? .micOffWhite : .micOffBlack)
        }
        return NSImage(named: ThemeService.isInDarkMode ? .micOnWhite : .micOnBlack)
    }
}
