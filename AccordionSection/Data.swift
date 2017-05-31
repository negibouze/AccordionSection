//
//  Data.swift
//  AccordionSection
//
//  Created by Yoshiaki Itakura on 2017/06/01.
//  Copyright © 2017 personal. All rights reserved.
//

import Foundation

func sections() -> [SectionModel] {
    let data = ["Section1", "Section2", "Section3"]
    return data.map { v in
        let section = SectionModel(name: v, items: items())
        return section
    }
}

private func items() -> [ItemModel] {
    let data = ["Content1", "Content2", "Content3", "Content4", "Content5"]
    return data.map { v in
        let item = ItemModel(name: v)
        return item
    }
}
