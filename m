Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3772D21DE
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 05:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgLHEP6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Dec 2020 23:15:58 -0500
Received: from Mailgw01.mediatek.com ([1.203.163.78]:20336 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725874AbgLHEP6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Dec 2020 23:15:58 -0500
X-UUID: 71140b19c8a246c19f675ec67b0917d0-20201208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=SQbAfHtOLLKSe7iUTymu6Ec7aPGYJE1hWO211GToPfM=;
        b=kRJX/vvzE+9P9brPBuZlU+p3NZZ2UM+sRTCvTQInVw3qYWrNQJjBmaRFE0sK9l3pEXAI9eENdURgZTLwOjGXBPgWIVmqypgBrTiLx5iweQZGMWUMnfhDvVebLkc/Fxf+DbPVakbNNOtNSoizd6ZK/YBCR4bDdAn2hYY094xKzzA=;
X-UUID: 71140b19c8a246c19f675ec67b0917d0-20201208
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1072109216; Tue, 08 Dec 2020 12:14:59 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Dec
 2020 12:14:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Dec 2020 12:14:57 +0800
Message-ID: <1607400896.23328.7.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] usb: mtu3: fix memory corruption in
 mtu3_debugfs_regset()
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
Date:   Tue, 8 Dec 2020 12:14:56 +0800
In-Reply-To: <X8ikqc4Mo2/0G72j@mwanda>
References: <X8ikqc4Mo2/0G72j@mwanda>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 125EA1465074F59FE9EFB536D80038FE4E5F9648639B8DC7B9CA890AC9C2536B2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCAyMDIwLTEyLTAzIGF0IDExOjQxICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBUaGlzIGNvZGUgaXMgdXNpbmcgdGhlIHdyb25nIHNpemVvZigpIHNvIGl0IGRvZXMgbm90IGFs
bG9jYXRlIGVub3VnaA0KPiBtZW1vcnkuICBJdCBhbGxvY2F0ZXMgMzIgYnl0ZXMgYnV0IDcyIGFy
ZSByZXF1aXJlZC4gIFRoYXQgd2lsbCBsZWFkIHRvDQo+IG1lbW9yeSBjb3JydXB0aW9uLg0KPiAN
Cj4gRml4ZXM6IGFlMDc4MDkyNTVkMyAoInVzYjogbXR1MzogYWRkIGRlYnVnZnMgaW50ZXJmYWNl
IGZpbGVzIikNCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBv
cmFjbGUuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL210dTMvbXR1M19kZWJ1Z2ZzLmMgfCAy
ICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9tdHUzL210dTNfZGVidWdmcy5jIGIvZHJpdmVy
cy91c2IvbXR1My9tdHUzX2RlYnVnZnMuYw0KPiBpbmRleCBmZGVhZGU2MjU0YWUuLjc1MzdiZmQ2
NTFhZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvbXR1My9tdHUzX2RlYnVnZnMuYw0KPiAr
KysgYi9kcml2ZXJzL3VzYi9tdHUzL210dTNfZGVidWdmcy5jDQo+IEBAIC0xMjcsNyArMTI3LDcg
QEAgc3RhdGljIHZvaWQgbXR1M19kZWJ1Z2ZzX3JlZ3NldChzdHJ1Y3QgbXR1MyAqbXR1LCB2b2lk
IF9faW9tZW0gKmJhc2UsDQo+ICAJc3RydWN0IGRlYnVnZnNfcmVnc2V0MzIgKnJlZ3NldDsNCj4g
IAlzdHJ1Y3QgbXR1M19yZWdzZXQgKm1yZWdzOw0KPiAgDQo+IC0JbXJlZ3MgPSBkZXZtX2t6YWxs
b2MobXR1LT5kZXYsIHNpemVvZigqcmVnc2V0KSwgR0ZQX0tFUk5FTCk7DQo+ICsJbXJlZ3MgPSBk
ZXZtX2t6YWxsb2MobXR1LT5kZXYsIHNpemVvZigqbXJlZ3MpLCBHRlBfS0VSTkVMKTsNCj4gIAlp
ZiAoIW1yZWdzKQ0KPiAgCQlyZXR1cm47DQo+ICBBY2tlZC1ieTogQ2h1bmZlbmcgWXVuIDxjaHVu
ZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KDQpUaGFua3MNCg0KDQo=

