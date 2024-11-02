//
//  FontRegistration.swift
//  JustOneThingUI
//
//  Created by Samuel Jones on 11/1/24.
//
import Foundation
import SwiftUI
import OSLog

let log = Logger(subsystem: "codes.samueljones.JustOneThingUI", category: "[UI Package]")

/// Registers all `.ttf` files found in the module bundle for use in the application
public struct FontRegistration {
    
    typealias FontFile = (name: String, ext: String)
    
    /// Locates and registers fonts
    public static func registerFonts() throws {
        // Get font files in bundle
        let fontFiles = try getFontFiles()
        
        // Register fonts
        for font in fontFiles {
            try registerFont(bundle: Bundle.module, fontName: font.name, ext: font.ext)
        }
    }
    
    /// Registers a font provided a bundle and font details
    /// - Parameters:
    ///   - bundle: Bundle name
    ///   - fontName: Name of the font file
    ///   - ext: Extension (accepts ttf only in current version)
    private static func registerFont(bundle: Bundle, fontName: String, ext: String) throws {
        guard ext.lowercased() == "ttf" else {
            throw FontErrors.invalidFileName(fileName: "\(fontName).\(ext)")
        }
        
        guard let fontURL = bundle.url(forResource: fontName, withExtension: ext),
        let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
        let font = CGFont(fontDataProvider)
        else {
            throw FontErrors.creationFailed(fontName: "\(fontName).\(ext)")
        }
        
        var error: Unmanaged<CFError>?
        
        guard CTFontManagerRegisterGraphicsFont(font, &error) else {
            throw FontErrors.registrationFailed(fontName: fontName)
        }
        log.debug("Registered font: \(font.fullName)")
    }
    
    /// Get array of font files located in the bundle
    /// - Returns: Array of tuples each containing a file name and extension
    private static func getFontFiles() throws -> [FontFile] {
        let fileManager = FileManager.default
        
        guard let path = Bundle.module.resourcePath else {
            throw FontErrors.directoryNotFound
        }
        
        let bundledFiles = try fileManager.contentsOfDirectory(atPath: path)
        let fontFiles = bundledFiles.filter { $0.hasSuffix(".ttf")}
        let fileAndExtNames: [FontFile] = try fontFiles.compactMap { fontFile in
            let components = fontFile.split(separator: ".").map(String.init)
            guard components.count == 2 else {
                throw FontErrors.invalidFileName(fileName: fontFile)
            }
            return (name: components[0], ext: components[1])
        }
        
        return fileAndExtNames
    }
    
    enum FontErrors: Error {
        case creationFailed(fontName: String)
        case registrationFailed(fontName: String)
        case directoryNotFound
        case invalidFileName(fileName: String)
    }
    
}

