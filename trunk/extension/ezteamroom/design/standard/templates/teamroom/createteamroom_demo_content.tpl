{set $availible_feature_list = hash( 'tasks',       hash( 'title', 'Tasks'|i18n('ezteamroom/creation'),         'default', true()  ),
                                     'milestones',  hash( 'title', 'Milestones'|i18n('ezteamroom/creation'),    'default', true()  ),
                                     'files',       hash( 'title', 'Files'|i18n('ezteamroom/creation'),         'default', true()  ),
                                     'forum',       hash( 'title', 'Message Board'|i18n('ezteamroom/creation'), 'default', false() ),
                                     'blog',        hash( 'title', 'Blog'|i18n('ezteamroom/creation'),          'default', true()  ),
                                     'calendar',    hash( 'title', 'Calendar'|i18n('ezteamroom/creation'),      'default', true()  ),
                                     'wiki',        hash( 'title', 'Wiki'|i18n('ezteamroom/creation'),          'default', true()  ) )}

{set $tpl_info=hash(
        'teamroom_node_id', hash( 'info',     'Node ID of the teamroom'|i18n('ezteamroom/creation'),
                                  'type',     'integer' ),

        'install_features', hash( 'info',     'Which features should be installed'|i18n('ezteamroom/creation'),
                                  'type',     'array',
                                  'default',  array( 'tasks', 'milestones', 'files', 'forum', 'blog', 'calendar', 'wiki' ) ),

        'owner_object_id',  hash( 'info',     'ObjectID of the teamroom owner'|i18n('ezteamroom/creation'),
                                  'type',     'integer' ) )}

{def $publicSectionID = ezini( 'TeamroomSettings', 'PublicSectionID', 'teamroom.ini' )}

