Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 196BC14F601
	for <lists+linux-usb@lfdr.de>; Sat,  1 Feb 2020 04:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgBADRR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 22:17:17 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:42644 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726567AbgBADRQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 22:17:16 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8F8CA40195;
        Sat,  1 Feb 2020 03:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1580527036; bh=rcif4dzghE0VZvEPC4fTUrz3vsEF9WY3mFN63YYsiC0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=VUmplUecvvvqUtQnqpQ4YMfGAMSGo9o+SEfdL8Tlf4IHqq0OLgO+oiLG9KKsON1b3
         rmgSdUvXBQKqsXngBc+Zwt+O+reG6wzj3ECMov3sK163kKOjM+eNvzbYlkT7GCehCM
         hBBVEPJn19ZoV8r2VJ4dsYRja/D++0sZPbBYkypZKPdevAzCe461wfTm0hGCm5w+cc
         lZO3+d3171CcMCeqydk/O5zA9duP1feMp1BpfgWwooJ6ceGyJXD1AvM40bYUbnl9yk
         m4IaLKHFR469E4hzy1iZZp/UfZuVyyV0f4RAUMx1kIvxMAzWi0lxcH1DdQVqlLNLjw
         4uEUTThrCZDlQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id A2C6FA008D;
        Sat,  1 Feb 2020 03:17:14 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 31 Jan 2020 19:17:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 31 Jan 2020 19:17:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLjcJlbxhS1GNrdAs9OwfVXLaZK5hO4wYoTZFbfG6tq/sTrOxCO4BmJXWKRhHOFICqZcWl1d1d/fS8VkbARiZ8wEy0h+pE1gc5LIY6JvSsC+A8yMH4MeQX22tqA/8d2Rc5fE/X4MSpoRg4RptxZ0ZFcQl0xdsKe8VjQxsE5RgsQgcxFKK7oyxpvNmLlbLmobiwqiTcMSc+Li43hEq7Bet45HaOMlcE7Saa3ez1s7RjNIzpJaaD7RpJ9+5i841ZQ/jOQAGsjOAjpvLEp7EQTnMI/+Nt2RAvzZfpnmlPx/fd2Tc7FsAeekH7y8RFOT2axXh+QkO1sE9G8BgiJc1ZNhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcif4dzghE0VZvEPC4fTUrz3vsEF9WY3mFN63YYsiC0=;
 b=EX4SjRNDNNv3TjbcAhRMUnuFupDK4B93Oz4PmQ42GyXq4QtrhnJG9C8zelmugxB5DDZUy91Q8dJ2hl3iXytNAQLu0g+HzMv4DrgkYKbdGhEd1c5SDaOh61jM8EQaJv60KGIiZIfUBLh7X9O1k4UdPZYPOAybZYcayekTpgvjg2BkhXBfkHXeSVVouXMStvQuWyWhzLBpsw4mYLZVIuMYHl0hC0udvSYERT/vHUjHnK4EmYNBFBKKA0np5DxhW9YH5NOvphARwMAEdmQlaIDcLEJXazyYFDX4Aho5LLY8Glvn9Zp91GX1A2m7kfEb8KxLOGFxXAN3GXQ8W+i41VFLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcif4dzghE0VZvEPC4fTUrz3vsEF9WY3mFN63YYsiC0=;
 b=l5HW/V73p+t6E951yUOTC7iZYrwQydHW7oTBPkBOJLEosc7aJ9io8NjbJFQtH9s4yPomxJGiG0Lze6JXeJQVvIWfa4rZpemljaodGUEOjGlkfOJTZEv9giFKDD9d/2wYRALuv+SwPSOCXVdmniBUSc8xJO9Y/ZzQ7Xj1PImftc4=
Received: from SN6PR12MB2718.namprd12.prod.outlook.com (52.135.103.22) by
 SN6PR12MB2621.namprd12.prod.outlook.com (52.135.105.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.29; Sat, 1 Feb 2020 03:17:12 +0000
Received: from SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::35b7:65bf:63e:aad0]) by SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::35b7:65bf:63e:aad0%7]) with mapi id 15.20.2686.030; Sat, 1 Feb 2020
 03:17:12 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: composite: Inform controller driver of
 self-powered
Thread-Topic: [PATCH] usb: gadget: composite: Inform controller driver of
 self-powered
