{extends file='parent:frontend/blog/index.tpl'}

{* Main content *}
{block name='frontend_index_content'}
    <div class="blog--content block-group">

        {* Blog Sidebar *}
        {block name='frontend_blog_listing_sidebar'}
            {include file='frontend/blog/listing_sidebar.tpl'}
        {/block}

        {* Blog Banner *}
        {block name='frontend_blog_index_banner'}
        {/block}

        {* Blog listing *}
        {block name='frontend_blog_index_listing'}
            <div class="blog--listing block">
                {if $sCategoryContent.cmsheadline || $sCategoryContent.cmstext}
                    {*include file="frontend/listing/text.tpl"*}
                {/if}

                {* Blog Filter Button *}
                {block name='frontend_blog_listing_filter_button'}
                    {if !$sCategoryInfo.hideFilter}
                        <div class="blog--filter-btn">
                            {s namespace="frontend/listing/listing_actions" name="ListingFilterButton" assign="snippetListingFilterButton"}{/s}
                            <a href="#"
                               title="{$snippetListingFilterButton|escape}"
                               class="filter--trigger btn is--icon-left"
                               data-collapseTarget=".blog--filter-options"
                               data-offcanvas="true"
                               data-offCanvasSelector=".blog--filter-options"
                               data-closeButtonSelector=".blog--filter-close-btn">
                                <i class="icon--filter"></i> {s namespace='frontend/listing/listing_actions' name='ListingFilterButton'}{/s}
                            </a>
                        </div>
                    {/if}
                {/block}

                {if $sBlogArticles}
                    {foreach from=$sBlogArticles item=sArticle key=key name="counter"}
                        {include file="frontend/blog/box.tpl" sArticle=$sArticle key=$key}
                    {/foreach}

                    {* Paging *}
                    {block name="frontend_listing_bottom_paging"}
                        {if $sNumberPages > 1}
                            {include file='frontend/blog/listing_actions.tpl'}
                        {/if}
                    {/block}
                {/if}
            </div>
        {/block}
    </div>
{/block}