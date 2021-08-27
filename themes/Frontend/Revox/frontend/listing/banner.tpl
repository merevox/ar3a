{extends file="parent:frontend/listing/banner.tpl"}


{*Abholen des ersten Bildes mit anzeige*}
{block name="frontend_listing_banner"}
    {foreach $sCategories as $categories}
        {foreach $categories.subcategories as $subcats}
			{foreach $sAdvancedMenu as $advancedMenu}
				{foreach $advancedMenu.sub as $advancedFirstSub}
					{foreach $advancedFirstSub.sub as $advancedSecondSub}
						{if $advancedSecondSub.parentId == $subcats.id}
							{if !$subcatpicturecheck}
								{assign var="firstpicturedesktop" value=$advancedSecondSub.attribute.catpicturedesktop}
								{assign var="firstpicturemobile" value=$advancedSecondSub.attribute.catpicturemobil}
								{assign var="subcatpicturecheck" value=1}
							{/if}
						{/if}
					{/foreach}
				{/foreach}
			{/foreach}
            {foreach $sArticles as $articles}
                {if $articles.sub_categorie|strstr:{$subcats.id}}
                    {if !$subcatpicturecheck}
                        {assign var="listingimagemobile" value=" "|explode:$articles.image_mobile}
                        {assign var="firstpicturemobile" value=$listingimagemobile[0]}
                        {assign var="listingimagedesktop" value=" "|explode:$articles.image_desktop}
                        {assign var="firstpicturedesktop" value=$listingimagedesktop[0]}
                        {assign var="subcatpicturecheck" value=1}
                    {/if}
                {/if}
            {/foreach}
        {/foreach}
    {/foreach}
    {if !$firstpicturedesktop}
        {foreach $sArticles as $articles}
            {if !$catpicturecheck}
                {assign var="listingimagemobile" value=" "|explode:$articles.image_mobile}
                {assign var="firstpicturemobile" value=$listingimagemobile[0]}
                {assign var="listingimagedesktop" value=" "|explode:$articles.image_desktop}
                {assign var="firstpicturedesktop" value=$listingimagedesktop[0]}
                {assign var="catpicturecheck" value=1}
            {/if}
        {/foreach}
    {/if}

	{foreach $mediameetsMarketingSuite as $marketing}
		{assign var="aktshop" value=$marketing.shopId}
	{/foreach}

	<div class="category-fading-desktop">
        <div class="category-fading-menu">
            <h1>{$sCategoryContent.name}</h1>
            <div id="listing-fading-controls">
                {foreach $sCategories as $categories}
                    {foreach $categories.subcategories as $subcats}
						{if $subcats.attribute.headline == 0}
							<a class="subtitle {if !$firstaction}sub--active{/if}" id="sub{$subcats.id}" href="javascript:categorymenuebar('{$subcats.id}')">
								<h2>{$subcats.name}</h2>
							</a>
						{else}
							<h1>{$subcats.name}</h1>
						{/if}
						<div class="subcategories {if !$firstaction}subopen{/if}" id="{$subcats.id}" style="{if !$firstaction}max-height: 550px;{else}max-height: 1px;{/if} transition: max-height 0.5s ease;">
								{if $subcats.childrenCount > 0}
									{foreach $sAdvancedMenu as $advancedMenu}
										{foreach $advancedMenu.sub as $advancedFirstSub}
											{foreach $advancedFirstSub.sub as $advancedSecondSub}
												{if $advancedSecondSub.parentId == $subcats.id}
													<a href="{$advancedSecondSub.link}" class="{if !$firstproduct}isartactive{/if}" id="{$advancedSecondSub.id}" onmouseover="swapNewBackground('{$advancedSecondSub.attribute.catpicturedesktop}','{$advancedSecondSub.link}','{$subcats.id}','{$advancedSecondSub.id}')"><h3>{$advancedSecondSub.name}</h3></a>
													{if !$firstproduct}
														{assign var="firstproduct" value=$advancedSecondSub.link}
													{/if}
												{/if}
											{/foreach}
										{/foreach}
									{/foreach}
								{/if}
							{foreach $sArticles as $articles}
								{if $articles.sub_categorie|strstr:{$subcats.id}}
									{assign var="listingimagedesktopinner" value=" "|explode:$articles.image_desktop}
									<a href="{$articles.linkDetails}" class="{if !$firstproduct}isartactive{/if}" id="{$articles.articleID}" onmouseover="swapNewBackground('{$listingimagedesktopinner[0]}','{$articles.linkDetails}','{$subcats.id}','{$articles.articleID}')"><h3>{$articles.articleName}</h3></a>
									{if !$firstproduct}
										{assign var="firstproduct" value=$articles.linkDetails}
									{/if}
								{/if}
							{/foreach}
						</div>
						{assign var='firstaction' value=1}
                    {/foreach}
                {/foreach}
                {if !$firstaction}
					<div class="subcategories sub--active" id="sub99">
                    {foreach $sArticles as $articles}
                        {assign var="listingimagedesktopinner" value=" "|explode:$articles.image_desktop}
                        <a href="{$articles.linkDetails}" class="{if !$firstproduct}isartactive{/if}" id="{$articles.articleID}" onmouseover="swapSmallBackground('{$listingimagedesktopinner[0]}','{$articles.linkDetails}','{$articles.articleID}')"><h3>{$articles.articleName}</h3></a>
						{if !$firstproduct}
							{assign var="firstproduct" value=$articles.linkDetails}
						{/if}
                    {/foreach}
					</div>
                {/if}
            </div>
        </div>
		<a href="{$firstlink}" id="backgroundlink">
			<img id="categorybackgroundpicture" class="desktopbild" style="background-image: url({$firstpicturedesktop});">
            <img id="categorybackgroundpicture" class="mobilebild" src="{$firstpicturemobile}">
        </div>
		</a>
    </div>
	
	<div class="category-fading-desktop-test" style="display: none;"">
    <div class="category-background">
        <a href="{$firstlink}" id="backgroundlink">
            <img id="categorybackgroundpicture" class="desktopbild" style="background-image: url({$firstpicturedesktop});">
            <img id="categorybackgroundpicture" class="mobilebild" src="{$firstpicturemobile}">
        </a>
    </div>
    <div class="category-fading-menu">
        <h1>{$sCategoryContent.name}</h1>
        <div id="listing-fading-controls">
            {foreach $sCategories as $categories}
                {foreach $categories.subcategories as $subcats}
                {if $subcats.attribute.headline == 0}
                <a class="subtitle {if !$firstaction}sub--active{/if}" id="sub{$subcats.id}" href="javascript:categorymenuebar('{$subcats.id}')">
                    <h2>{$subcats.name}</h2>
                </a>
                {else}
                <h1>{$subcats.name}</h1>
                {/if}
                <div class="subcategories {if !$firstaction}subopen{/if}" id="{$subcats.id}" style="{if !$firstaction}max-height: 550px;{else}max-height: 1px;{/if} transition: max-height 0.5s ease;">
                    {if $subcats.childrenCount > 0}
                    {foreach $sAdvancedMenu as $advancedMenu}
                        {foreach $advancedMenu.sub as $advancedFirstSub}
                            {foreach $advancedFirstSub.sub as $advancedSecondSub}
                                {if $advancedSecondSub.parentId == $subcats.id}
                                    <a href="{$advancedSecondSub.link}" class="{if !$firstproduct}isartactive{/if}" id="{$advancedSecondSub.id}" onmouseover="swapNewBackground('{$advancedSecondSub.attribute.catpicturedesktop}','{$advancedSecondSub.link}','{$subcats.id}','{$advancedSecondSub.id}')"><h3>{$advancedSecondSub.name}</h3></a>
                                    {if !$firstproduct}
                                        {assign var="firstproduct" value=$advancedSecondSub.link}
                                    {/if}
                                {/if}
                            {/foreach}
                        {/foreach}
                    {/foreach}
                    {/if}
                    {foreach $sArticles as $articles}
                        {if $articles.sub_categorie|strstr:{$subcats.id}}
                            {assign var="listingimagedesktopinner" value=" "|explode:$articles.image_desktop}
                                <a href="{$articles.linkDetails}" class="{if !$firstproduct}isartactive{/if}" id="{$articles.articleID}" onmouseover="swapNewBackground('{$listingimagedesktopinner[0]}','{$articles.linkDetails}','{$subcats.id}','{$articles.articleID}')"><h3>{$articles.articleName}</h3></a>
                            {if !$firstproduct}
                                {assign var="firstproduct" value=$articles.linkDetails}
                            {/if}
                        {/if}
                    {/foreach}
                </div>
                {assign var='firstaction' value=1}
                {/foreach}
            {/foreach}
            {if !$firstaction}
            <div class="subcategories sub--active" id="sub99">
                {foreach $sArticles as $articles}
                    {assign var="listingimagedesktopinner" value=" "|explode:$articles.image_desktop}
                        <a href="{$articles.linkDetails}" class="{if !$firstproduct}isartactive{/if}" id="{$articles.articleID}" onmouseover="swapSmallBackground('{$listingimagedesktopinner[0]}','{$articles.linkDetails}','{$articles.articleID}')"><h3>{$articles.articleName}</h3></a>
                    {if !$firstproduct}
                        {assign var="firstproduct" value=$articles.linkDetails}
                    {/if}
                {/foreach}
            </div>
            {/if}
        </div>
    </div>
</div>
{/block}


