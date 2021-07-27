Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9942C3D7086
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 09:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235824AbhG0Hnd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 03:43:33 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:53120 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235775AbhG0Hnc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 03:43:32 -0400
IronPort-SDR: 7u2MkRs+62JvUU+dcuBMg+47gTGHLikTV+lB0Nvzpc32RavBwjVuwhpwwnwa00YCZr0PqilBFg
 dJEnTbbrpj0CEnT7qm4zS2tEZ/p3yez9at0ORg9UPmYBx9ngpglyVDWvnc/hMumeRx/5PbQMky
 jaf9wX3ve+g/KBSNKMRPWi4K5c70V+xwGGKYd4+g8CkN8GnVd7COCOjMMAi6LAZpUCl4IN9crR
 pgCr4hLgmaEBXE4Yhl06IyF/qXMMMdP9xoIE1LwXsVvu+27HST75WqVwYvjzYSJRdOMnc3SRXU
 T+Pbvh4UJx5zA3lxvN6CStX8
X-IronPort-AV: E=Sophos;i="5.84,272,1620720000"; 
   d="scan'208";a="66413496"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 26 Jul 2021 23:43:33 -0800
IronPort-SDR: W60w4VA311Lk97+W4yjI78vIR9eIkhJKeYirtDH/3MMqSA/tHgDBxqbaFl+Np8TvV2ZQmof41w
 uTTs5zkXs/AizIXXieQqvTcwN2EI9dnVsstwZtsCFGDWlL5kGNfJ+th+nM9rxR0NAWvSNlFCxg
 J/qHT4RZfNMOqhgrIuriGNwU8avwsmzXRH8Ccg6OEWFSNc4/2O3jydjV8K2Hp7nrnfVY276sP6
 uVTxQXWA/PK8l1Gsga1FjiXtTg8TULmvKeA41WD6z4t3FHQyuPTMNrFBs+XrgWunLKAKwiT9LM
 M8o=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        "Razgriz375 (Neil)" <razgriz.wilson6@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Fwd: Linux Kernel 5.12.10 Walkman USB DAC support issues
Thread-Topic: Fwd: Linux Kernel 5.12.10 Walkman USB DAC support issues
Thread-Index: AQHXgnc1OBuFQo+G60aTmW/ZGwqjqqtWSBcAgAAnYmA=
Date:   Tue, 27 Jul 2021 07:43:07 +0000
Message-ID: <a59c1173b77b4ace8db7181b1b0fc446@SVR-IES-MBX-03.mgc.mentorg.com>
References: <QUKVWQ.1T8HV94AM5X6@gmail.com>
 <CAJpVOidqd+tpNNkHGvC6fUQ7g3Z+FLpiDJrmPWtQmiL-AsYsLw@mail.gmail.com>
 <YP+kqqimY1BYZAwL@kroah.com>
In-Reply-To: <YP+kqqimY1BYZAwL@kroah.com>
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

