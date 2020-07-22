//
//  CinemaTableViewCell.swift
//  Task 2.1
//
//  Created by Dynamo Software on 10.07.20.
//  Copyright © 2020 Dynamo Software. All rights reserved.
//

import UIKit

protocol CinemaTableViewCellDelegate: class {
    func didTapFrom(cell: CinemaTableViewCell)
}

class CinemaTableViewCell: UITableViewCell {

    

    
    weak var delegate: CinemaTableViewCellDelegate?
    
    @IBOutlet weak var cinemaImg: UIImageView!
    @IBOutlet weak var workingHours: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with cinema: Cinema) {
        cinemaImg.image = cinema.picture
        workingHours.text = cinema.workingHours
        title.text = cinema.title
    }
    
    @IBAction func didTapOnInfo(_ sender: Any) {
        delegate?.didTapFrom(cell: self)
    }

    @IBAction func didTapOnProgram(_ sender: Any) {
        delegate?.didTapFrom(cell: self)
    }
    
}
