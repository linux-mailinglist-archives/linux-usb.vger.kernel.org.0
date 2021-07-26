Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB4D3D5734
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jul 2021 12:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232900AbhGZJdb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jul 2021 05:33:31 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:48874 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232482AbhGZJdb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jul 2021 05:33:31 -0400
IronPort-SDR: YQ123afdCios7H6zU+tIf0sFPJPVEeeDuz3APXl+RvZKr9UU9l/wN+LbfsCh18+cG6f10rH8pi
 Z6VNoq3IxsZFpVYsWuSn9URf/mKqrXqCkfEbFSgjlZ0wJZogKz8gOkIyr5LyzKtu1s5sI3i3Ig
 hNrz4pErS+cr3qhRrK6Memr6R9672SzK6psaldJEyF7zbLb5+aiBMJ/7Ger7/yF2KkdIhd1HWQ
 DffGnaQTOe1ofRZX31Tze/OZscyRv93EtoQ0+JA5jhTt00vtMvw1JWlL1JN6z+K5gNgJ4shgH4
 zgpKykOhli3hN/UC20cWzvs2
X-IronPort-AV: E=Sophos;i="5.84,270,1620720000"; 
   d="scan'208";a="64087810"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 26 Jul 2021 02:13:59 -0800
IronPort-SDR: +aXHO7HmMHXqRqhEZOXzsRrrhFaNZ/45gaQExLSLd1CN9UpGDr/t31MkYtNf6EF8Wfsg25cHP2
 0AndlhHY+4mGDbonfApxoLZ2/rb2aIIDZD+zNE+OVGx+4Rq9fTuHxaU1mNX1aN0mBjZCf3CPoG
 oLYpT6H/eJrI77TQ1Lc1jSpKh8IDmQ1+cEZCrw/SlH8GbzZa9nX1AvvrB9eqiG84AqMJ4xXTe8
 KeEaju9F9mZL/fNulqh+ygg+jfPBSWB6ysmGaNDw9ux+RC8cbq+6U/gIwhdEMMA84YF8PQb1aM
 ZoM=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     "Greg KH (gregkh@linuxfoundation.org)" <gregkh@linuxfoundation.org>,
        "Merz, Thomas" <Thomas_Merz@mentor.com>
CC:     USB list <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        "Hardinge, Charles" <Charles_Hardinge@mentor.com>
Subject: RE: [PATCH for 4.14] xhci: add xhci_get_virt_ep() helper
Thread-Topic: [PATCH for 4.14] xhci: add xhci_get_virt_ep() helper
Thread-Index: AdeB/MZwIKb/vqPQSfySS+0zMoOZhgAAImUAAAI2DBA=
Date:   Mon, 26 Jul 2021 10:13:35 +0000
Message-ID: <9eb2f4a413eb40609f91daf52436cc7b@SVR-IES-MBX-03.mgc.mentorg.com>
References: <3c42fbd4599a4a3e8b065418592973d9@SVR-IES-MBX-03.mgc.mentorg.com>
 <YP6IzGT6gZNgudI6@kroah.com>
In-Reply-To: <YP6IzGT6gZNgudI6@kroah.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3JlZywNCg0KPiBBbHNvLCB0aGUgcGF0Y2ggaXMgY29ycnVwdGVkIGFuZCBjYW4gbm90IGJl
IGFwcGxpZWQsIGV2ZW4gaWYgSSB3YW50ZWQgdG8gOigNCj4gU28gY2FuIHlvdSBmaXggdGhhdCB1
cCB3aGVuIHlvdSByZXNlbmQgYWxsIG9mIHRoZSBvdGhlciB2ZXJzaW9ucyB0b28/DQoNCkkndmUg
c2VlbiB0aGF0IGFuZCBhbHJlYWR5IHNlbnQgYSBtYWlsIHRvIElUIHJlZ2FyZGluZyB0aGlzLg0K
V2UgaGFkIHRvICJ1cGdyYWRlIiB0byBPMzY1IE91dGxvb2ssIGFuZCBJIHNlbGVjdGVkICJwbGFp
biB0ZXh0IiB0byBzZW5kIGJ1dCAuLi4uDQpTdGlsbCBmaWdodGluZyB3aXRoIHRoYXQuDQoNCk1h
eSBJIGF0dGFjaCB0aGUgcGF0Y2hlcyBhcyBhIGZpbGUsIGdlbmVyYXRlZCB3aXRoICJnaXQgZm9y
bWF0LXBhdGNoIiBtZWFud2hpbGU/DQpJIGZlYXIgdGhhdCBJJ20gbm90IGFsbG93ZWQgdG8gdXNl
ICJnaXQgc2VuZC1tYWlsIi4NCg0KVGhhbmtzLA0KQ2Fyc3Rlbg0KLS0tLS0tLS0tLS0tLS0tLS0N
ClNpZW1lbnMgRWxlY3Ryb25pYyBEZXNpZ24gQXV0b21hdGlvbiBHbWJIOyBBbnNjaHJpZnQ6IEFy
bnVsZnN0cmHDn2UgMjAxLCA4MDYzNCBNw7xuY2hlbjsgR2VzZWxsc2NoYWZ0IG1pdCBiZXNjaHLD
pG5rdGVyIEhhZnR1bmc7IEdlc2Now6RmdHNmw7xocmVyOiBUaG9tYXMgSGV1cnVuZywgRnJhbmsg
VGjDvHJhdWY7IFNpdHogZGVyIEdlc2VsbHNjaGFmdDogTcO8bmNoZW47IFJlZ2lzdGVyZ2VyaWNo
dCBNw7xuY2hlbiwgSFJCIDEwNjk1NQ0K
