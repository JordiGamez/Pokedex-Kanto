// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0


import SwiftyMocky
import XCTest
import Foundation
import Combine
@testable import Pokedex


// MARK: - GetPokemonDetailInteractor

open class GetPokemonDetailInteractorMock: GetPokemonDetailInteractor, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(id: String) -> AnyPublisher<PokemonDetail, PokemonDetailError> {
        addInvocation(.m_execute__id_id(Parameter<String>.value(`id`)))
		let perform = methodPerformValue(.m_execute__id_id(Parameter<String>.value(`id`))) as? (String) -> Void
		perform?(`id`)
		var __value: AnyPublisher<PokemonDetail, PokemonDetailError>
		do {
		    __value = try methodReturnValue(.m_execute__id_id(Parameter<String>.value(`id`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(id: String). Use given")
			Failure("Stub return value not specified for execute(id: String). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__id_id(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__id_id(let lhsId), .m_execute__id_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__id_id(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__id_id: return ".execute(id:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(id: Parameter<String>, willReturn: AnyPublisher<PokemonDetail, PokemonDetailError>...) -> MethodStub {
            return Given(method: .m_execute__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(id: Parameter<String>, willProduce: (Stubber<AnyPublisher<PokemonDetail, PokemonDetailError>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<PokemonDetail, PokemonDetailError>] = []
			let given: Given = { return Given(method: .m_execute__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<PokemonDetail, PokemonDetailError>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(id: Parameter<String>) -> Verify { return Verify(method: .m_execute__id_id(`id`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(id: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_execute__id_id(`id`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetPokemonListInteractor

open class GetPokemonListInteractorMock: GetPokemonListInteractor, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(region: PokemonRegion) -> AnyPublisher<[Pokemon], PokemonError> {
        addInvocation(.m_execute__region_region(Parameter<PokemonRegion>.value(`region`)))
		let perform = methodPerformValue(.m_execute__region_region(Parameter<PokemonRegion>.value(`region`))) as? (PokemonRegion) -> Void
		perform?(`region`)
		var __value: AnyPublisher<[Pokemon], PokemonError>
		do {
		    __value = try methodReturnValue(.m_execute__region_region(Parameter<PokemonRegion>.value(`region`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(region: PokemonRegion). Use given")
			Failure("Stub return value not specified for execute(region: PokemonRegion). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__region_region(Parameter<PokemonRegion>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__region_region(let lhsRegion), .m_execute__region_region(let rhsRegion)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsRegion, rhs: rhsRegion, with: matcher), lhsRegion, rhsRegion, "region"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__region_region(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__region_region: return ".execute(region:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(region: Parameter<PokemonRegion>, willReturn: AnyPublisher<[Pokemon], PokemonError>...) -> MethodStub {
            return Given(method: .m_execute__region_region(`region`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(region: Parameter<PokemonRegion>, willProduce: (Stubber<AnyPublisher<[Pokemon], PokemonError>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Pokemon], PokemonError>] = []
			let given: Given = { return Given(method: .m_execute__region_region(`region`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Pokemon], PokemonError>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(region: Parameter<PokemonRegion>) -> Verify { return Verify(method: .m_execute__region_region(`region`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(region: Parameter<PokemonRegion>, perform: @escaping (PokemonRegion) -> Void) -> Perform {
            return Perform(method: .m_execute__region_region(`region`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - PokemonRepository

open class PokemonRepositoryMock: PokemonRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getPokemonList(region: PokemonRegion) -> AnyPublisher<PokemonListEntity, DataError> {
        addInvocation(.m_getPokemonList__region_region(Parameter<PokemonRegion>.value(`region`)))
		let perform = methodPerformValue(.m_getPokemonList__region_region(Parameter<PokemonRegion>.value(`region`))) as? (PokemonRegion) -> Void
		perform?(`region`)
		var __value: AnyPublisher<PokemonListEntity, DataError>
		do {
		    __value = try methodReturnValue(.m_getPokemonList__region_region(Parameter<PokemonRegion>.value(`region`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getPokemonList(region: PokemonRegion). Use given")
			Failure("Stub return value not specified for getPokemonList(region: PokemonRegion). Use given")
		}
		return __value
    }

    open func getPokemonDetail(id: String) -> AnyPublisher<PokemonDetailEntity, DataError> {
        addInvocation(.m_getPokemonDetail__id_id(Parameter<String>.value(`id`)))
		let perform = methodPerformValue(.m_getPokemonDetail__id_id(Parameter<String>.value(`id`))) as? (String) -> Void
		perform?(`id`)
		var __value: AnyPublisher<PokemonDetailEntity, DataError>
		do {
		    __value = try methodReturnValue(.m_getPokemonDetail__id_id(Parameter<String>.value(`id`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getPokemonDetail(id: String). Use given")
			Failure("Stub return value not specified for getPokemonDetail(id: String). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getPokemonList__region_region(Parameter<PokemonRegion>)
        case m_getPokemonDetail__id_id(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getPokemonList__region_region(let lhsRegion), .m_getPokemonList__region_region(let rhsRegion)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsRegion, rhs: rhsRegion, with: matcher), lhsRegion, rhsRegion, "region"))
				return Matcher.ComparisonResult(results)

            case (.m_getPokemonDetail__id_id(let lhsId), .m_getPokemonDetail__id_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getPokemonList__region_region(p0): return p0.intValue
            case let .m_getPokemonDetail__id_id(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getPokemonList__region_region: return ".getPokemonList(region:)"
            case .m_getPokemonDetail__id_id: return ".getPokemonDetail(id:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getPokemonList(region: Parameter<PokemonRegion>, willReturn: AnyPublisher<PokemonListEntity, DataError>...) -> MethodStub {
            return Given(method: .m_getPokemonList__region_region(`region`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getPokemonDetail(id: Parameter<String>, willReturn: AnyPublisher<PokemonDetailEntity, DataError>...) -> MethodStub {
            return Given(method: .m_getPokemonDetail__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getPokemonList(region: Parameter<PokemonRegion>, willProduce: (Stubber<AnyPublisher<PokemonListEntity, DataError>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<PokemonListEntity, DataError>] = []
			let given: Given = { return Given(method: .m_getPokemonList__region_region(`region`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<PokemonListEntity, DataError>).self)
			willProduce(stubber)
			return given
        }
        public static func getPokemonDetail(id: Parameter<String>, willProduce: (Stubber<AnyPublisher<PokemonDetailEntity, DataError>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<PokemonDetailEntity, DataError>] = []
			let given: Given = { return Given(method: .m_getPokemonDetail__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<PokemonDetailEntity, DataError>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getPokemonList(region: Parameter<PokemonRegion>) -> Verify { return Verify(method: .m_getPokemonList__region_region(`region`))}
        public static func getPokemonDetail(id: Parameter<String>) -> Verify { return Verify(method: .m_getPokemonDetail__id_id(`id`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getPokemonList(region: Parameter<PokemonRegion>, perform: @escaping (PokemonRegion) -> Void) -> Perform {
            return Perform(method: .m_getPokemonList__region_region(`region`), performs: perform)
        }
        public static func getPokemonDetail(id: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_getPokemonDetail__id_id(`id`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

