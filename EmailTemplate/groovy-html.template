def generateEmailContent(build) {
    """
    <html>
        <body>
            <h2>Build Status: ${build.result}</h2>
            <p>Build Number: ${build.number}</p>
            <p>Build URL: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>
            <p>Custom Message: Your custom message goes here.</p>
        </body>
    </html>
    """
}
