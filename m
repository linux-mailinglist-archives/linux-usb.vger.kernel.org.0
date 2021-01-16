Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8AF82F8B15
	for <lists+linux-usb@lfdr.de>; Sat, 16 Jan 2021 05:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbhAPEEQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jan 2021 23:04:16 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:60188 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725781AbhAPEEO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jan 2021 23:04:14 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0A4A4C00B1;
        Sat, 16 Jan 2021 04:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610769794; bh=zE8qYN41QK/VRQKj8ljKoj/lQPJuktz713UTTiWgWTA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=hAx6yqzCjBPxTQJ6RjFK/zWRIcJh9S+UOTwQapExYD2BprRKmbpFVbgbM1QcemIVQ
         AIucm5gesyihXp8/QVofxKEiD7DkV3IUptB1LD/LdyuW0VP2ESgHeIBZiwvdQtIaaV
         XRPSrXyklsMXYdCCpSJXOb8SNUIb/MyzuL4/973OG9WIsVUX9IS3CAikDn9QZre0LU
         ZUETy5+uMVaEkayVVV8F/OAac7Jeu1td9Vbuzg4sOD/DY36DQqC+McB3T8qUy7+AVV
         zLCtmVisVOb8NwMfsTo6Dq2Bq1j5ziX9RetVHzWw3qUL9P0GHjI7qIUO1xcxcSXPYz
         L8UtsHCYSrM8g==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id CE885A0096;
        Sat, 16 Jan 2021 04:03:07 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7F566800C8;
        Sat, 16 Jan 2021 04:03:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="tC0NROyd";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEVoJaIPu/XbTfvgpewZChjLaqn4U51hyNK4x7+LYDaDjFdgLb0CjySEfQGTbTtytvEJddQ5LrF+3XX2dSm1V9uYwKENzT3KTHaktXU59Lbu6kybXyoLwgYvfW9io/0yR9av4bvSP0MEC5VXcB8tUC0h3OIlj1R6lmY5ni39zoeqZjiz9qhCYqQqnp/tnX2KuVARRGyvo+EOPlzzScVwqWa5T/+vOpacR4UuiXlgFcRns+SaVCsuegV3yYzaL/uZv9MWz7oFZZ5WGGMNYAeU5WzRUfgEIIW3IRe2BUWhVdbW6boZQzeenQ37AgtJk1JH5aT9Pn8hTaE6p/gGuirIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zE8qYN41QK/VRQKj8ljKoj/lQPJuktz713UTTiWgWTA=;
 b=Nzg4mBcKbeTinJTBuVR7d6jczOh0JxSObnKw+lmPONf1LZyPNjkDiVXygxf+B+wZ9t+RRWm2tqdcYfqLZfDIOqvryYBKXMx4wlycP0vF05t1cLt2cfBePxHYefXErMVPgdLRF/PVgqj4qW9UbgKUxCd68HcdghF7uBN477dgfRy10d/IozWgSYLqcGsW5i4/6kzl7UiiBh6BaBi6VOb8m/EPftpp/O/eyhrSlDULKpezuz9Nq0gDukPAGiQ0DvznuqzL2iCNFS8p5+5CLxLf+HLsRjNgYk3mhfaER6c8DR2ELeEQPyz+fbiwOKxWPGnk7cjZO3gVTWD//gpwUJovTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zE8qYN41QK/VRQKj8ljKoj/lQPJuktz713UTTiWgWTA=;
 b=tC0NROyd7XgciYBRPFxLEUta+GTCkhX/4ZkKBzp8O0TIbslffIb6VYsNAafE5GMOHtaA0uRoKfsg80nbUbPlBgwYuooZzn/dvBRdG4xjW5IIEuv4i0Wvzy1m7BvabcMTW6Zg+8fAkzXBdk8TzbWK+tSHoYWDb1kIaBkcUTseS40=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Sat, 16 Jan
 2021 04:03:01 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3742.013; Sat, 16 Jan 2021
 04:03:00 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rob Gill <rrobgill@protonmail.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>, Bin Liu <b-liu@ti.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v6 01/11] usb: ch9: Add USB 3.2 SSP attributes
