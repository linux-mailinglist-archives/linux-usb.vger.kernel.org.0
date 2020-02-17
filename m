Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E71EE161344
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 14:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbgBQN0h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 08:26:37 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:46632 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726866AbgBQN0g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 08:26:36 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7007040510;
        Mon, 17 Feb 2020 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1581945995; bh=PJH6BAKx6sVO62TgWha3dgkQX2ztvrXyrmKcgFAXBKU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=bcLypBjnEqAe5zHysuRgH/opqbnkPvUqh20IZADYB+8RIojtWNbcCt17Qfed3dqaD
         FMGdiwM0DiDt3ysAJex+Ibz7qumPujmp+96X1SFN37jFCKUu6Ns8OTB7BwoLIMPQSL
         +aCHXn5L3Wyj56kR+GEdPutIPYr8Uwr+hwAZsxJXqBLfgIqsJRPTHDSoUbGfUo1brT
         Aqk5EJZbye5DbCIRMuao3AO4hdormxyhnKgg18NHdxIuaGnYwxH1C9w0ZlZIn+9WaX
         h6Bvu/MmPq5mlIa6F+5MymM8n88vJsPsdlqqsw/sW2eG3sWNWR9rT+7Qcpa7drCAgm
         57t/aqwVWFQPg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1D63EA0067;
        Mon, 17 Feb 2020 13:26:32 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 17 Feb 2020 05:26:32 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 17 Feb 2020 05:26:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4eFJgK/RUXE66JTlLDwqCEv1bW/5JO4D1vu0d062uB2OEUHm4k2quYkoG+8MXtoJHSXT0IfEPOOvxvvU2E2utnbZEJC4kjY9F+l8LAJywB7GJlFWL0DWDX7KsbMscdbE+AFJ9j3LEqjS2K3h/Bctr4tZAEllH9U36bwDjBt04Pntr4u40vcefRSaJLJ37Np4Ggkd4TfxbkgR354JeZfumq5C/TzC2RifL8LbxQSobpFG+4BIkzYFlOq4PsdkuykhdFlQhL5awNIvkM262byVuZiqG8UU8FjvoRv2/rk0Eo4FRdPx3RFqyC/2/x17Eav6WvMd9mEyoInGsjz9xiwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJH6BAKx6sVO62TgWha3dgkQX2ztvrXyrmKcgFAXBKU=;
 b=aK2CF6xZGv1ayG0Pf97BUESKV9hIdxWe0w2MfH6mVq/Ej865UVf1V/uHOFDUHt3RDZ549Lid9WXzXTZEMMp8Pf9nigeAnop6tE8p26rVq95UXHu/fzDP34A0D503VStX7lDfD20fEQyb4Ga5Ztq/lZ9Vw/lSO5C8IkuHM9a30c8wnfrfZzQKva1RyoO1KRABRs/ypBzls/Kd9jpx2Z/9UDMe6bvjAAiMsczGGmMlpx28+eckHJP6TdNwLOhTYzMhYnfJAz5ggWM4aI8lK4SBzpBsZoKRn4E9e1KZzJBR1fztaNYWFV1vQBGKYBVGuVwvXwkBjLDTAQcdyQ4Ekec0wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJH6BAKx6sVO62TgWha3dgkQX2ztvrXyrmKcgFAXBKU=;
 b=nZ/dGMRCmShOgrC2WcLjbPkBzhD8No4qUAMRZ6gmCB231NlcRhVbsVQ244wBSna3p3HOFQjMQl+su70RCv8za4AGM48aJe1MyrxH64TTZQJlJ1yoypBA+jenveha3+ye0KAB3YjmhQQAzAmuWRjJTy793CHVZHalIYoYnbv4FVg=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB2893.namprd12.prod.outlook.com (20.179.83.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 13:26:31 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8%7]) with mapi id 15.20.2729.031; Mon, 17 Feb 2020
 13:26:31 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: USB DWC2 stops responding when insert/remove cable multiple times
Thread-Topic: USB DWC2 stops responding when insert/remove cable multiple
 times
Thread-Index: AQHV4zxylJsWeUZ0JUKEDMOhhpCodKgfGkgAgAA7cgCAAA+HAA==
Date:   Mon, 17 Feb 2020 13:26:30 +0000
Message-ID: <ee47be28-ba9f-750f-65d2-51a722ce291d@synopsys.com>
References: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
 <41a7bfe7-54b1-84eb-091f-469d971ab968@synopsys.com>
 <CAP9ODKoUH=Cc=uuhfaUy7fkSVdfBHhX-6oS9_hi3Wd6GgDiZYw@mail.gmail.com>
