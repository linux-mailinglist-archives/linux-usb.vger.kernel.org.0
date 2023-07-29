Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A339D767C8E
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jul 2023 08:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbjG2Gf5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Jul 2023 02:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjG2Gf4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Jul 2023 02:35:56 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7BD4C46B9
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 23:35:51 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 36T6ZIWk8003307, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 36T6ZIWk8003307
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Sat, 29 Jul 2023 14:35:18 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Sat, 29 Jul 2023 14:35:31 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Sat, 29 Jul 2023 14:35:31 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d]) by
 RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d%5]) with mapi id
 15.01.2375.007; Sat, 29 Jul 2023 14:35:30 +0800
From:   =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?= <stanley_chang@realtek.com>
To:     kernel test robot <lkp@intel.com>
CC:     "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [usb:usb-next 27/67] drivers/phy/realtek/phy-rtk-usb3.c:349: undefined reference to `usb_debug_root'
Thread-Topic: [usb:usb-next 27/67] drivers/phy/realtek/phy-rtk-usb3.c:349:
 undefined reference to `usb_debug_root'
Thread-Index: AQHZwcILnfe6ZMe9WUq5jUAmQ5DiCa/QScTg
Date:   Sat, 29 Jul 2023 06:35:30 +0000
Message-ID: <a375e9618231409198b1f9f2ab2653aa@realtek.com>
References: <202307291022.3pVeTR9z-lkp@intel.com>
In-Reply-To: <202307291022.3pVeTR9z-lkp@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.190.159]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiBBbGwgZXJyb3JzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6DQo+IA0KPiAgICBvcjFr
LWxpbnV4LWxkOiBkcml2ZXJzL3BoeS9yZWFsdGVrL3BoeS1ydGstdXNiMi5vOiBpbiBmdW5jdGlv
bg0KPiBgY3JlYXRlX3BoeV9kZWJ1Z19yb290JzoNCj4gICAgZHJpdmVycy9waHkvcmVhbHRlay9w
aHktcnRrLXVzYjIuYzo3MTU6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8NCj4gYHVzYl9kZWJ1Z19y
b290Jw0KPiAgICBvcjFrLWxpbnV4LWxkOiBkcml2ZXJzL3BoeS9yZWFsdGVrL3BoeS1ydGstdXNi
Mi5jOjcxNTogdW5kZWZpbmVkIHJlZmVyZW5jZQ0KPiB0byBgdXNiX2RlYnVnX3Jvb3QnDQo+ICAg
IG9yMWstbGludXgtbGQ6IGRyaXZlcnMvcGh5L3JlYWx0ZWsvcGh5LXJ0ay11c2IyLmM6NzE3OiB1
bmRlZmluZWQgcmVmZXJlbmNlDQo+IHRvIGB1c2JfZGVidWdfcm9vdCcNCj4gICAgb3Ixay1saW51
eC1sZDogZHJpdmVycy9waHkvcmVhbHRlay9waHktcnRrLXVzYjMubzogaW4gZnVuY3Rpb24NCj4g
YGNyZWF0ZV9waHlfZGVidWdfcm9vdCc6DQo+ID4+IGRyaXZlcnMvcGh5L3JlYWx0ZWsvcGh5LXJ0
ay11c2IzLmM6MzQ5OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvDQo+IGB1c2JfZGVidWdfcm9vdCcN
Cj4gPj4gb3Ixay1saW51eC1sZDogZHJpdmVycy9waHkvcmVhbHRlay9waHktcnRrLXVzYjMuYzoz
NDk6IHVuZGVmaW5lZCByZWZlcmVuY2UNCj4gdG8gYHVzYl9kZWJ1Z19yb290Jw0KPiAgICBvcjFr
LWxpbnV4LWxkOg0KPiBkcml2ZXJzL3BoeS9yZWFsdGVrL3BoeS1ydGstdXNiMy5vOmRyaXZlcnMv
cGh5L3JlYWx0ZWsvcGh5LXJ0ay11c2IzLmM6MzUxOg0KPiBtb3JlIHVuZGVmaW5lZCByZWZlcmVu
Y2VzIHRvIGB1c2JfZGVidWdfcm9vdCcgZm9sbG93DQo+ICAgIHBhaG9sZTogLnRtcF92bWxpbnV4
LmJ0ZjogSW52YWxpZCBhcmd1bWVudA0KPiAgICAuYnRmLnZtbGludXguYmluLm86IGZpbGUgbm90
IHJlY29nbml6ZWQ6IGZpbGUgZm9ybWF0IG5vdCByZWNvZ25pemVkXA0KDQoNCkkgaGF2ZSBzdWJt
aXQgYSBmaXggcGF0Y2ggYXQgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzIwMjMw
NzI5MDUzMDI5LjYyMjYtMS1zdGFubGV5X2NoYW5nQHJlYWx0ZWsuY29tLw0KDQpUaGFua3MsDQpT
dGFubGV5DQo=
