Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD55312B7A
	for <lists+linux-usb@lfdr.de>; Mon,  8 Feb 2021 09:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhBHIJq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Feb 2021 03:09:46 -0500
Received: from mail-eopbgr110046.outbound.protection.outlook.com ([40.107.11.46]:5120
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229581AbhBHIJM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Feb 2021 03:09:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzkJLYTz7W6xg5+fz31wuQDShLYp4RJh7XzN6NgMqy2NuUnSwO2AGevyp/Vt/i23cC8AlchiFdcbIZIPJTrmEjC1LN1q8ZbOl7PKSHNpgT6658+z7Y+rMdMLWmE5uLlXLUouz0im1JaxdzLRUK/OVlJoNVR6FcIeqrKrK+v9BoCzzcqbZBAJs6TPMVUFQ5IKFBslNrUhLJNCkwLeJ7FSfdNM9l8CiwPGYpFoPSV+DbVNvI/KsPHP/H8UMPVgRC7E2Nr6XPcWzxpExC/MdTNYmAvS4UJ/f5o8nk2njHHGcJV9P7G8UPG8Vkh4IttOqwGQDG5Y3mE8KQOfzjMRbc0Xgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86Sbjvr0umftrd/Mu6Xs88g6un+gckOVmpwDsPZxElo=;
 b=DgHC8ctyNe9LIyasX8THQg1zu3r0ltvcSUY1rW7ecTSRa2obla9t7+i8wvB46mnVs9ehIOshI/IRTqv94XlD9AyN6tpxKUWITgOSeWisggwZZjrclmm/Fntl79g94AzONt4WW8FScrrDb3b08ujz0EjE+B8b81Sc2qn2FCAfjXOsBNeq6kuhyFs1Ft1aTmsYrUYHTb4eIahCZhK5vHe23p+qlXbv1O106nzxJvnKl+zlvc5hSqakqAmGXHeV9G1ddOBohPAPQ+VRXV0eMQc4/bD8q3+U82WaJl4KjYUWxQVsSAR5dRRBVw896LZvCdJrPCe59gir3j5nTXSyk/EiYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=davidmytton.co.uk; dmarc=pass action=none
 header.from=davidmytton.co.uk; dkim=pass header.d=davidmytton.co.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=davidmytton.co.uk;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86Sbjvr0umftrd/Mu6Xs88g6un+gckOVmpwDsPZxElo=;
 b=To5cxmUaeEkyqDg/K0kDEQkscLs/6OE13kHgNt9HwtaFfnd5GPB87spr1UeW1U7EQLt9GuYKOmsva5RhhlCqCThJNpf2OGNMXJwZuQOPdvlDiRFIfT31Jzce8qg1Sa+ECxYel74GMULZ3v5WB75FfToJ5mb7t8PK6OiukziE/rE=
Received: from LO2P123MB1967.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:c5::14)
 by LO2P123MB2095.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:c8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Mon, 8 Feb
 2021 08:08:23 +0000
