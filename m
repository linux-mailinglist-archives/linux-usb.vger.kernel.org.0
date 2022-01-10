Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5436248A09D
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 21:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245389AbiAJUDD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 15:03:03 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:51440 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243444AbiAJUDB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 15:03:01 -0500
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 809D642656;
        Mon, 10 Jan 2022 20:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1641844979; bh=lnJTX+Xjgfg2wuGg7lqMHeylxKeMpXxKCN/8X7FB5wc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=R1rjRF8P/Mrj5qD9tKFSwXnPMKe80IEBcp0KKWHRwAZRVh3z2CHijt2KpTrLBGwkz
         /D33Lf8L+kMLzkhb6SKn++b5lHkMk2HbzvXZOsnBuyObIX6/RqeSS9QzaIvuNKRMrR
         UekyEyuojddOda52KYMrCGHSjqB1NXvZVDEmDpurf2bpHt4WG9WmuSVhgdaQFB5r8t
         PB8s9AhSsDamFTXz/SybheHbegu38qH0brlhXbSjPI0cSVDFXHVZicZN/B5fvOk6p0
         El2RS68OentuIF683Yut2Bv6lkcuDfnEhFc4Kc/dXkGXzKq4VNZBB8dB15T1TLdKbr
         xJi1wBRvjGpfQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 81218A0081;
        Mon, 10 Jan 2022 20:02:58 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5435B4009D;
        Mon, 10 Jan 2022 20:02:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="XuLcM+Po";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEbnCd2UI5VVmDybTiRqNEBF2eGNjWRKrK9+ePJRrLbZBlbEhQ8l+1+duUPYtCdux7Z730Ln4owBApgGizTcC08nvgqgmR8U5mvbUdiJFbVg3SnZkCGh1zsebi56muhFRKJblsxTvxiTqX3D5pM/vJ89WZfN8tRP0RhG9YncmHdABDbUNdIpsO0Wwsvt+y6anuxCXinMizTXDOy+EZHsQgYY9/f3M6/U05VZ003pMFJQzWyPP5+SqwcdhElYSQOUWWFyZWpwyP7k9afdXOaXq0kjlSIuuBc0cExuTq1R2/FIIl6Gwd16Ao80uJpJH3IwlP6ZLIJSt8VPWMcBlOIEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnJTX+Xjgfg2wuGg7lqMHeylxKeMpXxKCN/8X7FB5wc=;
 b=icQ4C1ttkywOx4KBqW9J9fFr3xg225AcUL+YYlhY+J5nkbJ86D+5HT7msw8ZSjC0RSusJFwZZ3UzkC8cgi86NLRme1qPInJdpblDESeWOG9TFjdIZyarv2P+JqC3QwVZNQ3OClyJ6tLyQ8bTtyQmYpBcBrvIcpJfyjb7LzUg84FdDCD40X6VC6M9eArlbGRpiskvMYkh+vzpJSmip+skmD2RezooEOx2pAAmX8kyLGtfZx1tGo9+RZTyMUhw+thHP5ZjZSAUgIrT755Q3C3+iyzCw3WlJ5ztdHdPwHxhugsm4i+4uhbUw58tVyXooOVLxkF8CJlzHFMiZ9dGfVRHJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnJTX+Xjgfg2wuGg7lqMHeylxKeMpXxKCN/8X7FB5wc=;
 b=XuLcM+Po6D95GQK6KWGoBCs8dx8lQ1OxIDk1mWFOviEcgAarf+yijTFHTL6LR7OLyaEbzJFhROoG/DybPVkrW+8mc2NAs9MFEQjTttStBH57bJpJXgg+hMp9I0n4vTRkuBMdSWs36xS+jXHY6bOmjHCrprzgnqwM4qGOD6kEt+Q=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3047.namprd12.prod.outlook.com (2603:10b6:a03:d9::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 20:02:55 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::cba:198c:5d48:b0a1]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::cba:198c:5d48:b0a1%3]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 20:02:54 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "mounika.grace.akula@xilinx.com" <mounika.grace.akula@xilinx.com>,
        "manish.narani@xilinx.com" <manish.narani@xilinx.com>
Subject: Re: [PATCH v2 4/5] usb: dwc3: add reference clock FLADJ configuration
Thread-Topic: [PATCH v2 4/5] usb: dwc3: add reference clock FLADJ
 configuration
