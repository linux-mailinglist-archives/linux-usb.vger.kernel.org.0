Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5772A1F1C8F
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 18:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730404AbgFHQAE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 12:00:04 -0400
Received: from mail-bn8nam12on2086.outbound.protection.outlook.com ([40.107.237.86]:22209
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730231AbgFHQAD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 12:00:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOz+yLCCwEklw8jOG3G3DvGOu3ImDTp9oioGsxdajt/FaAVSoIBQg/O4Ez2r1eEIQbfhJmZgeQQgEfThWynP28fF5oDhn1TUrhHkcYFihvVQ+qgeA8EkJsONVY17BdNW7jCyOQFVTRdjMQveVM+NOpnSsB4NDu4XKwl9TnaJf/VEtqf16Q6zk0RpyVI1zN+c8zdXKtNwj6ipJHCPzzFCgjBGsLxkcQhWYWEiqzCSmBwXC76onaQj3rJU0FgoRlZqD0C77x8F05qxSohtKj8/A4DFWoQWoXOpLjGa6Y+TQAKE8UPd0dzsXOtaTlunptYgwiCB4a4tGfNpNQzceibYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYs13ZZwCe3wVgnF/STltPJ/dGCXN78EIf2KodCsWIQ=;
 b=ft57K1MdgSJBnj96/+5ukgAU9gxwd2wQVPNOArvOv34p5HuSeovc2IVTTMkwCjj4ognspJflaVlcJl/RbI6YImUCkgzkFxCxbTM+bpKeidwuuNnfDAGSRo57SvwrtvKv+UwIhffs0HHIL65KoAjFg/yhiRO5MCoNHVKxxiu4Zthb00x/6v6Qh4ygeuRl6KeyQWHK2v7gFI2YrsJut33Rbf1e5kw2rfhP/ODeZYQggVCRaj/99kW7+BWjE61/oXOpq7arsu+BCtFtAl0pXYJbeaGZPpBpyA+RIK7BAk/r4A7gihs4ry/3vhvbgJ37uNLZYKEjWAffhVZEYP8J+Z51jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYs13ZZwCe3wVgnF/STltPJ/dGCXN78EIf2KodCsWIQ=;
 b=H5FCoBg79+PYQWi08Pjbu4m79ScSjPJTvP7kUH1V0dFFqZSRVOn9ZnXZwrMTBHWGXzF3l72iQMV13fK5R+gc4XcIeKXSBN7cL/SSIrleq1iq3I1zTmXCSXS/ZYObdiOoKpvgUwB4WOOi/I5zD270stSG5wFIPmh2lwFvuAgKj3A=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3089.namprd10.prod.outlook.com (2603:10b6:408:ce::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Mon, 8 Jun
 2020 16:00:00 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 16:00:00 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Topic: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Index: AQHWMqM6W5iP9Jkv9UCEGIiDuBaJw6i45d+AgAADdICAABpkAIABC5qAgAADbYCAABTvAIAAbWUAgAAJUgCAAQCagIAAEYeAgAAQ3QCAACtYAIAAKHAAgA3IaoCABKdlgIAAKLCAgABDd4CAAAVSgA==
Date:   Mon, 8 Jun 2020 16:00:00 +0000
Message-ID: <294b2e8330b8c04652ffbab7829dd2cbfa2cf081.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
         <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
         <1590482853.2838.26.camel@suse.com>
         <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
         <1590488084.2838.34.camel@suse.com>
         <42c92312c74e90e5507de4103bd15bbbe175f98d.camel@infinera.com>
         <4c2bd25aa7f6672cb132487f7af6a787ffc1fab6.camel@infinera.com>
         <1590568683.2838.42.camel@suse.com>
         <f4a809ba4ca132266e476ca1805e4ff9e5663f9f.camel@infinera.com>
         <1590576068.2838.56.camel@suse.com>
         <c2c3eed27aa13f981690779aca00c420ce0beb06.camel@infinera.com>
         <d7f2750db8c2616fb74fc2e7ea006354e546c7fc.camel@infinera.com>
         <9971e8a97ea0f9d63864829fd8f2f4db897fc131.camel@infinera.com>
         <1591607631.24937.3.camel@suse.com>
         <914176111c9eee651f402b499bc5ec49ff634e00.camel@infinera.com>
         <1591630857.24937.5.camel@suse.com>
In-Reply-To: <1591630857.24937.5.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1199e1a0-1d5b-4421-6a6b-08d80bc4ffba
x-ms-traffictypediagnostic: BN8PR10MB3089:
x-microsoft-antispam-prvs: <BN8PR10MB3089D0B2EF0B382FFE9353FDF4850@BN8PR10MB3089.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 042857DBB5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vLcRcc2MR8yaNSFacKx35//oxadp63sCnSmZUou21yOxqAad1LR4SJdMBcGpWojjGynBe+bpeAvUthGWdY2Yip/DV5JYg2pRux0r7n+a9dDjZpGnFC4wYjoBay72x+QF32oljjO7XuIz/uc/5vpfEJQh+YEtvg3bF16voBwvKQQc7k4ztSjzV1VSgYWZ4CYTU1q8X0sg73QxcLmeJapKRhL4/Foefd8MxljWjelMa746llRGPSvYyMs6A4ggaw2LenCC1IWk3nlRaNKMw163KAUme/CQpSB3/Cyr9d6S57Ii47Vtc91LEXvkcbZL6An+OZXXB+fxxAE4Whoje4qxDQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(6486002)(316002)(186003)(6512007)(76116006)(66476007)(66556008)(26005)(64756008)(66446008)(66946007)(478600001)(91956017)(5660300002)(36756003)(86362001)(4744005)(110136005)(2906002)(71200400001)(8936002)(6506007)(2616005)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: YDiUzPDMt3Nb7a57Ep1pnYqC1/H6kkit3kAOJpY60wA2d8bAYniF4O8dv2yA/XVxFexfbts+BSdREMjteQZ8NCsNdf08UhSdkJWIXnYiNEmi7/6/wz7Nti+y5HogiEdETJjy7vXecj5y4X8yhRLEt6ebqw2zAfI1xsljH65oNLQsR1y7jYzxoZwY/v1P5kpUtpr48eAVbDXR9Rx3ADsTF4+lZ8LFfkdJXQQtvSqlY7yfihd57H5QhkWA4plLoExFRyvJBfkKGH1af0zS3tbZFHLds3zDpWLDn7PC5QhaAsyzSDP+2NbajI1p0/NSiA8t/hZMMRKdXtZSdcQ9RpDoqmVxl6ugJxK6BkHj1XT8oMpWPDJTuEMxE6sXM2qL0tl7QnRNp/phHlmyIL2AXFm+/ojTJawmmVuPhTo9/hUAOHOywmHLa83Yz+4rWbwHVNX3r/wrszPEAWluC4fZ/dDFe3MRvAUVInladis2KWoptrs=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BBA0D1C913270478966F7025C4EB2FE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1199e1a0-1d5b-4421-6a6b-08d80bc4ffba
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2020 16:00:00.3668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lrFCpn5ThFpyyAlGBl9g7i9+34FWRGT5yYIizbhnR8/7KIp1s1QHuywiEMNP3j3VZsyeXthuONZN+DB+S/K5rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3089
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCAyMDIwLTA2LTA4IGF0IDE3OjQwICswMjAwLCBPbGl2ZXIgTmV1a3VtIHdyb3RlOg0K
PiANCj4gQW0gTW9udGFnLCBkZW4gMDguMDYuMjAyMCwgMTE6MzkgKzAwMDAgc2NocmllYiBKb2Fr
aW0gVGplcm5sdW5kOg0KPiANCj4gPiBNb3N0IHRlcm1pbmFsIHByb2dyYW1zIEkgdXNlIHRyaWVz
IHRvIGVtcHR5IHRoZSByZWFkIHF1ZXVlIGFmdGVyIG9wZW4sIGp1c3QgdG8gYXZvaWQNCj4gPiBv
bGQgZ2FyYmFnZSBzw6UgSSBkb24ndCBzZWUgYSBwcm9ibGVtIGhlcmUuIEl0IGl0IHVwIHRvIHRo
ZSB0ZXJtaW5hbCBhcHAuDQo+ID4gTWF5YmUgb25lIGNvdWxkIHVzZSBPX0RJUkVDVCBmb3IgdGhp
cyBwdXJwb3NlID8NCj4gDQo+IFdlbGwsIHdlIGNhbiB0aHJvdyBhd2F5IHN0dWZmIHJlY2VpdmVk
IHVudGlsIHNvbWUgdGltZSBpbiBvcGVuKDIpLg0KPiBCdXQgeW91IGNhbiBhbHdheXMgaGF2ZSBz
dHVmZiBpbiB0aGUgYnVmZmVyIHdoZW4gb3BlbigyKSByZXR1cm5zLg0KPiBVc2VyIHNwYWNlIG5l
ZWRzIHRvIGJlIHJlYWR5IHRvIGRlYWwgd2l0aCBzdHVmZiBpbiB0aGUgYnVmZmVyLg0KDQpVc2Vy
IHNwYWNlIGFscmVhZHkgZG9lcyB0aGlzLCBidXQgdGhlIGF1dG9tYXRpYyBFQ0hPaW5nIHRoYXQg
aGFwcGVucyBhdCBvcGVuDQppcyBub3QgcG9zc2libGUgdG8gYWRkcmVzcyBpbiB1c2VyIHNwYWNl
LiBUaGUgYnVmZmVyZWQgY2hhcnMgYXJlIHNlbnQgdG8gYm90aA0KdGhlIHRlcm1pbmFsIGFwcChw
dXR0eS9taW5pY29tIGV0Yy4pIGFuZCBvdmVyIHRoZSB3aXJlIHRvIHRoZSBzaGVsbCB3YWl0aW5n
IHRoZXJlDQphbmQgdGhhdCBpcyB0aGUgcHJvYmxlbS4gVGhlcmUgaXMgbm8gd2F5IHRvIHByZXZl
bnQgdGhhdCBFQ0hPIGJhY2sgb3ZlciB0aGUgd2lyZShVU0IpDQphcyB0aGUgZGVmYXVsdCBpcyB0
byBFQ0hPIGFuZCBvbmUgaGF2ZSB0byBvcGVuIHRoZSB0dHkgdG8gY2hhbmdlIHRvIG5vbiBFQ0hP
Lg0KDQogICAgSm9ja2UNCg==
