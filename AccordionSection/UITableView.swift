//
//  UITableView.swift
//  AccordionSection
//
//  Created by Yoshiaki Itakura on 2017/05/31.
//  Copyright © 2017 personal. All rights reserved.
//

import UIKit

extension UITableView {
    /**
     指定セクション配下のIndexPathを返す
     @param section 対象セクション
     @param numberOfRows セクション配下の要素数
     */
    func indexPathsForRowsInSection(_ section: Int, numberOfRows: Int) -> [IndexPath] {
        return (0..<numberOfRows).map{ IndexPath(row: $0, section: section) }
    }

    /**
     指定セクション配下にコンテンツを挿入する
     @param section 対象セクション
     @param numberOfRows セクション配下の要素数
     */
    func insertSectionContents(_ section: Int, numberOfRows: Int) {
        let indexPaths: [IndexPath] = self.indexPathsForRowsInSection(section, numberOfRows: numberOfRows)
        self.beginUpdates()
        self.insertRows(at: indexPaths, with: UITableViewRowAnimation.fade)
        self.endUpdates()
    }

    /**
     指定セクション配下のコンテンツを削除する
     @param section 対象セクション
     @param numberOfRows セクション配下の要素数
     */
    func deleteSectionContents(_ section: Int, numberOfRows: Int) {
        let indexPaths: [IndexPath] = self.indexPathsForRowsInSection(section, numberOfRows: numberOfRows)
        self.beginUpdates()
        self.deleteRows(at: indexPaths, with: UITableViewRowAnimation.fade)
        self.endUpdates()
    }

    /**
     単一セクションのリロード
     @param section 対象のセクション
     @param with アニメーション
     */
    func reloadSection(_ section: Int, _ with: UITableViewRowAnimation = .none) {
        // セルのちらつき防止
        UIView.setAnimationsEnabled(false)
        self.reloadSections(IndexSet(integer: section), with: with)
        UIView.setAnimationsEnabled(true)
    }
}
