Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A399BE269
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2019 18:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732723AbfIYQXD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Sep 2019 12:23:03 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151]:21590 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726553AbfIYQXD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Sep 2019 12:23:03 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-135-R6_mvMpcPuCbkdHMFLI7Pw-1; Wed, 25 Sep 2019 17:22:59 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 25 Sep 2019 17:22:59 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Wed, 25 Sep 2019 17:22:59 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Mathias Nyman' <mathias.nyman@linux.intel.com>,
        alex zheng <tc0721@gmail.com>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "xiaowei.zheng@dji.com" <xiaowei.zheng@dji.com>
Subject: RE: BUG report: usb: dwc3: Link TRB triggered an intterupt without
 IOC being setted
Thread-Topic: BUG report: usb: dwc3: Link TRB triggered an intterupt without
 IOC being setted
Thread-Index: AQHVc6/+eVm0qdujokOQz2eC8PiOvqc8korQ
Date:   Wed, 25 Sep 2019 16:22:59 +0000
Message-ID: <f5cd8ff1767c48a0bd86e743ae128b10@AcuMS.aculab.com>
References: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com>
 <87a7avh8uu.fsf@gmail.com>
 <CADGPSwjTn1KwMcxKdajNwxbLi09-SQ1Eu=1m57Z+LNnj0i2BeA@mail.gmail.com>
 <106544ca-7a01-0a86-e785-c7c520ebdc4b@linux.intel.com>
 <CADGPSwi87a5+3mCGAgptHgpBsQk9STQrEKs-kC6Nw55nPdRtOw@mail.gmail.com>
 <5431a9df-3816-b525-c3bc-4e7462d0f38f@linux.intel.com>
In-Reply-To: <5431a9df-3816-b525-c3bc-4e7462d0f38f@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: R6_mvMpcPuCbkdHMFLI7Pw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RnJvbTogTWF0aGlhcyBOeW1hbg0KPiBTZW50OiAyNSBTZXB0ZW1iZXIgMjAxOSAxNTo0OA0KPiAN
Cj4gT24gMjQuOS4yMDE5IDE3LjQ1LCBhbGV4IHpoZW5nIHdyb3RlOg0KPiA+IEhpIE1hdGhpYXMs
DQouLi4NCj4gTG9ncyBzaG93IHlvdXIgdHJhbnNmZXIgcmluZyBoYXMgZm91ciBzZWdtZW50cywg
YnV0IGhhcmR3YXJlIGZhaWxzIHRvDQo+IGp1bXAgZnJvbSB0aGUgbGFzdCBzZWdtZW50IGJhY2sg
dG8gZmlyc3QpDQo+IA0KPiBMYXN0IFRSQiAoTElOSyBUUkIpIG9mIGVhY2ggc2VnbWVudCBwb2lu
dHMgdG8gdGhlIG5leHQgc2VnbWVudCwNCj4gbGFzdCBzZWdtZW50cyBsaW5rIHRyYiBwb2ludHMg
YmFjayB0byBmaXJzdCBzZWdtZW50Lg0KPiANCj4gSW4geW91ciBjYXNlOg0KPiAweDFkMTE3MDAw
IC0+IDB4MWViMDkwMDAgLT4gMHgxZWIwYTAwMCAtPiAweDFkYmRhMDAwIC0+IChiYWNrIHRvIDB4
MWQxMTcwMDApDQo+IA0KPiBGb3Igc29tZSByZWFzb24geW91ciBoYXJkd2FyZSBkb2Vzbid0IHRy
ZWF0IHRoZSBsYXN0IFRSQiBhdCB0aGUgbGFzdCBzZWdtZW50DQo+IGFzIGEgTElOSyBUUkIsIGlu
c3RlYWQgaXQganVzdCBpc3N1ZXMgYSB0cmFuc2ZlciBldmVudCBmb3IgaXQsIGFuZCBjb250aW51
ZXMgdG8NCj4gdGhlIG5leHQgYWRkcmVzcyBpbnN0ZWFkIG9mIGp1bXBpbmcgYmFjayB0byBmaXJz
dCBzZWdtZW50Og0KDQpUaGF0IGNvdWxkIGJlIGEgY2FjaGUgY29oZXJlbmN5IChvciBmbHVzaGlu
ZyAoZXRjKSkgaXNzdWUuDQoNCj4+IFRoaXMgaXMgb3VyIHNlbGYtZGVzaWduIHBsYXRmb3JtIChB
Uk0gdjcgY3B1IGNvcmUgIHdpdGggc3lub3BzeXMgRFdDIFVTQjMuMCBjb250cm9sbGVyKS4NCk9y
IG1heWJlIHlvdXIgaGFyZHdhcmUgaXMganVzdCBnZXR0aW5nIHNvbWUgb2YgdGhlIG1lbW9yeSBh
Y2Nlc3NlcyB3cm9uZz8NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lk
ZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0K
UmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

