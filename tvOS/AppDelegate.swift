//
//  AppDelegate.swift
//  tvOS
//  http://www.raywenderlich.com/114886/beginning-tvos-development-with-tvml-tutorial
//  Created by Terry Wang on 12/3/15.
//  Copyright © 2015 Accenture. All rights reserved.
//

import UIKit
import TVMLKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {

    var window: UIWindow?
    var appController: TVApplicationController?
    static let TVBaseURL = "http://localhost:9001/"
    //static let TVBaseURL = "https://www.dropbox.com/sh/lndux66gcs893qh/AAAMJKQEl_3Ha4PRIvKzWZepa?dl=0/"
    static let TVBootURL = "\(AppDelegate.TVBaseURL)js/application.js"
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // 1 you create a TVApplicationControllerContext, which you will use to initialize your TVApplicationController. Think of this as a simple object you fill with information such as the URL of your server.
        let appControllerContext = TVApplicationControllerContext()
        
        // 2 You fill the context with two bits of information: the path to your main Javascript file, and the root directory of your server.
        guard let javaScriptURL = NSURL(string: AppDelegate.TVBootURL) else {
            fatalError("unable to create NSURL")
        }
        appControllerContext.javaScriptApplicationURL = javaScriptURL
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseURL
        
        // 3 This starts up the TVApplicationController with the context you configured. At this point, Apple’s code takes over – it will pull down your root Javascript file and begin executing it.
        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
        return true
    }

    

}

