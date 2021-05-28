//
//  SessionRoutes+RxSwift.swift
//  
//
//  Created by lgriffie on 06/04/2021.
//

import Alamofire
import Foundation
import HubkitModel
import HubkitApi
import Offenbach
import RxSwift

extension HubkitModel.Session {
    /// Create a new session
    public static func create(in project: Project,
                              _ metas: [String: Any] = [:],
                              _ capturedAt: Date) -> Single<Self> {
        Single<Self>.create(subscribe: { single in
            let request = create(in: project, metas, capturedAt) { (result: Result<Self, AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }

    /// Get the session for the given identifier
    public static func get(with identifier: String) -> Single<Self> {
        Single<Self>.create(subscribe: { single in
            let request = get(with: identifier) { (result: Result<Self, AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }

    /// Change a session state to ready
    public func ready() -> Single<Self> {
        Single<Self>.create(subscribe: { single in
            let request = ready { (result: Result<Self, AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }
}
