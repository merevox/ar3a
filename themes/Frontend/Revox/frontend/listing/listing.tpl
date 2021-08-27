{extends file="parent:frontend/listing/listing.tpl"}

{* Emotion worlds *}
{block name="frontend_listing_list_promotion"}
    {if $hasEmotion}
        {$fullscreen = false}

        {block name="frontend_listing_emotions"}
            <div class="content--emotions">

                {foreach $emotions as $emotion}
                    {if $emotion.fullscreen == 1}
                        {$fullscreen = true}
                    {/if}

                    <div class="emotion--wrapper"
                         data-controllerUrl="{url module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller}"
                         data-availableDevices="{$emotion.devices}">
                    </div>
                {/foreach}

                {block name="frontend_listing_list_promotion_link_show_listing"}


                {/block}
            </div>
        {/block}
    {/if}
{/block}

{* Listing wrapper *}
{*block name="frontend_listing_listing_wrapper"*}

{*/block*}
