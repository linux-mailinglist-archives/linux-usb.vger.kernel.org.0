Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC15A6E0412
	for <lists+linux-usb@lfdr.de>; Thu, 13 Apr 2023 04:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjDMCZW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 22:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjDMCZW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 22:25:22 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A19EE2D43
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 19:25:18 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 33D2OdeV6009236, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 33D2OdeV6009236
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
        Thu, 13 Apr 2023 10:24:39 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Thu, 13 Apr 2023 10:25:01 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 13 Apr 2023 10:25:01 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02]) by
 RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02%5]) with mapi id
 15.01.2375.007; Thu, 13 Apr 2023 10:25:01 +0800
From:   =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v2 1/2] usb: dwc3: core: add support for remapping global register start address
Thread-Topic: [PATCH v2 1/2] usb: dwc3: core: add support for remapping global
 register start address
Thread-Index: AQHZbO8TMZxQ6xFEbEmr471D6ePiYq8npgYAgADcPhA=
Date:   Thu, 13 Apr 2023 02:25:01 +0000
Message-ID: <1e7a4952f51149ec98a1b227be8063cd@realtek.com>
References: <20230412033006.10859-1-stanley_chang@realtek.com>
 <20230412210856.xcbp3crhbedjvnix@synopsys.com>
In-Reply-To: <20230412210856.xcbp3crhbedjvnix@synopsys.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.190.159]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiANCj4gT24gV2VkLCBBcHIgMTIsIDIwMjMsIFN0YW5sZXkgQ2hhbmcgd3JvdGU6DQo+ID4gVGhl
IFJUSyBESEMgU29DcyB3ZXJlIGRlc2lnbmVkIHRoZSBnbG9iYWwgcmVnaXN0ZXIgYWRkcmVzcyBv
ZmZzZXQgYXQNCj4gPiAweDgxMDAuIFRoZSBkZWZhdWx0IGFkZHJlc3MgaXMgYXQgRFdDM19HTE9C
QUxTX1JFR1NfU1RBUlQgKDB4YzEwMCkuDQo+ID4gVGhlcmVmb3JlLCBhZGQgdGhlIHByb3BlcnR5
IG9mIGRldmljZS10cmVlIHRvIGFkanVzdCB0aGlzIHN0YXJ0IGFkZHJlc3MuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBTdGFubGV5IENoYW5nIDxzdGFubGV5X2NoYW5nQHJlYWx0ZWsuY29tPg0K
PiA+IC0tLQ0KPiANCj4gUGxlYXNlIG5vdGUgd2hhdCBjaGFuZ2VkIGluIHYyIGFmdGVyIHRoZSAt
LS0gbGluZS4gQWxzbyB3aHkgZGlkIHlvdSBzcGxpdCB0aGUNCj4gcHJldmlvdXMgc2VyaWVzIGlu
IDIgbm93PyBJdCdsbCBiZSBjb25mdXNpbmcgZm9yIHVzIG1haW50YWluZXJzLg0KPiANCkRvIHlv
dSBtZWFuIHRoYXQgdG8gc3BsaXQgdGhlIHBhcnQgb2YgInJlbWFwcGluZyBnbG9iYWwgcmVnaXN0
ZXIgc3RhcnQgYWRkcmVzcyBhbmQNCnRoZSBwYXJ0IG9mICIgc25wcyxwYXJrbW9kZS1kaXNhYmxl
LWhzLXF1aXJrIj8NCg0KVGhleSBhcmUgZGlmZmVyZW50IHNlcmllcy4gSSBqdXN0IHN1Ym1pdCB0
aGVtIGF0IHRoZSBzYW1lIHRpbWUuDQoNCj4gPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCAx
OCArKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZl
cnMvdXNiL2R3YzMvY29yZS5jIGluZGV4DQo+ID4gNDc2YjYzNjE4NTExLi45NmQzZTYzNGViYmYg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPiArKysgYi9kcml2
ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+IEBAIC0xNzg1LDYgKzE3ODUsMjQgQEAgc3RhdGljIGlu
dCBkd2MzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ID4gICAgICAg
ZHdjX3JlcyA9ICpyZXM7DQo+ID4gICAgICAgZHdjX3Jlcy5zdGFydCArPSBEV0MzX0dMT0JBTFNf
UkVHU19TVEFSVDsNCj4gPg0KPiA+ICsgICAgIC8qDQo+ID4gKyAgICAgICogRm9yIHNvbWUgZHdj
MyBjb250cm9sbGVyLCB0aGUgZHdjMyBnbG9iYWwgcmVnaXN0ZXIgc3RhcnQgYWRkcmVzcyBpcw0K
PiA+ICsgICAgICAqIG5vdCBhdCBEV0MzX0dMT0JBTFNfUkVHU19TVEFSVCAoMHhjMTAwKS4NCj4g
PiArICAgICAgKi8NCj4gPiArICAgICBpZiAoZGV2LT5vZl9ub2RlKSB7DQo+ID4gKyAgICAgICAg
ICAgICBpbnQgZ2xvYmFsX3JlZ3Nfc3RhcnRpbmdfb2Zmc2V0ID0gMDsNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgICBkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoZGV2LA0KPiAic25wcyxnbG9iYWwt
cmVncy1zdGFydGluZy1vZmZzZXQiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmZ2xvYmFsX3JlZ3Nfc3RhcnRpbmdfb2Zmc2V0KTsNCj4gDQo+IEkgc3VnZ2VzdGVkIHRvIHVz
ZSBjb21wYXRpYmxlIHN0cmluZyBpbnN0ZWFkIHNpbmNlIHRoaXMgaXNuJ3QgY29tbW9uIGFuZCBv
bmx5DQo+IHVuaXF1ZSB0byB5b3VyIHBsYXRmb3JtLiBBbnkgcmVhc29uIHdlIHNob3VsZG4ndCBk
byB0aGF0Pw0KPiANCj4gaWUuIHNvbWV0aGluZyBsaWtlIHRoaXM6DQo+IA0KPiBpZiAoZGV2LT5v
Zl9ub2RlICYmIG9mX2RldmljZV9pc19jb21wYXRpYWJsZShkZXYtPm9mX25vZGUsDQo+ICJ5b3Vy
LXBsYXRmb3JtIikpDQo+ICAgICAgICAgZHdjX3Jlcy5zdGFydCArPSB5b3VyX3BsYXRmb3JtX29m
ZnNldDsgZWxzZQ0KPiAgICAgICAgIGR3Y19yZXMuc3RhcnQgPSBEV0MzX0dMT0JBTFNfUkVHU19T
VEFSVDsNCj4gDQoNCkkgd2lsbCB0cnkgdGhpcyBzdWdnZXN0aW9uLg0KDQpUaGFua3MsDQpTdGFu
bGV5DQoNCg==
