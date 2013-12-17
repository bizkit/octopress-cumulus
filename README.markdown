WP-Cumulus for Octopress, originally developed by weefselkweekje and LukeMorton for WordPress.                                                                                                                                     
Ported to Octopress by Joseph Z. Chang.
TagCanvas integration by Hyacinthe Cartiaux <Hyacinthe.Cartiaux@free.fr>.

* [WP-Cumulus](http://wordpress.org/extend/plugins/wp-cumulus/)
* [TagCanvas](http://www.goat1000.com/tagcanvas.php)

=======================

Description:
------------

Generate a javascript based dynamic tag cloud.

Demo:
-----

* [hpc.uni.lu](https://hpc.uni.lu/blog/archives/)

Syntax:
-------
    {% category_cloud %} for default colors

    OR

    {% category_cloud bgcolor:#ffffff tcolor1:#00aa00 tcolor2:#00dd00 hicolor:#ff3333 %}

Example:
--------
In some template files, you can add the following markups.

### source/_includes/custom/asides/category_cloud.html ###

    <section>
      <h1>Tag Cloud</h1>
        <span id="tag-cloud">{% tag_cloud bgcolor:#ffffff tcolor1:#00aa00 tcolor2:#00dd00 hicolor:#ff3333%}</span>
    </section>

CSS:
----

You can define the style on the container, in example, width/height and centered:

    myCanvasContainer {
      width: 500px;
      height: 300px;
      margin-left: auto;
      margin-right: auto;
    }

License:
--------

This ruby code is under MIT License.
TagCanvas code is under LGPL v3

MIT License: http://opensource.org/licenses/MIT
GPLv3: http://gplv3.fsf.org

