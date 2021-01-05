Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F285F2EA78D
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 10:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbhAEJbR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 04:31:17 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46836 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728004AbhAEJbJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jan 2021 04:31:09 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ABEC7C00A1;
        Tue,  5 Jan 2021 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1609839008; bh=8B9P4ZcbpHYaXi98WYJ8NuDLiaKd4BQjGeUOWzq8du0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=W6HWx2PZXvno0Qu3TzZ4gSBmL//u7exaB/y7hSlQ68wxdqOvN6sTEMgoK+gv/feWx
         xrG7K+fiWg8sSAjbOEimEtfjDnMgO7yTYM58jSf4fsOXB189HRLeGBmvRlGxDFyx/9
         yQx+mejNTFG5YAromWIct8Tyy17BG/lOMy6X8c0YlfQDdLcQR2gUov0lKQWjQo25Fj
         592oiYUvrzmFXPVclhfWxpw6uIJq0bCW4A7V8b7j/5GuN65LPE/BN6OGTLFj+axfFM
         WWh+kWWVJ8qtAe90zmuMgEcSH4KU20KG2G1biisd42RkimG7CDpqXRgMdK+ZkZT8Sd
         Y52mYny+vNriA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id E357DA0079;
        Tue,  5 Jan 2021 09:30:06 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id BEE2E8000C;
        Tue,  5 Jan 2021 09:30:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="tBPwBFiQ";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3P5I4rga42FKilPoDyXg/XBgDOGGoiYEgQNkRN4Oo8F9SgL97FQBZqGNquBhmXj92GsNCR1DIVO670tq3XebkLsX8AYFZIHz8cGctY5Wk5vb3ILuqgJrykulItwIZDVHNTaEveVJtfvpeI/YSkF85a85OfTZGOhmIcjclOSoKvNDos4BwbsDHvFF7dJLtuejb99X/HzQ2+M0+zy+hb/gmlEJKnfL3XJWGwgwU8XUmctHYG56bwTLvQX2Mlr42/336mWd2goaDEkKDokiW0AnZ5RVc/neRSu649IkomNhaReQFiDq2bZyNRiUvnGab1igl1i1MLTsgvK4qWy63VkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8B9P4ZcbpHYaXi98WYJ8NuDLiaKd4BQjGeUOWzq8du0=;
 b=ZqKEBYfoYDsV1TNwIQRQB658sYlxOF3bpYMX0zmt96rjiM+ZrjUY2BVuk6WWEOqj0RHZiZsJj7b49bGQwt3gTL7GXnGkuBsUABn6Wk8DruDqh42N86t2wbxIKBZ3cwQsk37nNKtPB1iOgNt+GB48+6fkgHCsGhnrAF7am3NTfCvONeCpgqLqTL63DnNKm6wLDgUWyXQVEPrmqSIT1AdIzPyWaJZx0qydNiA3cU+vICZdgQVRaGdyYUXb3Qd2lCbayWkFGa9uY89DbbVGIOeoAKdmQLuxFu+gKIWIA/l7CIWqw9UYK1hjTPYPBIxmBN/pQj/QOLX+5wy2rAMMbB4mKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8B9P4ZcbpHYaXi98WYJ8NuDLiaKd4BQjGeUOWzq8du0=;
 b=tBPwBFiQc2Otf61faLZeZIUBFJf94qfsczh4xL1OB294PbrbscbEWXPpVDctEZ4HlsdjWyUO0x+n5UxjD/MLusajtmso+SNBOSlVm39R+UZe/P6FLKbjvaBgaWU9TfP/PInn1tXkekTmcqcmhoPF7UjxCsOHaALa4fjBpJFGah0=
