Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBB911D929
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 23:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731044AbfLLWP6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 17:15:58 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:59582 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730811AbfLLWP5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 17:15:57 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D82834231F;
        Thu, 12 Dec 2019 22:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576188956; bh=nhZgXwKdaCsvy3bnUSX05ChFRi67N6T4ExU0ul7QbP4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=F02aDjHVRG6DoqZeTRmMps6t0ZYZsRTC+1Cn/xB2Xqzan8aZ7gZpDF+1TOaQe8NSW
         Me2H9az25zZ+q8GsV5xkcD15pCXh/cDbA7O4nMQbzgFs0SkHBCwIk7xVNJ9kM15PgD
         V/8Vb37CBjRNeLI7H9KxiAjJ3zgTqKPnvbLyKIpRl4yIJjmtt3ulYgN2VaGMSg2Da3
         FvciOAughCgRC79TstfYI33c0Jl64SFNshRfrn5g2b1NmyoqtRNxT9xZPQyBHIN5/y
         /owVBuNioT9cbgVKaD4nHY+11Bm7Ef60sNgr/IfUyAeTrpbcQ+pgSxn1UKAKv6NKv2
         1OwqiUDT5a5sQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id BB5E0A0087;
        Thu, 12 Dec 2019 22:15:56 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 12 Dec 2019 14:15:41 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 12 Dec 2019 14:15:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isABCvAQjqcBUBTnxPgQU2IYo0RaYocClz9+2jlqeBU6W2pNslkKacNFMv7QcN5A5/Sxk1g8sKMsJnw6Ii5jcPY1yLS1aaZC+lUKxwhnUVNl+K9TiVGYEJJFh137XLar7tKqiZ+NEAsUuMe3CBHTBigmGG14E9mXMXIBEwhirp61G8UICFgaHymPiF8nEw6tRghPKjNrIj8hdYY7XnsuaG2SH22WAMUvRsoT8JkQD/wRMWom6Y4wv2bzAUWxPelAM0pFWgD1hsKj5jLGy7aAzuRSP15di/JjfLCd/c7vHgqEZQJzu9zd8PqsEus2eUBvkGizAMksD4OLW4WPwPGGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhZgXwKdaCsvy3bnUSX05ChFRi67N6T4ExU0ul7QbP4=;
 b=brq87k0FZFbXZ58zEcWMvB+0pzTWVski4JphzD3kwZdPNeMhT3r+ioEtvW0vXYmNcOT7T/ZlUbYy/Ju0D6HJ7qRD27nSmvwsGrpYrlEaJeUb0K28GvHZdnw7kI7rVib9g6thx55fbqcvqQExsMCT/LLMA1U/gMjojz+8qgousqMDk4eUkbMF96ebTiHbsVs4MLduimj9io1QHIVecyi2q9CmAtPxeiiY38s0GQWg8Y+g5Z1qWFX7/ImDzTjFlSKdCuNHKHybfGR44sinDGZa6bmUqNsDRnIsx+Qaup5C718beshyCz0heqNRLys4c/RJoZGmwlAKaELrMLzIy9bNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhZgXwKdaCsvy3bnUSX05ChFRi67N6T4ExU0ul7QbP4=;
 b=B51qGYVxI/sZHVpOjkMb/eFBSrKSTDOWoau+Y2JGdHkGIFAcWQTs005rdEBviH0GBsRPe5OwpnEiM5ewsWupM8hhNTEuU+c6F35zGUz/zlSTIHTT+zTJaDX56QbkFLJchtf6z4pvmzGqfkPuZXgfjtYpnW6O9wf6LJnQ2SSteMU=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0165.namprd12.prod.outlook.com (10.172.78.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Thu, 12 Dec 2019 22:15:39 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4%8]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 22:15:39 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 07/14] usb: dwc3: gadget: Set lane count and lsm
Thread-Topic: [RFC PATCH 07/14] usb: dwc3: gadget: Set lane count and lsm
Thread-Index: AQHVsJbjNjXH3sUqokKePIX7hcDTz6e2J02AgADq44A=
Date:   Thu, 12 Dec 2019 22:15:39 +0000
Message-ID: <0132b864-6b9a-5258-8c0f-b007f4138035@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
 <808d8ad39fc584e2f85e20148d56bd49c50aebf6.1576118671.git.thinhn@synopsys.com>
 <87sglqvu2m.fsf@kernel.org>
