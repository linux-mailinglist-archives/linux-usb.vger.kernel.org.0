Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C20EF183517
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 16:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbgCLPh3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 11:37:29 -0400
Received: from mail.actia.se ([195.67.112.82]:26887 "EHLO mail.actia.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726731AbgCLPh3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 11:37:29 -0400
Received: from S036ANL.actianordic.se (192.168.16.117) by
 S035ANL.actianordic.se (192.168.16.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Mar 2020 16:37:26 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.1913.007; Thu, 12 Mar 2020 16:37:26 +0100
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
Thread-Index: AdXxbFdECZ2tmAAoQZaxVkfgHyprqgABZ9yAAAiGryAAIGdeAAAEO3aAAAR/HgAARX+KgACtYMrAACnez4AABbFG8AAAO9EAAACaYAAAA7I5cAAHmbfw///2mYD//wJNQIACMDyA///DfRCAAgXegP//0HQw
Date:   Thu, 12 Mar 2020 15:37:26 +0000
Message-ID: <e350119c78284ab28775d2dd5b85c17e@actia.se>
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
         <ad6b4f2d72f84726a398b41007839f77@actia.se>
 <1584020739.20566.10.camel@suse.com>
In-Reply-To: <1584020739.20566.10.camel@suse.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.11.14.24]
x-esetresult: clean, is OK
x-esetid: 37303A2914C9726A627161
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQo+IEhpLA0KPiANCj4gdGhhbmsgeW91LiBJbiB0aGlzIGNhc2UgaXQgbG9va3MgbGlrZSB0aGUg
d2lzZXN0IGNvdXJzZSBpcyB0byB3YWl0IGEgZmV3IGRheXMgdGhlbi4NCj4gVGhhbmsgeW91IGZv
ciB0aG9yb3VnaCB0ZXN0aW5nLg0KPiANCj4gCVJlZ2FyZHMNCj4gCQlPbGl2ZXINCg0KSSB3aWxs
IG1ha2Ugc3VyZSBzb21lIG1vcmUgdGVzdGluZyBpcyBkb25lIGFuZCB0aGUgZ2V0IGJhY2sgdG8g
eW91Lg0KDQpEbyB5b3UgaW50ZW5kIHRvIHB1c2ggdGhlICIgY2RjLWFjbTogY2xvc2UgcmFjZSBi
ZXRyd2VlbiBzdXNwZW5kKCkgYW5kIGFjbV9zb2Z0aW50Ig0KY29tbWl0IHVwc3RyZWFtIGFzIHdl
bGw/IEkgd29uZGVyIHNpbmNlIHlvdSBhc2tlZCBtZSB0byB0ZXN0IHdpdGhvdXQgaXQuDQoNCkkg
d2FudCB0byBtYWtlIHN1cmUgSSBydW4gdGVzdHMgd2l0aCB0aGUgaW50ZW5kZWQgcGF0Y2ggc2V0
Lg0KDQpCUiwNCkpvbmFzDQo=
