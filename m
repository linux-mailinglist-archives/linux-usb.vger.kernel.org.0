Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B65B49B11F
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 15:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405675AbfHWNmO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Aug 2019 09:42:14 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:32956 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731976AbfHWNmO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Aug 2019 09:42:14 -0400
IronPort-SDR: zOdZk4WqVukqIzXu8LuHdz58FzHnKpYHj6lbaEuMtnfqhjrgrIvKZKZsdGpuXuOAENDThgmnPG
 SPjjedxQ31dddAZpEwXFHV99bdIb3EG/6PBDXo2ZAbeoOBfD4nOvbxQy+WMOW5ftoQNR3ZJgMW
 8uTEqPY+mWWwpk2zkmLeUI6cXwXJrUekr4QdFQEPGlN1rZACaI7SnjGujTprmmP/X5P8uZ3mPv
 IDjqETVSVHPuV7Xl8PQd5NQu3dFdF5Mxks4uOchjaEYFtL0FkJ0L2Tt1WlvYNTBOowUuHH4IgU
 HTc=
X-IronPort-AV: E=Sophos;i="5.64,421,1559548800"; 
   d="scan'208";a="40710438"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 23 Aug 2019 05:42:13 -0800
IronPort-SDR: 6/H1Aozvxx6zDRnSaRriBvjKo44eDmVKWQUil1SSxsfDmYPx/sop9ML3Ak0DOoDvfV+s8jqi+i
 1bIp0jeoB0pd7ayxSbKTIypjnCfmkH1xwB954CoCJ7vMB5bamA8hyobmCKekkWMWLj7MWYYfAw
 DF/KuSWwdpe0wkl3RF5iy7dc+whuhxLkry3UtcOgP7G/cce1l+3GNL1IDEjLN5K+F3pO81PZcA
 InZk1+qO2NKM0cnbInsj8ttWECE5EravsuUTFHPmolR9s6rL+hRH3PgwZ8rXNhrMIzPgxlRnhd
 RVU=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: [Patch v4] usb: hcd: fix use-after-free on driver removal
Thread-Topic: [Patch v4] usb: hcd: fix use-after-free on driver removal
Thread-Index: AQHVWZfhcriOMYVBfUWq2zWHQehVwqcIq4qAgAARMqA=
Date:   Fri, 23 Aug 2019 13:42:08 +0000
Message-ID: <84967dfa7d394a2f8be58e56cbb02b4f@SVR-IES-MBX-03.mgc.mentorg.com>
References: <1566554761464.60146@mentor.com>
 <fc7c20a1-2938-a4d7-cddb-783d65091809@linux.intel.com>
In-Reply-To: <fc7c20a1-2938-a4d7-cddb-783d65091809@linux.intel.com>
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

