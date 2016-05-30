chai = require "chai"
sinon = require "sinon"
chai.use require "sinon-chai"

expect = chai.expect

describe "search", ->
    beforeEach ->
        @robot =
            respond: sinon.spy()

        require("../src/search")(@robot)

    it "registers a respond listener", ->
        if GOOGLE_API_KEY? and GOOGLE_CUSTOM_SEARCH?
            expect(@robot.respond).to.have.been.calledWith(/(search|google) (.+)/i)
