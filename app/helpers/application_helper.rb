module ApplicationHelper
  # [{name: '', path: ''}]
  def breadcrumbs(args)
    content_tag :nav, class: 'flex items-center text-sm leading-5 font-medium' do
      args.each do |arg|
        link_to arg['name'], arg['path'], class: 'text-gray-500 hover:text-gray-700'
        # image_tag 'zondicons/heart.svg', class: 'h-5 w-5 text-gray-400'
      end
    end
  end
end
