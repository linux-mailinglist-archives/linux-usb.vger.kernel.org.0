Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80193102D9
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 03:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhBECdp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Feb 2021 21:33:45 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38824 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230216AbhBECda (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Feb 2021 21:33:30 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B3C09401AB;
        Fri,  5 Feb 2021 02:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612492349; bh=we09kv4iC0fsi5EzFHBQrLzZIwPK2OKEjRzC91K/Pgk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=PJEDYbXFtpCvuAzUQbRKYoztZV27oexXImYYfFxcboq8gDO/7i87603WCo8CBMuoa
         l09xZQ8YI3JFGIi3Dt1ry72M2FAYItyCmJuTiKRiQ69khakLm9pGBzmtvdabUMOsAr
         EZNQDON690dl7+Q1IdVdMt4vMgTxFX+cDcagya6ZU9wWMXUyCuteiFEmadR2uKRPRg
         OmfsJvAzh+VLGjz/jT13awMdq9bxKDOgMpmuPxVxVef+HOr3W9miHgZ9gFEXjNIRWy
         Bjwpq3suKZzfXoK/wUNLvbyTzIHiQ1AoTfN0mqr0jF5E3yJvrd2myFsRzqQWRk/Yq4
         dfiXMeZsUaxWg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6C916A0071;
        Fri,  5 Feb 2021 02:32:29 +0000 (UTC)
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2050.outbound.protection.outlook.com [104.47.44.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id CB20B40131;
        Fri,  5 Feb 2021 02:32:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="bpmRkPvH";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OafmDTonpaya1UFkyWcJO2S98vBzu5MXMeLKrerF/feSg/2VhugkeuK4wU+WU3y/cCPC/lU8RGmTC56PBk/Olg1niQ6W08WOhCt2rD6dqvJJopxs/Z5PyeM9BbFpNFIZRLVdDPMAyzrhaOhQ/f8vkCFj0fK0D996E/9U4zBQgPLSl02EK4kuGHtdR/guWP3dPDFZqgalYYLIDKLah/77SzmRa0cht4Yg6EfhB4t73tfZYImkX94WU/+h7Nx272HlSANbJdgm1rUkmBu6xudGxOoHsF01rDeTOyoN2dGQKJdeOOJYYAY05U7xZV+6X981/IHyepIh67sy0vewyw2cYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=we09kv4iC0fsi5EzFHBQrLzZIwPK2OKEjRzC91K/Pgk=;
 b=EFEZrNMZco7c8LVV3pC08hONbLE73MEP04NAQv9voHZQRxz1/Ontds3tmfBwJQR4tj6EaEPcbWe+Vt+6uzL1no9LBhGId14T35u0W9W5Jr0R8dNyx7NcTm/pOE97vdikP3LZ5OuzMDekBChtrzFWz0kFkoRyr1Tbew647l4G2BC47I+9aSCTIgMDsryTmuwzzY2ndNSCMdBFvNaGM0PirPqv+8ik+0lxJ1XT9fojBi80xr39Z5Iko2XCvMs9TZKPicrmrZ+XbXuEl/nAXWufDpvywpUJ3HBdfi4z6sbCujOfD2+Yy6/oFxgLtbW+rMJfyzYMXSKG2yYWZ6x/A+btvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=we09kv4iC0fsi5EzFHBQrLzZIwPK2OKEjRzC91K/Pgk=;
 b=bpmRkPvHedJLdHxmPH91p8+rcvPWXx+9fm7S4IG/nSs0XuZX9V/ev6HKooKfSZyjsw/DdpcUjDtVHwvU3anDosBoQGFZtw4TdffSH4eqqMhr0B7BlW2jEJcxK+rWuKX2b7Pmo/E5uJYcL4XR+cz8siMQ1EOx+t4cAllYWI/pnZA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4802.namprd12.prod.outlook.com (2603:10b6:a03:1fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Fri, 5 Feb
 2021 02:32:25 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3805.026; Fri, 5 Feb 2021
 02:32:25 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v7 1/6] dt-binding: usb: Include USB SSP rates in GenXxY
Thread-Topic: [PATCH v7 1/6] dt-binding: usb: Include USB SSP rates in GenXxY
Thread-Index: AQHW7syiBCtV124o40W9FJfYBFcsoKpI8KwA
Date:   Fri, 5 Feb 2021 02:32:25 +0000
Message-ID: <03b9c15f-9319-a9b7-63c6-b21e9d1d1689@synopsys.com>
References: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
 <cc7cc15f87e209c9963f19129f51398cdc374358.1611106162.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cc7cc15f87e209c9963f19129f51398cdc374358.1611106162.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9da2db8e-114c-4ea5-04f1-08d8c97e4622
x-ms-traffictypediagnostic: BY5PR12MB4802:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB480228C1FB452CFE6A3E6CFAAAB29@BY5PR12MB4802.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: URcbmvl9fIUIXD2xRLk8dA2JB/4qrUuLVMVFTrYANfZGxF3Ryq1yoiNzotysbMOwhL8utoDO3zgM5x8yLiVHGYTM8XzDXerswW5jfquBBfbjrmwZP1kLQNv39BrXNNrOAleJlqc+NmqRap109j3ttIEZd47d1bpq+RdtxNQnyfeO11P5hvAgr3YqggqFgovz1Zs/HpZ48cJFADCdKrsLYnTFqA6aVCBQcnik78C8RY9jsMoGuFi4otAhXcHj5hEtovxwNsbH2ng81w1/a5y5z4L3+FVmVS3lxtHj6Wj8C9nBVuShBy13kx3xfAThkCNQgeKzsuwDyFwCIKlcZQGDFrQhiU6x7JrRTi5DdTFeGXamJcw778wmlPyfQ0Mo/p784WPzy547TIz8TvzN+ojYFKEZk5qmhQ0Ltj1nXtgrqx/d+uLTXRnubKuCzaYLsvMGZMs0Rc8njtXHrFel2Zsg7DqAw6qlTT7uyy+jxO0EaqPDEVTM7iMzyb76yqgpyV4KiQxucS0SHY1gQFdi4nFkYbXYVJ37uRrJzuPAdvzn2X9FnRSrjfwNbKyLAriA7tlkjJCLW72GtUdnCysqUXYwtMlgY5F9rccodoy28BSaPDA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(346002)(396003)(376002)(366004)(39860400002)(136003)(107886003)(186003)(71200400001)(26005)(478600001)(6486002)(86362001)(66446008)(31696002)(2616005)(66556008)(8676002)(66476007)(66946007)(64756008)(83380400001)(76116006)(316002)(8936002)(2906002)(110136005)(6512007)(36756003)(6506007)(31686004)(5660300002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aVBXQ2FYQXQ0OCsvUTA1ZUU5enZDL2NiNVlqcGxwa3d0ODRzRXBTQUpGUGdk?=
 =?utf-8?B?RXJ1clRkZ2lPaU5NbUVodXlkdWgwY1UzSnNnaEo4ZWxVcUVzdmZDU0NZU0Zv?=
 =?utf-8?B?ZjVqSlF4UDJ0RjVGc3RNbXBYYVFxYmtLUXRaYnpvZjJJc0plVjdHcXI4NERP?=
 =?utf-8?B?ZUJObkQvenlrS0JpdDlOaGpRbVN3SklzK1VuM1N2MUtFQnduRHZ4UklCMUN0?=
 =?utf-8?B?QmQ0TWdxYmxWQkZsRDNpQUgwc0dIQ1BKTytGT2JsWXFKWkFFekQzajJORDNs?=
 =?utf-8?B?K2M4NVlGT0JvN2lLQW5ubkZENUlDbEZ5WWIxcmtTaG9SNjI2ckpoOXZsUDk1?=
 =?utf-8?B?NzB2UHE0cThveEZOUUU4ejRQU1VFWE4yL1dtY1NwMTlJaUxJNGNYUXVMYVNM?=
 =?utf-8?B?NWlaeEtvMll3SEZOTnJuZ2ttcDdIa3NERjRCblI1M1NrTGp2OTNIKy92OUtv?=
 =?utf-8?B?Y3ZqRXhMNG9KY2NpdDhvakQxUlZmMENWUCsyU1gza2xvT3kvRjRjVFloMVNn?=
 =?utf-8?B?UWQ4a0tLaFFxTGhncHNScW1nT3oyV2xDRFN3Vk1uRjBDNzhUaVVhQndwNkpM?=
 =?utf-8?B?ZkpyUVJLZlRiTlBIaE1RNXpjM2xvaHptQWNhTHlYYXBNemRRTUxYQVQ5Sm5i?=
 =?utf-8?B?a01iV2V4akZMdXhoWVVzLzlxTDRRRFRUU0JHOE1aUE81RnpqaHlSQk41ZEI1?=
 =?utf-8?B?K3liaE9lSnNYQVZmWHE1V2FiSlZzdE9qR1pwU1ZKS3dIQkFIVXNXRWc3bDlG?=
 =?utf-8?B?SzU2Ty9TdXc2Y1M1RDR4ZHcvdWg0RnQ4RDkySmFZNWwzYkRZbU11NlFuWXVa?=
 =?utf-8?B?dUkySy9kVWJheHBGcmJ3Z3RLZXd2RmF5OVZSYitYaUVIT1JURFliNG1Wb3NF?=
 =?utf-8?B?ZnZXZldybHZHcTZnc09tWnVpTTNXbVFrVVQ4QnRjUElCcHQ0dWhGRksvSE9h?=
 =?utf-8?B?YktLMHJvbnhNQ3VnYk5WSjZoYzg2ZGRhbm1IY1lmbE5BM0ZYL2ZHVFRNQzBj?=
 =?utf-8?B?S1VWVHdWTloxanNFUXZMSDVUdFMwMUdqQnNvR3Y0Y0ZjaWFteWxyaGk0RkNx?=
 =?utf-8?B?Q0RVb1VpckRKWWkySTI3c2tZUmtROGcvczd5aXExRFYvZk5lT3ZpQ21MbkYr?=
 =?utf-8?B?N2EyVy9qVlY5QmxoWlVMUURXcklaSWtua2tWMGJNS2ppUnJ3dHQxWHhSREpQ?=
 =?utf-8?B?N1puK0ltaWx0dzRaSVNtSS9hWkxrMVlZakRqcFdnR3huWjZSeHBMZVNicHdV?=
 =?utf-8?B?WlllaW1WdnMyVnVwb3BNOUtJQmI5UkhhbTBMYzR0MTdHK1BMcDZEdWQ0cWNl?=
 =?utf-8?B?QS9xUzBTdFl4aytlQWEwcDI3WnJ0d2F3QXVxS29xcENxTmN3YXhvcHBoNkc3?=
 =?utf-8?B?K2YzN3BsNHVEMzRMblV2SlVHa3VZczRlZDN4NlNkT2QrdDZkR04vcUlxQk9X?=
 =?utf-8?B?aEx3djZYcGxVSE4zRGtkRFZIanhZT3ZQaGtURkVOMjM2ZndRUHFMcTNvYTBP?=
 =?utf-8?B?bWRuK09JRUJnanRuVURlZkxoWC91V3V5a2l1REdPa1BXaDFoRUJUOENoOXlF?=
 =?utf-8?B?cXFFZm1wREhJS2pQdCsyaXhGdmE2Zk55NVdXdU1kNHpwVmhUbUN0dCtTekJ3?=
 =?utf-8?B?Z0FIVFpBbExKR2J4Wk9kdmp3RGhGYXQ5MFBIa3BvMXBXT3BhQURQWTlFcS9q?=
 =?utf-8?B?OGFYazBOVW5NQklGY0xUeTZDWlFtM2NhZFM3NVBMZ2dsNVFqblJRTk13aDR4?=
 =?utf-8?Q?OmgXAz4FXDHs2ml6hI+p1JYgip+9/CjNWROQP7z?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA1963E3650DAD47AEB0008771F39D90@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da2db8e-114c-4ea5-04f1-08d8c97e4622
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 02:32:25.1682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGG+lf3aHvvfES8cNOluAc9eMVW6exTD4x90YR8YbNC6Yd0BQZVBef+NyxyqmuOWWZI1ck357p6UhlW0yh6smw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4802
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUm9iLA0KDQpUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+IEFjY29yZGluZyB0byB0aGUgVVNCIDMu
MiBzcGVjLCBhIFN1cGVyU3BlZWQgUGx1cyBkZXZpY2UgY2FuIG9wZXJhdGUgYXQNCj4gZ2VuMngy
LCBnZW4yeDEsIG9yIGdlbjF4Mi4gSWYgdGhlIFVTQiBjb250cm9sbGVyIGRldmljZSBzdXBwb3J0
cw0KPiBtdWx0aXBsZSBsYW5lcyBhdCBkaWZmZXJlbnQgdHJhbnNmZXIgcmF0ZXMsIHRoZSB1c2Vy
IGNhbiBzcGVjaWZ5IHRoZSBIVw0KPiBjYXBhYmlsaXR5IHZpYSB0aGVzZSBuZXcgc3BlZWQgc3Ry
aW5nczoNCj4NCj4gInN1cGVyLXNwZWVkLXBsdXMtZ2VuMngyIg0KPiAic3VwZXItc3BlZWQtcGx1
cy1nZW4yeDEiDQo+ICJzdXBlci1zcGVlZC1wbHVzLWdlbjF4MiINCj4NCj4gSWYgdGhlIGFyZ3Vt
ZW50IGlzIHNpbXBseSAic3VwZXItc3BlZWQtcGx1cyIsIFVTQiBjb250cm9sbGVycyBzaG91bGQN
Cj4gZGVmYXVsdCB0byB0aGVpciBtYXhpbXVtIHRyYW5zZmVyIHJhdGUgYW5kIG51bWJlciBvZiBs
YW5lcy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lu
b3BzeXMuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2NzoNCj4gLSBSZWJhc2Ugb24gR3JlZydz
IHVzYi10ZXN0aW5nIGJyYW5jaA0KPiBDaGFuZ2VzIGluIHY2Og0KPiAtIFVwZGF0ZSB0aGUgZGlm
ZmVyZW50IG1heGltdW1fc3BlZWQgZW51bXMgdG8gdGhlIHVzYi55YW1sDQo+IC0gUmVtb3ZlIFJl
dmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiBiZWNhdXNlIHRoZSBjb21t
aXQgaXMgdXBkYXRlZA0KPiAtIFJlYmFzZSBvbiBHcmVnJ3MgdXNiLXRlc3RpbmcgYnJhbmNoDQo+
IC0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlDQo+IENoYW5nZXMgaW4gdjU6DQo+IC0gQWRkIFJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiAtIFJlYmFzZSBvbiBGZWxp
cGUncyB0ZXN0aW5nL25leHQgYnJhbmNoDQo+IC0gQ2hhbmdlZCBTaWduZWQtb2ZmLWJ5IGVtYWls
IHRvIG1hdGNoIEZyb206IGVtYWlsIGhlYWRlcg0KPiBDaGFuZ2VzIGluIHY0Og0KPiAtIE5vbmUN
Cj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSBVc2UgIm1heGltdW0tc3BlZWQiIHRvIGluY2x1ZGUgYm90
aCB0aGUgbnVtLWxhbmUgYW5kIHRyYW5zZmVyIHJhdGUgZm9yIFNTUA0KPiAtIFJlbW92ZSAibnVt
LWxhbmVzIiBhbmQgImxhbmUtc3BlZWQtbWFudGlzc2EtZ2JwcyIgcHJvcGVydGllcw0KPiBDaGFu
Z2VzIGluIHYyOg0KPiAtIE1ha2UgIm51bS1sYW5lcyIgYW5kICJsYW5lLXNwZWVkLW1hbnRpc3Nh
LWdicHMiIGNvbW1vbiBVU0IgcHJvcGVydGllcw0KPg0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3VzYi91c2IueWFtbCB8IDMgKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL3VzYi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi91c2IueWFtbA0KPiBpbmRleCBlYmU3ZjQyNzVjNTkuLjc4NDkxZTY2ZWQyNCAxMDA2NDQN
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi91c2IueWFtbA0K
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3VzYi55YW1sDQo+
IEBAIC01NCw2ICs1NCw5IEBAIHByb3BlcnRpZXM6DQo+ICAgICAgICAtIGhpZ2gtc3BlZWQNCj4g
ICAgICAgIC0gc3VwZXItc3BlZWQNCj4gICAgICAgIC0gc3VwZXItc3BlZWQtcGx1cw0KPiArICAg
ICAgLSBzdXBlci1zcGVlZC1wbHVzLWdlbjJ4MQ0KPiArICAgICAgLSBzdXBlci1zcGVlZC1wbHVz
LWdlbjF4Mg0KPiArICAgICAgLSBzdXBlci1zcGVlZC1wbHVzLWdlbjJ4Mg0KPiAgDQo+ICBhZGRp
dGlvbmFsUHJvcGVydGllczogdHJ1ZQ0KPiAgDQoNCkNhbiBJIGhhdmUgeW91ciBSZXZpZXdlZC1i
eSBhZ2Fpbj8gSGFkIHRvIGRyb3AgaXQgcHJldmlvdXNseSBiZWNhdXNlIHRoZQ0KY2hhbmdlIG5l
ZWRlZCB0byBiZSByZWJhc2VkIGFuZCBhZGRlZCB0byB0aGUgeWFtbCBmaWxlIGluc3RlYWQuDQoN
ClRoYW5rcywNClRoaW5oDQo=
