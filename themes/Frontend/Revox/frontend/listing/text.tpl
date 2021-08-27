{extends file="parent:frontend/listing/text.tpl"}

{block name="frontend_listing_text"}
    <div class="listing-content">
        <div class="listing-content-header">
            {* Headline *}
            {block name="frontend_listing_text_headline"}
                {if $sCategoryContent.cmsheadline}
                    <h1 class="hero--headline panel--title">{$sCategoryContent.cmsheadline}</h1>
                {/if}
            {/block}
        </div>
        <div class="listing-content-content">
            {* Long description *}
            {block name="frontend_listing_text_content_long"}
                <div class="teaser--text-long">
                    {$sCategoryContent.cmstext}
                </div>
            {/block}
        </div>
    </div>
{/block}