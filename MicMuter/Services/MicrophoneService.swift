//
//  MicrophoneService.swift
//  MicMuter
//
//  Created by Yonic Surny on 16/04/2018.
//  Copyright © 2018 Aelptos. All rights reserved.
//

import Cocoa

struct MicrophoneService {
    
    /// Get whether the microphone is muted
    ///
    /// We consider the microphone to be muted if its volume is set to 0
    static var isMuted: Bool {
        return NSAppleScript(source: "return input volume of (get volume settings)")?.executeAndReturnError(nil).int32Value == 0
    }
    
    /// Toggle microphone mute state
    ///
    /// To mute we set the volume to 0
    /// To unmute we set the volume to 100
    static func toggleMute() {
        let volume = MicrophoneService.isMuted ? 100 : 0
        NSAppleScript(source: "set volume input volume \(volume)")?.executeAndReturnError(nil)
    }
}
