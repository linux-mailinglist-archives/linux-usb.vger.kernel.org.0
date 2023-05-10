Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 054706FD6F9
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 08:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbjEJGZy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 02:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjEJGZv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 02:25:51 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD0740CE
        for <linux-usb@vger.kernel.org>; Tue,  9 May 2023 23:25:48 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 34A6PGvlC002538, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 34A6PGvlC002538
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
        Wed, 10 May 2023 14:25:16 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 10 May 2023 14:25:23 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 10 May 2023 14:25:23 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d]) by
 RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d%5]) with mapi id
 15.01.2375.007; Wed, 10 May 2023 14:25:22 +0800
From:   =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>
To:     Klaus Kudielka <klaus.kudielka@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v1] usb: xhci: plat: Add USB 3.0 phy support
Thread-Topic: [PATCH v1] usb: xhci: plat: Add USB 3.0 phy support
Thread-Index: AQHZgpxahnzl8orY+UeyUbz1LSchZ69S0Kaw//+wlgCAAIhv8A==
Date:   Wed, 10 May 2023 06:25:22 +0000
Message-ID: <2ad6cffea4034cbb83d8d7e4e36f57fc@realtek.com>
References: <20230407060731.20537-1-stanley_chang@realtek.com>
 <519bc128c0ded61b64d26c6e9260bc1fd7c6dea3.camel@gmail.com>
 <f9f4c477a5a64687900d5a68feb8a586@realtek.com>
 <f8aa160b-83dc-59cc-03dc-d9e8edbd497f@gmail.com>
In-Reply-To: <f8aa160b-83dc-59cc-03dc-d9e8edbd497f@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.190.159]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
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

PiA+Pg0KPiA+PiBJJ20gYm9vdGluZyA2LjQtcmMxIG9uIGEgVHVycmlzIE9tbmlhDQo+ID4+IChh
cm0vYm9vdC9kdHMvYXJtYWRhLTM4NS10dXJyaXMtb21uaWEuZHRzKQ0KPiA+PiBhbmQgZ2V0IHRo
b3NlIGVycm9yIG1lc3NhZ2VzOg0KPiA+PiBbICAgIDAuMjMxNjA5XSB4aGNpLWhjZCBmMTBmMDAw
MC51c2IzOiB4aGNpX3BsYXRfcHJvYmUgZ2V0IHVzYjNwaHkgZmFpbA0KPiA+PiAocmV0PS02KQ0K
PiA+PiBbICAgIDAuMjM5NzE2XSB4aGNpLWhjZCBmMTBmODAwMC51c2IzOiB4aGNpX3BsYXRfcHJv
YmUgZ2V0IHVzYjNwaHkgZmFpbA0KPiA+PiAocmV0PS02KQ0KPiA+Pg0KPiA+PiBJdCBsb29rcyBs
aWtlIGEgY29zbWV0aWMgaXNzdWUgd2l0aCBlcnJvciBjb2RlcywgYnV0IG1heWJlIGl0IGNhbiBi
ZSBmaXhlZD8NCj4gPj4NCj4gPiAxLiBJIGNoZWNrZWQgYXJtL2Jvb3QvZHRzL2FybWFkYS0zODUt
dHVycmlzLW9tbmlhLmR0cy4NCj4gPiBUaGUgeGhjaSBub2RlIGRvZXNuJ3Qgc2VlbSB0byBoYXZl
IHVzYi1waHkuDQo+ID4gSW4gdGhpcyBjYXNlIGl0IHNob3VsZCBnZXQgZXJyb3IgY29kZSAtRU5P
REVWICgtMTkpLg0KPiA+IEknbSBub3Qgc3VyZSB3aHkgdGhlIGVycm9yIGNvZGUgaXMgLUVOWElP
ICgtNikuDQo+ID4gQ2FuIHlvdSBwcm92aWRlIG1vcmUgZGV0YWlscz8NCj4gDQo+IEkgaGF2ZSBD
T05GSUdfVVNCX1BIWSBkaXNhYmxlZC4gSW4gdGhhdCBjYXNlLA0KPiBkZXZtX3VzYl9nZXRfcGh5
X2J5X3BoYW5kbGUgaXMgZGVjbGFyZWQgc3RhdGljIGlubGluZSBhbmQgcmV0dXJucyAtRU5YSU8u
DQo+IFNlZSBpbmNsdWRlL2xpbnV4L3VzYi9waHkuaC4NCj4gDQo+ID4gMi4gVGhpcyBlcnJvciBt
ZXNzYWdlIHdpbGwgYmUgcHJpbnRlZCBvbmx5IHdoZW4gZ2V0dGluZyB0aGUgdXNiMyBwaHkgZmFp
bHMuDQo+ID4gQW5kIHVzYl9waHkgc2V0IHRvIE5VTEwsIEl0IGRvZXMgbm90IGFmZmVjdCB0aGUg
b3JpZ2luYWwgYmVoYXZpb3IuDQo+ID4gTWF5YmUgSSdtIG1pc3NpbmcgY2hlY2tpbmcgLUVOWElP
IG9yIHNvbWUgb3RoZXIgZXJyb3IgY29kZS4NCj4gPiBJIGNhbiBkZWxldGUgdGhpcyBsb2cgYWNj
b3JkaW5nIHRvIHVzYjIgcGh5IHNpdHVhdGlvbi4NCj4gDQo+IENoZWNraW5nIGZvciAtRU5YSU8g
aW4gYWRkaXRpb24gdG8gLUVOT0RFViB3b3VsZCBjb3Zlcg0KPiB0aGUgIUNPTkZJR19VU0JfUEhZ
IGNhc2UsIEkgZ3Vlc3MuIFdoZXRoZXIgdGhlcmUgYXJlIG90aGVyICJmYWxzZSBhbGFybSINCj4g
Y2FzZXMsIEkgZG9uJ3Qga25vdy4NCj4gDQpPa2F5LCBJIHdpbGwgcmVtb3ZlIHRoaXMgbG9nIG1l
c3NhZ2UuDQpJIHRoaW5rIHVzaW5nIHRoZSBsb2cgaW4gZHJpdmVycy91c2IvcGh5L3BoeS5jIGNh
biBlYXN5IHRvIGRlYnVnIGVycm9yIGNhc2UuDQoNClRoYW5rcywNClN0YW5sZXkNCg0K