Thread-Index: AQHV2Kp3aOQg6qEJKUu1uTheV/P4k6gFqtqA
Date:   Sat, 1 Feb 2020 03:17:12 +0000
Message-ID: <e7888e93-b8af-ccb0-aad8-cd40d168f7e5@synopsys.com>
References: <87bd6e525dbc59cd636c3cf5a4fa1758e9da6727.1580525268.git.thinhn@synopsys.com>
In-Reply-To: <87bd6e525dbc59cd636c3cf5a4fa1758e9da6727.1580525268.git.thinhn@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb79e63f-660d-4b6f-278c-08d7a6c53ad7
x-ms-traffictypediagnostic: SN6PR12MB2621:
x-microsoft-antispam-prvs: <SN6PR12MB2621D19DDFC7A9E088353067AA060@SN6PR12MB2621.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 03008837BD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39860400002)(376002)(366004)(346002)(396003)(199004)(189003)(6486002)(2906002)(31696002)(86362001)(4326008)(31686004)(71200400001)(81166006)(81156014)(8676002)(6512007)(8936002)(316002)(110136005)(26005)(5660300002)(66476007)(66556008)(6506007)(478600001)(36756003)(186003)(2616005)(76116006)(66446008)(66946007)(64756008);DIR:OUT;SFP:1102;SCL:1;SRVR:SN6PR12MB2621;H:SN6PR12MB2718.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QhQlsi2ScXlKQsL+APtymaeztmwXm6Uf846GPOokgxbcrY4k9MR0CLAwPkNgjibbYbWqyRt1GPQee5cakoObTXiP5jxm2gRWyaE/msQU/LNG26J7gBalhWMqRJceN51E/qd9PqPq35uBftTdGe4y3DvAmybQov6UTbLuhIc1zAQLJkvtn/lOV481sxvBLEHIh3c+FL/DuYAEP6oc6hx/XmN4g3uRpcQAo2x1ws5SMrCfOmlxma6j9cSA8YgoJieyjzAoxWrIETnJIGjSQGB0VKOq5Wr0hqVHWTk7yjB16hhoxhE33UATIkHifMph4Af748HiH6U/SpMpYEEXTMBU9EAuySMCrIcOF8+Ees1AIxAsymP0XXu5HSxOSePuig4Va02KBliq6kJnKD9bjf/0JVJTOytrUSfh9EyEB6QBpHhQRKh4KpdK/85FnOb3Mshn
x-ms-exchange-antispam-messagedata: XMD3HXOi/FYyLr6xs6AE3CawVrdGQYS1c2H66dfg56LMv3stB2ytBd2LHuK9lDqWYMMNZ7oaSCbU9WH/SP34j6R5pSV3fbHnIlmNzuFRgQQ7lG+W2WbwLo9LhDFqwtdRyL3YA3Z88ErlB57XzY6+Dw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8F8DA943BAE134EA87712AFD9E33C14@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cb79e63f-660d-4b6f-278c-08d7a6c53ad7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2020 03:17:12.1052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nWPOOm0CwD+3he5Nz9nZbFkmvqDH4lfJ9DkCIIISjRwCT2pGD+Y+WD6Yv/vYNFUkFaXY01hg5/gXm/PUsWfUsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2621
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

KysgRmVsaXBlIChjb3JyZWN0IGVtYWlsIGFkZHJlc3MpDQoNClRoaW5oIE5ndXllbiB3cm90ZToN
Cj4gRGlmZmVyZW50IGNvbmZpZ3VyYXRpb24gbWF5IGRyYXcgZGlmZmVyZW50IHBvd2VyLiBJbmZv
cm0gdGhlIGNvbnRyb2xsZXINCj4gZHJpdmVyIG9mIHRoZSBjaGFuZ2Ugc28gaXQgY2FuIHJlc3Bv
bmQgcHJvcGVybHkgKGUuZy4gR0VUX1NUQVRVUw0KPiByZXF1ZXN0KS4gVGhpcyBmaXhlcyBhbiBp
c3N1ZSB3aXRoIHNldHRpbmcgTWF4UG93ZXIgZnJvbSBjb25maWdmcy4gVGhlDQo+IGNvbXBvc2l0
ZSBkcml2ZXIgZG9lc24ndCBjaGVjayB0aGlzIHZhbHVlIHdoZW4gc2V0dGluZyBzZWxmLXBvd2Vy
ZWQuDQo+DQo+IEZpeGVzOiA4OGFmOGJiZTRlZjcgKCJ1c2I6IGdhZGdldDogdGhlIHN0YXJ0IG9m
IHRoZSBjb25maWdmcyBpbnRlcmZhY2UiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5ZW4g
PHRoaW5obkBzeW5vcHN5cy5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvdXNiL2dhZGdldC9jb21w
b3NpdGUuYyB8IDUgKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvY29tcG9zaXRlLmMgYi9kcml2ZXJz
L3VzYi9nYWRnZXQvY29tcG9zaXRlLmMNCj4gaW5kZXggMjIzZjcyZDRkOWVkLi4yZmJlYjJjMTk2
NjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUuYw0KPiArKysg
Yi9kcml2ZXJzL3VzYi9nYWRnZXQvY29tcG9zaXRlLmMNCj4gQEAgLTg2MSw2ICs4NjEsMTEgQEAg
c3RhdGljIGludCBzZXRfY29uZmlnKHN0cnVjdCB1c2JfY29tcG9zaXRlX2RldiAqY2RldiwNCj4g
ICAJZWxzZQ0KPiAgIAkJcG93ZXIgPSBtaW4ocG93ZXIsIDkwMFUpOw0KPiAgIGRvbmU6DQo+ICsJ
aWYgKHBvd2VyIDw9IFVTQl9TRUxGX1BPV0VSX1ZCVVNfTUFYX0RSQVcpDQo+ICsJCXVzYl9nYWRn
ZXRfc2V0X3NlbGZwb3dlcmVkKGdhZGdldCk7DQo+ICsJZWxzZQ0KPiArCQl1c2JfZ2FkZ2V0X2Ns
ZWFyX3NlbGZwb3dlcmVkKGdhZGdldCk7DQo+ICsNCj4gICAJdXNiX2dhZGdldF92YnVzX2RyYXco
Z2FkZ2V0LCBwb3dlcik7DQo+ICAgCWlmIChyZXN1bHQgPj0gMCAmJiBjZGV2LT5kZWxheWVkX3N0
YXR1cykNCj4gICAJCXJlc3VsdCA9IFVTQl9HQURHRVRfREVMQVlFRF9TVEFUVVM7DQoNClRoZSBn
ZXRfbWFpbnRhaW5lci5wbCBzY3JpcHQgcmV0dXJuZWQgdGhlIGVtYWlsIGJhbGJpQHRpLmNvbSB3
aGVuIGl0IA0Kc2hvdWxkIGJlIGJhbGJpQGtlcm5lbC5vcmcgZHVlIHRvIGdpdCBibGFtZWQgZml4
ZXMuDQoNCklzIHRoaXMgYSBidWcgb3IgaW50ZW50aW9uYWw/DQoNClRoaW5oDQo=
