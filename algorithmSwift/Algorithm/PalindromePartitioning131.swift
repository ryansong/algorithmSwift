//
//  PalindromePartitioning131.swift
//  algorithmSwift
//
//  Created by xiaomingsong on 10/24/19.
//  Copyright © 2019 xiaomingsong. All rights reserved.
//

import UIKit

class PalindromePartitioning131: NSObject {

    private var mapResult:[[Int]]?
    func partition(_ s:String) -> [[String]]? {
        mapResult = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
        return partition(s, from: 0, to: s.count-1);
    }
   private func partition(_ s:String, from left:Int, to right:Int ) -> [[String]]? {
    
    var res:[[String]] = [[String]]()
        
    for m in left..<right {
            if (ispartition(s,from: left,to: m)) {
                let curString = subString(s, from: left,to: m)
                if let substringList = partition(s, from: m+1, to: right) {
                    if  substringList.count > 0 {
                        for stringList in substringList {
                            var stringCop = stringList
                            stringCop.insert(String(curString), at: 0)
                            res.append(stringCop)
                        }
                    }
                }
            }
        }
    if ispartition(s, from: left, to: right) {
        res.append([subString(s, from: left,to: right)])
    }
    
    return (res.count > 0) ?res:nil
    }
    
    private func subString(_ s:String, from left:Int, to right:Int ) -> String {
        let index = s.index(s.startIndex, offsetBy: left)
        let endIndex = s.index(s.startIndex, offsetBy:right)
        let substring = String(s[index...endIndex])
        return substring
    }
    
    private func ispartition(_ s:String, from left:Int, to right:Int ) -> Bool {
        if (mapResult?[left][right] == 0) {
            
            if left == right {
                mapResult?[left][right] = 1;
                return true;
            }
            
            var l = left, r = right;
            
            while l < r {
                if (s[s.index(s.startIndex, offsetBy: l)] != s[s.index(s.startIndex, offsetBy: r)]) {
                    mapResult?[left][right] = -1;
                    return false;
                }
                l = l+1;
                r = r-1;
            }
            mapResult?[left][right] = 1;
            return true;
        }
        
        return mapResult?[left][right] == 1;
    }
}
