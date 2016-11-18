//
//  CountingButton.swift
//  CountingButton
//
//  Created by Yesi on 2016/11/18.
//  Copyright © 2016年 Yesi. All rights reserved.
//

import UIKit

class CountingButton: UIButton {

    var timer: Timer? = nil
    
    var origianlText: String? = nil
    
    let countNum: Int = 3
    
    var currentCount = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        origianlText = self.title(for: .normal)
        currentCount = countNum
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        origianlText = self.title(for: .normal)
        currentCount = countNum
        
    }
    
    func startTimer() {
        self.isEnabled = false
        timer = Timer.init(timeInterval: 1, target: self, selector: #selector(CountingButton.nextCount), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .commonModes)
    }
    
    func endTimer() {
        timer?.invalidate()
        timer = nil
    }
 
    
    @objc private func nextCount() {
        if currentCount > 0 {
            self.setTitle("\(currentCount)s 后重发", for: .normal)
            currentCount -= 1
        }else if currentCount == 0 {
            endTimer()
            self.isEnabled = true
            self.setTitle(origianlText, for: .normal)
            currentCount = countNum
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 当被点击时候
        super.touchesBegan(touches, with: event)
        startTimer()
    }
}
