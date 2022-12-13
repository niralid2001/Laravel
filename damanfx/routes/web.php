<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('language/{locale}', function ($locale) {
    app()->setLocale($locale);
    session()->put('locale', $locale);
    return redirect()->back();
});
Route::group(['prefix' => 'backend','as' => 'admin_'], function() {
    Route::get('login', [App\Http\Controllers\Backend\Auth\LoginController::class, 'showLoginForm'])->name('login');
    Route::post('checkedlogin', [App\Http\Controllers\Backend\Auth\LoginController::class, 'login'])->name('checkedlogin');
    Route::get('logout/', [App\Http\Controllers\Backend\Auth\LoginController::class, 'logout'])->name('logout');
    Route::get('/', [App\Http\Controllers\Backend\Auth\LoginController::class, 'showLoginForm'])->name('login');

    Route::group(['middleware' => 'auth:admin'], function () {
        Route::get('/dashboard', [App\Http\Controllers\Backend\DashboardController::class, 'index'])->name('dashboard');

        Route::get('change-password', [App\Http\Controllers\Backend\DashboardController::class, 'showchangePasswordForm'])->name('change-password');
        Route::post('change-password', [App\Http\Controllers\Backend\DashboardController::class, 'changePassword'])->name('change-password');

        Route::get('site-settings', [\App\Http\Controllers\Backend\SettingsController::class, 'index'])->name('site-settings');
        Route::post('site-settings', [\App\Http\Controllers\Backend\SettingsController::class, 'update'])->name('site-settings');
        Route::get('settings-reward', [\App\Http\Controllers\Backend\SettingsController::class, 'settingReward'])->name('settings-reward');
        Route::post('settings-reward', [\App\Http\Controllers\Backend\SettingsController::class, 'settingRewardupdate'])->name('settings-reward');

        Route::get('ads', [\App\Http\Controllers\Backend\AdsController::class, 'index'])->name('ads');
        Route::post('ads-update', [\App\Http\Controllers\Backend\AdsController::class, 'update'])->name('ads-update');

        Route::get('email-templates', [\App\Http\Controllers\Backend\EmailTemplatesController::class, 'index'])->name('email-templates');
        Route::post('email-templates', [\App\Http\Controllers\Backend\EmailTemplatesController::class, 'update'])->name('email-templates');

        Route::get('pages',[App\Http\Controllers\Backend\PageController::class, 'index'])->name('pages');
        Route::get('page-create',[App\Http\Controllers\Backend\PageController::class, 'create'])->name('page-create');
        Route::post('page-store',[App\Http\Controllers\Backend\PageController::class, 'store'])->name('page-store');
        Route::get('page-edit/{id}',[App\Http\Controllers\Backend\PageController::class, 'edit'])->name('page-edit');
        Route::post('page-update/{id}',[App\Http\Controllers\Backend\PageController::class, 'update'])->name('page-update');
        Route::get('page-delete/{id}', [App\Http\Controllers\Backend\PageController::class, 'destroy'])->name('page-delete');
        Route::post('page-datatable', [App\Http\Controllers\Backend\PageController::class, 'pagesDatatable'])->name('page-datatable');

        Route::get('smtp', [App\Http\Controllers\Backend\SMTPController::class, 'index'])->name('smtp');
        Route::post('smtp_update', [App\Http\Controllers\Backend\SMTPController::class, 'update'])->name('smtp_update');

        Route::get('trading-platforms',[App\Http\Controllers\Backend\TradingPlatformController::class, 'index'])->name('trading-platforms');
        Route::get('trading-platform-create',[App\Http\Controllers\Backend\TradingPlatformController::class, 'create'])->name('trading-platform-create');
        Route::post('trading-platform-store',[App\Http\Controllers\Backend\TradingPlatformController::class, 'store'])->name('trading-platform-store');
        Route::get('trading-platform-edit/{id}',[App\Http\Controllers\Backend\TradingPlatformController::class, 'edit'])->name('trading-platform-edit');
        Route::post('trading-platform-update/{id}',[App\Http\Controllers\Backend\TradingPlatformController::class, 'update'])->name('trading-platform-update');
        Route::get('trading-platform-delete/{id}', [App\Http\Controllers\Backend\TradingPlatformController::class, 'destroy'])->name('trading-platform-delete');
        Route::post('trading-platform-datatable', [App\Http\Controllers\Backend\TradingPlatformController::class, 'tradingPlatformDatatable'])->name('trading-platform-datatable');

        Route::get('licenses',[App\Http\Controllers\Backend\LicenseController::class, 'index'])->name('licenses');
        Route::get('license-create',[App\Http\Controllers\Backend\LicenseController::class, 'create'])->name('license-create');
        Route::post('license-store',[App\Http\Controllers\Backend\LicenseController::class, 'store'])->name('license-store');
        Route::get('license-edit/{id}',[App\Http\Controllers\Backend\LicenseController::class, 'edit'])->name('license-edit');
        Route::post('license-update/{id}',[App\Http\Controllers\Backend\LicenseController::class, 'update'])->name('license-update');
        Route::get('license-delete/{id}', [App\Http\Controllers\Backend\LicenseController::class, 'destroy'])->name('license-delete');
        Route::post('license-datatable', [App\Http\Controllers\Backend\LicenseController::class, 'licenseDatatable'])->name('license-datatable');

        Route::get('account-types',[App\Http\Controllers\Backend\AccountTypeController::class, 'index'])->name('account-types');
        Route::get('account-type-create',[App\Http\Controllers\Backend\AccountTypeController::class, 'create'])->name('account-type-create');
        Route::post('account-type-store',[App\Http\Controllers\Backend\AccountTypeController::class, 'store'])->name('account-type-store');
        Route::get('account-type-edit/{id}',[App\Http\Controllers\Backend\AccountTypeController::class, 'edit'])->name('account-type-edit');
        Route::post('account-type-update/{id}',[App\Http\Controllers\Backend\AccountTypeController::class, 'update'])->name('account-type-update');
        Route::get('account-type-delete/{id}', [App\Http\Controllers\Backend\AccountTypeController::class, 'destroy'])->name('account-type-delete');
        Route::post('account-type-datatable', [App\Http\Controllers\Backend\AccountTypeController::class, 'accountTypeDatatable'])->name('account-type-datatable');

        Route::get('bonus-types',[App\Http\Controllers\Backend\BonusTypeController::class, 'index'])->name('bonus-types');
        Route::get('bonus-type-create',[App\Http\Controllers\Backend\BonusTypeController::class, 'create'])->name('bonus-type-create');
        Route::post('bonus-type-store',[App\Http\Controllers\Backend\BonusTypeController::class, 'store'])->name('bonus-type-store');
        Route::get('bonus-type-edit/{id}',[App\Http\Controllers\Backend\BonusTypeController::class, 'edit'])->name('bonus-type-edit');
        Route::post('bonus-type-update/{id}',[App\Http\Controllers\Backend\BonusTypeController::class, 'update'])->name('bonus-type-update');
        Route::get('bonus-type-delete/{id}', [App\Http\Controllers\Backend\BonusTypeController::class, 'destroy'])->name('bonus-type-delete');
        Route::post('bonus-type-datatable', [App\Http\Controllers\Backend\BonusTypeController::class, 'bonusTypeDatatable'])->name('bonus-type-datatable');

        Route::get('payment-options',[App\Http\Controllers\Backend\PaymentOptionController::class, 'index'])->name('payment-options');
        Route::get('payment-option-create',[App\Http\Controllers\Backend\PaymentOptionController::class, 'create'])->name('payment-option-create');
        Route::post('payment-option-store',[App\Http\Controllers\Backend\PaymentOptionController::class, 'store'])->name('payment-option-store');
        Route::get('payment-option-edit/{id}',[App\Http\Controllers\Backend\PaymentOptionController::class, 'edit'])->name('payment-option-edit');
        Route::post('payment-option-update/{id}',[App\Http\Controllers\Backend\PaymentOptionController::class, 'update'])->name('payment-option-update');
        Route::get('payment-option-delete/{id}', [App\Http\Controllers\Backend\PaymentOptionController::class, 'destroy'])->name('payment-option-delete');
        Route::post('payment-option-datatable', [App\Http\Controllers\Backend\PaymentOptionController::class, 'paymentOptionDatatable'])->name('payment-option-datatable');

        Route::get('trading-assets',[App\Http\Controllers\Backend\TradingAssetController::class, 'index'])->name('trading-assets');
        Route::get('trading-asset-create',[App\Http\Controllers\Backend\TradingAssetController::class, 'create'])->name('trading-asset-create');
        Route::post('trading-asset-store',[App\Http\Controllers\Backend\TradingAssetController::class, 'store'])->name('trading-asset-store');
        Route::get('trading-asset-edit/{id}',[App\Http\Controllers\Backend\TradingAssetController::class, 'edit'])->name('trading-asset-edit');
        Route::post('trading-asset-update/{id}',[App\Http\Controllers\Backend\TradingAssetController::class, 'update'])->name('trading-asset-update');
        Route::get('trading-asset-delete/{id}', [App\Http\Controllers\Backend\TradingAssetController::class, 'destroy'])->name('trading-asset-delete');
        Route::post('trading-asset-datatable', [App\Http\Controllers\Backend\TradingAssetController::class, 'tradingAssetDatatable'])->name('trading-asset-datatable');

        Route::get('news',[App\Http\Controllers\Backend\NewsController::class, 'index'])->name('news');
        Route::get('news-create',[App\Http\Controllers\Backend\NewsController::class, 'create'])->name('news-create');
        Route::post('news-store',[App\Http\Controllers\Backend\NewsController::class, 'store'])->name('news-store');
        Route::get('news-edit/{id}',[App\Http\Controllers\Backend\NewsController::class, 'edit'])->name('news-edit');
        Route::post('news-update/{id}',[App\Http\Controllers\Backend\NewsController::class, 'update'])->name('news-update');
        Route::get('news-delete/{id}', [App\Http\Controllers\Backend\NewsController::class, 'destroy'])->name('news-delete');
        Route::post('news-datatable', [App\Http\Controllers\Backend\NewsController::class, 'newsDatatable'])->name('news-datatable');

        Route::get('articals',[App\Http\Controllers\Backend\ArticalController::class, 'index'])->name('articals');
        Route::get('artical-create',[App\Http\Controllers\Backend\ArticalController::class, 'create'])->name('artical-create');
        Route::post('artical-store',[App\Http\Controllers\Backend\ArticalController::class, 'store'])->name('artical-store');
        Route::get('artical-edit/{id}',[App\Http\Controllers\Backend\ArticalController::class, 'edit'])->name('artical-edit');
        Route::post('artical-update/{id}',[App\Http\Controllers\Backend\ArticalController::class, 'update'])->name('artical-update');
        Route::get('artical-delete/{id}', [App\Http\Controllers\Backend\ArticalController::class, 'destroy'])->name('artical-delete');
        Route::post('artical-datatable', [App\Http\Controllers\Backend\ArticalController::class, 'articalDatatable'])->name('artical-datatable');

        Route::get('brokers',[App\Http\Controllers\Backend\BrokerController::class, 'index'])->name('brokers');
        Route::get('broker-create',[App\Http\Controllers\Backend\BrokerController::class, 'create'])->name('broker-create');
        Route::post('broker-store',[App\Http\Controllers\Backend\BrokerController::class, 'store'])->name('broker-store');
        Route::get('broker-edit/{id}',[App\Http\Controllers\Backend\BrokerController::class, 'edit'])->name('broker-edit');
        Route::post('broker-update/{id}',[App\Http\Controllers\Backend\BrokerController::class, 'update'])->name('broker-update');
        Route::get('broker-detail/{slug?}',[App\Http\Controllers\Backend\BrokerController::class, 'detail'])->name('broker-detail');
        Route::get('broker-delete/{id}', [App\Http\Controllers\Backend\BrokerController::class, 'destroy'])->name('broker-delete');
        Route::post('broker-datatable', [App\Http\Controllers\Backend\BrokerController::class, 'brokerDatatable'])->name('broker-datatable');
        Route::get('broker-reviews/{broker_id}', [App\Http\Controllers\Backend\BrokerController::class, 'brokerReviews'])->name('broker-reviews');
        Route::post('broker-review-datatable', [App\Http\Controllers\Backend\BrokerController::class, 'brokerReviewDatatable'])->name('broker-review-datatable');

        Route::get('bonus',[App\Http\Controllers\Backend\BonusController::class, 'index'])->name('bonus');
        Route::get('bonus-create',[App\Http\Controllers\Backend\BonusController::class, 'create'])->name('bonus-create');
        Route::post('bonus-store',[App\Http\Controllers\Backend\BonusController::class, 'store'])->name('bonus-store');
        Route::get('bonus-edit/{id}',[App\Http\Controllers\Backend\BonusController::class, 'edit'])->name('bonus-edit');
        Route::post('bonus-update/{id}',[App\Http\Controllers\Backend\BonusController::class, 'update'])->name('bonus-update');
        Route::get('bonus-delete/{id}', [App\Http\Controllers\Backend\BonusController::class, 'destroy'])->name('bonus-delete');
        Route::post('bonus-datatable', [App\Http\Controllers\Backend\BonusController::class, 'bonusDatatable'])->name('bonus-datatable');

        Route::get('broker-faqs/{broker_id}',[App\Http\Controllers\Backend\BrokerController::class, 'faqs'])->name('broker-faqs');
        Route::get('broker-faq-create/{broker_id}',[App\Http\Controllers\Backend\BrokerController::class, 'faqCreate'])->name('broker-faq-create');
        Route::post('broker-faq-store',[App\Http\Controllers\Backend\BrokerController::class, 'faqStore'])->name('broker-faq-store');
        Route::get('broker-faq-edit/{id}',[App\Http\Controllers\Backend\BrokerController::class, 'faqEdit'])->name('broker-faq-edit');
        Route::post('broker-faq-update/{id}',[App\Http\Controllers\Backend\BrokerController::class, 'faqUpdate'])->name('broker-faq-update');
        Route::get('broker-faq-delete/{id}', [App\Http\Controllers\Backend\BrokerController::class, 'faqDestroy'])->name('broker-faq-delete');
        Route::post('broker-faq-datatable', [App\Http\Controllers\Backend\BrokerController::class, 'brokerFaqDatatable'])->name('broker-faq-datatable');

        Route::get('subscribers', [App\Http\Controllers\Backend\SubscriberController::class, 'index'])->name('subscribers');
        Route::post('subscriber-datatable', [App\Http\Controllers\Backend\SubscriberController::class, 'subscriberDatatable'])->name('subscriber-datatable');
        Route::get('subscriber-delete/{id}', [App\Http\Controllers\Backend\SubscriberController::class, 'destroy'])->name('subscriber-delete');

        Route::get('trade-users', [App\Http\Controllers\Backend\TradeUsersController::class, 'index'])->name('trade-users');
        Route::post('trade-users-datatable', [App\Http\Controllers\Backend\TradeUsersController::class, 'tradeUserDatatable'])->name('trade-users-datatable');
        Route::get('trade-user-delete/{id}', [App\Http\Controllers\Backend\TradeUsersController::class, 'destroy'])->name('trade-user-delete');
    });
});
Route::group(['as' => 'front_'], function() {
    Route::get('/', [\App\Http\Controllers\Front\HomeController::class, 'index'])->name('/');
    $bonus = Cache::remember('bonus', 10, function() { 
            return DB::table('bonus')
            ->get();
        });
    if(!empty($bonus)) {
        foreach ($bonus as $value) {
            Route::get($value->slug.'-'.$value->id, [\App\Http\Controllers\Front\BonusController::class, 'getBonusDetail'])->name($value->slug.'-'.$value->id);
        }
    }

    $broker = Cache::remember('broker_details', 10, function() { 
            return DB::table('broker_details')
            ->get();
        });
    if(!empty($broker)) {
        foreach ($broker as $value) {
            Route::get($value->slug.'-'.$value->id, [\App\Http\Controllers\Front\BrokerController::class, 'getBrokerDetail'])->name($value->slug.'-'.$value->id);
        }
    }

    Route::post('broker-review-store',[App\Http\Controllers\Front\BrokerController::class, 'reviewStore'])->name('broker-review-store');
    Route::get('brokers', [\App\Http\Controllers\Front\BrokerController::class, 'list'])->name('brokers');
    Route::post('save-subscriber', [App\Http\Controllers\Front\HomeController::class, 'saveSubscriber'])->name('save-subscriber');
    Route::get('trade-now', [\App\Http\Controllers\Front\NewsController::class, 'tradeNow'])->name('trade-now');

    $news = Cache::remember('news', 10, function() { 
            return DB::table('news')
            ->get();
        });
    if(!empty($news)) {
        foreach ($news as $value) {
            Route::get($value->slug.'-'.$value->id, [\App\Http\Controllers\Front\NewsController::class, 'detail'])->name($value->slug.'-'.$value->id);
        }
    }
    Route::post('save-trade-user', [\App\Http\Controllers\Front\NewsController::class, 'saveTradeUser'])->name('save-trade-user');
    $artical = Cache::remember('artical', 10, function() { 
            return DB::table('artical')
            ->get();
        });
    if(!empty($artical)) {
        foreach ($artical as $value) {
            Route::get($value->slug.'-'.$value->id, [\App\Http\Controllers\Front\ArticalController::class, 'detail'])->name($value->slug.'-'.$value->id);
        }
    }

    /** cms pages route start **/
    $pages = Cache::remember('pages', 10, function() { 
                return DB::table('pages')
                ->get();
            });

    if(!empty($pages)) {
        foreach ($pages as $page) {
            Route::get($page->slug, [\App\Http\Controllers\Front\CmsPagesController::class, 'index'])->name($page->slug);
        }
    }
    /** cms pages route end **/

    Route::post('change-language', [App\Http\Controllers\Front\HomeController::class, 'changeLanguage'])->name('change-language');
});