SGkgR3JlZywNCg0KT24gVHVlLCBKdWwgMjcsIDIwMjEgYXQgMTI6Mzc6MjhBTSArMDEwMCwgUmF6
Z3JpejM3NSAoTmVpbCkgd3JvdGU6DQoNCj4+IFsgIDEwOS42Njg0NjVdIHVzYiAxLTE6IFVTQiBk
aXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDINCj4+IFsgIDExMC4wODQ0MjldIHVzYiAxLTE6IG5l
dyBoaWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDUgdXNpbmcgeGhjaV9oY2QNCj4+IFsgIDEx
MC4yMzc5NjNdIHVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0wNTRjLCBp
ZFByb2R1Y3Q9MGI4YywgYmNkRGV2aWNlPSAxLjAwDQo+PiBbICAxMTAuMjM3OTg5XSB1c2IgMS0x
OiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MiwgUHJvZHVjdD0zLCBTZXJpYWxOdW1iZXI9
NA0KPj4gWyAgMTEwLjIzODAwMl0gdXNiIDEtMTogUHJvZHVjdDogV0FMS01BTg0KPj4gWyAgMTEw
LjIzODAxMV0gdXNiIDEtMTogTWFudWZhY3R1cmVyOiBTb255DQo+PiBbICAxMTAuMjM4MDE5XSB1
c2IgMS0xOiBTZXJpYWxOdW1iZXI6IDEwNDU4QjU1NDc3OTE2DQo+PiBbICAxMTAuMzQyMTA0XSB1
c2IgMS0xOiAxOjcgOiB1bnN1cHBvcnRlZCBmb3JtYXQgYml0cyAweDEwMDAwMDAwMA0KPj4gWyAg
MTEwLjM0Mzk1M10gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBzbmQt
dXNiLWF1ZGlvDQo+Pg0KPg0KPg0KPiBMb29rcyBsaWtlIHlvdSByZW1vdmVkIHRoZSBkZXZpY2Ug
YW5kIHRoZW4gYWRkZWQgaXQgYmFjaz8gIEFuZCBpdCBzYXlzDQo+IHRoZSBkZXZpY2UgaXMgc3Vw
cG9ydGVkIGJ5IHRoZSBrZXJuZWwgbm93LCB3aGF0IGRvZXMgbm90IHdvcmsgcHJvcGVybHk/DQoN
CkJ1dCBlYXJsaWVyIGluIGJvb3QgdGhlc2UgbWVzc2FnZXMgYXJlIHNlZW46DQpbICAgIDEuOTA4
NDg5XSB1c2IgMS0xOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MDU0YywgaWRQcm9k
dWN0PTBjYTEsIGJjZERldmljZT0gMS4wMA0KWyAgICAxLjkwODUwM10gdXNiIDEtMTogTmV3IFVT
QiBkZXZpY2Ugc3RyaW5nczogTWZyPTIsIFByb2R1Y3Q9MywgU2VyaWFsTnVtYmVyPTQNClsgICAg
MS45MDg1MDhdIHVzYiAxLTE6IFByb2R1Y3Q6IFdBTEtNQU4NClsgICAgMS45MDg1MTNdIHVzYiAx
LTE6IE1hbnVmYWN0dXJlcjogU29ueQ0KWyAgICAxLjkwODUxNl0gdXNiIDEtMTogU2VyaWFsTnVt
YmVyOiAxMDQ1OEI1NTQ3NzkxNg0KWyAgICAyLjE5NTgyMV0gdXNiLXN0b3JhZ2UgMS0xOjEuMDog
VVNCIE1hc3MgU3RvcmFnZSBkZXZpY2UgZGV0ZWN0ZWQNClsgICAgMi4xOTU5ODhdIHNjc2kgaG9z
dDA6IHVzYi1zdG9yYWdlIDEtMToxLjANCg0KUHJvZHVjdElkIGlzIGRpZmZlcmVudCwgdGhhdCdz
IHN0cmFuZ2UuDQoNCk5laWwsIGNvdWxkIHlvdSBjb2xsZWN0IHRoZSBkbWVzZyBmcm9tIHRoZSB3
b3JraW5nIGtlcm5lbCA1LjEwIHBsZWFzZT8NCkFuZDogaXMgdGhlIGRldmljZSBleHBlY3RlZCB0
byBiZSBhIG1hc3Mgc3RvcmFnZSAoYWthIFVTQiBkaXNrKSBhbmQgc291bmQgY2FyZCBpbiBvbmU/
DQoNClRoYW5rcywNCkNhcnN0ZW4NCg0KDQotLS0tLS0tLS0tLS0tLS0tLQ0KU2llbWVucyBFbGVj
dHJvbmljIERlc2lnbiBBdXRvbWF0aW9uIEdtYkg7IEFuc2NocmlmdDogQXJudWxmc3RyYcOfZSAy
MDEsIDgwNjM0IE3DvG5jaGVuOyBHZXNlbGxzY2hhZnQgbWl0IGJlc2NocsOkbmt0ZXIgSGFmdHVu
ZzsgR2VzY2jDpGZ0c2bDvGhyZXI6IFRob21hcyBIZXVydW5nLCBGcmFuayBUaMO8cmF1ZjsgU2l0
eiBkZXIgR2VzZWxsc2NoYWZ0OiBNw7xuY2hlbjsgUmVnaXN0ZXJnZXJpY2h0IE3DvG5jaGVuLCBI
UkIgMTA2OTU1DQo=
