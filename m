Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07807184FD1
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2020 21:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgCMUB2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Mar 2020 16:01:28 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:50500 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726477AbgCMUB1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Mar 2020 16:01:27 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EFBD6402EB;
        Fri, 13 Mar 2020 20:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584129687; bh=DYwZAENSUhtlMwraGL1iTzkos2b8/MEhEaKj5Wu3jIs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=bf2+VqfW9JFA3h9MfNwqy6UJPfgJajG/aI7CcV/Xb8Jsfe+Y8fuKOXg4DZSqgTNzV
         +lUNmWphEludVRjn9kdggg4icbxwXqde0PxtVtt6RG51mJ8SmuRm4JiZpUO1kPvJUH
         IWDUiTjczFq5LdXp08urCS5UazqRaJrZ6l5BEQE2I+Giz6iMlrubm5rI5rTyIsQgfY
         QAx92abnAWC+raQAHfAGq40ZNfVliFNUX+ZK2ia4qAT/X9eXg5nCVhM5G65B0kRf02
         s4svZtWs5i8zL+WJliaux0+Gws8xpbu39VptlRrtfmW5/FNd3fLJwUcivXpqb69pbk
         jSIS4IwgjUnAA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id D2A33A007F;
        Fri, 13 Mar 2020 20:01:26 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 13 Mar 2020 13:01:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 13 Mar 2020 13:01:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERGbwmK8lxn7EJocnHOjv/yBnL0/5MHvDTuOKhyPFivT+1NX7Q1Nyq763TwKHTdoXJI2AROXWYXk/91q+hYVB2XL70bFPEQw0mDwz/d1M+jXj8UJw8mD+NmYuQkhDie7pB6cnSabi6k138GXAuqXMbvjvAIs+1WPns2neQ2jvz7232Q3A5gu/YSSPbjhxbti/ZW9LkSjp7Zs/XX2DcsWE9HpZ0Hzju012vr9fFRZgHXYNZYMPP0SnT/9kn2IE18rQ5pezhuAUZhT+4I3dVv26zv66PSZI6ioSXYWzFbdPlPs+E8Dfs9sS12s9XnPufDHnUeLv3y53XBNudSkN/WNdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYwZAENSUhtlMwraGL1iTzkos2b8/MEhEaKj5Wu3jIs=;
 b=KDPCZv6Y8rx3MOCb7uyQCXoQnALFiqj/+kUsBnL829Z5gwzFQwUOjE3tbm7WU7az/UdhGCtx5hZ3XjX5oEbE1RVv+jBSvPT5BzWKHaOE+MKqGucMfvU9lMZC3akaviVeWwqJyAccCJV0eAOxW3KFtM1Of8fJVQq8mRG8Yuu24xkNnv+Oz+9cK3PMDSOpyEnhJ4vXYQ71yQRNBZiKHjuEqq5mOwWnYVokauTWnle5hDMU7TPYWwm6KhLdyHuQh52BAtUJ+lVCuL8eG7G0AwdfMYsiQ/wfq3UVfA5EQeJnMSchAoCr48wM60LxdGFFL50oSrnetoSOs5j4uAfgGUmHLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYwZAENSUhtlMwraGL1iTzkos2b8/MEhEaKj5Wu3jIs=;
 b=pxj8SvFghL0rLefTOg0BREYWDMARGiEsu8W39567+lI7uw1we2yJ2FwHsUvRCPVX5U3s14R0MiwrkLAKmr+t2whH0Y0hT6ebDv96XAqqsBaZAS0w+mp/L8b+vCYx6k7a77bhIOHcwxRq06RSaKqai9A5P5UShCpcLDyQidr4xXk=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB3079.namprd12.prod.outlook.com (2603:10b6:a03:a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Fri, 13 Mar
 2020 20:01:22 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2793.018; Fri, 13 Mar 2020
 20:01:22 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 3/3] usb: dwc3: gadget: Issue END_TRANSFER to retry isoc
 transfer
Thread-Topic: [PATCH 3/3] usb: dwc3: gadget: Issue END_TRANSFER to retry isoc
 transfer
Thread-Index: AQHV+N3JNnCJe+WF6U2Uw9UOcicdSKhGmEgAgABaUYA=
Date:   Fri, 13 Mar 2020 20:01:21 +0000
Message-ID: <ec006e68-4835-b018-1f2c-e315c478c680@synopsys.com>
References: <cover.1584065705.git.thinhn@synopsys.com>
 <ab34698f56f613cdf63d7d955e94c064a185b001.1584065705.git.thinhn@synopsys.com>
 <871rpwgw1d.fsf@kernel.org>
