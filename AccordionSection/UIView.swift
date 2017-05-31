//
//  UIView.swift
//  AccordionSection
//
//  Created by Yoshiaki Itakura on 2017/06/01.
//  Copyright © 2017 personal. All rights reserved.
//

import UIKit

// MARK: - Load From Nib
extension UIView {
    
    class func nib(_ nibName: String) -> UINib {
        return UINib.init(nibName: nibName, bundle: nil)
    }
}
