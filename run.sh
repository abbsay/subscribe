php bin/magento maintenance:enable
rm -rf var/di/*
rm -rf var/generation/*
rm -rf var/cache/*
rm -rf var/page_cache/*
rm -rf var/view_preprocessed/*
rm -rf pub/static/*
rm -rf generated
mkdir generated
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy -f
php bin/magento indexer:reindex
php bin/magento maintenance:disable
php bin/magento cache:clean
php bin/magento cache:flush
php bin/magento module:status
du -h --max-depth=1
