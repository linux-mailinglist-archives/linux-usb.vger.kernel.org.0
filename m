Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318132CA940
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 18:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387876AbgLARBe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 12:01:34 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:49230 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726485AbgLARBe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 12:01:34 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7A300C0970;
        Tue,  1 Dec 2020 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1606842033; bh=VnQxYAdjlIhiRjJgz1+0moak/NXMhQEiX17zI01WtFo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=e0xEKCGCjApVAB7gkkleTTFnPbEaNOhX+x/juovT3hA5oEtp4zSpJc4Y5A1rXpf1z
         /MgoRi9cxOADymVY43ZhxoOp3l3JG9DtVwAewB/oYhFmeSlbhK94Ulo/W79CQ7p/D6
         4NBa4Lz0Lei6V6REGzpVKf2zUbzV7BtIUOXODN+0UqpQh32qqru3kASXyKbjaLi7EJ
         JhIFRrSWir4p5UoYqdvlbxDS1uTfjMAeUJ6gxpXrSqTNKHD8PEAWasWrxhKMCTjTaz
         z9QgwTh6ibpXOhnNyDooV3TVHpoT/l7QKOKmte21QNPK4TCx56TKVY4VDbnqrWGTgb
         I/DevmhiD4diQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id B485DA0068;
        Tue,  1 Dec 2020 17:00:32 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B73194014A;
        Tue,  1 Dec 2020 17:00:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ZOXF8oTY";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWmkM8As3ZYhz5ruQzeFxDmSnQf32umKC0l9C+Mgd0R0dkASQIk/EdOqaVObxgCtNG2jCWNhylxtBOAB19nlbGAhrl4HISLexw74YBDLe+BZ8ghLK4+U3R3MAnqpeuCqQIapoSuY/JI//EYK+xE/T/SKwUPGW4/3qZgi69hbYnpV+iV7L/YsxxPFQvVYEvV1VeswrcTLBpRrJVHlF6zHHqNzdWrCefGWTngO4pdVbMc42jBas7P7U20RWpM50jKIqAEgoG+NkqNr/+GIADClnuMh4WTd0kmyJiKaCKhNCn8aMNpvL4FI9j37HSPQcrsyVANwyjOtWOi1XO6wAMqhRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnQxYAdjlIhiRjJgz1+0moak/NXMhQEiX17zI01WtFo=;
 b=hDXkpSjbKATqGbUp6VMk3/+UrItE4sMaqEmkw8wLCObFGDMzormLZjHgrCsYRgFzWL6g/bJnkC06ioM8Dly7j4OteVxnv8qQPudtI9UFfg3o0NVjuNfz/9SQLkFAqCArv1kkdfKPiCuJvEhomA207ran/b1IxmwF5CrQLP0skk53w3VH0muVevvRC+khG327iwvYgGZGtpUvgn1IcJd1w/tY6+HewIXM6yk2byo3LXIl9Sie6Z1Lp25WvQt5Sqs6Slwqql7sXgAmWxJNy6a2aQyn5GOup1XvXO3ZwQdwhHECiEqfWdPXFOMo1j00+bmgdrfYiJRxN8zMQMueFgiIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnQxYAdjlIhiRjJgz1+0moak/NXMhQEiX17zI01WtFo=;
 b=ZOXF8oTYzgtg8Dy3WN4Eqy3ktdhXhl5m/WUjDHvBSmqb5gOzp9xyx7hcJLFhmCo2grASqgZQQGh/YbbuLkBMVWU2I/SU9IGkAtmkMJ6a9EhOHBnLvI9xmpTaatZGFW26yWhh6ray8iA8O1PBPv3p588RgB5/PBGsAPxUvO/rB40=
