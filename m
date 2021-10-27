Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D9743C690
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 11:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238949AbhJ0Jib (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 05:38:31 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:47588 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S238911AbhJ0Jia (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 05:38:30 -0400
X-UUID: fd310415190743078ae7ed4d5db506ca-20211027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=MRYbtZzHA6Ab8RM4gbu8m/VI2yKvhjNG510eYE06hMU=;
        b=HqvBYS3uPi64EHmXz193uUhnyy4JjDzmQ9RTH17SnYGZJIDhG+3DChLkyXHCrGlxXPwyVxF27cubcUYy7Dh+sq42eYXMFKnrEuwh7hbLs0Dljpg5lYncC/3NpW5UO6Dn5wwn7PYRvEtmRSMTpMf+RJuJRtA7a0qTdTM1qN9RKB4=;
X-UUID: fd310415190743078ae7ed4d5db506ca-20211027
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 801106141; Wed, 27 Oct 2021 17:36:01 +0800
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 27 Oct 2021 17:36:00 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 27 Oct
 2021 17:35:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Oct 2021 17:35:58 +0800
Message-ID: <7811ffc8032eeb3201025085501da999e30a09d2.camel@mediatek.com>
Subject: Re: [PATCH v2 20/22] usb: host: xhci-mtk: deny IRQ0
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, <linux-usb@vger.kernel.org>,
        "Mathias Nyman" <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Date:   Wed, 27 Oct 2021 17:35:58 +0800
In-Reply-To: <d7a7d79a-a1b9-3c3d-13e1-ab4ab8e9989a@omp.ru>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
         <20211026173943.6829-21-s.shtylyov@omp.ru>
         <fee8297f6b34e530ef2e3da4e9bc9e324308b439.camel@mediatek.com>
         <d7a7d79a-a1b9-3c3d-13e1-ab4ab8e9989a@omp.ru>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIxLTEwLTI3IGF0IDEyOjI1ICswMzAwLCBTZXJnZXkgU2h0eWx5b3Ygd3JvdGU6
DQo+IE9uIDI3LjEwLjIwMjEgMTI6MTgsIENodW5mZW5nIFl1biB3cm90ZToNCj4gDQo+ID4gPiBJ
ZiBwbGF0Zm9ybV9nZXRfaXJxKCkgcmV0dXJucyBJUlEwIChjb25zaWRlcmVkIGludmFsaWQgYWNj
b3JkaW5nDQo+ID4gPiB0bw0KPiA+ID4gTGludXMpDQo+ID4gPiB0aGUgZHJpdmVyIGJsaXRoZWx5
IHBhc3NlcyBpdCB0byB1c2JfYWRkX2hjZCgpIHRoYXQgdHJlYXRzIElSUTANCj4gPiA+IGFzIG5v
DQo+ID4gPiBJUlENCj4gPiA+IGF0IGFsbC4gRGVueSBJUlEwIHJpZ2h0IGF3YXksIHJldHVybmlu
ZyAtRUlOVkFMIGZyb20gdGhlIHByb2JlKCkNCj4gPiA+IG1ldGhvZC4uLg0KPiA+ID4gDQo+ID4g
PiBGaXhlczogMGNiZDRiMzRjZGE5ICgieGhjaTogbWVkaWF0ZWs6IHN1cHBvcnQgTVRLIHhIQ0kg
aG9zdA0KPiA+ID4gY29udHJvbGxlciIpDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgU2h0
eWx5b3YgPHMuc2h0eWx5b3ZAb21wLnJ1Pg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZlcnMvdXNi
L2hvc3QveGhjaS1tdGsuYyB8IDQgKysrLQ0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9ob3N0L3hoY2ktbXRrLmMgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktDQo+ID4gPiBt
dGsuYw0KPiA+ID4gaW5kZXggYzUzZjZmMjc2ZDVjLi5kMmRjOGQ5ODYzZWUgMTAwNjQ0DQo+ID4g
PiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktbXRrLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMv
dXNiL2hvc3QveGhjaS1tdGsuYw0KPiA+ID4gQEAgLTQ5NSw3ICs0OTUsNyBAQCBzdGF0aWMgaW50
IHhoY2lfbXRrX3Byb2JlKHN0cnVjdA0KPiA+ID4gcGxhdGZvcm1fZGV2aWNlDQo+ID4gPiAqcGRl
dikNCj4gPiA+ICAgCQlyZXR1cm4gcmV0Ow0KPiA+ID4gICANCj4gPiA+ICAgCWlycSA9IHBsYXRm
b3JtX2dldF9pcnFfYnluYW1lX29wdGlvbmFsKHBkZXYsICJob3N0Iik7DQo+ID4gPiAtCWlmIChp
cnEgPCAwKSB7DQo+ID4gPiArCWlmIChpcnEgPD0gMCkgew0KPiA+ID4gICAJCWlmIChpcnEgPT0g
LUVQUk9CRV9ERUZFUikNCj4gPiA+ICAgCQkJcmV0dXJuIGlycTsNCj4gPiA+ICAgDQo+ID4gPiBA
QCAtNTAzLDYgKzUwMyw4IEBAIHN0YXRpYyBpbnQgeGhjaV9tdGtfcHJvYmUoc3RydWN0DQo+ID4g
PiBwbGF0Zm9ybV9kZXZpY2UNCj4gPiA+ICpwZGV2KQ0KPiA+ID4gICAJCWlycSA9IHBsYXRmb3Jt
X2dldF9pcnEocGRldiwgMCk7DQpIZXJlLCBpcnEgaXMgdXBkYXRlZCBhZ2Fpbg0KDQo+ID4gPiAg
IAkJaWYgKGlycSA8IDApDQo+ID4gPiAgIAkJCXJldHVybiBpcnE7DQo+ID4gPiArCQlpZiAoIWly
cSkNCj4gPiANCj4gPiBpdCdzICJpZiAoaXJxIDw9IDApIj8NCj4gDQo+ICAgICBObywgaWYgKGly
cSA9PSAwKS4NCj4gDQo+ID4gPiArCQkJcmV0dXJuIC1FSU5WQUw7DQphZGQgImVsc2UgaWYgKGly
cSA8IDApLCByZXR1cm4gaXJxOyI/ICBidXQgbm90IC1FSU5WQUwgb25seSwgdGhpcyBtYXkNCmRy
b3AgRVBST0JFX0RFRkVSDQoNCj4gPiA+ICAgCX0NCj4gPiA+ICAgDQo+ID4gPiAgIAl3YWtldXBf
aXJxID0gcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWVfb3B0aW9uYWwocGRldiwNCj4gPiA+ICJ3YWtl
dXAiKTsNCj4gDQo+IE1CUiwgU2VyZ2V5DQo=

