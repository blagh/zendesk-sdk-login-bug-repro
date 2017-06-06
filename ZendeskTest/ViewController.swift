//
//  ViewController.swift
//  ZendeskTest
//
//  Created by Hannele Kormano on 2017-06-06.
//  Copyright © 2017 Hannele Kormano. All rights reserved.
//

import UIKit
import ZendeskSDK

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        clearUserDefaults()
    }

    @IBAction func openHelpCenter(_ sender: Any) {
        guard let nav = navigationController else { return }

        let identity = ZDKAnonymousIdentity()
        identity.email = emailTextField.text
        identity.name = nameTextField.text
        ZDKConfig.instance().userIdentity = identity

        print("Identity setup: \(ZDKConfig.instance().userIdentity.toJson())")

        let helpCenter = ZDKHelpCenterOverviewContentModel.defaultContent()
        ZDKHelpCenter.pushOverview(nav, with: helpCenter)
    }

    func clearUserDefaults() {
        guard let applicationDomain = Bundle.main.bundleIdentifier else {
            return
        }

        UserDefaults.standard.removePersistentDomain(forName: applicationDomain)
        UserDefaults.standard.synchronize()
    }
}

