require 'test/unit'

require File.join(File.dirname(__FILE__), 'helper.rb')

class FilterRedClothTest < Test::Unit::TestCase

  def setup    ; global_setup    ; end
  def teardown ; global_teardown ; end

  def test_filter
    if_have 'redcloth' do
      assert_nothing_raised do
        with_site_fixture 'empty_site' do |site|
          site.load_data

          # Get filter
          page  = site.pages.first.to_proxy
          pages = site.pages.map { |p| p.to_proxy }
          filter = ::Nanoc::Filter::RedCloth::RedClothFilter.new(page, pages, site.config, site)

          # Run filter
          result = filter.run("h1. Foo")
          assert_equal("<h1>Foo</h1>", result)
        end
      end
    end
  end

end