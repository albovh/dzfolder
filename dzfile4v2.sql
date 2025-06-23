
-- select * from public.facebook_ads_basic_daily
-- select * from public.facebook_campaign

with datas_table as (
    select ad_date, 'Facebook Ads' AS media_source, campaign_name, adset_name,
    spend, impressions, reach, clicks, leads, value
    from public.facebook_ads_basic_daily
    left join facebook_adset on facebook_ads_basic_daily.adset_id = facebook_adset.adset_id
    left join facebook_campaign on facebook_ads_basic_daily.campaign_id = facebook_campaign.campaign_id

    union all

    select ad_date, 'Google Ads' AS media_source, campaign_name, adset_name, 
    spend, impressions, reach, clicks, leads, value
    from public.google_ads_basic_daily

) 
select ad_date, media_source, campaign_name, adset_name,
sum(spend) as "spend sum",
sum(impressions) as "impressions sum",
sum(clicks) as "clicks sum",
sum(value) as "value sum"
from datas_table
group by ad_date, media_source, campaign_name, adset_name

