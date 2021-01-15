Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4B02F70C2
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jan 2021 03:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732319AbhAOC5n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jan 2021 21:57:43 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:59692 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726988AbhAOC5m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Jan 2021 21:57:42 -0500
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B7A90C0917;
        Fri, 15 Jan 2021 02:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610679401; bh=zDDWsj9yslFKcCu76E7h4Fauk4L8a+7tvKniXMnYJbc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=R4PZX0g1B6TwzTXrmYrgqcVFt9t3tUTKPWvvUQEfTZYmFu0WbjZGGJoRr9wT8w/8B
         Oxb/s5LN8ceZoTDbaRHy0JnVj1h0UzayVVd9x2RrgbYrIgoCK4HljBxyVQdcVtxufI
         3jPHO7fCfAhvzcYpWfiAYw2Hw8TD6Hwg3zPegoeU7tq8q50yEYtFdqoQFBdHdcTRVr
         EzXbp9Q49/MGnI0GrDVeYuDCkAQo7pOQYKNOjfBAyz5OmXnl+qYPEqa5GIxdEeq02k
         LRqczhyh2RjQpFLOM8wxyLXWN8XGzF64xn3HcDv6WfWzAfc2jj8Ddr9/G4jaB6Brku
         gPw/wlngiDR/w==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id D14A0A0083;
        Fri, 15 Jan 2021 02:56:40 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5FF48802BC;
        Fri, 15 Jan 2021 02:56:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="W6R8Z9ny";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NoaJbatRm2P6f//VAhK9HpDuK4TJ8QyiaFVAFPWmXuQZ0SNVwcrQ7SLnW1+Fb0nHyZ5eI4Sup9s2gDMoVTpZbhOv9IR3+yR1JK4Gy/zIQqebdgfsgIjiBqILQhHRdlcbYjERilDNS9ymmKrpgHnBI2xPA2eotmkafi0uxYBmotW6qtRCPOUP8xLeV/LjPd3sDA75W+yrMIPPLr7LJWFcMxB4Lvk6KXP19SzApyERhJtvtGUZlqIC32oy2xdxFYklp07rOyI+S0q7IUoVdXn4DFGPt9X4LOO01tSXQt4syyO1G4dT3wBjOzqJqx7qsRDMjP1UAshqxU9fmntMFtiT0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDDWsj9yslFKcCu76E7h4Fauk4L8a+7tvKniXMnYJbc=;
 b=VAKHGFNow2tikTsrHboCqAXBoQsrVjORTG2F1+Qdiq2S2kH1g+QcAw5vmJH/NderNNQ55htrR0oH2JW1PJrbQp3bJk3cFESQq1aZCMqyeujolnZEZUqg/2AxHPL34jYeQk0X+IUyyNYrmDrFPqFSmfJnrUxW0FXif32Hx+cH7wr4aDMfnCoIDofj8V4g00oKHAfcnvFYwrgTanLsqkk81cZCQxojBeBXZVz+S+D2mFu2Zhno8jwJdrlyek683Qf95/XgQdvR5iy/rbAnXyCQ7JA6a+9wQ18cF8mKC1P6zEwCoM0bQDmWptONyB7owUuKendKS28jjvQlB62VWcum+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDDWsj9yslFKcCu76E7h4Fauk4L8a+7tvKniXMnYJbc=;
 b=W6R8Z9ny3GlOQpKi2YijY2Bw/QDBzKPAl7p31Vp62XvcBXqZ5XRmsSUfTbRf49Nc57yvqU1gZ1YhpS8/jEeMDwnO48R9mlap/KCj0jlhuAb4WmJn4+I+2KKviWqe/UtMlasrQum8Es4uWNJPi/2HSu1EcIlLrDta8FEBTYMcSfQ=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4018.namprd12.prod.outlook.com (2603:10b6:a03:1a7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 02:56:37 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3742.012; Fri, 15 Jan 2021
 02:56:37 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Peter Chen <hzpeterchen@gmail.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v6 05/11] usb: gadget: composite: Report various SSP
 sublink speeds
Thread-Topic: [PATCH v6 05/11] usb: gadget: composite: Report various SSP
 sublink speeds
Thread-Index: AQHW6iBokEo/rqeRGkeerJ/I0Ocn+6omnSMAgAAIJYCAATedAIAAHooAgAAEYwA=
Date:   Fri, 15 Jan 2021 02:56:37 +0000
Message-ID: <2ef9de95-6213-3753-00ee-97e6c5ea6d43@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
 <eb0386fdd5d87a858281e8006a72723d3732240f.1610592135.git.Thinh.Nguyen@synopsys.com>
 <20210114054708.GB18650@b29397-desktop>
 <227f3064-8016-33db-6575-fc1a642ef485@synopsys.com>
 <20210115005135.GB3443@b29397-desktop>
 <3803df98-0321-ad69-babe-ceb41f95229d@synopsys.com>
