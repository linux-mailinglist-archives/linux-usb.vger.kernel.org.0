Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C61489CC6D
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 11:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730831AbfHZJSm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 05:18:42 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:44212 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfHZJSm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Aug 2019 05:18:42 -0400
IronPort-SDR: XTMaxBFvsH2UwM1a8ogdyerZMf+GTYR+PbElc6Fkm3D5DC8C+vLquXBHBRhklwDM5SwpuwqZB1
 dTDgBOzQBal3KyEyeA5JOxhnP94ZTOuhXAC+KIAFT+D1eLBwISdz8OUjGVvyF02HRAiB8dk5EW
 VPgRQDor5wOdurgQu81pHwkkajDq336w4JMLonDYvsbXgNE0BB4L/1m53n6Rp3gwHYo7x8FoZx
 XF0B+4b67W+6CtClD3IzgavWbjb4O9Uh9KEzh5aGstGgxCq8QeXmH0DLJPHP93N/Q0JIKNWzEv
 1OY=
X-IronPort-AV: E=Sophos;i="5.64,431,1559548800"; 
   d="scan'208";a="40754434"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 01:18:41 -0800
IronPort-SDR: dR8ERYs91sPATzkv9nRtgxts6uCG5HQ61fwrPXTn/rFfRacTg8z4JsfAp23Qd5snpqApwaZEsQ
 0GUZwmfft4zBkIbKvxMy9iPQ2tDv854OyoqHRJT1k0a/v0XMgMYLokcRNPlaTQJrHtJiML5Ab2
 y1ctFc9zAuq4BKo1ZVp4irZExNstTlOfhrZIo9EgoDplC8RlN/GkDLx5ILnOQR7X7LWa50A2cL
 0TphBwlFjzzQjpCMd0dw+eQMwC0LKftW88xW91oBfVIMGeAZcjRJHoJRy7GeCHjtFAdJremLEv
 e+E=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     Hans de Goede <hdegoede@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: AW: [Patch v5] usb: hcd: use managed device resources
Thread-Topic: AW: [Patch v5] usb: hcd: use managed device resources
Thread-Index: AQHVWbuDnGbGmDS690Kl9IU7UhO1uqcLekmAgAGBUYCAABgOQf///BYAgAAa9QA=
Date:   Mon, 26 Aug 2019 09:18:37 +0000
Message-ID: <52a8a072e74c4615971d708af31c85fd@SVR-IES-MBX-03.mgc.mentorg.com>
References: <1566569488679.31808@mentor.com> <20190825082949.GA4583@kroah.com>
 <975465c3-6ced-56f6-9115-a19248b370be@linux.intel.com>
 <1566806970031.45477@mentor.com>
 <bdb2e92b-2bd8-f88f-d593-59532c9b7c2c@linux.intel.com>
In-Reply-To: <bdb2e92b-2bd8-f88f-d593-59532c9b7c2c@linux.intel.com>
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

PiANCj4gVGhhbmtzIGZvciBmaXhpbmcgdGhpcywgaXQgc29sdmVzIGEgcmVhbCB1cHN0cmVhbSB4
aGNpIHJlbGF0ZWQgaXNzdWUgc2luY2UgNC4xOS4NCj4gRml4IGlzIG91dHNpZGUgeGhjaSBzbyBh
Y2NlcHRpbmcgdGhpcyBpcyBubyBsb25nZXIgdXAgdG8gbWUsIGJ1dCBmb3IgR3JlZzoNCj4gDQo+
IFJldmlld2VkLWJ5OiBNYXRoaWFzIE55bWFuIDxtYXRoaWFzLm55bWFuQGxpbnV4LmludGVsLmNv
bT4NCj4gRml4ZXM6IGZhMzFiM2NiMmFlMSAoInhoY2k6IEFkZCBJbnRlbCBleHRlbmRlZCBjYXAg
LyBvdGcgcGh5IG11eCBoYW5kbGluZyIpDQo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4g
IyB2NC4xOSsNCg0KQW55dGhpbmcgZWxzZSBuZWVkZWQgZnJvbSBteSBzaWRlPw0KUGxlYXNlIGxl
dCBtZSBrbm93IGlmIHNvLg0KDQpCZXN0IHJlZ2FyZHMNCkNhcnN0ZW4NCg==
