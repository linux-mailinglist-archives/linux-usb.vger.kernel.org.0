Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9BF417F75F
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2020 13:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgCJM0f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Mar 2020 08:26:35 -0400
Received: from mail.actia.se ([195.67.112.82]:29884 "EHLO mail.actia.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726271AbgCJM0f (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Mar 2020 08:26:35 -0400
Received: from S036ANL.actianordic.se (192.168.16.117) by
 S035ANL.actianordic.se (192.168.16.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 10 Mar 2020 13:26:32 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.1913.007; Tue, 10 Mar 2020 13:26:32 +0100
From:   Jonas Karlsson <jonas.karlsson@actia.se>
To:     Oliver Neukum <oneukum@suse.de>, Peter Chen <peter.chen@nxp.com>
CC:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: USB transaction errors causing RCU stalls and kernel panics
Thread-Topic: USB transaction errors causing RCU stalls and kernel panics
Thread-Index: AdXxbFdECZ2tmAAoQZaxVkfgHyprqgABZ9yAAAiGryAAIGdeAAAEO3aAAAR/HgAARX+KgACtYMrAACnez4AABbFG8AAAO9EAAACaYAAAA7I5cA==
Date:   Tue, 10 Mar 2020 12:26:32 +0000
Message-ID: <325d5af5d4c44eafac94fc8e0e4d1a7d@actia.se>
References: <ddf8c3971b8544e983a9d2bbdc7f2010@actia.se>
         <20200303163945.GB652754@kroah.com>
         <ca6f029a57f24ee9aea39385a9ad55bd@actia.se>
         <6909d182-6cc5-c07f-ed79-02c741aec60b@linux.intel.com>
         <1583331173.12738.26.camel@suse.com>
         <4fa64e92-64ce-07f3-ed8e-ea4e07d091bb@linux.intel.com>
         <VI1PR04MB532785057FD52DFE3A21ACA88BE30@VI1PR04MB5327.eurprd04.prod.outlook.com>
         <699a49f2f69e494ea6558b99fad23cc4@actia.se>
         <20200310081452.GA14625@b29397-desktop>
         <d1f68ef3316e484b9cc1360f71886719@actia.se>
         <1583838270.11582.11.camel@suse.com> <1583839306.11582.12.camel@suse.de>
In-Reply-To: <1583839306.11582.12.camel@suse.de>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.11.14.24]
x-esetresult: clean, is OK
x-esetid: 37303A2914C9726A627465
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQo+IEFtIERpZW5zdGFnLCBkZW4gMTAuMDMuMjAyMCwgMTI6MDQgKzAxMDAgc2NocmllYiBPbGl2
ZXIgTmV1a3VtOg0KPiA+IEFtIERpZW5zdGFnLCBkZW4gMTAuMDMuMjAyMCwgMTA6MDQgKzAwMDAg
c2NocmllYiBKb25hcyBLYXJsc3NvbjoNCj4gPg0KPiA+ID4gWWVzLCBJIGhhdmUgYXBwbGllZCB0
aGF0IGNvbW1pdC4gVGhlIGxvZ3MgSSBoYXZlIGF0dGFjaGVkIHNvIGZhciBoYXZlIGhhZA0KPiB0
aGF0IGNvbW1pdCBhcHBsaWVkLg0KPiA+ID4gSXQgcmVkdWNlcyB0aGUgYW1vdW50IG9mIFVua25v
d24gZXZlbnQgdHlwZSAzNyBtZXNzYWdlcyBzaWduaWZpY2FudGx5Lg0KPiA+DQo+ID4gSSBhbSBh
IGJpdCBjb25mdXNlZC4gSWYgdGhpcyBzdGlsbCBoYXBwZW5zIGFmdGVyIHlvdSBkaXNhYmxlZA0K
PiA+IGF1dG9zdXNwZW5kLCB0aGUgaW5pdGlhbCBkaWFnbm9zaXMgY2FuJ3QgYmUgcmlnaHQuIEl0
IGxvb2tzIGxpa2Ugd2UNCj4gPiBhcmUgZW50ZXJpbmcgc29tZSBraW5kIG9mIGJ1c3kgbG9vcC4g
Q2FuIHlvdSB0ZXN0IHRoZSBhdHRhY2hlZA0KPiA+IHBhdGNoZXM/DQo+IA0KPiBDb3JyZWN0aW9u
OiBwbGVhc2UgdGVzdCB0aGVzZSB0aHJlZSBwYXRjaGVzLg0KPiANCj4gCVJlZ2FyZHMNCj4NCiAJ
CU9saXZlcg0KDQpJIGNhbiB0ZXN0IHRoZSBwYXRjaGVzLiBIb3dldmVyLCB0aGV5IGRvIG5vdCBh
cHBseSBvbiBteSBOWFAgNC4xOS45NiBrZXJuZWwuDQpUaGUgb25seSBkaWZmZXJlbmNlIGJldHdl
ZW4gdjQuMTkuMTA1IGFuZCBteSBOWFA0LjE5Ljk2IGtlcm5lbCBpcyB0aGF0IHdlIGFyZSBsYWNr
aW5nDQp0aGlzIGNvbW1pdDoNCg0KY29tbWl0IGFlMDBlMWY1NzNmMzYyMWJhNjQxMTBhYTk5NGE4
OGFjMGIzMzk0YzQNCkF1dGhvcjogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPg0KRGF0
ZTogICBUaHUgQXByIDI1IDE4OjA1OjM5IDIwMTkgKzAyMDANCg0KICAgIFVTQjogY2RjLWFjbTog
Zml4IHVudGhyb3R0bGUgcmFjZXMNCg0KDQpIb3dldmVyLCB0aGUgMDAwMi1jZGMtYWNtLWludHJv
ZHVjZS1hLWNvb2wtZG93bi5wYXRjaCB5b3Ugc2VudCBtZSBzZWVtIHRvIGJlIGJhc2VkIG9uIA0K
YSBuZXdlciBrZXJuZWwgdHJlZS4gSXQgc2VlbXMgdG8gZGVwZW5kIG9uIGF0IGxlYXN0IHRoaXMg
Y29tbWl0IHdoaWNoIHdhcyBpbnRyb2R1Y2VkIGluIHY1Lng6DQoNCmNvbW1pdCAwZjAyMzIxZTRi
ZDFiMTdlYjk1N2UwNzdlODY4ZWYxNjExZjVkYmJkDQpBdXRob3I6IEpvaGFuIEhvdm9sZCA8am9o
YW5Aa2VybmVsLm9yZz4NCkRhdGU6ICAgVGh1IEFwciAyNSAxODowNTo0MCAyMDE5ICswMjAwDQoN
CiAgICBVU0I6IGNkYy1hY206IGNsZWFuIHVwIHRocm90dGxlIGhhbmRsaW5nDQoNClBsZWFzZSBh
ZHZpY2Ugb24gaG93IHRvIHByb2NlZWQgdG8gbWFrZSBzdXJlIEkgdGVzdCB0aGUgY29kZSB5b3Ug
aW50ZW5kLg0KDQpCUiwNCkpvbmFzDQo=
