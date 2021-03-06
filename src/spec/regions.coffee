# Region

describe '`ContentEdit.Region()`', () ->

    it 'should return an instance of Region`', () ->
        region = new ContentEdit.Region(document.createElement('div'))
        expect(region instanceof ContentEdit.Region).toBe true


describe '`ContentEdit.Region.domElement()`', () ->

    it 'should return the DOM element the region was initialized with', () ->
        domElement = document.createElement('div')
        region = new ContentEdit.Region(domElement)
        expect(region.domElement()).toBe domElement


describe '`ContentEdit.Region.isMounted()`', () ->

    it 'should always return true', () ->
        region = new ContentEdit.Region(document.createElement('div'))
        expect(region.isMounted()).toBe true


describe '`ContentEdit.Region.html()`', () ->

    it 'should return a HTML string for the region', () ->
        region = new ContentEdit.Region(document.createElement('div'))

        # Add a set of elements to the region
        region.attach(new ContentEdit.Text('p', {}, 'one'))
        region.attach(new ContentEdit.Text('p', {}, 'two'))
        region.attach(new ContentEdit.Text('p', {}, 'three'))

        expect(region.html()).toBe(
            '<p>\n' +
            "#{ ContentEdit.INDENT }one\n" +
            '</p>\n' +
            '<p>\n' +
            "#{ ContentEdit.INDENT }two\n" +
            '</p>\n' +
            '<p>\n' +
            "#{ ContentEdit.INDENT }three\n" +
            '</p>'
            )