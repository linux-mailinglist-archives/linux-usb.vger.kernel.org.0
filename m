Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACC2A6DC30F
	for <lists+linux-usb@lfdr.de>; Mon, 10 Apr 2023 06:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjDJEKI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Apr 2023 00:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjDJEKH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Apr 2023 00:10:07 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D4A30C0
        for <linux-usb@vger.kernel.org>; Sun,  9 Apr 2023 21:10:05 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 33A49actE032221, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 33A49actE032221
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
        Mon, 10 Apr 2023 12:09:37 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Mon, 10 Apr 2023 12:09:58 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 10 Apr 2023 12:09:57 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02]) by
 RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02%5]) with mapi id
 15.01.2375.007; Mon, 10 Apr 2023 12:09:57 +0800
From:   =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>
Subject: RE: [PATCH v1 1/2] usb: dwc3: core: add support for remapping global register start address
Thread-Topic: [PATCH v1 1/2] usb: dwc3: core: add support for remapping global
 register start address
Thread-Index: AQHZaRcy64Ak1IW6YkuqLSHQPwUUKK8gq+QAgANDlaA=
Date:   Mon, 10 Apr 2023 04:09:57 +0000
Message-ID: <2e26b5005a4e4efa946cb04898779f08@realtek.com>
References: <20230407060703.19469-1-stanley_chang@realtek.com>
 <20230408020840.344xuicuqb4abtow@synopsys.com>
In-Reply-To: <20230408020840.344xuicuqb4abtow@synopsys.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.190.159]
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
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
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmMgaW5kZXgNCj4gPiA0NzZiNjM2MTg1MTEuLjc3MWIzNTQ0OTM3NiAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNi
L2R3YzMvY29yZS5jDQo+ID4gQEAgLTE3ODUsNiArMTc4NSwyMyBAQCBzdGF0aWMgaW50IGR3YzNf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRldikNCj4gPiAgICAgICBkd2NfcmVz
ID0gKnJlczsNCj4gPiAgICAgICBkd2NfcmVzLnN0YXJ0ICs9IERXQzNfR0xPQkFMU19SRUdTX1NU
QVJUOw0KPiA+DQo+ID4gKyAgICAgLyogRm9yIHNvbWUgZHdjMyBjb250cm9sbGVyLCB0aGUgZHdj
MyBnbG9iYWwgcmVnaXN0ZXIgc3RhcnQgYWRkcmVzcyBpcw0KPiA+ICsgICAgICAqIG5vdCBhdCBE
V0MzX0dMT0JBTFNfUkVHU19TVEFSVCAoMHhjMTAwKS4NCj4gPiArICAgICAgKi8NCj4gDQo+IFBs
ZWFzZSB1c2UgdGhpcyBjb21tZW50IHN0eWxlIGJsb2NrOg0KPiAgLyoNCj4gICAqIGEgYiBjDQo+
ICAgKiBkIGUgZg0KPiAgICovDQo+IA0KDQpJIHdpbGwgZm9sbG93IHRoaXMgcnVsZS4NCg0KPiA+
ICsgICAgIGlmIChkZXYpIHsNCj4gDQo+IFdoeSBkbyB3ZSBuZWVkIHRoaXMgaWYgKGRldikgY2hl
Y2s/IFdoZW4gd291bGQgdGhpcyBub3QgYmUgdGhlIGNhc2U/DQoNCkkgd2FudCB0aGUgdmFyaWFi
bGUgImZpeGVkX2R3YzNfZ2xvYmFsc19yZWdzX3N0YXJ0IiB0byBiZSBhIGxvY2FsIHZhcmlhYmxl
LiANClNvIEkgYWRkZWQgYW4gaWYgc3RhdGVtZW50Lg0KSSBjYW4gbW9kaWZ5IGl0IHRvICJpZiAo
ZGV2LT5vZl9ub2RlKSIgd2hpY2ggbG9va3MgbW9yZSBtYWtlIHNlbnNlLg0KDQo+IA0KPiA+ICsg
ICAgICAgICAgICAgaW50IGZpeGVkX2R3YzNfZ2xvYmFsc19yZWdzX3N0YXJ0Ow0KPiANCj4gTmVl
ZCB0byBpbml0aWFsaXplIHRoaXMgaW4gY2FzZSB5b3UgZ2V0IGJvZ3VzIHZhbHVlIHdoZW4gdGhl
IHByb3BlcnR5IGlzIG5vdA0KPiBkZWZpbmVkLg0KDQpUaGFua3MuIEkgd2lsbCBhZGQgdGhlIGlu
aXRpYWwgdmFsdWUuDQoNCj4gDQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgZGV2aWNlX3Byb3Bl
cnR5X3JlYWRfdTMyKGRldiwNCj4gPiArICJzbnBzLGZpeGVkX2R3YzNfZ2xvYmFsc19yZWdzX3N0
YXJ0IiwNCj4gDQo+IFByb3BlcnR5IG5hbWUgc2hvdWxkIGJlIHVzaW5nICItIiBpbnN0ZWFkIG9m
ICJfIi4gQWxzbyBjYW4gd2UgcmVuYW1lIGl0IHRvDQo+ICJzbnBzLGdsb2JhbC1yZWdzLXN0YXJ0
aW5nLW9mZnNldCINCj4gDQo+IFRoYW5rcywNCj4gVGhpbmgNCj4gDQoNCkkgd2lsbCByZW5hbWUg
YXMgInNucHMsZ2xvYmFsLXJlZ3Mtc3RhcnRpbmctb2Zmc2V0IiBpbiBuZXh0IHZlcnNpb24uDQoN
ClRoYW5rcyBhIGxvdCBvZi4NClN0YW5sZXkNCg==
