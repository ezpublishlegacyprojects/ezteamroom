        <p><a href={$object.main_node.parent.url_alias|ezurl} title="{$object.main_node.data_map.title.content|wash}">{$object.main_node.data_map.title.content|wash}</a> {if $object.main_node.data_map.planned_end_date.has_content}({$object.main_node.data_map.planned_end_date.content.timestamp|l10n(shortdatetime)}){/if}</p>
