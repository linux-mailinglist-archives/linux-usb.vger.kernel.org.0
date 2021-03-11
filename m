Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88326336AE7
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 04:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbhCKDqW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 22:46:22 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50344 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231169AbhCKDqQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 22:46:16 -0500
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 80C91C0A42;
        Thu, 11 Mar 2021 03:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1615434376; bh=+sQS3E+iE3HCGqRcWo6Wyx0IYhbghuJ8oz/nEhFMJ9c=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=JKQuCQ59NQNT54tCT7pGGMw+mk4kUGAQAmIh3qKglUoeGfbiozaOAf/swV2Tcv1ui
         9uVA4i5L9st+lcai9guYY9KEuDiHze5wnewtb0UMuifCAS3LpXsP4M4JXB6nxdo9a5
         mqLrgTVbRbu8JGvH0QkiG+fes7o6XI9xO7ax5MxNTyNuRuw50/vGG5M6SRjefDUVD5
         1s0IJy6WVwZ+yRGqrpI8mYCU8hA0PV1DVR5LnSkSOI3lEhLqbuC6qbMxSNfZC+fW/d
         08bGBjG+licccyxLiye0s41sJWmC/N99o81PO9fa2krNYH0d2ajZ06bqSfZSAtazSq
         e0dyQgZdmEMhg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id ECE19A0082;
        Thu, 11 Mar 2021 03:46:14 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 703EB80021;
        Thu, 11 Mar 2021 03:46:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="TjnLl9QW";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QakSgELHy04r9rZj8aoSOLwS+Qg+om5Uqt1bVen0u72g0A2wEmwxjhPiu+dsgujdtP8zoudOzVYuWm6qOjXp7NGNXc1NaXkiPzmeI9FpODjkE/lEe65CF2W6Z+NFdNkRFQdm98cJKJCm37GMR564VkX29waZMI+f7GtgIyu/kC+HiSm3sv9ZUnPh6W6jMKsiOFCcmzeJqEq21oirpgh7brA4gAM3aD42O73QaYHmwsSIZbteE/iKLrw5NSppbVSz4zn8QS/a3PLXEs+pLVg+3WIwQp1Asox+zq6V1J+itmUyw8YOx401AfRcKppfH5nN9PpVJUj2T/OFSq0zsNiWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sQS3E+iE3HCGqRcWo6Wyx0IYhbghuJ8oz/nEhFMJ9c=;
 b=b+Fs/TUsxmRobqSItj82eAOsvyhPe/55ZQFOLfx8SUXFNmc7Kc+/BwWjJ7pykkL2W4rm9ttVY2erE1MMEnVBcaNmDNwqIY78/MudD9V5kaLGjzgYdE7udY3NKV3T45H7pcvPs1VIAmJ+rApyWwaIjTNLT+cfmNPoTLKC6eM+lAddfdArTYoWq1h6BhiPD5HR2BRdnsqVD3k/OURyBsL7DNiTh6dVwnmTCpMS2Cn44TrA0+UkORlumCLMFyrawAeX+626r/oYf4qVBAHthztwaX4MfixJQRO7rWeN4ylCmiFULvufQwTSo+is3YXmqqy1WEpDMSCbjDAhAfpSQ0+Gew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sQS3E+iE3HCGqRcWo6Wyx0IYhbghuJ8oz/nEhFMJ9c=;
 b=TjnLl9QWfPUgkv3ixDmcb1uAbjvPKhA9xYQOqK68+jBXvKgbcYyCJ4gb/1457OtbyJGcMLGAfF8edxgQhJ2XYIEzFNbHeLwprXX46yW1z5LKsfPjdcwp39CV2mLrnXGCBjiXG6NrRjTubfHidtNRJn7nZ5bceK9w9sc9wmjsslU=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4209.namprd12.prod.outlook.com (2603:10b6:a03:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.29; Thu, 11 Mar
 2021 03:46:10 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 03:46:10 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Hardik Gajjar <hgajjar@de.adit-jv.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v2 3/8] usb: core: hub: Print speed name based on ssp rate
