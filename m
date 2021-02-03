Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E3E30D0B8
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 02:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbhBCBVa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 20:21:30 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:58656 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229593AbhBCBV3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 20:21:29 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 37C17C00A1;
        Wed,  3 Feb 2021 01:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612315228; bh=59tZtBwo8akrvlI7qZhp6eFgavGoyg2Yk6iSXHI9VmA=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=CeenZmCDXkf48r1C5UwvdMtqbcX3EuVo2F4CdS+Mqi+9RZrFzqpM+rl5s6524jG7a
         yNydRMwHqmrqRfAclSnGWC5VCfWioX6bSwmCkVrAS3RiBwtRbgoSImdvdz+jAC9yKe
         n/AsBPPLwK9ME6tUBC5FmOZFiCNUFoLAEnjYi8SKyDAF9rLOJjxfjVbvdZH5FhL2Ts
         c2Qry7ZFO1ve9FU2QdxAiItbJrY83BZSz/mw9v3/ERMjsL2X7CUy/Ihos6dGVlsm3M
         mKJKY+PkMkNQcDzdSFFagbwLM151lwuO1DQM2DtDvsGLmNAoI2F9I8yB4RWMzTTbMn
         +FOvSfgj1IbXw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 879B1A006F;
        Wed,  3 Feb 2021 01:20:27 +0000 (UTC)
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (mail-bl2nam02lp2053.outbound.protection.outlook.com [104.47.38.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 68EA140135;
        Wed,  3 Feb 2021 01:20:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="WUcwtMnG";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oD5sbrg02tMkTyDT22PH5p2FyeUs85Flu/Lcfyocncjd7WTO9PluRObWQZQd6CAAzUwdSzoQVTFyJbqKkSkx40BxgIM8maIj1MrDgVfJ2uXNpJEsEhIOWQLs48QVzgqypuyeXMbXusGjCopEqTvNWxV0sD7r6XQYXoGOb0NObWG57kHK/WMQiUAXGivRY77PSO6M/ntZ+VnGwr/VHjQb9KAGi2xhCp7/RiLUDP6jzkiZEPCnBBDrEki4e4fHtxehjV0vhzlobWEEE9hWR7cynew/1DDDomhnneu2Y5we37WxdCRNpChTtDxSoT4ZK2i9oTPwingunKov+7r2c8cqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59tZtBwo8akrvlI7qZhp6eFgavGoyg2Yk6iSXHI9VmA=;
 b=NSuwLVnWKE751e4artoXSTUTPq5wILbOV6+EVvkbmv3cahoanAF3oEERyFrzLjgcC+LT6jrGVTmq32r6QbxmPZa9PFqOpoFQJNPoDYOlEdnRGc54sLkQZR/amzm0Dd3QmOTR2b+oyGrsvVLTKpGEd0e1c35dWGzVtSiLKN6SV1toMonRLT7MIv4VtWS3MC63Y4SA8vZUgsQdR+ZtooLv+4XjON2bqR3SKW25r5fGn5Y2/PT0l/10UH5h/z8RxdUYZ/Jq4BJ68Wf/bmAV/sL1WZ+LAgMxr4frKHW0RfTGUCN1+/8wQxh94jnUBhIX+OmDlf56Cor9lfpuZ+VR/y02KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59tZtBwo8akrvlI7qZhp6eFgavGoyg2Yk6iSXHI9VmA=;
 b=WUcwtMnGg+abzBSeglrwt0IDQ7ng+Dcf4cttUdTHGvvdwwbpXP7QxbXAgvZxNF/t31by/NF566aAxXkDdJ0ESv5l72ziBBn6uDaFg9TaEl8duK7izaqDoSzCaidhOvq5hvYNOs96bSE821N7e9tzRgQduv1HT8Na2OlVKse+/us=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB2949.namprd12.prod.outlook.com (2603:10b6:a03:12f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 3 Feb
 2021 01:20:06 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3805.026; Wed, 3 Feb 2021
 01:20:05 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [RFC PATCH 7/8] usb: xhci: Rewrite xhci_create_usb3_bos_desc()
Thread-Topic: [RFC PATCH 7/8] usb: xhci: Rewrite xhci_create_usb3_bos_desc()
Thread-Index: AQHW+RWBGXw8QyUvvUGjyzqMe3lRdKpEyycAgADYFYA=
Date:   Wed, 3 Feb 2021 01:20:05 +0000
Message-ID: <3c279530-a96f-d449-eea2-e150dde91da9@synopsys.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
 <f242d50158030eaa93235c54f29d14290b04f71e.1612237179.git.Thinh.Nguyen@synopsys.com>
 <9ba42025-ebe4-db16-17d7-ff3782629a5c@linux.intel.com>
In-Reply-To: <9ba42025-ebe4-db16-17d7-ff3782629a5c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc6e0e2d-6065-4234-a919-08d8c7e1d6e7
x-ms-traffictypediagnostic: BYAPR12MB2949:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2949E764EDA202905ED69FCAAAB49@BYAPR12MB2949.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KvKmSn62Q7KzUTynaqfxZRkDHBnszfnibqh45j9Q5bRZBOSsyja2ci4yFo4A8A2ehvMxU+6TbmAjrMgj56Q9Rqxzhbe8Jhys8jwTQxpxsK/5Hbph8aaF8dM8dAgwrvS5ICPieoIZMLRvzFF1NjzPw+Mr7MIJSxSnEILLZcUQsj6Jp8Ar9e53fZWoxohXcHJVTXjcJ22+MEWsQHgzZGoRDjs2sNEcsT5dyeFArWwiDEYVA8/9Sh1UTImC7WfWJaUfZceVaScMjYq4f7voYrqz0cq8hw12EEGeBXMhUVkjgUZ185rgI4ueDRTPONcbbx63wDsi1y+S95hWxJs7HDPbHbUCsmSn0L3DIeM7/GYqzBI/D1NkKKSp2cOgqVkovJd+j7Bm5JIBLzLaj6TC7M1AFgvOYiHkazQdJDQhSU6MZZbUSPMiHzuqI0fscIr49MpSIijZar5JAt0dk7UX6GSJQk/NK5HO/jOdsq8lGfuV0Lg3sEBv4p4EXy50E9DC6+fqyfmKMutVXKk4qX3mWlGsonTbjixFyb6qQ7693pmQ89IOi2ZYeqj/7evz0lRkDTcR9uE568j8gvg9cU3uRyrR0ZF4GrZOSKDdp64K6bStTjM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(136003)(346002)(396003)(39860400002)(478600001)(83380400001)(66446008)(36756003)(66946007)(6486002)(2906002)(86362001)(8936002)(6506007)(31696002)(66556008)(316002)(66574015)(6512007)(31686004)(8676002)(110136005)(71200400001)(76116006)(5660300002)(26005)(66476007)(64756008)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?S3JReTNST013Y3RFdndXYm9tVzR6VDg1UmIwTG9pWlRJTzIyNGowdVNrT1FM?=
 =?utf-8?B?bk1sOGFXT1IxdEcrTzlQeWh6U1BuMXpnc0dNeWVBaitVUkdDNVpGaG8yVkJK?=
 =?utf-8?B?MHAyd0RlN1VoYnF1VU8wUDI4b3cvMEhPb3FFT1dkdlBTMm5HSTBVUGdPMnVT?=
 =?utf-8?B?QXNIVnlkVWR4OXVTVm0rT2JUL1pjLy9MN3QwUWJWbDBJRFNQZ3VvNzBaMHZm?=
 =?utf-8?B?VjByejdSUk8wT3pSODNLTW1aREd2MWM3Z2JGa0RnNGFmL2E3aGxMQWU4UHov?=
 =?utf-8?B?NnFQbVJIN2ZvVS9lM016TG10WnQ1WFpydk14Qk9uKzN5Q3U3Tm43K0xTNS8z?=
 =?utf-8?B?U2ZiRDl3RndaeVk3SXpyY09MRFZQWkp6S1pUVUlUbVBnQStwZFFYVWYzUTY5?=
 =?utf-8?B?d1hORE52a1QxZk1lTi9ZNmJyaHlLL0RHemttYm4zbzJOSFhxcFYvSGdVbGc0?=
 =?utf-8?B?NWNpdkMzVnJlaUdzUDl6VHFNOVJpQUFubHovOEZTa2VnWXA0Sml3Wk4rZ3pC?=
 =?utf-8?B?Z2JXeEVoZmVsZHFBZmVnWldUaFpCOVdXbE5mMTZJWWc5Qm43ZzF2WFhBcmhN?=
 =?utf-8?B?dE8zMjNtTzBDekJYczNKcllDK3RScDJrdloxWU41czcrUXZSVmhyU3A4NW9O?=
 =?utf-8?B?STdzRWliNnA2bm85ZmhjSHVIeElqdHA3enFGWWFUdWZkZXgxL0NyNkIyWm45?=
 =?utf-8?B?c0pDOWFPQzFodGJ4OTd2eFVuSXpZYnZpZDdFeGF4RTBuaHN3OXIyYVgvcm1R?=
 =?utf-8?B?MVNmZ21vbHJicCtNOGptTnRvQW1jVkR0TXhaZnZKeXNpajZRYlFaSkw2NXhm?=
 =?utf-8?B?Z3BHemtWUkZTL3VvVHJXL0ppWm4wWkVmd0t0Z1p0Y2xJTVlvMk13bFM4L3M5?=
 =?utf-8?B?ZyszdE5EbFRmMDZuNHhxRVJhNW4yeGoraFZpMk9CM2tIYWx2MkFiSW11WjFR?=
 =?utf-8?B?WVZZTVlBRms4RVh1VDFuQkVScjlDRWJCdUdXQ2RNdmg0MUR4aFRYVFV4L1dV?=
 =?utf-8?B?clA2L2piVjZMSHlSdXRveXdkeG9XZnNYckdSK2Q4NVBkYUIzNmZ5bXpTZ0h2?=
 =?utf-8?B?T0svbjh1a1pBMTB0VnViakRuclNSZlM5eTNmc0JFRHcxQ0IzQkFGaEZjblF4?=
 =?utf-8?B?MVBMc2lSZVlJdVloQ0JiKzc3TkFZN0dLNFZUNmg5Q3Rva1grSllValFqSWR6?=
 =?utf-8?B?MnhoRlJtdmdRemJrRFJHc2JqalMyTDAwd2I1UTY4d1ZDbk1NWTFCRVUzUnky?=
 =?utf-8?B?eEJWNDhOSklzWjVnQXN1K0lUN0JDUG5IOXZYT1p1OXFZb3F4Vm5EVVFOL0xC?=
 =?utf-8?B?aU9FQWQrSnB4SEpPSUlsRWl4UzRmWjJYR1R1b2hjZzNGYXN2dFE2ZytSTFZo?=
 =?utf-8?B?WVRwaGhGNUhKN0VqVE5XSFU4c3ZQM2NDYWpFZ3huN1ppeWp2WFRVRktxd0cw?=
 =?utf-8?Q?yDHDv6sw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDD92217B4BDBD40B9A933B666238132@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6e0e2d-6065-4234-a919-08d8c7e1d6e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 01:20:05.8551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UN7pjwdrkG8neMC/6XVxHnnpfIojDzZH2AZqZKap1vqnTisPWbKRIQtlzlS6wzm2xCOSYW20Bu8mclep2Qnk7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2949
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gSGkNCj4NCj4gT24gMi4yLjIwMjEgNS40MiwgVGhpbmgg
Tmd1eWVuIHdyb3RlOg0KPj4gVGhlIGN1cnJlbnQgeGhjaV9jcmVhdGVfdXNiM19ib3NfZGVzYygp
IHVzZXMgYSBzdGF0aWMgYm9zIHN0cnVjdHVyZSBhbmQNCj4+IHZhcmlvdXMgbWFnaWMgbnVtYmVy
cyBhbmQgb2Zmc2V0IG1ha2luZyBpdCBkaWZmaWN1bHQgdG8gZXh0ZW5kIHN1cHBvcnQNCj4+IGZv
ciBVU0IgMy4yLiBMZXQncyByZXdyaXRlIHRoaXMgZW50aXJlIGZ1bmN0aW9uIHRvIHN1cHBvcnQg
ZHVhbC1sYW5lIGluDQo+PiBVU0IgMy4yLg0KPiBBZ3JlZSwgaXQncyB0aW1lIHRvIGdldCByaWQg
b2YgdGhlIHN0YXRpYyB1OCBhcnJheSB1c2VkIGZvciBib3MuDQo+ICANCj4+IFRoZSBodWIgZHJp
dmVyIG1hdGNoZXMgdGhlIHBvcnQgc3BlZWQgSUQgZnJvbSB0aGUgZXh0ZW5kZWQgcG9ydCBzdGF0
dXMNCj4+IHRvIHRoZSBTU0lEIG9mIHRoZSBzdWJsaW5rIHNwZWVkIGF0dHJpYnV0ZXMgdG8gZGV0
ZWN0IGlmIHRoZSBkZXZpY2UNCj4+IHN1cHBvcnRzIFN1cGVyU3BlZWQgUGx1cy4gQ3VycmVudGx5
IHdlIGRvbid0IHByb3ZpZGUgdGhlIGRlZmF1bHQgZ2VuMXgyDQo+PiBhbmQgZ2VuMngyIHN1Ymxp
bmsgc3BlZWQgY2FwYWJpbGl0eSBkZXNjcmlwdG9yIGZvciBVU0IgMy4yIHJvb3RodWIuIFRoZQ0K
Pj4gVVNCIHN0YWNrIGRlcGVuZHMgb24gdGhpcyB0byBkZXRlY3QgYW5kIG1hdGNoIHRoZSBjb3Jy
ZWN0IHNwZWVkLg0KPj4gSW4gYWRkaXRpb24sIGlmIHRoZSB4SENJIGhvc3QgcHJvdmlkZXMgUHJv
dG9jb2wgU3BlZWQgSUQgKFBTSSkNCj4+IGNhcGFiaWxpdHksIHRoZW4gbWFrZSBzdXJlIHRvIGNv
bnZlcnQgUHJvdG9jb2wgU3BlZWQgSUQgTWFudGlzc2EgYW5kDQo+PiBFeHBvbmVudCAoUFNJTSAm
IFBTSUUpIHRvIGxhbmUgc3BlZWQgZm9yIGdlbjF4MiBhbmQgZ2VuMngyLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4+IC0t
LQ0KPj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYyB8IDI3OSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjc3IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3Qv
eGhjaS1odWIuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYw0KPj4gaW5kZXggNzRjNDk3
ZmQzNDc2Li5jMDk1YzMwMjEyZTUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3ho
Y2ktaHViLmMNCj4+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYw0KPj4gQEAgLTEx
LDYgKzExLDcgQEANCj4+ICANCj4+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPj4gICNpbmNs
dWRlIDxhc20vdW5hbGlnbmVkLmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+DQo+
PiAgDQo+PiAgI2luY2x1ZGUgInhoY2kuY2giDQo+PiAgI2luY2x1ZGUgInhoY2ktdHJhY2UuaCIN
Cj4+IEBAIC01Miw3ICs1MywyODEgQEAgc3RhdGljIHU4IHVzYl9ib3NfZGVzY3JpcHRvciBbXSA9
IHsNCj4+ICAJMHhiNSwgMHg0MCwgMHgwYSwgMHgwMCwJCS8qIDEwR2JwcywgU1NQLCBzeW1tZXRy
aWMsIHR4LCBJRCA9IDUgKi8NCj4+ICB9Ow0KPj4gIA0KPj4gLXN0YXRpYyBpbnQgeGhjaV9jcmVh
dGVfdXNiM19ib3NfZGVzYyhzdHJ1Y3QgeGhjaV9oY2QgKnhoY2ksIGNoYXIgKmJ1ZiwNCj4+ICtz
dGF0aWMgaW50IHhoY2lfZmlsbF9kZWZhdWx0X3NzcF9hdHRyKHN0cnVjdCB4aGNpX2hjZCAqeGhj
aSwNCj4+ICsJCXN0cnVjdCB1c2Jfc3NwX2NhcF9kZXNjcmlwdG9yICpzc3BfY2FwKQ0KPj4gK3sN
Cj4+ICsJdTMyIGF0dHI7DQo+PiArCXU4IHNzYWM7DQo+PiArCWludCBpOw0KPj4gKw0KPj4gKwlh
dHRyID0gbGUzMl90b19jcHUoc3NwX2NhcC0+Ym1BdHRyaWJ1dGVzKTsNCj4+ICsJc3NhYyA9IEZJ
RUxEX0dFVChVU0JfU1NQX1NVQkxJTktfU1BFRURfQVRUUklCUywgYXR0cik7DQo+PiArDQo+PiAr
CS8qIEN1cnJlbnRseSB3ZSBvbmx5IHN1cHBvcnQgVVNCIDMuMSBhbmQgMy4yICovDQo+PiArCWlm
IChzc2FjICE9IDMgJiYgc3NhYyAhPSA3KQ0KPj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+PiArDQo+
PiArCS8qDQo+PiArCSAqIE1hcCBkZWZhdWx0IHhIQ0kgcG9ydCBzcGVlZCBJRCB0byBTU0lEOg0K
Pj4gKwkgKiAgU1NJRCA0ID0gU3ltbWV0cmljIFNTUCBHZW4xeDENCj4+ICsJICogIFNTSUQgNSA9
IFN5bW1ldHJpYyBTU1AgR2VuMngxDQo+PiArCSAqICBTU0lEIDYgPSBTeW1tZXRyaWMgU1NQIEdl
bjF4Mg0KPj4gKwkgKiAgU1NJRCA3ID0gU3ltbWV0cmljIFNTUCBHZW4yeDINCj4+ICsJICovDQo+
PiArCWZvciAoaSA9IDA7IGkgPCBzc2FjICsgMTsgaSsrKSB7DQo+PiArCQl1OCBzc2lkOw0KPj4g
KwkJdTggdHlwZTsNCj4+ICsJCXU4IGxwOw0KPj4gKwkJdTE2IG1hbnRpc3NhOw0KPj4gKw0KPj4g
KwkJc3NpZCA9IChpID4+IDEpICsgNDsNCj4+ICsNCj4+ICsJCWlmIChzc2lkID4gNCkNCj4+ICsJ
CQlscCA9IFVTQl9TU1BfU1VCTElOS19TUEVFRF9MUF9TU1A7DQo+PiArCQllbHNlDQo+PiArCQkJ
bHAgPSBVU0JfU1NQX1NVQkxJTktfU1BFRURfTFBfU1M7DQo+PiArDQo+PiArCQlpZiAoc3NpZCA9
PSA1IHx8IHNzaWQgPT0gNykNCj4+ICsJCQltYW50aXNzYSA9IDEwOw0KPj4gKwkJZWxzZQ0KPj4g
KwkJCW1hbnRpc3NhID0gNTsNCj4+ICsNCj4+ICsJCWlmIChpICUgMikNCj4+ICsJCQl0eXBlID0g
VVNCX1NTUF9TVUJMSU5LX1NQRUVEX1NUX1NZTV9UWDsNCj4+ICsJCWVsc2UNCj4+ICsJCQl0eXBl
ID0gVVNCX1NTUF9TVUJMSU5LX1NQRUVEX1NUX1NZTV9SWDsNCj4+ICsNCj4+ICsJCXNzcF9jYXAt
PmJtU3VibGlua1NwZWVkQXR0cltpXSA9DQo+PiArCQkJY3B1X3RvX2xlMzIoRklFTERfUFJFUChV
U0JfU1NQX1NVQkxJTktfU1BFRURfU1NJRCwNCj4+ICsJCQkJCSAgICAgICBzc2lkKSB8DQo+PiAr
CQkJCSAgICBGSUVMRF9QUkVQKFVTQl9TU1BfU1VCTElOS19TUEVFRF9MU0UsDQo+PiArCQkJCQkg
ICAgICAgVVNCX1NTUF9TVUJMSU5LX1NQRUVEX0xTRV9HQlBTKSB8DQo+PiArCQkJCSAgICBGSUVM
RF9QUkVQKFVTQl9TU1BfU1VCTElOS19TUEVFRF9TVCwgdHlwZSkgfA0KPj4gKwkJCQkgICAgRklF
TERfUFJFUChVU0JfU1NQX1NVQkxJTktfU1BFRURfTFAsIGxwKSB8DQo+PiArCQkJCSAgICBGSUVM
RF9QUkVQKFVTQl9TU1BfU1VCTElOS19TUEVFRF9MU00sDQo+PiArCQkJCQkgICAgICAgbWFudGlz
c2EpKTsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+IEkgZG9uJ3QgdGhp
bmsgaXQgbWFrZXMgc2Vuc2UgdG8gZ2VuZXJhdGVzIHRoZSBkZWZhdWx0IHN1YmxpbmtTcGVlZEF0
dHJbXSBlbnRyaWVzIGxpa2UNCj4gdGhlIGZ1bmN0aW9uIGFib3ZlIGRvZXMuDQo+IFRoZSBjb250
ZW50IGlzIHN0YXRpYyBhbmQgZGVmaW5lZCBpbiB4aGNpIHNwZWMuDQo+IEZvciB0aGVzZSBJJ2Qg
anVzdCBtYWtlIGEgc3RhdGljIHUzMiBhcnJheS4gKG1pbmRpbmcgZW5kaWFubmVzcykNCj4NCj4g
c3RhdGljIHUzMiBzc3BfY2FwX2RlZmF1bHRfc3NhW10gPSB7DQo+IAkweGFhYWFhYWFhLCAvKiBV
U0IgMy4wIFNTIDVHYnBzIElkOjQsIHJ4ICovIA0KPiAJMHhiYmJiYmJiYiwgLyogVVNCIDMuMCBT
UyA1R2JwcyBJZDo0LCB0eCAqLyANCj4gCTB4Y2NjY2NjY2MsIC8qIFVTQiAzLjEgU1NQIDEwR2Jw
cyBJZDo1ICByeCAqLyANCj4gCTB4ZGRkZGRkZGQsIC8qIFVTQiAzLjEgU1NQIDEwR2JwcyBJZDo1
LCB0eCAqLyANCj4gCTB4ZWVlZWVlZWUsIC8qIFVTQiAzLjIgR2VuMXgyIDEwR2JwcyBJZDo2LCBy
eCAqLyANCj4gCS4uLg0KPiB9DQo+DQo+IFRoZW4gd2hlbiBjcmVhdGluZyB0aGUgc3NwIGNhcCBk
ZXNjcmlwdG9yIHNldCB0aGUgYXR0cmlidXRlIGNvdW50IChzc2FjKSBiYXNlZCBvbg0KPiBiY2RV
U0IgYXMgeW91IGRvLCBhbmQgYXNzaWduIHRoZSBkZWZhdWx0IHZhbHVlcyBpZiBjdXN0b20gb25l
cyBhcmVuJ3QgZ2l2ZW4gKCFwc2lfY291bnQpLg0KPg0KPiBmb3IgKGkgPSAwOyBpIDwgc3NhYyAr
IDE7IGkrKykNCj4gCXNzcF9jYXAtPm1iU3VibGlua1NwZWVkQXR0cltpXSA9IHNzcF9jYXBkZWZh
dWx0X3NzYVtpXTsgDQoNClRoYXQgbG9va3MgZ29vZC4gSSdsbCByZXZpc2UgaXQuDQoNCj4+ICsN
Cj4+ICtzdGF0aWMgaW50IHhoY2lfY3JlYXRlX3VzYjN4X2Jvc19kZXNjKHN0cnVjdCB4aGNpX2hj
ZCAqeGhjaSwgY2hhciAqYnVmLA0KPj4gKwkJCQkgICAgICB1MTYgd0xlbmd0aCkNCj4+ICt7DQo+
PiArCXN0cnVjdCB1c2JfYm9zX2Rlc2NyaXB0b3IJKmJvczsNCj4+ICsJc3RydWN0IHVzYl9zc19j
YXBfZGVzY3JpcHRvcgkqc3NfY2FwOw0KPj4gKwlzdHJ1Y3QgdXNiX3NzcF9jYXBfZGVzY3JpcHRv
cgkqc3NwX2NhcDsNCj4+ICsJc3RydWN0IHhoY2lfcG9ydF9jYXAJCSpwb3J0X2NhcCA9IE5VTEw7
DQo+PiArCXUxNgkJCQliY2RVU0I7DQo+PiArCXUzMgkJCQlyZWc7DQo+PiArCXUzMgkJCQltaW5f
cmF0ZSA9IDA7DQo+PiArCXU4CQkJCW1pbl9zc2lkOw0KPj4gKwl1OAkJCQlzc2FjOw0KPj4gKwl1
OAkJCQlzc2ljOw0KPj4gKwlpbnQJCQkJb2Zmc2V0Ow0KPj4gKwlpbnQJCQkJaTsNCj4+ICsNCj4+
ICsJLyogQk9TIGRlc2NyaXB0b3IgKi8NCj4+ICsJYm9zID0gKHN0cnVjdCB1c2JfYm9zX2Rlc2Ny
aXB0b3IgKilidWY7DQo+PiArCWJvcy0+Ykxlbmd0aCA9IFVTQl9EVF9CT1NfU0laRTsNCj4+ICsJ
Ym9zLT5iRGVzY3JpcHRvclR5cGUgPSBVU0JfRFRfQk9TOw0KPj4gKwlib3MtPndUb3RhbExlbmd0
aCA9IGNwdV90b19sZTE2KFVTQl9EVF9CT1NfU0laRSArDQo+PiArCQkJCQlVU0JfRFRfVVNCX1NT
X0NBUF9TSVpFKTsNCj4+ICsJYm9zLT5iTnVtRGV2aWNlQ2FwcyA9IDE7DQo+IFRoaXMgaXMgbXVj
aCBiZXR0ZXIgdGhhbiB0aGUgY3VycmVudCB3YXkgd2UgZmlsbCB0aGUgZGVzY3JpcHRvciwgbXVj
aCBtb3JlIHJlYWRhYmxlLg0KPg0KPj4gKw0KPj4gKwkvKiBDcmVhdGUgdGhlIGRlc2NyaXB0b3Ig
Zm9yIHBvcnQgd2l0aCB0aGUgaGlnaGVzdCByZXZpc2lvbiAqLw0KPj4gKwlmb3IgKGkgPSAwOyBp
IDwgeGhjaS0+bnVtX3BvcnRfY2FwczsgaSsrKSB7DQo+PiArCQl1OCBtYWpvciA9IHhoY2ktPnBv
cnRfY2Fwc1tpXS5tYWpfcmV2Ow0KPj4gKwkJdTggbWlub3IgPSB4aGNpLT5wb3J0X2NhcHNbaV0u
bWluX3JldjsNCj4+ICsJCXUxNiByZXYgPSAobWFqb3IgPDwgOCkgfCBtaW5vcjsNCj4+ICsNCj4+
ICsJCWlmIChpID09IDAgfHwgYmNkVVNCIDwgcmV2KSB7DQo+PiArCQkJYmNkVVNCID0gcmV2Ow0K
Pj4gKwkJCXBvcnRfY2FwID0gJnhoY2ktPnBvcnRfY2Fwc1tpXTsNCj4+ICsJCX0NCj4+ICsJfQ0K
Pj4gKw0KPj4gKwlpZiAoYmNkVVNCID49IDB4MDMxMCkgew0KPj4gKwkJLyogVHdvIFNTQSBlbnRy
aWVzIGZvciBlYWNoIHVuaXF1ZSBQU0kgSUQsIFJYIGFuZCBUWCAqLw0KPj4gKwkJaWYgKHBvcnRf
Y2FwLT5wc2lfY291bnQpDQo+PiArCQkJc3NhYyA9IHBvcnRfY2FwLT5wc2lfdWlkX2NvdW50ICog
MiAtIDE7DQo+PiArCQllbHNlIGlmIChiY2RVU0IgPT0gMHgwMzIwKQ0KPiBtYXliZSAoYmNkVVNC
ID49IDB4MzIwKSwgYWxsb3dzIG9sZCBkcml2ZXIgdG8gaGFuZGxlIGZ1dHVyZSBoYXJkd2FyZS4N
Cg0KT2suDQoNCj4NCj4+ICsJCQlzc2FjID0gNzsNCj4+ICsJCWVsc2UNCj4+ICsJCQlzc2FjID0g
MzsNCj4+ICsNCj4+ICsJCWlmIChwb3J0X2NhcC0+cHNpX2NvdW50KQ0KPj4gKwkJCXNzaWMgPSBw
b3J0X2NhcC0+cHNpX2NvdW50IC0gMTsNCj4+ICsJCWVsc2UNCj4+ICsJCQlzc2ljID0gKHNzYWMg
KyAxKSAvIDIgLSAxOw0KPj4gKw0KPj4gKwkJYm9zLT5iTnVtRGV2aWNlQ2FwcysrOw0KPj4gKwkJ
Ym9zLT53VG90YWxMZW5ndGggPSBjcHVfdG9fbGUxNihVU0JfRFRfQk9TX1NJWkUgKw0KPj4gKwkJ
CQkJCVVTQl9EVF9VU0JfU1NfQ0FQX1NJWkUgKw0KPj4gKwkJCQkJCVVTQl9EVF9VU0JfU1NQX0NB
UF9TSVpFKHNzYWMpKTsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlpZiAod0xlbmd0aCA8IFVTQl9EVF9C
T1NfU0laRSArIFVTQl9EVF9VU0JfU1NfQ0FQX1NJWkUpDQo+PiArCQlyZXR1cm4gd0xlbmd0aDsN
Cj4+ICsNCj4+ICsJLyogU3VwZXJTcGVlZCBVU0IgRGV2aWNlIENhcGFiaWxpdHkgKi8NCj4+ICsJ
c3NfY2FwID0gKHN0cnVjdCB1c2Jfc3NfY2FwX2Rlc2NyaXB0b3IgKikmYnVmW1VTQl9EVF9CT1Nf
U0laRV07DQo+PiArCXNzX2NhcC0+Ykxlbmd0aCA9IFVTQl9EVF9VU0JfU1NfQ0FQX1NJWkU7DQo+
PiArCXNzX2NhcC0+YkRlc2NyaXB0b3JUeXBlID0gVVNCX0RUX0RFVklDRV9DQVBBQklMSVRZOw0K
Pj4gKwlzc19jYXAtPmJEZXZDYXBhYmlsaXR5VHlwZSA9IFVTQl9TU19DQVBfVFlQRTsNCj4+ICsJ
c3NfY2FwLT5ibUF0dHJpYnV0ZXMgPSAwOyAvKiBzZXQgbGF0ZXIgKi8NCj4+ICsJc3NfY2FwLT53
U3BlZWRTdXBwb3J0ZWQgPSBjcHVfdG9fbGUxNihVU0JfNUdCUFNfT1BFUkFUSU9OKTsNCj4+ICsJ
c3NfY2FwLT5iRnVuY3Rpb25hbGl0eVN1cHBvcnQgPSBVU0JfTE9XX1NQRUVEX09QRVJBVElPTjsN
Cj4+ICsJc3NfY2FwLT5iVTFkZXZFeGl0TGF0ID0gMDsgLyogc2V0IGxhdGVyICovDQo+PiArCXNz
X2NhcC0+YlUyRGV2RXhpdExhdCA9IDA7IC8qIHNldCBsYXRlciAqLw0KPj4gKw0KPj4gKwlyZWcg
PSByZWFkbCgmeGhjaS0+Y2FwX3JlZ3MtPmhjY19wYXJhbXMpOw0KPj4gKwlpZiAoSENDX0xUQyhy
ZWcpKQ0KPj4gKwkJc3NfY2FwLT5ibUF0dHJpYnV0ZXMgfD0gVVNCX0xUTV9TVVBQT1JUOw0KPj4g
Kw0KPj4gKwlpZiAoKHhoY2ktPnF1aXJrcyAmIFhIQ0lfTFBNX1NVUFBPUlQpKSB7DQo+PiArCQly
ZWcgPSByZWFkbCgmeGhjaS0+Y2FwX3JlZ3MtPmhjc19wYXJhbXMzKTsNCj4+ICsJCXNzX2NhcC0+
YlUxZGV2RXhpdExhdCA9IEhDU19VMV9MQVRFTkNZKHJlZyk7DQo+PiArCQlzc19jYXAtPmJVMkRl
dkV4aXRMYXQgPSBjcHVfdG9fbGUxNihIQ1NfVTJfTEFURU5DWShyZWcpKTsNCj4+ICsJfQ0KPj4g
Kw0KPj4gKwlpZiAod0xlbmd0aCA8IGxlMTZfdG9fY3B1KGJvcy0+d1RvdGFsTGVuZ3RoKSkNCj4+
ICsJCXJldHVybiB3TGVuZ3RoOw0KPj4gKw0KPj4gKwlpZiAoYmNkVVNCIDwgMHgwMzEwKQ0KPj4g
KwkJcmV0dXJuIGxlMTZfdG9fY3B1KGJvcy0+d1RvdGFsTGVuZ3RoKTsNCj4+ICsNCj4+ICsJc3Nw
X2NhcCA9IChzdHJ1Y3QgdXNiX3NzcF9jYXBfZGVzY3JpcHRvciAqKSZidWZbVVNCX0RUX0JPU19T
SVpFICsNCj4+ICsJCVVTQl9EVF9VU0JfU1NfQ0FQX1NJWkVdOw0KPj4gKwlzc3BfY2FwLT5iTGVu
Z3RoID0gVVNCX0RUX1VTQl9TU1BfQ0FQX1NJWkUoc3NhYyk7DQo+PiArCXNzcF9jYXAtPmJEZXNj
cmlwdG9yVHlwZSA9IFVTQl9EVF9ERVZJQ0VfQ0FQQUJJTElUWTsNCj4+ICsJc3NwX2NhcC0+YkRl
dkNhcGFiaWxpdHlUeXBlID0gVVNCX1NTUF9DQVBfVFlQRTsNCj4+ICsJc3NwX2NhcC0+YlJlc2Vy
dmVkID0gMDsNCj4+ICsJc3NwX2NhcC0+d1Jlc2VydmVkID0gMDsNCj4+ICsJc3NwX2NhcC0+Ym1B
dHRyaWJ1dGVzID0NCj4+ICsJCWNwdV90b19sZTMyKEZJRUxEX1BSRVAoVVNCX1NTUF9TVUJMSU5L
X1NQRUVEX0FUVFJJQlMsIHNzYWMpIHwNCj4+ICsJCQkgICAgRklFTERfUFJFUChVU0JfU1NQX1NV
QkxJTktfU1BFRURfSURTLCBzc2ljKSk7DQo+PiArDQo+PiArCWlmICghcG9ydF9jYXAtPnBzaV9j
b3VudCkgew0KPiBmb3IgKGkgPSAwOyBpIDwgc3NhYyArIDE7IGkrKykNCj4gCXNzcF9jYXAtPm1i
U3VibGlua1NwZWVkQXR0cltpXSA9IHNzcF9jYXBfZGVmYXVsdF9zc2FbaV07ICAvL21pbmQgZW5k
aWFubmVzcw0KPg0KPj4gKwkJaW50IHJldDsNCj4+ICsNCj4+ICsJCXJldCA9IHhoY2lfZmlsbF9k
ZWZhdWx0X3NzcF9hdHRyKHhoY2ksIHNzcF9jYXApOw0KPj4gKwkJaWYgKHJldCkNCj4+ICsJCQly
ZXR1cm4gcmV0Ow0KPj4gKw0KPj4gKwkJbWluX3NzaWQgPSA0Ow0KPj4gKwkJZ290byBvdXQ7DQo+
PiArCX0NCj4+ICsNCj4+ICsJb2Zmc2V0ID0gMDsNCj4+ICsJZm9yIChpID0gMDsgaSA8IHBvcnRf
Y2FwLT5wc2lfY291bnQ7IGkrKykgew0KPiBJIG5lZWQgdG8gdGFrZSBhIGJldHRlciBsb29rIGF0
IHRoaXMgc3VibGlua1NwZWVkQXR0cltdIGNyZWF0aW9uIGZyb20gY3VzdG9tIFBTSUMgdGFibGUg
YSBiaXQgbGF0ZXIuDQo+DQo+IFRoYW5rcw0KPiAtTWF0aGlhcw0KDQpUaGFua3MgZm9yIHRoZSBy
ZXZpZXchDQoNClRoaW5oDQo=
