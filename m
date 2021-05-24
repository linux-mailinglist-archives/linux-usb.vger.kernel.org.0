Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5388438E0B6
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 07:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbhEXFx1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 01:53:27 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:61931 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229733AbhEXFx1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 May 2021 01:53:27 -0400
X-UUID: 0033122a9e304276a05e2d4759f66f7f-20210524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=LoLYf3k09hMICHMVpZro5qOWWXrtd+kOMaHi5n1SgPc=;
        b=KBEzU4Fbs6sGymUviRZ4SquZ/0bt/AlFB38yjPcEpC1Xvc5q77z0Z3Utp1lbg0VbRFaphSvS6EOex+BNl/DEIT6cft+PSTrRLrCPe3eDrTFS/H1vAVsp21yvz+1zt9cmT2TFnLg+9sCN0zioSUbMYJR0NQ10L5t78ycTA6Baoa4=;
X-UUID: 0033122a9e304276a05e2d4759f66f7f-20210524
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1031345565; Mon, 24 May 2021 13:51:54 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 May
 2021 13:51:51 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 24 May 2021 13:51:51 +0800
Message-ID: <1621835511.26501.14.camel@mhfsdcap03>
Subject: Re: [PATCH v2 3/3] Revert "usb: common: usb-conn-gpio: Make VBUS
 supply optional"
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Thierry Reding <treding@nvidia.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Lee Jones <lee.jones@linaro.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Date:   Mon, 24 May 2021 13:51:51 +0800
In-Reply-To: <YKezl0nlWFQhLyf/@orome.fritz.box>
References: <1621406386-18838-1-git-send-email-chunfeng.yun@mediatek.com>
         <1621406386-18838-3-git-send-email-chunfeng.yun@mediatek.com>
         <YKezl0nlWFQhLyf/@orome.fritz.box>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 09521C55F9BDC52149C658731C51578E10BA171E1C2E2D51E277A9BE9C943C162000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCAyMDIxLTA1LTIxIGF0IDE1OjIwICswMjAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToN
Cj4gT24gV2VkLCBNYXkgMTksIDIwMjEgYXQgMDI6Mzk6NDZQTSArMDgwMCwgQ2h1bmZlbmcgWXVu
IHdyb3RlOg0KPiA+IFZidXMgaXMgYWxyZWFkeSBhbiBvcHRpb25hbCBzdXBwbHksIGlmIHRoZSB2
YnVzLXN1cHBseSBpcyBub3QNCj4gPiBwcm92aWRlZCBpbiBEVFMsIHdpbGwgdXNlIGEgZHVtbXkg
cmVndWxhdG9yLA0KPiANCj4gVGhhdCBzdGF0ZW1lbnQgaXMgbm90IGVudGlyZWx5IGNvcnJlY3Qu
IFRoZSBkdW1teSByZWd1bGF0b3IgaXMNCj4gc3Vic3RpdHV0ZWQgb25seSBpZiB0aGUgc3VwcGx5
IGlzIGluIGZhY3Qgbm90IG9wdGlvbmFsLiBUaGUgaWRlYSBiZWhpbmQNCj4gdGhhdCBpcyB0byBh
bGxvdyBEVFMgZmlsZXMgdGhhdCBkb24ndCBzcGVjaWZ5IGFsbCByZXF1aXJlZCByZWd1bGF0b3Jz
IHRvDQo+IGdldCBhd2F5IHdpdGggaXQsIGJhc2VkIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQgdGhl
IHN1cHBseSBpcyBvbmUgb2YNCj4gdGhvc2UgYWx3YXlzLW9uIHN1cHBsaWVzIHRoYXQgYXJlIG9m
dGVuIG5vdCBkZXNjcmliZWQgaW4gRFRTLg0KWWVzLCB5b3UgYXJlIHJpZ2h0Lg0KQnV0IGZyb20g
dGhlIHBvaW50IG9mIHJlc3VsdCwgaXQgaW5kZWVkIGNhbiBoZWxwIHRvIGhhbmRsZSB0aGUgYWJz
ZW50DQpyZWd1bGF0b3IuDQo+IA0KPiA+IHRoZSB3YXJuaW5nIGxvZyBpcyBhcyBiZWxvdzoNCj4g
PiAic3VwcGx5IHZidXMgbm90IGZvdW5kLCB1c2luZyBkdW1teSByZWd1bGF0b3IiDQo+IA0KPiBB
bmQgdGhlIHJlYXNvbiB3aHkgd2UgZ2V0IHRoYXQgd2FybmluZyBpcyB0byBwb2ludCBvdXQgdGhh
dCB0aGUgRFRTIGhhcw0KPiBhIGJ1ZyBhbmQgdGhhdCBpdCBzaG91bGQgYmUgZml4ZWQgKGJ5IGFk
ZGluZyBhIHByb3BlciByZWd1bGF0b3IgdG8gdGFrZQ0KPiB0aGUgcGxhY2Ugb2YgdGhlIGR1bW15
KS4NCj4gDQo+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCA0ZGRmMWFjNzllNWYwODI0NTFjZDU0OTI4
M2QyZWI3NTU5YWI2Y2E5Lg0KPiANCj4gQnV0IGlmIHlvdSByZWFkIHRoZSBkZXNjcmlwdGlvbiBv
ZiB0aGF0IGNvbW1pdCwgdGhlIHB1cnBvc2Ugb2YgdGhhdA0KPiBwYXRjaCB3YXMgaW4gZmFjdCB0
byBtYWtlIHRoZSBzdXBwbHkgY29tcGxldGVseSBvcHRpb25hbCBpbiB0aGUgY2FzZQ0KPiB3aGVy
ZSB3ZSBhbHJlYWR5IGhhdmUgdGhlIFZCVVMgc3VwcGx5IHNwZWNpZmllZCBmb3IgdGhlIFVTQiBw
b3J0IHRoYXQNCj4gdGhlIGNvbm5lY3RvciBpcyBwYXJlbnRlZCB0by4NCkNvdWxkIHlvdSBwbGVh
c2UgZ2l2ZSBhbiBleGFtcGxlIHlvdSBtZW50aW9uZWQ/DQoNCkl0IHNlZW1zIHByZWZlciB0byBw
cm92aWRlIHZidXMgc3VwcGx5IGluIGNvbm5lY3RvciBpbnN0ZWFkIG9mIHBvcnQNCmFjY29yZGlu
ZyB0byBkdC1iaW5kaW5nDQoNClRoYW5rcw0KDQo+IA0KPiBTbyBpbiB0aGF0IGNhc2UgdGhlIERU
UyBkb2Vzbid0IGhhdmUgdGhlIGJ1ZyBiZWNhdXNlIHRoZSBWQlVTIHN1cHBseSBpcw0KPiBhbHJl
YWR5IHNwZWNpZmllZCBmb3IgdGhlIFVTQiBwb3J0IGFuZCB0aGVyZWZvcmUgaXQgZG9lc24ndCBo
YXZlIHRvIGJlDQo+IHNwZWNpZmllZCBpbiB0aGUgVVNCIGNvbm5lY3RvciBhZ2Fpbi4gSW4gZmFj
dCwgc3BlY2lmeWluZyBpdCB0d2ljZSBjYW4NCj4gbGVhZCB0byBhIHNpdHVhdGlvbiB3aGVyZSB0
aGUgVVNCIHBvcnQgbWF5IG5vdCBiZSBhYmxlIHRvIHN3aXRjaCB0aGUNCj4gVkJVUyBzdXBwbHkg
b24gb3Igb2ZmIGJlY2F1c2UgdGhlIHNldHRpbmcgbWlnaHQgY29uZmxpY3Qgd2l0aCB0aGF0IG9m
DQo+IHRoZSBVU0IgY29ubmVjdG9yLg0KDQo+IA0KPiBTbyB1bmxlc3MgdGhlcmUncyBhIHJlYWwg
cmVhc29uIHdoeSB0aGlzIGlzIG5lZWRlZCwgSSBkb24ndCB0aGluayB0aGlzDQo+IHNob3VsZCBi
ZSBhcHBsaWVkLg0KPiANCj4gVGhpZXJyeQ0KPiANCj4gPiBDYzogVGhpZXJyeSBSZWRpbmcgPHRy
ZWRpbmdAbnZpZGlhLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5m
ZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gdjI6IHJlbW92ZSB1bnVzZWQgdmFy
aWFibGUgIm5lZWRfdmJ1cyINCj4gPiAtLS0NCj4gPiAgZHJpdmVycy91c2IvY29tbW9uL3VzYi1j
b25uLWdwaW8uYyB8IDMwICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY29tbW9uL3VzYi1jb25uLWdwaW8uYyBiL2RyaXZlcnMv
dXNiL2NvbW1vbi91c2ItY29ubi1ncGlvLmMNCj4gPiBpbmRleCBkZmJiYzRmNTFlZDYuLjY1ZDg5
MTQwY2QxOSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9jb21tb24vdXNiLWNvbm4tZ3Bp
by5jDQo+ID4gKysrIGIvZHJpdmVycy91c2IvY29tbW9uL3VzYi1jb25uLWdwaW8uYw0KPiA+IEBA
IC05MSwxNCArOTEsMTQgQEAgc3RhdGljIHZvaWQgdXNiX2Nvbm5fZGV0ZWN0X2NhYmxlKHN0cnVj
dCB3b3JrX3N0cnVjdCAqd29yaykNCj4gPiAgCQlyZXR1cm47DQo+ID4gIAl9DQo+ID4gIA0KPiA+
IC0JaWYgKGluZm8tPmxhc3Rfcm9sZSA9PSBVU0JfUk9MRV9IT1NUICYmIGluZm8tPnZidXMpDQo+
ID4gKwlpZiAoaW5mby0+bGFzdF9yb2xlID09IFVTQl9ST0xFX0hPU1QpDQo+ID4gIAkJcmVndWxh
dG9yX2Rpc2FibGUoaW5mby0+dmJ1cyk7DQo+ID4gIA0KPiA+ICAJcmV0ID0gdXNiX3JvbGVfc3dp
dGNoX3NldF9yb2xlKGluZm8tPnJvbGVfc3csIHJvbGUpOw0KPiA+ICAJaWYgKHJldCkNCj4gPiAg
CQlkZXZfZXJyKGluZm8tPmRldiwgImZhaWxlZCB0byBzZXQgcm9sZTogJWRcbiIsIHJldCk7DQo+
ID4gIA0KPiA+IC0JaWYgKHJvbGUgPT0gVVNCX1JPTEVfSE9TVCAmJiBpbmZvLT52YnVzKSB7DQo+
ID4gKwlpZiAocm9sZSA9PSBVU0JfUk9MRV9IT1NUKSB7DQo+ID4gIAkJcmV0ID0gcmVndWxhdG9y
X2VuYWJsZShpbmZvLT52YnVzKTsNCj4gPiAgCQlpZiAocmV0KQ0KPiA+ICAJCQlkZXZfZXJyKGlu
Zm8tPmRldiwgImVuYWJsZSB2YnVzIHJlZ3VsYXRvciBmYWlsZWRcbiIpOw0KPiA+IEBAIC0xMDYs
OSArMTA2LDggQEAgc3RhdGljIHZvaWQgdXNiX2Nvbm5fZGV0ZWN0X2NhYmxlKHN0cnVjdCB3b3Jr
X3N0cnVjdCAqd29yaykNCj4gPiAgDQo+ID4gIAlpbmZvLT5sYXN0X3JvbGUgPSByb2xlOw0KPiA+
ICANCj4gPiAtCWlmIChpbmZvLT52YnVzKQ0KPiA+IC0JCWRldl9kYmcoaW5mby0+ZGV2LCAidmJ1
cyByZWd1bGF0b3IgaXMgJXNcbiIsDQo+ID4gLQkJCXJlZ3VsYXRvcl9pc19lbmFibGVkKGluZm8t
PnZidXMpID8gImVuYWJsZWQiIDogImRpc2FibGVkIik7DQo+ID4gKwlkZXZfZGJnKGluZm8tPmRl
diwgInZidXMgcmVndWxhdG9yIGlzICVzXG4iLA0KPiA+ICsJCXJlZ3VsYXRvcl9pc19lbmFibGVk
KGluZm8tPnZidXMpID8gImVuYWJsZWQiIDogImRpc2FibGVkIik7DQo+ID4gIA0KPiA+ICAJcG93
ZXJfc3VwcGx5X2NoYW5nZWQoaW5mby0+Y2hhcmdlcik7DQo+ID4gIH0NCj4gPiBAQCAtMTc1LDcg
KzE3NCw2IEBAIHN0YXRpYyBpbnQgdXNiX2Nvbm5fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4gPiAgew0KPiA+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsN
Cj4gPiAgCXN0cnVjdCB1c2JfY29ubl9pbmZvICppbmZvOw0KPiA+IC0JYm9vbCBuZWVkX3ZidXMg
PSB0cnVlOw0KPiA+ICAJaW50IHJldCA9IDA7DQo+ID4gIA0KPiA+ICAJaW5mbyA9IGRldm1fa3ph
bGxvYyhkZXYsIHNpemVvZigqaW5mbyksIEdGUF9LRVJORUwpOw0KPiA+IEBAIC0yMDUsMjMgKzIw
Myw3IEBAIHN0YXRpYyBpbnQgdXNiX2Nvbm5fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gPiAgDQo+ID4gIAlJTklUX0RFTEFZRURfV09SSygmaW5mby0+ZHdfZGV0LCB1c2Jf
Y29ubl9kZXRlY3RfY2FibGUpOw0KPiA+ICANCj4gPiAtCS8qDQo+ID4gLQkgKiBJZiB0aGUgVVNC
IGNvbm5lY3RvciBpcyBhIGNoaWxkIG9mIGEgVVNCIHBvcnQgYW5kIHRoYXQgcG9ydCBhbHJlYWR5
IHByb3ZpZGVzIHRoZSBWQlVTDQo+ID4gLQkgKiBzdXBwbHksIHRoZXJlJ3Mgbm8gbmVlZCBmb3Ig
dGhlIFVTQiBjb25uZWN0b3IgdG8gcHJvdmlkZSBpdCBhZ2Fpbi4NCj4gPiAtCSAqLw0KPiA+IC0J
aWYgKGRldi0+cGFyZW50ICYmIGRldi0+cGFyZW50LT5vZl9ub2RlKSB7DQo+ID4gLQkJaWYgKG9m
X2ZpbmRfcHJvcGVydHkoZGV2LT5wYXJlbnQtPm9mX25vZGUsICJ2YnVzLXN1cHBseSIsIE5VTEwp
KQ0KPiA+IC0JCQluZWVkX3ZidXMgPSBmYWxzZTsNCj4gPiAtCX0NCj4gPiAtDQo+ID4gLQlpZiAo
IW5lZWRfdmJ1cykgew0KPiA+IC0JCWluZm8tPnZidXMgPSBkZXZtX3JlZ3VsYXRvcl9nZXRfb3B0
aW9uYWwoZGV2LCAidmJ1cyIpOw0KPiA+IC0JCWlmIChQVFJfRVJSKGluZm8tPnZidXMpID09IC1F
Tk9ERVYpDQo+ID4gLQkJCWluZm8tPnZidXMgPSBOVUxMOw0KPiA+IC0JfSBlbHNlIHsNCj4gPiAt
CQlpbmZvLT52YnVzID0gZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgInZidXMiKTsNCj4gPiAtCX0N
Cj4gPiAtDQo+ID4gKwlpbmZvLT52YnVzID0gZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgInZidXMi
KTsNCj4gPiAgCWlmIChJU19FUlIoaW5mby0+dmJ1cykpIHsNCj4gPiAgCQlyZXQgPSBQVFJfRVJS
KGluZm8tPnZidXMpOw0KPiA+ICAJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFp
bGVkIHRvIGdldCB2YnVzIDolZFxuIiwgcmV0KTsNCj4gPiBAQCAtMjg4LDcgKzI3MCw3IEBAIHN0
YXRpYyBpbnQgdXNiX2Nvbm5fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ID4gIA0KPiA+ICAJY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZpbmZvLT5kd19kZXQpOw0KPiA+
ICANCj4gPiAtCWlmIChpbmZvLT5sYXN0X3JvbGUgPT0gVVNCX1JPTEVfSE9TVCAmJiBpbmZvLT52
YnVzKQ0KPiA+ICsJaWYgKGluZm8tPmxhc3Rfcm9sZSA9PSBVU0JfUk9MRV9IT1NUKQ0KPiA+ICAJ
CXJlZ3VsYXRvcl9kaXNhYmxlKGluZm8tPnZidXMpOw0KPiA+ICANCj4gPiAgCXVzYl9yb2xlX3N3
aXRjaF9wdXQoaW5mby0+cm9sZV9zdyk7DQo+ID4gLS0gDQo+ID4gMi4xOC4wDQo+ID4gDQoNCg==