In-Reply-To: <CAP9ODKoUH=Cc=uuhfaUy7fkSVdfBHhX-6oS9_hi3Wd6GgDiZYw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 352bedfe-1ec5-47b4-31b8-08d7b3ad003f
x-ms-traffictypediagnostic: MN2PR12MB2893:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB289358F51F79FFAC5AC3E94CA7160@MN2PR12MB2893.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0316567485
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(366004)(136003)(396003)(39860400002)(199004)(189003)(76116006)(2616005)(478600001)(31686004)(66946007)(66556008)(91956017)(6486002)(66446008)(64756008)(66476007)(54906003)(4326008)(81166006)(5660300002)(81156014)(8936002)(71200400001)(86362001)(53546011)(110136005)(2906002)(186003)(6512007)(316002)(36756003)(8676002)(31696002)(26005)(6506007);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB2893;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GOL/u6ri2VkbGVOAqcojtxwMKnHP9uco/LQFKSbXsS8B4VfWUnDkx4Whh61ImTxiCQVw8QHh3CqVc48HKV/AXiUOYLMWDNJi+5S4wwp2kQgWzJUGfpsggxwtzNjiE0A4DQ2neCztAyJFCg+4UDTjAj1HXVdlpENQgG7EgFRJvY67+OuA2F33UexuloK7/7Edqgo+ijUKVLVdjYGkbks4VmtUyg4YCsZJ4yjdfEImgtLF8fKd9Fkap6y1KkAeRpUYEkIg2YqtGPLYZubm3g7cC6W6J83YgVkw36AcP1tMlbk6JReaE4seFKPvGe44R3fUPtxr7N/k+BTlvEgUDAAvgtzc9xowwtF7m05v08IK7/gx0STtYmxotWYYDihkBv1lp3njuTivcOpmVSpYy4G3ORzq528st5E5t1T+JL5sfLcRf2QJyefl6z+cHOn/WZ6T
x-ms-exchange-antispam-messagedata: o8+b4XE7oP0/DMaaPZEF3m+lpPAtG9AXQ4IWNZ5Z+tSCmFVu8v0+FKz8fAZdF4T6lKMecbtQnP+nW+wEIdJ2dDljMgupSe2XMjibBVGwqVVsmNzqycox2DCucYN4GEy7JQT25daIMG1dOhaK10yXiA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DE938F54FDE314DB6D56C761EAE977B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 352bedfe-1ec5-47b4-31b8-08d7b3ad003f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2020 13:26:30.9666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kf2BrMPjo64zpFJOYw2YEBY/IBibTV+3UBdA28KoMzUnC3/uR3qtS1ME6o6tykWNR9uKS9FzUUjtc0/HRJeRBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2893
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgT3RhdmlvLA0KDQpPbiAyLzE3LzIwMjAgNDozMCBQTSwgT3RhdmlvIFNhbHZhZG9yIHdyb3Rl
Og0KPiBIZWxsbyBNaW5hcywNCj4gDQo+IE9uIE1vbiwgRmViIDE3LCAyMDIwIGF0IDU6NTggQU0g
TWluYXMgSGFydXR5dW55YW4NCj4gPE1pbmFzLkhhcnV0eXVueWFuQHN5bm9wc3lzLmNvbT4gd3Jv
dGU6DQo+PiBPbiAyLzE0LzIwMjAgNTo0MCBQTSwgT3RhdmlvIFNhbHZhZG9yIHdyb3RlOg0KPiAu
Li4NCj4+PiAgICAgICBbICAzMTIuOTY3ODY3XSBnX3NlcmlhbCBnYWRnZXQ6IGhpZ2gtc3BlZWQg
Y29uZmlnICMyOiBDREMgQUNNIGNvbmZpZw0KPj4+ICAgICAgIFsgIDMxNC44MjgxNzNdIGR3YzIg
MzAxODAwMDAudXNiOiBuZXcgZGV2aWNlIGlzIGhpZ2gtc3BlZWQNCj4+PiAgICAgICBbICAzMTQu
ODY2OTQzXSBkd2MyIDMwMTgwMDAwLnVzYjogbmV3IGFkZHJlc3MgMTYNCj4+PiAgICAgICBbICAz
MTQuODg5NTUwXSBnX3NlcmlhbCBnYWRnZXQ6IGhpZ2gtc3BlZWQgY29uZmlnICMyOiBDREMgQUNN
IGNvbmZpZw0KPj4+DQo+Pg0KPj4gSSBhc3N1bWUgaGVyZSB5b3UgZmV3IHRpbWUgZGlzY29ubmVj
dGVkIGFuZCB0aGVuIGNvbm5lY3RlZCBjYWJsZSBhbmQNCj4+IGFmdGVyIGxhc3QgY29ubmVjdGlv
biBldmVuIHdoZW4gZ19zZXJpYWwgc2VlbiBpbiBsYXN0IGxpbmUgaXQgc3RvcCB3b3JrLg0KPj4g
Q29ycmVjdD8NCj4gDQo+IFllcy4gSXQgc3RvcHMgcmVzcG9uZGluZy4NCj4gDQo+Pj4gVGhlICJb
ICAzMTQuODg5NTUwXSBnX3NlcmlhbCBnYWRnZXQ6IGhpZ2gtc3BlZWQgY29uZmlnICMyOiBDREMg
QUNNDQo+Pj4gY29uZmlnIiBtZXNzYWdlIGlzIHRoZSBsYXN0IHRpbWUgaXQgaXMgZGV0ZWN0ZWQu
IEFzIG1lbnRpb25lZCwgdG8NCj4+PiByZXN0b3JlIHRoZSBwb3J0IHRvIHdvcmssIHdlIG5lZWQg
dG8gcmVsb2FkIHRoZSBnX3NlcmlhbCBtb2R1bGUuDQo+Pj4NCj4+PiBXaGVuIHdlIHJlbG9hZCBp
dCwgZm9sbG93aW5nIGV4Y2VwdGlvbiBoYXBwZW5zOg0KPj4+DQo+Pg0KPj4gQWN0dWFsbHkgZXhj
ZXB0aW9uIGhhcHBlbiBpbiBnX3NlcmlhbCBub3QgZHdjMi4gV2h5IHlvdSBhc3N1bWUgdGhhdCBp
dA0KPj4gYmVjYXVzZSBvZiBkd2MyPw0KPiANCj4gSW5kZWVkLiBBZnRlciByZXBvcnRpbmcgdGhp
cywgaXQgZG9lcyBzb3VuZHMgaXQgaXMgdHdvIGRlY291cGxlDQo+IGlzc3Vlcy4gVGhlIHR0eSBz
ZWVtcyB0byBiZSBub3QgcHJvcGVybHkgY2xlYW5lZCB1cCBhbmQgaXQgc2VlbXMgdG8NCj4gaGF2
ZSBhIHJlc291cmNlIG5vdCBwcm9wZXJseSBjbGVhbmVkIHVwLg0KPiANCkVuYWJsZSBkZWJ1ZyBw
cmludHMgdG8gZ2V0IGZ1bGwgZHdjMiBkZWJ1ZyBwcmludHMgdG8gc2VlIHdoYXQgaGFwcGVuIA0K
d2l0aCBkd2MyLg0KDQo+IC4uLg0KPj4+IFNvLCBJIGFtIGEgYml0IGxvc3QgaG93IHRvIGRlYnVn
IHRoaXMgc28gSSdkIGxpa2UgdG8ga25vdyB3aGF0IGtpbmQgb2YNCj4+PiBpbmZvcm1hdGlvbiBt
aWdodCBiZSB1c2VmdWwgdG8gZmluZCB0aGUgcm9vdCBjYXVzZSBvZiBpdD8NCj4+DQo+PiBBbmQg
ZGVzcGl0ZSBvZiBhYm92ZSBleGNlcHRpb24sIGdfc2VyaWFsIGVudW1lcmF0ZWQgaXQgd29ya3Mg
ZmluZT8NCj4gDQo+IElmIHJlbG9hZGVkIHRoZSBVU0IgaXMgZGV0ZWN0ZWQgYnV0IHR0eSBzZWVt
cyB0byBub3Qgd29yay4gSXQgc2VlbXMgaXQNCj4gZmFpbHMgdG8gZnJlZSB0aGUgdHR5R1MwIHBy
ZXZpb3VzbHkgdXNlZCBhbmQgdGh1cyBpdCBjYW5ub3QgcHJvcGVybHkNCj4gY3JlYXRlIHRoZSBu
ZXcgZGV2aWNlLg0KPiANCj4+IFBsZWFzZSBwcm92aWRlIG1lIGR1bXAgb2YgZm9sbG93IGR3YzIg
ZGVidWdmcydzOiByZWdkdW1wLCBod19wYXJhbXMsIHBhcmFtcy4NCj4gDQo+IERvIHlvdSB3YW50
IHRoaXMgb24gd29ya2luZyBhbmQgZmFpbGluZyBzdGF0ZSBvciBqdXN0IHRoZSBmYWlsaW5nIG9u
ZT8NCj4gDQpBZnRlciBmYWlsaW5nLg0KDQoNClRoYW5rcywNCk1pbmFzDQo=
