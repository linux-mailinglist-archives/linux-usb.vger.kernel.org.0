Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83559376FFD
	for <lists+linux-usb@lfdr.de>; Sat,  8 May 2021 08:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhEHGLe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 May 2021 02:11:34 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:37382 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229473AbhEHGLc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 May 2021 02:11:32 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 14AA7C0444;
        Sat,  8 May 2021 06:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1620454229; bh=RU9FI2LonaY3NUza3aCoW7gOtIpN+guWxFulZMzUecQ=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=KOxpj0BNsTPq6xp6bF/dCbC8Uer7csq+mAE51gNiIAWUB2SQaOQk1yB5TrVFkm7xJ
         ojVDvvLCfszGGrLZRkrbcysk+ABIJmn30auOVgRHJw/oWHYSBv6OPqLPhN6T4bnHH8
         mzK1K7g95QD4N2Cj+Php5h4IKYm9ha2qoP8gsWcy/1KzVCUviBHD1EJwQLk4v+Pm5W
         Qze/vyXmXD90jIOyqv+aUtEUyDEbUqRoLczcRpT3MR/HRJtMJ7bO+fF2XqZZdN/FLF
         sJyXY0OEzXXVOtzGnfnWyO1ZGaSkN1HRvagYqXmc7TCBd/XN4d7OkBQeM4heNANrsg
         23cVnQNdMN9AA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 73315A0096;
        Sat,  8 May 2021 06:10:25 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9ECBE40190;
        Sat,  8 May 2021 06:10:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="wENJNzju";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWFDwCc5WL6Tu02YoQ9i7BhW/ww62dYBif1yobJwPBSaeTCrS5QGfEniLWgqdBSIwOWDzjt8cIqM1cula4XiwVcqwwDhoA0vSTezdeKMXYRVOPHmINQpv974K4ms73A8gr0ct6tm1iacKI549NSw8QoHwHG1r8+eCI10qEXzOE7wgsXQWT8ttjUr4fD+0NZz4WdzmsyW2+ykI9gZhx8zBNvjDJatokZkb8YBIRlF01hroGp91jMNNvzojB5fR9fcGDZjB/+o7pkcwIXhqQfFaRZW1HTlvdHq+Q+5vBa/7ta9u7PcEzT8kpLoyASL1NMnhv2jVXmO4qUn9zxhbhMa5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RU9FI2LonaY3NUza3aCoW7gOtIpN+guWxFulZMzUecQ=;
 b=OOUA5PWTH0OPvjp6w+AkjMSQREGivikGmVLGbBlDH51FDmeCuXaTniMPkAz8PlfSwzAfZFZRxGxZvzq1RpobgbzTA9tToGC/TJrlfdkjmewQencXxFM6YNKXS1tVOjrazu/pfO/qFKQFbmlVN0AyZZi8sQ8lNmcanf42yndiQq1kJgpoOaZV/0443XLXTNb4Q4e9fGSsWn6uFkxXGR27p0Q/XXsXGEsbYUzbhzueLiy0SsUYvoQTuttcTBX0eaAc14ApkPM2zu/bC2qi4MPFfJd3lhWdw1vPjJpBvDR63sb9yfha+oNataUea/jcpm7P6Bvai3bDakmi9Y9MS2msPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RU9FI2LonaY3NUza3aCoW7gOtIpN+guWxFulZMzUecQ=;
 b=wENJNzjudSGHkllNzE7e6h4hUrxHgWsR3wvKIRLIfDO1aa4khVIeJlFPz0Tm4gSkYNnMil3gyDYgJ/z1mFohkywT9gJsjr7+EQgvuzItyefNpyllTJmfydyALrBydjABPhhWqTFXDdHxAaVd46zmhV92bhRoduUVNdQOv0cKDNE=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Sat, 8 May
 2021 06:10:21 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::bd1a:d4df:7c02:e458]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::bd1a:d4df:7c02:e458%6]) with mapi id 15.20.4087.044; Sat, 8 May 2021
 06:10:21 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Phil Elwell <phil@raspberrypi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mian Yousaf Kaukab <yousaf.kaukab@intel.com>,
        Felipe Balbi <balbi@ti.com>,
        Paul Zimmerman <paulz@synopsys.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>
