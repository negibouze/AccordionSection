//
//  SectionModel.swift
//  AccordionSection
//
//  Created by Yoshiaki Itakura on 2017/05/31.
//  Copyright © 2017 personal. All rights reserved.
//

import Foundation

struct SectionModel {
    // 名前
    var name: String { return _name }
    // アイテム
    var items: [ItemModel] { return _items }
    // セクションの開閉状態
    var isOpen: Bool = true

    private let _name: String
    private let _items: [ItemModel]

    init(name: String, items: [ItemModel]) {
        self._name = name
        self._items = items
    }
}
