Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3DE18F3CF
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2020 12:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgCWLhQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Mar 2020 07:37:16 -0400
Received: from mail.actia.se ([195.67.112.82]:43334 "EHLO mail.actia.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728115AbgCWLhP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Mar 2020 07:37:15 -0400
Received: from S036ANL.actianordic.se (192.168.16.117) by
 S036ANL.actianordic.se (192.168.16.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 23 Mar 2020 12:37:12 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.1913.007; Mon, 23 Mar 2020 12:37:12 +0100
From:   Jonas Karlsson <jonas.karlsson@actia.se>
To:     Jonas Karlsson <jonas.karlsson@actia.se>,
        Oliver Neukum <oneukum@suse.com>,
        Fabio Estevam <festevam@gmail.com>
CC:     Peter Chen <peter.chen@nxp.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: USB transaction errors causing RCU stalls and kernel panics
Thread-Topic: USB transaction errors causing RCU stalls and kernel panics
Thread-Index: AdXxbFdECZ2tmAAoQZaxVkfgHyprqgABZ9yAAAiGryAAIGdeAAAEO3aAAAR/HgAARX+KgACtYMrAACnez4AABbFG8AAAO9EAAACaYAAAA7I5cAAHmbfw///2mYD//wJNQIACMDyA///DfRCAAgXegP/6FcLw/+jhYnA=
Date:   Mon, 23 Mar 2020 11:37:12 +0000
Message-ID: <13e0812aee614791bf772481adb4aefb@actia.se>
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
         <1583838270.11582.11.camel@suse.com>
 <1583839306.11582.12.camel@suse.de>
         <325d5af5d4c44eafac94fc8e0e4d1a7d@actia.se>
         <c671a51d6b5642078367d681643c46af@actia.se>
         <CAOMZO5BURqWDXKXiwLzG=BRC_wJkjZ1d_HaLt_tefjk3GrabDw@mail.gmail.com>
         <fc2d27c17ebc409ea8c318c22ac1f4a7@actia.se>
         <1583922523.20566.4.camel@suse.com>
         <ad6b4f2d72f84726a398b41007839f77@actia.se>
 <1584020739.20566.10.camel@suse.com>
 <1a91d611631c49b58c0d9fb8e5671b7e@actia.se>
In-Reply-To: <1a91d611631c49b58c0d9fb8e5671b7e@actia.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.11.14.24]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgT2xpdmVyLA0KDQpIYXZlIHRoZSBwYXRjaGVzIGJlZW4gcmV2aWV3ZWQgYW5kIHdpbGwgYmUg
bWVyZ2VkPw0KDQpCUiwNCkpvbmFzDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogbGludXgtdXNiLW93bmVyQHZnZXIua2VybmVsLm9yZyA8bGludXgtdXNiLW93bmVyQHZn
ZXIua2VybmVsLm9yZz4gT24NCj4gQmVoYWxmIE9mIEpvbmFzIEthcmxzc29uDQo+IFNlbnQ6IGRl
biAxNiBtYXJzIDIwMjAgMDg6MDcNCj4gVG86IE9saXZlciBOZXVrdW0gPG9uZXVrdW1Ac3VzZS5j
b20+OyBGYWJpbyBFc3RldmFtDQo+IDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+IENjOiBQZXRlciBD
aGVuIDxwZXRlci5jaGVuQG54cC5jb20+OyBNYXRoaWFzIE55bWFuDQo+IDxtYXRoaWFzLm55bWFu
QGxpbnV4LmludGVsLmNvbT47IEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsN
Cj4gbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgQWxhbiBTdGVybiA8c3Rlcm5Acm93bGFuZC5o
YXJ2YXJkLmVkdT4NCj4gU3ViamVjdDogUkU6IFVTQiB0cmFuc2FjdGlvbiBlcnJvcnMgY2F1c2lu
ZyBSQ1Ugc3RhbGxzIGFuZCBrZXJuZWwgcGFuaWNzDQo+IA0KPiA+DQo+ID4gSGksDQo+ID4NCj4g
PiB0aGFuayB5b3UuIEluIHRoaXMgY2FzZSBpdCBsb29rcyBsaWtlIHRoZSB3aXNlc3QgY291cnNl
IGlzIHRvIHdhaXQgYSBmZXcgZGF5cyB0aGVuLg0KPiA+IFRoYW5rIHlvdSBmb3IgdGhvcm91Z2gg
dGVzdGluZy4NCj4gPg0KPiA+IAlSZWdhcmRzDQo+ID4gCQlPbGl2ZXINCj4gDQo+IEhpIE9saXZl
ciwNCj4gDQo+IFRoZSBhcHBzIHRlYW0gcmFuIGEgY291cGxlIG1vZGVtIHRlc3RzIHdpdGggdGhl
IHBhdGNoZXMgYW5kIGl0IGxvb2tlZCBnb29kLg0KPiANCj4gQlIsDQo+IEpvbmFzDQo+IA0KDQo=
