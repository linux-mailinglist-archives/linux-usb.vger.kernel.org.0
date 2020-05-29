Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA6E1E78A5
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 10:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgE2Iqg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 04:46:36 -0400
Received: from mail-eopbgr100091.outbound.protection.outlook.com ([40.107.10.91]:12416
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726064AbgE2Iqf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 May 2020 04:46:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNDj3NPpgi4GI9ux3x2OMK7aQ9ob9e+a1nV2KpNhrmbJ7IRMnLRLu8oJVFb7JvNmQ1i6thc6//P4OvHfgRlsbHyaR7A1TD1Mo0NUESQ1zwrob6GCgmfx1M/hGZI6rUs+3sImAPntCXfl1Ct2jtPOglQN134tBFb0rxRO/aEiahBL5xsvvDlOgUWAnH72H6FBtQKRnkqYy8PaprHLl9MtBzl5e3qpI42+rhi/6r0gyZ4/mGPV00wJO//8/MGMXNGOl3jmLQ3WbHWtAWvS13tlh+hzWJ6PXp61ugYC6wB9YV7EwFQTBz30i76Qx1SQDuet8aBXUfx2AnZx6C2km28wnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTAGfahhfnXYOtuk6Dp9qgWIj8XXfg0cC1wURG2pb7Y=;
 b=PJecfQaXGT7t13YEhKAfp099vEUljKB6iWShsm/ZSoyRDn/k/vbyzcDnryf3KDfHj2WbtxxtQcwPf6uj3hfTrycDj2mjQ5k1+55VCW8rPGXtKtIL9jHCLVuKG0R2RZKilhs8eDTIQVZ2bKhYad1vFuvhzqIFdw9O2pbislwLqYiFM45L7lv1qRrBrmSFVacy1CqZNEIVNGi3L8gDGBLGUdNzf6byVVm97xgcWRH2axw/V/En0oZX75LXayOqOGdERQ5ZouIHKhiM0P97S9nDn3uNbX88jTCen/O3jyqPsZk4u004VqpSyxuXtrzI3D/9gcVEWvIH1tEi2DJk0PGwqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cambrionix.com; dmarc=pass action=none
 header.from=cambrionix.com; dkim=pass header.d=cambrionix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CambrionixLtd.onmicrosoft.com; s=selector2-CambrionixLtd-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTAGfahhfnXYOtuk6Dp9qgWIj8XXfg0cC1wURG2pb7Y=;
 b=MZlL4z8nRSBWie+POm9QB1OmyL51YjtznKGtjPbpZnViGHsCDPzvkt0u/q8qiwzU8DdYZYSJ6OsbSAjmdOHcMiqWqPXWEM3juhEYft0l5UOcQLv0WPB/HqdpKCuzf+9HbDE3MsAtAy08C08AgD43k+gmUG+bPX8IXpEa0nTwCRs=
Received: from CWXP265MB2408.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:75::13)
 by CWXP265MB0022.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:2f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18; Fri, 29 May
 2020 08:46:32 +0000
Received: from CWXP265MB2408.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c8ea:9829:77d3:2529]) by CWXP265MB2408.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c8ea:9829:77d3:2529%5]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 08:46:31 +0000
From:   Andrew Goodbody <andrew.goodbody@cambrionix.com>
To:     Alexandru M Stan <amstan@chromium.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Doug Anderson <dianders@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Evan Green <evgreen@chromium.org>
Subject: RE: Splitting 1 USB port between 2 devices
Thread-Topic: Splitting 1 USB port between 2 devices
Thread-Index: AQHWNXCG4StNeDDY80e/5AiS29v/b6i+u6RA
Date:   Fri, 29 May 2020 08:46:31 +0000
Message-ID: <CWXP265MB240835509525CEB493DAE648858F0@CWXP265MB2408.GBRP265.PROD.OUTLOOK.COM>
References: <CAHNYxRzH3F7r4A3hOJYWw8fwoSLBESyyN7XQ4HYfw1Y3qoNbJg@mail.gmail.com>
In-Reply-To: <CAHNYxRzH3F7r4A3hOJYWw8fwoSLBESyyN7XQ4HYfw1Y3qoNbJg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none
 header.from=cambrionix.com;
