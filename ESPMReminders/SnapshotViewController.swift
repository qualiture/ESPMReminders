//
// SnapshotViewController.swift
// ESPMReminders
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 11/11/17
//

import Foundation
import UIKit

// This ViewController is used as a snapshot screen when the app is put to the background
class SnapshotViewController: UIViewController {

    private var imageView: UIImageView!

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white

        let sapLogo = UIImage(named: "SAPLogo.png")!
        self.imageView = UIImageView(image: sapLogo)
        self.imageView.center = self.view.center

        self.view.addSubview(imageView)
    }
}
