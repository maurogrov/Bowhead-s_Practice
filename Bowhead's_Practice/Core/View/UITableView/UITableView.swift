//
//  UITableView.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 10/10/21.
//

import UIKit

public class DynamicSizeTableView: UITableView
{
    override public func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            invalidateIntrinsicContentSize()
        }
    }

    override public var intrinsicContentSize: CGSize {
        return contentSize
    }
}
