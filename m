Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB5DD181BE4
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 15:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729805AbgCKO7r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Mar 2020 10:59:47 -0400
Received: from mail.actia.se ([195.67.112.82]:58820 "EHLO mail.actia.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729309AbgCKO7r (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Mar 2020 10:59:47 -0400
Received: from S036ANL.actianordic.se (192.168.16.117) by
 S035ANL.actianordic.se (192.168.16.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 11 Mar 2020 15:59:44 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.1913.007; Wed, 11 Mar 2020 15:59:44 +0100
From:   Jonas Karlsson <jonas.karlsson@actia.se>
To:     Oliver Neukum <oneukum@suse.com>,
        Fabio Estevam <festevam@gmail.com>
CC:     Peter Chen <peter.chen@nxp.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: USB transaction errors causing RCU stalls and kernel panics
Thread-Topic: USB transaction errors causing RCU stalls and kernel panics
Thread-Index: AdXxbFdECZ2tmAAoQZaxVkfgHyprqgABZ9yAAAiGryAAIGdeAAAEO3aAAAR/HgAARX+KgACtYMrAACnez4AABbFG8AAAO9EAAACaYAAAA7I5cAAHmbfw///2mYD//wJNQIACMDyA///DfRA=
Date:   Wed, 11 Mar 2020 14:59:44 +0000
Message-ID: <ad6b4f2d72f84726a398b41007839f77@actia.se>
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
         <325d5af5d4c44eafac94fc8e0e4d1a7d@actia.se>
         <c671a51d6b5642078367d681643c46af@actia.se>
         <CAOMZO5BURqWDXKXiwLzG=BRC_wJkjZ1d_HaLt_tefjk3GrabDw@mail.gmail.com>
         <fc2d27c17ebc409ea8c318c22ac1f4a7@actia.se>
 <1583922523.20566.4.camel@suse.com>
In-Reply-To: <1583922523.20566.4.camel@suse.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.11.14.24]
x-esetresult: clean, is OK
x-esetid: 37303A2914C9726A627663
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgT2xpdmVyLA0KDQo+IEhpLA0KPiANCj4gaXQgaXMgZ29vZCB0aGF0IHdlIGhhdmUgc29tZXRo
aW5nIHRoYXQgd29ya3MuDQo+IEl0IHdvdWxkIGJlIGV2ZW4gYmV0dGVyIGlmIHdlIHVuZGVyc3Rv
b2QgZXhhY3RseSBob3cgaXQgd29ya3MuIEluIGZhY3QgdGhhdA0KPiB0aGVzZSBwYXRjaGVzIHdv
cmsgYW5kIGFyZSBuZWVkZWQgbWF5IHZlcnkgd2VsbCBpbmRpY2F0ZSB0aGF0IGVycm9yDQo+IGhh
bmRsaW5nIG9uIGF0IGxlYXN0IHNvbWUgWEhDcyBkb2VzIG5vdCB3b3JrIGFzIGV4cGVjdGVkLg0K
PiANCj4gU28gYSBxdWVzdGlvbiBhbmQgYSByZXF1ZXN0LCBpZiBJIG1heS4NCj4gRGlkIHlvdSBy
dW4gdGhlIHRlc3Qgd2l0aCBhdXRvc3VzcGVuZCBkaXNhYmxlZD8gSWYgc28gY291bGQgeW91IHJl
dGVzdCB3aXRoIGl0DQo+IGVuYWJsZWQ/DQoNCkkgaGF2ZSBvbmx5IHRlc3RlZCB3aXRoIGF1dG9z
dXNwZW5kIGVuYWJsZWQuDQoNCj4gU2Vjb25kbHkgY291bGQgeW91IHJ1biB0ZXN0cyB3aXRoDQo+
IA0KPiBjb21taXQgN2M4ZjdhZjA3OGE0ZWRhNzNmMzQ3NjY3ZDEyNTg0NzM2ZTYxMzA2Mg0KPiBB
dXRob3I6IE9saXZlciBOZXVrdW0gPG9uZXVrdW1Ac3VzZS5jb20+DQo+IERhdGU6ICAgVGh1IE1h
ciA1IDExOjE2OjAyIDIwMjAgKzAxMDANCj4gDQo+ICAgICBjZGMtYWNtOiBjbG9zZSByYWNlIGJl
dHJ3ZWVuIHN1c3BlbmQoKSBhbmQgYWNtX3NvZnRpbnQNCj4gDQo+IG5vdCBhcHBsaWVkIChyZXNw
ZWN0aXZlbHkgcmV2ZXJ0ZWQpIHdpdGggYW5kIHdpdGhvdXQgYXV0b3N1c3BlbmQ/DQoNCkkgcmFu
IGEgdGVzdCB3aXRoIHRoaXMgY29tbWl0IHJldmVydGVkIGFuZCBzYXcgbm8gZGlmZmVyZW5jZSBp
biBiZWhhdmlvci4NCmkuZSB3ZSBkbyBub3QgZ2V0IGV2ZW50IHNwYW0gd2l0aCB0aGlzIGNvbW1p
dCByZXZlcnRlZC4NCkkgdGVzdGVkIHdpdGggZW5hYmxlZCBhbmQgZGlzYWJsZWQgYXV0b3N1c3Bl
bmQuDQoNCj4gDQo+IAlSZWdhcmRzDQo+IAkJT2xpdmVyDQo+IA0KPiBQUzogV2hlbiBJIHN1Ym1p
dCB1cHN0cmVhbSwgbWF5IEkgYWRkIHlvdXIgJ1Rlc3RlZC1ieSc/DQoNClN1cmUsIHlvdSBjYW4g
YWRkIG1lLCBidXQgSSBoYXZlIG9ubHkgdGVzdGVkIHRoYXQgdGhpcyBzcGVjaWZpYyBwcm9ibGVt
DQpzZWVtcyB0byBiZSBzb2x2ZWQuIFRoZSBub3JtYWwgZnVuY3Rpb25hbGl0eSBoYXMgbm90IGJl
ZW4gdGVzdGVkICBwcm9wZXJseSB5ZXQNCm9uIG91ciBzaWRlLiANCg0KLy9Kb25hcw0K
