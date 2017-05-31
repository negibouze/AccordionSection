//
//  TappableSectionHeaderView.swift
//  AccordionSection
//
//  Created by Yoshiaki Itakura on 2017/05/31.
//  Copyright © 2017 personal. All rights reserved.
//

import UIKit

protocol TappableSectionHeaderViewDelegate: class {
    /**
     セクション押下時に呼ばれる
     @param view
     @param index セクションのインデックス
     @param isOpen 現在の開閉状態
     */
    func didTap(_ view: TappableSectionHeaderView, _ index: Int, _ isOpen: Bool)
}

class TappableSectionHeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    // 高さ
    static var height: CGFloat { return UIDevice.current.userInterfaceIdiom == .pad ? 52.0 : 40.0 }
    
    var index: Int?
    weak var delegate: TappableSectionHeaderViewDelegate?
    
    private var isOpen: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    func setValues(_ model: SectionModel) {
        setTitle(model.name)
        isOpen = model.isOpen
        arrowRotation(0)
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func disableGesture() {
        arrowImageView.isHidden = true
        for g in self.gestureRecognizers ?? [] {
            self.removeGestureRecognizer(g)
        }
    }
    
    // MARK: - Private Methods
    
    // 準備
    private func setup() {
        self.frame.size = CGSize(width: UIScreen.main.bounds.width, height: TappableSectionHeaderView.height)
        let className = String.className(type(of: self))
        contentView = Bundle.main.loadNibNamed(className, owner: self, options: nil)?.first as! UIView
        contentView.frame = self.bounds
        self.addSubview(contentView)
        addGesture()
        titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    // タップジェスチャを設定する
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    
    // 矢印の回転
    private func arrowRotation(_ duration: TimeInterval) {
        UIView.animate(withDuration: duration,
                       animations: { [weak self] in if let s = self { s.arrowImageView.transform = s.isOpen ? CGAffineTransform.identity : CGAffineTransform(rotationAngle: CGFloat.pi) } },
                       completion: nil)
    }
    
    // タップのハンドリング
    @objc private func handleTap() {
        assert(index != nil)
        delegate?.didTap(self, index!, isOpen)
        isOpen = !isOpen
        arrowRotation(0.3)
    }
}
