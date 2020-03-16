Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19170187495
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 22:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732627AbgCPVP1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 17:15:27 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:51554 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732567AbgCPVP0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 17:15:26 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2C695401AB;
        Mon, 16 Mar 2020 21:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584393326; bh=TVVujdKCKNx9Nniyzp6Hc5X8xEHk6tPhR2diOQl9XIU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=XcdYEO5DbckfdPrJHr+Hw9Y4Jnx3fmxC9y0EwBv4qeQERxokJSGeUwy2H7LwS7XS/
         WvIL8795V5an6J4sEe8ixqiXhoG7LAeZy8KXcEi6zCbXowvIgzXUu5AHnfzqZOi1GF
         Ni5ylvBN5l6SwbkrkOO1opMHr5TOLAiy0QKCVLdnPXtC8ykZh7Mfm5fhDeGL4QOR1W
         DhhSLFDkjeXvwuLhjuBUcPpz3sehsnkUGvTtOY7rr9TWxF5gQHLIJ5VI1PdYNe9m5g
         uobyfRSmxoHxNGs+VVYTCqOey1zu9CyLdx6INnEF9ZvTMeBzA9U2So40myapS/2VED
         CGwhwjikd8g+g==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1C4D0A0072;
        Mon, 16 Mar 2020 21:15:26 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 16 Mar 2020 14:15:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 16 Mar 2020 14:15:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOyhkZGxzWaHGuDXBSzEXeou0E6qB7nh2Ft0tv0gHuUoNIC9ygrdFyOQU4Sw5bdOxgEZbuAuc+YroTDpiK33ga79WA0FaSjGSnMRIKgeQ0FQfRhxmElLq+rafPH/0DsZhM89FcSpUdo4CFG6CqW+IpqBhwIf5yuHvSPwvIatjh7RWJS8EKTE7Y6tXsO6Pe+ODjeKf7rKnhkUz5EmZYt0WJdlZ7T2v19+wZOhyJWG2GXx+DjMwawTW4xu2hwUh41zIletVntmeHsirCU20Ve47WK6B0pIN3JHjnfDBDzajxXFmXN02w/oXnmcPPSXo+t+r+CpPTMTU8wq355aRDD2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVVujdKCKNx9Nniyzp6Hc5X8xEHk6tPhR2diOQl9XIU=;
 b=Fzdw9+W1+98Xz0q3pRVN8Q7VXICiR8LRofLoKbWLqldp8A5rnbCUaOyaRn5ON5lyBi6PtE+SrqpkhYqkSL3M04++MAFTzFzK8VZOFHY7oYDiavwOegzThkVjanHYco6uxqKo5Vc4+vQ29hPNblD1S8EVzLzzh2WwPMfzIgl8KWr6qcS5gfc+zTkMUv2Gqs4kvq3Rdv0d/8Wa2lN2M9+u6HnOkwHugk0dA10cdcpxIGIuLLb/snsh+v9ucXEFfiqhlNQn/J/d+4sgRmUbXeBzeYplVAQZGsj/j//x+4MSPRSBiSopwS069UehS4g3gVMUnkTHdjQfkJ1vj3oAweajXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVVujdKCKNx9Nniyzp6Hc5X8xEHk6tPhR2diOQl9XIU=;
 b=Tt1uQSk/O8kr4rrzAcuvttz15fAt4jAUNW2z2GzkO7ARyn5mhYk+ZhuNk4pj2nqsrQC8g69knBzf7FfkbPQnUJUj3tb1OpGkTLkVkPSd9xzQT9k/2U1nDBXVrWsR7X0h3bAKI8oKxdUj2NXdEb2jZUs8BUMihRtDdAJY4mk3cXo=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB3013.namprd12.prod.outlook.com (2603:10b6:a03:a9::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.22; Mon, 16 Mar
 2020 19:07:13 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 19:07:13 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 2/6] usb: dwc3: gadget: Properly handle ClearFeature(halt)
Thread-Topic: [PATCH 2/6] usb: dwc3: gadget: Properly handle
 ClearFeature(halt)
Thread-Index: AQHV8zRtfKN5PAxEHE+SwE9AqfOLuqhJb9kAgAD/GoCAAGjDAIAAzhMA
Date:   Mon, 16 Mar 2020 19:07:13 +0000
Message-ID: <07d4e8df-7e46-b764-4817-6dccb00932a1@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com>
 <4f9b6acbff2cd0be417fd4a943c1975bf41f8fda.1583443184.git.thinhn@synopsys.com>
 <87a74iezx9.fsf@kernel.org>
 <2edccc70-5fab-4227-3d27-a06140523d62@synopsys.com>
 <87h7yo23r1.fsf@kernel.org>
