//
//  menubarToolsApp.swift
//  menubarTools
//
//  Created by qcl on 2021/12/15.
//

import SwiftUI

@main
struct menubarToolsApp: App {
    @NSApplicationDelegateAdaptor(AppMenuDelegate.self) var delegate
    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
        
        // 无窗口应用
        Settings {
            ContentView()
        }
    }
}



// 气泡状态栏
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var popOver = NSPopover()
    func applicationDidFinishLaunching(_ notification: Notification) {
        let menuView = ContentView()
        
        popOver.behavior = .transient
        popOver.animates = true
        popOver.contentSize = NSSize(width: 200, height: 500)
        
        popOver.contentViewController = NSViewController()
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        // Create the status bar item
        statusItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        if let menuButton = statusItem?.button {
            menuButton.image = NSImage(systemSymbolName: "dial.max", accessibilityDescription: nil)
            menuButton.action = #selector(menuButtonToggle)
        }
    }
    
    @objc func menuButtonToggle() {
        if let menuButton = statusItem?.button {
            self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
        }
    }
}


// 按钮状态栏
class AppMenuDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var menu = NSMenu()
    func applicationDidFinishLaunching(_ notification: Notification) {
        // 状态栏图标
        statusItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        if let menuButton = statusItem?.button {
            menuButton.image = NSImage(systemSymbolName: "dial.max", accessibilityDescription: nil)
           // menuButton.title = "\t\ttool"
           // menuButton.frame = CGRect(x: 0, y: 0, width: 20, height: 15)
           // menuButton.action = #selector(showAbout)
        }
        
        
        let abouteMenu = NSMenuItem(title: "关于", action: #selector(showAbout), keyEquivalent: "a")
        menu.addItem(abouteMenu)
        
        let openWebMenu = NSMenuItem(title: "跳转", action: #selector(showAbout), keyEquivalent: "w")
        menu.addItem(openWebMenu)
        
        let openAppMenu = NSMenuItem(title: "打开App", action: #selector(showAbout), keyEquivalent: "a")
        menu.addItem(openAppMenu)
        
        statusItem?.menu = menu
        
    }
    
    @objc func showAbout() {
        NSLog("关于%s", "我")
    }
}




