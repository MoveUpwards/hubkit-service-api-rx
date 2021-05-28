//
//  DeviceRoutes+RxSwift.swift
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

extension Device {
    /// Create a new device
    public func create() -> Single<Self> {
        Single<Self>.create(subscribe: { single in
            let request = create { (result: Result<Self, AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }

    /// Get the device for the given identifier
    public static func get(with identifier: String) -> Single<Self> {
        Single<Self>.create(subscribe: { single in
            let request = get(with: identifier) { (result: Result<Self, AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }

    /// Update a device
    public func update(_ parameters: [String: String]) -> Single<Self> {
        Single<Self>.create(subscribe: { single in
            let request = update(parameters) { (result: Result<Self, AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }

    /// Get the activity for the given identifier
    public func activate() -> Single<Self> {
        Single<Self>.create(subscribe: { single in
            let request = activate { (result: Result<Self, AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }
}
