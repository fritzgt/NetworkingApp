//
//  VersionsView.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import UIKit


class VersionsView: UIView {
    
    //MARK: - Properties
    private let spinner = UIActivityIndicatorView(style: .medium)
    private let tableView = UITableView()
    private let textLabel = UILabel()
    private let cell = UITableViewCell()
    var data: [XcodeVersion] = []{
        didSet{
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func setupUI() {
        setupTable()
        setupCell()
        setupSpinner()
        setupTextLabel()
        setupStyling()
    }
    
    private func setupTable() {
        tableView.dataSource = self
        addSubviewAndEdgeConstraints(tableView)
    }
    
    private func setupCell(){
        tableView.register(VersionTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupSpinner() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        addSubview(spinner)
        addConstraints([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupTextLabel() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        addConstraints([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupStyling() {
        backgroundColor = .white
        spinner.backgroundColor = .clear
        tableView.backgroundColor = .clear
        textLabel.backgroundColor = .clear
    }
    
}

//MARK: - VersionsView
extension VersionsView {
    
    func render(_ currentState: VersionsCoordinator.State) {
        
        DispatchQueue.main.async {
            switch currentState {
            case .loading:
                self.textLabel.text = ""
                self.spinner.startAnimating()
            case .success:
                self.textLabel.text = ""
                self.spinner.stopAnimating()
            case .failure:
                self.textLabel.text = "Failure."
                self.spinner.stopAnimating()
            default:
                self.textLabel.text = ""
                self.spinner.stopAnimating()
            }
        }
    }
    
    
}

//MARK: - UITableViewDataSource

extension VersionsView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? VersionTableViewCell else{return UITableViewCell()}
        
        let version = data[indexPath.row]
        
        cell.version = version
        
        return cell
    }
    
    
}
