{extends file="parent:frontend/detail/content.tpl"}

{block name='frontend_index_content_inner'}

    {foreach $mediameetsMarketingSuite as $marketing}
		{assign var="aktshop" value=$marketing.shopId}
	{/foreach}

    {assign var="features" value=$sArticle.features}
    {assign var="threesixteen" value=$sArticle.attr30}
    {if $sArticle.sProperties}
        {assign var="technical" value="OK"}
    {/if}
    {if $sArticle.sRelatedArticles}
        {assign var="equipment" value="OK"}
    {/if}
    {if $sArticle.sDownloads}
        {assign var="manuals" value="OK"}
    {/if}
    {assign var="test" value=$sArticle.test_long}

<div class="content product--details" itemscope itemtype="https://schema.org/Product"{if !{config name=disableArticleNavigation}} data-product-navigation="{url module="widgets" controller="listing" action="productNavigation"}" data-category-id="{$sArticle.categoryID}" data-main-ordernumber="{$sArticle.mainVariantNumber}"{/if} data-ajax-wishlist="true" data-compare-ajax="true"{if $theme.ajaxVariantSwitch} data-ajax-variants-container="true"{/if}>

    {* The configurator selection is checked at this early point
       to use it in different included files in the detail template. *}
    {block name='frontend_detail_index_configurator_settings'}

        {* Variable for tracking active user variant selection *}
        {$activeConfiguratorSelection = true}

        {if $sArticle.sConfigurator && ($sArticle.sConfiguratorSettings.type == 1 || $sArticle.sConfiguratorSettings.type == 2)}
            {* If user has no selection in this group set it to false *}
            {foreach $sArticle.sConfigurator as $configuratorGroup}
                {if !$configuratorGroup.selected_value}
                    {$activeConfiguratorSelection = false}
                {/if}
            {/foreach}
        {/if}
    {/block}

    {assign var="listingimage" value=" "|explode:$sArticle.image_desktop}
    {if $listingimage[3]|count_characters > 0}
        {assign var="firstimagedesktop" value=$listingimage[1]}
        {assign var="secondimagedesktop" value=$listingimage[2]}
        {assign var="thirdimagedesktop" value=$listingimage[3]}
    {elseif $listingimage[2]|count_characters > 0}
        {assign var="firstimagedesktop" value=$listingimage[1]}
        {assign var="secondimagedesktop" value=$listingimage[2]}
        {assign var="thirdimagedesktop" value=$listingimage[0]}
    {elseif $listingimage[1]|count_characters > 0}
        {assign var="firstimagedesktop" value=$listingimage[1]}
        {assign var="secondimagedesktop" value=$listingimage[0]}
        {assign var="thirdimagedesktop" value=$listingimage[1]}
    {else}
        {assign var="firstimagedesktop" value=$listingimage[0]}
        {assign var="secondimagedesktop" value=$listingimage[0]}
        {assign var="thirdimagedesktop" value=$listingimage[0]}
    {/if}

    {assign var="listingimagem" value=" "|explode:$sArticle.image_mobile}
    {if $listingimagem[3]|count_characters > 0}
        {assign var="firstimagemobile" value=$listingimagem[1]}
        {assign var="secondimagemobile" value=$listingimagem[2]}
        {assign var="thirdimagemobile" value=$listingimagem[3]}
    {elseif $listingimagem[2]|count_characters > 0}
        {assign var="firstimagemobile" value=$listingimagem[1]}
        {assign var="secondimagemobile" value=$listingimagem[2]}
        {assign var="thirdimagemobile" value=$listingimagem[0]}
    {elseif $listingimagem[1]|count_characters > 0}
        {assign var="firstimagemobile" value=$listingimagem[1]}
        {assign var="secondimagemobile" value=$listingimagem[0]}
        {assign var="thirdimagemobile" value=$listingimagem[1]}
    {else}
        {assign var="firstimagemobile" value=$listingimagem[0]}
        {assign var="secondimagemobile" value=$listingimagem[0]}
        {assign var="thirdimagemobile" value=$listingimagem[0]}
    {/if}

    <div class="detail-revox-headerholder-desktop" style="background-image: url({$firstimagedesktop});">
        <div class="detail-revox-sellersidebar">
            <div class="detail-revox-sellersidebar-inner">
                <div class="detail-revox-sellersidebar-headline">
                    {* Product header *}
                    {block name="frontend_detail_index_header_container"}
                        {include file="frontend/detail/content/header.tpl"}
                        <p>{$sArticle.description}
                            {foreach $sArticle.sProperties as $sProperty}
                                {block name='frontend_detail_description_properties_content'}
                                    {if ($sProperty.name == "Quellen") or ($sProperty.name == "sources")}
                                        <div class="technical-icons-header">
                                            {foreach $sProperty.media as $mediaProp}
                                                <img src="{$mediaProp.source}" alt="{$mediaProp.description}">
                                            {/foreach}
                                        </div>
                                    {/if}
                                {/block}
                            {/foreach}
                        </p>
                    {/block}
                </div>
                <div class="detail-revox-sellersidebar-content">
					{if !$sArticle.no_sale}
					{/if}
                    <div class="product--detail-upper block-group">
                        {* "Buy now" box container *}
                        {block name="frontend_detail_index_buy_box_container"}
                            {include file="frontend/detail/content/buy_container.tpl"}
                        {/block}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="detail-revox-headerholder-mobile">
        <div class="detail-revox-headerholder-mobile-image">
            <img class="artikelimage" src="{$firstimagedesktop}">
        </div>
        <div class="detail-revox-sellersidebar">
            <div class="detail-revox-sellersidebar-inner">
                <div class="detail-revox-sellersidebar-headline">
                    {* Product header *}
                    {block name="frontend_detail_index_header_container"}
                        {include file="frontend/detail/content/header.tpl"}

                    {/block}
                </div>
                <div class="detail-revox-sellersidebar-content">
					{if !$sArticle.no_sale}
					{/if}
                    <div class="product--detail-upper block-group">
                        {* "Buy now" box container *}
                        {block name="frontend_detail_index_buy_box_container"}
                            {include file="frontend/detail/content/buy_container.tpl"}
                        {/block}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="mobile-absolute">
        <div class="detail-revox-jumperline" style="visibility: hidden;">
            <div class="detail-revox-innerjumperline">
                <a href="#overview"><div class="jumpline-entry" id="jumpline-overview"><h3>{s name="RevoxDetailOverview"}Übersicht{/s}</h3></div></a>
                {if $features|count_characters > 0}<a href="#benefits" ><div class="jumpline-entry" id="jumpline-features"><h3>{s name="RevoxDetailFeatures"}Features{/s}</h3></div></a>{/if}
                {if $threesixteen|count_characters > 0}<a href="#360"><div class="jumpline-entry" id="jumpline-threesixteen"><h3>{s name="RevoxDetailThreesixteen"}360° Grad{/s}</h3></div></a>{/if}
                {if $emotions}<a href="#combination"><div class="jumpline-entry" id="jumpline-combination"><h3>{s name="RevoxDetailView"}Entdecken{/s}</h3></div></a>{/if}
                {if $equipment|count_characters > 0}<a href="#equipment"><div class="jumpline-entry" id="jumpline-equipment"><h3>{s name="RevoxDetailEquipment"}Zubehör{/s}</h3></div></a>{/if}
                {if $technical|count_characters > 0}<a href="#technical"><div class="jumpline-entry" id="jumpline-technical"><h3>{s name="RevoxDetailTechnical"}Technische Details{/s}</h3></div></a>{/if}
                {if $manuals|count_characters > 0}<a href="#manuals"><div class="jumpline-entry" id="jumpline-manuals"><h3>{s name="RevoxDetailManuels"}Bedienung{/s}</h3></div></a>{/if}
                {if $test|count_characters > 0}<a href="#test"><div class="jumpline-entry" id="jumpline-test"><h3>{s name="RevoxDetailTest"}Testberichte{/s}</h3></div></a>{/if}
            </div>
            <div class="detail-revox-innerjumperline-mobil" id="mobiljumpline">
                <select name="CHOICE" onchange="visiblejumpline(this.value),location = this.value;">
                    <option value="">{s name="RevoxDetailMobil" namespace="frontend/detail/content"}Bitte auswählen...{/s}</option>
					<option value="#overview">{s name="RevoxDetailOverview" namespace="frontend/detail/content"}{/s}</option>
                    {if $features|count_characters > 0}<option value="#benefitsm">{s name="RevoxDetailFeatures" namespace="frontend/detail/content"}{/s}</option>{/if}
                    {if $threesixteen|count_characters > 0}<option value="#360">{s name="RevoxDetailThreesixteen" namespace="frontend/detail/content"}{/s}</option>{/if}
                    {if $emotions}<option value="#combination">{s name="RevoxDetailView" namespace="frontend/detail/content"}{/s}</option>{/if}
                    {if $equipment|count_characters > 0}<option value="#equipment">{s name="RevoxDetailEquipment" namespace="frontend/detail/content"}{/s}</option>{/if}
                    {if $technical|count_characters > 0}<option value="#technicalm">{s name="RevoxDetailTechnical" namespace="frontend/detail/content"}{/s}</option>{/if}
                    {if $manuals|count_characters > 0}<option value="#manuals">{s name="RevoxDetailManuels" namespace="frontend/detail/content"}{/s}</option>{/if}
                    {if $test|count_characters > 0}<option value="#test">{s name="RevoxDetailTest" namespace="frontend/detail/content"}{/s}</option>{/if}
                </select>
            </div>
        </div>
        <div class="detail-revox-overview" id="overview" onmouseover="stickyOnHover('jumpline-overview')" onmouseout="stickyOffHover('jumpline-overview')">
            <div class="detail-revox-overview-description">
                <div class="detail-revox-overview-image">
                    <div class="product--detail-upper block-group">
                        {* Product image *}
                        {block name='frontend_detail_index_image_container'}
                            {debug}
                            <div class="product--image-container image-slider{if $sArticle.image && {config name=sUSEZOOMPLUS}} product--image-zoom{/if}"
                                    {if $sArticle.image}
                                data-image-slider="true"
                                data-image-gallery="true"
                                data-maxZoom="{$theme.lightboxZoomFactor}"
                                data-thumbnails=".image--thumbnails"
                                    {/if}>
                                {block name="frontend_detail_index_image"}
                                    {include file="frontend/detail/image.tpl"}
                                {/block}
                            </div>
                        {/block}
                    </div>
                </div>

                {* Product description *}
                {block name='frontend_detail_description_text'}
                    <div class="product--description" itemprop="description">
					    {if $sArticle.variant_title}<h4><strong>{$sArticle.variant_title}</strong></h4>{/if}
                        {assign var="beschreibung" value="</p>"|explode:$sArticle.description_long}
                        {$beschreibung[0]}
                        {if $sArticle.video_mpfour && $sArticle.video_ogv && $sArticle.video_webm}
                            {* Vorschaubild zur Video Ausgabe wird unter den ersten Absatz psoitioniert *}
                            <div class="detailmodal">
                                <iframe width="400" height="250" src="https://www.youtube-nocookie.com/embed/{$sArticle.video_mpfour}?playlist={$sArticle.video_mpfour}&loop=1&showinfo=0" frameborder="0" allow="autoplay; encrypted-media;" allowfullscreen></iframe>
                            </div>
                        {/if}
                        {foreach $beschreibung as $ausgabe}
                            {if !$two}
                                {assign var="two" value="true"}
                            {else}
                                {$ausgabe}
                            {/if}
                        {/foreach}
                        {if $sArticle.variant_text}<p>{$sArticle.variant_text}</p>{/if}
                        {foreach $sArticle.sProperties as $sProperty}
                            {block name='frontend_detail_description_properties_content'}
                                {if ($sProperty.name == "Quellen") or ($sProperty.name == "sources")}
                                    <div class="technical-spring-icons">
                                        {foreach $sProperty.media as $mediaProp}
                                            <img src="{$mediaProp.source}">
                                        {/foreach}
                                    </div>
                                {/if}
                            {/block}
                        {/foreach}
                    </div>
                {/block}
            </div>
        </div>

        {if $features|count_characters > 0}
            <div class="detail-revox-benefits-desktop" id="benefits" style="background-image: url({$secondimagedesktop});" onmouseover="stickyOnHover('jumpline-features')" onmouseout="stickyOffHover('jumpline-features')">
                <div class="detail-revox-inner-overview">
                    <div class="detail-revox-inner-headline"><h1>{s name="RevoxDetailFeatures" namespace="frontend/detail/content"}{/s}</h1></div>
                    <div class="detail-revox-inner-description">
                        {assign var="benefits" value="; "|explode:$sArticle.features}
                        {foreach $benefits as $features}
                            <h4>{$features}</h4>
                        {/foreach}
                    </div>
                </div>
            </div>
        {/if}
        {if $features|count_characters > 0}
            <div class="detail-revox-benefits-mobile" id="benefitsm" style="background-image: url({$secondimagemobile});">
                <div class="detail-revox-inner-overview">
                    <div class="detail-revox-inner-headline"><h1>{s name="RevoxDetailFeatures" namespace="frontend/detail/content"}{/s}</h1></div>
                    <div class="detail-revox-inner-description">
                        {assign var="benefits" value="; "|explode:$sArticle.features}
                        {foreach $benefits as $features}
                            <h4>{$features}</h4>
                        {/foreach}
                    </div>
                </div>
            </div>
        {/if}

        {if $threesixteen|count_characters > 0}
            <div class="detail-revox-360" id="360" onmouseover="stickyOnHover('jumpline-threesixteen')" onmouseout="stickyOffHover('jumpline-threesixteen')">
                <div class="detail-revox-inner-overview">
                    <div class="detail-revox-inner-headline"><h1>{s name="RevoxDetailThreesixteen" namespace="frontend/detail/content"}{/s}</h1></div>
                    <div class="detail-revox-inner-description"></div>
                </div>
            </div>
        {/if}

        {if {config name="position" namespace="saltyDetailPageEmotions"} == "bd" }
            <div id="combination"></div>
            {include file="frontend/detail/emotion.tpl" clear=false class="content--detail-emotions--below-description"}
        {/if}

        {if $equipment|count_characters > 0}
            <div class="detail-revox-equipment" id="equipment" onmouseover="stickyOnHover('jumpline-equipment')" onmouseout="stickyOffHover('jumpline-equipment')">
                <div class="detail-revox-inner-overview">
                  <div class="detail-revox-inner-headline"><h1>{s name="RevoxDetailEquipment" namespace="frontend/detail/content"}{/s}</h1></div>
                    <div class="detail-revox-inner-description">

                        {* Crossselling tab panel *}
                        {block name="frontend_detail_index_tabs_cross_selling"}
                            {$showAlsoViewed = {config name=similarViewedShow}}
                            {$showAlsoBought = {config name=alsoBoughtShow}}
                            <div class="tab-menu--cross-selling"{if $sArticle.relatedProductStreams} data-scrollable="true"{/if}>

                                {* Tab navigation *}
                                {block name="frontend_detail_index_tabs_navigation_container"}

                                {/block}

                                {* Tab content container *}
                                {block name="frontend_detail_index_tab_container"}
                                    {include file="frontend/detail/content/tab_container.tpl"}
                                {/block}
                            </div>
                        {/block}

                    </div>
                </div>
            </div>
        {/if}

        {if $technical|count_characters > 0}
            <div class="detail-revox-technical-desktop" id="technical" {if $threesixteen|count_characters < 0} style="background-image: url({$thirdimagedesktop});" {/if}  onmouseover="stickyOnHover('jumpline-technical')" onmouseout="stickyOffHover('jumpline-technical')">
                <div class="detail-revox-inner-overview" {if $threesixteen|count_characters > 0} {else} style="background-color: #fff" {/if}>
                    <div class="detail-revox-inner-headline"><h1>{s name="RevoxDetailTechnical" namespace="frontend/detail/content"}{/s}</h1></div>
                    <div class="detail-revox-inner-description">
                        {* Properties *}
                        {block name='frontend_detail_description_properties'}
                            {if $sArticle.sProperties}
                                <div class="technical-label">
                                    <p><b>{s name="RevoxDetailMasse" namespace="frontend/detail/content"}Maße{/s}</b></p>
                                    <p> {s name="RevoxDetailWeight" namespace="frontend/detail/content"}Gewicht: {/s}{$sArticle.weight}<br>
                                        {s name="RevoxDetailLength" namespace="frontend/detail/content"}Länge: {/s}{$sArticle.length}<br>
                                        {s name="RevoxDetailHeigh" namespace="frontend/detail/content"}Höhe: {/s}{$sArticle.height}<br>
                                        {s name="RevoxDetailWidth" namespace="frontend/detail/content"}Breite: {/s}{$sArticle.width}</p>
                                </div>
                                {foreach $sArticle.sProperties as $sProperty}
									{if $sProperty.name|strstr:"Digitec"}
									{else}
										<div class="technical-label">
											{block name='frontend_detail_description_properties_label'}
												<p><b>{$sProperty.name|escape}</b></p>
											{/block}
											{block name='frontend_detail_description_properties_content'}
												<p>{$sProperty.value|escape}</p>
											{/block}
										</div>
									{/if}
                                {/foreach}
                            {/if}
                        {/block}
                    </div>
                </div>
            </div>
        {/if}
        {if $technical|count_characters > 0}
            <div class="detail-revox-technical-mobile" id="technicalm" {if $threesixteen|count_characters < 0} style="background-image: url({$thirdimagemobile});" {/if}>
                <div class="detail-revox-inner-overview" {if $threesixteen|count_characters > 0} {else} style="background-color: #fff" {/if}>
					<div class="detail-revox-inner-headline">
						<a href="javascript:toggle('technicalmDesc')">
							<h1>{s name="RevoxDetailTechnical" namespace="frontend/detail/content"}{/s}</h1>
						</a>
					</div>
                    <div class="detail-revox-inner-description" id="technicalmDesc" style="max-height:1px;">
                        {* Properties *}
                        {block name='frontend_detail_description_properties'}
                            {if $sArticle.sProperties}
                                <div class="technical-label">
                                    <p><b>{s name="RevoxDetailMasse" namespace="frontend/detail/content"}Maße{/s}</b></p>
                                    <p> {s name="RevoxDetailWeight" namespace="frontend/detail/content"}Gewicht: {/s}{$sArticle.weight}<br>
                                        {s name="RevoxDetailLength" namespace="frontend/detail/content"}Länge: {/s}{$sArticle.length}<br>
                                        {s name="RevoxDetailHeigh" namespace="frontend/detail/content"}Höhe: {/s}{$sArticle.height}<br>
                                        {s name="RevoxDetailWidth" namespace="frontend/detail/content"}Breite: {/s}{$sArticle.width}</p>
                                </div>
                                {foreach $sArticle.sProperties as $sProperty}
									{if $sProperty.name|strstr:"Digitec"}
									{else}
										<div class="technical-label">
											{block name='frontend_detail_description_properties_label'}
												<p><b>{$sProperty.name|escape}</b></p>
											{/block}
											{block name='frontend_detail_description_properties_content'}
												<p>{$sProperty.value|escape}</p>
											{/block}
										</div>
									{/if}
                                {/foreach}
                            {/if}
                        {/block}
                    </div>
                </div>
            </div>
        {/if}
        {if $manuals|count_characters > 0}
            <div class="detail-revox-manuals" id="manuals" onmouseover="stickyOnHover('jumpline-manuals')" onmouseout="stickyOffHover('jumpline-manuals')">
                <div class="detail-revox-inner-overview">
					<div class="detail-revox-inner-headline">
						<a href="javascript:toggle('manualsDesc')">
							<h1>{s name="RevoxDetailManuels" namespace="frontend/detail/content"}{/s}</h1>
						</a>
						<h1 class="desktop--headline">{s name="RevoxDetailManuels" namespace="frontend/detail/content"}{/s}</h1>
					</div>
                    <div class="detail-revox-inner-description" id="manualsDesc" style="max-height:1px;">
                        {*Download List von description.tpl*}
                        {block name='frontend_detail_description_downloads_content'}
                            {foreach $sArticle.sDownloads as $download}
								 	{if ($Locale == "en_GB")}
								 		{if $download.description|strstr:"en_"}
											{block name='frontend_detail_description_downloads_content_link'}
												{s name="DetailDescriptionLinkDownload" assign="snippetDetailDescriptionLinkDownload"}{/s}
												<a href="{$download.filename}" target="_blank" class="content--link link--download" title="{$snippetDetailDescriptionLinkDownload|escape} {$download.description|escape}">
													<div class="inner-manuals-entry">
														<p><img src="themes/Frontend/Revox/frontend/_public/src/img/icons/downlaod.png" alt="{$download.description}"></p>
														<p>{$download.description|substr:3}</p>
													</div>
												</a>
											{/block}
										{/if}
									{elseif !$download.description|strstr:"en_"}
										{block name='frontend_detail_description_downloads_content_link'}
											{s name="DetailDescriptionLinkDownload" assign="snippetDetailDescriptionLinkDownload"}{/s}
											<a href="{$download.filename}" target="_blank" class="content--link link--download" title="{$snippetDetailDescriptionLinkDownload|escape} {$download.description|escape}">
												<div class="inner-manuals-entry">
													<p><img src="themes/Frontend/Revox/frontend/_public/src/img/icons/downlaod.png" alt="{$download.description}"></p>
													<p>{$download.description}</p>
												</div>
											</a>
										{/block}
								 	{/if}
                            {/foreach}
                        {/block}
                    </div>
                </div>
            </div>
        {/if}
        {if $test|count_characters > 0}
            <div class="detail-revox-test" id="test" onmouseover="stickyOnHover('jumpline-test')" onmouseout="stickyOffHover('jumpline-test')">
                <div class="detail-revox-inner-overview">
					<div class="detail-revox-inner-headline">
						<a href="javascript:toggle('testDesc')">
							<h1>{s name="RevoxDetailTest" namespace="frontend/detail/content"}{/s}</h1>
						</a>
						<h1 class="desktop--headline">{s name="RevoxDetailTest" namespace="frontend/detail/content"}{/s}</h1>
					</div>
                    <div class="detail-revox-inner-description" id="testDesc" style="max-height:1px;">
                        {$sArticle.test_long}
                    </div>
                </div>
            </div>
        {/if}

        {* Product bundle hook point *}
        {block name="frontend_detail_index_bundle"}
        {/block}

        {block name="frontend_detail_index_detail"}
            {if $hasEmotion}

            {/if}
        {/block}
    </div>
{/block}
