Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A648353031
	for <lists+linux-usb@lfdr.de>; Fri,  2 Apr 2021 22:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbhDBUQ6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Apr 2021 16:16:58 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45636 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231149AbhDBUQ5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Apr 2021 16:16:57 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 13C4CC00DE;
        Fri,  2 Apr 2021 20:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617394616; bh=8el1o3zZY38ugVA5wMwq+M5xqJ4jZC8cyb62ZOmnpUQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=F/lRdaSW/9TBiFylZMJwP4QMAm7UDU5pH1Fs1N4f+Z/k4ZHa1GT4F6QFyQ54owXvO
         jKn6//lAqFOXwshgPaZfffkPTXnwXbBdpGioyAVNQ4QeNIqZHnTziDKFPcFAtF8s8K
         WtAFI0LUH0meLuKMrpBeWSELzuemuB4LvskqRFkJzlx3QgAUV91GSldO85DLbXGNyx
         71nSCOE7SkZt4MAbDft1DZfK96nIa16V4qIAbBDIQk9nW4CvcLx1rmLYs2QP9MEl2Q
         zG3T7JHiUx4gRHFmZZVhFZo0XwEcP1Z6ysWQ0kqZS1wOpGC8Z1owuC17ZedD9qASfy
         ydhZPgaupxBvg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 72EBEA0071;
        Fri,  2 Apr 2021 20:16:55 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8A67A40161;
        Fri,  2 Apr 2021 20:16:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="gY2ipV7D";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoSYNmHKHtEI/7e+EyLxGT4hOugLdgkKmQ+mLvPwGxhKUnG0QTw/FxdRawJmub9DE90sbQ8H79itE01ZxnMkta89+xSDIeR9JkcA62u/gt2nXMRLkXEP0fwXwhEbHef+gYgLSDK9svamsoEDMdSLc/6i50d2haxbxnLR2eDHcch3Afns5cG7rGIc5ww5qSHXAGy5Semj8t4WmASxQAFG41EZpHigdEWy7U0wbk4BuJvBHcpNCat1frSFbu/IHBztkTPz+ugRgPGJAfZhA9Tn2Ml5cC3eMkWjV2av2yVfWDUalYR5xlm4olcWfWYlIzm6WM+HMCL7qW+ZlCm3swSeZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8el1o3zZY38ugVA5wMwq+M5xqJ4jZC8cyb62ZOmnpUQ=;
 b=FCU2E50BmZc8D3jiviMDo7EGrGvGgz47yWHtKJOLLQamTLqHMZ8QGkE4e7+XhQ00Q+Y2IhqFtcJWvJn+jVzZ7pByAuvzFk0jzeaagGDV0LuqcS+b64CuUqW89Vyvkya27Wsmx+yeyyKyIyQuREOQjghznzCPOlnDqU9gh9+yZ0iBacUOmhdlh85zhyP9aOgRIavGqRnrWkjvEVq3VsM7/5IeIXv6AbVH3U5gnFK8M3h7pI7D7y6d6WlfQXfGOO1HaeIApj1t7b4yLCYgQbwiWV8J+MZLNAlaITLRJWOf1odByJwjHj6nvCW/+AbLeofsgBemTeNPdGzTm9+9muxb5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8el1o3zZY38ugVA5wMwq+M5xqJ4jZC8cyb62ZOmnpUQ=;
 b=gY2ipV7D8t+5GskcYu0IN1YXTSQ9wKjLN+D4lRE4M6Ky0sCJc+Au3InefR5zbsHdpdRUCCCQUNG2VGxzIR25e/nTLy0veS6vXTiUKF/pYNW47LhHDQiP/u8f9o+PAw0IDSbF5NMDlcyKjD63DHlD9zHok/ul2UnhM3UlXo+4sWs=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3446.namprd12.prod.outlook.com (2603:10b6:a03:d7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Fri, 2 Apr
 2021 20:16:52 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.3999.029; Fri, 2 Apr 2021
 20:16:52 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ferry Toth <fntoth@gmail.com>, Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        USB <linux-usb@vger.kernel.org>
Subject: Re: USB network gadget / DWC3 issue
Thread-Topic: USB network gadget / DWC3 issue
Thread-Index: AQHXJWGMSb8EBf7kO0mkR3W2S+2f0qqctZMAgABFgICAABlrAIAEiRiAgAAR4oA=
Date:   Fri, 2 Apr 2021 20:16:52 +0000
Message-ID: <797f97b8-6558-35c4-2dc5-9deacdf0ba4d@synopsys.com>
References: <CAHp75VeERhaPGAZc0HVs4fcDKXs+THc=_LFq_iEhWAR8vvURjw@mail.gmail.com>
 <87pmzgk44r.fsf@kernel.org> <b4763ebe-c0ff-2d24-5385-1a1587603280@gmail.com>
 <1f8ed83c-b2e5-327c-30da-56865e2b956b@gmail.com>
 <fd8d9a8a-8f57-6559-2053-4607b9da13ab@gmail.com>
In-Reply-To: <fd8d9a8a-8f57-6559-2053-4607b9da13ab@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49661c9a-4514-4bea-7139-08d8f61440ef
x-ms-traffictypediagnostic: BYAPR12MB3446:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB34464DC8026EF99F19794CC6AA7A9@BYAPR12MB3446.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bDkHOIvDFA5CAbDfuDmKxFe4oM6dqtPn/rj67bDFXj7kYCkS3EylVUlc+0KiIacPP6Xj860XxB4OB9ZlIQ3GZdfYillgzH1UizX8GIeIbl0I3CVkURa+2AND3uT8T+j2QCAKPi7HDC932fBu+JV1kXkjq6syGbdEPZNrHkvx0Ck5oZzXgtidIvFf4Teh/ms0+jA01kdRmoom454TyJwhh4Qh11ez87gBTBp17BspfbUWUDeNOV+evugyTWLTbAigqaEGAZYhJHThD0VlX/zJ/xrR6WnBEF8mxi7kOxHyvKQKlm/o0fV0NPpIEBhWsqwe2J96HBybfuqoTl7NlB3HYCBx94YpdIslUMS05aI/bqf3UjHBgIXriulWdFoiFUa/qRFruCEuWh0t7HoImqBUcBtS3oKQuf3H9AGPngPRxzYdG/ugSAeJEwGhRDQsT5c6ZO68SrBbtwIsV8wItxafLXjPQjn6K4FqTw+mQ6/gdfFvFig1cGRhj72wblKY0DohjDq2TL65VJdeT4KzJEf5qZ9IQMhk50oiJ9h5GufGgvMRLvAEsx2jD+vlSvAGuGPYWbrcPOo8DR13TnY1/eDWpUnOLM/q1FGFTIecUM4CzG9ERAHlrFnbIE4FkogdMcKR8nnb7nyxXJGcvqbgulYj8JVJkyRblU64gSEyTvuNlPl2BfsfHATsQFIxnkKCc0Rn8olnjbl+/ngYnq5X65jzKxbA9sxlV0/QKRWGxLumjvxqsAoHE4fsO2En7Vck4oL6blbTnOCYHYSGqhFxuKivuCTijq0v3EJ9L5pzIqTEMFkABM62T9pRyhsKUuIvuJaB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(136003)(39850400004)(346002)(366004)(6506007)(38100700001)(316002)(86362001)(31696002)(110136005)(66556008)(2616005)(76116006)(478600001)(26005)(66946007)(31686004)(66476007)(186003)(66446008)(64756008)(5660300002)(966005)(8936002)(2906002)(71200400001)(36756003)(54906003)(8676002)(83380400001)(6486002)(4326008)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ak56cGdRQUc5UU1mR0FabUdrZm9EblB5UlJXVUJEemxzZnNyMkZRR2oza3pQ?=
 =?utf-8?B?dXFGT3E1UzFsR09jbktSVEhJOWxBTExLMW5RaDRtVmtoUmdteWg3VVU5UVdv?=
 =?utf-8?B?U1B5MjVxK0pMZVhkZWtLalN6ampYUGhaenFob2tOU28xd0Y3NVlKMjVRbE5X?=
 =?utf-8?B?L1lyYzdnY1lnUXMvZmtKSy84Q0ZUT2lCaFpyRm8yY1JvTFVDdDBLVVNtdlM0?=
 =?utf-8?B?L3BnTUc5bTU3TFllRFFaZUwxL2l3M2ozQS80UzdVQ281ZmFKbFgwVTFERHJl?=
 =?utf-8?B?ZE4rMURubmNHOWIzWFQrc0hKU1lIVlJZSzhDN3c2UGNtYmNNM0s4MGFhZ0VE?=
 =?utf-8?B?alREd0tQb3lySnRZWW1QcExDSDJZeStNQzhjNElRVktVY3E2UlZUek9ZOGl0?=
 =?utf-8?B?eGYyeFNFZUhRQm1GMUlIK2ZKN01yVmljaHVTc1dsSHp1QzlkWTBmT1VzUGYz?=
 =?utf-8?B?TEwyV0NqVFFpVWhCUWNtTnJKMHdncGcyYVB5OVNPNkp5UHFocVpoQW01QTVX?=
 =?utf-8?B?OHBSQklNTWxHcVlCUklIdlFUZlVEbk4rZS9lb2dNMG5sbTdzZ3ZNQm1aY25p?=
 =?utf-8?B?czVmS21vWWU1a3RmRW93eE1vNzFqL0x3cWJ1VUt5NnJ5QlhTcnV5d1RvZXh2?=
 =?utf-8?B?bitTQkxNWllVR1ZCd21OSzh4TFQ2Rmp3cVpOb296TWZHWGFkNXNSM3FCSjVB?=
 =?utf-8?B?RzhsdWNLcmw3SG1zS3lpMDlsSHVRYUQ2QTV2ckpRM2lmdFpUc0tiajZUazk4?=
 =?utf-8?B?Q3pja0srR3psWUpVZ2gxVmxCRHU5c1U1ektOakRiRWcyK2RxWWtyTWlobVY2?=
 =?utf-8?B?cDBvdldzaFQ1ci9YVjU5Zll5TTBFN1NPNmhmZzJyYTRnYzdGK0RJYXJSaGJ1?=
 =?utf-8?B?QWVBd3BPUjk0c1hIV0h1Q2hGbXRJNVBKcVB6VzVIOS9jSkdzNjY0NzJyYndY?=
 =?utf-8?B?c0lBYUFHYVhQU0lBdGp4N3Q0M3N0ZUtLakVad0ZWV1JJNk45YmRMWXdPOHlZ?=
 =?utf-8?B?NDlabEg3TGpUUFdpb01HdExkeHZac2ZMVlFXR1c1VUhSYmd2OWFmR0JQOWdl?=
 =?utf-8?B?TGEvUDFqMytzbWNzbkRHYThteFZlWXhPRHBwRmptZkRWdlNlRmR4SHZXUzZ4?=
 =?utf-8?B?WXJwcEhiSkM2RmxhTjhIcmltZkErbG55bGxVa1hzcUhQQzlLdWRzVXpqMEtp?=
 =?utf-8?B?S3oreFhLYitiMVlRdVE4clV6VHpVcWppYllOTnkvUTdXNVgwTDF3RjVCcnBv?=
 =?utf-8?B?Sm5rNUpnY1IyZ2Z2bHNxbHB2Y3hVd0xmbzd1bGtBUXlKeUliNjVuRThwcExx?=
 =?utf-8?B?WERGT0NTYnJuSEFTMnN1V09haVNFREYwTFhMWGFQSWc4ejZDVkt6Y3V1eG5I?=
 =?utf-8?B?QTJXRnhLb1dOM2FYRXZpY2pmMkpWSkxkWXJ6d0twRTZTdFhENTBKZmQvOWlT?=
 =?utf-8?B?UlQrNldBRGwyYkUyNlJDWW1peFNZRzNORGdpbk92VXZvbWRRK0IvbUR5Q0x0?=
 =?utf-8?B?c1NNcXZmMXBMVjg4YVIyWkJObEJKOWEwcUJVWkZ5dWlXRkZhQ1lvTjE5UnBx?=
 =?utf-8?B?YTg5eld3L3NzMkpnUXd5emdZWWc5NW1XT3IvMmZXZmk5ajZPWWhZT202MFhz?=
 =?utf-8?B?L3hhV1Z4bnR6RWZjR2VZbHBJQ1hoTjB6Z1hoYjlhdTVCRHRkVU4wbG03cTNy?=
 =?utf-8?B?YjJSY3BlRlRYNnZ0QzRuREkwMGp6SzRkNDZxT2RZKyt3K2FuTEg2WDJ4aTVa?=
 =?utf-8?Q?NXXhHsB1zBbrhx67/Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CC25A499A40664F8CC309AA1F466097@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49661c9a-4514-4bea-7139-08d8f61440ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2021 20:16:52.0508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 72wyZrua0fYL2tO8+P/3G/UHln8v0oB6aqPxCQ1FC4ifLdmWNyfj1ADTL6iA/XWsRBai3pJLUCHtS77/oIeCyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3446
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVycnkgVG90aCB3cm90ZToNCj4gSGkNCj4gDQo+IE9wIDMwLTAzLTIwMjEgb20gMjM6NTcgc2No
cmVlZiBGZXJyeSBUb3RoOg0KPj4gSGkNCj4+DQo+PiBPcCAzMC0wMy0yMDIxIG9tIDIyOjI2IHNj
aHJlZWYgRmVycnkgVG90aDoNCj4+PiBIaSwNCj4+Pg0KPj4+IE9wIDMwLTAzLTIwMjEgb20gMTg6
MTcgc2NocmVlZiBGZWxpcGUgQmFsYmk6DQo+Pj4+IEhpLA0KPj4+Pg0KPj4+PiBBbmR5IFNoZXZj
aGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+IHdyaXRlczoNCj4+Pj4+IEhpIQ0KPj4+
Pj4NCj4+Pj4+IEkgaGF2ZSBhIHBsYXRmb3JtIHdpdGggRFdDMyBpbiBEdWFsIFJvbGUgbW9kZS4g
Q3VycmVudGx5IEknbQ0KPj4+Pj4gZXhwZXJpbWVudGluZyBvbiB2NS4xMi1yYzUgd2l0aCBhIGZl
dyBwYXRjaGVzIChtb3N0bHkgY29uZmlndXJhdGlvbikNCj4+Pj4+IGFwcGxpZWQgWzFdLiBJJ20g
dXNpbmcgRGViaWFuIFVuc3RhYmxlIG9uIHRoZSBob3N0IG1hY2hpbmUgYW5kDQo+Pj4+PiBCdWls
ZFJvb3Qgd2l0aCB0aGUgYWJvdmUgbWVudGlvbmVkIGtlcm5lbCBvbiB0aGUgdGFyZ2V0Lg0KPj4+
Pj4NCj4+Pj4+ICoqU28sIHNjZW5hcmlvIDA6DQo+Pj4+PiAxLiBSdW4gaXBlcmYzIC1zIG9uIHRh
cmdldA0KPj4+Pj4gMi4gUnVuIGlwZXJmMyAtYyAuLi4gLXQgMCBvbiB0aGUgaG9zdA0KPj4+Pj4g
My7CoCAwLjAwLTEwLjM2wqAgc2VjwqDCoCAyMzcgTUJ5dGVzwqDCoCAxOTIgTWJpdHMvc2VjwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPj4+Pj4gcmVjZWl2ZXINCj4+Pj4+DQo+
Pj4+PiAqKlNjZW5hcmlvIDE6DQo+Pj4+PiAxLiBOb3csIGRldGFjaCBVU0IgY2FibGUsIHdhaXQg
Zm9yIHNldmVyYWwgc2Vjb25kcywgYXR0YWNoIGl0IGJhY2ssDQo+Pj4+PiByZXBlYXQgYWJvdmU6
DQo+Pj4+PiAwLjAwLTkuOTTCoMKgIHNlY8KgwqAgMjA5IE1CeXRlc8KgwqAgMTc2IE1iaXRzL3Nl
YyByZWNlaXZlcg0KPj4+Pj4NCj4+Pj4+IE5vdGUgdGhlIGJhbmR3aWR0aCBkcm9wICgxNzcgdnMu
IDE5MikuDQo+Pj4+Pg0KPj4+Pj4gKFJlcGVhdGluZyBzY2VuYXJpbyAxIHdpbGwgZ2l2ZSBub3cg
dGhlIHNhbWUgcmVzdWx0KQ0KPj4+Pj4NCj4+Pj4+ICoqU2NlbmFyaW8gMi4NCj4+Pj4+IDEuIERl
dGFjaCBVU0IgY2FibGUsIGF0dGFjaCBhIGRldmljZSwgZm9yIGV4YW1wbGUgVVNCIHN0aWNrLA0K
Pj4+Pj4gMi4gU2VlIGl0IGJlaW5nIGVudW1lcmF0ZWQgYW5kIGRldGFjaCBpdC4NCj4+Pj4+IDMu
IEF0dGFjaCBjYWJsZSBmcm9tIGhvc3QNCj4+Pj4+IDQgLsKgwqAgMC4wMC0xOS4zNsKgIHNlY8Kg
wqAgMzE1IE1CeXRlc8KgwqAgMTM2IE1iaXRzL3NlY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqANCj4+Pj4+IHJlY2VpdmVyDQo+Pj4+Pg0KPj4+Pj4gTm90ZSBldmVuIG1vcmUgYmFu
ZHdpZHRoIGRyb3AhDQo+Pj4+Pg0KPj4+Pj4gKFJlcGVhdGluZyBzY2VuYXJpbyAxIGtlZXBzIHRo
ZSBzYW1lIGxvd2VyIGJhbmR3aWR0aCkNCj4+Pj4+DQo+Pj4+PiBOT1RFLCBzb21ldGltZXMgb24g
dGhpcyBzY2VuYXJpbyBhZnRlciBzZXZlcmFsIHNlY29uZHMgdGhlIHRhcmdldA0KPj4+Pj4gc2lt
cGx5IHJlYm9vdHMgKHcvbyBhbnkgbG9ncyBbZnJvbSBrZXJuZWxdIHByaW50ZWQpIQ0KPj4+Pj4N
Cj4+Pj4+IFNvLCBhbnkgcG9pbnRlcnMgb24gaG93IHRvIGRlYnVnIGFuZCB3aGF0IGNhbiBiZSBh
IHNtb2tpbmcgZ3VuIGhlcmU/DQo+Pj4+Pg0KPj4+Pj4gRmVycnkgcmVwb3J0ZWQgdGhpcyBpbiBb
Ml0uIFRoZXJlIGFyZSBkaWZmZXJlbnQga2VybmVsIHZlcnNpb25zIGFuZA0KPj4+Pj4gdG9vbHMg
dG8gZXN0YWJsaXNoIHRoZSBjb25uZWN0aW9uIChsaWtlIGNvbm5tYW4gdnMuIG5vbmUgaW4gbXkg
Y2FzZSkuDQo+Pj4+Pg0KPj4+Pj4gWzFdOg0KPj4+Pj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92
My9fX2h0dHBzOi8vZ2l0aHViLmNvbS9hbmR5LXNoZXYvbGludXgvX187ISFBNEYyUjlHX3BnIUtw
UW51ZEhJSzZYZ0s2SGJQYXF0YlZnaXBEbWtOQldld28tZXVBSXVCbEdkdFNpYVFpSjhqTG45T29N
RXBwRzZxcS1kJA0KPj4+Pj4gWzJdOg0KPj4+Pj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vZ2l0aHViLmNvbS9hbmR5LXNoZXYvbGludXgvaXNzdWVzLzMxX187ISFBNEYyUjlH
X3BnIUtwUW51ZEhJSzZYZ0s2SGJQYXF0YlZnaXBEbWtOQldld28tZXVBSXVCbEdkdFNpYVFpSjhq
TG45T29NRXB0TUNycC1GJA0KPj4+Pg0KPj4+PiBkd2MzIHRyYWNlcG9pbnRzIHNob3VsZCBnaXZl
IHNvbWUgaW5pdGlhbCBoaW50cy4gTG9vayBhdCBwYWNrZXRzIHNpemVzDQo+Pj4+IGFuZCBwZXJp
b2Qgb2YgdHJhbnNtaXNzaW9uLiBGcm9tIGR3YzMgc2lkZSwgSSBjYW4ndCB0aGluayBvZg0KPj4+
PiBhbnl0aGluZyB3ZQ0KPj4+PiB3b3VsZCBkbyB0byB0aHJvdHRsZSB0aGUgdHJhbnNtaXNzaW9u
LCBidXQgdHJhY2Vwb2ludHMgc2hvdWxkIHRlbGwgYQ0KPj4+PiBjbGVhcmVyIHN0b3J5Lg0KPj4+
Pg0KPj4+IE15IHRlc3RpbmcgKGJ1dCB5ZXMsIHdpdGggZGlmZmVyZW5jZSBrZXJuZWwgYW5kIG5l
dHdvcmsgbWFuYWdlZCBieQ0KPj4+IGNvbm5tYW4pIHNob3dzOg0KPj4+DQo+Pj4gMSkgb24gY29s
ZCBib290IGVlbSBuZXR3b3JrIGdhZGdldCB3b3JrcyBmaW5lDQo+Pj4NCj4+PiAyKSBhZnRlciB1
bnBsdWcgb3Igd2FybSByZWJvb3QgKHdoaWNoIGlzIGFsc28gYW4gdW5wbHVnKSBpdCdzIGJyb2tl
biwNCj4+PiBzcGVlZCBpcyBsb3N0ICh8MTIuMCBNYml0cy9zZWMgZnJvbSAyMDBNYi9zIG5vcm1h
bGx5KXwsIHBhY2tldHMgbG9zdCwNCj4+PiBubyBjb25maWd1cmF0aW9uIHJlY2VpdmVkIGZyb20g
ZGhjcCwgb2NjYXNpb25hbCByZWJvb3QsIG9ubHkgd2F5IHRvDQo+Pj4gZml4IGlzIGNvbGQgYm9v
dA0KPj4+DQo+Pj4gMykgaWYgYmVmb3JlIHVucGx1ZyBgY29ubm1hbmN0bCBkaXNhYmxlIGdhZGdl
dGAsIG9uIHJlcGx1Z2dpbmcgYW5kDQo+Pj4gZW5hYmxpbmcgaXQgd29ya3MgZmluZQ0KPj4+DQo+
Pj4gTXkgdGhlb3J5IGlzIHRoYXQgc29tZSBIVyByZWdpc3RlciBpcyBkaXN0dXJiZWQgb24gYSBz
dXJwcmlzZSB1bnBsdWcsDQo+Pj4gYnV0IG5vdCByZXNldCBvbiBwbHVnIG9yIHdhcm0gYm9vdC4g
QnV0IG9uIGNvbGQgYm9vdCBpcyBjbGVhcmVkLg0KPj4+IE1heWJlIHRoYXQgY2FuIGhlbHAgdG8g
bmFycm93IGRvd24gdHJhY2Vwb2ludHM/DQo+Pj4NCj4+IEkgY2FwdHVyZWQgYSBwbHVnIGFmdGVy
IHdhcm0gYW5kIGFmdGVyIGNvbGQgYm9vdC4gVGhpcyBpbmNsdWRlcw0KPj4gbmV0d29yayBzZXR1
cCAoZGhjcCkuIFlvdSBjYW4gZmluZCBpdCBpbiBbMl0gb3IgZGlyZWN0bHkgbGluayBoZXJlOg0K
Pj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS9hbmR5LXNo
ZXYvbGludXgvZmlsZXMvNjIzMjQxMC9ib290LnppcF9fOyEhQTRGMlI5R19wZyFLcFFudWRISUs2
WGdLNkhiUGFxdGJWZ2lwRG1rTkJXZXdvLWV1QUl1QmxHZHRTaWFRaUo4akxuOU9vTUVwamhocndh
LSQNCj4gDQo+IA0KPiBXaGlsZSB0aGUgYWJvdmUgdHJhY2VzIGluIGJvb3QuemlwIGFsbG93IGNv
bXBhcmUgd2hpY2ggcmVncyBub3QNCj4gY29ycmVjdGx5IGluaXRpYWxpemVkIG9uIHdhcm0gYm9v
dCwgSSBoYXZlIG5vdyBjYXB0dXJlZCB0cmFjZXMgb2YNCj4gdW5wbHVnL3BsdWcuDQo+IA0KPiBI
ZXJlIGtlcm5lbCBpcyA1LjEwLjI3IChMVFMpLCBjb2xkIGJvb3RlZCB3aXRoIFVTQiBjYWJsZSBw
bHVnZ2VkIGFuZCB0aGUNCj4gZWVtIGdhZGdldCBuZXR3b3JrIHNldHVwIChkaGNwKS4gVGhlbiB0
cmFjZSB1bnBsdWcuIFRoZW4gdHJhY2UgcGx1Zy4NCj4gDQo+IEFmdGVyIHBsdWcgdGhlIGVlbSBj
b25uZWN0aW9uIGlzIGFnYWluIGJyb2tlbi4NCj4gDQo+IFRoaXMgbWlnaHQgYWxsb3cgZmlndXJp
bmcgb3V0IHdoYXQgZ29lcyB3cm9uZyBvbiB1bnBsdWcuIFRyYWNlcyBoZXJlOg0KPiBodHRwczov
L3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL2FuZHktc2hldi9saW51eC9m
aWxlcy82MjUwOTI0L3BsdWctdW5wbHVnLnppcF9fOyEhQTRGMlI5R19wZyFLcFFudWRISUs2WGdL
NkhiUGFxdGJWZ2lwRG1rTkJXZXdvLWV1QUl1QmxHZHRTaWFRaUo4akxuOU9vTUVwZ2lpODJOUyQN
Cj4gKioNCj4gDQoNCkhpLA0KDQpXZXJlIHlvdSBhYmxlIHRvIG5hcnJvdyBkb3duIHRoZSBpc3N1
ZSB0byBvbmx5IERXQzMgZGV2aWNlPyAoaS5lLiB5b3UNCnRlc3RlZCB3aXRoIGRpZmZlcmVudCBo
b3N0cyBhbmQgZGlmZmVyZW50IGRldmljZSBjb250cm9sbGVycyB0byBjb25maXJtDQp0aGlzKQ0K
DQpEaWQgeW91IHNlZSB0aGlzIGlzc3VlIHByZXZpb3VzbHk/IElmIG5vdCwgaXMgaXQgcG9zc2li
bGUgdG8gZG8gZ2l0DQpiaXNlY3Rpb24/DQoNCkJSLA0KVGhpbmgNCg==
