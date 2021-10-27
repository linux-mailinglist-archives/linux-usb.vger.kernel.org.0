Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC2143C651
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 11:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239528AbhJ0JVK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 05:21:10 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:47564 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S237410AbhJ0JVK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 05:21:10 -0400
X-UUID: 5f85a098493148fab95b3db43a181f3c-20211027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=DnF617kfzUFWB+wTivNGwRZqdqT0fNx18iqxKeiaIoI=;
        b=hohhy9kXY+QlZnce9I8XyAyvddEsPo9QCRuS5fHZP1g3IFpOWbYgi8oK0j9LzTQodzJwz8dRDXEOBcfoVRWiv2aILx5nz3NUkhGWeqLe2vycs0USFjvpbCfPt1r7CBPSYofjAa6XJDYCXT6c7uN4RS4NYQCKS3k5TIKDfbghUvE=;
X-UUID: 5f85a098493148fab95b3db43a181f3c-20211027
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 291350436; Wed, 27 Oct 2021 17:18:40 +0800
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Oct 2021 17:18:39 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 27 Oct
 2021 17:18:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Oct 2021 17:18:32 +0800
Message-ID: <fee8297f6b34e530ef2e3da4e9bc9e324308b439.camel@mediatek.com>
Subject: Re: [PATCH v2 20/22] usb: host: xhci-mtk: deny IRQ0
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, <linux-usb@vger.kernel.org>,
        "Mathias Nyman" <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Date:   Wed, 27 Oct 2021 17:18:31 +0800
In-Reply-To: <20211026173943.6829-21-s.shtylyov@omp.ru>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
         <20211026173943.6829-21-s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCAyMDIxLTEwLTI2IGF0IDIwOjM5ICswMzAwLCBTZXJnZXkgU2h0eWx5b3Ygd3JvdGU6
DQo+IElmIHBsYXRmb3JtX2dldF9pcnEoKSByZXR1cm5zIElSUTAgKGNvbnNpZGVyZWQgaW52YWxp
ZCBhY2NvcmRpbmcgdG8NCj4gTGludXMpDQo+IHRoZSBkcml2ZXIgYmxpdGhlbHkgcGFzc2VzIGl0
IHRvIHVzYl9hZGRfaGNkKCkgdGhhdCB0cmVhdHMgSVJRMCBhcyBubw0KPiBJUlENCj4gYXQgYWxs
LiBEZW55IElSUTAgcmlnaHQgYXdheSwgcmV0dXJuaW5nIC1FSU5WQUwgZnJvbSB0aGUgcHJvYmUo
KQ0KPiBtZXRob2QuLi4NCj4gDQo+IEZpeGVzOiAwY2JkNGIzNGNkYTkgKCJ4aGNpOiBtZWRpYXRl
azogc3VwcG9ydCBNVEsgeEhDSSBob3N0DQo+IGNvbnRyb2xsZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5b3ZAb21wLnJ1Pg0KPiAtLS0NCj4gIGRyaXZlcnMv
dXNiL2hvc3QveGhjaS1tdGsuYyB8IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hv
c3QveGhjaS1tdGsuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS0NCj4gbXRrLmMNCj4gaW5kZXgg
YzUzZjZmMjc2ZDVjLi5kMmRjOGQ5ODYzZWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2hv
c3QveGhjaS1tdGsuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktbXRrLmMNCj4gQEAg
LTQ5NSw3ICs0OTUsNyBAQCBzdGF0aWMgaW50IHhoY2lfbXRrX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UNCj4gKnBkZXYpDQo+ICAJCXJldHVybiByZXQ7DQo+ICANCj4gIAlpcnEgPSBwbGF0
Zm9ybV9nZXRfaXJxX2J5bmFtZV9vcHRpb25hbChwZGV2LCAiaG9zdCIpOw0KPiAtCWlmIChpcnEg
PCAwKSB7DQo+ICsJaWYgKGlycSA8PSAwKSB7DQo+ICAJCWlmIChpcnEgPT0gLUVQUk9CRV9ERUZF
UikNCj4gIAkJCXJldHVybiBpcnE7DQo+ICANCj4gQEAgLTUwMyw2ICs1MDMsOCBAQCBzdGF0aWMg
aW50IHhoY2lfbXRrX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ICAJ
CWlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7DQo+ICAJCWlmIChpcnEgPCAwKQ0KPiAg
CQkJcmV0dXJuIGlycTsNCj4gKwkJaWYgKCFpcnEpDQppdCdzICJpZiAoaXJxIDw9IDApIj8NCg0K
PiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJfQ0KPiAgDQo+ICAJd2FrZXVwX2lycSA9IHBsYXRm
b3JtX2dldF9pcnFfYnluYW1lX29wdGlvbmFsKHBkZXYsICJ3YWtldXAiKTsNCg==

