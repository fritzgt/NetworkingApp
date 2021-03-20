//
//  VersionsViewController.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import UIKit

class VersionsViewController: UIViewController {

    //MARK: - Properties
    private let versionsView = VersionsView()
    var data: [XcodeVersion] = [] {
        didSet{
            versionsView.data = data
        }
    }

    override func loadView() {
        view = versionsView
    }
    

}

extension VersionsViewController {

    func render(_ state: VersionsCoordinator.State) {
        // TODO: fill this in as needed during interview, including any desired method params
        versionsView.render(state)
    }
  
}
        