Subject: Re: [PATCH] usb: dwc2: Fix gadget DMA unmap direction
Thread-Topic: [PATCH] usb: dwc2: Fix gadget DMA unmap direction
Thread-Index: AQHXQmoQSSiDzhPUFUGNG7DpmjLRj6rZHNKA
Date:   Sat, 8 May 2021 06:10:21 +0000
Message-ID: <08dc7319-1260-d0b9-d7e5-40fbb9da81cb@synopsys.com>
References: <20210506112200.2893922-1-phil@raspberrypi.com>
In-Reply-To: <20210506112200.2893922-1-phil@raspberrypi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
authentication-results: raspberrypi.com; dkim=none (message not signed)
 header.d=none;raspberrypi.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [37.252.80.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98b85227-d454-49ad-21c0-08d911e7f661
x-ms-traffictypediagnostic: DM4PR12MB5311:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB531122125E199693D3C3CC43A7569@DM4PR12MB5311.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vZ9Xy7UwkPYH+qIBhoSYw5/azIeo9DhNbA5QxqlLiNLEnKrdS0vgOORuf56c7LzdvRyKxNB9bUKNy+eiLvJA7apEKek3ro45YZ04ypuXVLEGOFb6mGN9AvfWeCu4sRgotU3kpM7oZs02R9xqaounkZmMgHXwcOJLI8cLKhlI1fUah3AasLizSv7hhY2ey13OdywzZd5YtH1IrKhy9C3/l0nr/Qv9EN/HYGrrCC3MgdUuC7LqEQCC+6OxocVKrYPLwddYkSyJKMNhsQ1v5q8ldqnHSLV3uyodL72U7DouO83rdulOCjzpyzwQqQNkWEYTsZX02JrapJxIUlcDfbJr75n7sl0C9yj1lWvBwsoNYf9DAAQa9s4bCB3f63Sb84BZ3XSb2EdjTONdVVH3c1s+AfhVXacMD28HQYkF721wBjS/+8GFWg8VZaPZFvKhawb7qm3paWKHb6R2BO4ly+iVjrpLbMc0OspIW/KM8rvcWVY2kzznyeX+O0/lDMKeMcLW8XPeRdXAKGTYsQxN4umn9FSogfAbHm6OQfYvRQHwSzgI2JYwZR31HKg+x9dw8DU1njL8AnqboDxdo6QWHO0ocp37othpjFsivTk8MsG+T5AA3qAk5WxzYe9Im9Gu7K3gmT5DNCmIa2/hF/H8BPMjnjwefws5J8VXAbzzyJBnGsPFnDZvu7y1bIyImdZeE/5I
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(366004)(396003)(39850400004)(346002)(31696002)(26005)(64756008)(66446008)(66556008)(186003)(71200400001)(8676002)(53546011)(6506007)(66476007)(86362001)(122000001)(8936002)(38100700002)(83380400001)(6486002)(110136005)(316002)(36756003)(31686004)(6512007)(478600001)(5660300002)(91956017)(76116006)(2616005)(2906002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dlM4c1FueTIzUUpZd3lKdFBGdnlXMXpKT0FBSXJReTY4NnZ0bE5TTzEzZTQv?=
 =?utf-8?B?SFBtazBLdit6UVdxek8zUWF2M0xSNmUzQWR0TUg4UVZvbG1RQlhtRjFRT1hL?=
 =?utf-8?B?MFFueHErMzFZMncwVTlJUjdGZ2hadEw1b3g5dDZIV2UxVWR3UUlCbWdSTmxV?=
 =?utf-8?B?VnYxMkhLRDRxUkVGZjI2d1dVaHBlcFU2ZDV3OWpwV3htekk2cHhhdUFoUjdM?=
 =?utf-8?B?bFpFS1Y3enZWQzROeHo0WEtmeUhOcVdSU0U0Qy82RkxOdDJVZTFCNXhzQk4x?=
 =?utf-8?B?dk5mMnh0YThPbnovRGtmMG1MMTFWd0MyR2VNaE1zUFdDVGJEbjJCK0VENFFX?=
 =?utf-8?B?b3ppcUh6aHBxM2x5eE40UTRPUzNzRmRyUHBpcUsrYTJpZklJOGpTNTV3dkdZ?=
 =?utf-8?B?OHZ3WWg4SWNZWW1kMlVyRGo4UWN1VHE2TDZMeG9jVlNUK0JERzI0Mm1oTTMr?=
 =?utf-8?B?U0lHeUJGVXdHS0tybFRwQ3c2bEZGSW1VdEdUZEpacDhkTEc2d3dkRUtnM080?=
 =?utf-8?B?WFhRUmJla1FCT0lya0UrdlBWVzJQMzk5SUsrNVcxaXpIL3VZaG16bGJsNGtF?=
 =?utf-8?B?Z21nRXh2aWExMnpNMmFBRzRBTVVWeTlDZzBqNkZoNVZUY0dMcmxQMTJLamkr?=
 =?utf-8?B?RkRIV2pTeWFMSjIrLzlFdHhsK3IvSHR4dVNCOXg1c08wZ2F3RFptODdqNGhw?=
 =?utf-8?B?QkNrZTNPajNCMzhrcHQybk9mRXNEUUc2UjdCY2RTdU1Kbk9zUjNQdlVqZTRX?=
 =?utf-8?B?YlgvbGN5cHVVSzdhak90UHFEZkJIeEp4NkxOYzZZMHd1d3ZvdkxZTGNrY3U5?=
 =?utf-8?B?TmRlTnN1a0hqTjBrRzB5V3RXUDZ2UjYrN2hrUTNiRG9HUGNaYVg2YkJ1U0g3?=
 =?utf-8?B?ODNOek9jSXJKbHFjUFhzcVJGYWlGSGU4YjBvZWhPZE4yb0l4Q3orTmh0ZWVk?=
 =?utf-8?B?blhqcXR1b0xwWXZOR25PR3N2WC9SNEpHQkpGWTdUWURtKyt3T1IvcHQ5cHls?=
 =?utf-8?B?Nk9GVHZ0azlHelJWLzg0c0xrNDB0UFprMGpvNHBrRGJVZFVxc2d0NHMyYW1V?=
 =?utf-8?B?OFYyekxIeUlPZlhHQllZZXgxa1JHN0NzVTRHbWg5b0hDYW8yT0JCUnZPaGlt?=
 =?utf-8?B?dDNpcG9ldzBPTllBd2k4N0JsUER0RUluSzBqazYwOVhjK0F3RkQ5ZUN4THJM?=
 =?utf-8?B?b05pQWRYUzEySUJzMjhWUFR6VmlZRXpZanFrM1BvQThuZ0NybTJsOVdqYm52?=
 =?utf-8?B?c2pHSmV2ZEx2UXZVbE1UclM5ZTVTWkNIMnhLZmtVTmgvbUFQL1Y5S09qbk9m?=
 =?utf-8?B?RzBxbG8xWjREcXZRK1k2anZ4R1FDSk95QXJvQ3BpWWUxVjJaV0dYV1A3Qzlj?=
 =?utf-8?B?Y0syVm44K1F1ZWpHRXduUzhUZHBqS0FqN3BIZ1FIc3pQV0ZmNkt6MC94YTNh?=
 =?utf-8?B?VnkxMjhrdEgwWHl3SzhVRlFpL3lZM2d2MXd1aVByZXVaOGdaeGdtWFNsbXps?=
 =?utf-8?B?ajRoWmx4ekdsNDJoV2Q0VmpjQ3hWRUU5ZG5vZXF5YTJ6NGdXSjJLeXZiR1pK?=
 =?utf-8?B?ZFd6RVNTZTJoV3llbk9FQ0VLK2FuS1FNQ042eUNaTC81WE0zQlA0M2ppZGh6?=
 =?utf-8?B?S25WdUoxTlRkbDB5aGJsdS9DUHFOTFhRQVl1bWQwekV5d1RUL0M1ZEtmMW1E?=
 =?utf-8?B?QUIrdnFwdXVPSjM0bUtnb1JxeWNSZ3R6SkpJSlpHT0JNUHV0RkZBT2xWSDBx?=
 =?utf-8?Q?p2sNQKCSVI63YJhwmq00hdN2U3qbDdAQi8NYh6K?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <573451019C6FA0459930067E9113CCE8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b85227-d454-49ad-21c0-08d911e7f661
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2021 06:10:21.6960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L3afMBqEJ9mXTWpnSbagjkI5w0qzTovrkz3f9kBMpncBV5qlOsbK5WDWj6NyWkWQ8FP0WqbiDz3LeTP2eyLK3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5311
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gNS82LzIwMjEgMzoyMiBQTSwgUGhpbCBFbHdlbGwgd3JvdGU6DQo+IFRoZSBkd2MyIGdhZGdl
dCBzdXBwb3J0IG1hcHMgYW5kIHVubWFwcyBETUEgYnVmZmVycyBhcyBuZWNlc3NhcnkuIFdoZW4N
Cj4gbWFwcGluZyBhbmQgdW5tYXBwaW5nIGl0IHVzZXMgdGhlIGRpcmVjdGlvbiBvZiB0aGUgZW5k
cG9pbnQgdG8gc2VsZWN0DQo+IHRoZSBkaXJlY3Rpb24gb2YgdGhlIERNQSB0cmFuc2ZlciwgYnV0
IHRoaXMgZmFpbHMgZm9yIENvbnRyb2wgT1VUDQo+IHRyYW5zZmVycyBiZWNhdXNlIHRoZSB1bm1h
cCBvY2N1cnMgYWZ0ZXIgdGhlIGVuZHBvaW50IGRpcmVjdGlvbiBoYXMNCj4gYmVlbiByZXZlcnNl
ZCBmb3IgdGhlIHN0YXR1cyBwaGFzZS4NCj4gDQo+IEEgcG9zc2libGUgc29sdXRpb24gd291bGQg
YmUgdG8gdW5tYXAgdGhlIGJ1ZmZlciBiZWZvcmUgdGhlIGRpcmVjdGlvbg0KPiBpcyBjaGFuZ2Vk
LCBidXQgYSBzYWZlciwgbGVzcyBpbnZhc2l2ZSBmaXggaXMgdG8gcmVtZW1iZXIgdGhlIGJ1ZmZl
cg0KPiBkaXJlY3Rpb24gaW5kZXBlbmRlbnRseSBvZiB0aGUgZW5kcG9pbnQgZGlyZWN0aW9uLg0K
PiANCj4gRml4ZXM6IGZlMGI5NGFiY2RmNiAoInVzYjogZHdjMjogZ2FkZ2V0OiBtYW5hZ2UgZXAw
IHN0YXRlIGluIHNvZnR3YXJlIikNCj4gU2lnbmVkLW9mZi1ieTogUGhpbCBFbHdlbGwgPHBoaWxA
cmFzcGJlcnJ5cGkuY29tPg0KDQpBY2tlZC1ieTogTWluYXMgSGFydXR5dW55YW4gPE1pbmFzLkhh
cnV0eXVueWFuQHN5bm9wc3lzLmNvbT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL3VzYi9kd2MyL2Nv
cmUuaCAgIHwgMiArKw0KPiAgIGRyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMgfCAzICsrLQ0KPiAg
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9jb3JlLmggYi9kcml2ZXJzL3VzYi9kd2MyL2Nv
cmUuaA0KPiBpbmRleCBkYTVhYzRhNDU5NWIuLmFiNmI4MTVlMDA4OSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy91c2IvZHdjMi9jb3JlLmgNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9jb3JlLmgN
Cj4gQEAgLTExMyw2ICsxMTMsNyBAQCBzdHJ1Y3QgZHdjMl9oc290Z19yZXE7DQo+ICAgICogQGRl
YnVnZnM6IEZpbGUgZW50cnkgZm9yIGRlYnVnZnMgZmlsZSBmb3IgdGhpcyBlbmRwb2ludC4NCj4g
ICAgKiBAZGlyX2luOiBTZXQgdG8gdHJ1ZSBpZiB0aGlzIGVuZHBvaW50IGlzIG9mIHRoZSBJTiBk
aXJlY3Rpb24sIHdoaWNoDQo+ICAgICogICAgICAgICAgbWVhbnMgdGhhdCBpdCBpcyBzZW5kaW5n
IGRhdGEgdG8gdGhlIEhvc3QuDQo+ICsgKiBAbWFwX2RpcjogU2V0IHRvIHRoZSB2YWx1ZSBvZiBk
aXJfaW4gd2hlbiB0aGUgRE1BIGJ1ZmZlciBpcyBtYXBwZWQuDQo+ICAgICogQGluZGV4OiBUaGUg
aW5kZXggZm9yIHRoZSBlbmRwb2ludCByZWdpc3RlcnMuDQo+ICAgICogQG1jOiBNdWx0aSBDb3Vu
dCAtIG51bWJlciBvZiB0cmFuc2FjdGlvbnMgcGVyIG1pY3JvZnJhbWUNCj4gICAgKiBAaW50ZXJ2
YWw6IEludGVydmFsIGZvciBwZXJpb2RpYyBlbmRwb2ludHMsIGluIGZyYW1lcyBvciBtaWNyb2Zy
YW1lcy4NCj4gQEAgLTE2Miw2ICsxNjMsNyBAQCBzdHJ1Y3QgZHdjMl9oc290Z19lcCB7DQo+ICAg
CXVuc2lnbmVkIHNob3J0CQlmaWZvX2luZGV4Ow0KPiAgIA0KPiAgIAl1bnNpZ25lZCBjaGFyICAg
ICAgICAgICBkaXJfaW47DQo+ICsJdW5zaWduZWQgY2hhciAgICAgICAgICAgbWFwX2RpcjsNCj4g
ICAJdW5zaWduZWQgY2hhciAgICAgICAgICAgaW5kZXg7DQo+ICAgCXVuc2lnbmVkIGNoYXIgICAg
ICAgICAgIG1jOw0KPiAgIAl1MTYgICAgICAgICAgICAgICAgICAgICBpbnRlcnZhbDsNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MyL2dh
ZGdldC5jDQo+IGluZGV4IGU2YmIxYmRiMjc2MC4uMTg0OTY0MTc0ZGMwIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzIvZ2Fk
Z2V0LmMNCj4gQEAgLTQyMiw3ICs0MjIsNyBAQCBzdGF0aWMgdm9pZCBkd2MyX2hzb3RnX3VubWFw
X2RtYShzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcsDQo+ICAgew0KPiAgIAlzdHJ1Y3QgdXNiX3Jl
cXVlc3QgKnJlcSA9ICZoc19yZXEtPnJlcTsNCj4gICANCj4gLQl1c2JfZ2FkZ2V0X3VubWFwX3Jl
cXVlc3QoJmhzb3RnLT5nYWRnZXQsIHJlcSwgaHNfZXAtPmRpcl9pbik7DQo+ICsJdXNiX2dhZGdl
dF91bm1hcF9yZXF1ZXN0KCZoc290Zy0+Z2FkZ2V0LCByZXEsIGhzX2VwLT5tYXBfZGlyKTsNCj4g
ICB9DQo+ICAgDQo+ICAgLyoNCj4gQEAgLTEyNDIsNiArMTI0Miw3IEBAIHN0YXRpYyBpbnQgZHdj
Ml9oc290Z19tYXBfZG1hKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZywNCj4gICB7DQo+ICAgCWlu
dCByZXQ7DQo+ICAgDQo+ICsJaHNfZXAtPm1hcF9kaXIgPSBoc19lcC0+ZGlyX2luOw0KPiAgIAly
ZXQgPSB1c2JfZ2FkZ2V0X21hcF9yZXF1ZXN0KCZoc290Zy0+Z2FkZ2V0LCByZXEsIGhzX2VwLT5k
aXJfaW4pOw0KPiAgIAlpZiAocmV0KQ0KPiAgIAkJZ290byBkbWFfZXJyb3I7DQo+IA0KDQo=
