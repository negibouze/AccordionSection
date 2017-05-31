//
//  ItemModel.swift
//  AccordionSection
//
//  Created by Yoshiaki Itakura on 2017/06/01.
//  Copyright © 2017 personal. All rights reserved.
//

import Foundation

struct ItemModel {
    // 名前
    var name: String { return _name }

    private let _name: String

    init(name: String) {
        _name = name
    }
}
