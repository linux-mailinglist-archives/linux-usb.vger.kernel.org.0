Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A946B36A6C1
	for <lists+linux-usb@lfdr.de>; Sun, 25 Apr 2021 12:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhDYKmf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Apr 2021 06:42:35 -0400
Received: from mx.exactcode.de ([144.76.154.42]:43012 "EHLO mx.exactcode.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229707AbhDYKmf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Apr 2021 06:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; s=x;
        h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:Message-Id:Date; bh=ccIJxWMmgTcFnK0pzwZla89q+26nIBEcKC+H20b9nEg=;
        b=EpuF7DMoUqm0/B8SOmcdeaykF7YMdjXRkieufJnmawDYWXbkJdpxbhjobZo62qZMnRcFcl9sRQ0j174APZza2p8SAABpB9F9FAmvVXRfLp1FLjPOHcui2ifZ2nssfmastv6EOrtfYtJX906TyIjh8fsRv29SipOCgNx9kzXYpN0=;
Received: from exactco.de ([90.187.5.221])
        by mx.exactcode.de with esmtp (Exim 4.82)
        (envelope-from <rene@exactcode.com>)
        id 1lacDB-0002oN-FU; Sun, 25 Apr 2021 10:42:01 +0000
Received: from [192.168.2.131] (helo=localhost)
        by exactco.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.86_2)
        (envelope-from <rene@exactcode.com>)
        id 1lac9V-0006C6-5Y; Sun, 25 Apr 2021 10:38:13 +0000
Date:   Sun, 25 Apr 2021 12:41:19 +0200 (CEST)
Message-Id: <20210425.124119.1949311822603950729.rene@exactcode.com>
To:     gregkh@linuxfoundation.org
Cc:     stern@rowland.harvard.edu, hdegoede@redhat.com,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
From:   Rene Rebe <rene@exactcode.com>
In-Reply-To: <YIUbHKqs2gQPAu2T@kroah.com>
References: <20210425023133.GC324386@rowland.harvard.edu>
        <883AF188-7817-42E2-84E8-F1DD7A5F3C08@exactcode.com>
        <YIUbHKqs2gQPAu2T@kroah.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Spam-Score: -3.1 (---)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R3JlZyBLSCB3cm90ZToNCg0KPiBPbiBTdW4sIEFwciAyNSwgMjAyMSBhdCAwOToyMDo1OUFNICsw