In-Reply-To: <871rpwgw1d.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0267f36e-8b02-432b-7a1d-08d7c7894d78
x-ms-traffictypediagnostic: BYAPR12MB3079:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3079BC283E2D3FCF63B965E5AAFA0@BYAPR12MB3079.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 034119E4F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(39860400002)(136003)(396003)(366004)(199004)(86362001)(966005)(2906002)(64756008)(66946007)(76116006)(6512007)(5660300002)(36756003)(66446008)(4326008)(316002)(110136005)(6486002)(66476007)(66556008)(2616005)(6506007)(8676002)(478600001)(71200400001)(81156014)(81166006)(8936002)(31696002)(31686004)(107886003)(186003)(26005)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR12MB3079;H:BYAPR12MB2710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +udCJBR4W84miNFlZWOubhhaA4vRzHzx+3yWJNjlLchusmBnlQ9aK/LY7gYcCL7NlFacHrWgcgeO/66CKhbI0hFVtlvp/rwClfDusu7XgIli9taTJOHC+ZyjXsF7dHUPCYSF2h0f5woBtTyG7yUcssRBLRXQclHz0Gbf4soGiNhOmj03EpA8P93fIkzMdmekhtnfrclItyFFl6tPrB8cXTXacqTLCONx9IQNiJDQA7L6Zh6bmU/N3V5pvB3C3Mf/BzopAXTvlH5R60zfsHacK8euqYIUwufQRi6a/4ljritq7gtpd+r7t6ln/iqQ3A3/ivK07Q5xxN4syXKDpNQJjXvA9RiP9L1dcXu+JXMus0BE4Wubdhafdq3YukkZcRzNNVR+FVDRSqFuF54KXr/PKiBU5ku9hTCfaYxx45adu/SzAAzfNaGnb8pBjN89qIbP8V3ln3h4nsyFhGupZ+f70WK9tJi+mV9tr/Qfc4tjhUQhbDNWzN07Sdo+k+Haqfq3Z64Jn8jBIndxtA0pbw3wXyFinmgsWtHLTRdSPqTOjCa5Pi7bdZJUsnRSoh+U2Kpj
x-ms-exchange-antispam-messagedata: tmt0dFtMi+mOqfooFwp7jsnSX4lQWaeXG9gwDS1fHmpE7Xooih+QOr8iAQX4WZW26d2pvYIH2tQdKlSVNBeQxTv75nWPzPmbhuo/RxJ+nRPvPW0zlR0OHumLOU48FSWOAGr8AtbWuKV3uHK2hFcEJQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <834AE8C8F23B2F4AAED2C67C97F1FC31@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0267f36e-8b02-432b-7a1d-08d7c7894d78
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2020 20:01:21.9123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v6Hvzn9DdzSOPZc7UShy6fbgrg+XSQaUi8xm7JIUuE1TOTxdupALH5tvTuRW5+ezT2WuFqDP3Tn7aAzbn4vr0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3079
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpGZWxpcGUgQmFsYmkgd3JvdGU6DQo+IEhpLA0KPg0KPiBUaGluaCBOZ3V5
ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyaXRlczoNCj4NCj4+IEFmdGVyIGEgbnVt
YmVyIG9mIHVuc3VjY2Vzc2Z1bCBzdGFydCBpc29jIGF0dGVtcHRzIGR1ZSB0byBidXMtZXhwaXJ5
DQo+PiBzdGF0dXMsIGlzc3VlIEVORF9UUkFOU0ZFUiBjb21tYW5kIGFuZCByZXRyeSBvbiB0aGUg
bmV4dCBYZmVyTm90UmVhZHkNCj4+IGV2ZW50Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5o
IE5ndXllbiA8dGhpbmhuQHN5bm9wc3lzLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL3VzYi9k
d2MzL2dhZGdldC5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9k
d2MzL2dhZGdldC5jDQo+PiBpbmRleCBmMWFhZTQ2MTVjZjEuLmE1YWQwMjk4NzUzNiAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+ICsrKyBiL2RyaXZlcnMvdXNi
L2R3YzMvZ2FkZ2V0LmMNCj4+IEBAIC0xNDA2LDcgKzE0MDYsOCBAQCBzdGF0aWMgaW50IF9fZHdj
M19nYWRnZXRfc3RhcnRfaXNvYyhzdHJ1Y3QgZHdjM19lcCAqZGVwKQ0KPj4gICAJaW50IHJldDsN
Cj4+ICAgCWludCBpOw0KPj4gICANCj4+IC0JaWYgKGxpc3RfZW1wdHkoJmRlcC0+cGVuZGluZ19s
aXN0KSkgew0KPj4gKwlpZiAobGlzdF9lbXB0eSgmZGVwLT5wZW5kaW5nX2xpc3QpICYmDQo+PiAr
CSAgICBsaXN0X2VtcHR5KCZkZXAtPnN0YXJ0ZWRfbGlzdCkpIHsNCj4+ICAgCQlkZXAtPmZsYWdz
IHw9IERXQzNfRVBfUEVORElOR19SRVFVRVNUOw0KPj4gICAJCXJldHVybiAtRUFHQUlOOw0KPj4g
ICAJfQ0KPj4gQEAgLTE0MjksNiArMTQzMCwyNyBAQCBzdGF0aWMgaW50IF9fZHdjM19nYWRnZXRf
c3RhcnRfaXNvYyhzdHJ1Y3QgZHdjM19lcCAqZGVwKQ0KPj4gICAJCQlicmVhazsNCj4+ICAgCX0N
Cj4+ICAgDQo+PiArCS8qDQo+PiArCSAqIEFmdGVyIGEgbnVtYmVyIG9mIHVuc3VjY2Vzc2Z1bCBz
dGFydCBhdHRlbXB0cyBkdWUgdG8gYnVzLWV4cGlyeQ0KPj4gKwkgKiBzdGF0dXMsIGlzc3VlIEVO
RF9UUkFOU0ZFUiBjb21tYW5kIGFuZCByZXRyeSBvbiB0aGUgbmV4dCBYZmVyTm90UmVhZHkNCj4+
ICsJICogZXZlbnQuDQo+PiArCSAqLw0KPj4gKwlpZiAocmV0ID09IC1FQUdBSU4pIHsNCj4+ICsJ
CXN0cnVjdCBkd2MzX2dhZGdldF9lcF9jbWRfcGFyYW1zIHBhcmFtczsNCj4+ICsJCXUzMiBjbWQ7
DQo+PiArDQo+PiArCQljbWQgPSBEV0MzX0RFUENNRF9FTkRUUkFOU0ZFUiB8DQo+PiArCQkJRFdD
M19ERVBDTURfQ01ESU9DIHwNCj4+ICsJCQlEV0MzX0RFUENNRF9QQVJBTShkZXAtPnJlc291cmNl
X2luZGV4KTsNCj4+ICsNCj4+ICsJCWRlcC0+cmVzb3VyY2VfaW5kZXggPSAwOw0KPj4gKwkJbWVt
c2V0KCZwYXJhbXMsIDAsIHNpemVvZihwYXJhbXMpKTsNCj4+ICsNCj4+ICsJCXJldCA9IGR3YzNf
c2VuZF9nYWRnZXRfZXBfY21kKGRlcCwgY21kLCAmcGFyYW1zKTsNCj4+ICsJCWlmICghcmV0KQ0K
Pj4gKwkJCWRlcC0+ZmxhZ3MgfD0gRFdDM19FUF9FTkRfVFJBTlNGRVJfUEVORElORzsNCj4+ICsJ
fQ0KPiBJIGxpa2UgdGhpcyEgUHJldHR5IGdvb2QgaWRlYSA6LSkgSSdsbCB3YWl0IGZvciB5b3Vy
IHJlcGx5IHRvIG15DQo+IHF1ZXN0aW9uIG9uIHRoZSBvdGhlciBwYXRjaCwgdGhlbiBzdGFydCBx
dWV1ZWluZyBhZ2Fpbi4NCj4NCg0KR3JlYXQhIEkgbWVudGlvbmVkIHRoaXMgYXdoaWxlIGEgZ28s
IGJ1dCBJIGRpZG4ndCBnZXQgdG8gd29yayBvbiBpdCANCnVudGlsIG5vdy4gU2VlIGh0dHBzOi8v
bWFyYy5pbmZvLz9sPWxpbnV4LXVzYiZtPTE1NjA4ODE3MDcyMzgyNCZ3PTQNCg0KR2xhZCB5b3Un
cmUgYmFjaywgY2FuIHlvdSBhbHNvIHRha2UgYSBsb29rIGFuZCBxdWV1ZSB0aGUgb3RoZXIgZml4
ZXMgDQp0aGF0IEkgc2VudCB0b28uIFRoZXJlIGFyZSBxdWl0ZSBhIGZldyBwYXRjaGVzIHdpdGgg
dGhlc2UgZml4IGRlcGVuZGVuY3kgDQppbiBteSBxdWV1ZSB0aGF0IEkgd2FudCB0byBwdXNoIG91
dC4NCg0KVGhhbmtzLA0KVGhpbmgNCg==
