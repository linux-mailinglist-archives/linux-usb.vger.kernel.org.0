Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7BB644F1FB
	for <lists+linux-usb@lfdr.de>; Sat, 13 Nov 2021 08:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235728AbhKMHTP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Nov 2021 02:19:15 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:57252 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231250AbhKMHTO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Nov 2021 02:19:14 -0500
X-UUID: 6e42686547ec4888a155e74ec960264a-20211113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Date:MIME-Version:Content-Type:References:In-Reply-To:CC:To:From:Subject:Message-ID; bh=tz4dMpoGwAHrKtvwXNl0qRY/8R7GtbkOSsZHPQmwR0M=;
        b=OumaVR2Da8crvl4ZuBHCC1FjO2LIHkGslSwkI6cqoD3faoCW5jX66XpqXX0HeRxLHgR+gH7Rke0tM8oasSy+W7ec/XxHSVsSnnfrirdSIVysGETIaaHxrbrHEjfwHfdMN8nQuHwy8+rOV2DGb6OWECdQO4uv7KsNkm6rj4agnrs=;
X-UUID: 6e42686547ec4888a155e74ec960264a-20211113
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1232590081; Sat, 13 Nov 2021 15:16:18 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sat, 13 Nov 2021 15:16:17 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 13 Nov
 2021 15:16:17 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 13 Nov 2021 15:16:16 +0800
Message-ID: <7d5da62b58cd51c08e4e4f9e23069f122c1a5cb4.camel@mediatek.com>
Subject: Re: [PATCH v2 20/22] usb: host: xhci-mtk: deny IRQ0
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, <linux-usb@vger.kernel.org>,
        "Mathias Nyman" <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
In-Reply-To: <20211026173943.6829-21-s.shtylyov@omp.ru>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
         <20211026173943.6829-21-s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Wed, 27 Oct 2021 16:54:48 +0800
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
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
CQkJcmV0dXJuIGlycTsNCj4gKwkJaWYgKCFpcnEpDQpJdCBpcyAiaWYgKGlycSA8PSAwKSI/DQoN
Cg0KPiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJfQ0KPiAgDQo+ICAJd2FrZXVwX2lycSA9IHBs
YXRmb3JtX2dldF9pcnFfYnluYW1lX29wdGlvbmFsKHBkZXYsICJ3YWtldXAiKTsNCg==

