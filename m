Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4503D56AC
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jul 2021 11:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbhGZIw3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jul 2021 04:52:29 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:57623 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbhGZIw2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jul 2021 04:52:28 -0400
IronPort-SDR: Jm35T4PJvKa3gBR9gEACL/MCjtJil+eklHAq3r4NZM5Nffc5TtAy10z3/5wSCFZ7A7hCLcwlPj
 tZphL5sHRWrVrJNVAfs87cTsq7lfxkolkOCO9ckKQxRCbGemO1F+QLrO/eKqjN8/59os3i48Kh
 0JnnjSGOkuMjeUWxljcq0aqmgfZ71/nuXa5nXn6z8Zltfrsd+dcPr3SP2KUNtbXtZSFcBIKz/b
 tHUjgldlByz3sxZTzcYhI0dZFvC05acgte0PZSOCIZ2oBhYaUc16DowLH2/RB1MIIKD+gx9OPY
 n7V/+UPP/Yk0/U6lo40RNscS
X-IronPort-AV: E=Sophos;i="5.84,270,1620720000"; 
   d="scan'208";a="64086865"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 26 Jul 2021 01:32:57 -0800
IronPort-SDR: GQ51j+12udpwXKb4mPBrIC08MdzfGM3+vN2DNFf5NIXU0VCBiRW6GiPTJbpThcuRti7OYQyqZJ
 Nzy+LVJ+3qP5X1VFfyydpBCuAgxcjTk/gx8QlF7640161b9/HzbrAe3XVG7mBN+Hr4ClwL2KlV
 avCILp0feSv+jl1qr1qVz44vAdAx9T+pyQM4dZFgodoPVatzd6oMGMsqCmC6h1Y2PqVpACEBYl
 fwk2YQR/3pyBpHASDo01+k9Qj3nEO9+iodxum/jvGI7oLPgkjYJBFm48Dxu14gSta9qwlGBMy8
 WyY=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     "Greg KH (gregkh@linuxfoundation.org)" <gregkh@linuxfoundation.org>
CC:     USB list <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: RE: [PATCH for 4.14] xhci: add xhci_get_virt_ep() helper
Thread-Topic: [PATCH for 4.14] xhci: add xhci_get_virt_ep() helper
Thread-Index: AdeB/MZwIKb/vqPQSfySS+0zMoOZhv//9HiA///s/CA=
Date:   Mon, 26 Jul 2021 09:32:32 +0000
Message-ID: <2a9ea039f20d4835a5eb8fe1bb1e34b9@SVR-IES-MBX-03.mgc.mentorg.com>
References: <3c42fbd4599a4a3e8b065418592973d9@SVR-IES-MBX-03.mgc.mentorg.com>
 <YP5+ORjnkKnwWRrt@kroah.com>
In-Reply-To: <YP5+ORjnkKnwWRrt@kroah.com>
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

SGkgR3JlZywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHcmVnIEtI
IChncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZykgPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3Jn
Pg0KPiBTZW50OiBNb250YWcsIDI2LiBKdWxpIDIwMjEgMTE6MjANCj4NCj4+IEBHcmVnOiBQYXRj
aCBpcyBmb3IgNC4xNCwgbm90IHRlc3RlZCBpZiBhcHBsaWVzIG9uIG90aGVyIGtlcm5lbHMuDQo+
IEkgY2FuIG5vdCBqdXN0IGFwcGx5IHRoaXMgdG8gNC4xNCwgaXQgYWxzbyBuZWVkcyB0byBnbyBp
bnRvIDQuMTkgYW5kIDUuNCBhbmQgNS4xMCBhcyB5b3UgY2FuIG5vdCB1cGdyYWRlIHRvIGEgbmV3
ZXIga2VybmVsIGFuZCBnZXQgYSByZWdyZXNzaW9uLCByaWdodD8NCkFhYWgsIGRpZG4ndCBoYXZl
IHRoYXQgaW4gbWluZC4gU29ycnkuDQoNCj4gQ2FuIHlvdSBhbHNvIHByb3ZpZGUgcGF0Y2hlcyBm
b3IgdGhvc2Uga2VybmVscyBhcyB3ZWxsIHNvIHRoYXQgSSBjYW4gdGFrZSB0aGlzIG9uZT8NCkkn
bGwgdHJ5IHRvIGRvIHNvIPCfmIoNCg0KPiBBbmQgYWxzbywgeW91IGZvcmdvdCB0byBjYzogdGhl
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgbWFpbGluZyBsaXN0IDooDQpJIHJlYWxseSBuZWVkIHRv
IGhhdmUgbW9yZSBwcmFjdGljZSDwn5iJDQoNCnRoYW5rcywNCkNhcnN0ZW4NCi0tLS0tLS0tLS0t
LS0tLS0tDQpTaWVtZW5zIEVsZWN0cm9uaWMgRGVzaWduIEF1dG9tYXRpb24gR21iSDsgQW5zY2hy
aWZ0OiBBcm51bGZzdHJhw59lIDIwMSwgODA2MzQgTcO8bmNoZW47IEdlc2VsbHNjaGFmdCBtaXQg
YmVzY2hyw6Rua3RlciBIYWZ0dW5nOyBHZXNjaMOkZnRzZsO8aHJlcjogVGhvbWFzIEhldXJ1bmcs
IEZyYW5rIFRow7xyYXVmOyBTaXR6IGRlciBHZXNlbGxzY2hhZnQ6IE3DvG5jaGVuOyBSZWdpc3Rl
cmdlcmljaHQgTcO8bmNoZW4sIEhSQiAxMDY5NTUNCg==
