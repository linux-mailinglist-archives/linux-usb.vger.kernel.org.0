Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97EE029F15D
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 17:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgJ2Q0n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 12:26:43 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:39003 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726177AbgJ2Q0m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Oct 2020 12:26:42 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-170-h9abAtKcP_ONIPwOzozL1g-1; Thu, 29 Oct 2020 16:26:34 +0000
X-MC-Unique: h9abAtKcP_ONIPwOzozL1g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 29 Oct 2020 16:26:33 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Thu, 29 Oct 2020 16:26:33 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Mathias Nyman' <mathias.nyman@linux.intel.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC:     Mike Galbraith <efault@gmx.de>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>, Li Jun <jun.li@nxp.com>
Subject: RE: [PATCH 3/3] xhci: Don't create stream debugfs files with spinlock
 held.
Thread-Topic: [PATCH 3/3] xhci: Don't create stream debugfs files with
 spinlock held.
Thread-Index: AQHWrfRjUXdhFX0Fok2rnu4f+bTGTqmuw8JA
Date:   Thu, 29 Oct 2020 16:26:33 +0000
Message-ID: <144c51e878f749709ac805599b270eb1@AcuMS.aculab.com>
References: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
 <20201028203124.375344-4-mathias.nyman@linux.intel.com>
 <1cbb8b7defb1db1d4747995c11ebebb3dd9a66ec.camel@gmx.de>
 <30dd5079-375d-a2a3-cab3-1b2740661ea8@linux.intel.com>
 <c8a67a65091404e528297ef5c6b9c59cdc03a2c9.camel@gmx.de>
 <a5d5a21c-d6ff-1097-b9ca-e0147658c8c6@linux.intel.com>
 <20201029113805.tdsissnjq4acemle@linutronix.de>
 <29cf8ca3-0fe7-da51-c8ae-ad5c67af4dde@linux.intel.com>
In-Reply-To: <29cf8ca3-0fe7-da51-c8ae-ad5c67af4dde@linux.intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RnJvbTogTWF0aGlhcyBOeW1hbg0KPiBTZW50OiAyOSBPY3RvYmVyIDIwMjAgMTM6MDgNCi4uLg0K
PiAyLiBMb2NrZGVwIGlzc3VlICMyLCBhZGRpbmcgZW50cmllcyB0byByYWRpeCB0cmVlIGR1cmlu
ZyAoc3RyZWFtKSByaW5nIGV4cGFuc2lvbiB3aXRoIGludGVycnVwdHMNCj4gZGlzYWJsZWQgYW5k
IHhoY2ktPmxvY2sgaGVsZC4NCj4gICAgQ2F1c2U6IHVua25vd24sIHByb2JhYmx5IGEgcGF0Y2gg
c2luY2Ugd2Ugc3RhcnRlZCB1c2luZyByYWRpeCB0cmVlcyBmb3IgZmluZGluZyBzdHJlYW1zDQo+
ICAgIEZpeDogdW5rbm93bi4NCj4gICAgQ29tbWVudDogRGlzY292ZXJlZCBieSBNaWtlIHdoZW4g
dGVzdGluZyBmaXggZm9yIGlzc3VlIzEuDQo+ICAgIEkgc3VzcGVjdCBpdCBjYW4gYmUgcmVwcm9k
dWNlZCBvbiA1LjkgYnV0IGlzDQo+ICAgIHByb2JhYmx5IHJlYWxseSBoYXJkIGFzIGl0IGludm9s
dmVzIHJpbmcgZXhwYW5zaW9uLg0KDQpJU1RSIHRoaW5raW5nIHRoYXQgY29kZSB3YXMgYWxsb2Nh
dGluZyAnbWVtb3J5IHBhZ2VzJyBpbiBhIHBsYWNlDQp3aGVyZSAoSUlSQykgdm1hbGxvYygpIHdv
dWxkbid0IGJlIGFsbG93ZWQuDQoNCkknZCBzb3J0IG9mIGFzc3VtZWQgdGhlIGFsbG9jYXRpb24g
ZnVuY3Rpb24gd2FzIGFsbG93ZWQuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3Mg
TGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQ
VCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

