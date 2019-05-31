//
//  AppDelegate.swift
//  ReduxTry
//
//  Created by NFlahavan on 3/29/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)

//    let rootViewController = ExampleViewController(nibName: "ExampleViewController", bundle: nil)
//    window?.rootViewController = rootViewController

//    let complexRootViewController = ComplexExampleViewController(nibName: "ComplexExampleViewController", bundle: nil)
//    window?.rootViewController = complexRootViewController

    let tableViewController = TableViewController(nibName: "TableViewController", bundle: nil)
    let navigationController = UINavigationController(rootViewController: tableViewController)

    window?.rootViewController = navigationController

    window?.makeKeyAndVisible()

    return true

  }
}