Received: from BYAPR12MB3303.namprd12.prod.outlook.com (2603:10b6:a03:131::28)
 by BYAPR12MB3527.namprd12.prod.outlook.com (2603:10b6:a03:13c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Tue, 1 Dec
 2020 17:00:30 +0000
Received: from BYAPR12MB3303.namprd12.prod.outlook.com
 ([fe80::f1dc:e903:bcfb:d79b]) by BYAPR12MB3303.namprd12.prod.outlook.com
 ([fe80::f1dc:e903:bcfb:d79b%5]) with mapi id 15.20.3611.020; Tue, 1 Dec 2020
 17:00:30 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Li Jun <jun.li@nxp.com>, "balbi@kernel.org" <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>
Subject: Re: [PATCH] usb: dwc3: gadget: fix delayed status missing for clear
 EP halt
Thread-Topic: [PATCH] usb: dwc3: gadget: fix delayed status missing for clear
 EP halt
Thread-Index: AQHWx7PS4kIa1f5CDEW7PdUhnXt/JKnid4gA
Date:   Tue, 1 Dec 2020 17:00:29 +0000
Message-ID: <e077da14-0741-9374-9ac0-6670a65cb719@synopsys.com>
References: <1606807357-12574-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1606807357-12574-1-git-send-email-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2030ba6-093a-4ed7-8e59-08d8961a9bcd
x-ms-traffictypediagnostic: BYAPR12MB3527:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3527B2E7C53A5F0CA2ACEC08AAF40@BYAPR12MB3527.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cjWIheCiyjlMOVLK813gd1w8zV9z+nVQPczaXA1C8AnZabUXqPCuyshbhBZAYRrElr0JLjWzuqS2HY5AdZZ/+cbHQ+ex32pMToUTRm4KbzOgs+Rq+TMHJbaMzzmdP5DRvV+ZzU7WWiu8zY2uHH7iy3KevCg46OFe5dYkymZ96jv47NVgFzTEzsPVhYfUWDdK2UjC3blv4eBvK19bRIMIABVu6t+12v0iaEjDqhZxKS7/NNzhuq90iKcwIeVVpdqSa5gxl8xR7NqCrAPuQ1YR6CcJW2bkB784NK6avX7051jX5WgQ5J6/1Ha8XSviw4AclsPuFmAScE2Pz+tD0eZU/cPS749lY/tEst7/Ak5bCP/h/Ya4oNuyihC51dPWRuyJ4b+KcB0HVykhJTjn7DWTt5hv51cts0LwNaK5UXzafJKaIdGkdf7KHmCZEDquIJVCqzv4h/cvPvHGJCKyBVK9eg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3303.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(5660300002)(31696002)(8936002)(4326008)(66476007)(76116006)(66946007)(31686004)(64756008)(36756003)(66556008)(2906002)(66446008)(6506007)(2616005)(186003)(83380400001)(26005)(966005)(6486002)(6512007)(71200400001)(86362001)(478600001)(8676002)(316002)(54906003)(110136005)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y0NZcXQ1akhHalB1Q1NIYk5xWitOV1kydm9QUUFHNnNKbG1vZi83ZStrbUtT?=
 =?utf-8?B?RGdwYTNaRERBb1pCdkM1RERjdDdWb1VMSmFkZnljYXliM1R2dXFSNFF1bEFq?=
 =?utf-8?B?bXRBc09RMWpTcTdQUzdGd01sNWZHRDBybWppN3E5YTNiT0RrMFFDR3BtbGZk?=
 =?utf-8?B?WU44dVRYZHdoZUZNNFRZVHJIUGJnU3FzTGhYbjlzQkU2UmlVbjhIT1prVGVC?=
 =?utf-8?B?a0RtRjNxUEJBOGd3RG1BV1RkdmtQRUttOTNRUStWWS93Rit1VFRYUnFzaEEw?=
 =?utf-8?B?NDIzUWJObkdWQkY2VlBWbC9HSURXVnRlcVk5SjNmUk1zSk9DM0NDN3BmbFBs?=
 =?utf-8?B?L3ZRT3lnRWlTaytQc1FwZ1ViVFVQL05OWUhOWFB4TjR4ME53Sk45Y1F2WkJn?=
 =?utf-8?B?TlRrTm0rVGRkNHpPK0tpYjE3bjNZQlF6ZG0yY0U0aThTb1IxVkNBQTFEcDNB?=
 =?utf-8?B?OHFGRzlTbDFwdXlUdFpWVldoNFR1d29JWGV0L3JqVXc3RVlFVi8vZmsrTFQr?=
 =?utf-8?B?UTFiRVJqNk8weUpjZ0dRaDFIa0JLUU4xWVVxMTU5bzFCVzc4VVNoOEhUL2dQ?=
 =?utf-8?B?WFByUEhkQ1lYellEeTRSSnF0N1A0NlZZR3FVbmorclRsRUNTdmRxaHNZTHVV?=
 =?utf-8?B?MmJNOGZsNGFaOXZhVFpRc1BQV2Q4ZEZtSndVY0t0N0plY0xGL3VaYmdhSlFI?=
 =?utf-8?B?WUU3TFNMdTRPdlNqankraUs1cEkwR3ZUYVlqQlJucUNONzZDSllZRkR4SFRk?=
 =?utf-8?B?QVJITGUzVDFwUjJSSU1ROWo2b0Y1cGdDWnFuSUUvaEtlcy9jbHdnUTlrSUQy?=
 =?utf-8?B?UHkxRVdQdmhVVnBvaHZXVkVtZXNQRkpUQUJSc2ttUzA5UGdwalA1WjJxY1JT?=
 =?utf-8?B?aDNWYnJ4MndRRlVkc0xvaWtaK2lBR2FDWDJQUUwrTEJMT0FXTUltTHg1UGRs?=
 =?utf-8?B?SUdUTWRXczJKRUhJb2F0ckc3a2tMQ1VGZEl1MHd2U3Y2YzRjTGVHOWdOS1l2?=
 =?utf-8?B?d1dFYlpuODRreXB4REdwbno0NjhWalNYL0tTRy9oVkxRdllQVUxVbDZJUzV4?=
 =?utf-8?B?a0ZHejZSR1hKbFoxWjBqMzlNWHdvaGhwOFhFQk9hRVN5MzVINDdKZnRyTTZX?=
 =?utf-8?B?Z3FQMkZzWE5kTUJYTFFWaXFTYkxpWjA4TzU0YWR2cGJTVlJIMFZPdkNGY3NQ?=
 =?utf-8?B?a2tTS0RvS0VZUDB1VVBab2t1U05lMjJSNitSak9PSGIzY0RxNElNeEFac2RY?=
 =?utf-8?B?ZmQvdURnU1pIdkJ3K2lwRmNSS0RxdmVVaHd2R3RVTUprdU5HNmxKZ1NiMWQ3?=
 =?utf-8?Q?PGwiKQGXf004g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF918C144773A8438223B24288EE5A03@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3303.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2030ba6-093a-4ed7-8e59-08d8961a9bcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 17:00:29.8841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EKCgWjBiy7J578PdH83wHj0shHZ7M7XaPwuHznwChLL/G1vMZoZWqSdEQ3PswIctu8r2OSxm9tAJXsryAOqJ2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3527
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkxpIEp1biB3cm90ZToNCj4gV2l0aCBzZXZlcmFsIGltcHJvdmVtZW50cyBvbiBoYW5k
bGluZyBvZiBDbGVhckZlYXR1cmUoaGFsdCksIHRoZXJlDQo+IGlzIG9uZSBjYXNlIG9mIGRlbGF5
ZWQgc3RhdHVzIG1pc3Npbmc6IGlmIHRoZSB4ZmVybm90cmVhZHkgZXZlbnQNCj4gY29tZXMgYWZ0
ZXIgZW5kIHRyYW5zZmVyIGFuZCBjbGVhciBlcCBzdGFsbCBjb21tYW5kIGNvbXBsZXRpb24sDQo+
IHdlIGNhbiBub3Qgc2VuZCB0aGUgZGVsYXllZCBzdGF0dXMgaW4gZHdjM19lcDBfc2VuZF9kZWxh
eWVkX3N0YXR1cygpDQo+IGFzIHRoZSBlcDBzdGF0dXMgaXMgbm90IHJlYWR5LCB0aGVuIGluIHhm
ZXJub3RyZWFkeSBldmVudCB3ZSBzdGlsbA0KPiBjYW4gbm90IHNlbmQgc3RhdHVzIGJlY2F1c2Ug
ZGVsYXllZF9zdGF0dXMgaXMgc3RpbGwgc2V0Lg0KPg0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZw0KPiBGaXhlczogZDk3Yzc4YTE5MDhlICgidXNiOiBkd2MzOiBnYWRnZXQ6IEVORF9UUkFO
U0ZFUiBiZWZvcmUgQ0xFQVJfU1RBTEwgY29tbWFuZCIpDQo+IFNpZ25lZC1vZmYtYnk6IExpIEp1
biA8anVuLmxpQG54cC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9lcDAuYyB8IDgg
KysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2VwMC5jDQo+IGluZGV4IDdiZTM5MDMuLjk1ODBlOWYgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvdXNiL2R3YzMvZXAwLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9lcDAuYw0KPiBA
QCAtMTA1OCwxMCArMTA1OCwxNiBAQCB2b2lkIGR3YzNfZXAwX3NlbmRfZGVsYXllZF9zdGF0dXMo
c3RydWN0IGR3YzMgKmR3YykNCj4gIHsNCj4gIAl1bnNpZ25lZCBpbnQgZGlyZWN0aW9uID0gIWR3
Yy0+ZXAwX2V4cGVjdF9pbjsNCj4gIA0KPiArCS8qDQo+ICsJICogSWYgd2UgYXJlIHJlYWR5IHRv
IHNlbmQgZGVsYXllZCBzdGF0dXMNCj4gKwkgKiBidXQgd2FpdCBzdGF0dXMgcGhhcnNlLCB3ZSBj
YW4gY2xlYXINCj4gKwkgKiBkZWxheWVkX3N0YXR1cyBmbGFnIHRvIGxldCBFUDAgWGZlck5vdFJl
YWR5DQo+ICsJICogaGFuZGxlIGl0IGFzIGEgbm9ybWFsIHN0YXR1cyBzZW5kaW5nLg0KPiArCSAq
Lw0KPiArCWR3Yy0+ZGVsYXllZF9zdGF0dXMgPSBmYWxzZTsNCj4gIAlpZiAoZHdjLT5lcDBzdGF0
ZSAhPSBFUDBfU1RBVFVTX1BIQVNFKQ0KPiAgCQlyZXR1cm47DQo+ICANCj4gLQlkd2MtPmRlbGF5
ZWRfc3RhdHVzID0gZmFsc2U7DQo+ICAJX19kd2MzX2VwMF9kb19jb250cm9sX3N0YXR1cyhkd2Ms
IGR3Yy0+ZXBzW2RpcmVjdGlvbl0pOw0KPiAgfQ0KPiAgDQoNClRoaXMgZml4IGlzIGFscmVhZHkg
dXBzdHJlYW1lZDoNCmZhMjdlMmY2YzVlNiAoInVzYjogZHdjMzogZXAwOiBGaXggZGVsYXkgc3Rh
dHVzIGhhbmRsaW5nIikNCg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9ZmEyN2UyZjZjNWU2NzRmM2Yx
MjI1ZjljYTdhNzgyMWZhYWYzOTNiYg0KDQpUaGFua3MsDQpUaGluaA0K
