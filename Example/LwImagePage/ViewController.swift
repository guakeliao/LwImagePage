//
//  ViewController.swift
//  LwImagePage
//
//  Created by guakeliao on 03/18/2020.
//  Copyright (c) 2020 guakeliao. All rights reserved.
//

import UIKit
import LwImagePage

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let ss = LwPageView()
        for _ in 0...100{
            ss.imageDatas.append(#imageLiteral(resourceName: "banner2"))
            ss.imageDatas.append(#imageLiteral(resourceName: "banner0"))
            ss.imageDatas.append(#imageLiteral(resourceName: "banner1"))
        }

        ss.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ss)
        NSLayoutConstraint.activate([
            ss.leftAnchor.constraint(equalTo: view.leftAnchor),
            ss.rightAnchor.constraint(equalTo: view.rightAnchor),
            ss.topAnchor.constraint(equalTo: view.topAnchor),
            ss.heightAnchor.constraint(equalToConstant: 200),
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

