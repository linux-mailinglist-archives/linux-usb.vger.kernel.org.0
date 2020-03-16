Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1337D187491
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 22:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732649AbgCPVO4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 17:14:56 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:51402 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732597AbgCPVO4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 17:14:56 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B4E2A4013F;
        Mon, 16 Mar 2020 21:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584393295; bh=W6jmkkItmbkoIvfV/O4499ovj4ZETQhRJ2u/eMYd1fQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=SXNNy+Khpd3rA2v1lCTrKexaHTx6KM2zPhS2Ej42I+GAhhrXVzHfOvWmRmLKSnxJg
         m1GUvGYCz1EnBO1WzF2zJeoot9rcn8jVl6/CoLr/2SimtLAQaYtWLJOoMm5a7Cf4zO
         fCH/nOMyGi8ujYJBmN+GEXSz1gf0bhCJTN2IYqSUff+oXoYRV2x4PN8E7JpxLyEC1x
         isQ4jmh9ywPQr5RP8OvRDc7ToxZK0+Ot3OFdPqQjouwGEhRDAaX7LEbb7NXMlYoWRs
         ogcIsIQCE2RtlmAGv0LK6+y2rHoETvr0Um1T1UWwxuO4ohSFrSI4Tlr9EvYqyeequ7
         0T2sTjLq/yT4A==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9F4BAA006F;
        Mon, 16 Mar 2020 21:14:55 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 16 Mar 2020 14:14:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 16 Mar 2020 14:14:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvbzoeLWFyqw/bJPAKFOEsLammXzPyVKpiSORqQgJa2chsRKWJh33spU1RQDhiu3X0HkztwBfZT5EXrSF2P4/plt4A5oOruB5aZUdruKj/6eiN8K+k9dl135PKX4bejpYTtmhnnJ3ciqriHqTOTCAgWaLf/Ms9u844xE5OqUzg0RFR169zVSs5phu21FlpeOvbFPtLYVnrjkDFvbAFGByKHxiw4t7gRXt495Oat01BhSHsHAI6j9NrkdWFkjRmEiAfPEq2x7kwboUTeBgECSgJjJiOh0dSrcq7OcK9BGj20YeQwdb1Yn3Y/W+1zGzg5VnZUY8oaADjqxwbjGW11aqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6jmkkItmbkoIvfV/O4499ovj4ZETQhRJ2u/eMYd1fQ=;
 b=XxACmjH7Hq6SVZnLZVjjsekKvGbjIlOE7M20V/mpaPM4DQPGm5MzF7YB6uIIjfnuZvDu03S+1gPyc7BsXHlrTsDqx2TtG0H6HysAMOr/1CGgCAeTg6PXvxIfITCX1rSUHpzVbjPTWdFe6ck9Um+tKKYt+wxUCtvB1GP0Uv9chLbhBEv7ArgSsjP3HZHFwAJWx8Vo+Hx5iqRZmrXFnOqRH4Dm2O1pOYKva/ohPM7MUTwk9yf+kNQQSlt8k+yj1GiNFHSx75cy6lzvpdl3teEtZlYktoyLlVODYSDfmCjh9cVQ4ExZwAkL1OtOEXahh+q06tipi28GVjXTnoSxXFC6Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6jmkkItmbkoIvfV/O4499ovj4ZETQhRJ2u/eMYd1fQ=;
 b=oHW0kR+Jd4NUHukuQY+Wz3nJdjRLtVyobOIKXYVYfXaxtWjfDjvS2kGFc8tA/OWqfMsJNk9Vnj1XM3p3vtafFectutX9ajn24jjLSK7Okk3oeQ0MbS3a9s9mkh85LOJW8Z7HJ6cDGNhB4W+ASz4lA0w4nvYix54hZK1sPQCrYmM=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB3302.namprd12.prod.outlook.com (2603:10b6:a03:12f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.21; Mon, 16 Mar
 2020 19:06:51 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 19:06:51 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/3] usb: dwc3: gadget: Properly handle failed
 kick_transfer
Thread-Topic: [PATCH 1/3] usb: dwc3: gadget: Properly handle failed
 kick_transfer
