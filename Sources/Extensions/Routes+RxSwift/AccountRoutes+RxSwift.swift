//
//  AccountRoutes+RxSwift.swift
//  
//
//  Created by lgriffie on 06/04/2021.
//

import Alamofire
import Foundation
import HubkitModel
import HubkitServiceApi
import Offenbach
import RxSwift

extension Account {
    /// Get the current authenticated user
    public static func me() -> Single<Self> {
        Single<Self>.create(subscribe: { single in
            let request = me { (result: Result<Self, AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }
}
