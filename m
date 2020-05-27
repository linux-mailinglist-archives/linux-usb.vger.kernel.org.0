Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E781E38EA
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 08:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbgE0GRf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 02:17:35 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:52360 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725267AbgE0GRf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 02:17:35 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5402DC06EB;
        Wed, 27 May 2020 06:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1590560254; bh=vVvggDnirpuSEilQHL279dq1W4myCwJuZzh3m7HliDc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=jPyDG4c93CrIgAThRQhfn7mvUH/awD5T0qNWX/LxRS0Goxra5MTT0DWThlY2ylZrn
         gMcPwt6Zq7ZONKwu4TF10FbEhSN7t2dd3QmTeJ1cvuXlg9NBdf2rlu2NTsUbqUuQZ0
         DEJlHx9bRdg/iERQa1rd29KeLzJFNQdkxhc+gXYaPuN8ItJ99B+ovJArV8DWQCZrWE
         isK28kXE9RMedIX9DSD+kvR/KSiguDMTXA/28K1vSnvULsv9l3v6yIBMccFk7+pAUA
         98o+x/5yoNDwNjZmmf1vMz1Ij1gNyFPCYT9+exXhUpII/ni4Isn1MlkfKSNOw4AsiB
         Qo+UCDm7cg5Xw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 07F40A006C;
        Wed, 27 May 2020 06:17:31 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 26 May 2020 23:17:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Tue, 26 May 2020 23:17:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKCeN7BuGUcybcSURlHLRHC364TZjwiCtqei6JWleWDRXE/HhIwXbVwep7H3b97HaU1+n2+OJj9CHqJuuXX1qzCFLTXfy02VMAIbExfw+AWuo6uXu9ANjSXfnXxvPT08MZaisSmh7voavNga0PFp/P3M+6EQ4JeoJnXvKnk3E/p5KQ5KSERIhoJ7sjwxj6oKX2X8y9r0jyWsf9vK2fBNjJBLYDJMwJw/wdIKr0p0f4LTBVVdeU8QSa7HsnKfUaTY0fr1ss1mJ5WaB12iQYwr28XNbF6HvzCB8MTB5NQt++3d5tjCouP8iA5/5tp7AaY2XfuMDfrg2tXlVINw619KHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVvggDnirpuSEilQHL279dq1W4myCwJuZzh3m7HliDc=;
 b=Flm3U0Qqtk6wthYKlTgVKRQqO6ELwYnbWOKmdH3wz/olTtY6FOKT8WzAq+gpo2OLPkPxSfqf5aaeqWC8DQedgGz6QycVJzHsfdD67aCzRK9TeOzQS2IOJij+DQ+fpAQHjZPn9cHiGfhVws/Brih85y8x905ab/0JqlkvqpYaRZgwVhB8dHApt+XhdQpl+baqnOHYUEhtSGs7EmsYtC14qIhK252tHpFIZR+xzbWf/zbn76E2Y1D4rhdUkqUgT6Ndk4yt7y4n+d0ydcAymlQOROEp+xgdbUHFOIH8i7isZvzgDm60/hKCvRiRLHOSkcjXLz47kZKG6an3RfGxKCqb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVvggDnirpuSEilQHL279dq1W4myCwJuZzh3m7HliDc=;
 b=MnaGuWlQ3bBabe/feegMe8Lmyptqpq2wmy3CT/Bf4NbqxjJgb9xexF+FXkr0oGWlxvkpJjIl56pi2+LHxhXO8NwfIMQzFj2T/e0/VpJJPacDmm0mz8Xm1cM3qGwISx1QkQUYb46RI5R3tRRLtX97xJydOLWoK4U06R734J8wrd8=
Received: from DM5PR12MB2550.namprd12.prod.outlook.com (2603:10b6:4:b8::31) by
 DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.27; Wed, 27 May 2020 06:17:28 +0000