Thread-Topic: [PATCH v2 3/8] usb: core: hub: Print speed name based on ssp
 rate
Thread-Index: AQHW+qu6nRjYR2B3aEeaFwa6rz369ap9G/+AgAFAzoA=
Date:   Thu, 11 Mar 2021 03:46:10 +0000
Message-ID: <d134c2fb-9bed-cd4f-fb9d-24b0aac4b510@synopsys.com>
References: <cover.1612410491.git.Thinh.Nguyen@synopsys.com>
 <d7049743924adf82f93ddfe403a5ebb9ac06e49b.1612410491.git.Thinh.Nguyen@synopsys.com>
 <dca3aff0-793f-394b-1ded-47140f0c8a30@linux.intel.com>
In-Reply-To: <dca3aff0-793f-394b-1ded-47140f0c8a30@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d13a6362-d61f-4357-cc03-08d8e4403598
x-ms-traffictypediagnostic: BY5PR12MB4209:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB42099FE908EAE941F15F3D42AA909@BY5PR12MB4209.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: br6mK2WmNYE84QnTrLKW0CDHjjpxG1Tng4jWn1RZte3Kfam7wcRN/SGtwJ85xN+yYxQE51fzod2qrv8UQzHH2kjAiw5To2+JY8Q0vYvQWkCG9UWKu8+cxNM7y2JggPRtzRFJ3KkKsNUQpm2LtJjRqljvarkGcmvl/MzM6+qgSyZO8pi4dV1QWrtvSPUbbEWWemQDa2RRWWq8v8E0TsTht0jhEX95kDg+0EyeE8kjB+3o16IlsqnLwlxipp3HBA5uJa23MCQ7cYvFpPbQ4tb3Fj3DQDKbTAE5HcfUcsb5+INmqp7I+TO1T6qdLhBweAaAhpemW5ZB6/lGsxrcoxjjknx9Zw7hltwzjfzNhxVVXkFSsBI4KQwiki9VJs5+lRo4O+0rO8L25YcOOln69CvHuKQuQn0B1RaaB8iqpA5OpiFTUoGj2qhuc0kKDhFvNvJkPQpoZZNBaciIWpSsuzqYwqXI7MJmZmNyhq9fPURajtSgw6C0iJH++96V8PpTDu/VcSG0iFdVZKUGuScK8xhPiezKWE/WBURjgPopgJIP34KMM0x6knazjaDvMwOFHhNN8SOHPthki4tqOnRcrmBu6re2LDNnB5Bt7nir+mxSsH8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(136003)(39860400002)(376002)(396003)(186003)(31686004)(36756003)(2616005)(26005)(6512007)(6486002)(83380400001)(478600001)(66446008)(110136005)(76116006)(64756008)(31696002)(5660300002)(316002)(66556008)(66476007)(66946007)(86362001)(2906002)(8936002)(71200400001)(8676002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NVFyYnJISjNpZDlxLzNXMXpKRXpYWlVvSGRrNHd0eVNVTG5Ra0JIZ1hnRElt?=
 =?utf-8?B?bFJtOXZpUkI5bGNLZzZ1Q0FJRWJ0TzRlci80ekxVV2RERks4cFBwUVF1WWFr?=
 =?utf-8?B?by8vMkZGWEQwQXh1L0pJR0hIWU1FMk42bVY0VlpGcmc2UEFEVVhLT0duMUoz?=
 =?utf-8?B?RDdHcExrVXVObURHWFFPMHlOWkx2d1pIbThWdDlFbXBHcVZZMGljWXlmTERG?=
 =?utf-8?B?ZU0xZUlzRmlXMGVZUWdkYTA3QURUUUdQOEt4TWRteGRxcDFzY0k4V1JzanNv?=
 =?utf-8?B?Sm1VUG5QS3FzdmRMY2N3K1U3M0FIS1NZci9GRXFXOFovOGxOcXhQN21FS0tU?=
 =?utf-8?B?RlFteUh5WlFUUEZZQVpsUGdMQlAwajVJcFB0SnhDdFhtTElRVGJybWh1bEFm?=
 =?utf-8?B?bEhWNHEvSWhPQ1pzSU5sK1BrWXRqNWtDVjRhdzI5SVpWUXNYVy85eUk0Skkw?=
 =?utf-8?B?bThuWmlsUXRrN05JVC9OUzV3SHlOWVEvYkZWeXM1ODYrZHBQN2VSdFlncWpX?=
 =?utf-8?B?ckQwd21QMXVBZTZnSUNqMnAyV3pFU1BUbW9CQ0NRMk04ZWlTQk9jY0Qrc091?=
 =?utf-8?B?QkhYZmpGcERnaHo3ZWtRbTR2cXZOWE1wR1VidGIvQk53Q3hpNUQ1Qmc0K1Bo?=
 =?utf-8?B?RURuSVZXRWJFbFdBRjhFbkthNmRmQllmZmhpV01ocHYxYWpaLys2Zkt3YXVH?=
 =?utf-8?B?YWt1anR4Y3ZZalQ3dDgrRWRXQWtpWmhXSkFWaGs4OVh4NjVsbFdRSkE3S1Rm?=
 =?utf-8?B?aU5rclV4cVdibDhwdW5CWmRCY2hsL2tWK2NPamZvSFZkYXZUaFRSaGk5VDFD?=
 =?utf-8?B?VVZhWnZ2UmJQZzUyRnRSQ09pWXJUWEUyaGJrZWo2N0k0cDYvZzgvTThncW5K?=
 =?utf-8?B?WGY2bFY4Nzh0WkkvK1BtbHArZVhvSXhuMXEyaGZ6ai9ZbnIxeWZydmRLYkJG?=
 =?utf-8?B?YTlmb2pkMlZNczVBbENSOFdrRTF3dkprNWIxQkRyMkdMK3ZIWHFUc2dhNU1S?=
 =?utf-8?B?YjJYOGVWMHRiS1lUNGNiOFE2MUE2MU5QL0xVWUY0Z0pVWkt6cC96TVh2WFFD?=
 =?utf-8?B?REZac2NQQ1BFem8xYy83dWFMOWhBWDROUWo2TjBjakpuOXU5UStNWFFXRWEr?=
 =?utf-8?B?Z1NFN0VxQjFFUUZLNFhsRUl3L0dYcitNL0xTeUVVVTZPUHNZeFNQS3RLcUVT?=
 =?utf-8?B?Sm8xNkxuMGNXZEZVNm9yTUV6SUF4WmxFWkorckpwdjRzWC9ncGpkcm42T3dT?=
 =?utf-8?B?VGRaS1ZEOUNJS0pTeWlvWjNVVmYzQkpENHp3L1NxeXFkemFCMWQ1NzZTREhK?=
 =?utf-8?B?S0t3YWp3L3B5NEZTUkthcDRvbHQ0MVRIcE5mejFaZUtOSUZBemlkMVJEa3VU?=
 =?utf-8?B?ZWhVblVyOVRmVWNwaHErZU9VRy96WVNwbGkwNkhOeUF6Tm51NmRpcFNUUTRv?=
 =?utf-8?B?TmJIWjc3SVJsTGdYaHFIS3h4NGp4S21xRWNZdm9CVTlNejl0em1SbEZyTjhY?=
 =?utf-8?B?VmdFWW0xNTBWTkF4aXlQeEVaQm1mblQ5RFNRRjE4YzZhTllHK25lNDdsZWxo?=
 =?utf-8?B?UHp0TkgyUlA4QmpUY1ZxaWgyQVh5V00xTDdZdlAzekFFYm1DeG0vODV1K3lP?=
 =?utf-8?B?WUx1ckNkODZTWm9aRElpL0hJRVNNR1JIWGVHL1hFeVh0TUVkZk1ZU0hSZGdv?=
 =?utf-8?B?Ykl1WFg3NkF2c3BPU05GdHFRNWV5Qm1pZWx5UUNiTkhrZDJ1eVpsTDF3K21Q?=
 =?utf-8?Q?xZdIe6vZxV+IEUw1QY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <438667E34CF10249AC2F26232EC1511C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13a6362-d61f-4357-cc03-08d8e4403598
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2021 03:46:10.0541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bvh9CDiOxbrTRCtKlZeELqPFhyMRlsbVhkoCpOCZW6BaeYnI5GgBw/DSaZl3Pn06JVsyVsylgJMB/ZLCpyzVDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4209
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gT24gNC4yLjIwMjEgNi4xMCwgVGhpbmggTmd1eWVuIHdy
b3RlOg0KPj4gQ2hlY2sgZm9yIHVzYl9kZXZpY2UtPnNzcF9yYXRlIHRvIHByaW50IHRoZSBTdXBl
clNwZWVkIFBsdXMgc2lnbmFsaW5nDQo+PiByYXRlIGdlbmVyYXRpb24gYW5kIGxhbmUgY291bnQu
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3Bz
eXMuY29tPg0KPj4gLS0tDQo+PiAgQ2hhbmdlcyBpbiB2MjoNCj4+ICAtIE5vbmUNCj4+DQo+PiAg
ZHJpdmVycy91c2IvY29yZS9odWIuYyB8IDEwICsrKysrKystLS0NCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9jb3JlL2h1Yi5jIGIvZHJpdmVycy91c2IvY29yZS9odWIuYw0KPj4gaW5kZXgg
ODIzNDcwNjA3ZDU4Li42ZGM0ZTczODVlNzUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9j
b3JlL2h1Yi5jDQo+PiArKysgYi9kcml2ZXJzL3VzYi9jb3JlL2h1Yi5jDQo+PiBAQCAtNDgzMCw5
ICs0ODMwLDEzIEBAIGh1Yl9wb3J0X2luaXQoc3RydWN0IHVzYl9odWIgKmh1Yiwgc3RydWN0IHVz
Yl9kZXZpY2UgKnVkZXYsIGludCBwb3J0MSwNCj4+ICAJCQkJCQkiJXMgU3VwZXJTcGVlZCVzJXMg
VVNCIGRldmljZSBudW1iZXIgJWQgdXNpbmcgJXNcbiIsDQo+PiAgCQkJCQkJKHVkZXYtPmNvbmZp
ZykgPyAicmVzZXQiIDogIm5ldyIsDQo+PiAgCQkJCQkgKHVkZXYtPnNwZWVkID09IFVTQl9TUEVF
RF9TVVBFUl9QTFVTKSA/DQo+PiAtCQkJCQkJCSJQbHVzIEdlbiAyIiA6ICIgR2VuIDEiLA0KPj4g
LQkJCQkJICh1ZGV2LT5yeF9sYW5lcyA9PSAyICYmIHVkZXYtPnR4X2xhbmVzID09IDIpID8NCj4+
IC0JCQkJCQkJIngyIiA6ICIiLA0KPj4gKwkJCQkJCQkiIFBsdXMiIDogIiIsDQo+PiArCQkJCQkg
KHVkZXYtPnNzcF9yYXRlID09IFVTQl9TU1BfR0VOXzJ4MikgPw0KPj4gKwkJCQkJCQkiIGdlbjJ4
MiIgOg0KPj4gKwkJCQkJICh1ZGV2LT5zc3BfcmF0ZSA9PSBVU0JfU1NQX0dFTl8yeDEpID8NCj4+
ICsJCQkJCQkJIiBnZW4yeDEiIDoNCj4+ICsJCQkJCSAodWRldi0+c3NwX3JhdGUgPT0gVVNCX1NT
UF9HRU5fMXgyKSA/DQo+PiArCQkJCQkJCSIgZ2VuMXgyIiA6ICIiLA0KPiBNaW5vciBuaXQ6DQo+
IFNob3VsZCB3ZSBrZWVwIHRoZSAiR2VuIFh4WSIgZm9ybWF0IHVzZWQgaW4gc3BlYyBhbmQgZHJp
dmVyLCBpbnN0ZWFkIG9mIHRoaXMgImdlblh4WSINCj4NCg0KT2suIEkndmUgbWFkZSB0aGUgZml4
Lg0KDQpUaGFua3MsDQpUaGluaA0K
