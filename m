Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5E23D4F41
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jul 2021 19:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhGYRHA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Jul 2021 13:07:00 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:39390 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229545AbhGYRG7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Jul 2021 13:06:59 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 08B3940A47;
        Sun, 25 Jul 2021 17:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1627235250; bh=RSuMDYrh42k+GOtSZcM7H1XTgziOr1mtmWxI0elT5uo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=gZaP2Ty2ZoMZ13HA8ubpFQmbYYBKIicTUTf3aiPE9ldEoLBLxQ1Qfz2XISIB0pX64
         IuHKF2mwdpc/lz4j4erMV8uFrMkmYdOM2s5dlFy7iugqusKNF9OGouSSGwCW2dGfPF
         cLlPTtDq7suSr4taJdCULwbAark7BhXXqa56itVzMdUZ5jEpiuTGO1OxIQsSmmOWMS
         jy7i+U4FxnrFA7kvTsUp/S4el8jKfkLCtZDwnHOhJq0dW1WlHZs9Boi0TY3CnJ6cRc
         aJxWKGvVR4tLPN/sJ9g9WZn2plMrU+94NelUZY+f9rqIvVOKXBZ3lQaOsYmuvwGco3
         udk2Ckv94ZU9w==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 49D23A00B6;
        Sun, 25 Jul 2021 17:47:28 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7815B40099;
        Sun, 25 Jul 2021 17:47:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="wbIlRVRI";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvS+//Yj2enLICI4Ku5YCCjXmowm00so1H7jRu+8GOoFbCXP7gxz1ED2qZ5mKxvZTwgZ8hX7W5bpcUzlG+8K+IPjcexv77LDIKrzrCmj6GwbSGzDbcoGD5/ShLOxiK6mSjDYabTMmXnZkASeMCw2aCtpNoXwL3OQmw/zTBBB+mUfUlh/Kn9PvSmQNTA0aX7JD4uNNjPLvyh03+peoc1RjUlHDXxBynRY6cWGsUrIxPYmrqjWuRKmHZWgQYysEpVJD4qWMsFRdsLuNuWd1OPjYGUhMsc7kvIu1hITFNZx8SksUuKqCk+Yf7ByODbypiACdXCEIqvp81VtDo0Dz53/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSuMDYrh42k+GOtSZcM7H1XTgziOr1mtmWxI0elT5uo=;
 b=f9adQSOvdpvv9vScKXYKN/DD1FuUIq1NStwVKoMM2ZFWvBqtu6tQNiVktma5K5doGw0MDUmhThIaYUPiCdLzGVlc6ChodzPMw1Mcif2z4APQH+4WKb7UxbtbEp3MuJ5HYsmNPh9nIlC2ohnNmmX8WFDZ/J7Z/JX6yhX4Zef9SW83lE7cC/WbBAKS55hGJovCi8wdfrOperyuG37Wg/OZmjs06BT9x0QMN+Smkkxk1gcKlHXTl/eV4MP40vw6yI2d4PXrsAHOPc+Ejp4NMhi13ne5OwdzblIsiT/0d7HZqvkaiLEMcTYl+/0rEghlefqAglVvHM/SBHhqbSUwzekvvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSuMDYrh42k+GOtSZcM7H1XTgziOr1mtmWxI0elT5uo=;
 b=wbIlRVRILTx9Z8AYx9fIpJtneT/CtRT/V3xyYxtIkEcvCo3hg3HJ8ucJWI0SPMtP8PsjnnrzuzdPi8EtZBHJfXyFgc8tZh2naKtcwVY5tUiYEVkiec0v+UbjEqQOIVZEqMIQsb5jabjy+vUPieyM4p+Loapz0ZCKSlp0sERRMHs=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM6PR12MB5533.namprd12.prod.outlook.com (2603:10b6:5:1bc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Sun, 25 Jul
 2021 17:47:26 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4352.031; Sun, 25 Jul 2021
 17:47:26 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] USB fixes for 5.14-rc3
Thread-Topic: [GIT PULL] USB fixes for 5.14-rc3
Thread-Index: AQHXf9KPagB9MEZbYkWVzShpGEQ9AatT3goAgAAC9YCAAAprAIAAAwiAgAAMKoA=
Date:   Sun, 25 Jul 2021 17:47:25 +0000
Message-ID: <d68eaab9-3a9e-f7d0-d66d-18325b827a9f@synopsys.com>
References: <YPrX98Lqa1xH8uH7@kroah.com>
 <970d93d8-38ec-0ff8-6178-825a0698b2ea@synopsys.com>
 <YP2OMa89rnd8hhft@kroah.com>
 <004e42ef-910e-f426-c777-f246e5bbb61a@synopsys.com>
 <YP2ZeRs8hEGyqiAC@kroah.com>
