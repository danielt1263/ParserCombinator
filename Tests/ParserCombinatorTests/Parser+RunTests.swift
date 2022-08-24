//
//  Parser+RunTests.swift
//  ParserCombinator
//
//  Created by Liam on 22/03/2017.
//  Copyright © 2017 Tigerpixel Ltd. All rights reserved.
//

import XCTest
@testable import ParserCombinator

private let testParseAToTrue = ParserTestHelper.characterAtoTrueParser()

class ParserPlusRunTests: XCTestCase {

    // MARK: Run and resolve result to optional.

    func testRunAndResolveParserWithSuccessMatch() {

        XCTAssertEqual(true, testParseAToTrue.runAndResolve(withInput: "a"))
    }

    func testRunAndResolveParserWithSuccessMismatch() {

        XCTAssertEqual(false, testParseAToTrue.runAndResolve(withInput: "b"))
    }

    func testRunAndResolveParserWithNoInputTokens() {

        XCTAssertEqual(nil, testParseAToTrue.runAndResolve(withInput: ""))
    }

    // MARK: Run and manually resolve result.

    func testRunParserWithSuccessMatch() {

        let parseResult = testParseAToTrue.run(withInput: "a")

        guard case .success(let result) = parseResult else {
            XCTFail("Expected success case received \(parseResult).")
            return
        }

        XCTAssertEqual(ParseSuccess(result: true, tail: ""), result)
    }

    func testRunParserWithSuccessMismatch() {

        let parseResult = testParseAToTrue.run(withInput: "b")

        guard case .success(let result) = parseResult else {
            XCTFail("Expected success case received \(parseResult).")
            return
        }

        XCTAssertEqual(ParseSuccess(result: false, tail: ""), result)
    }

    func testRunParserWithNoInputTokens() {

        let parseResult = testParseAToTrue.run(withInput: "")

        guard case .failure(let reason) = parseResult else {
            XCTFail("Expected failure case received \(parseResult).")
            return
        }

        XCTAssertEqual(ParseFailure.insufficiantTokens, reason)
    }

}