In-Reply-To: <3803df98-0321-ad69-babe-ceb41f95229d@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29ecef57-1a7e-4839-f184-08d8b9012cf6
x-ms-traffictypediagnostic: BY5PR12MB4018:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB401859ABF3F0E8D50159696EAAA70@BY5PR12MB4018.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HBCUTi8gnQXXiBnMGCOFvsCb85yI7W72ibMVqUlsTx8X9FtVnDwfEHQM19YsWvOgzi9veLLCqZG3PBYj1pHyqQ+3Dm57b5v5waYOIXkqBNaSMTIJTRbWAI4k2UdoxKn4gNvPhoyw9qpdc21DiGBwySmXm6YKQjyukFYrd9dkClbM4WFbADTIir85NusXpuHu6NS5mMkEEjiLRq1GrAKUczdbvKg8RszLCoIoNzHiRS+/OEw9wyddTJmeJVVFgRLAI7HNgC6s1Fm0GDpQhwbHlrcGXimIUVFTGavYz3p2opH4jTO/eGZOGKroJnh9Jwd/sse+LlMvT6oh5PMR8sycYviBKTaHIiWHofdjS0r6c1+SCM1Ygtsfa2tz5E/X4qWaLxUMsrb0BO4mU9TPi/MEAPZMdq3H/FZC2Bx9ZW4+F2y+2rFECOCRsneCyaMmcz78LtjGsFvr3edqIWRE4VzBp1St2IbD6jNjEpfe6kylgFQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(376002)(346002)(136003)(66476007)(66946007)(83380400001)(76116006)(64756008)(4326008)(107886003)(31696002)(66446008)(54906003)(2616005)(66556008)(5660300002)(86362001)(36756003)(71200400001)(8676002)(478600001)(6512007)(6916009)(316002)(8936002)(2906002)(26005)(31686004)(53546011)(6486002)(6506007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aTNOcmE1OEEydWhMRFc0RUIvc2RLakVrMXg5N0d3L01IVHRWaFhPaE54bUV5?=
 =?utf-8?B?T3RUMDlpMXpMaWRyOGpCMWs3WkdmVllCL1Y1WUtLVWs1RTZzZERRRzhITnRv?=
 =?utf-8?B?a2ZjMnQ4NWVLMHJETEJFc3FZN1ZuME1hbmtraUI1cFc3L3lsT3FRSUZ4NjRP?=
 =?utf-8?B?WUNCVU95TkVSMnpPM2U5cUh3VmZTOU5pRDZzcUVQMkVoOVJ3Tnhsbkd6d3F1?=
 =?utf-8?B?S2U1aWY2WERlV3NPcWhld2h5allzZjhOcHdocUFSVTd6QVN2alFITXZ0ajR0?=
 =?utf-8?B?VW1YR1B6VlRvdDVoM3R2SUE0OVgwb0pXRmMya1NGT1gwdGNXZDJueXdYNWd5?=
 =?utf-8?B?QzBqVEM0ZkY2eHFvL3VJL3JXQWk0cS9oVHdlVk1jRGhWK3RtczFScGIwQkh1?=
 =?utf-8?B?WEpCa0RELyszKzlEeXN1M0xaTElzMHlYUnY0bjZRaDJ4Y2UySHpTTjIxcHBX?=
 =?utf-8?B?T2h5cURjQjNkSHVKTlVWWWNJaUZSb1JKU0tUeE1wSUtsL0F1d3dYd3p1cVF5?=
 =?utf-8?B?U3dGMU9HaEdkamJVS01xdmU2bHRMb2djdHgzd25IV1UxN2ZsaU5wUkM3cXVU?=
 =?utf-8?B?elozRmJ4bkFNTDJoZnlEcm8yanE2S0xoZlNiRHFDKzJLNEtrNHJudk1CY0xj?=
 =?utf-8?B?VHJoWFE1dzY3VmV2cXZBMzVMblpZb1h6SUVQNGhVaVBTNlpyaHhOKzVkVkNS?=
 =?utf-8?B?UkhZYlBkczZOVGhCMzRIK1RnWGhhbHZWSklVNzIxNytXcW5ic2ZYbkRvWmpv?=
 =?utf-8?B?VXhQV3JxRzNhY0ZVZmJmTTJvdndxMi9RZkpKdjRpNEUxeVVvd3hrSE00QzZs?=
 =?utf-8?B?bDVNU3ZLUnBXTjFrbTVzaTJHSFVWN0hUeE83c0J6YXlsQmJnM3ltUVRjNmMz?=
 =?utf-8?B?Wi9US05kcUlpN1k4aEFMVFQzdnM5bXhIOHZ6WXdXOGhVaTRoRzN0dzBQbVEw?=
 =?utf-8?B?VmR1bkUxSGkzVzhGV3M0VldwMm1kTnlPanBhWVMxR0FIVndNQS9FemNjTk1u?=
 =?utf-8?B?eVZrKzJzTi9ybzlFL2R1RHFKdTV0M3BiUFUzWEE2ZkJIQ1dMck5IL0tMNTh5?=
 =?utf-8?B?K1lBVm13WDZDMy9VWnh5TW41eDl3MDFNV0pWRzJoKzlGcDYvZFFBOXluZkh3?=
 =?utf-8?B?V3RML2RiT1A5NDQ5SjVoU3A3bWdJd1IwQStHZXRwdmhLQVZvdi9QN3RqWmxq?=
 =?utf-8?B?K014TWRDQUFjekNlTjZuWmt3WDc4djhHc0pWY09lRjAwTXhmQmFUVU1VMFpm?=
 =?utf-8?B?MVlsRkJWVUtEWHdsV1FBYUZlM2FXRnJRM2o0RkNwMlZKeVJMZ2sxTmpqdmll?=
 =?utf-8?Q?BW0PVFJi/UXLI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F9016AF8786954BB3B680F589501F40@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ecef57-1a7e-4839-f184-08d8b9012cf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 02:56:37.2802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vWHdOo5LNVGYx2SU/sMtRkxDesfERbaOiM+YKFw7tJCCXGY/TbUcdcPGKPbZVR5dWPVaiqxn8SnVdI502C2D/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4018
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBQZXRlciBDaGVuIHdyb3RlOg0KPj4gT24gMjEtMDEtMTQg
MDY6MTY6MTgsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+PiBIaSBQZXRlciwNCj4+Pg0KPj4+IFBl
dGVyIENoZW4gd3JvdGU6DQo+Pj4+IE9uIDIxLTAxLTEzIDE4OjUzOjE0LCBUaGluaCBOZ3V5ZW4g
d3JvdGU6DQo+Pj4+PiBJZiBhIGdhZGdldCBzdXBwb3J0cyBTdXBlclNwZWVkIFBsdXMsIHRoZW4g
aXQgbWF5IG9wZXJhdGUgaW4gZGlmZmVyZW50DQo+Pj4+PiBzdWJsaW5rIHNwZWVkcy4gRm9yIGV4
YW1wbGUsIGlmIHRoZSBnYWRnZXQgc3VwcG9ydHMgU3VwZXJTcGVlZCBQbHVzDQo+Pj4+PiBnZW4y
eDIsIHRoZW4gaXQgY2FuIHN1cHBvcnQgMiBzdWJsaW5rIHNwZWVkcyBnZW4xIGFuZCBnZW4yLiBJ
bmZvcm0gdGhlDQo+Pj4+PiBob3N0IG9mIHRoZXNlIHNwZWVkcyBpbiB0aGUgQk9TIGRlc2NyaXB0
b3IuDQo+Pj4+Pg0KPj4+PiBIaSBUaGluaCwNCj4+Pj4NCj4+Pj4gSSByZWFkIFVTQiAzLjIgc3Bl
YzogY2g5LjYuMi41IFN1cGVyU3BlZWRQbHVzIFVTQiBEZXZpY2UgQ2FwYWJpbGl0eQ0KPj4+Pg0K
Pj4+PiBTeW1tZXRyaWMuIFJ4IGFuZCBUeCBTdWJsaW5rcyBoYXZlIHRoZSBzYW1lIG51bWJlciBv
ZiBsYW5lcyBhbmQgb3BlcmF0ZQ0KPj4+PiBhdCB0aGUgc2FtZSBzcGVlZC4NCj4+Pj4gQXN5bW1l
dHJpYy4gUnggYW5kIFR4IFN1YmxpbmsgaGF2ZSBkaWZmZXJlbnQgbnVtYmVyIG9mIGxhbmVzIGFu
ZC9vcg0KPj4+PiBvcGVyYXRlIGF0IGRpZmZlcmVudCBzcGVlZHMuDQo+Pj4+DQo+Pj4+IFdoeSB5
b3VyIGJlbG93IGNhc2VzIGFyZSBhbGwgZm9yIHN5bW1ldHJpYywgYXQgbGVhc3QsIHRoZSBleGFt
cGxlIDMNCj4+Pj4gaXMgYXN5bW1ldHJpYywgaXQgaGFzIGRpZmZlcmVudCBzcGVlZCBmb3Igc3Vi
bGluayBwYWlycz8NCj4+Pj4gRG9lcyB5b3VyIGJlbG93IGNhc2VzIGFyZSBzcGVjaWZpY2F0aW9u
IGRlZmluZWQgb3IgdXNlciBkZWZpbmVkPw0KPj4+IFVTQiAzLjIgc3BlYyBzZWN0aW9uIDguNS42
Ljc6DQo+Pj4gQXN5bW1ldHJpYyBsYW5lIHR5cGVzIGFyZSBvbmx5IGZvciBTdXBlclNwZWVkIElu
dGVyY2hpcCAoU1NJQykuIElNTywNCj4+PiBJdCdzIHVubGlrZWx5IHRoYXQgU1NJQyB1c2VyIHdp
bGwgdXNlIExpbnV4IGtlcm5lbC4gV2UgY2FuIGV4dGVuZCBhbmQNCj4+PiB1cGRhdGUgdGhlIGdh
ZGdldCBmcmFtZXdvcmsgaWYgdGhlcmUncyBhbnkgdXNlIGNhc2UgZm9yIHRoYXQuDQo+Pj4NCj4+
Pg0KPj4+Pj4gVXNlIDEgU1NJRCBpZiB0aGUgZ2FkZ2V0IHN1cHBvcnRzIHVwIHRvIGdlbjJ4MSwg
b3Igbm90IHNwZWNpZmllZDoNCj4+Pj4+IC0gU1NJRCAwIGZvciBzeW1tZXRyaWMgUlgvVFggc3Vi
bGluayBzcGVlZCBvZiAxMCBHYnBzLg0KPj4+Pj4NCj4+Pj4+IFVzZSAxIFNTSUQgaWYgdGhlIGdh
ZGdldCBzdXBwb3J0cyB1cCB0byBnZW4xeDI6DQo+Pj4+PiAtIFNTSUQgMCBmb3Igc3ltbWV0cmlj
IFJYL1RYIHN1Ymxpbmsgc3BlZWQgb2YgNSBHYnBzLg0KPj4+Pj4NCj4+Pj4+IFVzZSAyIFNTSURz
IGlmIHRoZSBnYWRnZXQgc3VwcG9ydHMgdXAgdG8gZ2VuMngyOg0KPj4+Pj4gLSBTU0lEIDAgZm9y
IHN5bW1ldHJpYyBSWC9UWCBzdWJsaW5rIHNwZWVkIG9mIDUgR2Jwcy4NCj4+Pj4gV2h5IFNTSUQg
MCBpcyBub3QgMTBHYnBzPw0KPj4+IFNTSUQgMCBhbmQgMSBhcmUgYXJiaXRyYXJ5LCB3ZSBjYW4g
ZG8gMCBmb3IgMTBHYnBzLiBUaGVyZSdzIG5vDQo+Pj4gY29uc3RyYWludCBvciBzdGFuZGFyZCBm
cm9tIHRoZSBVU0IgMy4yIHNwZWMuIEhvd2V2ZXIsIHlvdSBuZWVkIHRvIHNldA0KPj4+IHRoZSBk
ZXNjcmlwdG9yIHdGdW5jdGlvbmFsaXR5U3VwcG9ydC5TU0lEIHRvIGJlIHRoZSBtaW5pbXVtIGxh
bmUgc3BlZWQNCj4+PiBTU0lEIGl0IHN1cHBvcnRzLiBVc2luZyBTU0lEIDAgbWFrZXMgaXQgZWFz
aWVyIHNpbmNlIHdlIGRvbid0IGhhdmUgdG8NCj4+PiBjb25kaXRpb24gaXQgZm9yIG11bHRpcGxl
IFNTSURzLg0KPj4+DQo+Pj4+PiAtIFNTSUQgMSBmb3Igc3ltbWV0cmljIFJYL1RYIHN1Ymxpbmsg
c3BlZWQgb2YgMTAgR2Jwcy4NCj4+Pj4gQmVzaWRlcywgd291bGQgeW91IGdpdmUgbWUgYW4gZXhh
bXBsZSB3aGF0IGtpbmRzIG9mIHN5c3RlbSBkZXNpZ24NCj4+Pj4gd2lsbCB1c2UgYmVsb3cgc3Vi
bGluayBzcGVlZD8NCj4+Pj4gLSBTU0lEIDAgZm9yIHN5bW1ldHJpYyBSWC9UWCBzdWJsaW5rIHNw
ZWVkIG9mIDUgR2Jwcy4NCj4+Pj4gLSBTU0lEIDEgZm9yIHN5bW1ldHJpYyBSWC9UWCBzdWJsaW5r
IHNwZWVkIG9mIDEwIEdicHMuDQo+Pj4+DQo+Pj4+IFBldGVyDQo+Pj4gVGhlc2UgMiBTU0lEcyBp
bmRpY2F0ZSB0aGF0IHRoZSBkZXZpY2UgaXMgY2FwYWJsZSBvZiBydW5uaW5nIGluIGdlbjEgYW5k
DQo+Pj4gZ2VuMiBpbiBTU1AuDQo+Pj4NCj4+IEhpIFRoaW5oLA0KPj4NCj4+IEkgYW0gcHV6emxl
ZCwgR0VOMiBpcyBiYWNrIGNvbXBhdGlibGUgZm9yIEdFTjEuIFRoZW4sIHdoYXQncyB0aGUgdXNh
Z2UNCj4+IG9mIHRoaXMgZGVzY3JpcHRvciwgd2hhdCBraW5kcyBvZiBzcGVjaWZpYyBpbmZvcm1h
dGlvbiB0aGUgaG9zdCB3YW50cyB0byBnZXQ/DQo+PiBJIHRoaW5rIHRoZSBob3N0IHdhbnRzIHRv
IGdldCBpZiB0d28gcGFpcnMgb2YgdHgvcnggYXJlIHN1cHBvcnRlZCwgdGhhdA0KPj4gaXMgd2hh
dCBVU0IgMy4yIGFkZHMuDQo+Pg0KPiBIaSBQZXRlciwNCj4NCj4gWWVzLCBpdCdzIGJhY2t3YXJk
IGNvbXBhdGlibGUuIEhvd2V2ZXIgR2VuMXgyIHVzZXMgU3VwZXJTcGVlZCBQbHVzIExpbmsNCj4g
UHJvdG9jb2wuIFNpbmdsZSBsYW5lIEdlbiAxIGRvZXNuJ3QuIFRoaXMgYWRkaXRpb25hbCBSWC9U
WCBzdWJsaW5rIHNwZWVkDQo+IGF0dHJpYnV0ZSBwYWlyIGlzIHRlbGxpbmcgdGhlIGhvc3QgdGhh
dCB0aGUgZGV2aWNlIGlzIGNhcGFibGUgb2YgcnVubmluZw0KPiBhdCBHZW4xeDIgYW5kIEdlbjJ4
Mi4gSG9zdCBjYW4gdXNlIHRoaXMgaW5mb3JtYXRpb24gdG8ga25vdyB0aGF0IHRoZQ0KPiBkZXZp
Y2Ugc3VwcG9ydHMgR2VuIDEgYXMgU1NQLCBhbmQgaXQgY2FuIGluZmVyIHRoYXQgdGhlIGRldmlj
ZSBzdXBwb3J0cw0KPiBkdWFsLWxhbmUuIE90aGVyd2lzZSwgdGhlIGhvc3QgY2FuIG9ubHkgY2hl
Y2sgZm9yIGR1YWwtbGFuZSBzdXBwb3J0DQo+IGFmdGVyIGl0IHJlY2VpdmVzIGEgcG9ydCBzdGF0
dXMgb3Igc3VibGluayBzcGVlZCBkZXZpY2Ugbm90aWZpY2F0aW9uIFRQLg0KPiBSZWdhcmRsZXNz
LCB0aGUgZ2FkZ2V0IHNob3VsZCBkZXNjcmliZSBhbGwgdGhlIHN1Ymxpbmsgc3BlZWRzIHRoZSBk
ZXZpY2UNCj4gaXMgY2FwYWJsZSBvZiBpbiB0aGUgU1NQIGNhcGFiaWxpdHkgZGVzY3JpcHRvci4N
Cj4NCg0KUmVnYXJkaW5nIGNoZWNraW5nIHBvcnQgc3RhdHVzIGFuZCBzdWJsaW5rIHNwZWVkIGRl
dmljZSBub3RpZmljYXRpb24sIEkNCm1lYW50IGl0IGFzICJjb25uZWN0ZWQiIHN0YXR1cyBhbmQg
bm90IGNhcGFiaWxpdHkuDQoNClRoaW5oDQo=