Thread-Topic: [PATCH v6 01/11] usb: ch9: Add USB 3.2 SSP attributes
Thread-Index: AQHW6iBZXkuqa3Etn0O3vPHvI+D9hqom43yAgACWtYCAAQ78gIABG4aA
Date:   Sat, 16 Jan 2021 04:03:00 +0000
Message-ID: <c59f49fb-4ac4-d8a5-736e-5ad77a2831b4@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
 <ae9293ebd63a29f2a2035054753534d9eb123d74.1610592135.git.Thinh.Nguyen@synopsys.com>
 <875z3z3km8.fsf@kernel.org>
 <c36b8a86-404f-0fc5-196f-d15e89f7b200@synopsys.com>
 <87y2gu1mqq.fsf@kernel.org>
In-Reply-To: <87y2gu1mqq.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27091e07-d2c0-445f-ccde-08d8b9d39dd2
x-ms-traffictypediagnostic: BY5PR12MB4212:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4212A9B11804D2714121B2A7AAA60@BY5PR12MB4212.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EX1IoEyCLnncVvxTpfu3w+ILt4ReIo464dwEFtt59HljJzph2N+x5VZGu1sfiNkugj4MrhaQuJ2ONqFr1ipbByCOuVP46GiFiHoPCKz5vUW774msoc6bt5cx5uY1vrO7j4R7om4bwy8LFQdZUptK3pidlkx88cZUESvGnv00KRgySzR2+xUPOKKGqJ+xtWfcpQFCEyxD28Wmpk/VbzfXk3bFxSk3YXVcDE+IHMmuSs9CXI7bkDXbG31ZlggtgPLDN4nb+nv+2CYpytITpjGj1YUV6vkGbc2S+0U8TcmnM4fNnjbNBACnId/Gty4leErjZ1o9j8GGFCLwFZAeJUW9VO0rXDamukfkXP1vMInK3NfQr8xWmafnXirioTzNFGCXGrEhZVOabaliaGNWzaXoVDUKPYcMBhgrAb1Wz0UOfZKARqb26YUk2blIQ+2RCTyWcORh/RVUnsBfjBAHY4RcZ5qAznXMN7UlIHGDw+bjZKYGyayUttmrThannDB510HN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(396003)(366004)(39860400002)(376002)(2616005)(31686004)(36756003)(316002)(83380400001)(107886003)(6512007)(86362001)(8936002)(4326008)(478600001)(31696002)(64756008)(66556008)(66476007)(66446008)(66946007)(921005)(6506007)(6486002)(8676002)(71200400001)(2906002)(76116006)(186003)(110136005)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TUVacW1xQi9iV2QyNWdsdnE1V1NjSlpuOTVYN0ZzZzZoZ3lKcXk2bU9xOC9k?=
 =?utf-8?B?RGUvdlNrWjZUYkpkdy8zam5TdW1Dblp3TGhZWjZzTnRaRXc1K0c5SmpXYStB?=
 =?utf-8?B?MWQ1MFZudnFjakVuR3NjQWpvUzFaKzdyajhaWDdFY0FWQkR5VTk5NXpjenRC?=
 =?utf-8?B?M3UxMUN4ekdMN3kyU2pWZEY5ellsOXhNSGpMR0l3SzNrTkQzdEZmbkdOelVq?=
 =?utf-8?B?d29Iei9oOFBxNUhjRVpkM3BZaGpzbzN3VlRLT2hTWmJSWmdxVzZjeEk1NDdD?=
 =?utf-8?B?Q01paGtHOE8yS3l3Nm9FWkptd2MvdWg1aVp6cGJCOXc2b1pxNGtuSGE5ZFJX?=
 =?utf-8?B?ZlZhQWpLQ2F5NVZEa0dsTlY5QTFQb1JvU092ZWp2clQ2MW5hTE1WWmR2Qi9V?=
 =?utf-8?B?WU9FWEhISEY5RThTZTJ0bHhYRnhYdlVkcUdmQTZQcUhvWWM5NXY5WGpqWFhw?=
 =?utf-8?B?djJQdWp1VEYwZm1aeS9aamlzeEV3UWZTRGZ1OWVsQjhvbG4vWWtWOXVHYVNu?=
 =?utf-8?B?azBHOWxWSG1oS1hXRW5XZjFwb2lmU0lRcWs4V2hIb2VEVU40bGRaZlM0VC9t?=
 =?utf-8?B?dnJPQjRTYTdnQ0I0Wk9wK2hkWXloNTdZSUczaXdPUkdSd0xydG93a29ibldy?=
 =?utf-8?B?NGl3UnNVVkxQQ3NOTmNacVBQU1kwVVNBVk12eTdOUjZkUFFZQ1YyYTNWVFJC?=
 =?utf-8?B?RlZJRHpSbGd1UEhnL25TT2Q5eUwra25adFpJdEJQQjNHYlhsNDFORUNEUlh3?=
 =?utf-8?B?ZzJydm8rQ29CdUJsdUxQblNZNW1pbEtxOERldGhXdjFEMUNiUDd4S2pJYUUz?=
 =?utf-8?B?SjBWakdGeWtHZmRXbG54SnY5amcvM2tRYW9VSWRWWSs1dDAyVDJDWmczYnQr?=
 =?utf-8?B?ZXljc1ZxenQvaVZ6S3NSMC9rOG5hUXZ3RVh5ZFBWenJzVVBsam9XRWJzMVVX?=
 =?utf-8?B?eUxEdHlvcjVmSkNqMlh1Z3phRk5jMDI2ZVprV1RtQVRiMVBUSkluR3dac0Ro?=
 =?utf-8?B?b01Ja0ZmMzdyUzFtZlRtZ2FGOUZkdUVFekozV3ZVejJCQW0vZGt3bkoySGhO?=
 =?utf-8?B?RkJYZkpiVm5KR3F5SmZvdjA4aVNDeVZhUnk5bW9MaGFrZjM2c2VSQmlhakRz?=
 =?utf-8?B?V3d4cXRBTm1tK2hnNEVvVjJQT2VQejh2cEE2YXlVQjJUdHNMNlUvWDZYNWQ4?=
 =?utf-8?B?M3RFVkxaWXdrc25iR0UrbWZPUWJFVzFBVUdHT2pqL3NHQlBJUHovaFA3RGRv?=
 =?utf-8?B?cXhnR0t4dzNQMjRpNTR3K2JKQ2h4YVpXQ2d4c1dUV0xFNkJhaVozT084OHkv?=
 =?utf-8?Q?aoab2Da4Cbnwg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8354D211BBCC2C41A7552B71531EF6EA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27091e07-d2c0-445f-ccde-08d8b9d39dd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2021 04:03:00.8891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: onvtOxxON+RBUdsz8kZym/BUxeXzZ0rvSKJaTQDitLRujF7RYoxlT9TJAIBjHcq31C+iG34VzPNA6wTuTAcO+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4212
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVsaXBlIEJhbGJpIHdyb3RlOg0KPiBIaSwNCj4NCj4gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5
ZW5Ac3lub3BzeXMuY29tPiB3cml0ZXM6DQo+PiBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+Pj4gVGhp
bmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiB3cml0ZXM6DQo+Pj4NCj4+Pj4g
SW4gcHJlcGFyYXRpb24gZm9yIFVTQiAzLjIgZHVhbC1sYW5lIHN1cHBvcnQsIGFkZCBzdWJsaW5r
IHNwZWVkDQo+Pj4+IGF0dHJpYnV0ZSBtYWNyb3MgYW5kIGVudW0gdXNiX3NzcF9yYXRlLiBBIFVT
QiBkZXZpY2UgdGhhdCBvcGVyYXRlcyBpbg0KPj4+PiBTdXBlclNwZWVkIFBsdXMgbWF5IG9wZXJh
dGUgYXQgZGlmZmVyZW50IHNwZWVkIGFuZCBsYW5lIGNvdW50LiBUaGVzZQ0KPj4+PiBhZGRpdGlv
bmFsIG1hY3JvcyBhbmQgZW51bSB2YWx1ZXMgaGVscCBzcGVjaWZ5aW5nIHRoYXQuDQo+Pj4+DQo+
Pj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNv
bT4NCj4+Pj4gLS0tDQo+Pj4+IENoYW5nZXMgaW4gdjY6DQo+Pj4+IC0gUmViYXNlIG9uIEdyZWcn
cyB1c2ItdGVzdGluZyBicmFuY2gNCj4+Pj4gLSBDb252ZXJ0IHRoZSBzdWJsaW5rIHNwZWVkIGF0
dHJpYnV0ZSBlbnVtIHRvIG1hY3JvcyBhbmQgbW92ZSBpdCB0byB1YXBpDQo+Pj4+IC0gUmVtb3Zl
IHVzYl9zdWJsaW5rX3NwZWVkIHN0cnVjdA0KPj4+PiAtIFRvIHNpbXBsaWZ5IHRoaW5ncywgdXNl
IHVzYl9zc3BfcmF0ZSBlbnVtIHRvIHNwZWNpZnkgdGhlIHNpZ25hbGluZyByYXRlDQo+Pj4+ICAg
Z2VuZXJhdGlvbiBhbmQgbGFuZSBjb3VudA0KPj4+PiAtIFVwZGF0ZSBjb21taXQgbWVzc2FnZQ0K
Pj4+PiBDaGFuZ2VzIGluIHY1Og0KPj4+PiAtIFJlYmFzZSBvbiBGZWxpcGUncyB0ZXN0aW5nL25l
eHQgYnJhbmNoDQo+Pj4+IC0gQ2hhbmdlZCBTaWduZWQtb2ZmLWJ5IGVtYWlsIHRvIG1hdGNoIEZy
b206IGVtYWlsIGhlYWRlcg0KPj4+PiBDaGFuZ2VzIGluIHY0Og0KPj4+PiAtIE5vbmUNCj4+Pj4g
Q2hhbmdlcyBpbiB2MzoNCj4+Pj4gLSBOb25lDQo+Pj4+IENoYW5nZXMgaW4gdjI6DQo+Pj4+IC0g
TW92ZSB0byBpbmNsdWRlL2xpbnV4L3VzYi9jaDkuaCBpbnN0ZWFkIG9mIHVuZGVyIHVhcGkNCj4+
Pj4NCj4+Pj4gIGluY2x1ZGUvbGludXgvdXNiL2NoOS5oICAgICAgfCAgOSArKysrKysrKysNCj4+
Pj4gIGluY2x1ZGUvdWFwaS9saW51eC91c2IvY2g5LmggfCAxMyArKysrKysrKysrKysrDQo+Pj4+
ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvdXNiL2NoOS5oIGIvaW5jbHVkZS9saW51eC91c2IvY2g5LmgNCj4+
Pj4gaW5kZXggNjA0YzZjNTE0YTUwLi44NmM1MDkwNzYzNGUgMTAwNjQ0DQo+Pj4+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvdXNiL2NoOS5oDQo+Pj4+ICsrKyBiL2luY2x1ZGUvbGludXgvdXNiL2NoOS5o
DQo+Pj4+IEBAIC0zNiw2ICszNiwxNSBAQA0KPj4+PiAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5o
Pg0KPj4+PiAgI2luY2x1ZGUgPHVhcGkvbGludXgvdXNiL2NoOS5oPg0KPj4+PiAgDQo+Pj4+ICsv
KiBVU0IgMy4yIFN1cGVyU3BlZWQgUGx1cyBwaHkgc2lnbmFsaW5nIHJhdGUgZ2VuZXJhdGlvbiBh
bmQgbGFuZSBjb3VudCAqLw0KPj4+PiArDQo+Pj4+ICtlbnVtIHVzYl9zc3BfcmF0ZSB7DQo+Pj4+
ICsJVVNCX1NTUF9HRU5fVU5LTk9XTiA9IDAsDQo+Pj4+ICsJVVNCX1NTUF9HRU5fMngxLA0KPj4+
PiArCVVTQl9TU1BfR0VOXzF4MiwNCj4+Pj4gKwlVU0JfU1NQX0dFTl8yeDIsDQo+Pj4+ICt9Ow0K
Pj4+IG5vdGUgdGhhdCB4SENJIGhhcyBzb21lIHByaXZhdGUgZGVmaW5pdGlvbnMgZm9yIFVTQiAz
LjIgc3VwcG9ydC4gTWF5YmUNCj4+PiBhZGQgYSBwYXRjaCBjb252ZXJ0aW5nIHhIQ0kgdG8gdGhl
IGdlbmVyaWMgdmVyc2lvbnM/DQo+Pj4NCj4+IFNob3VsZCBpdCBiZSBwYXJ0IG9mIHRoaXMgc2Vy
aWVzPyBJIHBsYW4gdG8gZG8gdGhhdCBhZnRlciB0aGlzIHNlcmllcyBpcw0KPj4gbWVyZ2VkIHRv
IGhlbHAgbWluaW1pemUgdGhlIHJldmlldyBlZmZvcnQuDQo+IEFzIGxvbmcgYXMgaXQncyBwYXJ0
IG9mIHlvdXIgVE9ETyBsaXN0LCBzaG91bGQgYmUgZ29vZCA6LSkNCj4NCg0KWWVhaCwgaXQncyBv
biBteSBsaXN0LiBDdXJyZW50bHkgTGludXggeEhDSSBkcml2ZXIgZG9lc24ndCByZWFsbHkgY2hl
Y2sNCmZvciBVU0IgMy4yLiBJdCdzIG1pc3NpbmcgdGhlIHJvb3QgaHViIHN1Ymxpbmsgc3BlZWQg
Y2FwYWJpbGl0eQ0KZGVzY3JpcHRvcnMgZm9yIGdlbjF4MiBhbmQgZ2VuMngyLiBTbyBpdCdzIG1p
c3Npbmcgc29tZSB4SENJIGRlZmluZWQNCmRlZmF1bHQgcG9ydCBzcGVlZCBJRCBhcyBTU0lEIGZv
ciBnZW4xeDIgYW5kIGdlbjJ4Mi4gVGhlIExpbnV4IHhIQ0kNCnJpZ2h0IG5vdyBtYXkgdGhpbmsg
dGhhdCB0aGUgY29ubmVjdGVkIGR1YWwtbGFuZSBkZXZpY2UgbWF5IG5vdCBiZSBhIFNTUA0KZGV2
aWNlIGJlY2F1c2UgaXQgZG9lc24ndCBtYXRjaCB0aGUgU1NJRCBmcm9tIHRoZSBleHRlbmRlZCBw
b3J0IHN0YXR1cy4NCg0KVGhlcmUgYXJlIG1vcmUgcGF0Y2hlcyBmb3IgZHdjMyBhbmQgc29tZSBm
b3IgeEhDSSBvbiBxdWV1ZSB0aGF0DQpob3BlZnVsbHkgZ2V0IGNsZWFuZWQgdXAgYW5kIHB1c2hl
ZCBvdXQgZXZlbnR1YWxseS4NCg0KQlIsDQpUaGluaA0K
