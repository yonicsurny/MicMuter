//
//  AboutWindow.swift
//  MicMuter
//
//  Created by Yonic Surny on 17/04/2018.
//  Copyright © 2018 Aelptos. All rights reserved.
//

import Cocoa

class AboutWindow: NSWindow {
    
    @IBOutlet private weak var textViewCredits: NSTextView!
    @IBOutlet private weak var textFieldName: NSTextField!
    @IBOutlet private weak var textFieldVersion: NSTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            textFieldName.stringValue = name
        }
        
        if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String,
            let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String {
            textFieldVersion.stringValue = String(format: Localizable.version_format.localized, version, build)
        }
        
        textViewCredits.string = Localizable.about_text.localized
        // enable links
        textViewCredits.isEditable = true
        textViewCredits.checkTextInDocument(nil)
        textViewCredits.isEditable = false
    }
}
