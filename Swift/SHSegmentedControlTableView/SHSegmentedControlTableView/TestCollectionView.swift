//
//  TestCollectionView.swift
//  SHSegmentedControlTableView
//
//  Created by angle on 2018/1/30.
//  Copyright © 2018年 angle. All rights reserved.
//

import UIKit

import SHSegmentedControl

class TestCollectionView: SHCollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    open var num:NSInteger = 0
    
    
    class open func collectionView(frame: CGRect) -> Any {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsetsMake(10, 16, 10, 16)
        let collectionView = TestCollectionView.init(frame: frame, collectionViewLayout: layout)
        return collectionView
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = UIColor.white
        self.dataSource = self
        self.delegate = self
        self.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        self.allowsSelection = false
    }
    open func setNum(num: NSInteger) {
        self.num = num;
        self.reloadData()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getArcDomColor() -> UIColor {
        let colors:NSArray = [UIColor.brown,
                              UIColor.gray,
                              UIColor.red,
                              UIColor.green,
                              UIColor.blue,
                              UIColor.cyan,
                              UIColor.yellow,
                              UIColor.magenta,
                              UIColor.orange,
                              UIColor.purple]
        
        let color:UIColor = colors.object(at: Int(arc4random()%UInt32(colors.count))) as! UIColor
        
        return color
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.num
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = self.getArcDomColor()
        return cell
    }
}
