Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 042F9D79C3
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2019 17:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733165AbfJOP0q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 11:26:46 -0400
Received: from mga02.intel.com ([134.134.136.20]:32317 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbfJOP0p (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Oct 2019 11:26:45 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Oct 2019 08:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,300,1566889200"; 
   d="scan'208";a="395569337"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
  by fmsmga005.fm.intel.com with ESMTP; 15 Oct 2019 08:26:45 -0700
Received: from fmsmsx162.amr.corp.intel.com (10.18.125.71) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 15 Oct 2019 08:26:44 -0700
Received: from bgsmsx110.gar.corp.intel.com (10.223.4.212) by
 fmsmsx162.amr.corp.intel.com (10.18.125.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 15 Oct 2019 08:26:44 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.228]) by
 BGSMSX110.gar.corp.intel.com ([169.254.11.93]) with mapi id 14.03.0439.000;
 Tue, 15 Oct 2019 20:56:41 +0530
From:   "Gopal, Saranya" <saranya.gopal@intel.com>
To:     Roger Quadros <rogerq@ti.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Bin Liu [EP]" <b-liu@ti.com>
CC:     "Nori, Sekhar" <nsekhar@ti.com>
Subject: RE: how to test g_webcam
Thread-Topic: how to test g_webcam
Thread-Index: AQHVgDPmWH0hxtxRWkygI7jFq6u7oqdVDM4AgASlAwCAAAoTAIAADJYAgAAQigCAAVWJAIAAqdJA
Date:   Tue, 15 Oct 2019 15:26:41 +0000
Message-ID: <C672AA6DAAC36042A98BAD0B0B25BDA94CD14A54@BGSMSX104.gar.corp.intel.com>
References: <7c65d743-f6cd-846b-381a-07808c6f4c5a@ti.com>
 <8736fzv3c5.fsf@gmail.com> <a23554e6-4dd7-b252-eda3-4d986d4a80be@ti.com>
 <8736fvh58n.fsf@gmail.com> <922b2947-2d47-19c4-9116-73c5f281de15@ti.com>
 <871rvf8l09.fsf@gmail.com> <75438b39-2233-8865-860a-661cf09bea4b@ti.com>
In-Reply-To: <75438b39-2233-8865-860a-661cf09bea4b@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNmY5MTY0MjAtYzE2Ni00ZGIyLWIzNjctY2IzMjNmZWQzZTVhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibjNQUEVxdlwvOVBucFFkd2p1Qlp6U3FRRndHdlJ1Rm1qQlRhY2RVTlYrREFcLzZQZ3Z2S0ZvZTUzalE3dW5QdVZrIn0=
x-originating-ip: [10.223.10.10]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUXVhZHJvcywNCg0KPiBJIHVzZWQgdGhlIGEgZGlmZmVyZW50IHV2Yy1nYWRnZXQgYXBwbGlj
YXRpb24gZnJvbSB0aGlzIGxvY2F0aW9uIFsxXSBhbmQgaXQgc2VlbXMNCj4gdG8NCj4gd29yayBx
dWl0ZSBmaW5lIHdpdGggYnVpbHRpbiB2aWRlbyBwYXR0ZXJuIGFuZCBqcGcgaW1hZ2UgYnV0IG5v
dCB3aXRoIFY0TDINCj4gY2FwdHVyZSBzb3VyY2UuDQo+IA0KPiBTbyBzb21ldGhpbmcgaXMgYnJv
a2VuIGluIHV2Yy1nYWRnZXQgYXQgWzJdDQo+IA0KPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3ds
aGUvdXZjLWdhZGdldA0KPiBbMl0gaHR0cDovL2dpdC5pZGVhc29uYm9hcmQub3JnL3V2Yy1nYWRn
ZXQuZ2l0DQoNCkkgdGhpbmsgc3VwcG9ydCBmb3IgcGF0dGVybiBhbmQgSlBHIGltYWdlIHdhcyBp
bnRlbnRpb25hbGx5IHJlbW92ZWQgZnJvbSB1dmMtZ2FkZ2V0IHdpdGggdGhpcyBjb21taXQ6DQpo
dHRwOi8vZ2l0LmlkZWFzb25ib2FyZC5vcmcvdXZjLWdhZGdldC5naXQvY29tbWl0ZGlmZi8wMGI4
OTIzMDU2OTRlYTc5NjcyOGMxZjk3ODMxYmMzYzU5YThlM2RhP2hwPTUzYjEzOWEyMjgxMGUwMGFh
MGNlODcyODUzYjQ1MTA3YzRlZGVlOTgNClRoYW5rcywNClNhcmFueWENCj4gDQo+IGNoZWVycywN
Cj4gLXJvZ2VyDQo+IC0tDQo+IFRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxh
bmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLg0KPiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUy
MS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQ0K
