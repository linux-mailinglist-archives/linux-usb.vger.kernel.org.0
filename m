Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96B9A2EF05E
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 11:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbhAHKCi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jan 2021 05:02:38 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:28946 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726120AbhAHKCh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jan 2021 05:02:37 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-24-GnvGLzLrNRW6Mh83r0DOQQ-1; Fri, 08 Jan 2021 09:57:37 +0000
X-MC-Unique: GnvGLzLrNRW6Mh83r0DOQQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 8 Jan 2021 09:57:37 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Fri, 8 Jan 2021 09:57:37 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Joe Abbott' <jabbott@rollanet.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: pl2303.c 110 baud not working
Thread-Topic: pl2303.c 110 baud not working
Thread-Index: AQHW5Tkk+qbhK5xDZE6HBQeZtKedA6odfdVg
Date:   Fri, 8 Jan 2021 09:57:37 +0000
Message-ID: <2a149a14e647401f8d570895c3f4ae56@AcuMS.aculab.com>
References: <CADuz4ONmN299aw460r4wXCEK5F1v9kt_cewCCrdg2hb5nJV9uQ@mail.gmail.com>
In-Reply-To: <CADuz4ONmN299aw460r4wXCEK5F1v9kt_cewCCrdg2hb5nJV9uQ@mail.gmail.com>
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

RnJvbTogSm9lIEFiYm90dA0KPiBTZW50OiAwNyBKYW51YXJ5IDIwMjEgMjE6MDYNCj4gTXkgbWVz
c2FnZSB0byBoaW0gd2FzOg0KPiBJIGhhdmUgYW4gQVNSMzMgdGVsZXR5cGUgdGhhdCBJJ20gdHJ5
aW5nIHRvIGNvbW11bmljYXRlIHdpdGggdXNpbmcgYQ0KPiBQTDIzMDMgYmFzZWQgQmVuZmVpIFVT
QiBzZXJpYWwgYWRhcHRlci4gIFRoZSBBU1IgcmVxdWlyZXMgMTEwIGJhdWQgN0UxDQouLi4NCg0K
SSBiZWxpZXZlIHlvdSdsbCBhbHNvIG5lZWQgZWl0aGVyIDEuNSBvciAyIHN0b3AgYml0cyAoY2Fu
J3QgcmVtZW1iZXINCndoaWNoKSBhbmQgZGVsYXlzICh1c3VhbGx5IDAgYnl0ZXMpIGFmdGVyIENS
IChhbmQgcHJvYmFibHkgTEYpLg0KDQpVc2luZyBhbiBBU1IzMyB3aXRoICdyZW1vdGUgZWNobycg
aXMgYSBiaXQgbGlrZSB0cnlpbmcgdG8gdGFsaw0Kb24gYSB0cmFuc2F0bGFudGljIHBob25lIGxp
bmUgd2l0aCBicm9rZW4gZWNobyBjYW5jZWxsYXRpb24uDQpFc3BlY2lhbGx5IGlmIHRoZSAxMDAg
YmF1ZCBsaW5rIGlzIGJlaW5nIGNhcnJpZWQgb3ZlciBhY291c3RpY2FsbHkNCmNvdXBsZWQgbW9k
ZW1zIChyZW1lbWJlciB0aG9zZT8pLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNz
IExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAx
UFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

