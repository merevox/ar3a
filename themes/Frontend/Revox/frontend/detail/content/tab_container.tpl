{extends file="parent:frontend/detail/content/tab_container.tpl"}

{block name="frontend_detail_index_outer_tabs"}
    <div class="tab--container-list">
        {block name="frontend_detail_index_inner_tabs"}
            {block name='frontend_detail_index_before_tabs'}{/block}

            {* Accessory articles *}
            {block name="frontend_detail_index_tabs_related"}
                {if $sArticle.sRelatedArticles && !$sArticle.crossbundlelook}
                    <div class="tab--container" data-tab-id="related">
                        {block name="frontend_detail_index_tabs_related_inner"}
                            <div class="tab--header" id="equipmentDesc">
                                <a href="#" class="tab--title" title="{s namespace="frontend/detail/tabs" name='DetailTabsAccessories'}{/s}">
                                    <h1>{s namespace="frontend/detail/tabs" name='DetailTabsAccessories'}{/s}</h1>
                                </a>
                            </div>
                            <div class="tab--content content--related" id="equipmentDescCont">{include file="frontend/detail/tabs/related.tpl"}</div>
                        {/block}
                    </div>
                {/if}
            {/block}

            {* Similar products slider *}
            {*if $sArticle.sSimilarArticles}
                {block name="frontend_detail_index_tabs_similar"}
                    <div class="tab--container" data-tab-id="similar">
                        {block name="frontend_detail_index_tabs_similar_inner"}
                            <div class="tab--header">
                                <a href="#" class="tab--title" title="{s name="DetailRecommendationSimilarLabel" namespace="frontend/detail/index"}{/s}">{s name="DetailRecommendationSimilarLabel" namespace="frontend/detail/index"}{/s}</a>
                            </div>
                            <div class="tab--content content--similar">{include file='frontend/detail/tabs/similar.tpl'}</div>
                        {/block}
                    </div>
                {/block}
            {/if*}

            {block name='frontend_detail_index_after_tabs'}{/block}
        {/block}
    </div>
{/block}