Received: from LO2P123MB1967.GBRP123.PROD.OUTLOOK.COM
 ([fe80::1ce8:102f:868e:3429]) by LO2P123MB1967.GBRP123.PROD.OUTLOOK.COM
 ([fe80::1ce8:102f:868e:3429%3]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 08:08:23 +0000
From:   David Mytton <david@davidmytton.co.uk>
To:     Oliver Neukum <oneukum@suse.com>
CC:     "nic_swsd@realtek.com" <nic_swsd@realtek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: RTL8153 1G USB ethernet kernel hang bug
Thread-Topic: RTL8153 1G USB ethernet kernel hang bug
Thread-Index: AQHW5E5I0n2VM70CKEOJ1i4J21kmGaob6S8AgDIxVgA=
Date:   Mon, 8 Feb 2021 08:08:23 +0000
Message-ID: <04916A89-649D-4A87-9403-6E0E2BF68960@davidmytton.co.uk>
References: <LO2P123MB19676167DCB923BC8F464AECFDD00@LO2P123MB1967.GBRP123.PROD.OUTLOOK.COM>
 <87129afc5fa1c2dc84a480118b54cb925eefc2f7.camel@suse.com>
In-Reply-To: <87129afc5fa1c2dc84a480118b54cb925eefc2f7.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.4)
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=davidmytton.co.uk;
x-originating-ip: [81.98.160.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cacb6f53-df34-48c8-9adb-08d8cc08b486
x-ms-traffictypediagnostic: LO2P123MB2095:
x-microsoft-antispam-prvs: <LO2P123MB2095147CE8BB690E67B5EDF1FD8F9@LO2P123MB2095.GBRP123.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SC6impL0QBsJQOgmX6kMxj6BFPS5tgIhvwgsoCjcjGdeBTuvs8tMxxmb0puBUONydYOY2BciqsyJpoONG8W9cRZH5IIj1V9ZKsXEnNDTTNaC0XClHaF2plKS6BxM/TAdJkWmaXp2gcwvU2r5XrMWwafTuMCjnEk2226JbWZVvNYgaM9ke2rxy1RSHxQxxclVHVBGyca5uocAK7cg6jfA/tfC75TluxfGXcnEtlN6shfyAH2fOpa9ISVq2xaoz/HRnJl9jpJvaW0dVm0ZynsFBWiza67jaMKhdnru+u2rAZQL8hWDE84C/I+anwtmg8hBLEYnNFZ33t7H5/8P/u2Rw70WciGWe7K32lSE7meLAWcUOt2vwm5I59W2aA71+N6tdz6Hm4FGOsbk2YTDrDH0j4KXwTEg5fw1xwE//GaVnGraDz7Z3/MoftdvBB8W7SA7enlXvHY2pOMHFklJ5+MYPamblgSCVwPEfj66qE5RafQc/J3YuOSe0OSmEQVGGnZQPB5zq9BJyf09tB7fCtJkq13J5rs+eT+hfjq/xMyuC+CM5Rh5gl3zZYkMf/X5yGyUr7aijlmLoMRHbLrWRtZt6g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P123MB1967.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39830400003)(376002)(366004)(136003)(478600001)(83380400001)(4326008)(86362001)(6486002)(33656002)(76116006)(316002)(6512007)(54906003)(64756008)(66446008)(71200400001)(6916009)(66556008)(8676002)(4744005)(6506007)(5660300002)(66476007)(2906002)(53546011)(36756003)(66946007)(8936002)(2616005)(26005)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?M1JsNVo4RXRFQ3VvV3Fzb1VCSlFNWWlzeEk5bmJzZVV5TlRRcjliRzVxYzA1?=
 =?utf-8?B?SWxQUnltSjlKYU5sd1l6bVBiTkdoampBTWVmeUxNTWVVNGw0RXFIemVva0d0?=
 =?utf-8?B?dldSUnBncGtiZjFVbG93QzRaS0lFU2ZyUXVJbWRHd0R3UHR4OERxdjJyYnpW?=
 =?utf-8?B?MnRFQlZrZlB2RmdXR0JXbk1ldXlUeXhDZnpSdEJSQ2Y0dTl1ZzkyVVpaVGZZ?=
 =?utf-8?B?UUZWQVhNeEpCaG56dHZBREIyM0wxN1luclV0b1Znd2dqRnJPNHJ2QTJpQ3Vx?=
 =?utf-8?B?WmZNSGdFSWdSekhvN2ppUGUxYnNadm5uM3Q3ZVhGM3FxNVppTjFTbUNJQWVP?=
 =?utf-8?B?MFBYVGZsTGVicWZjSG1oSGZEOENkTzJ1cjNGLzRndlg5aThFV3lpUGFDK0F1?=
 =?utf-8?B?TDArMGRIa2tvdGdFTHljQk11ZmZ5T3NvaWpTVWU4OVFFK1p4TFByYk5tUFFi?=
 =?utf-8?B?b2tXQmFCbmJoR2diZ0Y2NVNhNmtua1RkSmZ6Y1FtZ2R4VHd6a1pXZ0JONS9X?=
 =?utf-8?B?MGU1azJjaXpLRDF4dXFZZE9kUVJBeCtkdXhjTDRuZDJCQlh6Ukp6VWpNTXlz?=
 =?utf-8?B?SS9sNysvaXZIQ2d6WHNqWWVaZS9pOGlxUHFJUUVVS085MUFUWXBVbnpJbndC?=
 =?utf-8?B?R1lPTnBldzM4VXZJQW04Z1FuYzN1V0lWWWpHd0xTaG83TXhUd2Y3S2FlcXcx?=
 =?utf-8?B?SnVxUWVYZFp2K0R2MEg0OG51ejNJN05Ld1B1eXRGbGl2QWNQazhtYjdzTWVs?=
 =?utf-8?B?ZlEyeGRycGNzcXBORmhWRC9DdlIvdDhQaExrNnlZQnM4U2NKd2pVbDFwZ0Vu?=
 =?utf-8?B?TEtETlRJNGluV0FWc3Rwd2U5TThTNVlCNXV4ZjlpL1hEWUFtbkpMeGR1N0l3?=
 =?utf-8?B?bURIbGl6c1pBeWxKMzJrSTFLbkJJNEJOT2dsdFZIK01TeFBJbnVLQ3MvSUl6?=
 =?utf-8?B?c2dpZ3NleFd2aGlZTml2c3NCQllFTDNxdWR6QkxyQTZMdU1CK0Q0bEQycnY1?=
 =?utf-8?B?QUVXSENlTmZJc2xhUi9Id292NDlISGtsRHJqaEFDSjBLb05DVGRDd1B6eXVT?=
 =?utf-8?B?Q0JZUXBPYU53NGlSQ2tFbFhxOEl0THNyZUtOaUQzTmtNN2h4VFVNMkhveHoz?=
 =?utf-8?B?WVVWOGU5ZUFDVTZLOXdaQnNMM2U4TmZBNDNSdWFVMVJsUmpTaCtMdmw0azdP?=
 =?utf-8?B?SUpJT1dwaUdDZk1VSGFlUlpxTDNrVFdmazVnSy9MbUxYV0cxWG1BZEc4Z2NN?=
 =?utf-8?B?UUlQbjBPa3d5TkpIZEYvREcwR2I1ZUhYZDJvaXk5QjF5KzJvNU5ZTUJTQncz?=
 =?utf-8?B?NFJCOVVJKzJsb0lOcVhuOXcxUU9tQUZrdWFOOFNpRURGOFhrYlg4MldwRzZ2?=
 =?utf-8?B?bW9BOUZOZGR3NzBWTW9QUTQ4c05vcDM0eFlCQitPbDZaUzdjalBMU1N4dEZO?=
 =?utf-8?B?Y0s3ZzhJcEE0cFNmelVKYjBiZS9HK3ZnYzNxZDdBQml5RFZ1bmliNGRaR0t4?=
 =?utf-8?B?enJqREZmYzZrWVl0ZEZ0R2tteDk2NTd3U1kxRkV1ZnQwa2tiYUUyVmhMSU13?=
 =?utf-8?B?VkJ3M25nTkRyOE40VTVRUnQwUFNxcE5Nd1g4clBxaVB5TkQ4R1NRQmtLOWpo?=
 =?utf-8?B?L0Y4SmhyQXBtQ2NiVFFITGo1cTBaSk1aZklmVHhJcTkrNFdFamVhdENiOWFN?=
 =?utf-8?B?cjg4Tk9CQW5Sd3FpRUhvK3QwT1pVSDFvVmtlZkVqc0F1aWFiOWlmY0YxMTQz?=
 =?utf-8?Q?jqequTIkpGhN9Z1Ckw4fHBiQ7W5lhdAKqzwwnc5?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FB42815AFB1074C95FD78B4836138DC@GBRP123.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: davidmytton.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO2P123MB1967.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cacb6f53-df34-48c8-9adb-08d8cc08b486
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 08:08:23.2300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 266dd960-dade-40f1-8186-8b676c5ae3ef
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kF80aGo3IWLpHmB+NP00LZAiquHyjYy1FQfLEi0qSYnPPvWmPZ8RG7lkAu88F7O0RP3xuHSeLKYVVOHoiOfqVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB2095
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQo+IE9uIDcgSmFuIDIwMjEsIGF0IDA5OjM4LCBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2Uu
Y29tPiB3cm90ZToNCj4gDQo+IFRoZSB1bnNvbHZlZCBxdWVzdGlvbiBpcyB3aGF0IHRoZSBrZXJu
ZWwgaXMgd2FpdGluZyBmb3IuIE9yIHdoZXRoZXIgd2UNCj4gaGF2ZSBhIGRlYWRsb2NrLiBIYXZl
IHlvdSB0cmllZCBhIGtlcm5lbCB3aXRoIGxvY2tkZXAgZW5hYmxlZD8NCj4gQ291bGQgeW91IHRy
eSB0byBnZXQgYSBsb2NrIHdpdGggZHluYW1pYyBkZWJ1Z2dpbmcgZW5hYmxlZCBmb3INCj4gdGhl
IG1vZHVsZSB1c2Jjb3JlPw0KDQooVW4pZm9ydHVuYXRlbHkgSeKAmXZlIGJlZW4gdW5hYmxlIHRv
IHJlcHJvZHVjZSB0aGlzIHNvIGZhciwgZXZlbiB3aXRoIHRoZSBrZXJuZWwgb3B0aW9ucyBtZW50
aW9uZWQgaW4gbXkgb3JpZ2luYWwgbWVzc2FnZSBkaXNhYmxlZC4gSeKAmWxsIHBvc3QgYWdhaW4g
aWYgSSBzZWUgaXQuIFRoZSBsYXRlciBtZXNzYWdlIGluIHRoaXMgdGhyZWFkIGZyb20gSmVucyBW
b2dsZXIgMjAyMS0wMS0zMSBtYXkgcHJvdmlkZSBzb21lIGZ1cnRoZXIgZGVidWcgaW5mbyB0aG91
Z2guDQoNCkRhdmlk
