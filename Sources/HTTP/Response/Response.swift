import Transport

// So common we simplify it

import URI

public final class Response: Message {
    public var version: Version
    public var status: Status
    public var headers: [HeaderKey: VaporString]
    public var body: Body
    public var storage: [String: Any]
    public var onComplete: ((DuplexStream) throws -> Void)?
    
    public init(
        version: Version = Version(major: 1, minor: 1),
        status: Status,
        headers: [HeaderKey: VaporString] = [:],
        body: Body = .data([])
    ) {
        self.status = status
        self.version = version
        
        var newHeaders = [HeaderKey : UTF8String]()
        
        for (key, value) in headers {
            newHeaders[key] = value.utf8String
        }
        
        self.headers = newHeaders
        self.body = body
        self.storage = [:]
        self.onComplete = nil
    }
}

extension Response {
    /// Creates a redirect response.
    ///
    /// Set permanently to 'true' to allow caching to automatically
    /// redirect from browsers.
    /// Defaulting to non-permanent to prevent unexpected caching.
    public convenience init(
        headers: [HeaderKey: VaporString] = [:],
        redirect location: VaporString,
        permanently: Bool = false
    ) {
        var headers = headers
        headers["Location"] = location
        // .found == 302 and is commonly used for temporarily moved
        let status: Status = permanently ? .movedPermanently : .found
        self.init(status: status, headers: headers)
    }
}

extension Response {
    /// Creates a Response with a body of Bytes.
    public convenience init<S: Sequence>(
        version: Version = Version(major: 1, minor: 1),
        status: Status,
        headers: [HeaderKey: VaporString] = [:],
        body: S
    )
        where S.Iterator.Element == Byte
    {
        let body = Body(body)
        self.init(version: version, status: status, headers: headers, body: body)
    }
}



extension Response {
    /// Creates a Response with a BodyRepresentable Body
    public convenience init(
        version: Version = Version(major: 1, minor: 1),
        status: Status,
        headers: [HeaderKey: String] = [:],
        body: BodyRepresentable
    ) {
        let body = body.makeBody()
        self.init(
            version: version,
            status: status,
            headers: headers,
            body: body
        )
        self.status = status
    }
}
