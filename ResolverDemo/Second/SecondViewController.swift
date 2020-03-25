//
//  SecondViewController.swift
//  ResolverDemo
//
//  Created by Admin on 3/24/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import UIKit
import Swinject

class SecondViewController: UIViewController {

    @IBOutlet weak var messageLbl: UILabel!
    
    var message = ""
    
    let viewModel = Injection.container.resolve(SecondViewModel.self)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let localRepo = viewModel.dataFactory.localRepository
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        messageLbl.text = message
    }
    


}
