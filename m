Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4282B19BA36
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 04:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732462AbgDBCPt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 22:15:49 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:33384 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727135AbgDBCPt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Apr 2020 22:15:49 -0400
X-UUID: e9f8c229a1b64a22b30379c59a419f5b-20200402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=j2hWWUuz3KGWjaQejXZFkjVBnedbl9V3EUJsbWbsseg=;
        b=LfwnovNnGse+OnKDMNxeFodv82vWOnCj+h1ID0btUOwudixXXaKftc4n5lRQgxfbOekgf6anvCKGSyBkmv/U2lEk/7nt9yKsY3fXvVYlcCNvSxEFyJvjyP/u0prmw+wMJeZeT3iKUpZzJ7/0wNsa1CJj7qtrNm0tmtjnmPBISDU=;
X-UUID: e9f8c229a1b64a22b30379c59a419f5b-20200402
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 738108935; Thu, 02 Apr 2020 10:15:37 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 2 Apr
 2020 10:15:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Apr 2020 10:15:35 +0800
Message-ID: <1585793739.28772.4.camel@mhfsdcap03>
Subject: Re: [PATCH 0/7] Universal Serial Bus: Removing Acronyms
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     <linux-usb@vger.kernel.org>
Date:   Thu, 2 Apr 2020 10:15:39 +0800
In-Reply-To: <Pine.LNX.4.44L0.2004011036470.22914-100000@netrider.rowland.org>
References: <Pine.LNX.4.44L0.2004011036470.22914-100000@netrider.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 09BD61C12EA37C23042C85B167F24893E4375AB8A531E76234DF642965305B952000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIwLTA0LTAxIGF0IDEwOjQzIC0wNDAwLCBBbGFuIFN0ZXJuIHdyb3RlOg0KPiBP
biBXZWQsIDEgQXByIDIwMjAsIEZlbGlwZSBCYWxiaSB3cm90ZToNCj4gDQo+ID4gDQo+ID4gSGks
DQo+ID4gDQo+ID4gR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz4gd3JpdGVzOg0KPiA+ID4gT24gV2VkLCBBcHIgMDEsIDIwMjAgYXQgMTA6MzI6NDJBTSArMDMw
MCwgRmVsaXBlIEJhbGJpIHdyb3RlOg0KPiA+ID4+ICA3NjQgZmlsZXMgY2hhbmdlZCwgODYzMDQg
aW5zZXJ0aW9ucygrKSwgODYzMDQgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gQWgsIGEgbmlj
ZSB0aW55IHBhdGNoc2V0LCBJJ2xsIHRyeSB0byBzbmVhayB0aGlzIGluIGR1cmluZyB0aGUgbWVy
Z2UNCj4gPiA+IHdpbmRvdyBub3cgOikNCj4gPiANCj4gPiBUaGF0J3MgZ3JlYXQsIEdyZWcuIEl0
J2xsIGhlbHAgaHVuZHJlZHMgb2YgcGVvcGxlLCBJJ20gc3VyZS4NCj4gPiANCj4gPiA+IG5pY2Ug
am9iLi4uDQo+ID4gDQo+ID4gVGhhbmsgeW91DQo+IA0KPiBZZXMgaW5kZWVkLiAgTm90IHRvIG1l
bnRpb24gdGhlIGFkbWlyYWJsZSBzaWRlIGVmZmVjdCBvZiBpbmNyZWFzaW5nIHRoZQ0KPiBhbW91
bnQgb2YgZXhlcmNpc2Ugb3VyIGZpbmdlcnMgd2lsbCBnZXQgaW4gdGhlIGZ1dHVyZSB3aGlsZSB3
ZSB3cml0ZQ0KPiBwYXRjaGVzIGFuZCBuZXcgZHJpdmVycy4gIEFuZCBhIHdvbmRlcmZ1bCBleGFt
cGxlIG9mIGhvdyBhIHNpemFibGUNCj4gX2luY3JlYXNlXyBpbiB0aGUgdG90YWwgc2l6ZSBvZiB0
aGUga2VybmVsIHNvdXJjZSBjYW4gbGVhZCB0byBhDQo+IF9kZWNyZWFzZV8gaW4gY29uZnVzaW9u
IGZvciByZWFkZXJzLg0KPiANCkkgZmluZCB0aGF0IEkgd2lsbCBzcGVuZCBtb3JlIHRpbWUgdG8g
cmVhZC93cml0ZSB0aGUgY29kZSENCg0KZS5nLg0KLXN0YXRpYyB2b2lkIHVoY2lfdW5saW5rX3Fo
KHN0cnVjdCB1aGNpX2hjZCAqdWhjaSwgc3RydWN0IHVoY2lfcWggKnFoKQ0KK3N0YXRpYyB2b2lk
IHVuaXZlcnNhbF9ob3N0X2NvbnRyb2xsZXJfaW50ZXJmYWNlX3VubGlua19xaChzdHJ1Y3QNCnVu
aXZlcnNhbF9ob3N0X2NvbnRyb2xsZXJfaW50ZXJmYWNlX2hjZA0KKnVuaXZlcnNhbF9ob3N0X2Nv
bnRyb2xsZXJfaW50ZXJmYWNlLCBzdHJ1Y3QNCnVuaXZlcnNhbF9ob3N0X2NvbnRyb2xsZXJfaW50
ZXJmYWNlX3FoICpxaCkNCg0KDQo+IChQbHVzIHRoaXMgaXMgYSBncmVhdCBpbGx1c3RyYXRpb24g
b2YgaG93IGNvbnNpc3RlbnRseSB2aW9sYXRpbmcgdGhlDQo+IDgwLWNvbHVtbiBydWxlIGNhbiBi
ZSBqdXN0aWZpYWJsZSB1bmRlciB0aGUgcmlnaHQgY2lyY3Vtc3RhbmNlcy4pDQo+IA0KPiBBbGFu
IFN0ZXJuDQo+IA0KDQo=