Thread-Index: AQHYBll5A6wUuwhokEe78UVQos+Y9KxcrWeA
Date:   Mon, 10 Jan 2022 20:02:53 +0000
Message-ID: <fa1c8f87-4e2a-8be6-cb79-4811de19934a@synopsys.com>
References: <20220110193641.1368350-1-robert.hancock@calian.com>
 <20220110193641.1368350-5-robert.hancock@calian.com>
In-Reply-To: <20220110193641.1368350-5-robert.hancock@calian.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b34faa03-2930-4578-f980-08d9d474309e
x-ms-traffictypediagnostic: BYAPR12MB3047:EE_
x-microsoft-antispam-prvs: <BYAPR12MB30479DD9B3A9D502CEE125B4AA509@BYAPR12MB3047.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 02GFraFiQsVRME/KRP5Q/e+FMtvtwZue+ZWh4OxwiYtd0DP324HPrmZrxicUd6yu6ibTaXfchraEHwZ5wgwU8o5bVSbnU0vqP10vpiwdLupYeiq1ezPMlLMzrkKqi2O88nUEy84sM5GNX2oOxomUT94LIIe1sFEmgtdrhwXCxnY9tfeVWOi152WrKWAkQXGYriHELGNwRXPgg7CMXy962v60YsiVbljc4R9I7GGIlZQ32B9sUBVWLNgegPfE3bWAgKOXTHIb/dZgSA1OCbDdeKu/cVjB7U/JgeFLZUNKexkitAkPS4yA8lUhD6jmr54J/6eVv7zg+bx51Bh3nun/H6bb9KsYhE499/KB+5yvOyhJNKkWbFjH6RCbwfifDjsQIoAnQLZbN2JUjD1c4oknxkm7UbqHJz1rjMk375ESHjA4m/wSplga3vVGaK806D++8ZB2lCS3LmzfEIy4x1AQ9wwznds2tSTgRH7C8Z6Gelw+uGkp4fE2zIuval0HekeigRDTFazjxh2MGO4eE/3zeUWXqJ3OiS1+TdXq81f1s9gmg3buoSPHMgCnRPW1BVFK0ypHFYVrX6pUrBeTDDzpNhTZvCoaDTkJHtqjEdu49tc8k3G8/Txh8W650yrvOrgtc/En3M8HaRdSMkGa/+WIuItnUi/CwieSkvyPGzuY9KIolV5GBjelYbbuofiHoL4jJLQ+++qPebmBcXUY5R29+4+x847avHTOirv3eGIFFf7fsRUZhRfTCuHQRecvrcR64NF1bJluFSc2+dZcvc9Upm9fjFDdF+k3jhV6J8annml/ApodrdUY9nfpA+zO+C3MlgiQ/DONvty39Odb9XdvCOWSu5PCIG99IyguSjpcKbs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(31686004)(6486002)(31696002)(8676002)(26005)(6512007)(508600001)(966005)(122000001)(6506007)(2906002)(186003)(36756003)(5660300002)(4326008)(71200400001)(316002)(86362001)(2616005)(83380400001)(76116006)(66946007)(38100700002)(38070700005)(110136005)(8936002)(54906003)(66556008)(64756008)(66446008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUZkKzZtL1FDQjlWVENZZlJyN21aS3VpVmtwdzhqUDN1U3NKWURFa0JIb20v?=
 =?utf-8?B?U1l0V3ovSTBxT0xTdktsWlhFVVpMbTlwdEtZNnJ2Ny9LMmZpMUpxVitaMWg3?=
 =?utf-8?B?elhLTER2Wm9NSG92aGpZcUtKYkFCRlE3dk5XSURyeVdpaTQ2SElRTjBLQk4z?=
 =?utf-8?B?SEJ1UDkvNGQzY3lEM3lWeENCVDhEd2hZc0hjdmM5b3JzTEZwak4rOFdTemtX?=
 =?utf-8?B?YUpWblVtdzJBcTBQc2VQcDVZOWZzR3pxWFdzTzZmMGFVZ3o1d3FxWDRqNHdq?=
 =?utf-8?B?NS9aQXk1OVp6Ym85V2dDS0VQbmo3dkNoenE5cDNnb29HNlMvL2svaGIwSC96?=
 =?utf-8?B?aCtrYXBGN04rSStwMVlRUy9iWHpPT1dpQmVLZ0xveCs4dENqQkp4SnpWZ3kx?=
 =?utf-8?B?L0kzbytuS1pTRnZSMGZQMWR2ek1uMjNHczhoMnkwdGNxZkM1eDNCcC95QnZu?=
 =?utf-8?B?R3FPWWVJdDNwVW1wV3JJcXBZbUxXMFRsOFBLL1dIWjFqRWxLOW45cnM5ZkJF?=
 =?utf-8?B?NGVUL3hpUVFERkQ1NDZkbDQ5bTVuSHlhSEVNZkt1bklxN3Y2eEZLaC9Qb0c1?=
 =?utf-8?B?UzVOSmxzVFVUWXNBKzBWZTFYNEZzWncyWm1aL29KOWhFZEpob3JDYVErZmFl?=
 =?utf-8?B?NFlsTlJXOExadDQvWVlwZjAyOWlMZkdJYUIreUt2UURBeWQxUHdlRThjU1BQ?=
 =?utf-8?B?SXR1ck1ac2l5cXZMVHg2T3cvNGt1Y1BGKzhSUlRvQUFLb1lZeDI3L3lGRnRT?=
 =?utf-8?B?Mk1iYXM0andWemhPTUU5dy9rSVNMWHdiY0UraG9KLzUzNXpxTytoVzRhOFov?=
 =?utf-8?B?U2ttbGJUK0lqT2VldTJkUTFuVzcxdTBZb2wwU2p4RVN4dzh3VW5zYnRkdWlN?=
 =?utf-8?B?QlhOK1VmK1E2Rk5qUmxRZUtGKzlzWXB1VENKcUFkQ1hFaWNTaG9CaEFSNGFY?=
 =?utf-8?B?M0drVHQxSUZvWFF4L2tPUTZpMUpoeVdBZ09JN205TnF6cU5QeXdxSTJoRmpl?=
 =?utf-8?B?Q3FHd1p6V1kveUl2bHJ0WjNzT0M5NXpwVkplU1oyTzlGWUg4MEgzY3ZVb2hH?=
 =?utf-8?B?Z3BkVE1SWDlxRUp0UWtUOFIzNXRSV0NUQkdsbllxSWgrRUlmZmNlSThPV2Y1?=
 =?utf-8?B?UTFGZFlSQ1Z0cmJuWGE1bS84eVNMeUpRZkF0MmYveCtHYUJnWmQvOWYyUURH?=
 =?utf-8?B?ZVkzUHNnaWtzamNJcUpKR2Foek1Fb3pNK2p4MHdSdWxJSjI4SEZmZUFCcVdP?=
 =?utf-8?B?dUZSem1XRnIzK3FUSloyUU9sbFpyY0F3Q0l1RVNqamYvT1ovT05COXFYM3hV?=
 =?utf-8?B?cHRraTBPejhpTk1teWRIRVdyZjBYSXY5c3JoZ0s4K1BYYVltdytlc3BQOU0z?=
 =?utf-8?B?RUlyUzBPa2FXZjdMM2hZVDFjMldNTnhCMDRjNEV3TzgrQ3lMc2R0QmQvdnlR?=
 =?utf-8?B?MlZWQTlhMDhNUklObkUyanhJU1RFMTF5OHRrZ1puVXBrR1E2T1MyeGl0TTRq?=
 =?utf-8?B?NCt5V0Ewc1FqOEVFYy96eHFvdDQxTVNYTnIwQzBQSWJWTUpTZGoxcjdqQzRj?=
 =?utf-8?B?WHNWWkplM0xBaGVWN0dvYVNoUmdRSzc5cE5Wb2VNM0tKQTZsOFcrR2VDU2Rq?=
 =?utf-8?B?MGdSeUZXN0pQd1Fuc01UMXNFODVXNE5FOWFhcHp0RDZLS1Fnam9kSWVuRXpp?=
 =?utf-8?B?R1BnN0IwdGplOFVHS0wzZDEzek5aS3FVb2RnQzA2WXZKNk4zeW5IaVpYUnpv?=
 =?utf-8?B?SXVwSEVBRTRYOGl0K09UNWk4bVdXY1JPTzRGRFBwVmdUVEZIMnpDblgxUnhM?=
 =?utf-8?B?azBkRWM3cjhLblRxUTEzdHVCbGM0ZERKMWZkWnYwOFZabjd5djh4citvZVBS?=
 =?utf-8?B?RE5Yb3lTeWpkMnR4ZDBMblJkQlhZMUVqalM2NUd0ZUl5NVhsTHYzOFpyamxx?=
 =?utf-8?B?RExQT2pTYjJsQWl4MEg5T2pRSjJpd2ZYTVN5cnZIaDdibkZxQ0VjdUwxZ05F?=
 =?utf-8?B?OUxIZmR6N2xwWDNKV3pwbXNLVDJtNlVrUm5oMEhkTEliT1M0anJyMDVtTGUr?=
 =?utf-8?B?M2JScVVURG0wZGxjenZwVGIyaDJUNThPYVFnVVd1TVc0UU5JaHFqcSs3N1Mw?=
 =?utf-8?B?T09uMTY4UDEyaEVZOGNHYnkxUk9TeFZJdlFsWTJKRkhKcVN3YTNuVC9qQ3VO?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0A03BC62791BF469E6A5868FD186284@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34faa03-2930-4578-f980-08d9d474309e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 20:02:53.8687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XA/6VVaBVgsi0rs5/CrlVB1TBnJ3J7MjU9L1srlPA7loZpkwzX7JTAOxjfDyKRTF13kqaLb03A9h1Bl3aavXCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3047
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Um9iZXJ0IEhhbmNvY2sgd3JvdGU6DQo+IFByZXZpb3VzbHkgYSBkZXZpY2UgdHJlZSBwcm9wZXJ0
eSB3YXMgYWRkZWQgdG8gYWxsb3cgb3ZlcnJpZGluZyB0aGUNCj4gcmVmZXJlbmNlIGNsb2NrIHBl
cmlvZCBwYXJhbWV0ZXIgaWYgdGhlIGRlZmF1bHQgdmFsdWUgdXNlZCB3YXMgaW5jb3JyZWN0Lg0K
PiBIb3dldmVyLCB0aGVyZSBpcyBhbm90aGVyIHJlZ2lzdGVyIGZpZWxkLCBHRkxBREpfUkVGQ0xL
X0ZMQURKLCB3aGljaA0KPiByZWZsZWN0cyB0aGUgZnJhY3Rpb25hbCBuYW5vc2Vjb25kIHBvcnRp
b24gb2YgdGhlIHJlZmVyZW5jZSBjbG9jaw0KPiBwZXJpb2QuIEFkZCBhIHNucHMscmVmLWNsb2Nr
LWZsYWRqIHByb3BlcnR5IHRvIGFsbG93IGNvbmZpZ3VyaW5nIHRoaXMNCj4gYXMgd2VsbC4NCj4g
DQo+IE9uIHRoZSBYaWxpbnggWnlucU1QIHBsYXRmb3JtLCB0aGUgcmVmZXJlbmNlIGNsb2NrIGFw
cGVhcnMgdG8gYWx3YXlzDQo+IGJlIDIwIE1IeiwgZ2l2aW5nIGEgY2xvY2sgcGVyaW9kIG9mIDUw
IG5zLiBIb3dldmVyLCB0aGUgZGVmYXVsdCB2YWx1ZQ0KPiBvZiBHRkxBREpfUkVGQ0xLX0ZMQURK
IHdhcyAxMDA4IHJhdGhlciB0aGFuIDAgYXMgaXQgc2hvdWxkIGhhdmUgYmVlbiwNCj4gd2hpY2gg
cHJldmVudGVkIG1hbnkgVVNCIGRldmljZXMgZnJvbSBmdW5jdGlvbmluZyBwcm9wZXJseS4gVGhl
DQo+IHBzdV9pbml0IGNvZGUgcnVuIGJ5IHRoZSBYaWxpbnggZmlyc3Qtc3RhZ2UgYm9vdCBsb2Fk
ZXIgc2V0cyB0aGlzDQo+IHZhbHVlIHRvIDAsIGhvd2V2ZXIgd2hlbiB0aGUgY29udHJvbGxlciBp
cyByZXNldCBieSB0aGUgZHdjMy14aWxpbngNCj4gbGF5ZXIsIHRoZSBpbmNvcnJlY3QgZGVmYXVs
dCB2YWx1ZSBpcyByZXN0b3JlZC4gVGhpcyBjb25maWd1cmF0aW9uDQo+IHByb3BlcnR5IGFsbG93
cyBlbnN1cmluZyB0aGF0IHRoZSBjb3JyZWN0IHZhbHVlIGlzIGFsd2F5cyB1c2VkLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUm9iZXJ0IEhhbmNvY2sgPHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCAzNSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggfCAgMyArKysN
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gaW5k
ZXggZjRjMDk5NTFiNTE3Li5lYTExZmQxZTNiNDIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNi
L2R3YzMvY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IEBAIC0zNTks
NiArMzU5LDM3IEBAIHN0YXRpYyB2b2lkIGR3YzNfcmVmX2Nsa19wZXJpb2Qoc3RydWN0IGR3YzMg
KmR3YykNCj4gIH0NCj4gIA0KPiAgDQo+ICsvKioNCj4gKyAqIGR3YzNfcmVmX2Nsa19mbGFkaiAt
IFJlZmVyZW5jZSBjbG9jayBwZXJpb2QgYWRqdXN0bWVudCBjb25maWd1cmF0aW9uDQo+ICsgKiBH
RkxBREpfUkVGQ0xLX0ZMQURKIHNob3VsZCBiZSBzZXQgYmFzZWQgb24gdGhlIGZyYWN0aW9uYWwg
cG9ydGlvbiBvZiB0aGUNCj4gKyAqIHJlZmVyZW5jZSBjbG9jayBwZXJpb2QsIHdoZXJlIHRoZSBp
bnRlZ2VyIHBvcnRpb24gaXMgc2V0IGluIEdVQ1RMX1JFRkNMS1BFUi4NCj4gKyAqIENhbGN1bGF0
ZWQgYXM6ICgoMTI1MDAwL3JlZl9jbGtfcGVyaW9kX2ludGVnZXIpLSgxMjUwMDAvcmVmX2Nsa19w
ZXJpb2QpKSAqIHJlZl9jbGtfcGVyaW9kDQo+ICsgKiB3aGVyZSByZWZfY2xrX3BlcmlvZF9pbnRl
Z2VyIGlzIHRoZSBwZXJpb2Qgc3BlY2lmaWVkIGluIEdVQ1RMX1JFRkNMS1BFUiBhbmQNCj4gKyAq
IHJlZl9jbGtfcGVyaW9kIGlzIHRoZSBwZXJpb2QgaW5jbHVkaW5nIGZyYWN0aW9uYWwgdmFsdWUu
DQo+ICsgKiBUaGlzIHZhbHVlIGNhbiBiZSBzcGVjaWZpZWQgaW4gdGhlIGRldmljZSB0cmVlIGlm
IHRoZSBkZWZhdWx0IHZhbHVlIGlzIGluY29ycmVjdC4NCj4gKyAqIE5vdGUgdGhhdCAwIGlzIGEg
dmFsaWQgdmFsdWUuDQoNCk1pbm9yIG5pdC4gQ2FuIHlvdSBmb2xsb3cgdGhlIGtlcm5lbC1kb2Mg
Zm9ybWF0IGZvciBicmllZi9sb25nIGRlc2NyaXB0aW9uDQoNCmh0dHBzOi8vd3d3Lmtlcm5lbC5v
cmcvZG9jL2h0bWwvbGF0ZXN0L2RvYy1ndWlkZS9rZXJuZWwtZG9jLmh0bWwNCg0KPiArICoNCj4g
KyAqIEBkd2MzOiBQb2ludGVyIHRvIG91ciBjb250cm9sbGVyIGNvbnRleHQgc3RydWN0dXJlDQo+
ICsgKi8NCj4gK3N0YXRpYyB2b2lkIGR3YzNfcmVmX2Nsa19mbGFkaihzdHJ1Y3QgZHdjMyAqZHdj
KQ0KPiArew0KPiArCXUzMiByZWc7DQo+ICsJdTMyIHJlZ19uZXc7DQo+ICsNCj4gKwlpZiAoRFdD
M19WRVJfSVNfUFJJT1IoRFdDMywgMjUwQSkpDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCWlmICgh
ZHdjLT5yZWZfY2xrX2ZsYWRqX3NldCkNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJcmVnID0gZHdj
M19yZWFkbChkd2MtPnJlZ3MsIERXQzNfR0ZMQURKKTsNCj4gKwlyZWdfbmV3ID0gcmVnICYgfkRX
QzNfR0ZMQURKX1JFRkNMS19GTEFESl9NQVNLOw0KPiArCXJlZ19uZXcgfD0gRklFTERfUFJFUChE
V0MzX0dGTEFESl9SRUZDTEtfRkxBREpfTUFTSywgZHdjLT5yZWZfY2xrX2ZsYWRqKTsNCj4gKwlp
ZiAocmVnX25ldyAhPSByZWcpDQo+ICsJCWR3YzNfd3JpdGVsKGR3Yy0+cmVncywgRFdDM19HRkxB
REosIHJlZ19uZXcpOw0KPiArfQ0KPiArDQo+ICsNCj4gIC8qKg0KPiAgICogZHdjM19mcmVlX29u
ZV9ldmVudF9idWZmZXIgLSBGcmVlcyBvbmUgZXZlbnQgYnVmZmVyDQo+ICAgKiBAZHdjOiBQb2lu
dGVyIHRvIG91ciBjb250cm9sbGVyIGNvbnRleHQgc3RydWN0dXJlDQo+IEBAIC0xMDMzLDYgKzEw
NjQsNyBAQCBzdGF0aWMgaW50IGR3YzNfY29yZV9pbml0KHN0cnVjdCBkd2MzICpkd2MpDQo+ICAN
Cj4gIAkvKiBBZGp1c3QgUmVmZXJlbmNlIENsb2NrIFBlcmlvZCAqLw0KPiAgCWR3YzNfcmVmX2Ns
a19wZXJpb2QoZHdjKTsNCj4gKwlkd2MzX3JlZl9jbGtfZmxhZGooZHdjKTsNCj4gIA0KPiAgCWR3
YzNfc2V0X2luY3JfYnVyc3RfdHlwZShkd2MpOw0KPiAgDQo+IEBAIC0xNDE4LDYgKzE0NTAsOSBA
QCBzdGF0aWMgdm9pZCBkd2MzX2dldF9wcm9wZXJ0aWVzKHN0cnVjdCBkd2MzICpkd2MpDQo+ICAJ
CQkJICZkd2MtPmZsYWRqKTsNCj4gIAlkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoZGV2LCAic25w
cyxyZWYtY2xvY2stcGVyaW9kLW5zIiwNCj4gIAkJCQkgJmR3Yy0+cmVmX2Nsa19wZXIpOw0KPiAr
CWlmICghZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKGRldiwgInNucHMscmVmLWNsb2NrLWZsYWRq
IiwNCj4gKwkJCQkgICAgICAmZHdjLT5yZWZfY2xrX2ZsYWRqKSkNCj4gKwkJZHdjLT5yZWZfY2xr
X2ZsYWRqX3NldCA9IHRydWU7DQo+ICANCj4gIAlkd2MtPmRpc19tZXRhc3RhYmlsaXR5X3F1aXJr
ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsDQo+ICAJCQkJInNucHMsZGlzX21ldGFz
dGFiaWxpdHlfcXVpcmsiKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5o
IGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gaW5kZXggZTFjYzNmNzM5OGZiLi42NTBkNGMy
ZTdhNjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ICsrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IEBAIC0zODgsNiArMzg4LDcgQEANCj4gIC8qIEdsb2Jh
bCBGcmFtZSBMZW5ndGggQWRqdXN0bWVudCBSZWdpc3RlciAqLw0KPiAgI2RlZmluZSBEV0MzX0dG
TEFESl8zME1IWl9TREJORF9TRUwJCUJJVCg3KQ0KPiAgI2RlZmluZSBEV0MzX0dGTEFESl8zME1I
Wl9NQVNLCQkJMHgzZg0KPiArI2RlZmluZSBEV0MzX0dGTEFESl9SRUZDTEtfRkxBREpfTUFTSwkJ
MHgzZmZmMDANCj4gIA0KPiAgLyogR2xvYmFsIFVzZXIgQ29udHJvbCBSZWdpc3RlciovDQo+ICAj
ZGVmaW5lIERXQzNfR1VDVExfUkVGQ0xLUEVSX01BU0sJCTB4ZmZjMDAwMDANCj4gQEAgLTExNjYs
NiArMTE2Nyw4IEBAIHN0cnVjdCBkd2MzIHsNCj4gIA0KPiAgCXUzMgkJCWZsYWRqOw0KPiAgCXUz
MgkJCXJlZl9jbGtfcGVyOw0KPiArCWJvb2wJCQlyZWZfY2xrX2ZsYWRqX3NldDsNCj4gKwl1MzIJ
CQlyZWZfY2xrX2ZsYWRqOw0KDQpDYW4geW91IGFsc28gZG9jdW1lbnQgdGhlc2UgbmV3IHN0cnVj
dCBtZW1iZXJzLg0KDQo+ICAJdTMyCQkJaXJxX2dhZGdldDsNCj4gIAl1MzIJCQlvdGdfaXJxOw0K
PiAgCXUzMgkJCWN1cnJlbnRfb3RnX3JvbGU7DQoNCg0KRm9yIHRoaXMgcGF0Y2g6DQpSZXZpZXdl
ZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3Mh
DQpUaGluaA0K
