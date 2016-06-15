feature 'add tags' do
  scenario 'add tags to links' do
    visit('/links/new')
    fill_in :title, with: 'hello'
    fill_in :url, with: 'www.hello.com'
    fill_in :tags, with: 'greetings'
    click_button 'Submit'

    link = Link.first
    link.tags.map {|obj| object.name }
    expect(link.tags.map(&:name)).to include('greetings')
  end
end