x-originating-ip: [51.7.243.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51d3cde3-29c4-413b-3777-08d803acc94d
x-ms-traffictypediagnostic: CWXP265MB0022:
x-microsoft-antispam-prvs: <CWXP265MB00229A61311147888FA14473858F0@CWXP265MB0022.GBRP265.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: myanaj1bKqgNKSa3KlGhxKQPVZArPFdxO5oCxOQ0IUUS//67jZJAZuItlXCl0x4usVpylIxc4VhF7htheWraiA+szgpI8x8eq5Z8jgP547XxD6/IhhEgX1js5QMBfTbPhKzwadG7YlrToE7vgEUKAHWCS/xDQXxJWFgoJbvD6u4NPua/Tx066kesul1oZcupG3YeRChdic98MLW77dSfXzAHfaNRpjCaCT+TEv7IQ1Pl+jmW9RemncwurIKNR0srcv0edxZ5qso/p8a9TMVlvEH6H9oUTJ+lU+sOm9pouzf4dObz5gfVC312XNAEMqWbg/bUhpLI2vcsBQGJxYpLMQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWXP265MB2408.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(39830400003)(346002)(396003)(366004)(71200400001)(55016002)(66476007)(64756008)(9686003)(186003)(508600001)(66446008)(2906002)(26005)(66946007)(66556008)(5660300002)(7696005)(6506007)(316002)(54906003)(110136005)(52536014)(44832011)(83380400001)(86362001)(4326008)(8936002)(76116006)(33656002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ATGm3ZX+/5wvrkgIIzBK7LGFm1MBEv09g3+++ji9oZWSmMIgPoC3Q8ZS8dfafHS+l53p4BFAhCJHYera4/qfaar3SnKIZtYB4im++idYLC+5+Px3bX8HeeNCmMRg51k1lc0q3BXE4zu1kLLSZC/VwSkI34Vf3Nt8JE2qEnCHT5QQDJKcfFOIrOgaPpQWzqFGs1PiXt9sinux70T0dSazFDs72qaBkSFIaTZJkIzslYeWlIGfbF5dkNuUNs4L2nKTn5GhvcL+2aACwMAKNk2QTDtzxRqX4ij7H24TYkV5oe8tVqxcAasAvqSoMEua4UGiyVUJb+UXD4vx1uOW0crExnlOWkp4mvC/Okr8I8qG0z076fJ4OXJGYtnvgdpXiQR/23x7loTOj8Nf/7oqwiayGu9r7E4sjDGr7ENVjKoRCljgzuQLmrsLcUQxGrY3FNKoeGR33JxGCDi5ZdYPa/Cx42S7bQy88cvN2foi3umW7Fs=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cambrionix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d3cde3-29c4-413b-3777-08d803acc94d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 08:46:31.8518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6eddda96-aa38-44c8-ab83-12529d9cab1f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pSfTdl+hM4cWNYIuE7li3NLXQFy3sQm6PzdJ4crn5ZDBkzfa4lIauOLEeSK7FvxjQ5tyUPjQjif5k16jNL+ycNLqP0qNaMJXOOuG1tk61sU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB0022
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBsaW51eC11c2Itb3duZXJAdmdl
ci5rZXJuZWwub3JnIDxsaW51eC11c2ItDQo+IG93bmVyQHZnZXIua2VybmVsLm9yZz4gT24gQmVo
YWxmIE9mIEFsZXhhbmRydSBNIFN0YW4NCj4gSGVsbG8sDQo+IA0KPiBJJ20gY3VycmVudGx5IGhl
bHBpbmcgdG8gZGVzaWduIHRoZSBoYXJkd2FyZSBmb3IgeWV0IGFub3RoZXIgY2hyb21lYm9vay4N
Cj4gDQo+IFRoZSBwYXJ0aWN1bGFyIFNPQyAoYW5kIG1vc3Qgb3RoZXIgYWx0ZXJuYXRpdmVzIEJU
SCkgd2UncmUgdXNpbmcgaGFzIGENCj4gbGltaXRlZCBhbW91bnQgb2YgVVNCIGNvbnRyb2xsZXJz
IGF2YWlsYWJsZSwgdXN1YWxseSBqdXN0IDEuIEJlaW5nIGENCj4gY2hyb21lYm9vayB3ZSBoYXZl
IHF1aXRlIGEgZmV3IG5lZWRzIGZvciBVU0IgdGhvdWdoOiAyIHR5cGUgQyBwb3J0cywNCj4gcG9n
byBwaW5zIGZvciBhIGNvbm5lY3RlZCBrZXlib2FyZCwgMiBjYW1lcmFzLCBhIHR5cGUgQSBwb3J0
LiBXZSdyZQ0KPiBwcm9iYWJseSBnb2luZyB0byBoYXZlIGFuIGludGVybmFsIGh1YiBubyBtYXR0
ZXIgd2hhdCwgYnV0IGl0IGxvb2tzIGxpa2UgZXZlbg0KPiBhIDQgcG9ydCBodWIgbWlnaHQgbm90
IGJlIGVub3VnaCwgZ29pbmcgdG8geWV0IGEgYmlnZ2VyIGh1YiAod2hpY2ggbWlnaHQgbm90DQo+
IGJlIGFzIHBvd2VyIGVmZmljaWVudCkgaXMgbm90IGlkZWFsLCBjaGFpbmluZyBodWJzIHRoYXQg
YXJlIGJ1aWx0aW4gaXMgYWxzbyBtZWguDQo+IA0KPiBJIG5vdGljZWQgdGhhdCBzb21lIG9mIG91
ciBjYW1lcmFzIHVzZSB0aGUgVVNCMy4wIGxpbmVzIG9ubHkuIE90aGVyIGNhbWVyYXMsDQo+IHNp
bmNlIHRoZXkncmUgbG93ZXIgcmVzb2x1dGlvbiBvbmVzIHVzZSBvbmx5IFVTQjIuMC4gSSB3b25k
ZXJlZCB3aGF0IHdvdWxkDQo+IGhhcHBlbiBpZiB0aGUgMiB0eXBlcyBvZiBjYW1lcmFzIHdlcmUg
dG8gc2hhcmUgYSBwb3J0LCBzaW5jZSBub25lIG9mIHRoZSBkYXRhDQo+IGxpbmVzIGFyZSBjb21t
b24gYmV0d2VlbiB0aGVtLg0KPiANCj4gSSd2ZSBidWlsdCBhIGxpdHRsZSBjb250cmFwdGlvbiB0
byB0ZXN0IHRoaXMuIEl0IHNlZW1zIHRvIHdvcmsgYXMgaW50ZW5kZWQuIEJvdGgNCj4gdXNiIGNh
bWVyYXMgc2VlbSB0byBlbnVtZXJhdGUsIEkgY2FuIGV2ZW4gc3RyZWFtIGZyb20gYm90aCBhdCB0
aGUgc2FtZQ0KPiB0aW1lIHdpdGggbm8gcHJvYmxlbS4gQSBtYWNib29rIHNlZW1zIHRvIGFsc28g
a2luZCBvZiB3b3JrIChJIGNhbid0IHN0cmVhbQ0KPiBmcm9tIGJvdGggZm9yIHNvbWUgcmVhc29u
LCBidXQgaSBjYW4gb3BlbiBlaXRoZXIgSSB3YW50KS4gSSBjYW4gdXBsb2FkDQo+IGRldGFpbGVk
IGxzdXNiIG91dHB1dHMgaWYgbmVlZGVkLg0KPiANCj4gTXkgcXVlc3Rpb24gaGVyZSBpczogaXMg
dGhpcyBsZWdhbCBhcyBmYXIgYXMgTGludXggaXMgY29uY2VybmVkPyBDYW4gMiBkZXZpY2VzDQo+
IGJlIGVudW1lcmF0ZWQgdW5kZXIgb25lIHBoeXNpY2FsIHBvcnQgKGV2ZW4gdGhvdWdoIHdlJ3Jl
IHRhbGtpbmcgYWJvdXQNCj4gc2VwYXJhdGUgdXNiMi4wIGFuZCAzLjAgYnVzIHRvcG9sb2dpZXMp
Lg0KPiANCj4gSXQgc2VlbXMgdG8gd29yayBzbyBmYXIgd2l0aCBvdXIgbGludXggNS40IGNocm9t
ZSBvcyBmb3JrICh3aGljaCBhcyBmYXIgYXMgSQ0KPiBrbm93IGlzIGlkZW50aWNhbCB0byA1LjQg
TFRTIGZvciBtYXR0ZXJzIGNvbmNlcm5pbmcgdXNiKS4gQnV0IHRoZSBxdWVzdGlvbiBpcw0KPiB3
b3VsZCB0aGlzIGtlZXAgd29ya2luZz8NCj4gDQo+IElzIHRoZXJlIGFueSB3ZWlyZCBwb3J0IHJl
c2V0IGludGVyYWN0aW9uIHRoYXQgbWlnaHQgYmUgYW5ub3lpbmcgaGVyZT8NCj4gSSB3b3VsZG4n
dCB3YW50IGEgcmVzZXQgb24gdGhlIHVzYiAyLjAgZGV2aWNlIHRvIGFmZmVjdCB0aGUgMy4wIGRl
dmljZS4NCj4gDQo+IElzIHRoZXJlIGFueSBvdGhlciBoaWdoZXIgbGV2ZWwgcG9ydCBtYW5hZ2Vt
ZW50IGdvaW5nIG9uIGluIGxpbnV4LCB3aGVyZQ0KPiB0aGVyZSBtaWdodCBiZSBwbGFucyB0byBr
ZWVwIHRyYWNrIG9mIHRoaW5ncywgYnV0IGl0J3Mgbm90IHBpcGVkIGVub3VnaCB0byBzZWUNCj4g
aXQgYWZmZWN0IChuZWdhdGl2ZWx5KSB0aGlzIHVzZSBjYXNlLg0KPiANCj4gSWYgdGhpcyBpcyBv
aywgd2FzIHNvbWV0aGluZyBsaWtlIHRoaXMgZXZlciBkb25lIGJlZm9yZT8NCg0KSSBjYW5ub3Qg
c3BlYWsgZm9yIG90aGVyIFVTQiBodWJzIGJ1dCB0aGUgVVNCNzIwNiB0aGF0IEkgYW0gd29ya2lu
ZyB3aXRoIGF0IHRoZSBtb21lbnQgaGFzIGFuIG9wdGlvbiB0byBzcGxpdCBwb3J0cyB0aGlzIHdh
eSBmb3Igbm9uLXJlbW92YWJsZSBkZXZpY2UgdXNhZ2UuIFNvIEkgd291bGQgc2F5IHRoYXQgeW91
IG5lZWQgYSBodWIgdGhhdCBzcGVjaWZpY2FsbHkgaGFzIGEgY29uZmlndXJhdGlvbiBvcHRpb24g
dG8gbWFrZSB0aGlzIHdvcmsgY29ycmVjdGx5LiBKdXN0IHRyeWluZyB0byBkbyBpdCB3aXRob3V0
IHRoYXQgc3VwcG9ydCBpcyBhbG1vc3QgYm91bmQgdG8gbGVhZCB0byB3ZWlyZCBwcm9ibGVtcyBz
dWNoIGFzIHlvdSBzZWUgd2l0aCBvbmx5IGJlaW5nIGFibGUgdG8gc3RyZWFtIGZyb20gb25lIGRl
dmljZS4NCg0KPiBCb251cywgbWF5YmUgdW5yZWxhdGVkLCBxdWVzdGlvbjogSSd2ZSB3b25kZXJl
ZCBpbiB0aGUgcGFzdCBpZiBpdCdzIGxlZ2FsIHRvDQo+IHJvdXRlIDIuMCBhbmQgMy4wIGxpbmVz
IHRocm91Z2ggZGlmZmVyZW50IHBhdGhzLg0KPiANCj4gRm9yIGV4YW1wbGUsIGltYWdpbmUgSSBo
YWQgb25lIG9mIGVhY2g6DQo+ICAqIDIrMy4wIGNvbnRyb2xsZXINCj4gICogMiszLjAgZGV2aWNl
IChlZyBhIDMuMCB0eXBlIEEgcG9ydCkNCj4gICogMi4wIGRldmljZSAob2xkZXIgdXNiIGRldmlj
ZSkNCj4gDQo+IFdvdWxkIGl0IGJlIGxlZ2FsIHRvIHVzZSBvbmx5IGEgMi4wIGh1Yiwgd2l0aCB0
aGUgMy4wIGRhdGEgbGluZXMgZm9yIHRoZSAzLjANCj4gZGV2aWNlIGJ5cGFzc2luZyB0aGUgaHVi
LiBUaGlzIHdvdWxkIGJlIGNoZWFwZXIgdGhhbiBoYXZpbmcgYSBmdWxseSBmbGVkZ2VkDQo+IDIr
My4wIGh1YiB3aXRoIHRoZSBzZWNvbmQgcG9ydCdzIDMuMCBkYXRhIGxpbmVzIHdhc3RlZC4NCg0K
SW4gbXkgd29yayBJIG5lZWQgdG8gYmUgYWJsZSB0byBtYXAgdGhlIHBoeXNpY2FsIGhhcmR3YXJl
IHBvcnRzIG9mIGEgcmVtb3ZhYmxlIGRldmljZSBvbnRvIHRoZSBVU0IgdHJlZS4gSGF2aW5nIHRo
ZSBVU0IzIHRyZWUgYW5kIHRoZSBVU0IyIHRyZWUgZGlmZmVyIGxpa2UgdGhpcywgb24gYW4gZXh0
ZXJuYWwgcG9ydCwgd291bGQgZ2l2ZSBtZSBhIHJlYWxseSBiYWQgZGF5LiBTbyBiYWQgdGhhdCBJ
IHdvdWxkIGJlIHRlbXB0ZWQgdG8gZmluZCB0aGUgZGVzaWduZXIsIGluIHBlcnNvbiwgdG8gdGVh
Y2ggdGhlbSB0aGUgZXJyb3Igb2YgdGhlaXIgd2F5cy4g8J+YiSBQbGVhc2UgYnVyeSB0aGlzIGlk
ZWEgd2hlcmUgaXQgd2lsbCBuZXZlciBzZWUgdGhlIGxpZ2h0IG9mIGRheSBhZ2Fpbi4NCg0KPiBU
aGFua3MsDQo+IEFsZXhhbmRydSBTdGFuIChhbXN0YW4pDQo=
