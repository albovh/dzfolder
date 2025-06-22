
--select * from public.facebook_ads_basic_daily
--select * from public.google_ads_basic_daily

with cte_fcb as (
    select ad_date, 
        'Facebook Ads' as media_source, 
        spend, impressions, reach, clicks, leads, value
    from public.facebook_ads_basic_daily

    union all

    select ad_date,
        'Google Ads' as media_source, 
        spend, impressions, reach, clicks, leads, value
    from public.google_ads_basic_daily

) 
select ad_date, media_source, 
sum(spend) as "spend sum",
sum(impressions) as "impressions sum",
sum(reach) as "reach sum",
sum(clicks) as "clicks sum",
sum(leads) as "leads sum",
sum(value) as "value sum"
from cte_fcb
group by ad_date, media_source