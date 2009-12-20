<div class="content-view-full">
 <div class="class-lightbox leftcolumn norightcolumn">
  <div class="columns-lightbox float-break">

   <div class="left-column-position">
    <div class="left-column">
     <div class="overflow-fix">

      <div class="border-box" style="margin-bottom: 0.2em;">

       <div class="border-tl">
        <div class="border-tr">
         <div class="border-tc"></div>
        </div>
       </div>

       <div class="border-ml">
        <div class="border-mr">
         <div class="border-mc">

          <h1>{'My lightboxes'|i18n( 'ezteamroom/lightbox' )}</h1>
{if is_array( $userLightboxList )}
          <ul>
    {foreach $userLightboxList as $lightbox sequence array( 'bglight', 'bgdark' ) as $bg}
           <li>
        {if $lightboxID|eq( $lightbox.id )}
            {$lightbox.name|wash()}
        {else}
            <a href={concat( '/lightbox/view/', $viewMode , '/', $lightbox.id)|ezurl()}>{$lightbox.name|wash()}</a>
        {/if}
           </li>
    {/foreach}
         </ul>
{else}
      <p>{'You do not have any lightbox yet.'|i18n( 'ezteamroom/lightbox' )}</p>
{/if}

         </div>
        </div>
       </div> 

       <div class="border-bl">
        <div class="border-br">
         <div class="border-bc"></div>
        </div>
       </div>

      </div> {* border-box *}

      <div class="border-box" style="margin-bottom: 0.2em;">

       <div class="border-tl">
        <div class="border-tr">
         <div class="border-tc"></div>
        </div>
       </div>

       <div class="border-ml">
        <div class="border-mr">
         <div class="border-mc">

          <h1>{'Other lightboxes'|i18n( 'ezteamroom/lightbox' )}</h1>
{if is_array( $otherLightboxList )}
          <ul>
    {foreach $otherLightboxList as $lightbox sequence array( 'bglight', 'bgdark' ) as $bg}
           <li>
        {if $lightboxID|eq( $lightbox.id )}
            {$lightbox.name|wash()}
        {else}
            <a href={concat( '/lightbox/view/', $viewMode , '/', $lightbox.id)|ezurl()} title="{'View this lightbox owned by %1'|i18n( 'ezteamroom/lightbox', , hash( '%1', $lightbox.owner.contentobject.name|wash() ) )}">{$lightbox.name|wash()}</a>
        {/if}
           </li>
    {/foreach}
         </ul>
{else}
      <p>{'You do not have any lightbox yet.'|i18n( 'ezteamroom/lightbox' )}</p>
{/if}

         </div>
        </div>
       </div>

       <div class="border-bl">
        <div class="border-br">
         <div class="border-bc"></div>
        </div>
       </div>

      </div> {* border-box *}

      <div class="border-box" style="margin-bottom: 0.2em;">

       <div class="border-tl">
        <div class="border-tr">
         <div class="border-tc"></div>
        </div>
       </div>

       <div class="border-ml">
        <div class="border-mr">
         <div class="border-mc">

          <h1>{'Granted Users'|i18n( 'ezteamroom/lightbox' )}</h1>

{if is_object( $selectedLightbox )}

    {if $selectedLightbox.access_list|count()|gt( 0 )}
                <ul>
        {foreach $selectedLightbox.access_list as $access}
                <li>
            {$access.user.contentobject.name|wash()}
            {if $access.flags|count()|gt( 0 )}
                ({$access.flags|implode( ', ' )})
            {else}
                ( - )
            {/if}
                </li>
        {/foreach}
                </ul>
    {else}
        <p>{'Currently no users are allowed to access this lightbox.'|i18n( 'ezteamroom/lightbox' )}</p>
    {/if}

{else}

    <p>{'No lightbox selected'|i18n( 'ezteamroom/lightbox' )}</p>

{/if}

         </div>
        </div>
       </div>

    {def $can_create_lightbox  = fetch( 'user', 'has_access_to',
                                                hash( 'module',   'lightbox',
                                                      'function', 'create' ) ) }
    {if $can_create_lightbox}
    <div class="border-ml"><div class="border-mr"><div class="border-mc">
        <h1>{'Create new Lightbox'|i18n( 'ezteamroom/lightbox' )}</h1>
        <form action={'/lightbox/create'|ezurl()} method="post">
            <input type="hidden" name="redirectAfterLightboxHasBeenCreated" value="1" />
            <input type="hidden" name="redirectURI" value="/lightbox/view/list" />
            <ul>
                <li><input type="submit" class="text-button" value="{'Create new lightbox.'|i18n( 'ezteamroom/lightbox' )}" name="CreateLightboxAction" /></li>
            </ul>
        </form>
    </div></div></div>
    {/if}

       <div class="border-bl">
        <div class="border-br">
         <div class="border-bc"></div>
        </div>
       </div>

      </div> {* border-box *}

     </div>
    </div>
   </div> {* left-column-position *}

   <div class="center-column-position">
    <div class="center-column float-break">
     <div class="overflow-fix">

      <div class="border-box" style="margin-bottom: 0.2em;">

       <div class="border-tl">
        <div class="border-tr">
         <div class="border-tc"></div>
        </div>
       </div>

       <div class="border-ml">
        <div class="border-mr">
         <div class="border-mc">

