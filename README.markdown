
WP-Cumulus for Octopress, originally developed by weefselkweekje and LukeMorton for WordPress.
Ported to Octopress by Joseph Chang.

Link to WP-Cumulus: http://wordpress.org/extend/plugins/wp-cumulus/

Description:
------------
3D rotating tagcloud for Octopress, ported from WP-cumulus.

Installation:
--------
The files are organized as following:
```
.
├── gplv3.txt
├── mit_license.txt
├── plugins
│   └── category_cloud.rb
├── README.markdown
└── source
    ├── _includes
    │   └── custom
    │       └── asides
    │           └── category_cloud.html
    └── javascripts
        └── tagcloud.swf
```
Only 4 steps are required when you install it:

1. Copy the `plugins/category_cloud.rb` to your `octopress/plugins/`;
2. Copy the `source/_includes/custom/asides/category_cloud.html` to your `octopress/source/_includes/custom/asides/`;
3. Add the `octopress/source/_includes/custom/asides/` in Step 2 to your `default_asides` in your `octopress/_config.yml` file;
4. Copy the `source/javascripts/tagcloud.swf` to your `source/javascripts/` folder.

After the 4 steps above, generate and preview your octopress, the cloud tags should show at your asides bar.

It is now available for **Chinese** tags.

Demo:
--------
http://joseph.nlpweb.org
http://blog.ashwani.co.in
http://guori12321.github.io

Syntax:
-------
    {% category_cloud %} for default colors

    OR

    {% tag_cloud bgcolor:#ffffff tcolor1:#00aa00 tcolor2:#00dd00 hicolor:#ff3333 %}

Example:
--------
In template files, add the following markups.

### source/_includes/custom/asides/category_cloud.html ###

    <section>
      <h1>Tag Cloud</h1>
        <span id="tag-cloud">{% tag_cloud bgcolor:#ffffff tcolor1:#00aa00 tcolor2:#00dd00 hicolor:#ff3333%}</span>
    </section>

License:
---------
WP-Cumulus is under GPLv3. However, original javascript and php code are not used, only tagcloud.swf
is adopted. This ruby code is under MIT License.

GPLv3: http://gplv3.fsf.org
MIT License: http://opensource.org/licenses/MIT

PS: The Chinese support is provided by [http://blog.alphatr.com/wp-cumulus-cn.html](http://blog.alphatr.com/wp-cumulus-cn.html).