PiA+IE9uIGRyaXZlciByZW1vdmFsLCB0aGUgcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIgY2Fs
bA0KPiA+IGF0dGFjaGVkIHRocm91Z2ggZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0IHdhcyBleGVj
dXRlZA0KPiA+IGFmdGVyIHVzYl9oY2RfcGNpX3JlbW92ZS4NCj4gPiBUaGlzIGxlYWQgdG8gYSB1
c2UtYWZ0ZXItZnJlZSBmb3IgdGhlIGlvbWVtIHJlc291cmNlIG9mDQo+ID4gdGhlIHhoY2ktZXh0
LWNhcHMgZHJpdmVyIGluIHRoZSBwbGF0Zm9ybSByZW1vdmFsDQo+ID4gYmVjYXVzZSB0aGUgcGFy
ZW50IG9mIHRoZSByZXNvdXJjZSB3YXMgZnJlZWQgZWFybGllci4NCj4gPg0KPiA+IEZpeCB0aGlz
IGJ5IHVzaW5nIGRldm0gZm9yIGhjZC1wY2kgY3JlYXRlZCByZXNvdXJjZXMuDQo+ID4gVGhpcyBz
aW1wbGlmaWVzIGVycm9yIGhhbmRsaW5nIG9uIGRyaXZlciBpbml0aWFsaXNhdGlvbg0KPiA+IGFu
ZCBmaXhlcyB0aGUgcmVtb3ZhbCBzZXF1ZW5jZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENh
cnN0ZW4gU2NobWlkIDxjYXJzdGVuX3NjaG1pZEBtZW50b3IuY29tPg0KPiA+IFRlc3RlZC1ieTog
Q2Fyc3RlbiBTY2htaWQgPGNhcnN0ZW5fc2NobWlkQG1lbnRvci5jb20+DQo+ID4gLS0tDQo+IA0K
PiBUaGFua3MsIGNvZGUgbG9va3MgZ29vZCB0byBtZS4NCj4gDQo+IEJ1dCBhcyB0aGlzIGlzIG5v
IGxvbmdlciBhIHhoY2kgc3BlY2lmaWMgZml4IEknbSBub3Qgc3VyZSBpZiB0aGlzDQo+IGNvbW1p
dCBtZXNzYWdlIGlzIGdlbmVyaWMgZW5vdWdoLg0KPiANCj4gQ291bGQgYmUgd29ydGggZXhwbGFp
bmluZyB0aGF0IHVzaW5nIG1hbmFnZWQgZGV2aWNlIHJlc291cmNlcw0KPiBpbiB1c2JfaGNkX3Bj
aV9wcm9iZSgpIGFsbG93cyBkZXZtIHVzYWdlIGZvciByZXNvdXJjZSBzdWJyYW5nZXMsIHN1Y2gN
Cj4gYXMgdGhlIG1taW8gcmVzb3VyY2UgZm9yIHRoZSBwbGF0Zm9ybSBkZXZpY2UgY3JlYXRlZCB0
byBjb250cm9sIGhvc3QvZGV2aWNlDQo+IG1vZGUgbXV4LCB3aGljaCBpcyBhIHhoY2kgZXh0ZW5k
ZWQgY2FwYWJpbGl0eSwgYW5kIHNpdHMgaW5zaWRlIHRoZSB4aGNpIG1taW8NCj4gcmVnaW9uLg0K
PiANCj4gSWYgbWFuYWdlZCBkZXZpY2UgcmVzb3VyY2VzIGFyZSBub3QgdXNlZCB0aGVuICJwYXJl
bnQiIHJlc291cmNlDQo+IGlzIHJlbGVhc2VkIGJlZm9yZSBzdWJyYW5nZSBhdCBkcml2ZXIgcmVt
b3ZhbCBhcyAucmVtb3ZlIGNhbGxiYWNrIGlzDQo+IGNhbGxlZCBiZWZvcmUgdGhlIGRldnJlcyBs
aXN0IG9mIHJlc291cmNlcyBmb3IgdGhpcyBkZXZpY2UgaXMgd2Fsa2VkDQo+IGFuZCByZWxlYXNl
ZA0KPiANCj4gLU1hdGhpYXMNCj4gDQpJIGFncmVlLCB0aGlzIGNvdmVycyBtb3JlIHRoYW4gdGhl
IGZpeCBpIG9yaWdpbmFsbHkgaGF2ZSBpbiBtaW5kLg0KDQpNYXkgaSB1c2UvY2l0ZSB5b3VyICJj
b3VsZCBiZSB3b3J0aCBleHBsYWluaW5nIiBhYm92ZSBmb3IgdGhlIGNvbW1pdCBtZXNzYWdlPw0K
KG9mIGNvdXJzZSwgYSBiaXQgYWRhcHRlZCA6LSkgKQ0KDQpBbmQ6IGkgd291bGQgbGlrZSByZXBs
YWNlIHRoZSBjb21taXQgdGl0bGUgYWdhaW4gdG8gcmVhZDoNCnVzYjogaGNkOiB1c2UgbWFuYWdl
ZCBkZXZpY2UgcmVzb3VyY2VzDQoNCk9rIGZvciB5b3U/DQoNCkJSDQpDYXJzdGVuDQo=
