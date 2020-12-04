Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582DA2CE58D
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 03:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgLDCIn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Dec 2020 21:08:43 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:4277 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726492AbgLDCIm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Dec 2020 21:08:42 -0500
X-UUID: c1824fb84b75415992a1dcd6242929c2-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=xs9eF5fglSIsmijGZu14F0E5pV9HzptzLHDNcPvVCIs=;
        b=CXPUXZL4sLCAlfchrwMoUS3XmNCzDl34SrYXGro6+x/pC/46Zwn+p/WdSzeSi1bYV6amD+rcDGQ8cl+3M/GUP2YojgUlXnMS9dghtM1irKuFl580HwrQVrNxkn+m1Y7kqNVS3M0KG+I6ADctDQM4lhkHPIJKmFXcxeo5BxzQwKo=;
X-UUID: c1824fb84b75415992a1dcd6242929c2-20201204
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 24793708; Fri, 04 Dec 2020 10:07:58 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Dec
 2020 10:07:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Dec 2020 10:07:56 +0800
Message-ID: <1607047676.7284.18.camel@mhfsdcap03>
Subject: Re: [PATCH 2/2] usb: mtu3: mtu3_debug: remove an unused struct
 member
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
Date:   Fri, 4 Dec 2020 10:07:56 +0800
In-Reply-To: <X8ikv1QA3Do50D+R@mwanda>
References: <X8ikv1QA3Do50D+R@mwanda>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AC0B05F042C3094CF0C98DC0756865E872A5F19AB13B6FEF8FDFC73BD9F1C23B2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCAyMDIwLTEyLTAzIGF0IDExOjQxICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBUaGUgIm5yZWdzIiBtZW1iZXIgaXMgbm90IHVzZWQuICBUaGUgY29kZSB1c2VzIHRoZSAicmVn
c2V0Lm5yZWdzIg0KPiBzdHJ1Y3QgbWVtYmVyIGluc3RlYWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy91c2IvbXR1My9tdHUzX2RlYnVnLmggfCAxIC0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvbXR1My9tdHUzX2RlYnVn
LmggYi9kcml2ZXJzL3VzYi9tdHUzL210dTNfZGVidWcuaA0KPiBpbmRleCAzMDg0YzQ2MDE3YzMu
LjlhMzYxMzRiMzIyZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvbXR1My9tdHUzX2RlYnVn
LmgNCj4gKysrIGIvZHJpdmVycy91c2IvbXR1My9tdHUzX2RlYnVnLmgNCj4gQEAgLTE5LDcgKzE5
LDYgQEAgc3RydWN0IHNzdXNiX210azsNCj4gIHN0cnVjdCBtdHUzX3JlZ3NldCB7DQo+ICAJY2hh
ciBuYW1lW01UVTNfREVCVUdGU19OQU1FX0xFTl07DQo+ICAJc3RydWN0IGRlYnVnZnNfcmVnc2V0
MzIgcmVnc2V0Ow0KPiAtCXNpemVfdCBucmVnczsNCj4gIH07DQpBY2tlZC1ieTogQ2h1bmZlbmcg
WXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KDQpUaGFua3MgYSBsb3QNCg0KPiAgDQo+
ICBzdHJ1Y3QgbXR1M19maWxlX21hcCB7DQoNCg==