In-Reply-To: <87sglqvu2m.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f611783-0b7c-4346-259b-08d77f50d247
x-ms-traffictypediagnostic: CY4PR1201MB0165:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0165F47B644F465CAB171AE8AA550@CY4PR1201MB0165.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(346002)(39860400002)(396003)(136003)(189003)(199004)(6506007)(6486002)(8936002)(2616005)(81156014)(81166006)(8676002)(31686004)(66946007)(64756008)(71200400001)(66476007)(76116006)(66446008)(66556008)(316002)(4326008)(31696002)(107886003)(110136005)(86362001)(478600001)(26005)(36756003)(2906002)(186003)(5660300002)(6512007);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0165;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HuCCwJjLKcGKgXgA9klF0Fw4qBLoz7U9sJwIIpYfkZ/C03n0rZ4mr7JA9M8eUaS2FaLK+MXu1Df9Qs2QaKtAZtbfW40SPTqw7nEuYtIHq0ydGUb4KHRRCRxX03nQMbFia+zFAvVnMTTJS+T+ZBvOdtFYfsVaejY7gyBdGdfP1h+HKqk2I+4mwU5whRbLdTOfcExPhUtNzkGyEd685UMiFda95R2yMfoCtb/zey5BkNPRtdIrimp3DDpgJgy63r/oBI9men6wluG4KV+nfIPP+N7QmhHOpzukxcnZMNv14/p1gWR3nm9gjR9xXhZ+J/izWoNkqH2Suaaa7h9ccoaG+c58nCAso4DXUZcJxxoK/gcLkaka/rT/Y9Eg5eBQ2MVbDkBom9tabP21KiNpDw4cVEsT5EPlA2R3lUpxDe+TXp+t4/zm/jNnomCdcLPp2Xw/
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D588F1DDB1DAA41B1B31B7BF340134C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f611783-0b7c-4346-259b-08d77f50d247
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 22:15:39.6264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MiAPYIDJK2aiJF3hCLmsOt77YCdUKl7TCgBvXi3MzJn+GBubaqmDS2ik82WaDJtW1yFBGJX1GpHTCztrUnBNBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0165
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5A
c3lub3BzeXMuY29tPiB3cml0ZXM6DQo+DQo+PiBEV0NfdXNiMzIgc3VwcG9ydHMgZHVhbC1sYW5l
IGF0IGRpZmZlcmVudCB0cmFuc2ZlciByYXRlLiBUaGlzIHBhdGNoDQo+PiBpbml0aWFsaXplcyB0
aGUgY29udHJvbGxlciB0byB1c2UgdGhlIG1heGltdW0gc3VwcG9ydCB0cmFuc2ZlciByYXRlDQo+
PiBkZXNjcmliZXMgYnkgdGhlIGR3YzMgZGV2aWNlIHByb3BlcnR5IG9mIGxhbmUgY291bnQgYW5k
IGxhbmUgc3BlZWQNCj4+IG1hbnRpc3NhIGluIEdicHMuDQo+IFBlcmhhcHMgdGhpcyBzaG91bGQg
cmVhZCBhczoNCj4NCj4gCSJEV0NfdXNiMzIgc3VwcG9ydHMgZHVhbC1sYW5lIGF0IGRpZmZlcmVu
dCB0cmFuc2ZlciByYXRlLiBUaGlzDQo+IAlwYXRjaCBpbml0aWFsaXplcyB0aGUgY29udHJvbGxl
ciB0byB1c2UgdGhlIG1heGltdW0gc3VwcG9ydGVkDQo+IAl0cmFuc2ZlciByYXRlIGRlc2NyaWJl
ZCBieSB0aGUgZHdjMyBkZXZpY2UgcHJvcGVydHkgb2YgbGFuZQ0KPiAJY291bnQgYW5kIGxhbmUg
c3BlZWQgbWFudGlzc2EgaW4gR2Jwcy4iDQoNCk9rLg0KDQo+PiBAQCAtMTQyNCw2ICsxNDI4LDM4
IEBAIHN0YXRpYyB2b2lkIGR3YzNfY2hlY2tfcGFyYW1zKHN0cnVjdCBkd2MzICpkd2MpDQo+PiAg
IA0KPj4gICAJCWJyZWFrOw0KPj4gICAJfQ0KPj4gKw0KPj4gKwlzd2l0Y2ggKGR3Yy0+bWF4aW11
bV9sc20pIHsNCj4+ICsJY2FzZSA1Og0KPj4gKwkJYnJlYWs7DQo+PiArCWNhc2UgMTA6DQo+PiAr
CQlpZiAoZHdjLT5tYXhpbXVtX3NwZWVkID09IFVTQl9TUEVFRF9TVVBFUikNCj4+ICsJCQlkZXZf
ZXJyKGRldiwgImludmFsaWQgbWF4aW11bV9sc20gcGFyYW1ldGVyICVkXG4iLA0KPj4gKwkJCQlk
d2MtPm1heGltdW1fbHNtKTsNCj4+ICsJCS8qIEZhbGwgVGhyb3VnaCAqLw0KPj4gKwlkZWZhdWx0
Og0KPj4gKwkJaWYgKGR3Yy0+bWF4aW11bV9zcGVlZCA9PSBVU0JfU1BFRURfU1VQRVIpDQo+PiAr
CQkJZHdjLT5tYXhpbXVtX2xzbSA9IDU7DQo+PiArCQllbHNlIGlmIChkd2MtPm1heGltdW1fc3Bl
ZWQgPiBVU0JfU1BFRURfU1VQRVIpDQo+PiArCQkJZHdjLT5tYXhpbXVtX2xzbSA9IDEwOw0KPj4g
KwkJYnJlYWs7DQo+PiArCX0NCj4+ICsNCj4+ICsJc3dpdGNoIChkd2MtPm1heGltdW1fbGFuZXMp
IHsNCj4+ICsJY2FzZSAxOg0KPj4gKwljYXNlIDI6DQo+PiArCQlicmVhazsNCj4+ICsJZGVmYXVs
dDoNCj4+ICsJCWlmIChkd2MtPm1heGltdW1fbGFuZXMgPiAyKQ0KPj4gKwkJCWRldl9lcnIoZGV2
LCAiaW52YWxpZCBudW1iZXIgb2YgbGFuZXMgJWRcbiIsDQo+PiArCQkJCWR3Yy0+bWF4aW11bV9s
YW5lcyk7DQo+PiArDQo+PiArCQlpZiAoZHdjM19pc191c2IzMihkd2MpICYmDQo+PiArCQkgICAg
ZHdjLT5tYXhpbXVtX3NwZWVkID09IFVTQl9TUEVFRF9TVVBFUl9QTFVTKQ0KPj4gKwkJCWR3Yy0+
bWF4aW11bV9sYW5lcyA9IDI7DQo+PiArCQllbHNlDQo+PiArCQkJZHdjLT5tYXhpbXVtX2xhbmVz
ID0gMTsNCj4+ICsJfQ0KPj4gICB9DQo+PiAgIA0KPj4gICBzdGF0aWMgaW50IGR3YzNfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+PiBpbmRleCA3ZmRlM2M3
ZGE1NDMuLjhlNzI5ZDRjZDViZCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5oDQo+PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPj4gQEAgLTM3Niw2ICszNzYs
OCBAQA0KPj4gICAjZGVmaW5lIERXQzNfR1VDVEwyX1JTVF9BQ1RCSVRMQVRFUgkJQklUKDE0KQ0K
Pj4gICANCj4+ICAgLyogRGV2aWNlIENvbmZpZ3VyYXRpb24gUmVnaXN0ZXIgKi8NCj4+ICsjZGVm
aW5lIERXQzNfRENGR19OVU1MQU5FUyhuKQkoKChuKSAmIDB4MykgPDwgMzApIC8qIERXQ191c2Iz
MiBvbmx5ICovDQo+PiArDQo+PiAgICNkZWZpbmUgRFdDM19EQ0ZHX0RFVkFERFIoYWRkcikJKChh
ZGRyKSA8PCAzKQ0KPj4gICAjZGVmaW5lIERXQzNfRENGR19ERVZBRERSX01BU0sJRFdDM19EQ0ZH
X0RFVkFERFIoMHg3ZikNCj4+ICAgDQo+PiBAQCAtNDQ5LDYgKzQ1MSw4IEBADQo+PiAgICNkZWZp
bmUgRFdDM19ERVZURU5fVVNCUlNURU4JCUJJVCgxKQ0KPj4gICAjZGVmaW5lIERXQzNfREVWVEVO
X0RJU0NPTk5FVlRFTglCSVQoMCkNCj4+ICAgDQo+PiArI2RlZmluZSBEV0MzX0RTVFNfQ09OTkxB
TkVTKG4pCQkoKChuKSA+PiAzMCkgJiAweDMpIC8qIERXQ191c2IzMiBvbmx5ICovDQo+PiArDQo+
PiAgIC8qIERldmljZSBTdGF0dXMgUmVnaXN0ZXIgKi8NCj4+ICAgI2RlZmluZSBEV0MzX0RTVFNf
RENOUkQJCQlCSVQoMjkpDQo+PiAgIA0KPj4gQEAgLTk0Niw2ICs5NTAsOCBAQCBzdHJ1Y3QgZHdj
M19zY3JhdGNocGFkX2FycmF5IHsNCj4+ICAgICogQG5yX3NjcmF0Y2g6IG51bWJlciBvZiBzY3Jh
dGNoIGJ1ZmZlcnMNCj4+ICAgICogQHUxdTI6IG9ubHkgdXNlZCBvbiByZXZpc2lvbnMgPDEuODNh
IGZvciB3b3JrYXJvdW5kDQo+PiAgICAqIEBtYXhpbXVtX3NwZWVkOiBtYXhpbXVtIHNwZWVkIHJl
cXVlc3RlZCAobWFpbmx5IGZvciB0ZXN0aW5nIHB1cnBvc2VzKQ0KPj4gKyAqIEBtYXhpbXVtX2xz
bTogbWF4aW11bSBsYW5lIHNwZWVkIG1hbnRpc3NhIGluIEdicHMNCj4+ICsgKiBAbWF4aW11bV9s
YW5lczogbWF4aW11bSBsYW5lIGNvdW50DQo+PiAgICAqIEBpcDogY29udHJvbGxlcidzIElEDQo+
PiAgICAqIEByZXZpc2lvbjogY29udHJvbGxlcidzIHZlcnNpb24gb2YgYW4gSVANCj4+ICAgICog
QHZlcnNpb25fdHlwZTogVkVSU0lPTlRZUEUgcmVnaXN0ZXIgY29udGVudHMsIGEgc3ViIHJlbGVh
c2Ugb2YgYSByZXZpc2lvbg0KPj4gQEAgLTk3Myw2ICs5NzksNyBAQCBzdHJ1Y3QgZHdjM19zY3Jh
dGNocGFkX2FycmF5IHsNCj4+ICAgICogQGVwMHN0YXRlOiBzdGF0ZSBvZiBlbmRwb2ludCB6ZXJv
DQo+PiAgICAqIEBsaW5rX3N0YXRlOiBsaW5rIHN0YXRlDQo+PiAgICAqIEBzcGVlZDogZGV2aWNl
IHNwZWVkIChzdXBlciwgaGlnaCwgZnVsbCwgbG93KQ0KPj4gKyAqIEBsYW5lX2NvdW50OiBudW1i
ZXIgb2YgY29ubmVjdGVkIGxhbmVzDQo+PiAgICAqIEBod3BhcmFtczogY29weSBvZiBod3BhcmFt
cyByZWdpc3RlcnMNCj4+ICAgICogQHJvb3Q6IGRlYnVnZnMgcm9vdCBmb2xkZXIgcG9pbnRlcg0K
Pj4gICAgKiBAcmVnc2V0OiBkZWJ1Z2ZzIHBvaW50ZXIgdG8gcmVnZHVtcCBmaWxlDQo+PiBAQCAt
MTEwMCw2ICsxMTA3LDggQEAgc3RydWN0IGR3YzMgew0KPj4gICAJdTMyCQkJbnJfc2NyYXRjaDsN
Cj4+ICAgCXUzMgkJCXUxdTI7DQo+PiAgIAl1MzIJCQltYXhpbXVtX3NwZWVkOw0KPj4gKwl1OAkJ
CW1heGltdW1fbHNtOw0KPj4gKwl1OAkJCW1heGltdW1fbGFuZXM7DQo+PiAgIA0KPj4gICAJdTMy
CQkJaXA7DQo+PiAgIA0KPj4gQEAgLTExNTksNiArMTE2OCw3IEBAIHN0cnVjdCBkd2MzIHsNCj4+
ICAgCXU4CQkJdTFwZWw7DQo+PiAgIA0KPj4gICAJdTgJCQlzcGVlZDsNCj4+ICsJdTgJCQlsYW5l
X2NvdW50Ow0KPj4gICANCj4+ICAgCXU4CQkJbnVtX2VwczsNCj4+ICAgDQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMN
Cj4+IGluZGV4IGE2ZDU2MmUyMDhhOS4uYzMxMTQ0YWYzMjYxIDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQu
Yw0KPj4gQEAgLTIxODMsNiArMjE4Myw1MyBAQCBzdGF0aWMgdm9pZCBkd2MzX2dhZGdldF9zZXRf
c3BlZWQoc3RydWN0IHVzYl9nYWRnZXQgKmcsDQo+PiAgIAlzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgdm9pZCBkd2Mz
X2dhZGdldF9zZXRfc3VibGlua19hdHRyKHN0cnVjdCB1c2JfZ2FkZ2V0ICpnLA0KPj4gKwkJCQkJ
IHVuc2lnbmVkIGludCBsYW5lX2NvdW50LA0KPj4gKwkJCQkJIHVuc2lnbmVkIGludCBsc20pDQo+
PiArew0KPj4gKwlzdHJ1Y3QgZHdjMwkqZHdjID0gZ2FkZ2V0X3RvX2R3YyhnKTsNCj4+ICsJdW5z
aWduZWQgaW50CWxhbmVzOw0KPj4gKwl1bnNpZ25lZCBsb25nCWZsYWdzOw0KPj4gKwl1MzIJCXJl
ZzsNCj4+ICsNCj4+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPj4g
KwlpZiAoZHdjLT5tYXhpbXVtX3NwZWVkIDw9IFVTQl9TUEVFRF9TVVBFUikgew0KPj4gKwkJLyog
RmFsbCBiYWNrIHRvIG1heGltdW0gc3BlZWQgc3VwcG9ydGVkIGJ5IEhXICovDQo+PiArCQlzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4+ICsJCWR3YzNfZ2FkZ2V0
X3NldF9zcGVlZChnLCBkd2MtPm1heGltdW1fc3BlZWQpOw0KPj4gKwkJc3Bpbl9sb2NrX2lycXNh
dmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiBpdCBsb29rcyBsaWtlIHdlIHNob3VsZCBleHRyYWN0
IGEgX19kd2MzX2dhZGdldF9zZXRfc3BlZWQoKSB0byBhdm9pZCB0aGUNCj4gcG9zc2libGUgcmFj
ZSBoZXJlOg0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gaW5kZXggYTlhYmE3MTZiZjgwLi5lMzE3YjY5NjAy
OWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gKysrIGIvZHJp
dmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiBAQCAtMjExOCwxNCArMjExOCwxMSBAQCBzdGF0aWMg
dm9pZCBkd2MzX2dhZGdldF9jb25maWdfcGFyYW1zKHN0cnVjdCB1c2JfZ2FkZ2V0ICpnLA0KPiAg
IAkJCQljcHVfdG9fbGUxNihEV0MzX0RFRkFVTFRfVTJfREVWX0VYSVRfTEFUKTsNCj4gICB9DQo+
ICAgDQo+IC1zdGF0aWMgdm9pZCBkd2MzX2dhZGdldF9zZXRfc3BlZWQoc3RydWN0IHVzYl9nYWRn
ZXQgKmcsDQo+ICtzdGF0aWMgdm9pZCBfX2R3YzNfZ2FkZ2V0X3NldF9zcGVlZChzdHJ1Y3QgZHdj
MyAqZHdjLA0KPiAgIAkJCQkgIGVudW0gdXNiX2RldmljZV9zcGVlZCBzcGVlZCkNCj4gICB7DQo+
IC0Jc3RydWN0IGR3YzMJCSpkd2MgPSBnYWRnZXRfdG9fZHdjKGcpOw0KPiAtCXVuc2lnbmVkIGxv
bmcJCWZsYWdzOw0KPiAgIAl1MzIJCQlyZWc7DQo+ICAgDQo+IC0Jc3Bpbl9sb2NrX2lycXNhdmUo
JmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiAgIAlyZWcgPSBkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdD
M19EQ0ZHKTsNCj4gICAJcmVnICY9IH4oRFdDM19EQ0ZHX1NQRUVEX01BU0spOw0KPiAgIA0KPiBA
QCAtMjE3NSw3ICsyMTcyLDE2IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X3NldF9zcGVlZChz
dHJ1Y3QgdXNiX2dhZGdldCAqZywNCj4gICAJCX0NCj4gICAJfQ0KPiAgIAlkd2MzX3dyaXRlbChk
d2MtPnJlZ3MsIERXQzNfRENGRywgcmVnKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgZHdj
M19nYWRnZXRfc2V0X3NwZWVkKHN0cnVjdCB1c2JfZ2FkZ2V0ICpnLA0KPiArCQkJCSAgZW51bSB1
c2JfZGV2aWNlX3NwZWVkIHNwZWVkKQ0KPiArew0KPiArCXN0cnVjdCBkd2MzCQkqZHdjID0gZ2Fk
Z2V0X3RvX2R3YyhnKTsNCj4gKwl1bnNpZ25lZCBsb25nCQlmbGFnczsNCj4gICANCj4gKwlzcGlu
X2xvY2tfaXJxc2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICsJX19kd2MzX2dhZGdldF9zZXRf
c3BlZWQoZHdjLCBzcGVlZCk7DQo+ICAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmR3Yy0+bG9j
aywgZmxhZ3MpOw0KPiAgIH0NCj4gICANCj4gVGhlbiB5b3VyIHBhdGNoIHdvdWxkIGxvb2sgbGlr
ZToNCj4NCj4gc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfc2V0X3N1YmxpbmtfYXR0cihzdHJ1Y3Qg
dXNiX2dhZGdldCAqZywNCj4gCQkJCQkgdW5zaWduZWQgaW50IGxhbmVfY291bnQsDQo+IAkJCQkJ
IHVuc2lnbmVkIGludCBsc20pDQo+IHsNCj4gCXN0cnVjdCBkd2MzCSpkd2MgPSBnYWRnZXRfdG9f
ZHdjKGcpOw0KPiAJdW5zaWduZWQgaW50CWxhbmVzOw0KPiAJdW5zaWduZWQgbG9uZwlmbGFnczsN
Cj4gCXUzMgkJcmVnOw0KPg0KPiAJc3Bpbl9sb2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3Mp
Ow0KPiAJaWYgKGR3Yy0+bWF4aW11bV9zcGVlZCA8PSBVU0JfU1BFRURfU1VQRVIpIHsNCj4gCQkv
KiBGYWxsIGJhY2sgdG8gbWF4aW11bSBzcGVlZCBzdXBwb3J0ZWQgYnkgSFcgKi8NCj4gCQlfX2R3
YzNfZ2FkZ2V0X3NldF9zcGVlZChkd2MsIGR3Yy0+bWF4aW11bV9zcGVlZCk7DQo+IAkJZ290byBk
b25lOw0KPiAJfQ0KPg0KPiAJWy4uLl0NCj4gfQ0KDQpPay4gSSdsbCByZXZpc2UgdGhpcy4NCg0K
VGhhbmtzIQ0KVGhpbmgNCg==
