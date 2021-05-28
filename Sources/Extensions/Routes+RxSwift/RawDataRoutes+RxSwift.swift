//
//  RawDataRoutes+RxSwift.swift
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

extension RawData {
    /// Create a new session raw data
    public static func create(in session: HubkitModel.Session,
                              _ device: Device,
                              _ file: MultiPart,
                              progress: @escaping (Double) -> Void) -> Single<Self> {
        Single<Self>.create(subscribe: { single in
            let request = create(in: session, device, file, progress: progress) { (result: Result<Self, AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }

    /// Get the raw data for the given identifier
    public static func get(with identifier: String) -> Single<Self> {
        Single<Self>.create(subscribe: { single in
            let request = get(with: identifier) { (result: Result<Self, AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }
}