In-Reply-To: <87h7yo23r1.fsf@kernel.org>
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
x-ms-office365-filtering-correlation-id: 029d4732-8677-4d8e-e9a5-08d7c9dd3c6a
x-ms-traffictypediagnostic: BYAPR12MB3013:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3013A7DA654BCE4C8143B3BEAAF90@BYAPR12MB3013.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39860400002)(376002)(346002)(396003)(366004)(199004)(6506007)(6486002)(26005)(66946007)(76116006)(186003)(66556008)(2616005)(64756008)(66446008)(2906002)(31696002)(66476007)(36756003)(316002)(71200400001)(86362001)(81156014)(5660300002)(81166006)(8936002)(6512007)(4326008)(107886003)(8676002)(478600001)(31686004)(110136005);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR12MB3013;H:BYAPR12MB2710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hW+wsMEiUZldFd4xIpVbXFi5ysvpVdojiB7lTrYM36DDTH/W9NfDd1PP0lpSDwE6loTDh9k4/aAraxLa2HH2zNc/8O6SDGqK/kwDM5k512nKdIxe4kD7IbljIfE2byL3Fc4kGYMZSZJR6RTkkb3fKyTu8H3gEcYxovz4a/ZGTzOA+N1rA2hNgc6U4+Q+XJWO/8lhX5mLbpTuPDjCFjZcwKYC3bR4vvPfXluB3957O5EzVVt2yQNtavhJGe7PPFUKnImYAnrrLefq9Z3RsZzEUavLvZv35pecF9ZuT3nv2PvGB6ciyzfsZ5p5tcEWNWYazS2cfMGX2k0mo5zq7qVGT+12HZeNB8SzjWKHSKekLgCKlFtk11E6hpTzY7p9ahtMUvk7T5iB21ChVASBTQT1M9MNE2owlpXqL/uEYWHPfg/x73fEiYF8mlOcYaJ4Xq0G
x-ms-exchange-antispam-messagedata: YG/HisOMV3bPBLY/0yzPKUEaD9TNzua1cxgFlmZ1Lxyh2QFCXJaZkQo7n767V2tSpFtzbO8Y3xRQsd8iRHc0hr7Po4txSxjXcgyns954AdCG9dBZouZ2qu715MwNct+OPuDg40RSuHOVbZrZkMHrtw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9ABE954C1142B949B2D091AEDFF1A135@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 029d4732-8677-4d8e-e9a5-08d7c9dd3c6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 19:07:13.2770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Apb27JLzu/9WUCiHFMPEkf5Uv5J1iWNu/4WgP5aOfFhmonP+B3CWJ/rYHf4m5LrZnuDm7Dw+qn9N04NiTe52w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3013
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4gRmVsaXBlIEJhbGJpIHdyb3RlOg0K
Pj4+IEhpLA0KPj4+DQo+Pj4gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29t
PiB3cml0ZXM6DQo+Pj4+IEBAIC0xNjI3LDEzICsxNjMzLDM3IEBAIGludCBfX2R3YzNfZ2FkZ2V0
X2VwX3NldF9oYWx0KHN0cnVjdCBkd2MzX2VwICpkZXAsIGludCB2YWx1ZSwgaW50IHByb3RvY29s
KQ0KPj4+PiAgICAJCWVsc2UNCj4+Pj4gICAgCQkJZGVwLT5mbGFncyB8PSBEV0MzX0VQX1NUQUxM
Ow0KPj4+PiAgICAJfSBlbHNlIHsNCj4+Pj4gKwkJLyoNCj4+Pj4gKwkJICogRG9uJ3QgaXNzdWUg
Q0xFQVJfU1RBTEwgY29tbWFuZCB0byBjb250cm9sIGVuZHBvaW50cy4gVGhlDQo+Pj4+ICsJCSAq
IGNvbnRyb2xsZXIgYXV0b21hdGljYWxseSBjbGVhcnMgdGhlIFNUQUxMIHdoZW4gaXQgcmVjZWl2
ZXMNCj4+Pj4gKwkJICogdGhlIFNFVFVQIHRva2VuLg0KPj4+PiArCQkgKi8NCj4+PiB3ZSBoYXZl
IGEgc2VwYXJhdGUgZHdjM19nYWRnZXRfZXAwX3NldF9oYWx0KCkgdG8gaGFuZGxlIHRoYXQuIEhv
dyB3YXMNCj4+PiB0aGlzIHRyaWdnZXJlZD8NCj4+Pg0KPj4gSSB0aGluayBpdCdzIGEgYml0IGNv
bmZ1c2luZyBoZXJlIHRoYXQgdGhlIGR3YzNfZ2FkZ2V0X2VwMF9zZXRfaGFsdCgpDQo+PiBoYXMg
dGhlIHNpbWlsYXIgbmFtZSBhcyBfX2R3YzNfZ2FkZ2V0X2VwX3NldF9oYWx0KCkuIEhvd2V2ZXIs
IHRoYXQNCj4+IGZ1bmN0aW9uIG9ubHkgY2FsbHMgZHdjM19lcDBfc3RhbGxfYW5kX3Jlc3RhcnQo
KSBhbmQgbm90IGhhbmRsZWQgdGhyb3VnaA0KPj4gU0VUL0NMRUFSX0ZFQVRVUkUoaGFsdCkgcmVx
dWVzdC4NCj4+DQo+PiBJZiBob3N0IGlzc3VlcyBTRVRfRkVBVFVSRShoYWx0KSBvciBDTEVBUl9G
RUFUVVJFKGhhbHQpIHRvIGNvbnRyb2wNCj4+IGVuZHBvaW50cywgaXQgc3RpbGwgZ29lcyB0aHJv
dWdoIF9fZHdjM19nYWRnZXRfZXBfc2V0X2hhbHQoKS4NCj4gUGVyaGFwcyB0aGF0IHNob3VsZCBi
ZSBmaXhlZCwgdGhlbj8NCj4NCg0KSWYgd2Ugd2FudCB0byBhZGQgYSBwYXRjaCB0byBtYWtlIHRo
aXMgY2xlYXIsIHdlIGNhbiBhZGQgYSBzZXBhcmF0ZSANCnBhdGNoIHRvIHJlbmFtZSBkd2MzX2dh
ZGdldF9lcDBfc2V0X2hhbHQoKSB0byBzb21ldGhpbmcgYWxvbmcgdGhlIGxpbmUgDQpvZiBkd2Mz
X2VwMF9zdGFsbF9hbmRfcmVzdGFydCgpLg0KDQpFdmVyeXRoaW5nIGVsc2UgbG9va3MgZmluZSB0
byBtZS4gTGV0IG1lIGtub3cgaWYgeW91IGhhdmUgYW55IG90aGVyIGNvbmNlcm4uDQoNClRoYW5r
cywNClRoaW5oDQoNCg==
