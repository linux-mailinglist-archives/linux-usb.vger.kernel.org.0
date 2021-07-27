Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922BA3D794D
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 17:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbhG0PFl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 11:05:41 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:8768 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbhG0PFk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 11:05:40 -0400
IronPort-SDR: i/uhX4NE48fBxzbnFf1fAmzep1u+0xxiLQ+GBJabzdAh5nPSsBWymu7KC69wD949+JaDQaEqVd
 hL36VboIwYda3MiY/nO/CGH5GkbjHZKsCT7McYBtfzQfBdL8mRM0LUxa7RfpF4AY9hB+/DLekz
 LbK68eYGY0WX+Eo7a6+yX3XLa0SNhYCcZRfg2Q5PYtxVNxUSZm3Kh9pVyIvtVQJPCleOkA4jtP
 ZZzsu5cfjBWRzA/zhuzSSOR23gJnyfnjRmhIqan16v8BLnF2QywbmHu6nkxTzZWGo3mrnRT8qq
 TD2uuHK7jZQGXGUxxQiku+Qb
X-IronPort-AV: E=Sophos;i="5.84,274,1620720000"; 
   d="scan'208";a="63969780"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 27 Jul 2021 07:05:40 -0800
IronPort-SDR: PAXAO5ZEhIeFOwiel0rM25IoYutpMN9pQ9gZRaMAKxS8+XgKe1SeQEBk1YOuK7jXUo49pE9VQ9
 FVHYTRNiU1ri/iDHl9lFsd/bVaz97Cz1zyeEXrP2or6AstWDsIPI8u0mwvYrRWiOFQjEqNyB/l
 LWwwHF7b76xozPLY2XBmXK+t5SMZ6pYM42sZ+GSpdOlGMzolbNp3QOO7VMmsVc06xbB/vIv0N8
 +XqcQ5cCJLj/GPVj1NMib6WROhOp079bopd5G4BuLXJ4Z0C/TOqvOdOHt8muKkb7JINY+WpcCB
 IAA=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     AMoonRabbit <razgriz.wilson6@gmail.com>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Fwd: Linux Kernel 5.12.10 Walkman USB DAC support issues
Thread-Topic: Fwd: Linux Kernel 5.12.10 Walkman USB DAC support issues
Thread-Index: AQHXgnc1OBuFQo+G60aTmW/ZGwqjqqtWSBcAgAAnYmCAACiMgIAALrSg///1dACAAC+1EA==
Date:   Tue, 27 Jul 2021 15:05:14 +0000
Message-ID: <adddde7315464623ba329dc4e5dcc5d7@SVR-IES-MBX-03.mgc.mentorg.com>
References: <QUKVWQ.1T8HV94AM5X6@gmail.com>
        <CAJpVOidqd+tpNNkHGvC6fUQ7g3Z+FLpiDJrmPWtQmiL-AsYsLw@mail.gmail.com>
        <YP+kqqimY1BYZAwL@kroah.com>
        <a59c1173b77b4ace8db7181b1b0fc446@SVR-IES-MBX-03.mgc.mentorg.com>
        <RBHWWQ.R54EUTRRR5DN@gmail.com>
        <2c9ddbc65d1e4ce3a368c1d894281178@SVR-IES-MBX-03.mgc.mentorg.com>
 <GBNWWQ.KWQ1PXLOHKYW2@gmail.com>
In-Reply-To: <GBNWWQ.KWQ1PXLOHKYW2@gmail.com>
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

SGksDQoNCj4gRG1lc2cgb3V0cHV0IHdpdGggdGhlIHN5c3RlbSByZWJvb3RlZCBhbmQgdGhlIFdh
bGttYW4ga2VwdCBpbiBEQUMgbW9kZQ0KPiBzbyB0aGUgc3lzdGVtIHdpbGwgb25seSBoYXZlIHNl
ZW4gdGhlIGRldmljZSBpbiB0aGF0IG1vZGUuIEFuZCBzb3JyeSwNCj4gbm90IHN1cmUgd2hhdCB5
b3UgbWVhbiBieSBubyB0b3AgcG9zdHMsIGJ1dCBndWVzc2luZyBpdCBoYXMgc29tZXRoaW5nDQo+
IHRvIGRvIHdpdGggbGVhdmluZyB0aGUgb3JpZ2luYWwgZW1haWwgSSB1c2VkIGluIHRoZSBDQz8N
Cg0KTm8gdG9wIHBvc3RpbmcgbWVhbnM6DQpXcml0ZSB5b3VyIGFuc3dlcnMgX2JlbG93XyB0aGUg
dGV4dCB0aGF0IHlvdSBhbnN3ZXIgdG8sIG5vdCBvbiB0b3Agb2YgaXQuDQoNCldoZW4geW91IHJl
YWQgYm9va3MsIHlvdSByZWFkIGZyb20gdG9wIHRvIGJvdHRvbSwgaXNuJ3QgaXQ/DQoNClRoYW5r
cywNCkNhcnN0ZW4NCi0tLS0tLS0tLS0tLS0tLS0tDQpTaWVtZW5zIEVsZWN0cm9uaWMgRGVzaWdu
IEF1dG9tYXRpb24gR21iSDsgQW5zY2hyaWZ0OiBBcm51bGZzdHJhw59lIDIwMSwgODA2MzQgTcO8
bmNoZW47IEdlc2VsbHNjaGFmdCBtaXQgYmVzY2hyw6Rua3RlciBIYWZ0dW5nOyBHZXNjaMOkZnRz
ZsO8aHJlcjogVGhvbWFzIEhldXJ1bmcsIEZyYW5rIFRow7xyYXVmOyBTaXR6IGRlciBHZXNlbGxz
Y2hhZnQ6IE3DvG5jaGVuOyBSZWdpc3RlcmdlcmljaHQgTcO8bmNoZW4sIEhSQiAxMDY5NTUNCg==
