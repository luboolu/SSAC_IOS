//
//  LottoViewModel.swift
//  CLASS_WEEK14
//
//  Created by 김진영 on 2021/12/28.
//

import UIKit

class LottoViewModel {
    
    var lotto1 = Observable(3)
    var lotto2 = Observable(10)
    var lotto3 = Observable(33)
    var lotto4 = Observable(34)
    var lotto5 = Observable(12)
    var lotto6 = Observable(11)
    var lotto7 = Observable(44)
    var lottoMoney: Observable<String> = Observable("")
    
    func fetchLottoAPI(_ number: Int) {
        
        APIService.lotto(number) { lotto, error in
            
            guard let lotto = lotto else {
                return
            }
            
            self.lotto1.value = lotto.drwtNo1
            self.lotto2.value = lotto.drwtNo2
            self.lotto3.value = lotto.drwtNo3
            self.lotto4.value = lotto.drwtNo4
            self.lotto5.value = lotto.drwtNo5
            self.lotto6.value = lotto.drwtNo6
            self.lotto7.value = lotto.bnusNo
            self.lottoMoney.value = self.format(for: lotto.firstWinamnt)  //300,000,000이런 형식
            
            

        }
        
    }
    
    func format(for number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: number)!
        
        return result
    }
    
}
