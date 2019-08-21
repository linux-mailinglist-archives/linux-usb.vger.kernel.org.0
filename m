Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A582E97C32
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 16:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbfHUOMV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 10:12:21 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:33198 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728981AbfHUOMV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 10:12:21 -0400
IronPort-SDR: 5LfPA3TLLoPhxIAHBaFuSpMS9pbo6eCd/9G3OvVSbVoQhSn2L1B9nEBnLN8PAR+InO3nGKI4jd
 fvq6IZW6r0r7HKo4f7un+wgkF9+pqCHvBHjuhDf5Q4rAoFofm3wmtqdBtg1heL13EuSBloY+qm
 Z8eaNSpa72C0eBZnFIsPQbELPmnKHHiw4TqzN22dV/Vi3abmBgOfTS0o06Lv3Bk9w66U3t8awS
 xL9T41GK+TnX61KCczPN7SgSTL0zgKhWfuCHnGt4vkv+2wzgX1B6SUsge44gu00rWgwxd+aykF
 MEw=
X-IronPort-AV: E=Sophos;i="5.64,412,1559548800"; 
   d="scan'208";a="40648252"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 21 Aug 2019 06:12:21 -0800
IronPort-SDR: /L9eUn4pHWElUM7OjvZwBFil3OXi262rKKM+7KjmwhTaeX0mNOih3OleXN8/qi7GbdbPCSAKau
 asXbwdfJz9339uyVm7Fd3S5iey7YRF55vYNrJnLBqXamJBjFPucnyRZf63Kb/4hdnAqUSlOzT3
 5YUA7eL773vRGD/a4ZC4Nlb9cOkK9w5YFuCZezSr1QjNBgAev+XObt6UHCddJ0xx6DG7QYrIk8
 cNlVHzPX9KO8wr27k3Ax+oeI4S5krXcvfct/tj6OTWNsDrJpHegZJIDDf7niZNfaHANPv34/PI
 oUw=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     "wharms@bfs.de" <wharms@bfs.de>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: problems with Edgeport/416
Thread-Topic: problems with Edgeport/416
Thread-Index: AQHVWCECNX3xNGRgBkW3E536acORx6cFk8iw///3RYCAABjO8A==
Date:   Wed, 21 Aug 2019 14:12:15 +0000
Message-ID: <631418d3c1814830820db0c66f82b17e@SVR-IES-MBX-03.mgc.mentorg.com>
References: <5D5D1C8C.9080000@bfs.de> <20190821112009.GA5228@kroah.com>
 <5D5D2F9E.7050805@bfs.de> <20190821122028.GA19107@kroah.com>
 <5D5D4170.4070001@bfs.de>
 <eb4392d938654d99a3f37820b279c839@SVR-IES-MBX-03.mgc.mentorg.com>
 <5D5D49DF.1040800@bfs.de>
In-Reply-To: <5D5D49DF.1040800@bfs.de>
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

PiANCj4gIHVuYW1lIC1hDQo+ICBMaW51eCBvbW5mcm1vMTAgNC4xMi4xNC1scDE1MS4yOC4xMC12
YW5pbGxhICMxIFNNUCBTYXQgSnVsIDEzIDE3OjU5OjMxIFVUQw0KPiAyMDE5ICgwYWIwM2I3KSB4
ODZfNjQgeDg2XzY0IHg4Nl82NCBHTlUvTGludXgNCj4gDQo0LjEyLjE0IC0gaXQgc2hvdWxkIGhh
dmUgdGhlIGhlYXJ0YmVhdCBwYXRjaCBpbnRyb2R1Y2VkIGluIDQuMw0KDQo+IGkgc2VlIGEgbG90
LCBzZWUgYXR0YWNoZWQgZmlsZQ0KVGhlIGR5bmRiZyBmb3IgdGhlIGRyaXZlciBpcyBhY3RpdmUg
Oi0pDQoNClRoZSBsb2cgeW91IHNlbnQgZG9lcyBub3Qgc2hvdyBzb21ldGhpbmcgaXJyZWd1bGFy
Lg0KQ2FuIHlvdSBjb2xsZWN0IHRoZSBsb2cgImFyb3VuZCBhIGRldmljZSByZXNldCIgaW4gdGhl
IHNhbWUgd2F5IHBsZWFzZT8NCg0KQmVzdCByZWdhcmRzDQpDYXJzdGVuDQo=
