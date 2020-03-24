//
//  ViewController.swift
//  ResolverDemo
//
//  Created by Admin on 3/23/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import UIKit
import Resolver

class MainViewController: UIViewController {

    @IBOutlet weak var cloudBtn: UIButton!
    @IBOutlet weak var localBtn: UIButton!
    
    let viewModel = Resolver.resolve(MainViewModel.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

