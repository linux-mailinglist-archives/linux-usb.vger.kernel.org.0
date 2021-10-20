Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E444345E9
	for <lists+linux-usb@lfdr.de>; Wed, 20 Oct 2021 09:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbhJTHeo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Oct 2021 03:34:44 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:36439 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229491AbhJTHeo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Oct 2021 03:34:44 -0400
X-UUID: 14d6a36e1496404d847f05b62dbe8858-20211020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=9ZbN+7hN+eyKKRyTdSPLXJGA+qopiKwuP/HmfE3Ecm0=;
        b=WGTI3RKWcoQv6AzM4LuWuxSX+QAi3U87hZy5X3vec2471bxktGQJ1GgmgJqrRpttMFQLR9U2G2nONFY+o7ALutYtzdf6XJw71tN9Hfiw2cI+3WPuha8D88QYu1B5AtaAMv7UOzxdM7m2jiUW48rsqYzedDJqZGU8SUNAKw4wKY8=;
X-UUID: 14d6a36e1496404d847f05b62dbe8858-20211020
Received: from mtkcas32.mediatek.inc [(172.27.6.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1213069692; Wed, 20 Oct 2021 15:32:27 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 20 Oct
 2021 15:32:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Oct 2021 15:32:21 +0800
Message-ID: <0ace973fda20c26d87d64849ce9bd2691101bca6.camel@mediatek.com>
Subject: Re: [PATCH 20/22] usb: host: xhci-mtk: deny IRQ0
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, <linux-usb@vger.kernel.org>,
        "Mathias Nyman" <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Date:   Wed, 20 Oct 2021 15:32:20 +0800
In-Reply-To: <20211018183930.8448-21-s.shtylyov@omp.ru>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
         <20211018183930.8448-21-s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 542E1F1BB22D87C9F4CD9FF8CEE9F626407C749C398635E80743AFD0C0E561782000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCAyMDIxLTEwLTE4IGF0IDIxOjM5ICswMzAwLCBTZXJnZXkgU2h0eWx5b3Ygd3JvdGU6
DQo+IElmIHBsYXRmb3JtX2dldF9pcnEoKSByZXR1cm5zIElSUTAgKGNvbnNpZGVyZWQgaW52YWxp
ZCBhY2NvcmRpbmcgdG8NCj4gTGludXMpDQo+IHRoZSBkcml2ZXIgYmxpdGhlbHkgcGFzc2VzIGl0
IHRvIHVzYl9hZGRfaGNkKCkgdGhhdCB0cmVhdHMgSVJRMCBhcyBubw0KPiBJUlENCj4gYXQgYWxs
LiBEZW55IElSUTAgcmlnaHQgYXdheSwgcmV0dXJuaW5nIC1FSU5WQUwgZnJvbSB0aGUgcHJvYmUo
KQ0KPiBtZXRob2QuLi4NCj4gDQo+IEZpeGVzOiAwY2JkNGIzNGNkYTkgKCJ4aGNpOiBtZWRpYXRl
azogc3VwcG9ydCBNVEsgeEhDSSBob3N0DQo+IGNvbnRyb2xsZXIiKQ0KRml4ZXMgdGhlIGZvbGxv
d2luZyBwYXRjaDoNCg0KMDQyODRlYjc0ZTBjIHVzYjogeGhjaS1tdGs6IGFkZCBzdXBwb3J0IHJ1
bnRpbWUgUE0NCg0KSXQgaW50cm9kdWNlZCB0aGUgJ2hvc3QnIGlycQ0KDQo+IFNpZ25lZC1vZmYt
Ynk6IFNlcmdleSBTaHR5bHlvdiA8cy5zaHR5bHlvdkBvbXAucnU+DQo+IC0tLQ0KPiAgZHJpdmVy
cy91c2IvaG9zdC94aGNpLW10ay5jIHwgNCArKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
aG9zdC94aGNpLW10ay5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLQ0KPiBtdGsuYw0KPiBpbmRl
eCBjNTNmNmYyNzZkNWMuLmQyZGM4ZDk4NjNlZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2Iv
aG9zdC94aGNpLW10ay5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1tdGsuYw0KPiBA
QCAtNDk1LDcgKzQ5NSw3IEBAIHN0YXRpYyBpbnQgeGhjaV9tdGtfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZQ0KPiAqcGRldikNCj4gIAkJcmV0dXJuIHJldDsNCj4gIA0KPiAgCWlycSA9IHBs
YXRmb3JtX2dldF9pcnFfYnluYW1lX29wdGlvbmFsKHBkZXYsICJob3N0Iik7DQo+IC0JaWYgKGly
cSA8IDApIHsNCj4gKwlpZiAoaXJxIDw9IDApIHsNCj4gIAkJaWYgKGlycSA9PSAtRVBST0JFX0RF
RkVSKQ0KPiAgCQkJcmV0dXJuIGlycTsNCj4gIA0KPiBAQCAtNTAzLDYgKzUwMyw4IEBAIHN0YXRp
YyBpbnQgeGhjaV9tdGtfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRldikNCj4g
IAkJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsNCj4gIAkJaWYgKGlycSA8IDApDQo+
ICAJCQlyZXR1cm4gaXJxOw0KPiArCQlpZiAoIWlycSkNCmlmIChpcnEgPD0gMCkgPw0KDQpUaGFu
a3MNCg0KPiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJfQ0KPiAgDQo+ICAJd2FrZXVwX2lycSA9
IHBsYXRmb3JtX2dldF9pcnFfYnluYW1lX29wdGlvbmFsKHBkZXYsICJ3YWtldXAiKTsNCg==

