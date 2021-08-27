{extends file="parent:frontend/detail/content/buy_container.tpl"}

{* Product - Base information *}
{block name='frontend_detail_index_buy_container_base_info'}
    {* Product attribute 1 *}
    {block name='frontend_detail_data_attributes_attr1'}
			<div class="ShortDescriptionForMobile">
				<p>{$sArticle.description}
				{foreach $sArticle.sProperties as $sProperty}
					{block name='frontend_detail_description_properties_content'}
						{if $sProperty.name == "Quellen"}
							<div class="technical-icons-header">
								{foreach $sProperty.media as $mediaProp}
									<img src="{$mediaProp.source}">
								{/foreach}
							</div>
						{/if}
					{/block}
				{/foreach}
				</p>
			</div>
            <li class="base-info--entry entry-attribute">
			    {if $sArticle.test_short}
                <a href="#test">
				<span class="entry--content">
                    {$sArticle.test_short}
                </span>
				</a>
				{/if}
				<a href="https://{s name="revoxstorelink"}#/Filialfinder{/s}{$sArticle.dealer}" title="Revox Händlerübersicht">
					<div class="buybox-sellerfinder">
						<span>{s name="revoxstoresellerfind"}Händler finden{/s}</span>
						<img src="themes/Frontend/Revox/frontend/_public/src/img/icons/stift.png">
					</div>
				</a>
            </li>
    {/block}
{/block}


{*---Verschoben nach buy.tpl---*}
{block name='frontend_detail_buy_laststock'}
	<div style="display: none;">
            {s name="DetailBuyInfoNotAvailable" namespace="frontend/detail/buy" assign="snippetDetailBuyInfoNotAvailable"}{/s}
			
			{if ($Locale == "de_DE") or ($Locale	== "de_CH")}
				{assign var="meldung" value="Dieser Artikel ist ca. 2 Wochen nicht lieferbar"}
			{else}
				{assign var="meldung" value="This product is not available approx 2 weeks"}
			{/if}
			
            {if !$sArticle.isAvailable && !$sArticle.sConfigurator}
				{if $sArticle.articleID == 28 || $sArticle.articleID == 48 || $sArticle.articleID == 52 || $sArticle.articleID == 62}
					{include file="frontend/_includes/messages.tpl" type="error" content=$meldung}
				{else}
					{include file="frontend/_includes/messages.tpl" type="error" content=$snippetDetailBuyInfoNotAvailable}
				{/if}
            {elseif !$sArticle.isAvailable && $sArticle.isSelectionSpecified}
				{if $sArticle.articleID == 28 || $sArticle.articleID == 48 || $sArticle.articleID == 52 || $sArticle.articleID == 62}
					{include file="frontend/_includes/messages.tpl" type="error" content=$meldung}
				{else}
					{include file="frontend/_includes/messages.tpl" type="error" content=$snippetDetailBuyInfoNotAvailable}
				{/if}
            {elseif !$sArticle.isAvailable && !$sArticle.hasAvailableVariant}
                {include file="frontend/_includes/messages.tpl" type="error" content=$snippetDetailBuyInfoNotAvailable}
            {/if}
	</div>
{/block}

{*---/Sonderlösung*}