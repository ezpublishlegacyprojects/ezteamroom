{def $hasPFBox = false()}

{if is_set( $view_parameters.pfbox )}

    {if $view_parameters.pfbox|eq( '1' )}

        {set $hasPFBox = true()}

<!--PFBOXCONTENT-->
<div class="pf_box">

    {/if}

{/if}

<div class="latest-messages itemized_sub_items">
<div class="content-view-embed">

    <div class="border-box">
    <div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
    <div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

{def $class_identifier_map = ezini( 'TeamroomSettings', 'ClassIdentifiersMap', 'teamroom.ini' )
                 $children = fetch( 'content', 'tree', hash( 'parent_node_id',    $node.node_id,
                                                             'limit',             5,
                                                             'class_filter_type', 'include',
                                                             'class_filter_array', array( $class_identifier_map['file'] ),
                                                             'sort_by',            array( 'published', false() ) ) )}

{undef $class_identifier_map}

{if $children|count()}
    <ul>
    {foreach $children as $child}
        <li><div><a href={concat("content/download/",$child.data_map.file.contentobject_id,"/",$child.data_map.file.id,"/file/",$child.data_map.file.content.original_filename|rawurlencode() )|ezurl}>{node_view_gui content_node=$child view='listitem'}</a></div></li>
    {/foreach}
    </ul>
    <div class="infobox-link">
        <a href={$node.url_alias|ezurl} title="{"Browse all"|i18n("ezteamroom/files")}">{"Browse all"|i18n("ezteamroom/files")}</a>
    </div>
{else}
    <p>{"There are no files."|i18n("ezteamroom/files")}</p>
{/if}

    </div></div></div>
    <div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
    </div>

</div>
</div>

{if $hasPFBox}

</div>

{/if}

