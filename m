Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F28E6767C8F
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jul 2023 08:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjG2Ggc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Jul 2023 02:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjG2Ggb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Jul 2023 02:36:31 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 757F046B9
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 23:36:30 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 36T6a5pR5003724, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 36T6a5pR5003724
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Sat, 29 Jul 2023 14:36:05 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Sat, 29 Jul 2023 14:36:17 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Sat, 29 Jul 2023 14:36:17 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d]) by
 RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d%5]) with mapi id
 15.01.2375.007; Sat, 29 Jul 2023 14:36:17 +0800
From:   =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?= <stanley_chang@realtek.com>
To:     kernel test robot <lkp@intel.com>
CC:     "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [usb:usb-next 26/67] drivers/phy/realtek/phy-rtk-usb2.c:715: undefined reference to `usb_debug_root'
Thread-Topic: [usb:usb-next 26/67] drivers/phy/realtek/phy-rtk-usb2.c:715:
 undefined reference to `usb_debug_root'
Thread-Index: AQHZwa4RYB+3Rq8Pz0uZaC+7+F1a/a/QSmUw
Date:   Sat, 29 Jul 2023 06:36:17 +0000
Message-ID: <2a32200db132468580c31f75aa71968d@realtek.com>
References: <202307290733.weSlHrGp-lkp@intel.com>
In-Reply-To: <202307290733.weSlHrGp-lkp@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.190.159]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
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

DQo+IEFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToNCj4gDQo+ICAgIG9yMWst
bGludXgtbGQ6IGRyaXZlcnMvcGh5L3JlYWx0ZWsvcGh5LXJ0ay11c2IyLm86IGluIGZ1bmN0aW9u
DQo+IGBjcmVhdGVfcGh5X2RlYnVnX3Jvb3QnOg0KPiA+PiBkcml2ZXJzL3BoeS9yZWFsdGVrL3Bo
eS1ydGstdXNiMi5jOjcxNTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0bw0KPiBgdXNiX2RlYnVnX3Jv
b3QnDQo+ID4+IG9yMWstbGludXgtbGQ6IGRyaXZlcnMvcGh5L3JlYWx0ZWsvcGh5LXJ0ay11c2Iy
LmM6NzE1OiB1bmRlZmluZWQgcmVmZXJlbmNlDQo+IHRvIGB1c2JfZGVidWdfcm9vdCcNCj4gICAg
b3Ixay1saW51eC1sZDogZHJpdmVycy9waHkvcmVhbHRlay9waHktcnRrLXVzYjIuYzo3MTc6IHVu
ZGVmaW5lZCByZWZlcmVuY2UNCj4gdG8gYHVzYl9kZWJ1Z19yb290Jw0KPiAgICBwYWhvbGU6IC50
bXBfdm1saW51eC5idGY6IEludmFsaWQgYXJndW1lbnQNCj4gICAgLmJ0Zi52bWxpbnV4LmJpbi5v
OiBmaWxlIG5vdCByZWNvZ25pemVkOiBmaWxlIGZvcm1hdCBub3QgcmVjb2duaXplZA0KPiANCg0K
SSBoYXZlIHN1Ym1pdCBhIGZpeCBwYXRjaCBhdCBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC11c2IvMjAyMzA3MjkwNTMwMjkuNjIyNi0xLXN0YW5sZXlfY2hhbmdAcmVhbHRlay5jb20vDQoN
ClRoYW5rcywNClN0YW5sZXkNCg==
