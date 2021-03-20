//
//  VersionTableViewCell.swift
//  NetworkingApp
//
//  Created by FGT MAC on 3/20/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import UIKit

class VersionTableViewCell: UITableViewCell {

    var version : XcodeVersion? {
    didSet {
 
        versionNameLabel.text = "Version: \(version!.version.number)"
    }
    }
    
    
    private let versionNameLabel : UILabel = {
    let lbl = UILabel()
    lbl.textColor = .black
    lbl.font = UIFont.boldSystemFont(ofSize: 24)
    lbl.textAlignment = .center
    return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

 
        addSubviewAndEdgeConstraints(versionNameLabel)

}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
