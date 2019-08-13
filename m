Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F22838B89E
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2019 14:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbfHMMds (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 08:33:48 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:2349 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727837AbfHMMds (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Aug 2019 08:33:48 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d52ae2b0000>; Tue, 13 Aug 2019 05:33:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 13 Aug 2019 05:33:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 13 Aug 2019 05:33:45 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 13 Aug
 2019 12:33:45 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 13 Aug
 2019 12:33:44 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (104.47.33.53) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 13 Aug 2019 12:33:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAe8QRhj4lXtPdpyHTB3vkE+ILlaOEyjot0IO+K4La6I7/j/t/PscFBdc20s3LtxcyjWJdeWWGahRe5JVCAhkbl8eTfhprxxTZ9eUjtw6j0g7V9P/GXnjsSP/mNiFi7JKfPVIdC72LXToaX8CBAE6T7B7T03KqtjTeM/AuwxiHmVITMk170y+t3gM24RFmRPBXTA9QU9xbvEMtT+3xTJnLfgmcZWaB7fuKfi08DT7gbnIr5qmtb7yuVdrXiPkW9dynjMpz7+HooTwBLqX2ozlPOTLbeoF6WcgYjZylHSTYtg/hf6iHnC1ryuL2BGkKJ+6IpurEre8l8iVfc1ujWsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k74/7i6zr2AO8cm9Rr+mReR3CtGpF8H/oq0utZ2Gr0E=;
 b=oSjBTbX96fEUfYggpWOYkpDb2b4Z3WF7sv0VYPUcx1rh5PohLi6oXTf/9HbVJBe6liG4Pm9B0L6yuGq6YI//aLvkA67ZAqn29vW5m/pEokkydUS1eFIaX+cAKohUp3gWDJuvajstkvRvh/qgF4J5nMDram99c9zykd6TUzEDKH2w8piXE2xCBdeRwyOb/nTBKh13fQKB57XDjkJS8JQh1d8C9R5RT+l3R/6qSJx9zx31diSlPoe0uvKOI6i8DfQEOPVysGxTFZsAUgb8vb/qUo6utw9IzeTry8ZZd3l8KXbyGnFUGhSMQwNQ+hm7q6j1o7VTnyHkUB684RTyqmvv5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3215.namprd12.prod.outlook.com (20.179.82.97) by
 MN2PR12MB3727.namprd12.prod.outlook.com (10.255.236.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Tue, 13 Aug 2019 12:33:43 +0000
Received: from MN2PR12MB3215.namprd12.prod.outlook.com
 ([fe80::35d3:6fe5:123b:1899]) by MN2PR12MB3215.namprd12.prod.outlook.com
 ([fe80::35d3:6fe5:123b:1899%6]) with mapi id 15.20.2157.020; Tue, 13 Aug 2019
 12:33:43 +0000
From:   Rick Tseng <rtseng@nvidia.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Oliver Neukum <oneukum@suse.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] xhci: wait CNR when doing xhci resume
Thread-Topic: [PATCH] xhci: wait CNR when doing xhci resume
Thread-Index: AQHVUN8QRUyw1U1s5ESzq3u8ufnC4Kb3K6yAgAG5ToCAABGjfg==
Date:   Tue, 13 Aug 2019 12:33:43 +0000
Message-ID: <MN2PR12MB3215AA4B411231FC2D67E81FB1D20@MN2PR12MB3215.namprd12.prod.outlook.com>
References: <1565594692-23683-1-git-send-email-rtseng@nvidia.com>
 <1565597989.14671.3.camel@suse.com>,<47f0e5d6-145c-4542-362f-dbb4cccb514d@linux.intel.com>
In-Reply-To: <47f0e5d6-145c-4542-362f-dbb4cccb514d@linux.intel.com>
Accept-Language: zh-TW, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=rtseng@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1bc1c9a-47fc-493e-2145-08d71fea7a90
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MN2PR12MB3727;
x-ms-traffictypediagnostic: MN2PR12MB3727:
x-microsoft-antispam-prvs: <MN2PR12MB3727D2CDBB660BA6B7069B51B1D20@MN2PR12MB3727.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:176;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(136003)(396003)(366004)(39860400002)(376002)(189003)(199004)(110136005)(14454004)(66476007)(66446008)(66556008)(64756008)(7736002)(33656002)(71200400001)(55016002)(256004)(74316002)(99286004)(2501003)(229853002)(5660300002)(316002)(305945005)(6436002)(66946007)(91956017)(76116006)(9686003)(11346002)(71190400001)(52536014)(478600001)(2201001)(66066001)(86362001)(476003)(81166006)(102836004)(186003)(486006)(53936002)(25786009)(2906002)(6116002)(6506007)(8676002)(76176011)(446003)(26005)(8936002)(6246003)(7696005)(81156014)(3846002)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB3727;H:MN2PR12MB3215.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eeYJI6DAkvvrA0nn86IhUE2VrsLpB9Qfsly294j3XXtQx7mPkR7+yHd5hJ/m4ru7S+CdEDTH+tnNto1Iwpz1GpfnnyjTr2r06zOh3acbINk7ghOTN+V0kmCxvFFpJ2MT0+x17wRGm+hu6GH8RVn3tOB/47LhuvT8iG+LtU0rMKOBf+LcRBGCqH56fFmz767yPETHsQEBJpuMW4gCWrUxlEfxnW+vM4PC/HFg2Zuw+a9Cf8aQNji5Rt0GB86ykg8Tbk+8WvUYYWq+NUjVa6A6hb8nRpT7cFUKHy1nCbpK/BgzW9UiV/XI0MtLluN2uicNcEn5qHGVavM1/wWsn9S+DFlrkmuE0PrQmVd3yHB/tQbtND2qvjP+HWO6Egx6X8BT+ucvxGeR2sDZvS2dbAWeZLfgKyJYqedZLsOrLvG81Bw=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bc1c9a-47fc-493e-2145-08d71fea7a90
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 12:33:43.4079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x892BDgQJMAwD7szpmFRMM0RKeAvI6EDQRcDqzcEoupm6cUIPT1osltIq8E6iYH7+Ho+HYtcHHpsqYH1F5BdGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3727
X-OriginatorOrg: Nvidia.com
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1565699627; bh=k74/7i6zr2AO8cm9Rr+mReR3CtGpF8H/oq0utZ2Gr0E=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-forefront-prvs:
         x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam-message-info:
         x-ms-exchange-transport-forked:MIME-Version:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=fe1XOobLzcjG2wzaVgeN4k1anFIueQlzJeben6I67Zn/jZy6c1h7NVBxfzTf3XJLr
         swkFg9nQCGJVkZVQnJQ8+UfxRfT54npHDuDk9aPdOJxjK1rkXui1rM6yxtt0EYAAuL
         THY6gP1Q9ybEnty46alQJYNDs3hkkYgaU5v7jVkiq2VZdOu1+oaGPGg2aAIMc1Z4Sg
         i+pzbB+Nb8ZmPZaEeOc0O/MJ4csLh7g5BqgQIcoVQ14qPHQGIJkFaH0C3pV7y6Wrr+
         Fxf9V13RcFs/2fkG07i0c8HPMGXmPA1lPEsVP64e8m68nDGfiVxoB7l0CGwlVHkkV7
         TW5Tkvug3/v2Q==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWF0aGlhcywNCg0KVGhhbmtzIGZvciBzdWdnZXN0aW9uLg0KVGhlIHJlYXNvbiBJIGRvIG5v
dCB1c2UgeGhjaV9oYW5kc2hha2UoKSBpcyB3ZSBnZXQgYnVpbGQgZmFpbCB3aGVuIGNvbmZpZ3Vy
aW5nIGJlbG93IGFzIG1vZHVsZToNClVTQl9YSENJX0hDRCA9IG0NClVTQl9YSENJX1BDSSA9IG0N
Cg0KRmFpbCBtZXNzYWdlIGFzIGJlbG93Og0KRVJST1I6ICJ4aGNpX2hhbmRzaGFrZSIgW2RyaXZl
cnMvdXNiL2hvc3QveGhjaS1wY2kua29dIHVuZGVmaW5lZCENCg0KU28gSSB3cml0ZSBteSBvd24g
ZnVuY3Rpb24gdG8gY2hlY2sgQ05SLg0KDQpUaGFua3MsDQpSaWNrDQoNCi0tDQpudnB1YmxpYw0K
DQogIA0K5a+E5Lu26ICFOiBNYXRoaWFzIE55bWFuIDxtYXRoaWFzLm55bWFuQGxpbnV4LmludGVs
LmNvbT4NCiDlr4Tku7bml6XmnJ86IDIwMTnlubQ45pyIMTPml6Ug5LiK5Y2IIDAzOjM5DQog5pS2
5Lu26ICFOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPjsgUmljayBUc2VuZyA8cnRz
ZW5nQG52aWRpYS5jb20+OyBtYXRoaWFzLm55bWFuQGludGVsLmNvbSA8bWF0aGlhcy5ueW1hbkBp
bnRlbC5jb20+OyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZyA8Z3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc+DQog5Ymv5pysOiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIDxsaW51eC11c2JA
dmdlci5rZXJuZWwub3JnPg0KIOS4u+aXqDogUmU6IFtQQVRDSF0geGhjaTogd2FpdCBDTlIgd2hl
biBkb2luZyB4aGNpIHJlc3VtZSANCsKgICANCiANCk9uIDEyLjguMjAxOSAxMS4xOSwgT2xpdmVy
IE5ldWt1bSB3cm90ZToNCiA+IEFtIE1vbnRhZywgZGVuIDEyLjA4LjIwMTksIDE1OjI0ICswODAw
IHNjaHJpZWIgUmljayBUc2VuZzoNCiA+PiBGcm9tOiBSaWNrIDxydHNlbmdAbnZpZGlhLmNvbT4N
CiA+Pg0KID4+IE5WSURJQSAzLjEgeEhDSSBjYXJkIHdvdWxkIGxvc2UgcG93ZXIgd2hlbiBtb3Zp
bmcgcG93ZXIgc3RhdGUgaW50byBEM0NvbGQuDQogPj4gVGh1cyB3ZSBuZWVkIHRvIHdhaXQgQ05S
IGJpdCB0byBjbGVhciB3aGVuIHhoY2kgcmVzbXVlIGFzIHhoY2kgaW5pdC4NCiA+IA0KID4gU2hv
dWxkIGFueSBjb250cm9sbGVyIGhhdmUgQ05SIHNldD8gV2h5IGlzIHRoaXMgc3BlY2lmaWMgdG8g
YSB2ZW5kb3I/DQogPiANCiANCiBHb29kIHBvaW50LCBhbHdheXMgY2hlY2tpbmcgQ05SIGluIHJl
c3VtZSBzb3VuZHMgbGlrZSBhIGdvb2QgaWRlYS4NCiANCiBBbmQgdXNlIHhoY2lfaGFuZHNoYWtl
KCkgYXMgRmVsaXBlIHBvaW50ZWQgb3V0LCBqdXN0IGxpa2UgaW4geGhjaV9yZXNldCgpOg0KIA0K
IHJldCA9IHhoY2lfaGFuZHNoYWtlKCZ4aGNpLT5vcF9yZWdzLT5zdGF0dXMsIFNUU19DTlIsIDAs
IDEwICogMTAwMCAqIDEwMDApOw0KIA0KIFJpY2ssIHdvdWxkIHlvdSBsaWtlIHRvIHdyaXRlIGEg
cGF0Y2ggZm9yIHRoaXM/DQogDQogLU1hdGhpYXMNCiANCiANCiAgICAg
