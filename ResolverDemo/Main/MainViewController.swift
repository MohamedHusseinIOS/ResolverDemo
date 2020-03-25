//
//  ViewController.swift
//  ResolverDemo
//
//  Created by Admin on 3/23/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import UIKit
import Swinject
import RxSwift

class MainViewController: UIViewController {


    let viewModel = Injection.container.resolve(MainViewModel.self)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cloudBtnTapped(_ sender: UIButton) {
        let message = viewModel.dataFactory.remoteRepository.getOnlineMessage()
        guard let vc = UINib(nibName: "SecondViewController", bundle: .main).instantiate(withOwner: nil, options: nil)[0] as? SecondViewController else { return }
        vc.message = message
        self.navigationController?.pushViewController( vc, animated: true)
    }
    
    @IBAction func localBtnTapped(_ sender: UIButton) {
        let message = viewModel.dataFactory.localRepository.getLocalMessage()
        guard let vc = UINib(nibName: "SecondViewController", bundle: .main).instantiate(withOwner: nil, options: nil)[0] as? SecondViewController else { return }
        vc.message = message
        self.navigationController?.pushViewController( vc, animated: true)
        
    }
}

