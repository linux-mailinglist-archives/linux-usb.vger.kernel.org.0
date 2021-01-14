Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7AFE2F6A49
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 20:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbhANS7b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jan 2021 13:59:31 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:40524 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725883AbhANS7a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Jan 2021 13:59:30 -0500
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 05F93C0008;
        Thu, 14 Jan 2021 18:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610650709; bh=K/ow3yCQcuzVnJYaCsv8UCvNre8gWT6eKQw2CrTy1dY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Wcj53PryxdjJzM4ILCm0ikWCLU7Hb2JTfKfXA255kYUOT3ykR8riFMFwX7LIStPon
         WLqXiLFvIyiqm7aZN8TZbpy1eRanwBAShQH2R9d1SELD3Hp+k8CMTmj0bJpMePdPQp
         86o26jpMn3t9Yu+hFvLt2J0JTGncjcO+cHvn2EHGWShvZL36WukixWcvfJYYniv4yL
         Gmq2AhYa9WmAB6HCI3tYYVc2HlYMuHq7di9NXJ/yM4DQlMLnlxsZTAbe28zmhVj/SX
         hr6gK6YTgb9v5G+xIcFXzmqvUzYrMbcXXvKzzN19Ud/yXF8EOmQ5dBXnKadF8yHeQ/
         duEN9oxYs+qew==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id EFAF6A005E;
        Thu, 14 Jan 2021 18:58:25 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1B27940095;
        Thu, 14 Jan 2021 18:58:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="NtAAbE7P";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sxi1p21bDP05HTXIbU4Jgt6nQUu/Z9GscOO/uBivil+8l4tW2059KmY0VEs7Fye8UaHYqJw66owdMSpHzQ58ly3guVy0FmQlGyk7XYoHx3UluoOfKg1NzwTQxQSipNjGImqHwoyhLVtKr1DLwazDkChy4plgLewMXbSZAHs/QyZte2pBRsQEb3zAkSup6fNxbtpEyglGpvumTTwXV9i27vljEe7jxUbv7TOyM2LgNDtHyz/fV8PQWSJzjljImHe/8Uy0JMJ7gHPKfPZ+gBLPSh+jVyMnzjHU3ZI+FUo/7J29q8XGP4fJw1FEuvhYrXsCNhi/PqqEmp67XHg5l2ibFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/ow3yCQcuzVnJYaCsv8UCvNre8gWT6eKQw2CrTy1dY=;
 b=KWWbyJdTnCUgtyHDn2yvWwIr+79SpUa0ijSRzsStmE3lD/HJ1UyAboDlJhcJPkz/sDr+p6k7n78eguhMJ89QiBt+urVFmiN3Jp4ht9MkRai4ROENOkDkgGSPuZVvP9xW3A/zuv1KhEvFZkhNcWN7eXgk2YK5azJ3vtumIeouq+QCFTAWnkPYsnLpvJ2lIcRSJj9J+WnEq+5KSdH8JAPRPZ2EhO3iEohgqZ5gXc4YwPpMlnb0ILgyFnTGWJMCD8QG7zr5AZijtMF1Nlg0E8e+Qlt8vp76YlyxaLgj7pyM10uj+BFpfAEoJemnG/qC4X9xU8oFRMmYBG0InzxYM2nVgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/ow3yCQcuzVnJYaCsv8UCvNre8gWT6eKQw2CrTy1dY=;
 b=NtAAbE7PjRfpUth/3rkaDjwTTQ6jjqP8783ni3JvzaHnuYtbBsNwSyhk3lE2Xch0VZF1x8LWlCdhvP33Cs0Mns9aTBeqofK6Hp+uaPMVphPg0z5KDXY4ti8BZvNODNxOa9P4mP0kHhv64TfE5Y08KqY0ra2uRcLll0J1Gw7LLU8=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB5014.namprd12.prod.outlook.com (2603:10b6:a03:1c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 14 Jan
 2021 18:58:20 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:58:19 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rob Gill <rrobgill@protonmail.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>, Bin Liu <b-liu@ti.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v6 01/11] usb: ch9: Add USB 3.2 SSP attributes
