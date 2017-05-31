//
//  String.swift
//  AccordionSection
//
//  Created by Yoshiaki Itakura on 2017/05/31.
//  Copyright © 2017 personal. All rights reserved.
//

import Foundation

extension String {
    /**
     クラス名文字列取得
     @return クラス名文字列
     */
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}
