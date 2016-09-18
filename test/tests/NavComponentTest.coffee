assert = require "assert"

describe.only "NavComponent", ->

	it "should not animate first show", ->

		nav = new NavComponent size: 100
		cardA = new Layer size: 100
		cardB = new Layer size: 100

		nav.show(cardA)
		nav.current.should.equal cardA

	it "should go back", ->

		nav = new NavComponent size: 100
		cardA = new Layer size: 100
		cardB = new Layer size: 100

		nav.show(cardA)
		nav.show(cardB, animate:false)		
		nav.stack.should.eql [cardA, cardB]
		nav.back(animate:false)
		nav.current.should.equal cardA

	describe.only "Scroll", ->

		it "should make views scrollable", ->

			nav = new NavComponent size: 100
			cardA = new Layer width: 200, height: 200

			nav.show(cardA, scroll:true)
			nav.children[1].constructor.name.should.equal "ScrollComponent"
			nav.children[1].scrollHorizontal.should.equal true
			nav.children[1].scrollVertical.should.equal true

		it "should make views scrollable horizontal", ->

			nav = new NavComponent size: 100
			cardA = new Layer width: 200, height: 100

			nav.show(cardA, scroll:true)
			nav.children[1].constructor.name.should.equal "ScrollComponent"
			nav.children[1].scrollHorizontal.should.equal true
			nav.children[1].scrollVertical.should.equal false

		it "should make views scrollable vertical", ->

			nav = new NavComponent size: 100
			cardA = new Layer width: 100, height: 200

			nav.show(cardA, scroll:true)
			nav.children[1].constructor.name.should.equal "ScrollComponent"
			nav.children[1].scrollHorizontal.should.equal false
			nav.children[1].scrollVertical.should.equal true

		it "should not make views scrollable", ->

			nav = new NavComponent size: 100
			cardA = new Layer width: 100, height: 200

			nav.show(cardA, scroll:false)
			nav.children[1].constructor.name.should.equal "Layer"