In-Reply-To: <YP2ZeRs8hEGyqiAC@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bafb018-39ed-4bd1-377f-08d94f9443d7
x-ms-traffictypediagnostic: DM6PR12MB5533:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB55337EF7A54FCA1C900AB789A7E79@DM6PR12MB5533.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: epNv8b4Xi+qPZGXKp3Y9zSbWZ8M6Yt3gB3ogEPWlueNSQCtU25etQiWMkGXH4PWxaU0KtcPJljmD/jXgkzxoaqlnzfjpf7L4+JCybNJdASJy3hAqzCNDYHNk5nbDRyKSZn8a8aRXCxEp3SNy+w6VEneLLItHs2JNh1Qo2hkSS2KaJXhsLXIr7BqwwJ2Tl2wnsggzQbudNZVClyXNwUW1uhOPEyRuTT0UkZE15LSUpHLVhd+AndAvUC/jwaF0+cIUAxk/+NOW0EUgFFvaD7UkHXXBI5f4gyNKLRz/KqdlvIAdpnoeUmiRnOixgLCB0SoQiMSmr3bcnfhqeMG5SWaR2ePlrWixNr9Fgfh2WXTvx/Knj/YECbSAX4B4RUhxLFFTNu2nfauHHFPoZxrn3MGkSnSN9ub4Mh9ipHRhb54Nu/aYTmzNKUlQqzzEkHc7SxDbWFvxwAHOaBuFctTRcrzq0qX7cPl95eA+wlLe8BvIm91XHvKZljHG5e+PUKjShlEOFDm7ypancHP3bJIA0ucXxQWYFjhCZb8ZVDxdBWsAXI+NdmlOBySR95Av1ReThodSCuysaooKypPFDyAz1+Zw+rHzz3lQvXZtpCFzRWP0TDmmmDVbJ52jfshw0G49vL/6rAhNloDMKArESWHEyq7njN8uuzlDPBu3soyWBbdXKHW9mnFo2ke8oLVlQuAkxze7TreSgNdkDKq53ytZXnR2aUyAI5MdFMY4sG/ooG9/vsuso/gIJK//66CQg+9o2ac5u8dV1pgdDXkaKZ1rozPuYSIYCgTUQ9wEm55vJFX/iepNt4C1dVkZqBZtn6aTh5jfmKQT9pPGnm0t9aQMdu1pCixUdksvmZ3opK4TRQoMdSs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(366004)(39850400004)(396003)(6512007)(86362001)(26005)(966005)(186003)(8936002)(66476007)(71200400001)(91956017)(122000001)(478600001)(8676002)(66446008)(64756008)(66946007)(66556008)(31696002)(83380400001)(4326008)(76116006)(2906002)(6486002)(31686004)(36756003)(6506007)(53546011)(110136005)(2616005)(316002)(5660300002)(38100700002)(45980500001)(38070700004)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmd1aUFRN0xjcmlZbS9TZFpVMmF6cUpoV043dkg5WGZsQjVNV0ZKOHBjT1Z6?=
 =?utf-8?B?N3RLS05MakFLYTdKamZ6bEhJbWEyVkY1UXFMUkJTRXNwSlArSE5YNGRxbVlu?=
 =?utf-8?B?VW9ZcDZEb1dad3JHQ1hnY2F1aUhLS3JTYWN2b3NkUXVjQnl6RDROTmQ2NW5V?=
 =?utf-8?B?MzFZYlRYajV0OUpjajYxbjc0TVZBQ3M2SFVDZEliWmExV1RTRFp5a3N4b2Iw?=
 =?utf-8?B?VGdpZEhORlJpS2ZQbnBsdHZuZFNpam4wZGhRWUlxZGRqTTlZUi9ESEpTNTFS?=
 =?utf-8?B?ZjFleUllTTZzaWRoZWJSZHpKYUhFaGFaK0t5cTErSEZya2lCSVlPbm4vbHVT?=
 =?utf-8?B?dmZrcE5yQXM1bU10UTN0c1ZvOHBCODc2UWt3VlkyY21UNEhSR3lRSkluYm1u?=
 =?utf-8?B?YTB2d2Z0emFiNVY3UUhORFQvNXc0RWNkUWlreDhFcElWVzArRlVReGJMRnZr?=
 =?utf-8?B?R1NIbUg5QVlTd2laSDIwYlhpdDc2NUpDbnorb1Z5RENMVVJuSEF0eDY3NldY?=
 =?utf-8?B?OHN1ckh5OGg3eVFONFdEb3grdmtiOWo2SU9NcjFSMzlEVnhYMWU1V0hJVk5y?=
 =?utf-8?B?d3NSTTZMNmxBQWk1Tkx2MjRLbzhXUitwMjRaNVQ2VTdGOXJoaXNlSlZ2WjNo?=
 =?utf-8?B?ZzF6NHFwWUhHSDV1OVBYdmhZZ0ZBaThXWlRKT1MwQ2x2NWJmRGl0dWxlZlpV?=
 =?utf-8?B?VC9GalRMWVBVUFhaSzUyRFZHUGIyaE9MZkJvSzRVMmlhRTl0UXIvKzk1aTZD?=
 =?utf-8?B?b0VENmVSZkxhRTc1UzdCWDhmaHhENGRzRVhzODVTMUZCVHl4bFhYR2JzK3hU?=
 =?utf-8?B?Z3VLY1BNakNKNlVTT1YzZHcxUDhkSXNqWWQ3ZjQyeG45TXdlZXNzc2ExOXRQ?=
 =?utf-8?B?TUhpMzg4Rm1XVkxMZnc0YU0zUE1VZDJ1RXJXdXczM0VKaWhzNUg5UkFhV0Rk?=
 =?utf-8?B?YVdkdGUxakd0V0F3UzdDSEh2b0lrWVFkZ2JMTVkyQUZVMHpYMUIxcFkva2NY?=
 =?utf-8?B?S0dkZUpQSVArTXJjWlNoMk9JTzFCQW1yM2JyVFRGWjRKZytGUXZFdzRsaFFT?=
 =?utf-8?B?YWt1WENXd25XelZERjJZWnJpYThwQkdNVnhRSzd2TUVFQU5mdHAwM3dSWEwv?=
 =?utf-8?B?VGwvNy9lVTRpZThEUWhjVWNvb3p0R0N3U3kvUVlxYlpzOU1iZElwNVJ3dVF0?=
 =?utf-8?B?L1dXTUtKR1A1aS9yRFl0elduODFhZlB1UjRETVJEeFB2aG9wSEFuSmFJSjA0?=
 =?utf-8?B?dnhjc0pTUDBBMFhRSk9WSmFvdWpMVnkvZTdhc0pkOVgxaTBrWXhGSVBuTEo3?=
 =?utf-8?B?cFU1cG5rdmxwZHVwWW5LOEhoVEErcEU1aTRVS2twbmJ6ZnJGaXVwM3lObnIz?=
 =?utf-8?B?QXNBYnJUSW5lQVlUOUdkcjJmTGthZER5K2JvTWdhZjlndFpzUmREbkdyTkxC?=
 =?utf-8?B?WEJ3Z0VwaFhpbnR6ZHVlWlpMYkdVY1ZTd0ZsTmxxUmJjVUg1UHNXUFNnZXVr?=
 =?utf-8?B?enpoNzI3MXFTTE1RWXpTY0doTDZacHF2UHBWbXdDRUVibWZIWFJNVDV2UzFx?=
 =?utf-8?B?QnhoTjNib1FtcSt5ZVI0VDJpMHRBZXZ2WUZkSmtPb05KdE5UU0tiRWx1MWtx?=
 =?utf-8?B?YVpzYlhqVVdjNVdFRW02RmQwbW1SallYa0JMREFtRGJmdTBqbkFUZkxhUGNZ?=
 =?utf-8?B?ZEsxdUU5MXpsU2FSYlMvY1NVMUViYmJJaE1vSjduTHF5aVZ1TTVuZjlYaHE3?=
 =?utf-8?Q?OoH99XtRgdpg2AiU/Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2A17730FB3F1E43AF4276DF763C0FB1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bafb018-39ed-4bd1-377f-08d94f9443d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2021 17:47:26.0193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +fhl2TykI5XXwBXJ/vACt6NSyOgtjOHWQG+xYpeUO2RbwP/70US6FPlrha703Q1R3ESKOtOT2efJ4IjV7hGojA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5533
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3JlZywNCg0KT24gNy8yNS8yMDIxIDk6MDMgUE0sIEdyZWcgS0ggd3JvdGU6DQo+IE9uIFN1
biwgSnVsIDI1LCAyMDIxIGF0IDA0OjUzOjAzUE0gKzAwMDAsIE1pbmFzIEhhcnV0eXVueWFuIHdy
b3RlOg0KPj4gSGkgR3JlZywNCj4+DQo+PiBPbiA3LzI1LzIwMjEgODoxNSBQTSwgR3JlZyBLSCB3
cm90ZToNCj4+PiBPbiBTdW4sIEp1bCAyNSwgMjAyMSBhdCAwNDowNToxMVBNICswMDAwLCBNaW5h
cyBIYXJ1dHl1bnlhbiB3cm90ZToNCj4+Pj4gSGkgIEdyZWcsDQo+Pj4+IE9uIDcvMjMvMjAyMSA2
OjUzIFBNLCBHcmVnIEtIIHdyb3RlOg0KPj4+Pj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNl
IGNvbW1pdCBlNzNmMGYwZWU3NTQxMTcxZDg5ZjJlMjQ5MTEzMGM3NzcxYmE1OGQzOg0KPj4+Pj4N
Cj4+Pj4+ICAgICAgTGludXggNS4xNC1yYzEgKDIwMjEtMDctMTEgMTU6MDc6NDAgLTA3MDApDQo+
Pj4+Pg0KPj4+Pj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQo+Pj4+
Pg0KPj4+Pj4gICAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvZ3JlZ2toL3VzYi5naXQgdGFncy91c2ItNS4xNC1yYzMNCj4+Pj4+DQo+Pj4+PiBmb3IgeW91
IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMWQxYjk3ZDVlNzYzNmQ3Mjg5MGE1YmRkMGI0MGU5ODBl
NTRiMmQzNDoNCj4+Pj4+DQo+Pj4+PiAgICAgIE1lcmdlIHRhZyAndXNiLXNlcmlhbC01LjE0LXJj
Mycgb2YgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2pvaGFuL3VzYi1zZXJpYWxfXzshIUE0RjJSOUdfcGch
TUo4cVlRWkVTZkE2U0FEZmtiS1RPdkxwUFVJV2o5ckMwbFNFRGpxckxQRUpqZml1V1BDV2d6VTBZ
aV9WYjd3QzdKM1BKd2RYJCAgaW50byB1c2ItbGludXMgKDIwMjEtMDctMjIgMjA6NTE6MTQgKzAy
MDApDQo+Pj4+Pg0KPj4+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+Pj4gVVNCIGZpeGVzIGZvciA1LjE0LXJjMw0K
Pj4+Pj4NCj4+Pj4+IEhlcmUgYXJlIHNvbWUgVVNCIGZpeGVzIGZvciA1LjE0LXJjMyB0byByZXNv
bHZlIGEgYnVuY2ggb2YgdGlueSBwcm9ibGVtcw0KPj4+Pj4gcmVwb3J0ZWQuICBJbmNsdWRlZCBp
biBoZXJlIGFyZToNCj4+Pj4+IAktIGR0c2kgcmV2ZXJ0IHRvIHJlc29sdmUgYSBwcm9ibGVtIHdo
aWNoIGJyb2tlIGFuZHJvaWQgc3lzdGVtcw0KPj4+Pj4gCSAgdGhhdCByZWxpZWQgb24gdGhlIGR0
cyBuYW1lIHRvIGZpbmQgdGhlIFVTQiBjb250cm9sbGVyIGRldmljZS4NCj4+Pj4+IAkgIFBlb3Bs
ZSBhcmUgc3RpbGwgd29ya2luZyBvdXQgdGhlICJyZWFsIiBzb2x1dGlvbiBmb3IgdGhpcywgYnV0
DQo+Pj4+PiAJICBmb3Igbm93IHRoZSByZXZlcnQgaXMgbmVlZGVkLg0KPj4+Pj4gCS0gY29yZSBV
U0IgZml4IGZvciBwaXBlIGNhbGN1bGF0aW9uIGZvdW5kIGJ5IHN5emJvdA0KPj4+Pj4gCS0gdHlw
ZWMgZml4ZXMNCj4+Pj4+IAktIGdhZGdldCBkcml2ZXIgZml4ZXMNCj4+Pj4+IAktIG5ldyB1c2It
c2VyaWFsIGRldmljZSBpZHMNCj4+Pj4+IAktIG5ldyBVU0IgcXVpcmtzDQo+Pj4+PiAJLSB4aGNp
IGZpeGVzDQo+Pj4+PiAJLSB1c2IgaHViIGZpeGVzIGZvciBwb3dlciBtYW5hZ2VtZW50IGlzc3Vl
cyByZXBvcnRlZA0KPj4+Pj4gCS0gb3RoZXIgdGlueSBmaXhlcw0KPj4+Pj4NCj4+Pj4+IEFsbCBo
YXZlIGJlZW4gaW4gbGludXgtbmV4dCB3aXRoIG5vIHJlcG9ydGVkIHByb2JsZW1zLg0KPj4+Pj4N
Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc+DQo+Pj4+Pg0KPj4+Pg0KPj4+Pg0KPj4+Pj4NCj4+Pj4+IE1hcmVrIFN6eXBy
b3dza2kgKDEpOg0KPj4+Pj4gICAgICAgICAgdXNiOiBkd2MyOiBTa2lwIGNsb2NrIGdhdGluZyBv
biBTYW1zdW5nIFNvQ3MNCj4+Pj4+DQo+Pj4+DQo+Pj4+IEkgZGlkbid0IEFDSyB0aGlzIHBhdGNo
LiBNZSBhbmQgTWFyZWsgU3p5cHJvd3NraSBhZ3JlZWQgdG8gZGlzY3Vzcw0KPj4+PiBkZXRhaWxz
IG9mIHRoaXMgcGF0Y2ggYWZ0ZXIgaGUgd2lsbCBiYWNrIGZyb20gdmFjYXRpb24gYWZ0ZXIgQXVn
dXN0IDIuDQo+Pj4NCj4+PiBPaywgc28gc2hvdWxkIEkgcmV2ZXJ0IGl0IG5vdyB0aGF0IGl0IGlz
IGluIExpbnVzJ3MgdHJlZT8gIERpZCBJIG1pc3MNCj4+PiB0aGUgZGlzY3Vzc2lvbiB0aGF0IHNh
aWQgdGhlcmUgd2VyZSBwcm9ibGVtcyB3aXRoIGl0PyAgSSBzZWUgYW4gYWNrIGZvcg0KPj4+IHRo
ZSBwYXRjaCwgd2hhdCB3YXMgd3Jvbmcgd2l0aCB0aGF0Pw0KPj4+DQo+PiBZZXMsIHBsZWFzZSBy
ZXZlcnQgaXQgdW50aWwgd2UgZGlzY3VzcyB3aXRoIGF1dGhvciBkZXRhaWxzIG9mIHBhdGNoLg0K
Pj4gQWN0dWFsbHkgSSBoYXZlIHJlcGxpZWQgdG8gdGhpcyBwYXRjaCB3aXRoIHNvbWUgcXVlc3Rp
b25zIGFuZCBhZGRpdGlvbmFsDQo+PiB0ZXN0aW5nIHJlcXVlc3QuDQo+PiBQYXRjaCB3YXMgQUNL
ZWQtYnkgS3J6eXN6dG9mIEtvemxvd3NraQ0KPj4gPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25p
Y2FsLmNvbT4sIGJ1dCBub3QgYnkgbWUuDQo+IA0KPiBTdXJlLCBidXQgd2hhdCBpcyB3cm9uZyB3
aXRoIHRoaXMgY2hhbmdlPyAgQXMgdGhpcyBmaXhlcyBhIHJlZ3Jlc3Npb24sDQo+IHNob3VsZG4n
dCBpdCBzdGF5IGluIHRoZSB0cmVlIGZvciBub3c/DQoNCk9rLCBsZXQncyBpdCBzdGF5IGluIC1y
YzMuIEl0IGNhbiBiZSB1cGRhdGVkIGJ5IG5ldyB2ZXJzaW9uIGlmIHJlcXVpcmVkLg0KUGF0Y2gg
aXMgc3BlY2lmaWMgZm9yIFNhbXN1bmcgU29DJ3MuIEkgdHJ5IHRvIHVuZGVyc3RhbmQgd2h5IHRo
ZXkgZmFjZWQgDQppc3N1ZSBiZWNhdXNlIG9mIHByb2dyYW1taW5nIENsb2NrIEdhdGluZyBiaXQg
b25seSBvciBjYXVzZSBpcyBzb21ldGhpbmcgDQplbHNlLiBBY3R1YWxseSBvbiBvdXIgcGxhdGZv
cm0gQ2xvY2sgR2F0aW5nIHdvcmtzIGZpbmUuDQo+IA0KPiB0aGFua3MsDQo+IA0KPiBncmVnIGst
aA0KPiANCg0K
