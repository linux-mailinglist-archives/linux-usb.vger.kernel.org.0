Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C873D0A33
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 10:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234994AbhGUHTw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 03:19:52 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:10437 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234560AbhGUHT0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 03:19:26 -0400
X-Greylist: delayed 458 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Jul 2021 03:19:26 EDT
IronPort-SDR: 3u7T6wbw4yXrPUI2AFDbjJtlhycYDZ0BQJTJS+v1D2GhlA7rHzTOaFq/M/QnPGiAoFYi83HQ45
 2GAN/Hk0FGMdB6ASzgYJxx+9xkIqO7gAguAGck+A3mBH4SL3G8saK3Bo6NL2k5RKOvhWN/wyPo
 WAy1/NTq02+DNxW0bPbh7niKUBc2sUZ3nyg/FA1pgsGISqcs96Ws4rMXIei/ns3MXlvZuh9+zV
 f1CMa6lWWxpk3nun/x1kV/VC6aDeLYhd/aWDg7rMSkwICKvpbdtg9zABc+upkeZ+49yijYi7Tr
 MVkw5t4DSE++sYJLaMS67exO
X-IronPort-AV: E=Sophos;i="5.84,257,1620720000"; 
   d="scan'208";a="63756835"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 20 Jul 2021 23:52:17 -0800
IronPort-SDR: njA9xbxgoA5PBzbqDVCbjIDQjsyWKoW4sAcbR50gEUUb0MeYi9os5NnsY2of7ILW+ypb9r/+B1
 JLaF07mbO9PcPnZ1/bQdOR9T5xW7TbpadQI7efFj+A6mjV1wIKXnZzYskg3BzeV5VrNETB4/rK
 zHuKvIZIYBwX2gYbpXQ/Yc09DZsvlt0un7qwkYi42vo2Ygqvkjrv8Bkl1s1Jak7MkrRtZO0T+L
 6QgjaiC/hR7hAcLVIqBJni7/hua2rSZwKxS17vptBN3V9rlUv2QW+yy7Vp7EzWcvf6Z8C+khys
 kKA=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: RE: Possible race in 4.14 xhci stack
Thread-Topic: Possible race in 4.14 xhci stack
Thread-Index: Add9dgXtLD9V5HWrQGOujH0Vt+GASgAA3LAAACKjYhA=
Date:   Wed, 21 Jul 2021 07:51:58 +0000
Message-ID: <2c52cd176b134e6ab7806aeda8fcca1d@SVR-IES-MBX-03.mgc.mentorg.com>
References: <513f81d8c17b4bcb97a60fd1d5b0738f@SVR-IES-MBX-03.mgc.mentorg.com>
 <YPb1ngCpsEizHtUi@kroah.com>
In-Reply-To: <YPb1ngCpsEizHtUi@kroah.com>
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

SGkgR3JlZywNCg0KPj4gSGkgTWF0aGlhcywNCj4+DQo+PiBpIGdvdCBhIE5VTEwgcG9pbnRlciBk
ZXJlZiBpbiB0aGUgdXNiZnMgYW5kIGFuYWx5emVkIGl0Lg0KPj4gVGhlIGNvbm5lY3RlZCBkZXZp
Y2Ugc2VlbWVkIHRvIGhhdmUgdHJvdWJsZSBvbiBVU0IgdHJhbnNtaXNzaW9ucy4NCj4+IEhvd2V2
ZXIsIEkgaGF2ZSB0aGUgaW1wcmVzc2lvbiB0aGF0IHRoZXJlIGlzIGEgcmFjZSBiZXR3ZWVuIGZp
bmlzaGluZyBVUkIgaGFuZGxpbmcgYW5kIGRpc2Nvbm5lY3Rpb24gb2YgZGV2aWNlcy4NCj4+IElu
IGRldGFpbDoNCj4+IFsgNDk3OS4wMjk2NjZdIHhoY2lfaGNkIDAwMDA6MDA6MTUuMDogVVNCIHRy
YW5zZmVyIGVycm9yLiBNYXliZSB0aGUgVVNCIGNhYmxlIGlzIGJhZD8NCj4NCj4gRGlkIHlvdXIg
Y2FibGUgZGllPw0KPg0KPiBBbmQgNC4xNCBpcyBxdWl0ZSBvbGQsIHdoYXQgYWJvdXQgNS4xMz8N
Cj4NCj4gdGhhbmtzLA0KPg0KPiBncmVnIGstaA0KDQpUaGF0IHdhcyByZXBvcnRlZCBmcm9tIGEg
ZGV2aWNlIGluIHRoZSBmaWVsZC4NClllcywgYSBkZWZlY3RpdmUgY2FibGUgaXMgYmFkLCBidXQg
c2hvdWxkbid0IHRoZSBrZXJuZWwncyBoZWFsdGggYXZvaWQgYSBOVUxMIHBvaW50ZXIgZGVyZWY/
DQoNCjQuMTQgaXMgdXNlZCBkdWUgdG8gYmVpbmcgTFRTIGFuZCB0aGUgZGV2aWNlIGZpcm13YXJl
IGhhcyBiZWVuIHN0YWJpbGl6ZWQgb24gdGhhdC4NCldlIGZyZXF1ZW50bHkgdXBkYXRlIG9uIHRo
ZSA0LjE0IGFuZCBtb25pdG9yIHBhdGNoZXMsIGJ1dCB0aGVyZSdzIG5vdGhpbmcgcmVnYXJkaW5n
DQphbiB4aGNpIHJhY2UgdXAgdG8gbm93IGluIDQuMTQgc2VlbiwgSSBjaGVja2VkIHRoYXQuDQoN
Ck5vdCBzdXJlIGlmIHRoaXMgd291bGQgaGFwcGVuIG9uIGEgbmV3ZXIga2VybmVsIGFsc28sIGJ1
dCB3ZSBjYW4ndCB0ZXN0IHRoYXQgb24gdGhlIGRldmljZSBpbiB0aGUgZmllbGQuDQpJdCB3YXMg
c2VlbiBvbmNlIHNvIGZhciwgYnV0IHRoZSBpbmRpY2F0aW9uIG9mIGEgcmFjZSBpcyByZWFsbHkg
aGlnaCBoZXJlLg0KDQpJZiBub2JvZHkgb2YgdGhlIFVTQiBtYWludGFpbmVycyBoYXMgYW4gaWRl
YSwgSSdsbCBmaXggdGhhdCB3aXRoIG15IHByb3Bvc2FsLg0KDQpCZXN0IHJlZ2FyZHMNCkNhcnN0
ZW4NCi0tLS0tLS0tLS0tLS0tLS0tDQpTaWVtZW5zIEVsZWN0cm9uaWMgRGVzaWduIEF1dG9tYXRp
b24gR21iSDsgQW5zY2hyaWZ0OiBBcm51bGZzdHJhw59lIDIwMSwgODA2MzQgTcO8bmNoZW47IEdl
c2VsbHNjaGFmdCBtaXQgYmVzY2hyw6Rua3RlciBIYWZ0dW5nOyBHZXNjaMOkZnRzZsO8aHJlcjog
VGhvbWFzIEhldXJ1bmcsIEZyYW5rIFRow7xyYXVmOyBTaXR6IGRlciBHZXNlbGxzY2hhZnQ6IE3D
vG5jaGVuOyBSZWdpc3RlcmdlcmljaHQgTcO8bmNoZW4sIEhSQiAxMDY5NTUNCg==
