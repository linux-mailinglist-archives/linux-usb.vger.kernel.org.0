Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A03034A21B
	for <lists+linux-usb@lfdr.de>; Fri, 26 Mar 2021 07:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbhCZGnd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Mar 2021 02:43:33 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:5114 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbhCZGnO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Mar 2021 02:43:14 -0400
Received: from dggeme760-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4F6C6j58QQzYPK2;
        Fri, 26 Mar 2021 14:41:17 +0800 (CST)
Received: from dggeme760-chm.china.huawei.com (10.3.19.106) by
 dggeme760-chm.china.huawei.com (10.3.19.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Fri, 26 Mar 2021 14:43:08 +0800
Received: from dggeme760-chm.china.huawei.com ([10.6.80.70]) by
 dggeme760-chm.china.huawei.com ([10.6.80.70]) with mapi id 15.01.2106.013;
 Fri, 26 Mar 2021 14:43:08 +0800
From:   zhengyongjun <zhengyongjun3@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Andrey Konovalov <andreyknvl@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sasha Levin <sashal@kernel.org>,
        Allen Pais <allen.lkml@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        pmail_hulkci <hulkci@huawei.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIC1uZXh0XSB1c2I6IHJlbW92ZSB1bnVzZWQgaW5jbHVk?=
 =?gb2312?Q?ing_<linux/version.h>?=
Thread-Topic: [PATCH -next] usb: remove unused including <linux/version.h>
Thread-Index: AQHXIgU2sYEdRQeVBkqcMFC7ZCHYeaqVSxWAgACGsnA=
Date:   Fri, 26 Mar 2021 06:43:08 +0000
Message-ID: <14b5f1093ccb42798653360d10757e93@huawei.com>
References: <20210326061326.3234377-1-zhengyongjun3@huawei.com>
 <YF2BX7Ps9DcQe5tu@kroah.com>
In-Reply-To: <YF2BX7Ps9DcQe5tu@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.178.249]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

U29ycnksIEkgd2lsbCBjaGVjayBhbGwgbXkgcGF0Y2ggbGF0ZXIgYmVmb3JlIEkgc2VuZCB0byBt
YWludGFpbmVyIGFuZCBJIHdpbGwgc3RvcCB0aGlzIHBhdGNoIHNlcmllcy4NCg0KLS0tLS3Tyrz+
1K28/i0tLS0tDQq3orz+yMs6IEdyZWcgS3JvYWgtSGFydG1hbiBbbWFpbHRvOmdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnXSANCreiy83KsbzkOiAyMDIxxOoz1MIyNsjVIDE0OjM4DQrK1bz+yMs6
IHpoZW5neW9uZ2p1biA8emhlbmd5b25nanVuM0BodWF3ZWkuY29tPg0Ks63LzTogQW5kcmV5IEtv
bm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPjsgRG1pdHJ5IFZ5dWtvdiA8ZHZ5dWtvdkBn
b29nbGUuY29tPjsgTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz47IFNlYmFz
dGlhbiBBbmRyemVqIFNpZXdpb3IgPGJpZ2Vhc3lAbGludXRyb25peC5kZT47IEFobWVkIFMuIERh
cndpc2ggPGEuZGFyd2lzaEBsaW51dHJvbml4LmRlPjsgR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3Vz
dGF2b2Fyc0BrZXJuZWwub3JnPjsgU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPjsgQWxs
ZW4gUGFpcyA8YWxsZW4ubGttbEBnbWFpbC5jb20+OyBsaW51eC11c2JAdmdlci5rZXJuZWwub3Jn
OyBrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnOyBwbWFpbF9odWxrY2kgPGh1bGtjaUBo
dWF3ZWkuY29tPg0K1vfM4jogUmU6IFtQQVRDSCAtbmV4dF0gdXNiOiByZW1vdmUgdW51c2VkIGlu
Y2x1ZGluZyA8bGludXgvdmVyc2lvbi5oPg0KDQpPbiBGcmksIE1hciAyNiwgMjAyMSBhdCAwMjox
MzoyNlBNICswODAwLCBaaGVuZyBZb25nanVuIHdyb3RlOg0KPiBSZW1vdmUgaW5jbHVkaW5nIDxs
aW51eC92ZXJzaW9uLmg+IHRoYXQgZG9uJ3QgbmVlZCBpdC4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBI
dWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogWmhlbmcgWW9u
Z2p1biA8emhlbmd5b25nanVuM0BodWF3ZWkuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2Nv
cmUvaGNkLmMgfCAxIC0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9jb3JlL2hjZC5jIGIvZHJpdmVycy91c2IvY29yZS9oY2QuYyBp
bmRleCANCj4gM2YwMzgxMzQ0MjIxLi41M2JjOTNkNmViMGMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvdXNiL2NvcmUvaGNkLmMNCj4gKysrIGIvZHJpdmVycy91c2IvY29yZS9oY2QuYw0KPiBAQCAt
MTEsNyArMTEsNiBAQA0KPiAgI2luY2x1ZGUgPGxpbnV4L2JjZC5oPg0KPiAgI2luY2x1ZGUgPGxp
bnV4L21vZHVsZS5oPg0KPiAtI2luY2x1ZGUgPGxpbnV4L3ZlcnNpb24uaD4NCj4gICNpbmNsdWRl
IDxsaW51eC9rZXJuZWwuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9zY2hlZC90YXNrX3N0YWNrLmg+
DQo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiANCg0KWW91ciB0b29sIGlzIFZFUlkgYnJv
a2VuLiAgUGxlYXNlIHN0b3Agc2VuZGluZyBwYXRjaGVzIHRoYXQgeW91IG9idmlvdXNseSBkbyBu
b3QgZXZlbiB0ZXN0IGJlZm9yZSBzdWJtaXR0aW5nOg0KCWh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMTYxNDczMzc1Mi01NjU0MS0xLWdpdC1zZW5kLWVtYWlsLXRpYW50YW82QGhpc2lsaWNvbi5j
b20NCg0KSXQncyBhIHN1cmUgd2F5IHRvIG1ha2UgbWFpbnRhaW5lcnMgdmVyeSBncnVtcHkuDQoN
CmdyZWcgay1oDQo=
