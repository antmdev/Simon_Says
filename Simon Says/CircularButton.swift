//
//  CircularButton.swift
//  Simon Says
//
//  Created by Ant Milner on 02/03/2019.
//  Copyright © 2019 Ant Milner. All rights reserved.
//

import UIKit

class CircularButton: UIButton
{

    override func awakeFromNib()
    {
        layer.cornerRadius = frame.size.width/4 // 2 rounded corners
        layer.masksToBounds = true //no sub layers behind and shape is circular
    }
    
    override var isHighlighted: Bool
        {
        didSet
            {
                if isHighlighted
                {
                    alpha = 1.0
                } else
                {
                    alpha = 0.5
                }
            }
        }

}
