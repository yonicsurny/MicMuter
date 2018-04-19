//
//  NSImage+MicMuter.swift
//  MicMuter
//
//  Created by Yonic Surny on 16/04/2018.
//  Copyright © 2018 Aelptos. All rights reserved.
//

import Cocoa

extension NSImage.Name {
    
    static var micOnBlack: NSImage.Name {
        return .init(rawValue: "mic-on-black")
    }
    
    static var micOnWhite: NSImage.Name {
        return .init(rawValue: "mic-on-white")
    }
    
    static var micOffBlack: NSImage.Name {
        return .init(rawValue: "mic-off-black")
    }
    
    static var micOffWhite: NSImage.Name {
        return .init(rawValue: "mic-off-white")
    }
}
