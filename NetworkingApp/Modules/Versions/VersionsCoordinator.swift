//
//  VersionsCoordinator.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import UIKit

 
class VersionsCoordinator {

    enum State {
        case idle
        case loading
        case success
        case failure
    }
    
    //MARK: - Properties
    private let versionsService = XcodeVersionsService()
    private let networkCallAPI = NetworkCallAPI()
    private let viewController = VersionsViewController()
 
    
    private var state: State = .idle {
        didSet {
            // TODO: fill this in as needed during interview
            viewController.render(state)
        }
    }

    var rootViewController: UIViewController {
        viewController
    }

    func start() {
        // TODO: fill this in as needed during interview, including any desired method params
        
        //Show state loading
        state = .loading
        print("Loading")
//        networkCallAPI.fetchVersionsFromServer { [weak self ](data) in//Network call
        versionsService.fetchVersions { [weak self ](data) in // Local data call
            guard let self = self else {return}
            
            guard let data = data else {
                //if data is nil trigger failure
                self.state = .failure
                return
            }
            //Pass the data to be render
            self.viewController.data = data
            //Show state success
            self.state = .success
            print("Success")
        }
    }
    
    

}