{set-block variable='xml_data'} {* Do not insert an empty line because the xml definition must be placed in the first line *}
<?xml version='1.0' encoding='UTF-8'?>
<eZXMLImporter>
    <ProccessInformation comment="Create teamroom content" />
    <CreateContent parentNode="{$teamroom_node_id}">
        <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="user_group" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_team_member">
            <Attributes>
                <name>{'Team member'|i18n('ezteamroom/creation')}</name>
                <description>{'The following users are currently members of this teamroom. You can get detailed information about a user within his profile and send an email to each of the users. Using the link in the menu on the right you can invite new users to the teamroom. If you have the required rights you can configure the permissions of the teamroom members by using the link in the menu on the right.'|i18n('ezteamroom/creation')}</description>
                <website_toolbar_access>0</website_toolbar_access>
            </Attributes>
            <SetReference attribute="object_id" value="TEAM_MEMBER_GROUP" />
            <SetReference attribute="node_id" value="TEAM_MEMBER_GROUP_NODE" />
            <Childs>
                <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="user_group" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_team_leader">
                    <Attributes>
                        <name>{'Moderator'|i18n('ezteamroom/creation')}</name>
                        <description>{'Moderator list'|i18n('ezteamroom/creation')}</description>
                        <website_toolbar_access>0</website_toolbar_access>
                    </Attributes>
                    <SetReference attribute="object_id" value="TEAM_LEADER_GROUP" />
                    <SetReference attribute="node_id" value="TEAM_LEADER_GROUP_NODE" />
                </ContentObject>
            </Childs>
        </ContentObject>
        <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="task_list" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_tasks">
            <Attributes>
                <name>{'Tasks'|i18n('ezteamroom/creation')}</name>
                <description>
                 {'The following list gives an overview over the teamroom related tasks and their status. To create a new task use the "Add new task button". A click on the info icon of an existing task will show more detailed information about it. A click on the progress meter will change the current progress of the task. Use the edit icon to edit the details of a task and the trash icon to delete it. Using the link shown below "Filter" will toggle between two modes: one mode shows the finished tasks and one mode shows the unfinished tasks. The links shown below "Sort by" can be used to sort the task in different orders. By clicking on the same link two times, the sorting order will be reverted. A click on one of the keywords shown below "Keywords" will filter the displayed tasks and show only those having the selected keyword.'|i18n('ezteamroom/creation')}
                </description>
            </Attributes>
            <SetReference attribute="object_id" value="TASK_LIST" />
            <SetReference attribute="node_id" value="TASK_LIST_NODE" />
            <Childs>
                <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="task" section="{$publicSectionID}" remoteID="">
                    <Attributes>
                        <title>{'My first task'|i18n('ezteamroom/creation')}</title>
                        <description>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris mollis. Donec egestas justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.</description>
                        <progress>20</progress>
                        {*<planned_end_date></planned_end_date>*}
                        <est_hours>20</est_hours>
                        <est_minutes>45</est_minutes>
                        <tags>lorem,ipsum,dolor,amet</tags>
                        <priority>1</priority>
                    </Attributes>
                </ContentObject>
                <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="task" section="{$publicSectionID}" remoteID="">
                    <Attributes>
                        <title>{'My second task'|i18n('ezteamroom/creation')}</title>
                        <description>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris mollis. Donec egestas justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.</description>
                        <progress>0</progress>
                        {*<planned_end_date></planned_end_date>*}
                        <est_hours>10</est_hours>
                        <est_minutes>0</est_minutes>
                        <tags>ipsum,amet,mollis</tags>
                        <priority>3</priority>
                    </Attributes>
                </ContentObject>
                <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="task" section="{$publicSectionID}" remoteID="">
                    <Attributes>
                        <title>{'My third task'|i18n('ezteamroom/creation')}</title>
                        <description>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris mollis. Donec egestas justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.</description>
                        <progress>40</progress>
                        {*<planned_end_date></planned_end_date>*}
                        <est_hours>2</est_hours>
                        <est_minutes>30</est_minutes>
                        <tags>dolor,amet,elit,mollis</tags>
                        <priority>2</priority>
                    </Attributes>
                </ContentObject>
                <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="task" section="{$publicSectionID}" remoteID="">
                    <Attributes>
                        <title>{'My fourth task'|i18n('ezteamroom/creation')}</title>
                        <description>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris mollis. Donec egestas justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.</description>
                        <progress>50</progress>
                        {*<planned_end_date></planned_end_date>*}
                        <est_hours>3</est_hours>
                        <est_minutes>33</est_minutes>
                        <tags>amet,mollis,elit</tags>
                        <priority>3</priority>
                    </Attributes>
                </ContentObject>
            </Childs>
        </ContentObject>
        <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="file_folder" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_files">
            <Attributes>
                <name>{'Files'|i18n('ezteamroom/creation')}</name>
                <short_name>{'Files'|i18n('ezteamroom/creation')}</short_name>
                <description>
                 {'The following list shows the files related to this teamroom. To upload single files the button "Upload new file" can be used. Furthermore it is possible to upload multiple files at the same time by using the "Multi upload" button. For uploading multiple files at the same time it is required to use the "Ctrl" key when selecting the files. To add an existing lightbox to the list of files the button "Add lightbox" can be used. The links shown below "Sort by" can be used to sort the files in different orders. By clicking on the same link two times, the sorting order will be reverted. The links shown below "Categories" can be used to filter the list of shown files by the categories they belong to. A click on one of the keywords shown below "Keywords" will filter the displayed tasks and show only those having the selected keyword.'|i18n('ezteamroom/creation')}
                </description>
                <tags></tags>
            </Attributes>
            <SetReference attribute="object_id" value="FILE_LIST" />
            <SetReference attribute="node_id" value="FILE_LIST_NODE" />
        </ContentObject>
        <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="milestone_folder" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_milestones">
            <Attributes>
                <name>{'Milestones'|i18n('ezteamroom/creation')}</name>
                <short_name>{'Milestones'|i18n('ezteamroom/creation')}</short_name>
                <short_description></short_description>
                <description>{'The following list shows the milestones that have been created within this teamroom. A milestone is a collection of tasks and has a date that indicates when the milestone should be reached. You can use the button "New milestone" to create a new milestone. The links shown below "Sort by" can be used to sort the milestones in different orders. By clicking on the same link two times, the sorting order will be reverted. A click on one of the tags shown below "Tags" will filter the displayed milestones and show only those having the selected tag.'|i18n('ezteamroom/creation')}</description>
                <tags></tags>
            </Attributes>
            <SetReference attribute="object_id" value="MILESTONE_LIST" />
            <SetReference attribute="node_id" value="MILESTONE_LIST_NODE" />
        </ContentObject>
        <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="forum" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_forum">
            <Attributes>
                <name>{'Message Board'|i18n('ezteamroom/creation')}</name>
                <description>{'This message board can be used for teamroom related discussions. You can add a new post using the button "Add new topic". If you want to read the content of a topic you can click on the title. This will also enable you to reply to that topic.'|i18n('ezteamroom/creation')}</description>
            </Attributes>
            <SetReference attribute="object_id" value="MESSAGE_BOARD" />
            <SetReference attribute="node_id" value="MESSAGE_BOARD_NODE" />
        </ContentObject>
        <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="blog" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_blog">
            <Attributes>
                <name>{'Blog'|i18n('ezteamroom/creation')}</name>
                <description>{'This blog can be used to post teamroom related messages in form of a diary. To create a new blog entry you can use the button "Add new entry". If you click on the title of an entry the full article will be shown and you are enabled to write a comment to the article.'|i18n('ezteamroom/creation')}</description>
                <tags></tags>
            </Attributes>
            <SetReference attribute="object_id" value="BLOG" />
            <SetReference attribute="node_id" value="BLOG_NODE" />
            <Childs>
                <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="blog_post" section="{$publicSectionID}" remoteID="">
                    <Attributes>
                        <title>{'My first blog post'|i18n('ezteamroom/creation')}</title>
                        <body>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris mollis. Donec egestas justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.</body>
                        <tags>lorem,ipsum,dolor,amet</tags>
                        <enable_comments>1</enable_comments>
                    </Attributes>
                </ContentObject>
            </Childs>
        </ContentObject>
        <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="event_calendar" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_calendar">
            <Attributes>
                <title>{'Calendar'|i18n('ezteamroom/creation')}</title>
                <short_title>{'Calendar'|i18n('ezteamroom/creation')}</short_title>
                <view>0</view>
            </Attributes>
            <SetReference attribute="object_id" value="EVENT_CALENDAR" />
            <SetReference attribute="node_id" value="EVENT_CALENDAR_NODE" />
        </ContentObject>
        <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="documentation_page" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_wiki">
            <Attributes>
                <title>{'Wiki'|i18n('ezteamroom/creation')}</title>
                <body>{'Wiki'|i18n('ezteamroom/creation')}</body>
                <tags></tags>
                <show_children>1</show_children>
            </Attributes>
            <SetReference attribute="object_id" value="WIKI" />
            <SetReference attribute="node_id" value="WIKI_NODE" />
        </ContentObject>
    </CreateContent>
    <ProccessInformation comment="Create teamroom boxes" />
    <CreateContent parentNode="{$teamroom_node_id}">
        <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="box_folder" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_box_folder">
            <Attributes>
                <name>{'Boxes'|i18n('ezteamroom/creation')}</name>
            </Attributes>
            <SetReference attribute="object_id" value="BOX_FOLDER" />
            <Childs>
                <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="infobox" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_box_folder_calendar">
                    <Attributes>
                        <header>{'Calendar'|i18n('ezteamroom/creation')}</header>
                        <box_icon>{ezini( "TeamroomIconSettings", "Icon678", "teamroom.ini" )}</box_icon>
                        <content></content>
                        <url></url>
                        <module_url parseReferences="true">content/view/module_widget/[internal:EVENT_CALENDAR_NODE]</module_url>
                        <check_access></check_access>
                    </Attributes>
                </ContentObject>
                <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="infobox" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_box_folder_latestfiles">
                    <Attributes>
                        <header>{'Latest Files'|i18n('ezteamroom/creation')}</header>
                        <box_icon>{ezini( "TeamroomIconSettings", "Icon677", "teamroom.ini" )}</box_icon>
                        <content></content>
                        <url></url>
                        <module_url parseReferences="true">content/view/module_widget/[internal:FILE_LIST_NODE]</module_url>
                        <check_access></check_access>
                    </Attributes>
                </ContentObject>
                <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="infobox" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_box_folder_bookmarks">
                    <Attributes>
                        <header>{'Current Lightbox'|i18n('ezteamroom/creation')}</header>
                        <box_icon>{ezini( "TeamroomIconSettings", "Icon619", "teamroom.ini" )}</box_icon>
                        <content></content>
                        <url></url>
                        <module_url parseReferences="true">lightbox/view/currentlightbox</module_url>
                        <check_access>lightbox/read</check_access>
                    </Attributes>
                    <SetReference attribute="object_id" value="TEAMROOM_LIGHTBOX_BOX" />
                </ContentObject>
                <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="infobox" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_box_folder_latest_member">
                    <Attributes>
                        <header>{'Latest Member'|i18n('ezteamroom/creation')}</header>
                        <box_icon>{ezini( "TeamroomIconSettings", "Icon003", "teamroom.ini" )}</box_icon>
                        <content></content>
                        <url></url>
                        <module_url parseReferences="true">content/view/module_widget/[internal:TEAM_MEMBER_GROUP_NODE]</module_url>
                        <check_access></check_access>
                    </Attributes>
                </ContentObject>
                <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="infobox" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_box_folder_lastblog">
                    <Attributes>
                        <header>{'Last Blog Entry'|i18n('ezteamroom/creation')}</header>
                        <box_icon>{ezini( "TeamroomIconSettings", "Icon673", "teamroom.ini" )}</box_icon>
                        <content></content>
                        <url></url>
                        <module_url parseReferences="true">content/view/module_widget/[internal:BLOG_NODE]</module_url>
                        <check_access></check_access>
                    </Attributes>
                </ContentObject>
                <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="infobox" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_box_folder_help">
                    <Attributes>
                        <header>{'Help'|i18n('ezteamroom/creation')}</header>
                        <box_icon>{ezini( "TeamroomIconSettings", "Icon168", "teamroom.ini" )}</box_icon>
{*                         <content htmlDecode="true">&lt;embed size=&quot;medium&quot; class=&quot;itemized_sub_items&quot; align=&quot;center&quot; object_id=&quot;168&quot; custom:offset=&quot;0&quot; custom:limit=&quot;5&quot;/&gt;</content> *}
                        <url></url>
                        <module_url></module_url>
                        <check_access></check_access>
                    </Attributes>
                    <SetReference attribute="object_id" value="TEAMROOM_HELP_BOX" />
                </ContentObject>
                <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="infobox" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_box_folder_manageteamroom">
                    <Attributes>
                        <header>{'This Teamroom'|i18n('ezteamroom/creation')}</header>
                        <box_icon>{ezini( "TeamroomIconSettings", "Icon226", "teamroom.ini" )}</box_icon>
                        <content></content>
                        <url></url>
                        <module_url parseReferences="true">content/view/manage/[node_id:{$teamroom_node_id}]</module_url>
                        <check_access>teamroom/manage</check_access>
                    </Attributes>
                    <SetReference attribute="object_id" value="MANAGE_TEAMROOM_BOX" />
                </ContentObject>
                <ContentObject owner="{$owner_object_id}" creator="{$owner_object_id}" contentClass="infobox" section="{$publicSectionID}" remoteID="{$teamroom_node_id}_box_folder_teamroomleader">
                    <Attributes>
                        <header>{'Teamroom Moderators'|i18n('ezteamroom/creation')}</header>
                        <box_icon>{ezini( "TeamroomIconSettings", "Icon674", "teamroom.ini" )}</box_icon>
                        <content></content>
                        <url></url>
                        <module_url parseReferences="true">content/view/module_widget/[internal:TEAM_LEADER_GROUP_NODE]</module_url>
                        <check_access></check_access>
                    </Attributes>
                    <SetReference attribute="object_id" value="TEAMROOM_LEADER_BOX" />
                </ContentObject>
            </Childs>
        </ContentObject>
    </CreateContent>
    <ProccessInformation comment="Setting Teamroom Startpage" />
    <ModifyContent nodeID="{$teamroom_node_id}" creator="{$owner_object_id}"  owner="{$owner_object_id}">
        <Attributes>
            <default_arrangement parseReferences="true">[[[internal:TEAMROOM_LEADER_BOX]],[[internal:MANAGE_TEAMROOM_BOX]],[[internal:TEAMROOM_LIGHTBOX_BOX]],[[internal:TEAMROOM_HELP_BOX]]]</default_arrangement>
        </Attributes>
    </ModifyContent>
    <ProccessInformation comment="Add owner to leader group" />
    <AddLocation contentObject="{$owner_object_id}" addToNode="internal:TEAM_LEADER_GROUP_NODE" />
    <ProccessInformation comment="Assigning roles to user groups" />
    <AssignRoles>
        <RoleAssignment roleID="{ezini( "PermissionSettings", "TeamroomLeaderGroupRole", "teamroom.ini" )}"  assignTo="internal:TEAM_LEADER_GROUP" subtreeLimitation="node_id:{$teamroom_node_id}" />
        <RoleAssignment roleID="{ezini( "PermissionSettings", "TeamroomMemberGroupRole", "teamroom.ini" )}"  assignTo="internal:TEAM_MEMBER_GROUP" subtreeLimitation="node_id:{$teamroom_node_id}" />
{foreach ezini( "PermissionSettings", "TeamroomRoleList", "teamroom.ini" ) as $roleID}
        <RoleAssignment roleID="{$roleID}"  assignTo="{$owner_object_id}" subtreeLimitation="node_id:{$teamroom_node_id}" />
{/foreach}
    </AssignRoles>
    <ProccessInformation comment="Hide unused features" />
    {if $install_features|contains('tasks')|not}
        <HideUnhide nodeID="internal:TASK_LIST_NODE" action="hide" />
    {/if}
    {if $install_features|contains('milestones')|not}
        <HideUnhide nodeID="internal:MILESTONE_LIST_NODE" action="hide" />
    {/if}
    {if $install_features|contains('files')|not}
        <HideUnhide nodeID="internal:FILE_LIST_NODE" action="hide" />
    {/if}
    {if $install_features|contains('forum')|not}
        <HideUnhide nodeID="internal:MESSAGE_BOARD_NODE" action="hide" />
    {/if}
    {if $install_features|contains('blog')|not}
        <HideUnhide nodeID="internal:BLOG_NODE" action="hide" />
    {/if}
    {if $install_features|contains('calendar')|not}
        <HideUnhide nodeID="internal:EVENT_CALENDAR_NODE" action="hide" />
    {/if}
    {if $install_features|contains('wiki')|not}
        <HideUnhide nodeID="internal:WIKI_NODE" action="hide" />
    {/if}
    <ProccessInformation comment="Sending mail to owner" />
    <SendMail receiver="{$owner_object_id}" template="teamroom/mail/teamroom_ready.tpl" node="{$teamroom_node_id}" />
</eZXMLImporter>
{/set-block}