Received: from DM5PR12MB2550.namprd12.prod.outlook.com
 ([fe80::c4df:b228:c1b7:75a5]) by DM5PR12MB2550.namprd12.prod.outlook.com
 ([fe80::c4df:b228:c1b7:75a5%7]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 06:17:28 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Topic: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Index: AQHWEaBFUZHLydAVY0yALpZJ1gABx6h3ITiAgAACTgCAAAlrgIAAGd8AgADukoCAAFTigIABVJ4AgABprwCAAAQ1gIABN86AgABAc4CAAA8qAIABNeYAgATroYCAAz+MAIAACiqAgCGlkQCAAhBPAIASxG6A
Date:   Wed, 27 May 2020 06:17:27 +0000
Message-ID: <b9023085-0abb-b994-bb1c-e0b03e99e7ed@synopsys.com>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
 <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
 <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
 <b64f41ac-2d70-55a3-ab6a-77383cd463eb@denx.de>
 <d1b36da4-b506-2f86-f5ad-95bf3aac4485@synopsys.com>
 <c35e95cf-7f72-4a49-a0e1-efc0701d613d@denx.de>
 <867a776d-1e2c-2207-4387-072d2a8423fb@synopsys.com>
 <a6d681c5-d5fa-51d8-a320-6f6e9844c93a@denx.de>
 <4b4478aa-85bd-c05c-b5d0-e11dc35eb623@synopsys.com>
 <6ea2270d-19a4-7e8b-42fb-37a4a9d81e1f@denx.de>
 <8fb53f3a-a02b-3c53-0d9d-22b707bda786@synopsys.com>
 <671f36e3-367e-bcdf-0da7-f7ad82cf6284@denx.de>
 <ebb175be-edc1-892f-4537-a7402fd4460e@synopsys.com>
 <bb4835f6-a6c7-61cf-d4f0-eddbb5d6dea9@denx.de>
 <8de7047f-4d49-349b-983a-31c4ab66562f@synopsys.com>
 <c59c58e6-648c-bcb3-cbd4-9e78f9021bb7@denx.de>
 <d67d69a6-651f-f214-5119-bbbd68b4c2d5@denx.de>
 <4bfffaf9-fffd-57bc-6d45-ba43c46cd136@synopsys.com>
In-Reply-To: <4bfffaf9-fffd-57bc-6d45-ba43c46cd136@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 242aa495-8a12-4faa-23ce-08d80205a180
x-ms-traffictypediagnostic: DM5PR12MB1705:
x-microsoft-antispam-prvs: <DM5PR12MB1705C031CBE3FCC3B496D3B4A7B10@DM5PR12MB1705.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5LzqKUocdeSt/Wtn/tQXHQjo+5D/ZqEySzf14+9wwIftG0ps4ETvf/2QPkHQLLmzA2OdV0oCvZGsbFCEadqQfdu5TCIo7PHEcoLEYlKzUYrooXDvuzgWyJkV42NQR2jt8UKjajvApHjv4GPpfKqZ4xWZ41Z+FLFgxa3ybGc8unVz+hOkTuSTTjWbrp2AbtnHaly/3y3J8V18sQl0s6CHBLyXisGeoEcb6lNxYVgZUSo92Tv6odPyfkSmjr2OXYXnth1nrCp5pM/NJGVV5Li8Buc4Bnz6IMKENnsXduNKY+rLfO0A4CGZwt8IvrpM2y0jdwuUx1RDe7q79AYBJ2j8NYHMmoC3MtoZmyhtK3fDagNln80n3rMcqSIGR2qLM5FZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2550.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(346002)(396003)(136003)(376002)(366004)(91956017)(6512007)(36756003)(31686004)(66946007)(76116006)(186003)(8676002)(26005)(6486002)(83380400001)(5660300002)(71200400001)(316002)(478600001)(2616005)(4326008)(6506007)(31696002)(110136005)(53546011)(66476007)(86362001)(66446008)(2906002)(64756008)(66556008)(8936002)(54906003)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: aD65BjxdrzJwlcsVJaJbdoBvb15qHiQ1YwB7m6oyHztRCi7Oh67YXpz201XloydiR8zNYFU56Dc3tY9f7EhQzWebxf4G7SAl1jjU7jG6XuITbYgPfb+E+0RGT8mIehhSDwmo3V3/olbrXYahNeUWZ3MrGikYQbYTPfcIo1WLaMC4VUVpEQzuvmD4vgJzoA30QK5vvQ4mJUNnuHzlwT+s2oO+aX2mySTW4VTKNepOXU8oBmsTXJY/GOgS1j5EvGbnosbIC6tYTZ4lZqTvtH7urfsBw2Y55affLHWcnhAfKiLH1y9JONRTtb1hvx/vNMXooZp6G8APmgKrPQdT7PYyESJJyWkmtdpJWYwU/5Q1OkAdVbtLD6jPO9szBPHlMRkxs0T4KJIu+N8eO4u1D/00ApJUOIhfbPValET4vORrtYGFQb/Hs4fVzSuCYdbASDMFoR0DUec5+X6DrVTU7lTC/SAa4znPEhDX0bdWjI13t1l4Ankgg1yfa1Ea8O42mFxU
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <30AF01E43C373248B3A456DF810DFF5E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 242aa495-8a12-4faa-23ce-08d80205a180
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 06:17:27.9337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBpFBcGSdcjMAQRuykV2onOGdZrKu97Wlqe6rKS20Z8XNdbl6JmDGiP4OQKyMqfDLg4xyVGEBBeDTpHhiJFXuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1705
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWFyZWssDQoNCk9uIDUvMTUvMjAyMCAxMTo0MSBBTSwgTWluYXMgSGFydXR5dW55YW4gd3Jv
dGU6DQo+IEhpIE1hcmVrLA0KDQpBbnkgdXBkYXRlIG9uIG9uIHRoaXMgcGF0Y2ggdGVzdGluZz8N
Cg0KVGhhbmtzLA0KTWluYXMNCg0KPj4NCj4gQ291bGQgeW91IHBsZWFzZSB0ZXN0IHdpdGggdGhp
cyBwYXRjaC4NCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jIGIv
ZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYw0KPiBpbmRleCAxMmI5OGI0NjYyODcuLjdmYWY1Zjhj
MDU2ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYw0KPiArKysgYi9k
cml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQo+IEBAIC00OTIwLDEyICs0OTIwLDYgQEAgaW50IGR3
YzJfZ2FkZ2V0X2luaXQoc3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnKQ0KPiAgICAJCQkJCSAgZXBu
dW0sIDApOw0KPiAgICAJfQ0KPiANCj4gLQlyZXQgPSB1c2JfYWRkX2dhZGdldF91ZGMoZGV2LCAm
aHNvdGctPmdhZGdldCk7DQo+IC0JaWYgKHJldCkgew0KPiAtCQlkd2MyX2hzb3RnX2VwX2ZyZWVf
cmVxdWVzdCgmaHNvdGctPmVwc19vdXRbMF0tPmVwLA0KPiAtCQkJCQkgICBoc290Zy0+Y3RybF9y
ZXEpOw0KPiAtCQlyZXR1cm4gcmV0Ow0KPiAtCX0NCj4gICAgCWR3YzJfaHNvdGdfZHVtcChoc290
Zyk7DQo+IA0KPiAgICAJcmV0dXJuIDA7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2My
L3BsYXRmb3JtLmMgYi9kcml2ZXJzL3VzYi9kd2MyL3BsYXRmb3JtLmMNCj4gaW5kZXggOGVhNGEy
NDYzN2ZhLi42MDNiODVjZDhlZDMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvcGxh
dGZvcm0uYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MyL3BsYXRmb3JtLmMNCj4gQEAgLTUzNyw2
ICs1MzcsMTYgQEAgc3RhdGljIGludCBkd2MyX2RyaXZlcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlDQo+ICpkZXYpDQo+ICAgIAlpZiAoaHNvdGctPmRyX21vZGUgPT0gVVNCX0RSX01PREVf
UEVSSVBIRVJBTCkNCj4gICAgCQlkd2MyX2xvd2xldmVsX2h3X2Rpc2FibGUoaHNvdGcpOw0KPiAN
Cj4gKwkvKiBQb3N0cG9uZWQgYWRkaW5nIGEgbmV3IGdhZGdldCB0byB0aGUgdWRjIGNsYXNzIGRy
aXZlciBsaXN0ICovDQo+ICsJaWYgKGhzb3RnLT5nYWRnZXRfZW5hYmxlZCkgew0KPiArCQlyZXR2
YWwgPSB1c2JfYWRkX2dhZGdldF91ZGMoaHNvdGctPmRldiwgJmhzb3RnLT5nYWRnZXQpOw0KPiAr
CQlpZiAocmV0dmFsKSB7DQo+ICsJCQlkd2MyX2hzb3RnX3JlbW92ZShoc290Zyk7DQo+ICsJCQln
b3RvIGVycm9yX2luaXQ7DQo+ICsJCX0NCj4gKw0KPiArCX0NCj4gKw0KPiAgICAJcmV0dXJuIDA7
DQo+IA0KPiAgICBlcnJvcl9pbml0Og0KPiANCj4gDQo+IA0KPiBUaGFua3MsDQo+IE1pbmFzDQo+
IA0K
