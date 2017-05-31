//
//  Cell.swift
//  AccordionSection
//
//  Created by Yoshiaki Itakura on 2017/06/01.
//  Copyright © 2017 personal. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    static var nibName: String { return "Cell" }
    static var identifier: String { return "cell" }
    static var height: CGFloat { return UIDevice.current.userInterfaceIdiom == .pad ? 60.0 : 40.0 }

    static func nib() -> UINib {
        return UIView.nib(nibName)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.adjustsFontSizeToFitWidth = true
    }

    func setValues(_ model: ItemModel) {
        titleLabel.text = model.name
    }

    func exclusiveTouch(_ exclusive: Bool) {
        self.isExclusiveTouch = exclusive
        contentView.isExclusiveTouch = exclusive
    }
}
