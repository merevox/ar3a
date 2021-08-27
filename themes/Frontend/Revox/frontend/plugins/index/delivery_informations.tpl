{extends file="parent:frontend/plugins/index/delivery_informations.tpl"}

                {block name='frontend_widgets_delivery_infos_instock'}
			
                    <link itemprop="availability" href="https://schema.org/InStock" />
                    <p class="delivery--information">
						{*Abweichende Lieferzeitangabe im Artikel wird berücksichtigt*}
						{if !$sArticle.additional_details.shippingtext_active}
							<span class="delivery--text delivery--text-available">
								<i class="delivery--status-icon delivery--status-available"></i>
								{s name="DetailDataInfoInstock"}{/s}
							</span>
						{else}
							<span class="delivery--text delivery--text-more-is-coming">
                            	<i class="delivery--status-icon delivery--status-more-is-coming"></i>
								{$sArticle.additional_details.shippingtext}
							</span>
						{/if}
                    </p>
                {/block}
           