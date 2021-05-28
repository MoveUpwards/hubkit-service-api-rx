//
//  ActivityRoutes+RxSwift.swift
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

extension Activity {
    /// Get the current authenticated user
    public static func all() -> Single<[Self]> {
        Single<[Self]>.create(subscribe: { single in
            let request = all { (result: Result<[Self], AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }

    /// Get the activity for the given identifier
    public static func get(with identifier: String) -> Single<Self> {
        Single<Self>.create(subscribe: { single in
            let request = get(with: identifier) { (result: Result<Self, AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }
}
