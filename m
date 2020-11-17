Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315822B5661
	for <lists+linux-usb@lfdr.de>; Tue, 17 Nov 2020 02:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgKQBo7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 20:44:59 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:4096 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgKQBo6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 20:44:58 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CZpf360gGzXmbF;
        Tue, 17 Nov 2020 09:44:43 +0800 (CST)
Received: from dggema707-chm.china.huawei.com (10.3.20.71) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Tue, 17 Nov 2020 09:44:54 +0800
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggema707-chm.china.huawei.com (10.3.20.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 17 Nov 2020 09:44:54 +0800
Received: from dggema755-chm.china.huawei.com ([10.1.198.197]) by
 dggema755-chm.china.huawei.com ([10.1.198.197]) with mapi id 15.01.1913.007;
 Tue, 17 Nov 2020 09:44:54 +0800
From:   zhangqilong <zhangqilong3@huawei.com>
To:     Peter Chen <peter.chen@nxp.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIDIvMl0gdXNiOiBnYWRnZXQ6IEZpeCBtZW1sZWFrIGlu?=
 =?gb2312?B?IGdhZGdldGZzX2ZpbGxfc3VwZXI=?=
Thread-Topic: [PATCH 2/2] usb: gadget: Fix memleak in gadgetfs_fill_super
Thread-Index: AQHWvBIW5cJpZ52Yvkeg48eIFj8y3anKubWAgADTwEA=
Date:   Tue, 17 Nov 2020 01:44:54 +0000
Message-ID: <21e2ad201ff54e7798c443fa66a5f39c@huawei.com>
References: <20201116121710.1546690-1-zhangqilong3@huawei.com>
 <20201116121710.1546690-3-zhangqilong3@huawei.com>
 <20201116130349.GC28313@b29397-desktop>
In-Reply-To: <20201116130349.GC28313@b29397-desktop>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.179.28]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiANCj4gT24gMjAtMTEtMTYgMjA6MTc6MTAsIFpoYW5nIFFpbG9uZyB3cm90ZToNCj4gPiB1c2Jf
Z2V0X2dhZGdldF91ZGNfbmFtZSB3aWxsIGFsbG9jIG1lbW9yeSBmb3IgQ0hJUCBpbiAiRW5vbWVt
IiBicmFuY2guDQo+ID4gd2Ugc2hvdWxkIGZyZWUgaXQgYmVmb3JlIGVycm9yIHJldHVybnMgdG8g
cHJldmVudCBtZW1sZWFrLg0KPiA+DQo+ID4gRml4ZXM6IDE3NWY3MTIxMTljNTcgKCJ1c2I6IGdh
ZGdldDogcHJvdmlkZSBpbnRlcmZhY2UgZm9yIGxlZ2FjeQ0KPiA+IGdhZGdldHMgdG8gZ2V0IFVE
QyBuYW1lIikNCj4gPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+
DQo+ID4gU2lnbmVkLW9mZi1ieTogWmhhbmcgUWlsb25nIDx6aGFuZ3FpbG9uZzNAaHVhd2VpLmNv
bT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy91c2IvZ2FkZ2V0L2xlZ2FjeS9pbm9kZS5jIHwgMyAr
KysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC9sZWdhY3kvaW5vZGUuYw0KPiA+IGIvZHJpdmVycy91
c2IvZ2FkZ2V0L2xlZ2FjeS9pbm9kZS5jDQo+ID4gaW5kZXggMWI0MzBiMzZkMGE2Li4zY2VmYzI3
YmUwOTggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L2xlZ2FjeS9pbm9kZS5j
DQo+ID4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2xlZ2FjeS9pbm9kZS5jDQo+ID4gQEAgLTIw
MzksNiArMjAzOSw5IEBAIGdhZGdldGZzX2ZpbGxfc3VwZXIgKHN0cnVjdCBzdXBlcl9ibG9jayAq
c2IsIHN0cnVjdA0KPiBmc19jb250ZXh0ICpmYykNCj4gPiAgCXJldHVybiAwOw0KPiA+DQo+ID4g
IEVub21lbToNCj4gPiArCWZyZWUoQ0hJUCk7DQo+ID4gKwlDSElQID0gTlVMTDsNCj4gPiArDQo+
ID4gIAlyZXR1cm4gLUVOT01FTTsNCj4gPiAgfQ0KPiANCj4gSXQgc2VlbXMgdGhlIGRldl9uZXcg
YWxzbyBhbGxvY2F0ZSB0aGUgbWVtb3J5LCB3b3VsZCB5b3UgcGxlYXNlIGNoYW5nZSBpdA0KPiB0
b28sIGFsc28sIGNyZWF0ZSBhIG5ldyBnb3RvIGVudHJ5IGZvciBpdC4NCg0KSWYgZ2FkZ2V0ZnNf
Y3JlYXRlX2ZpbGUgZmFpbHMsIHRoZSBkZXZfbmV3IHdpbGwgYmUgZnJlZWQgaW4gcHV0X2Rldi4N
Cg0KVGhhbmtzLA0KWmhhbmcNCg0KPiAtLQ0KPiANCj4gVGhhbmtzLA0KPiBQZXRlciBDaGVuDQo=
