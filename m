Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 092229987C
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 17:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388199AbfHVPsQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 11:48:16 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:6917 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387880AbfHVPsQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Aug 2019 11:48:16 -0400
IronPort-SDR: 3nGuY19KTPzb1wdzLaWaO7CO3mkQzLifjV8LQta1/PjsUk3XKVPmfQZqW2Jh03rUJeMmFkoVas
 7A1PQfPtY83lS4SC4zKM/h+qifOsvwM/jefpgHSqOn+ZvsumX7R0y6mshUlJjtLWp9CscjvRlc
 G4THmlhqhhHqa7f2dzOrPHUEdaXepT1vaw7Q25CNU8xUs/TNFGDVckV3NPjGF6EHmY7GMF6v0a
 SQp6YpGanGwN1oXHf1P/eTfuOrqxnfchdM3g2IJ1mci4/I+xFiBYmhSid/+4DTqBFMwcsuA/yd
 0kU=
X-IronPort-AV: E=Sophos;i="5.64,417,1559548800"; 
   d="scan'208";a="42485102"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 22 Aug 2019 07:48:15 -0800
IronPort-SDR: qVg2M3nhWcTI1chGmhyIPwJGxTh9vPrIhkvO5oyuvAG6tRRvJhSrMP8sHVQjj4QyztmD8xQVAX
 O9kdSAo0ycaBNhYk9evFjpyQE55Fyvp71Fa0AQUzl/OljLPFwUcC6MgZLAueezzjENdbmEbc3y
 kTXVcRwfYJJh4fe/6/f3cTwDTanMm7Y/gYFGpMZJGHt7lTAMfsszaIt48RCYMoRb5OfkooLbhi
 SZtlm9R42Qbfz7j4kbgNjR/9WO61h3FbCtDC2MSh99QAmzqYUrmJkLH1bx4UgLYaa86GJJeP/C
 3vY=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: [Resend] [PATCH v3] usb: xhci-pci: reorder removal to avoid
 use-after-free
Thread-Topic: [Resend] [PATCH v3] usb: xhci-pci: reorder removal to avoid
 use-after-free
Thread-Index: AQHVVBFK/kSUZLgzxkCv/bugLpBg2KcHQjcAgAAAbQCAABX48A==
Date:   Thu, 22 Aug 2019 15:48:11 +0000
Message-ID: <0012c7c76be947f68e30eb687599bed3@SVR-IES-MBX-03.mgc.mentorg.com>
References: <1565946200239.8897@mentor.com>
 <fbbf1ed3-c0c0-9b34-aeec-32a6f3645d7b@linux.intel.com>
 <6d245699-b7d6-2b40-62df-366c88cba7dc@redhat.com>
In-Reply-To: <6d245699-b7d6-2b40-62df-366c88cba7dc@redhat.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiBPbiAyMi0wOC0xOSAxNzoyMywgTWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gPiBPbiAxNi44LjIw
MTkgMTIuMDMsIFNjaG1pZCwgQ2Fyc3RlbiB3cm90ZToNCj4gPj4gT24gZHJpdmVyIHJlbW92YWws
IHRoZSBwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3RlciBjYWxsDQo+ID4+IGF0dGFjaGVkIHRocm91
Z2ggZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0IHdhcyBleGVjdXRlZA0KPiA+PiBhZnRlciB1c2Jf
aGNkX3BjaV9yZW1vdmUuDQo+ID4+IFRoaXMgbGVhZCB0byBhIHVzZS1hZnRlci1mcmVlIGZvciB0
aGUgaW9tZW0gcmVzb3VyY2Ugb2YNCj4gPj4gdGhlIHhoY2ktZXh0LWNhcHMgZHJpdmVyIGluIHRo
ZSBwbGF0Zm9ybSByZW1vdmFsDQo+ID4+IGJlY2F1c2UgdGhlIHBhcmVudCBvZiB0aGUgcmVzb3Vy
Y2Ugd2FzIGZyZWVkIGVhcmxpZXIuDQo+ID4+DQo+ID4+IEZpeCB0aGlzIGJ5IHJlb3JkZXJpbmcg
b2YgdGhlIHJlbW92YWwgc2VxdWVuY2UuDQo+ID4+DQo+ID4NCj4gPiBDb3VsZCBhbGwgdGhpcyBi
ZSBhdm9pZGVkIGlmIHVzYl9oY2RfcGNpX3Byb2JlKCkNCj4gPiB1c2VkIG1hbmFnZWQgZGV2aWNl
IHJlc291cmNlcyBhcyB3ZWxsPw0KPiA+ICh1c2luZyBkZXZtX3JlcXVlc3RfbWVtX3JlZ2lvbigp
LCBhbmQgZGV2bV9pb3JlbWFwX25vY2FjaGUoKSkNCj4gPg0KPiA+IFRoaXMgd2F5IHRoZSBpb21l
bSByZXNvdXJjZSB3b3VsZCBiZSBhZGRlZCB0byB0aGUgc2FtZSBkZXZyZXMgbGlzdA0KPiA+IGFz
IHRoZSBwbGF0Zm9ybV91bnJlZ2lzdGVyX2NhbGwsIGFuZCB0aGUgaW9tZW0gcmVzb3VyY2Ugc2hv
dWxkIGJlDQo+ID4gcmVsZWFzZWQgYWZ0ZXIgdGhlIHBsYXRmb3JtX2RldmljZV91bnJlZ2lzdGVy
IGFzIGRldnJlc19yZWxlYXNlX2FsbCgpDQo+ID4gcmVsZWFzZXMgdGhlIHJlc291cmNlcyBpbiBy
ZXZlcnNlIG9yZGVyLg0KPiANCj4gWWVzIEkgYmVsaWV2ZSB0aGF0IHRoYXQgd291bGQgd29yay4N
Cj4gDQpJIGRvbid0IHRoaW5rIHNvLCBiZWNhdXNlIHhoY2lfY3JlYXRlX2ludGVsX3hoY2lfc3df
cGRldiByZWdpc3RlcnMgaXQncyANCnJlc291cmNlIHRocm91Z2ggcGxhdGZvcm1fZGV2aWNlX2Fk
ZF9yZXNvdXJjZXMgd2hpY2ggZG9lcyBub3QgdXNlIGRldm1fLg0KDQpUaGUgb25seSB0aGluZyB3
aGF0IGlzIGRvbmUgdGhyb3VnaCBkZXZtIGluIHhoY2lfY3JlYXRlX2ludGVsX3hoY2lfc3dfcGRl
diBpcw0KcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KC4uLikNCg0KQ2Fyc3Rlbg0K
