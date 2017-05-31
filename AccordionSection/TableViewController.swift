//
//  TableViewController.swift
//  AccordionSection
//
//  Created by Yoshiaki Itakura on 2017/05/31.
//  Copyright © 2017 personal. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    fileprivate var models: [SectionModel] = sections()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard tableView != nil else {
            return
        }
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // MARK: - Private Methods
    
    /**
     準備
     */
    private func setup() {
        setTitle()
        registerCell()
        // 余り分の区切り線を消す
        tableView.tableFooterView = UIView()
        setCustomViewStyle()
    }
    
    private func setTitle() {
        self.title = "AccordionSection"
    }

    private func registerCell() {
        self.tableView.register(Cell.nib(), forCellReuseIdentifier: Cell.identifier)
    }

    private func setCustomViewStyle() {
        tableView.rowHeight = Cell.height
    }
}

// MARK: - UITableViewDataSource
extension TableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].isOpen ? models[section].items.count : 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath)
        let model = models[indexPath.section]
        if let c = cell as? Cell {
            c.setValues(model.items[indexPath.row])
            c.exclusiveTouch(true)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TableViewController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TappableSectionHeaderView.height
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TappableSectionHeaderView()
        header.delegate = self
        header.index = section
        header.setValues(models[section])
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

// TappableSectionHeaderViewDelegate
extension TableViewController: TappableSectionHeaderViewDelegate {
    /**
     セクション押下時に呼ばれる
     @param view
     @param index セクションのインデックス
     @param isOpen 現在の開閉状態
     */
    func didTap(_ view: TappableSectionHeaderView, _ index: Int, _ isOpen: Bool) {
        models[index].isOpen = !isOpen
        if isOpen {
            closeSectionContents(index)
        } else {
            openSectionContents(index)
        }
    }

    /**
     指定セクション配下のコンテンツを開く
     @param sectionIndex セクションのインデックス
     */
    private func openSectionContents(_ index: Int) {
        assert(0..<models.count ~= index)
        let section = models[index]
        self.tableView.insertSectionContents(index, numberOfRows: section.items.count)
    }
    
    /**
     指定セクション配下のコンテンツを閉じる
     @param sectionIndex セクションのインデックス
     */
    private func closeSectionContents(_ index: Int) {
        assert(0..<models.count ~= index)
        let section = models[index]
        self.tableView.deleteSectionContents(index, numberOfRows: section.items.count)
    }
}