MjAwLCBSZW7DqSBSZWJlIHdyb3RlOg0KPiA+IEhleSwNCj4gPiANCj4gPiA+IE9uIDI1LiBBcHIg
MjAyMSwgYXQgMDQ6MzEsIEFsYW4gU3Rlcm4gPHN0ZXJuQHJvd2xhbmQuaGFydmFyZC5lZHU+IHdy
b3RlOg0KPiA+ID4+IFNlYWdhdGUgZGV2aWNlcyIgaW4gMjAxNy4gQXBwYXJlbnRseSBzb21lIGVh
cmx5IG9uZXMgd2hlcmUgYnVnZ3ksIC4uLg0KPiA+ID4+IA0KPiA+ID4+IEhvd2V2ZXIsIGZhc3Qg
Zm9yd2FyZCBhIGNvdXBsZSBvZiB5ZWFycyBhbmQgdGhpcyBpcyBubyBsb25nZXIgdHJ1ZSwNCj4g
PiA+PiB0aGlzIFNlZ2F0ZSBTZXZlbiBldmVuIGlzIGFscmVhZHkgZnJvbSAyMDE2LCBhbmQgYXBw
YXJlbnRseSBmaXJzdA0KPiA+ID4+IGF2YWlsYWJsZSBpbiAyMDE1LiBJIHN1Z2dlc3QgcmVtb3Zp
bmcgdGhpcyByYXRoZXIgZHJhc3RpYyBnbG9iYWwNCj4gPiA+PiBtZWFzdXJlLCBhbmQgaW5zdGVh
ZCBvbmx5IGFkZCB2ZXJ5IG9sZCBicm9rZW4gb25lcyB3aXRoIGluZGl2aWR1YWwNCj4gPiA+PiBx
dWlya3MsIHNob3VsZCBhbnkgb2YgdGhlbSBzdGlsbCBiZSBhbGl2ZSA7LSkNCj4gPiA+PiANCj4g
PiA+PiBTaWduZWQtb2ZmLWJ5OiBSZW7DqSBSZWJlIDxyZW5lQGV4YWN0Y29kZS5jb20+DQo+ID4g
Pj4gDQo+ID4gPj4gLS0tIGxpbnV4LTUuMTEvZHJpdmVycy91c2Ivc3RvcmFnZS91YXMtZGV0ZWN0
LmguYmFja3VwCTIwMjEtMDMtMDUgMTE6MzY6MDAuNTE3NDIzNzI2ICswMTAwDQo+ID4gPj4gKysr
IGxpbnV4LTUuMTEvZHJpdmVycy91c2Ivc3RvcmFnZS91YXMtZGV0ZWN0LmgJMjAyMS0wMy0wNSAx
MTozNjoxNi4zNzM0MjQ1NDQgKzAxMDANCj4gPiA+PiBAQCAtMTEzLDggKzExMyw0IEBADQo+ID4g
Pj4gCX0NCj4gPiA+PiANCj4gPiA+PiAtCS8qIEFsbCBTZWFnYXRlIGRpc2sgZW5jbG9zdXJlcyBo
YXZlIGJyb2tlbiBBVEEgcGFzcy10aHJvdWdoIHN1cHBvcnQgKi8NCj4gPiA+PiAtCWlmIChsZTE2
X3RvX2NwdSh1ZGV2LT5kZXNjcmlwdG9yLmlkVmVuZG9yKSA9PSAweDBiYzIpDQo+ID4gPj4gLQkJ
ZmxhZ3MgfD0gVVNfRkxfTk9fQVRBXzFYOw0KPiA+ID4+IC0NCj4gPiA+PiAJdXNiX3N0b3JfYWRq
dXN0X3F1aXJrcyh1ZGV2LCAmZmxhZ3MpOw0KPiA+ID4gDQo+ID4gPiBJIGRvbid0IHdhbnQgdG8g
ZG8gdGhpcyB1bmxlc3MgeW91IGNhbiBzdWdnZXN0IGFuIGFwcHJvYWNoIHRoYXQgd29uJ3QgDQo+
ID4gPiBzdWRkZW5seSBicmVhayBhbGwgdGhvc2Ugb2xkIGJ1Z2d5IGRyaXZlcy4gIEp1c3QgYmVj
YXVzZSB0aGV5IGFyZSBub3cgDQo+ID4gPiBmaXZlIHllYXJzIG9sZCBvciBtb3JlIGRvZXNuJ3Qg
bWVhbiB0aGV5IGFyZSBubyBsb25nZXIgaW4gdXNlLg0KPiA+IA0KPiA+IFdlbGwsIHdoYXQgZG8g
eW91IHByb3Bvc2UgdGhlbj8gQSBhbGxvdyBxdWlyayBmb3IgYWxsIG5ldyBkZXZpY2VzIGdvaW5n
IGZvcndhcmQ/DQo+ID4gR2l2ZW4gdGhhdCB0aGUgdXNlciB1c3VhbGx5IG5lZWRzIHRvIGFjdGl2
ZWx5IHJ1biBzb21ldGhpbmcgbGlrZSBzbWFydGN0bA0KPiA+IG1hbnVhbGx5IG9uIHRoZSBkcml2
ZSBJIGRvbuKAmXQgc2VlIHRoYXQgdGhpcyBzaG91bGQgY2F1c2UgdG9vIG1hbnkgaXNzdWVzLg0K
PiA+IEkgZG9u4oCZdCBoYXZlIGFueSBub24tc3VwcG9ydGluZyBkZXZpY2UgLSBjYW4gd2Ugbm90
IGp1c3QgYWRkIHRoZW0gdG8gdGhlDQo+ID4gcXVpcmsgbGlzdCB3aGVuIHNvbWVvbmUgcmVwb3J0
cyBvbmU/DQo+IA0KPiBIb3cgYWJvdXQgc2luY2UgeW91IGtub3cgeW91ciBkZXZpY2Ugd29ya3Ms
IHlvdSBtYWtlIHRoZSBjaGVjayBkZXRlY3QNCj4geW91ciBzcGVjaWZpYyBkZXZpY2UgYW5kIG5v
dCBhcHBseSB0aGUgZmxhZyB0byBpdD8gIFlvdSBzaG91bGQgYmUgYWJsZQ0KPiB0byBkbyBzbyBi
YXNlZCBvbiB0aGUNCg0KU3VyZSwgd2hpbGUgdGhhdCBkb2VzIG5vdCByZWFsbHkgc29sdmUgdGhp
cyBmb3IgYWxsIHRoZSBvdGhlciBuZXdlcg0KU2VhZ2F0ZSBkcml2ZXMgb3RoZXIgdXNlcnMgbWln
aHQgaGF2ZSBhdCBob21lLCBoZXJlIGlzIGEgcGF0Y2gNCmNoZWNraW5nIGZvciB0aGlzIG9uZSBV
U0IgcHJvZHVjdCBJRC4gSSBob3BlIHRoYXQgaXMgd2hhdCB5b3UgbWVhbnQ6DQoNClNpZ25lZC1v
ZmYtYnk6IFJlbsOpIFJlYmUgPHJlbmVAZXhhY3Rjb2RlLmNvbT4NCg0KLS0tIGxpbnV4LTUuMTEv
ZHJpdmVycy91c2Ivc3RvcmFnZS91YXMtZGV0ZWN0LmguYmFja3VwCTIwMjEtMDMtMDUgMTE6MzY6
MDAuNTE3NDIzNzI2ICswMTAwDQorKysgbGludXgtNS4xMS9kcml2ZXJzL3VzYi9zdG9yYWdlL3Vh
cy1kZXRlY3QuaAkyMDIxLTAzLTA1IDExOjM2OjE2LjM3MzQyNDU0NCArMDEwMA0KQEAgLTExMyw1
ICsxMTMsNiBAQA0KIA0KIAkvKiBBbGwgU2VhZ2F0ZSBkaXNrIGVuY2xvc3VyZXMgaGF2ZSBicm9r
ZW4gQVRBIHBhc3MtdGhyb3VnaCBzdXBwb3J0ICovDQotCWlmIChsZTE2X3RvX2NwdSh1ZGV2LT5k
ZXNjcmlwdG9yLmlkVmVuZG9yKSA9PSAweDBiYzIpDQorCWlmICgobGUxNl90b19jcHUodWRldi0+
ZGVzY3JpcHRvci5pZFZlbmRvcikgPT0gMHgwYmMyKSAmJg0KKwkgICAgKGxlMTZfdG9fY3B1KHVk
ZXYtPmRlc2NyaXB0b3IuaWRQcm9kdWN0KSAhPSAweGFiMDMpKQ0KIAkJZmxhZ3MgfD0gVVNfRkxf
Tk9fQVRBXzFYOw0KIA0KDQotLSANCiAgUmVuw6kgUmViZSwgRXhhY3RDT0RFIEdtYkgsIExpZXR6
ZW5idXJnZXIgU3RyLiA0MiwgREUtMTA3ODkgQmVybGluDQogIGh0dHBzOi8vZXhhY3Rjb2RlLmNv
bSB8IGh0dHBzOi8vdDJzZGUub3JnIHwgaHR0cHM6Ly9yZW5lLnJlYmUuZGUNCg==
