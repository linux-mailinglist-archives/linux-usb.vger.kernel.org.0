Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61BAF1810A0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 07:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgCKGZs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Mar 2020 02:25:48 -0400
Received: from mail.actia.se ([195.67.112.82]:39944 "EHLO mail.actia.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725976AbgCKGZr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Mar 2020 02:25:47 -0400
Received: from S036ANL.actianordic.se (192.168.16.117) by
 S036ANL.actianordic.se (192.168.16.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 11 Mar 2020 07:25:43 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.1913.007; Wed, 11 Mar 2020 07:25:43 +0100
From:   Jonas Karlsson <jonas.karlsson@actia.se>
To:     Fabio Estevam <festevam@gmail.com>
CC:     Oliver Neukum <oneukum@suse.de>, Peter Chen <peter.chen@nxp.com>,
        "Mathias Nyman" <mathias.nyman@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: USB transaction errors causing RCU stalls and kernel panics
Thread-Topic: USB transaction errors causing RCU stalls and kernel panics
Thread-Index: AdXxbFdECZ2tmAAoQZaxVkfgHyprqgABZ9yAAAiGryAAIGdeAAAEO3aAAAR/HgAARX+KgACtYMrAACnez4AABbFG8AAAO9EAAACaYAAAA7I5cAAHmbfw///2mYD//wJNQA==
Date:   Wed, 11 Mar 2020 06:25:43 +0000
Message-ID: <fc2d27c17ebc409ea8c318c22ac1f4a7@actia.se>
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
In-Reply-To: <CAOMZO5BURqWDXKXiwLzG=BRC_wJkjZ1d_HaLt_tefjk3GrabDw@mail.gmail.com>
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

SGkgRmFiaW8sDQoNCj4gSGkgSm9uYXMsDQo+IA0KPiBPbiBUdWUsIE1hciAxMCwgMjAyMCBhdCAx
OjA3IFBNIEpvbmFzIEthcmxzc29uIDxqb25hcy5rYXJsc3NvbkBhY3RpYS5zZT4NCj4gd3JvdGU6
DQo+IA0KPiA+IEkgaGF2ZSBhbHNvIF9yZXZlcnRlZF8gdGhpcyBwYXRjaCBhZnRlciByZWNvbW1l
bmRhdGlvbiBmcm9tIE5YUCB0byBhdm9pZA0KPiBSQ1Ugc3RhbGwNCj4gPiBjcmFzaGVzOg0KPiA+
DQo+ID4gY29tbWl0IDA3NzUwNjk3MmJhMjM3NzJiNzUyZTA4YjFhYjcwNTJjZjVmMDQ1MTENCj4g
PiBBdXRob3I6IFBhdWwgRS4gTWNLZW5uZXkgPHBhdWxtY2tAbGludXgudm5ldC5pYm0uY29tPg0K
PiA+IERhdGU6ICAgTW9uIEp1bCA5IDEzOjQ3OjMwIDIwMTggLTA3MDANCj4gPg0KPiA+ICAgICBy
Y3U6IE1ha2UgbmVlZF9yZXNjaGVkKCkgcmVzcG9uZCB0byB1cmdlbnQgUkNVLVFTIG5lZWRzDQo+
IA0KPiBDb3VsZCB5b3UgcGxlYXNlIHRlc3Qgd2l0aG91dCB0aGlzIHJldmVydD8NCj4gDQo+IFRo
YW5rcw0KDQpJIHJlbW92ZWQgdGhlIHJldmVydCBhbmQgaXQgc3RpbGwgd29ya3MgZmluZS4NCg0K
Ly9Kb25hcw0KDQo=
