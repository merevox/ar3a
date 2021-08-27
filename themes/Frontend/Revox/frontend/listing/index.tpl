{extends file="parent:frontend/listing/index.tpl"}

{extends file='frontend/index/index.tpl'}

{block name='frontend_index_header'}
    {include file='frontend/listing/header.tpl'}
{/block}

{block name='frontend_index_content_left'}

    {block name='frontend_index_controller_url'}
        {* Controller url for the found products counter *}
        {$countCtrlUrl = "{url module="widgets" controller="listing" action="listingCount" params=$ajaxCountUrlParams fullPath}"}
    {/block}

	{include file='frontend/listing/sidebar.tpl'}
{/block}

{block name="frontend_index_content_main_classes"}
    {strip}{$smarty.block.parent}{if $hasEmotion} is--small{/if}{/strip}
{/block}

{* Main content *}
{block name='frontend_index_content'}

    <div class="content listing--content">

        {* Banner *}
        {block name="frontend_listing_index_banner"}
            {if $sArticles}
                {include file='frontend/listing/banner.tpl'}
            {/if}
        {/block}

        {* Category headline *}
        {block name="frontend_listing_index_text"}
            {if $sArticles}
                {include file='frontend/listing/text.tpl'}
            {/if}
        {/block}

        {* Topseller *}
        {block name="frontend_listing_index_topseller"}

        {/block}

        {* Define all necessary template variables for the listing *}
        {block name="frontend_listing_index_layout_variables"}

        {/block}

        {* Listing *}
        {block name="frontend_listing_index_listing"}
            {include file='frontend/listing/listing.tpl'}
        {/block}

        {* Tagcloud *}
        {block name="frontend_listing_index_tagcloud"}
            {if {config name=show namespace=TagCloud }}
                {action module=widgets controller=listing action=tag_cloud sController=listing sCategory=$sCategoryContent.id}
            {/if}
        {/block}
    </div>
{/block}

{* Sidebar right *}
{block name='frontend_index_content_right'}{/block}
