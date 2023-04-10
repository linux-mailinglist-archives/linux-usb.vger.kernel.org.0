Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D53626DC302
	for <lists+linux-usb@lfdr.de>; Mon, 10 Apr 2023 05:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjDJDpq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Apr 2023 23:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjDJDpo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Apr 2023 23:45:44 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16D0E68
        for <linux-usb@vger.kernel.org>; Sun,  9 Apr 2023 20:45:40 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 33A3jCdH5011870, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 33A3jCdH5011870
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
        Mon, 10 Apr 2023 11:45:12 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Mon, 10 Apr 2023 11:45:33 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 10 Apr 2023 11:45:32 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02]) by
 RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02%5]) with mapi id
 15.01.2375.007; Mon, 10 Apr 2023 11:45:32 +0800
From:   =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>
Subject: RE: [PATCH v1 1/2] usb: dwc3: core: add support for disabling High-speed park mode
Thread-Topic: [PATCH v1 1/2] usb: dwc3: core: add support for disabling
 High-speed park mode
Thread-Index: AQHZaRcwulkVsqC5UEeUDVjDczA2Xq8gqYOAgANAp6A=
Date:   Mon, 10 Apr 2023 03:45:32 +0000
Message-ID: <4f49af5fadaa497c813d14b470eb2d71@realtek.com>
References: <20230407060649.19126-1-stanley_chang@realtek.com>
 <20230408020009.i7bwu2oiivqklolh@synopsys.com>
In-Reply-To: <20230408020009.i7bwu2oiivqklolh@synopsys.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.190.159]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIzLzQvOSDkuIvljYggMTA6MDA6MDA=?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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

PiANCj4gT24gRnJpLCBBcHIgMDcsIDIwMjMsIFN0YW5sZXkgQ2hhbmcgd3JvdGU6DQo+ID4gU2V0
dGluZyB0aGUgUEFSS01PREVfRElTQUJMRV9IUyBiaXQgaW4gdGhlIERXQzNfVVNCM19HVUNUTDEu
DQo+ID4gV2hlbiB0aGlzIGJpdCBpcyBzZXQgdG8gJzEnIGFsbCBIUyBidXMgaW5zdGFuY2VzIGlu
IHBhcmsgbW9kZSBhcmUNCj4gPiBkaXNhYmxlZA0KPiA+DQo+ID4gRm9yIHNvbWUgVVNCIHdpZmkg
ZGV2aWNlcywgaWYgZW5hYmxlIHRoaXMgZmVhdHVyZSBpdCB3aWxsIHJlZHVjZSB0aGUNCj4gPiBw
ZXJmb3JtYW5jZS4gVGhlcmVmb3JlLCBhZGQgYW4gb3B0aW9uIGZvciBkaXNhYmxpbmcgSFMgcGFy
ayBtb2RlIGJ5DQo+IGRldmljZS10cmVlLg0KPiA+DQo+ID4gSW4gU3lub3BzeXMncyBkd2MzIGRh
dGEgYm9vazoNCj4gPiBJbiBhIGZldyBoaWdoIHNwZWVkIGRldmljZXMgd2hlbiBhbiBJTiByZXF1
ZXN0IGlzIHNlbnQgd2l0aGluIDkwMG5zIG9mDQo+ID4gdGhlIEFDSyBvZiB0aGUgcHJldmlvdXMg
cGFja2V0LCB0aGVzZSBkZXZpY2VzIHNlbmQgYSBOQUsuIFdoZW4NCj4gPiBjb25uZWN0ZWQgdG8g
dGhlc2UgZGV2aWNlcywgaWYgcmVxdWlyZWQsIHRoZSBzb2Z0d2FyZSBjYW4gZGlzYWJsZSB0aGUN
Cj4gPiBwYXJrIG1vZGUgaWYgeW91IHNlZSBwZXJmb3JtYW5jZSBkcm9wIGluIHlvdXIgc3lzdGVt
LiBXaGVuIHBhcmsgbW9kZQ0KPiA+IGlzIGRpc2FibGVkLCBwaXBlbGluaW5nIG9mIG11bHRpcGxl
IHBhY2tldCBpcyBkaXNhYmxlZCBhbmQgaW5zdGVhZCBvbmUNCj4gPiBwYWNrZXQgYXQgYSB0aW1l
IGlzIHJlcXVlc3RlZCBieSB0aGUgc2NoZWR1bGVyLiBUaGlzIGFsbG93cyB1cCB0byAxMg0KPiA+
IE5BS3MgaW4gYSBtaWNyby1mcmFtZSBhbmQgaW1wcm92ZXMgcGVyZm9ybWFuY2Ugb2YgdGhlc2Ug
c2xvdyBkZXZpY2VzLg0KPiA+DQo+IA0KPiBDYW4gd2Ugd3JhcCB3aXRoaW4gNzUgY2hhciBmb3Ig
Y29tbWl0IG1lc3NhZ2VzLg0KPiANCj4gVGhhbmtzLA0KPiBUaGluaA0KPiANCg0KT2theSwgSSB3
aWxsIHJldmlzZSBpbiBuZXh0IHZlcnNpb24uDQoNClRoYW5rcywNClN0YW5sZXkNCg==