Received: from BY5PR12MB4887.namprd12.prod.outlook.com (2603:10b6:a03:1c6::15)
 by BYAPR12MB2983.namprd12.prod.outlook.com (2603:10b6:a03:d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Tue, 5 Jan
 2021 09:30:03 +0000
Received: from BY5PR12MB4887.namprd12.prod.outlook.com
 ([fe80::874:a242:5ddd:693d]) by BY5PR12MB4887.namprd12.prod.outlook.com
 ([fe80::874:a242:5ddd:693d%8]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 09:30:03 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RESEND PATCH v6 3/3] usb: dwc3: Pass quirk as platform data
Thread-Topic: [RESEND PATCH v6 3/3] usb: dwc3: Pass quirk as platform data
Thread-Index: AQHW4nMihtq4xUkYtkKMo4ANJ0ntZqoXNA8AgABnuoCAASoAAA==
Date:   Tue, 5 Jan 2021 09:30:03 +0000
Message-ID: <2b63edec-f32c-ba80-0be4-53e894272395@synopsys.com>
References: <cover.1606149078.git.joglekar@synopsys.com>
 <0b96cb765bb154cf0e83a436e7fed8882f566cf9.1606149078.git.joglekar@synopsys.com>
 <X/LQ5ZWLUCGzC8vz@kroah.com>
 <090742a1-a9a1-b89a-e078-a960b5ca3064@synopsys.com>
 <X/M3nxyjiIN/R4MC@kroah.com>
In-Reply-To: <X/M3nxyjiIN/R4MC@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [49.207.212.204]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c2eca31-7340-4b9b-3498-08d8b15c7b15
x-ms-traffictypediagnostic: BYAPR12MB2983:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2983A1C18882AE216D9F0307A4D10@BYAPR12MB2983.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rlUiqQMam/faVyTPcHYuLf+ilIMRUTrZ2i7C1P9ORibGIcjkwFRbFxPsnUVH+F2Vu/TGl4AVzXGE23+wKoBH8qOGD/1Rzzaom7zERRsdpmtSJTzUFSaSauX2afnxV2T0yQE1Ssg8R+JmxNz19zcGjGaeOPyS18vRd8WdKgYgwGHYfzrd8nVKo56+fvc5LWAh6ak4rcYxdf1jroFuLKjTxsgsiqNW/pbJguyHggnQYpciQCIS+5zHPvNqGaUm20hUWvvUgT82xkiPsHocJnfWMuuOjQ/AgAoNjr4AGnARy98UzN9qr/5MK/S/1RTeDyL5s1MixSNwM9XoqrCRiJM1ShLEIHFaxGgK9jlU4TwCNc/qv4rTtatfuGi4jDO0V7VY6C5H0fIeqLIz78HX+Dm6l+CNAHZFGB9/LzDHgdvpSlHwXw76LTZsxUwz7l/MeRgN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4887.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(39860400002)(366004)(376002)(396003)(66556008)(2906002)(6512007)(66446008)(2616005)(64756008)(6506007)(71200400001)(53546011)(55236004)(478600001)(31696002)(66476007)(26005)(6486002)(66946007)(186003)(36756003)(86362001)(5660300002)(4326008)(110136005)(91956017)(54906003)(8936002)(316002)(8676002)(31686004)(76116006)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MWRkMkY0bkZLK1M3MmU1aGJSekt2ZmJNS1JnM3Y3bGNpZzMwN0FBY2dKaGVx?=
 =?utf-8?B?eUtOTnB0QlM4WkNFa2tKNlJMcjNzR1dpSFB1S0U0MlRMZDExL1FjZEt4elBi?=
 =?utf-8?B?UWhkTGxjdk5SbmxWVTVEakg5cWdpNDJ4Q0VmRVU0VWQ0RlZCMmwxamRNTEN1?=
 =?utf-8?B?NldtUTU4TDhLcjNMRFk2ZE1OeGd1ZjM0SktiMXZQZTl4d0h5d3FwNkNnUlRz?=
 =?utf-8?B?aDZ6amlSODREV1Q5TjA0Z2d1NVQzNDJhSTM3OGlNSSt2TnNDRWs5ek9IT0Zo?=
 =?utf-8?B?MDhTSXhML0J0WW1MMWhsVjdEZ3BqMVJmdEkzQ2ZOalB3WlMvbkFMQUhxQjJ5?=
 =?utf-8?B?djlUenNDaUthQy9YQ1VHaDJUWmo3eU1aNk9VT216RXhxTUc4WmxLM21JZWdU?=
 =?utf-8?B?MTJvTXJKeVlRY3gwR1NiNXM3ZWN4Z2F6VzRWWW5TYVYrNFRsRldFOE9vb3Rt?=
 =?utf-8?B?OUFnOGlUK3p0eWRLQTRFK2FSTis3bzFiQ3IxTk9nTE1EUytzaGQvQlZOTjN0?=
 =?utf-8?B?TXZDanNQYVdNeTdBRFRpSjE0SURucmw0dXpGbjF6alRaTEdSRmlvaVRHQ0g0?=
 =?utf-8?B?ajVBeUppc25RRVdyOEV3c0dJWUpKeHpGZXpKb1ZLSWdpZkVKbHd2UkxpWmEv?=
 =?utf-8?B?NnJUM0w4SzdJT1ZZT3FTemgrak05TEdtOXpWWVJGUmNiUEtWYTR5T0JLVEti?=
 =?utf-8?B?YVcyelpQZENTb0dka2ViWXVzQ3hmSlN5c0VsN1UwRDJVUmZKKytoZ0k5TytR?=
 =?utf-8?B?TEY3eUhaWEpGYjF3K2d4OXRJSUFLeFREOHMzZ1Q4emh5ajIvamdONWFIT05S?=
 =?utf-8?B?SlNCanBnZDdOTVE2OGYvWTF3WnJ2dXZYeGhGOENaOTBBM2tmc2xORFQ0M25k?=
 =?utf-8?B?OEhTUEFrTzY2NGl3ODZydk9IejNZbEFsWjJwTy9FdldIczJuWDJGaDkrd3Fi?=
 =?utf-8?B?MTdvZ2VlQm9MT3B1bmJBWWxQMnlBaFhiK1lnSlVFTVgyVzJPWCtsNDJ1WDdo?=
 =?utf-8?B?UjBpeHVwUEEvS3kvRmlERGJnTTdtV1ZnbCtiWVBrZE9NV2c5ZXBRZ0M0Tndv?=
 =?utf-8?B?U0VjcUZIZCswNDVVZndac1Q5MWNiTGt4d0FMRWRRZFViL0VubkZjYVU0eGZW?=
 =?utf-8?B?dERUTEJUZzFWL2lmei9RUTkxcUs2cFJCR1FTRVZSWm5KRkhBTlljV2hGbmVJ?=
 =?utf-8?B?OGFWVEtxUjNzMkNwdVIreHh5Y3ZQdEUzd3cyOVhnODZucU5wdmFOMWVGNmxv?=
 =?utf-8?B?OVRvZXJMdkd6RjU1ZUsvY3dCZUpkV2R3dXEvKzNWR2JadGhTR3g0ZmV5aHVG?=
 =?utf-8?Q?YGf1eZOIqakJU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <420DBA33ED20E448917269CF21C7042A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4887.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2eca31-7340-4b9b-3498-08d8b15c7b15
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2021 09:30:03.1924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OoMCUQC5+/IX42AWlR7iHq/PPkoHMyrh/Fsna23GHvG7AfEh98HY8O28ZOL/TYsYC0/DZYpvgz5JCfghIdug/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2983
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWF0aGlhcywNCk9uIDEvNC8yMDIxIDk6MTMgUE0sIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90
ZToNCj4gT24gTW9uLCBKYW4gMDQsIDIwMjEgYXQgMDk6MzI6MTNBTSArMDAwMCwgVGVqYXMgSm9n
bGVrYXIgd3JvdGU6DQo+PiBIaSBHcmVnLA0KPj4gT24gMS80LzIwMjEgMTo1NSBQTSwgR3JlZyBL
cm9haC1IYXJ0bWFuIHdyb3RlOg0KPj4+IE9uIE1vbiwgSmFuIDA0LCAyMDIxIGF0IDAxOjM4OjQz
UE0gKzA1MzAsIFRlamFzIEpvZ2xla2FyIHdyb3RlOg0KPj4+PiBUaGlzIGNvbW1pdCBhZGRzIHRo
ZSBwbGF0Zm9ybSBkZXZpY2UgZGF0YSB0byBzZXR1cA0KPj4+PiB0aGUgWEhDSV9TR19UUkJfQ0FD
SEVfU0laRV9RVUlSSyBxdWlyay4gRFdDMyBob3N0cw0KPj4+PiB3aGljaCBhcmUgUENJIGRldmlj
ZXMgZG9lcyBub3QgdXNlIE9GIHRvIGNyZWF0ZSBwbGF0Zm9ybSBkZXZpY2UNCj4+Pj4gYnV0IGNy
ZWF0ZSB4aGNpLXBsYXQgcGxhdGZvcm0gZGV2aWNlIGF0IHJ1bnRpbWUuIFNvDQo+Pj4+IHRoaXMg
cGF0Y2ggYWxsb3dzIHBhcmVudCBkZXZpY2UgdG8gc3VwcGx5IHRoZSBxdWlyaw0KPj4+PiB0aHJv
dWdoIHBsYXRmb3JtIGRhdGEuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRlamFzIEpvZ2xl
a2FyIDxqb2dsZWthckBzeW5vcHN5cy5jb20+DQo+Pj4+IC0tLQ0KPj4+PiAgZHJpdmVycy91c2Iv
ZHdjMy9ob3N0LmMgfCAxMCArKysrKysrKysrDQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKQ0KPj4+IFdoYXQgY2hhbmdlZCBmcm9tIHByZXZpb3VzIHZlcnNpb25zPw0KPj4g
UmVzZW50IHRoZSBwYXRjaCBhcyBpdCB3YXMgbWlzc2VkIGZvciByZXZpZXcgYnkgRmVsaXBlIGFu
ZCBJIHNhdyB5b3VyIG1haWwNCj4+DQo+PiB0byByZXNlbmQgdGhlIHBhdGNoIGlmIG5vdCByZXZp
ZXdlZC4gT3RoZXIgdHdvIHBhdGNoZXMgZnJvbSBzZXJpZXMgYXJlDQo+Pg0KPj4gcGlja2VkIHVw
IGJ5IE1hdGhpYXMsIHRoaXMgb25lIGlzIHJlbWFpbmluZyBmb3IgcmV2aWV3Lg0KPiBBaCwgaG93
IHdhcyBJIHN1cHBvc2VkIHRvIGd1ZXNzIHRoYXQ/ICA6KQ0KPg0KPj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvZHdjMy9ob3N0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2hvc3QuYw0KPj4+PiBp
bmRleCBlMTk1MTc2NTgwZGUuLjA0MzRiYzhjZWMxMiAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVy
cy91c2IvZHdjMy9ob3N0LmMNCj4+Pj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCj4+
Pj4gQEAgLTExLDYgKzExLDExIEBADQo+Pj4+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2
aWNlLmg+DQo+Pj4+ICANCj4+Pj4gICNpbmNsdWRlICJjb3JlLmgiDQo+Pj4+ICsjaW5jbHVkZSAi
Li4vaG9zdC94aGNpLXBsYXQuaCINCj4+PiBUaGF0IGZlZWxzIHJlYWxseSB3cm9uZy4gIEFyZSB5
b3Ugc3VyZSBhYm91dCB0aGF0Pw0KPj4gVG8gdXNlIHRoZSBzdHJ1Y3QgeGhjaV9wbGF0X3ByaXYg
dGhpcyB3YXMgaW5jbHVkZWQsIGNhbiB5b3Ugc3VnZ2VzdCBhbHRlcm5hdGl2ZT8NCj4gSWYgdGhh
dCBpcyB0aGUgIm5vcm1hbCIgd2F5IHRvIGRvIHRoaXMgd2l0aCB0aGUgeGhjaSBkcml2ZXIsIG9r
LCBidXQgSQ0KPiB3b3VsZCBsaWtlIHRvIGdldCBhbiBhY2sgZnJvbSBNYXRoaWFzIGZvciB0aGlz
IGJlZm9yZSB0YWtpbmcgaXQuDQo+DQpDYW4geW91IHBsZWFzZSByZXZpZXcgdGhpcyBwYXRjaCB3
aGljaCBpcyBpbmNsdWRpbmcgdGhlIHhoY2ktcGxhdCBoZWFkZXI/wqAgTGV0IG1lDQoNCmtub3cg
aWYgYW55dGhpbmcgc2hvdWxkIGJlIG1vZGlmaWVkLiBBY2sgaWYgdGhpcyBwYXRjaCBsb29rcyBv
ayBzbyBHcmVnIGNhbg0KDQp0YWtlIGl0Lg0KDQo+IHRoYW5rcywNCj4NCj4gZ3JlZyBrLWgNCg0K
DQo=
