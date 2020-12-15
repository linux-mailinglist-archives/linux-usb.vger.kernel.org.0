Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2254E2DA7A2
	for <lists+linux-usb@lfdr.de>; Tue, 15 Dec 2020 06:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgLOFYf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Dec 2020 00:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgLOFY2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Dec 2020 00:24:28 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on060c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::60c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2CEEC061793
        for <linux-usb@vger.kernel.org>; Mon, 14 Dec 2020 21:14:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Be2DyV+4UyS2o8HgzILwabewoCGL7gEVhIsRiBBUuG6ti8J50f+WiiK7hiz3apsnlTl7ne+8oCgaU3Xk1eq70MZg+1iPvcmKP8nzDVUzEVipdigMgH1g16M/tcc/+hzz+8ExZpp2Bsbkk5jqugPjL7Y3VK+LUgUINrH2L2jnEkuOEIZtsXwKZYd1AOAh0by2qQLRmIYIhOYqZ5bIb5UDpjWEd+e6275ijM8yAFaiV8iU1b4LDKYyd8qSGPWHuSCjQHdFXKdmsPPU/uETCgnlTRnFTgNAd07GyDFILH27Wto9Ej4d0uw41rlAdHetdkUnK0ghE0rzSyg5Xm4CG5P2OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvzq1u011iHdq3OWG1Yr5lyBvaGX63bySRFdB9CYh+0=;
 b=cLcHroarj44epIkdMbx7LDYo8o3gRPOq+sjCslFP24lejcB3MFAdKtbLvK159mSlzZ4XeIuoku7rHbeqPa65LFCi0h66uTf56Lqeu6u39d/oWz5HBvYQXTZhKovPxmGFOZkgllIYZxnqTazdXCR/7iHSJla5HBSrorj6QEg8ETUz9e+bsGKahvXP9ed2g7A5m0Z8q/G7TOB0Xc7F0i/0ZgP1AI4u372pwwlBYtc8WRkseC6xrOqE3Gd1we6HGkbf7+JLQLbY6hgCqMoHN8qXw00/Zry7444jGNyJ/YrYaOVrC8aykRgFzY+X307GWDA3lfq7l9WqZvdh4tpytzJl2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvzq1u011iHdq3OWG1Yr5lyBvaGX63bySRFdB9CYh+0=;
 b=MBq2rrbLgY6ARW6/dISCyY3v2mWJ9KuzruqbaivUWm6LDIQtzD3ula7H3f7wxj7OhPIORVLFkHRSMvPpM7Kkl0Pn9podJtSac9WXowh6x0XCODlOAcXvkMiKDveVCnaug8G0SftgpHBRsOM68C43l+IsxS77fwk5kIWCpKZiLDg=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB7PR04MB4938.eurprd04.prod.outlook.com (2603:10a6:10:1f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Tue, 15 Dec
 2020 05:14:31 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3654.026; Tue, 15 Dec 2020
 05:14:31 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <lijun.kernel@gmail.com>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: port power is on again after turning off by user space
Thread-Topic: port power is on again after turning off by user space
Thread-Index: AdbSkrHAwwTe1v1pTzSTgGOOVcOG/gADLuWAAABrJAA=
Date:   Tue, 15 Dec 2020 05:14:31 +0000
Message-ID: <20201215051402.GC2142@b29397-desktop>
References: <DBBPR04MB79793525394F70DE397E24038BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <CAKgpwJXMFSHxi7vE5cOxkYPTnY74oB-SKf3FikerCzFDLYqcbw@mail.gmail.com>
In-Reply-To: <CAKgpwJXMFSHxi7vE5cOxkYPTnY74oB-SKf3FikerCzFDLYqcbw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9004f287-c039-4840-6e1e-08d8a0b84e1f
x-ms-traffictypediagnostic: DB7PR04MB4938:
x-microsoft-antispam-prvs: <DB7PR04MB49382017565E5975FD42A6428BC60@DB7PR04MB4938.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M1wyL4+HeD9kJgUdJL8SvR1XT8gg7LP5IEwopYmpjJw9I2IkUY41uvJTEoo9n3Dt/JrpNm90i9AL8jkZzxSnDuxwEJ/bUMFQtZKjpxK2aZWVDcF4ALqDnbWfJDtdkiHKQ6RzkWFTKZbtV5BtBmBAAakbPy57bCG+vu0DliS+dmpUZfvpiNTKuJkBvU4hmAy/jSRtgF4cUluCndbua868gjVg7T4/65C4pjPEI220Ld2DcjBL93mCZfwq4OSHrEUcaBafjFJ4JDw58gpGMPnLIq5e3sLBTYPIu96a2SpzkOQY0bab0hhjNpBfHehvt+qQ8/brcpBCyNfcBICSdWTnrC670ReiVDO9aP9hJE6aDecS1UMltB+aDP/E4yjFeyhWj+0E6iOBdHgwzVXinOmZ+g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(5660300002)(33716001)(91956017)(76116006)(86362001)(316002)(66556008)(66446008)(6506007)(2906002)(45080400002)(64756008)(6916009)(478600001)(53546011)(186003)(66476007)(8936002)(26005)(4326008)(71200400001)(1076003)(44832011)(9686003)(6486002)(33656002)(54906003)(6512007)(8676002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TmxMRmJiK3JQNFgyd1UxQ2hlWXVMWXZGOVNFWmRQaWJIVmFqMmJIQWVIYmFG?=
 =?utf-8?B?L1dYSWUvdXBZWkJpOFBTMjUwNHVsbncxOStvV1QyK3owcEVENkNHRkcwZ2V4?=
 =?utf-8?B?bnkzUDJldTJqMXhzSTN1Wno0SmF5NVZMOHYxV3R3cUxkcThtT1E0T3NUL05R?=
 =?utf-8?B?eWZ3QVJMM01ZMEhtcUlMRWNDYTVBZys5QTc2anZrdW1jMVZWTEVJU1JneHVE?=
 =?utf-8?B?TUxFNkhmV2hYTzZXY0NEYVQ4Q01GaTVuakpqVnVmRVB2cHY5NTg3OHFlUUZK?=
 =?utf-8?B?NGJPRHFnay8vWmZBU1o5NHZubzNCM21wUTJ4Nnc2UXdjdzhqQnFac2ltOVhq?=
 =?utf-8?B?Qk1GUGJtNzlsUHBEakpCNXcxVk1jNVFSQjlOZkl5bVZ0L2U5WnVPNFduclRh?=
 =?utf-8?B?MDNObkFuWXdmbGF1SVlqV3lSUHpzZEhlN0t1UFZRbC92R3dtVlVqZDNVNHdK?=
 =?utf-8?B?NmJZOEhvMVQybXk3OWlicHUwNTlUUENwUTRMZzlVdENxeXErcEVobjdNempI?=
 =?utf-8?B?VkJQUE1kUDRGY0U1VUZVb0o2anJQclZTejNkNTQ0aDkwR2NtM2I2K092ekVr?=
 =?utf-8?B?NmRNaWhCeTk3bFFxcmJDZGJDMmZxaXNlV0hvQ2JCMklVdEQ0SkxnSktpR1pW?=
 =?utf-8?B?WkNhT3ptQzRBM29IeHhaN29vL0pLbmRRTDc4bzRiQm1ITlZSVHg0c2w1L3BE?=
 =?utf-8?B?bFdOcTkvejh3NmF6eXc4UUVueGthb1JtUzY2dnYwMjluRlNTRHkzdlU5UE1v?=
 =?utf-8?B?dGZpQmVQcENodHg1RG5DZGZGVS9CZlFPOWVKZk9KVkJPZmNIRGl5NjZzb2ky?=
 =?utf-8?B?MFFDWTBYMmFJc1lCZTc3b051emlUV1dFUHFMWUZMZ3dDOFlieFYyQ1JSNGxZ?=
 =?utf-8?B?a1I3WE15NlNtTzFhL1VrZW1DVGVRd0p2K1REZkNLalhwRVd4NTRTUlZZbWlG?=
 =?utf-8?B?MkI5NTgzN2Z6QiswQVlLMmZYdEpFclVoWnFxK0V1TW9ZMXlEd29hNVRRQmUz?=
 =?utf-8?B?TFhCVDBoWk9obTIwa3FNSHVjRHhmdmJobEZYQXZYaEd3Wm9UVXlpNVhuLzJn?=
 =?utf-8?B?eGVVV2M0RmpORGRSaVI4VUxIcEFkYmlSNUthMmpLK0FlYTAxYWtsSWlpaDVp?=
 =?utf-8?B?REQzNklaNXdVa3RsblJLOGlseEIvaFN5bnlCVXNKSTVVQUlXNVV5VzROamRr?=
 =?utf-8?B?dHFScWRaR3p0SHdJaHlDUWR2aEVvN0pWU29LRmZweHRKUUVEV0dEbUxXYXR3?=
 =?utf-8?B?MG91WkF0NHA4RkdBUjFKcHFhWVpocDhQSUQxR2VzOWY0cnVYVXN1QWRzQnhx?=
 =?utf-8?Q?0sXNrGp+L7UGdHVQa0s5tmxulryYiYEXT/?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA7FB725ED760D46967B4B99D55FBB0D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9004f287-c039-4840-6e1e-08d8a0b84e1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 05:14:31.6919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rDJCIMown3+UFoA7Klp8xH/PURFOmA/K86KvvaPRweLMgw44oP/Xn+WAP/sJtputSkNjrg293ImCApihxag0zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4938
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMjAtMTItMTUgMTM6MDI6MDMsIEp1biBMaSB3cm90ZToNCj4gUGV0ZXIgQ2hlbiA8cGV0ZXIu
Y2hlbkBueHAuY29tPiDkuo4yMDIw5bm0MTLmnIgxNeaXpeWRqOS6jCDkuIrljYgxMTozM+WGmemB
k++8mg0KPiA+DQo+ID4gSGkgQWxhbiwNCj4gPg0KPiA+IEkgdXNlIG9uZSBIVUIgcG93ZXIgY29u
dHJvbCBhcHBsaWNhdGlvbiAoaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRs
b29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUyRm12cCUyRnVodWJjdGwmYW1w
O2RhdGE9MDQlN0MwMSU3Q3BldGVyLmNoZW4lNDBueHAuY29tJTdDNzM2ZWNlMTliYzdhNDMwYzk4
YjgwOGQ4YTBiNjk3NWMlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0Mw
JTdDNjM3NDM2MDUzMzYyMTUxMDIyJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0
d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3
QzEwMDAmYW1wO3NkYXRhPWxwdGYxWE81eWViNmxRYkFGbEtVclolMkJFWDVBVFhRUmZ0R3dtMjZX
b3dGQSUzRCZhbXA7cmVzZXJ2ZWQ9MCkgdG8gaW52ZXN0aWdhdGUgcG93ZXIgc3dpdGNoYWJsZSBI
VUIsIGFuZA0KPiA+IGZpbmQgdGhlIGtlcm5lbCB0dXJucyBwb3J0IHBvd2VyIG9uIGFnYWluIGF0
IGRyaXZlcnMvdXNiL2NvcmUvaHViLmMsIGFmdGVyIHBvcnQgcG93ZXIgaXMgdHVybmVkIG9mZiBi
eSB1c2VyIHNwYWNlLg0KPiA+DQo+ID4gNTEyMiAgICAgICAgICAgICAgICAgaWYgKGh1Yl9pc19w
b3J0X3Bvd2VyX3N3aXRjaGFibGUoaHViKQ0KPiA+IDUxMjMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmJiAhcG9ydF9pc19wb3dlcl9vbihodWIsIHBvcnRzdGF0dXMpDQo+ID4gNTEy
NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICYmICFwb3J0X2Rldi0+cG9ydF9vd25l
cikNCj4gPiA1MTI1ICAgICAgICAgICAgICAgICAgICAgICAgIHNldF9wb3J0X2ZlYXR1cmUoaGRl
diwgcG9ydDEsIFVTQl9QT1JUX0ZFQVRfUE9XRVIpOw0KPiA+DQo+ID4gVGhlIG1haW4gc2VxdWVu
Y2UgZm9yIHRlc3RpbmcgdHVybiBwb3J0IHBvd2VyIG9mZiBsaWtlIGJlbG93Og0KPiA+DQo+ID4g
LSB1aHViY3RsIHNlbmRzIGNvbW1hbmQgdG8gdHVybiBzcGVjaWZjIHBvcnQgKGVnLCAyLTEuNCkg
cG93ZXIgb2ZmLg0KPiA+IC0gZGV2aW8gYXQga2VybmVsIGdldHMgdGhhdCBjb21tYW5kLCBhbmQg
c2VuZCB0byBodWIuDQo+ID4gLSBwb3J0IHBvd2VyIGlzIG9mZiwgdGhlIGh1Yl9ldmVudCBpcyB0
cmlnZ2VyZWQgZHVlIHRvIHBvcnQgc3RhdHVzIGlzIGNoYW5nZWQuDQo+ID4gLSB1c2JfZGlzY29u
bmVjdCBpcyBjYWxsZWQsIGJ1dCBwb3J0IHBvd2VyIGlzIG9uIGFnYWluIGJ5IGtlcm5lbCBhdCBm
dW5jdGlvbiBodWJfcG9ydF9jb25uZWN0Lg0KPiA+DQo+ID4gSSBjYW4ndCBmaW5kIHRoZSBjb2Rl
IGhpc3Rvcnkgd2h5IHRoZSBwb3J0IHBvd2VyIG5lZWRzIHRvIHR1cm4gb24gYWZ0ZXIgZGV2aWNl
IGlzIGRpc2Nvbm5lY3RlZCwgZG8geW91IGtub3cgd2h5Pw0KPiA+IEFueSBzdWdndWVzdGlvbnMg
dG8gZml4IGl0PyBUaGFua3MuDQo+IA0KPiBTZWVtcyBpbiB0aGlzIGNhc2UgdGhlIHBvcnQgbmVl
ZCBjbGFpbWVkIGJ5IHVzZXIgYXBwLCBJIGFtIHNlZWluZyB0aGlzIGNvbW1pdA0KPiANCj4gY29t
bWl0IGZiYWVjZmYwNmE3ZGI0ZGVmYTg5OWE2NjRmZTI3NThlNTE2MWIzOWQNCj4gQXV0aG9yOiBE
ZWVwYWsgRGFzIDxkZWVwYWtkYXMubGludXhAZ21haWwuY29tPg0KPiBEYXRlOiAgIFdlZCBKYW4g
MjEgMjM6Mzk6NTggMjAxNSArMDUzMA0KPiANCj4gICAgIHVzYjogY29yZTogaHViOiBtb2RpZnkg
aHViIHJlc2V0IGxvZ2ljIGluIGh1YiBkcml2ZXINCj4gDQo+ICAgICBDdXJyZW50bHkgaWYgcG9y
dCBwb3dlciBpcyB0dXJuZWQgb2ZmIGJ5IHVzZXIgb24gaHViIHBvcnQNCj4gICAgIHVzaW5nIFVT
QkRFVkZTIHRoZW4gcG9ydCBwb3dlciBpcyB0dXJuZWQgYmFjayBPTg0KPiAgICAgYnkgaHViIGRy
aXZlci4NCj4gICAgIFRoaXMgY29tbWl0IG1vZGlmaWVzIGh1YiByZXNldCBsb2dpYyBpbiBodWJf
cG9ydF9jb25uZWN0KCkgdG8gcHJldmVudA0KPiAgICAgaHViIGRyaXZlciBmcm9tIHR1cm5pbmcg
YmFjayB0aGUgcG9ydCBwb3dlciBPTiBpZiBwb3J0IGlzIG5vdCBvd25lZA0KPiAgICAgYnkga2Vy
bmVsLg0KPiANCj4gICAgIFNpZ25lZC1vZmYtYnk6IERlZXBhayBEYXMgPGRlZXBha2Rhcy5saW51
eEBnbWFpbC5jb20+DQo+ICAgICBBY2tlZC1ieTogQWxhbiBTdGVybiA8c3Rlcm5Acm93bGFuZC5o
YXJ2YXJkLmVkdT4NCj4gICAgIFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
Y29yZS9odWIuYyBiL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMNCj4gaW5kZXggYjRiZmEzYS4uM2U5
YzRkNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvY29yZS9odWIuYw0KPiArKysgYi9kcml2
ZXJzL3VzYi9jb3JlL2h1Yi5jDQo+IEBAIC00NjU1LDkgKzQ2NTUsMTMgQEAgc3RhdGljIHZvaWQg
aHViX3BvcnRfY29ubmVjdChzdHJ1Y3QgdXNiX2h1Yg0KPiAqaHViLCBpbnQgcG9ydDEsIHUxNiBw
b3J0c3RhdHVzLA0KPiAgICAgICAgIGlmICghKHBvcnRzdGF0dXMgJiBVU0JfUE9SVF9TVEFUX0NP
Tk5FQ1RJT04pIHx8DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHRlc3RfYml0KHBvcnQxLCBo
dWItPnJlbW92ZWRfYml0cykpIHsNCj4gDQo+IC0gICAgICAgICAgICAgICAvKiBtYXliZSBzd2l0
Y2ggcG93ZXIgYmFjayBvbiAoZS5nLiByb290IGh1YiB3YXMgcmVzZXQpICovDQo+ICsgICAgICAg
ICAgICAgICAvKg0KPiArICAgICAgICAgICAgICAgICogbWF5YmUgc3dpdGNoIHBvd2VyIGJhY2sg
b24gKGUuZy4gcm9vdCBodWIgd2FzIHJlc2V0KQ0KPiArICAgICAgICAgICAgICAgICogYnV0IG9u
bHkgaWYgdGhlIHBvcnQgaXNuJ3Qgb3duZWQgYnkgc29tZW9uZSBlbHNlLg0KPiArICAgICAgICAg
ICAgICAgICovDQo+ICAgICAgICAgICAgICAgICBpZiAoaHViX2lzX3BvcnRfcG93ZXJfc3dpdGNo
YWJsZShodWIpDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJiYgIXBvcnRfaXNf
cG93ZXJfb24oaHViLCBwb3J0c3RhdHVzKSkNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmJiAhcG9ydF9pc19wb3dlcl9vbihodWIsIHBvcnRzdGF0dXMpDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJiYgIXBvcnRfZGV2LT5wb3J0X293bmVyKQ0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBzZXRfcG9ydF9mZWF0dXJlKGhkZXYsIHBvcnQxLCBVU0JfUE9SVF9G
RUFUX1BPV0VSKTsNCj4gDQo+ICAgICAgICAgICAgICAgICBpZiAocG9ydHN0YXR1cyAmIFVTQl9Q
T1JUX1NUQVRfRU5BQkxFKQ0KPiANCg0KWWVzLCBJIHNhdyB0aGlzIGNvbW1pdC4gQnV0IHRoZSBw
b3J0IGlzIG93bmVkIGJ5IGtlcm5lbCwgdGhlIGRldmljZSBvbiB0aGUNCnBvcnQgY291bGQgYmUg
ZW51bWVyYXRlZCBieSBrZXJuZWwsIGp1c3QgdGhlIHBvd2VyIG9uIHRoZSBwb3J0IGNvdWxkIGJl
DQpjaGFuZ2VkIGJ5IHVzZXIgc3BhY2UuDQoNCi0tIA0KDQpUaGFua3MsDQpQZXRlciBDaGVu
