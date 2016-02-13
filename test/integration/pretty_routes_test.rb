require 'test_helper'

# Test Class
class InheritNavigationTest < ActiveSupport::IntegrationCase
  test 'default index' do
    visit('/rails/routes')
    # save_and_open_page
    assert has_content?('foo_index')
    assert has_content?('/foo(.:format)')
    assert has_content?('foo#index')
  end

  test 'JS show/hide _path' do
    visit('/rails/routes')
    assert has_content?('foo_index_path')
    click_link('Url')
    assert has_content?('foo_index_url')
  end
end