{if and( is_set( $messages ), $messages|count()|gt( 0 ) )}

          <div class="message-{cond( $actionSuccess, 'feedback', true(), 'error' )}">

    {foreach $messages as $message}

           <p>{$message|wash()}</p>

    {/foreach}

          </div>

{/if}

{if is_object( $selectedLightbox )}

    {def $current_user = fetch( 'user', 'current_user' )}
    {def $isForeignLightbox = $selectedLightbox.owner_id|ne( $current_user.contentobject_id )}

          <h1>{'Lightbox "%1"'|i18n( 'ezteamroom/lightbox', , hash( '%1', $selectedLightbox.name ) )}</h1>

    {if $isForeignLightbox}

          <div>
           <strong>{'Owner'|i18n( 'ezteamroom/lightbox' )}:</strong>
           {$selectedLightbox.owner.contentobject.name|wash()}
          </div>

    {/if}

    {if $selectedLightbox.item_id_list|count()|gt( 0 )}

        {def $content_object = false()
                $item_object = false()
                  $object_id = 0
                   $use_shop = ezini( 'CommonSettings', 'UseShop', 'lightbox.ini' )
             $can_use_basket = false()}

        {if $use_shop|eq( 'enabled' )}
            {set $can_use_basket = fetch( 'user', 'has_access_to',
                                          hash( 'module',   'shop',
                                                'function', 'buy'
                                              )
                                        )}
        {/if}


          <table class="list">
        {foreach $selectedLightbox.item_id_list as $item_id => $type_id sequence array( 'bglight', 'bgdark' ) as $bg}

            {if $type_id|eq( 1 )}
                {set $content_object = fetch( 'content', 'object', hash( 'object_id', $item_id ) )
                          $object_id = $item_id}
            {elseif $type_id|eq( 2 )}
                {set    $item_object = fetch( 'content', 'node', hash( 'node_id', $item_id ) )
                     $content_object = $item_object.object
                          $object_id = $item_object.object.id}
            {/if}

            {if is_object( $content_object )|not()}
                {set $content_object = false()}
            {/if}

            {include uri = 'design:lightbox/listentry.tpl'
                  object = $content_object
               use_table = false()
                      bg = $bg
          can_use_basket = $can_use_basket
            lightboxList = $userLightboxList
                lightbox = $selectedLightbox}

        {/foreach}
          </table>
    {else}
          <p>{'This lightbox is empty.'|i18n( 'ezteamroom/lightbox' )}</p>
    {/if}

          <div class="lightbox-buttons">
           <form action={'/content/action'|ezurl()} method="post">
            <input type="hidden" name="ContentObjectID" value="" />
            <input type="hidden" name="LightboxID"      value="{$selectedLightbox.id}" />

    {if $selectedLightbox.can_edit}
            <input type="submit" name="EditLightboxAction"   value="{'Edit'|i18n( 'ezteamroom/lightbox' )}" class="button" title="{'Use this button to edit this lightbox.'|i18n( 'ezteamroom/lightbox' )}" />
            <input type="submit" name="DeleteLightboxAction" value="{'Delete'|i18n( 'ezteamroom/lightbox' )}" class="button" title="{'Use this button to delete this lightbox'|i18n( 'ezteamroom/lightbox' )}" onclick="return confirmDeleteLightbox()" />
            <input type="submit" name="EmptyLightboxAction" value="{'Empty'|i18n( 'ezteamroom/lightbox' )}" class="button" title="{'Use this button to remove all assets from this lightbox'|i18n( 'ezteamroom/lightbox' )}" onclick="return confirmEmptyLightbox()"/>
    {/if}

    {if $selectedLightbox.can_send}
            <input type="submit" name="SendLightboxAction"   value="{'Send'|i18n( 'ezteamroom/lightbox' )}" class="button" title="{'Use this button to permit another user to access this lightbox by sending him an email'|i18n( 'ezteamroom/lightbox' )}" />
    {/if}

    {if and( is_set( $redirectURI ), $redirectURI|ne( '' ) )}

            <input type="hidden" name="redirectURI" value="{$redirectURI}" />
            <input type="submit" name="GoBackButton" value="{'Go back'|i18n( 'lightbox/view' )}" title="{'Use this button to go back to the last page.'|i18n( 'lightbox/view' )}" class="button" />

    {/if}

           </form>
          </div>

{else}

      {'No lightbox selected'|i18n( 'ezteamroom/lightbox' )}

{/if}

         </div>
        </div>
       </div>

       <div class="border-bl">
        <div class="border-br">
         <div class="border-bc"></div>
        </div>
       </div>

      </div> {* border-box *}
     </div>
    </div>
   </div> {* center-column-position *}

   <div class="right-column-position">
    <div class="right-column"></div>
   </div>

  </div> {* columns-frontpage *}
  <div class="float-break"></div>

 </div> {* class-frontpage *}
</div> {* content-view-full *}
