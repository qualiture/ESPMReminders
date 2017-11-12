// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

internal class MyPrefixMyServiceClassMetadataParser {
    internal static let options: Int = (CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = MyPrefixMyServiceClassMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser: CSDLParser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = MyPrefixMyServiceClassMetadataParser.options
        let metadata: CSDLDocument = parser.parseInProxy(MyPrefixMyServiceClassMetadataText.xml, url: "ESPM")
        metadata.proxyVersion = "17.9.2-2b890a-20171018"
        return metadata
    }
}
