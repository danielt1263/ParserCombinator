//
//  ParserTests.swift
//  ParserCombinator
//
//  Created by Liam on 24/03/2017.
//  Copyright © 2017 Tigerpixel Ltd. All rights reserved.
//

import XCTest
@testable import ParserCombinator

class ParserTests: XCTestCase {

    // MARK: Test methods which convert one type of parser to another.

    func testMapParser() {

        // Boolean result of mapped to the strings 'true' and 'false'.
        let parserUnderTest = ParserTestHelper.characterAtoTrueParser().map { $0 ? "true" : "false" }

        if case .success(let results) = parserUnderTest.run(withInput: "aaa") {
            XCTAssertEqual("true", results.result)
            XCTAssertEqual("aa", results.tail)
        } else {
            XCTFail("The parser should succeed")
        }

        if case .success(let results) = parserUnderTest.run(withInput: "sss") {
            XCTAssertEqual("false", results.result)
            XCTAssertEqual("ss", results.tail)
        } else {
            XCTFail("The parser should succeed")
        }

        XCTAssert(ParserTestHelper.hasInsufficiantTokens(parser: parserUnderTest))
    }

    func testPure() {

        let aParser = Parser("a")

        if case .success(let results) = aParser.run(withInput: "tail") {
            XCTAssertEqual("a", results.result)
            XCTAssertEqual("tail", results.tail)
        } else {
            XCTFail("The parser should succeed")
        }

        let oneParser = Parser(1)

        if case .success(let results) = oneParser.run(withInput: "tail") {
            XCTAssertEqual(1, results.result)
            XCTAssertEqual("tail", results.tail)
        } else {
            XCTFail("The parser should succeed")
        }

        let oneFloatParser = Parser(1.0)

        if case .success(let results) = oneFloatParser.run(withInput: "tail") {
            XCTAssertEqual(1.0, results.result)
            XCTAssertEqual("tail", results.tail)
        } else {
            XCTFail("The parser should succeed")
        }
    }

}