Thread-Index: AQHV+N3BzBLybznwZ0OCZe4JISGATKhGk1EAgABcM4CAAmujgIABCAEAgABtNICAAMoBgA==
Date:   Mon, 16 Mar 2020 19:06:51 +0000
Message-ID: <60d30640-7d0f-d8fb-35d5-44bce15503b1@synopsys.com>
References: <cover.1584065705.git.thinhn@synopsys.com>
 <015470a7d9b950df757b1abfecd6ef398ef04710.1584065705.git.thinhn@synopsys.com>
 <874kusgwuz.fsf@kernel.org>
 <c17da637-abf1-75b0-e8bf-737958773e8e@synopsys.com>
 <87o8syf1h6.fsf@kernel.org>
 <08f67bc3-2941-28a2-f1fb-0a3ebdab8559@synopsys.com>
 <878sk0233c.fsf@kernel.org>
In-Reply-To: <878sk0233c.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.7.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87693a59-a3f7-428e-afaa-08d7c9dd2f79
x-ms-traffictypediagnostic: BYAPR12MB3302:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB330219C0496C3B96C0AAECAEAAF90@BYAPR12MB3302.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(346002)(376002)(366004)(396003)(136003)(199004)(2906002)(2616005)(4326008)(478600001)(66946007)(66556008)(86362001)(66476007)(66446008)(76116006)(64756008)(31696002)(26005)(316002)(186003)(36756003)(6506007)(31686004)(110136005)(6486002)(5660300002)(6512007)(81166006)(8676002)(71200400001)(107886003)(81156014)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR12MB3302;H:BYAPR12MB2710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LqJGjky91M+hSG7m4bUwJ5JDo5g52anJ+pQfQc/C+qfFIatAjAeaMB/hz+pUSqijyj3OLYn3YKaoFmbyNAJaWSKk4St8Fb0I2cjOkGoCAS/uP3biih1OjYelE7Dqbr6ZO2DxUyETqACWjt87h5fiAcyyuj3J5QQIJzVHxRWyD36R60Rz3LHjpmS8F7Sr8VIGgEQ7OOaiOxd4vuW56zcrHT0DLllgDk4BKdyvt68k4RHzNEcFyYn4+0BQnKlb+tgPpnmxWSZLKlqsgDs3fsFAFCuI8F7ioQEYdkNEtEGBKKsnpverDLeH9JsBeQ1s3H697cRLYfuhnG8BczYGGBUj7BDhE+KExBvAw/3WiKy5jYezp9jhbZkSY3Xu4JMUoBHpnXaoNRKUVxI+zktHUBr4xH1aAZH2gRV3xIxe+TMAbHT+KR9vpyg8G85e5W/reYQG
x-ms-exchange-antispam-messagedata: SwFZzRrSGQ7hNLBhdpoj0/ZdO5/2e9LpyfrggDL26WUe0CEGCox6n3Y+P7/k+RE7I7d2zvjxPYX9iGKQi9F6u6hyePQcava20h8mJzcoYDAJaTn1BwL3+GLggoi/UcxPO1Y1ycJZiIwQ679mx9XL6A==
Content-Type: text/plain; charset="utf-8"
Content-ID: <88231B489E6F1E4AA2591E70364D7304@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 87693a59-a3f7-428e-afaa-08d7c9dd2f79
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 19:06:51.6254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mqs49vcEwYKI2CEfziFCAuIT6I5FSYMwpoDZcc5Hu5WzDBZuvl/A00cHQTU6ZpW6aOEYOTA4x4gxYkpJgq2gww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3302
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpGZWxpcGUgQmFsYmkgd3JvdGU6DQo+IEhpLA0KPg0KPiBUaGluaCBOZ3V5
ZW48VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gIHdyaXRlczoNCj4+PiBUaGluaCBOZ3V5ZW48
VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gIHdyaXRlczoNCj4+Pj4+IFRoaW5oIE5ndXllbjxU
aGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiAgd3JpdGVzOg0KPj4+Pj4+IElmIGR3YzMgZmFpbHMg
dG8gaXNzdWUgU1RBUlRfVFJBTlNGRVIvVVBEQVRFX1RSQU5TRkVSIGNvbW1hbmQsIHRoZW4gd2UN
Cj4+Pj4+PiBzaG91bGQgcHJvcGVybHkgZW5kIGFuIGFjdGl2ZSB0cmFuc2ZlciBhbmQgZ2l2ZSBi
YWNrIGFsbCB0aGUgc3RhcnRlZA0KPj4+Pj4+IHJlcXVlc3RzLiBIb3dldmVyIGlmIGl0J3MgZm9y
IGFuIGlzb2MgZW5kcG9pbnQsIHRoZSBmYWlsdXJlIG1heWJlIGR1ZSB0bw0KPj4+Pj4+IGJ1cy1l
eHBpcnkgc3RhdHVzLiBJbiB0aGlzIGNhc2UsIGRvbid0IGdpdmUgYmFjayB0aGUgcmVxdWVzdHMg
YW5kIHdhaXQNCj4+Pj4+PiBmb3IgdGhlIG5leHQgcmV0cnkuDQo+Pj4+Pj4NCj4+Pj4+PiBGaXhl
czogNzIyNDZkYTQwZjM3ICgidXNiOiBJbnRyb2R1Y2UgRGVzaWduV2FyZSBVU0IzIERSRCBEcml2
ZXIiKQ0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbjx0aGluaG5Ac3lub3BzeXMu
Y29tPg0KPj4+Pj4gY291bGQgeW91IGdpdmUgc29tZSBkZXRhaWxzIHJlZ2FyZGluZyB3aGVuIGRv
ZXMgdGhpcyBoYXBwZW4/DQo+Pj4+Pg0KPj4+PiBTbywgaGVyZSBhcmUgdGhlIHNjZW5hcmlvcyBp
biB3aGljaCBkd2MzX3NlbmRfZ2FkZ2V0X2VwX2NtZCgpIG1heSByZXR1cm4NCj4+Pj4gYSBuZWdh
dGl2ZSBlcnJubzoNCj4+Pj4NCj4+Pj4gKiAtRUFHQUlOOiBJc29jIGJ1cy1leHBpcnkgc3RhdHVz
DQo+Pj4+ICAgIMKgwqAgQXMgeW91IGFscmVhZHkga25vdywgdGhpcyBvY2N1cnMgd2hlbiB3ZSB0
cnkgdG8gc2NoZWR1bGUgaXNvYyB0b28NCj4+Pj4gbGF0ZS4gSWYgd2UncmUgZ29pbmcgdG8gcmV0
cnkgdGhlIHJlcXVlc3QsIGRvbid0IHVubWFwIGl0Lg0KPj4+IHJpZ2h0DQo+Pj4NCj4+Pj4gKiAt
RUlOVkFMOiBObyByZXNvdXJjZSBkdWUgdG8gaXNzdWluZyBTVEFSVF9UUkFOU0ZFUiB0byBhbiBh
bHJlYWR5DQo+Pj4+IHN0YXJ0ZWQgZW5kcG9pbnQNCj4+Pj4gICAgwqDCoCBUaGlzIGhhcHBlbnMg
Z2VuZXJhbGx5IGJlY2F1c2Ugb2YgU1cgcHJvZ3JhbW1pbmcgZXJyb3INCj4+PiBTb3VuZHMgbGlr
ZSB0aGlzIHNob3VsZCBiZSBmaXhlZCBzZXBhcmF0ZWx5IGFuZCwgcHJvYmFibHksIHdlIHNob3Vs
ZCBhZGQNCj4+PiBhIFdBUk4oKSBzbyB3ZSBjYXRjaCB0aGVzZSBzaXR1YXRpb25zLiBIYXZlIHlv
dSByZXByb2R1Y2VkIHRoaXMNCj4+PiBwYXJ0aWN1bGFyIGNhc2U/DQo+PiBUaGVyZSBhcmUgYSBj
b3VwbGUgb2YgZXhhbXBsZXMgb2Ygbm8gcmVzb3VyY2UgaXNzdWUgdGhhdCBJIHJlY2FsbDoNCj4+
IDEpIFdoZW4gd2UgcmVtb3ZlZCB0aGUgRFdDM19FUF9FTkRfVFJBTlNGRVJfUEVORElORyBmbGFn
LCB3ZSB3YXNuJ3QgYWJsZQ0KPj4gdG8gY2hlY2sgaWYgdGhlIGVuZHBvaW50IGhhZCBlbmRlZC4g
U28sIGlmIHRoZSBmdW5jdGlvbiBkcml2ZXIgcXVldWVzIGENCj4+IG5ldyByZXF1ZXN0IHdoaWxl
IEVORF9UUkFOU0ZFUiBjb21tYW5kIGlzIGluIHByb2dyZXNzLCBpdCdkIHRyaWdnZXINCj4+IFNU
QVJUX1RSQU5TRkVSIHRvIGFuIGFscmVhZHkgc3RhcnRlZCBlbmRwb2ludA0KPiBPa2F5LCBzb3Vu
ZHMgbGlrZSB0aGlzIGRlc2VydmVzIGEgcGF0Y2ggb2YgaXRzIG93bg0KDQpZZXMsIHRoYXQncyB3
aHkgd2UgcmVzdXJyZWN0ZWQgdGhhdCBmbGFnIGFuZCBtYWRlIHRoZSBmaXggKHRoZSBwYXRjaCBp
cyANCnVwc3RyZWFtKS4gSXQgc2hvdWxkIG5vdCBoYXBwZW4gYWdhaW4uDQoNCj4+IDIpIEZvciB0
aGlzIG5ldyBtZXRob2Qgb2YgcmV0cnlpbmcgZm9yIGlzb2MsIHdoZW4gd2UgaXNzdWUgRU5EX1RS
QU5TRkVSDQo+PiBjb21tYW5kLCBmb3Igc29tZSBjb250cm9sbGVyIHZlcnNpb25zLCB0aGUgY29u
dHJvbGxlciB3b3VsZCBnZW5lcmF0ZQ0KPj4gWGZlck5vdFJlYWR5IGV2ZW50IHdoaWxlIHRoZSBF
TkRfVFJBTlNGRVIgY29tbWFuZCBpcyBpbiBwcm9ncmVzcyBwbHVzDQo+PiBhbm90aGVyIGFmdGVy
IGl0IGNvbXBsZXRlZC4gVGhhdCBtZWFucyB3ZSdkIHN0YXJ0IG9uIHRoZSBzYW1lIGVuZHBvaW50
DQo+PiB0d2ljZSBhbmQgdHJpZ2dlciBhIG5vLXJlc291cmNlIGVycm9yLiAoV2UnZCBydW4gaW50
byB0aGlzIHNjZW5hcmlvDQo+PiBiZWNhdXNlIEVORF9UUkFOU0ZFUiBjb21wbGV0aW9uIGNsZWFy
ZWQgdGhlIHN0YXJ0ZWQgZmxhZykuDQo+Pg0KPj4gV2UgYWRkZWQgdGhlIGNoZWNrcyB0byBwcmV2
ZW50IHRoaXMgaXNzdWUgZnJvbSBoYXBwZW5pbmcsIHNvIHRoaXMNCj4+IHNjZW5hcmlvIHNob3Vs
ZCBub3QgaGFwcGVuIGFnYWluLg0KPiBDb29sLCB0aGFua3MNCj4NCj4+IElmIHdlIHdhbnQgdG8g
YWRkIGEgV0FSTigpLCBJIHRoaW5rIHdlIHNob3VsZCBhZGQgdGhhdCBpbnNpZGUgb2YNCj4+IGR3
YzNfc2VuZF9nYWRnZXRfZXBfY21kKCkgZnVuY3Rpb24sIGFzIGEgc2VwYXJhdGUgcGF0Y2guIFdl
IGNhbiBhbHNvDQo+PiBqdXN0IGxvb2sgYXQgdGhlIHRyYWNlcG9pbnQgZm9yICJubyByZXNvdXJj
ZSIgc3RhdHVzLg0KPiBUaGUgIm5vIHJlc291cmNlIiBzdGF0dXMgaXMgaW1wb3J0YW50LCBzdXJl
LiBCdXQgdXNlcnMgZG9uJ3QgdXN1YWxseSBydW4NCj4gd2l0aCB0cmFjZXBvaW50cyBlbmFibGVk
LiBUaGV5J2xsIGhhdmUgYSBub24td29ya2luZyBVU0IgcG9ydCBhbmQgZm9yZ2V0DQo+IGFib3V0
IGl0LiBJZiB0aGVyZSdzIGEgV0FSTigpIHRyaWdnZXJlZCwgd2UgYXJlIG1vcmUgbGlrZWx5IHRv
IGdldCBidWcNCj4gcmVwb3J0cy4NCj4NCg0KVW5kZXJzdG9vZC4gV2UgY2FuIGFkZCBhIFdBUk4o
KSB0byBkd2MzX3NlbmRfZ2FkZ2V0X2VwX2NtZCgpIGluIGEgDQpzZXBhcmF0ZSBwYXRjaC4NCg0K
SXMgdGhlcmUgYW55IG90aGVyIGNvbmNlcm4gcmVnYXJkaW5nIHRoaXMgc2VyaWVzPyBMZXQgbWUg
a25vdyBpZiBJIG5lZWQgDQp0byByZXNlbmQgaXQuDQoNClRoYW5rcywNClRoaW5oDQo=
