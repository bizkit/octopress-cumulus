# encoding: utf-8
# WP-Cumulus for Octopress, originally developed by weefselkweekje and LukeMorton for WordPress.
# Ported to Octopress by Joseph Z. Chang.
# TagCanvas integration by Hyacinthe Cartiaux <Hyacinthe.Cartiaux@free.fr>.
#
# * [WP-Cumulus](http://wordpress.org/extend/plugins/wp-cumulus/)
# * [TagCanvas](http://www.goat1000.com/tagcanvas.php)
#
# =======================
#
# Description:
# ------------
#
# Generate a javascript based dynamic tag cloud.
#
# Demo:
# -----
#
# * [hpc.uni.lu](https://hpc.uni.lu/blog/archives/)
#
# Syntax:
# -------
#     {% category_cloud %} for default colors
#
#     OR
#
#     {% category_cloud bgcolor:#ffffff tcolor1:#00aa00 tcolor2:#00dd00 hicolor:#ff3333 %}
#
# Example:
# --------
# In some template files, you can add the following markups.
#
# ### source/_includes/custom/asides/category_cloud.html ###
#
#     <section>
#       <h1>Tag Cloud</h1>
#         <span id="tag-cloud">{% tag_cloud bgcolor:#ffffff tcolor1:#00aa00 tcolor2:#00dd00 hicolor:#ff3333%}</span>
#     </section>
#
# CSS:
# ----
#
# You can define the style on the container, in example, width/height and centered:
#
#     myCanvasContainer {
#       width: 500px;
#       height: 300px;
#       margin-left: auto;
#       margin-right: auto;
#     }
#
# License:
# --------
#
# This ruby code is under MIT License.
# TagCanvas code is under LGPL v3
#
# MIT License: http://opensource.org/licenses/MIT
# GPLv3: http://gplv3.fsf.org
#

require 'stringex'

module Jekyll

  class CategoryCumulusCloud < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      @opts = {}
      @opts['bgcolor'] = '#ffffff'
      @opts['tcolor1'] = '#000000'
      @opts['tcolor2'] = '#ff9999'
      @opts['hicolor'] = '#000000'
      @tag_name = tag_name;

      opt_names = ['bgcolor', 'tcolor1', 'tcolor2', 'hicolor']

      opt_names.each do |opt_name|
          if markup.strip =~ /\s*#{opt_name}:(#[0-9a-fA-F]+)/iu
            @opts[opt_name] = $1
            markup = markup.strip.sub(/#{opt_name}:\w+/iu,'')
          end
      end

      super
    end

    def render(context)
      lists = {}
      max = 1
      config = context.registers[:site].config

      if @tag_name == 'tag_cloud'
        cloud_dir = config['tag_dir']
        cloud = context.registers[:site].tags
      else
        cloud_dir = config['category_dir']
        cloud = context.registers[:site].categories
      end

      cloud_dir = config['url'] + config['root'] + cloud_dir + '/'
      cloud.keys.sort_by{ |str| str.downcase }.each do |item|
        count = cloud[item].count
        lists[item] = count
        max = count if count > max
      end

      bgcolor = @opts['bgcolor']
      tcolor1 = @opts['tcolor1']
      tcolor2 = @opts['tcolor2']
      hicolor = @opts['hicolor']

      html = ""
      html << "<div id=\"myCanvasContainer\" style=\"background-color:" + bgcolor + "\">"
      html << "<canvas width='500' height='300' id=\"myCanvas\">"
      html << "<p></p>"
      html << "<ul>"
      tagcloud = ''

      lists.each do | item, counter |
        url = cloud_dir + item.gsub(/_|\P{Word}/u, '-').gsub(/-{2,}/u, '-').downcase.to_url
        weight = "#{10 + (40 * Float(counter)/max)}";
        tagcloud << "<li><a href=\"#{url}\" style=\"font-size: #{weight}px\">#{item}"
        tagcloud << "</a></li>"

      end

      html << tagcloud


      html << "</ul></canvas></div>"
      html << "<script src=\"" + config['root'] + "javascripts/tagcanvas.min.js\" type=\"text/javascript\"></script>"
      html << "<script type=\"text/javascript\">
                window.onload = function() {
                  try {
                      TagCanvas.textColour    = '" + tcolor1 + "';
                      TagCanvas.outlineColour = '" + tcolor2 + "';
                      TagCanvas.shadow        = '" + hicolor + "';
                      TagCanvas.textHeight    = '30';
                      TagCanvas.weight        = true;
                      TagCanvas.Start('myCanvas');
                  } catch(e) {
                      // something went wrong, hide the canvas container
                      document.getElementById('myCanvasContainer').style.display = 'none';
                  }
                };
               </script>"

      html
    end
  end
end

Liquid::Template.register_tag('category_cloud', Jekyll::CategoryCumulusCloud)
Liquid::Template.register_tag('tag_cloud', Jekyll::CategoryCumulusCloud)