Thread-Topic: [PATCH v6 01/11] usb: ch9: Add USB 3.2 SSP attributes
Thread-Index: AQHW6iBZXkuqa3Etn0O3vPHvI+D9hqom43yAgACWtYA=
Date:   Thu, 14 Jan 2021 18:58:19 +0000
Message-ID: <c36b8a86-404f-0fc5-196f-d15e89f7b200@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
 <ae9293ebd63a29f2a2035054753534d9eb123d74.1610592135.git.Thinh.Nguyen@synopsys.com>
 <875z3z3km8.fsf@kernel.org>
In-Reply-To: <875z3z3km8.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a38c04b8-2584-4f5b-8ccf-08d8b8be5c03
x-ms-traffictypediagnostic: BY5PR12MB5014:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB50147922EEE721C1803BA03AAAA80@BY5PR12MB5014.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MWlQ/4iHVUcKG5sdh42XVvd6layYkpzw5ANp3OVsKuiJbxNwcElfyakfqeUG7ZhcqSl7pDamnjiFMIXwBamvutdh9IU6/ZK3j+AM+azElOluPra5ETg94OuFqvN6EV4ZH/igbZwGDpXT3IeHmmlocSUAbOC4wBIG7aSyzuVWa0S0KMRNBt0YuI69MF3nqoOGTUnkdh4RvjEtVY1n/dYR4qKIikEi7Q0DoWeHyZHzAANjmTWShcGYdiBNIJexPVBw2lj+YG0k6xpPfneykHu72I0QF8apjZrgA8SpYr7qdV2NEBi7r55TE/Sbm9aZ3fP449lyhwxWZfxE7HgNaEIgV+p80P7VnY68EiK2Wr1Wl0I32ewm7WILPEwqUX/69FkBIx1BShG+ldiUK+jedEi/VPBScOVrdYvtGuDpjOat1jLIFxlHxtIwreHaIPU5xs8V8c6D+Av0VoD7fHdACPU/q2tbCQ6/P/qXMHysh2Pee9344iaPBk8hzqtqJ1C7DoLI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(39860400002)(346002)(376002)(66946007)(2906002)(66556008)(66446008)(64756008)(66476007)(71200400001)(31686004)(26005)(76116006)(6506007)(186003)(36756003)(110136005)(921005)(316002)(478600001)(83380400001)(2616005)(8936002)(107886003)(5660300002)(6486002)(4326008)(6512007)(8676002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?cGgvYVYvK2czdG1CQlJCdytyTEFzcG50dEptZ3lmb3VhQjFCbUVGakROeFNu?=
 =?utf-8?B?Mi96Si9hUTRCNmRkditqaGt6UXNCUllLQlEvR3RIdVhFSzNnbWlqZXdPZzZH?=
 =?utf-8?B?bXdLZXllRVQ2RDJGMTlhV0ZLSEFEOExzL05OTThQcXlHWDlWaS93WTZ1cFE3?=
 =?utf-8?B?TGEwaVcraysvSzRTRmR6RFlLQkVKb1p0OE5WV2lwYWp6eWtldXVPdDd1azBJ?=
 =?utf-8?B?bmRDYXpXOGplVThVVE1CTzlQMFFZV29wN0UrVmRkQWJrRlRuMGNHbHlOQTFM?=
 =?utf-8?B?N0pBcFZuaWQrSCtlWTBuZUN5dTZwWGJhVVlOR3NuWDZjb1dSb3E4UGFVeEJn?=
 =?utf-8?B?dlBxOWFsbDk0b29qMVdvR3ZVK2xoeVNZTkhGdUZiWTdoRm1vKy9LTW53VzRB?=
 =?utf-8?B?ZFo4SnhuOWthTVpveFNUWkluSGJpMWxjdVhZSFgyYTdDNzRrc2lmdjY2bFhU?=
 =?utf-8?B?S1I3V1RaYVBLdGt2QzlpWFNGZ2tUV200TUFDb0o5OGhBZWVrem56U3lEVW01?=
 =?utf-8?B?YWhUWVhhNUE3S2N3d1ZWcW54dWM0V1dnRDZUdzFSZGNUWm9Gb0RlbGF4VlVU?=
 =?utf-8?B?WlFIU0ZpZld3WHlUTkc4YXhablg2dkx5aW5WOVF0TUU4OUlWWVZuZjduVkJq?=
 =?utf-8?B?UTFmU0Yvc2ErQXYwZmJPVXNWNGljNzArcC90SFQzeGhYRmVvTzhnSXEvS0Fy?=
 =?utf-8?B?bEVnV3RLUmFORTM0dTN5Vlg1bitoT0NZT2s3NGw3Skx0dkdUc0JVcXZiQy9V?=
 =?utf-8?B?dmtXd1p3YnBTdEp2QUxCUnljQUk0MnhvS1dYaUFrakp4MDAxTnlCZDc2bFVI?=
 =?utf-8?B?M3BzWCs5QmZ5RVhVU0YrUk9BY1hieFNZNWxHcmh4c1N1Y0FhZEFFc3ZLcjhN?=
 =?utf-8?B?WnhSUTJvMG15bG44RGRKWEoyVTNQM1FZT0V3R2FEYWZnc2h4cDVWLzBqc0px?=
 =?utf-8?B?RFFob21mejJMbkt1WCtmakNqMDducFF3bGt1WUt3RnpNTEdjMU96dml6ZXhE?=
 =?utf-8?B?WWpjZWwzWWgwWkdPbU9HOENDZW9oekNiaUJZY3lNNVh4YTZ6TC9ET3VGd1dV?=
 =?utf-8?B?eFh5RnVGTGFGNk5MZUlKMzA4VGl5blFBbHlVZnhkYzZzcC95UVNzYVRUVFQ4?=
 =?utf-8?B?anpUbHdlZ1hhZnFlcmJDcXl2eHZhTTJ3a2FFajQ2alRvcmk1ejV5QXZtcmdS?=
 =?utf-8?B?RVI4cEh6NWxYWGpxSFgwaU9pRHMvazNDSzVpMkJzZ3N4cVFnSUJ5QkF2MmhE?=
 =?utf-8?B?dDIzdUozdTh6d1Y4dXUxMGNjZmRWdXVieVdldjh0Yi9iOWtscTZiZU5HSUJk?=
 =?utf-8?Q?tj1XmDFt8VQ7U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF67EC9DE0EF3846BF18E56341B1184B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a38c04b8-2584-4f5b-8ccf-08d8b8be5c03
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 18:58:19.9129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i1fUqmBFS5KCVuvFKVwU3cdgWzkFJqCCTE3F8w1vMgCSD0Zs5XK3Q1cNAKxhZhvpU0efQkm8yj7zT6xh2WaGFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5014
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVsaXBlIEJhbGJpIHdyb3RlOg0KPiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5
cy5jb20+IHdyaXRlczoNCj4NCj4+IEluIHByZXBhcmF0aW9uIGZvciBVU0IgMy4yIGR1YWwtbGFu
ZSBzdXBwb3J0LCBhZGQgc3VibGluayBzcGVlZA0KPj4gYXR0cmlidXRlIG1hY3JvcyBhbmQgZW51
bSB1c2Jfc3NwX3JhdGUuIEEgVVNCIGRldmljZSB0aGF0IG9wZXJhdGVzIGluDQo+PiBTdXBlclNw
ZWVkIFBsdXMgbWF5IG9wZXJhdGUgYXQgZGlmZmVyZW50IHNwZWVkIGFuZCBsYW5lIGNvdW50LiBU
aGVzZQ0KPj4gYWRkaXRpb25hbCBtYWNyb3MgYW5kIGVudW0gdmFsdWVzIGhlbHAgc3BlY2lmeWlu
ZyB0aGF0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVu
QHN5bm9wc3lzLmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2NjoNCj4+IC0gUmViYXNlIG9u
IEdyZWcncyB1c2ItdGVzdGluZyBicmFuY2gNCj4+IC0gQ29udmVydCB0aGUgc3VibGluayBzcGVl
ZCBhdHRyaWJ1dGUgZW51bSB0byBtYWNyb3MgYW5kIG1vdmUgaXQgdG8gdWFwaQ0KPj4gLSBSZW1v
dmUgdXNiX3N1Ymxpbmtfc3BlZWQgc3RydWN0DQo+PiAtIFRvIHNpbXBsaWZ5IHRoaW5ncywgdXNl
IHVzYl9zc3BfcmF0ZSBlbnVtIHRvIHNwZWNpZnkgdGhlIHNpZ25hbGluZyByYXRlDQo+PiAgIGdl
bmVyYXRpb24gYW5kIGxhbmUgY291bnQNCj4+IC0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlDQo+PiBD
aGFuZ2VzIGluIHY1Og0KPj4gLSBSZWJhc2Ugb24gRmVsaXBlJ3MgdGVzdGluZy9uZXh0IGJyYW5j
aA0KPj4gLSBDaGFuZ2VkIFNpZ25lZC1vZmYtYnkgZW1haWwgdG8gbWF0Y2ggRnJvbTogZW1haWwg
aGVhZGVyDQo+PiBDaGFuZ2VzIGluIHY0Og0KPj4gLSBOb25lDQo+PiBDaGFuZ2VzIGluIHYzOg0K
Pj4gLSBOb25lDQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gLSBNb3ZlIHRvIGluY2x1ZGUvbGludXgv
dXNiL2NoOS5oIGluc3RlYWQgb2YgdW5kZXIgdWFwaQ0KPj4NCj4+ICBpbmNsdWRlL2xpbnV4L3Vz
Yi9jaDkuaCAgICAgIHwgIDkgKysrKysrKysrDQo+PiAgaW5jbHVkZS91YXBpL2xpbnV4L3VzYi9j
aDkuaCB8IDEzICsrKysrKysrKysrKysNCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlv
bnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC91c2IvY2g5LmggYi9pbmNs
dWRlL2xpbnV4L3VzYi9jaDkuaA0KPj4gaW5kZXggNjA0YzZjNTE0YTUwLi44NmM1MDkwNzYzNGUg
MTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3VzYi9jaDkuaA0KPj4gKysrIGIvaW5jbHVk
ZS9saW51eC91c2IvY2g5LmgNCj4+IEBAIC0zNiw2ICszNiwxNSBAQA0KPj4gICNpbmNsdWRlIDxs
aW51eC9kZXZpY2UuaD4NCj4+ICAjaW5jbHVkZSA8dWFwaS9saW51eC91c2IvY2g5Lmg+DQo+PiAg
DQo+PiArLyogVVNCIDMuMiBTdXBlclNwZWVkIFBsdXMgcGh5IHNpZ25hbGluZyByYXRlIGdlbmVy
YXRpb24gYW5kIGxhbmUgY291bnQgKi8NCj4+ICsNCj4+ICtlbnVtIHVzYl9zc3BfcmF0ZSB7DQo+
PiArCVVTQl9TU1BfR0VOX1VOS05PV04gPSAwLA0KPj4gKwlVU0JfU1NQX0dFTl8yeDEsDQo+PiAr
CVVTQl9TU1BfR0VOXzF4MiwNCj4+ICsJVVNCX1NTUF9HRU5fMngyLA0KPj4gK307DQo+IG5vdGUg
dGhhdCB4SENJIGhhcyBzb21lIHByaXZhdGUgZGVmaW5pdGlvbnMgZm9yIFVTQiAzLjIgc3VwcG9y
dC4gTWF5YmUNCj4gYWRkIGEgcGF0Y2ggY29udmVydGluZyB4SENJIHRvIHRoZSBnZW5lcmljIHZl
cnNpb25zPw0KPg0KDQpTaG91bGQgaXQgYmUgcGFydCBvZiB0aGlzIHNlcmllcz8gSSBwbGFuIHRv
IGRvIHRoYXQgYWZ0ZXIgdGhpcyBzZXJpZXMgaXMNCm1lcmdlZCB0byBoZWxwIG1pbmltaXplIHRo
ZSByZXZpZXcgZWZmb3J0Lg0KDQpUaGFua3MsDQpUaGluaA0K
