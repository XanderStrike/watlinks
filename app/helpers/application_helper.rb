module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def categories 
    ["other", "music", "movies", "television", "documentaries", "books"]
  end

  def isactive url
    return "class=active" if (request.fullpath == url)
    return ""
  end

  def sanitize string
    rules = {
      :elements => %w[
        a abbr b bdo blockquote br caption cite code col colgroup dd del dfn dl
        dt em figcaption figure h1 h2 h3 h4 h5 h6 hgroup i img ins kbd li mark
        ol p pre q rp rt ruby s samp small strike strong sub sup table tbody td
        tfoot th thead time tr u ul var wbr
      ],

      :attributes => {
        :all         => ['dir', 'lang', 'title'],
        'a'          => ['href'],
        'blockquote' => ['cite'],
        'col'        => ['span', 'width'],
        'colgroup'   => ['span', 'width'],
        'del'        => ['cite', 'datetime'],
        'img'        => ['align', 'alt', 'height', 'src', 'width'],
        'ins'        => ['cite', 'datetime'],
        'ol'         => ['start', 'reversed', 'type'],
        'q'          => ['cite'],
        'table'      => ['summary', 'width'],
        'td'         => ['abbr', 'axis', 'colspan', 'rowspan', 'width'],
        'th'         => ['abbr', 'axis', 'colspan', 'rowspan', 'scope', 'width'],
        'time'       => ['datetime', 'pubdate'],
        'ul'         => ['type']
      },

      :protocols => {
        'a'          => {'href' => ['ftp', 'http', 'https', 'mailto', :relative]},
        'blockquote' => {'cite' => ['http', 'https', :relative]},
        'del'        => {'cite' => ['http', 'https', :relative]},
        'img'        => {'src'  => ['http', 'https', :relative]},
        'ins'        => {'cite' => ['http', 'https', :relative]},
        'q'          => {'cite' => ['http', 'https', :relative]}
      },

      :add_attributes => {
        'a'          => {'target' => 'blank'}
      }
    }

    return Sanitize.clean(string, rules)
  end

  def version
    commit = `git rev-parse HEAD`
    return commit[0...7]
  end
end
