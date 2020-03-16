Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A595B1870EC
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 18:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732111AbgCPRJp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 13:09:45 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:40594 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732009AbgCPRJo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 13:09:44 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 885624011D;
        Mon, 16 Mar 2020 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584378583; bh=4BQtcWk+Un/qI/+cvuQNUBSgFiX7E0L1ufH1YcAgmvU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=mTP1rZgeMGHMbBLgQ9CM7B6yBNXdwW5Lg+dFMX4dsS2gavNBwQQydIUSbcRii2KCr
         z1ClhpuNDpNoSC4/tT7Nb9AzQWQ5CzSElKO29JzYTPGxIwb8Nteq6twTAZ0Bvg6wJ+
         OcX0nbs8O8AsCsg/U9oV/UnWAPVhGPTlIxB7DFDnVzcGB51ZasyRVpj5IP5pvddQfY
         uwRlZHHlu3BDxHCht4dLThfqvvrSLcs2uyc3SRSXzsHUPCWW3xTQu04SEG2j85wGR2
         hRZuFkAMplq2jehEEjjKsuwGL0GevGNfMoqnW3nbgRNazT7XjSM0BZScUan0/JsU0p
         tIatLhO8lsnKw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 11F2EA00C1;
        Mon, 16 Mar 2020 17:09:42 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 16 Mar 2020 10:09:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 16 Mar 2020 10:09:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3+CIX8mCkWGhN3Ahziv9zJKhwKWlaQH9tz8QFinNSBLCcjayS6A2o/XP3668DhOdP7cgAPe3JPQ/067I6cdea8htobBZEJZcoEhtNZf+0iA0KRO3tWmsaJm6TZsXo/Lrj1s0FyNUJZ4XhniGkPQzKaauW4eaH7YOqgL4PiBgW5js/vNNXMxlxJ4cOP9XWyOqulIgJyKrglzstPytybfVPsT8qC3uXuRFN1HZ9KPVCYVgcso5QTAJMU+8U8k8eGyVZcKhCa7FBmjFXQfqWUyW1ST5Oc5HZF1Zfz6/fqdIo79P768jWIa0HulkagNNJiZUXAmoto9ZI5cdQ7R8O5mgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BQtcWk+Un/qI/+cvuQNUBSgFiX7E0L1ufH1YcAgmvU=;
 b=NkDAKrUA/Dd9BKanBJ11beHBd2qW0sHtdcUnYEpg80/z5jaA7jkooWr+hSM55wSf15cWdSfuqPizbYzFLmifOp7l/VR0qXbNWgTa//ZQrBI/cos/0xSY2Y0yRq8foz9a96o/h/3qZavgHwvurDBmaYQdQlb7SGYja9rNyu79wASvCDTf7D0HRXyGzV3CiFqyXo1/zgYK/uuRIQIBNa+WbChHgc1MtAoOt9kAF588p4XFLie6D4Vzlz6LyJS2Q/lQKSfCj1hNXpcFyFPHbR/CU8699TQOgpTnMyCmfgu1ujzVIVp8BZV5CxzjwIaGeu9VHHdPoLcFQCUosADBbUR56Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BQtcWk+Un/qI/+cvuQNUBSgFiX7E0L1ufH1YcAgmvU=;
 b=pkJ5RB+UprLYsYx8ld9jecm4e7ckzirza3JqeoHFGQg1HYEdGes9WhgxVAg5ohMTW6BrzusQC00Gw0fuDkcsWx8X5u+2eyZql8uL1YAC+biDuezwq47Lshp+xuz3IUFrnTrWs871Iac0MxswNtEphERDNKfnV1giyxDRCKFxCUo=
Received: from DM6PR12MB4251.namprd12.prod.outlook.com (2603:10b6:5:21e::12)
 by DM6PR12MB4203.namprd12.prod.outlook.com (2603:10b6:5:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.18; Mon, 16 Mar
 2020 17:09:41 +0000
Received: from DM6PR12MB4251.namprd12.prod.outlook.com
 ([fe80::65a9:e78c:7f63:81ab]) by DM6PR12MB4251.namprd12.prod.outlook.com
 ([fe80::65a9:e78c:7f63:81ab%6]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 17:09:41 +0000
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 1/4] usb: xhci: Synopsys xHC consolidate TRBs
Thread-Topic: [RFC PATCH 1/4] usb: xhci: Synopsys xHC consolidate TRBs
Thread-Index: AQHVtzsCoOCUmqsy60eqZZ0dzKJK/qfZO6UAgDcK6ICAB7aKAIACuDCAgBxoNgCAAEmBgIAUlecA
Date:   Mon, 16 Mar 2020 17:09:40 +0000
Message-ID: <cb3b73da-d7f2-3bbc-f822-6a9ca4edc3d4@synopsys.com>
References: <cover.1576848504.git.joglekar@synopsys.com>
 <08d08f2fd6da50e382852d014a08e371f2182382.1576848504.git.joglekar@synopsys.com>
 <3b09e3ef-d322-f8c8-f00a-34341509c350@linux.intel.com>
 <7d042091-66b5-c245-73c8-f4491ea037c3@synopsys.com>
 <85616a55-6f83-bd9d-b225-fa0ebe2d5862@linux.intel.com>
 <f304b12f-2e64-a1b2-5638-d4e71c30aeb0@synopsys.com>
 <d485b110-2a81-e5db-6e76-c65c498550f3@synopsys.com>
 <37e8bc7b-4dd4-704c-ab1d-933a56534213@linux.intel.com>
In-Reply-To: <37e8bc7b-4dd4-704c-ab1d-933a56534213@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joglekar@synopsys.com; 
x-originating-ip: [198.182.52.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e273e19-ee8e-43ad-665f-08d7c9ccd0e2
x-ms-traffictypediagnostic: DM6PR12MB4203:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB42037878212FA96CACB3FF6CA4F90@DM6PR12MB4203.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(366004)(376002)(136003)(346002)(396003)(199004)(76116006)(66556008)(66476007)(81156014)(71200400001)(8676002)(2906002)(66946007)(66446008)(91956017)(64756008)(81166006)(36756003)(2616005)(6506007)(53546011)(6512007)(6486002)(5660300002)(54906003)(31686004)(110136005)(478600001)(316002)(8936002)(4326008)(86362001)(107886003)(31696002)(26005)(186003);DIR:OUT;SFP:1102;SCL:1;SRVR:DM6PR12MB4203;H:DM6PR12MB4251.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uzPG2eByQoZ6v1HQ/UHFGjxVsGCEMfP1bbDHzwuv+GCGx1oNCEwSqsTBuc3EY0/YtV2MJBMyE1L1zKtfrHu5n4X9Qcp6sort9XzOG59RtXgdN59ejyhQC1NuOW1uLxz5Xe6O5bK/8oEKydhjxAM/j/LUttdUKWzNZ4NuSNFzhle0hZoqV/tl201qsNaI2P6c5z/wUyU5knBXi2P+ErPhWDnLzFRualeRXDRsfdIhY69XVo5ZE+hFoXFaovLuAIYx631mVQYmWVmdUJBuHvqs3jZheAClFkz9ZbCnx0B5DzsHqRR8qjMDsq1HwaSnYO0FVrSFvMvNtF7ojLVksG7w2BSz7MRHpFiOLKb1Yqby2MymKYUjC+W0vwFJuo9a2JBhczB4oqGY4B+QcoBz13aVhTCunv0cfb+2vxCevRIK1FsbheD+tec3WGHO95/nR66H
x-ms-exchange-antispam-messagedata: IeLfl8YqfNLlgZaOJu6PLPIN7gAEsVlugq5GOs2cC6+2ZkbmjuVuh5+kkpu95TZq96ctxQHy3mf1azurkrIOiQaRdRNuOODrEVmEvBEPP00ehpTP4npG0gnIur0uZYTqGpUZIu8sLR3Lff62TbRUDQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <312AAF68B8328D45B9C399A4D2A514A5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e273e19-ee8e-43ad-665f-08d7c9ccd0e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 17:09:40.9670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0785rEnC/Kw2u2KmT/CXnDlbJWU+j6BmzR3yOctgX+qwiAjBTj+ukhEQX15T5bavKrSjckPboRAeslvDoVuaiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQpPbiAzLzMvMjAyMCA4OjE3IFBNLCBNYXRoaWFzIE55bWFuIHdyb3RlOg0KPiBPbiAzLjMu
MjAyMCAxMi4yNCwgVGVqYXMgSm9nbGVrYXIgd3JvdGU6DQo+PiBIaSwNCj4+IE9uIDIvMTQvMjAy
MCAyOjA2IFBNLCBUZWphcyBKb2dsZWthciB3cm90ZToNCj4+PiBIaSwNCj4+PiBPbiAyLzEyLzIw
MjAgODozNCBQTSwgTWF0aGlhcyBOeW1hbiB3cm90ZToNCj4+Pj4gT24gNy4yLjIwMjAgMTkuMTcs
IFRlamFzIEpvZ2xla2FyIHdyb3RlOg0KPj4+Pj4gSGksDQo+Pj4+PiBUaGFua3MgZm9yIHRoZSBy
ZXZpZXcgY29tbWVudHMuDQo+Pj4+PiBPbiAxLzMvMjAyMCAxMDoxNCBQTSwgTWF0aGlhcyBOeW1h
biB3cm90ZToNCj4+Pj4+PiBPbiAyMC4xMi4yMDE5IDE1LjM5LCBUZWphcyBKb2dsZWthciB3cm90
ZToNCj4+Pj4+Pj4gVGhlIFN5bm9wc3lzIHhIQyBoYXMgYW4gaW50ZXJuYWwgVFJCIGNhY2hlIG9m
IHNpemUgVFJCX0NBQ0hFX1NJWkUgZm9yDQo+Pj4+Pj4+IGVhY2ggZW5kcG9pbnQuIFRoZSBkZWZh
dWx0IHZhbHVlIGZvciBUUkJfQ0FDSEVfU0laRSBpcyAxNiBmb3IgU1MgYW5kIDgNCj4+Pj4+Pj4g
Zm9yIEhTLiBUaGUgY29udHJvbGxlciBsb2FkcyBhbmQgdXBkYXRlcyB0aGUgVFJCIGNhY2hlIGZy
b20gdGhlIHRyYW5zZmVyDQo+Pj4+Pj4+IHJpbmcgaW4gc3lzdGVtIG1lbW9yeSB3aGVuZXZlciB0
aGUgZHJpdmVyIGlzc3VlcyBhIHN0YXJ0IHRyYW5zZmVyIG9yDQo+Pj4+Pj4+IHVwZGF0ZSB0cmFu
c2ZlciBjb21tYW5kLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBGb3IgY2hhaW5lZCBUUkJzLCB0aGUgU3lu
b3BzeXMgeEhDIHJlcXVpcmVzIHRoYXQgdGhlIHRvdGFsIGFtb3VudCBvZg0KPj4+Pj4+PiBieXRl
cyBmb3IgYWxsIFRSQnMgbG9hZGVkIGluIHRoZSBUUkIgY2FjaGUgYmUgZ3JlYXRlciB0aGFuIG9y
IGVxdWFsIHRvIDENCj4+Pj4+Pj4gTVBTLiBPciB0aGUgY2hhaW4gZW5kcyB3aXRoaW4gdGhlIFRS
QiBjYWNoZSAod2l0aCBhIGxhc3QgVFJCKS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gSWYgdGhpcyByZXF1
aXJlbWVudCBpcyBub3QgbWV0LCB0aGUgY29udHJvbGxlciB3aWxsIG5vdCBiZSBhYmxlIHRvIHNl
bmQNCj4+Pj4+Pj4gb3IgcmVjZWl2ZSBhIHBhY2tldCBhbmQgaXQgd2lsbCBoYW5nIGNhdXNpbmcg
YSBkcml2ZXIgdGltZW91dCBhbmQgZXJyb3IuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRoaXMgY2FuIGJl
IGEgcHJvYmxlbSBpZiBhIGNsYXNzIGRyaXZlciBxdWV1ZXMgU0cgcmVxdWVzdHMgd2l0aCBtYW55
DQo+Pj4+Pj4+IHNtYWxsLWJ1ZmZlciBlbnRyaWVzLiBUaGUgWEhDSSBkcml2ZXIgd2lsbCBjcmVh
dGUgYSBjaGFpbmVkIFRSQiBmb3IgZWFjaA0KPj4+Pj4+PiBlbnRyeSB3aGljaCBtYXkgdHJpZ2dl
ciB0aGlzIGlzc3VlLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBUaGlzIHBhdGNoIGFkZHMgbG9naWMgdG8g
dGhlIFhIQ0kgZHJpdmVyIHRvIGRldGVjdCBhbmQgcHJldmVudCB0aGlzIGZyb20NCj4+Pj4+Pj4g
aGFwcGVuaW5nLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBGb3IgZXZlcnkgKFRSQl9DQUNIRV9TSVpFIC0g
MikgVFJCcywgd2UgY2hlY2sgdGhlIHRvdGFsIGJ1ZmZlciBzaXplIG9mDQo+Pj4+Pj4+IHRoZSBU
UkJzIGFuZCBpZiB0aGUgY2hhaW4gY29udGludWVzIGFuZCB3ZSBkb24ndCBtYWtlIHVwIGF0IGxl
YXN0IDEgTVBTLA0KPj4+Pj4+PiB3ZSBjcmVhdGUgYSBib3VuY2UgYnVmZmVyIHRvIGNvbnNvbGlk
YXRlIHVwIHRvIHRoZSBuZXh0ICg0ICogTVBTKSBUUkJzDQo+Pj4+Pj4+IGludG8gdGhlIGxhc3Qg
VFJCLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBXZSBjaGVjayBhdCAoVFJCX0NBQ0hFX1NJWkUgLSAyKSBi
ZWNhdXNlIGl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlcmUgd291bGQNCj4+Pj4+Pj4gYmUgYSBsaW5r
IGFuZC9vciBldmVudCBkYXRhIFRSQiB0aGF0IHRha2UgdXAgdG8gMiBvZiB0aGUgY2FjaGUgZW50
cmllcy4NCj4+Pj4+Pj4gQW5kIHdlIGNvbnNvbGlkYXRlIHRoZSBuZXh0ICg0ICogTVBTKSB0byBp
bXByb3ZlIHBlcmZvcm1hbmNlLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBXZSBkaXNjb3ZlcmVkIHRoaXMg
aXNzdWUgd2l0aCBkZXZpY2VzIG9uIG90aGVyIHBsYXRmb3JtcyBidXQgaGF2ZSBub3QNCj4+Pj4+
Pj4geWV0IGNvbWUgYWNyb3NzIGFueSBkZXZpY2UgdGhhdCB0cmlnZ2VycyB0aGlzIG9uIExpbnV4
LiBCdXQgaXQgY291bGQgYmUNCj4+Pj4+Pj4gYSByZWFsIHByb2JsZW0gbm93IG9yIGluIHRoZSBm
dXR1cmUuIEFsbCBpdCB0YWtlcyBpcyBOIG51bWJlciBvZiBzbWFsbA0KPj4+Pj4+PiBjaGFpbmVk
IFRSQnMuIEFuZCBvdGhlciBpbnN0YW5jZXMgb2YgdGhlIFN5bm9wc3lzIElQIG1heSBoYXZlIHNt
YWxsZXINCj4+Pj4+Pj4gdmFsdWVzIGZvciB0aGUgVFJCX0NBQ0hFX1NJWkUgd2hpY2ggd291bGQg
ZXhhY2VyYmF0ZSB0aGUgcHJvYmxlbS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gV2UgdmVyaWZpZWQgdGhp
cyBwYXRjaCB1c2luZyBvdXIgaW50ZXJuYWwgZHJpdmVyIGFuZCB0ZXN0aW5nIGZyYW1ld29yay4N
Cj4+Pj4+Pg0KPj4+Pj4+DQo+Pj4+PiBJIHVuZGVyc3RhbmQgdGhhdCBpbiBhIGZpcnN0IGxvb2sg
aXQgbG9va3MgYSBjb21wbGV4IHNvbHV0aW9uLCBidXQgeW91IGNhbiBzdWdnZXN0DQo+Pj4+PiB0
aGUgbW9kaWZpY2F0aW9ucy9jaGFuZ2VzIHdoaWNoIHdvdWxkIGJlIHJlcXVpcmVkIHRvIG1ha2Ug
dGhlIHBhdGNoIG1vcmUgcmVhZGFibGUuDQo+Pj4+PiBJIGhhdmUgdHJpZWQgdG8ga2VlcCB0aGUg
aW1wbGVtZW50YXRpb24gc2ltaWxhciB0byBib3VuY2UgYnVmZmVyIGltcGxlbWVudGF0aW9uIA0K
Pj4+Pj4gb25seSB3aXRoIGFkZGl0aW9uIG9mIGJvdW5jZSBidWZmZXIgbGlzdC4gRm9yIHRoZSBz
cGlubG9jayBjYXNlLCB5b3UgY2FuIHRha2UgYSANCj4+Pj4+IGNhbGwgaWYgaXQgaXMgcmVxdWly
ZWQgb3Igbm90Lg0KPj4+Pg0KPj4+PiBJbiB5b3VyIGNhc2UgeW91IGtub3cgdGhlIG5lZWQgZm9y
IGEgYm91bmNlIGJ1ZmZlciBtdWNoIGVhcmxpZXIgdGhhbiBpbiB0aGUNCj4+Pj4gZXhpc3Rpbmcg
VEQgZnJhZ21lbnQgY2FzZS4NCj4+Pj4NCj4+Pj4gSGF2ZSB5b3UgbG9va2VkIGludG8gdGhlIHN0
cnVjdCBoY19kcml2ZXIgbWFwX3VyYl9mb3JfZG1hKCkgYW5kDQo+Pj4+IHVubWFwX3VyYl9mb3Jf
ZG1hKCkgaG9va3M/IEluIHRob3NlIHlvdSBjb3VsZCBkZXRlY3QgdGhlIG5lZWQgZm9yIGEgYm91
bmNlDQo+Pj4+IGJ1ZmZlciwgYWxsb2NhdGUgaXQsIGFuZCBibHVudGx5IGNvcHkgZW50aXJlIHNj
YXR0ZXJnYXRoZXIgYnVmZmVyIHRvIHRoZSANCj4+Pj4gYm91bmNlIGJ1ZmZlci4gSXQgc2hvdWxk
IGJlIGZhaXJseSBzbWFsbCBhbnl3YXkuDQo+Pj4+DQo+Pj4gSSB3aWxsIGxvb2sgaW50byBpdCwg
YW5kIGdldCBiYWNrIHRvIHlvdS4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4NCj4+PiAgDQo+
PiBJIGxvb2tlZCBpbnRvIGl0IGFuZCBJIGhhdmUgYSBxdWVzdGlvbiByZWxhdGVkIHRvIGFwcHJv
YWNoIHlvdSBoYXZlIHN1Z2dlc3RlZC4NCj4+IEkgY2FuIGRldGVjdCBuZWVkIGZvciB0aGUgYm91
bmNlIGJ1ZmZlciBpbiBtYXBfdXJiX2Zvcl9kbWEoKSBmdW5jdGlvbiBhbmQgY2FuIGFsbG9jYXRl
IGJvdW5jZQ0KPj4gYnVmZmVyIGFuZCBibHVudGx5IGNvcHkgaXQsIGJ1dCB3aGVuIHRoZSBTRyBs
aXN0IGlzIGhhdmluZyBkYXRhIG92ZXIgZmV3IE1CJ3MsIEkgdGhpbmsgDQo+PiBteSBib3VuY2Ug
YnVmZmVyIGFsbG9jYXRpb24gbWlnaHQgZmFpbCwgb3ZlciBhIHBlcmlvZC4gRG8geW91IHRoaW5r
IGl0IGlzIHBvc3NpYmxlPw0KPiANCj4gRG9lc24ndCBzb3VuZCB2ZXJ5IGxpa2VseSwgdGhlIHNn
IHdvdWxkIG5lZWQgdG8gaGF2ZSBtb3JlIHRoYW4gMTYgZW50cmllcyBvZiB3aGljaCB0aGUNCj4g
dG90YWwgbGVuZ3RoIG9mIGNvbnNlY3V0aXZlIDE2IGVudHJpZXMgaXMgbGVzcyB0aGFuIDEwMjQg
Ynl0ZXMsIGFuZCB0aGVuIHRoZSBmb2xsb3dpbmcNCj4gZW50cmllcyBzaG91bGQgYmUgbGFyZ2Ug
ZW5vdWdoIHRvIGZhaWwgbWVtb3J5IGFsbG9jYXRpb24uIA0KPiAoZm9yIEhTIHRoZSB0b3RhbCBs
ZWd0aCA8IDUxMiBmb3IgOCBlbnRyaWVzLCBhbmQgcmVzdCBodWdlKSAgDQo+IA0KPiBBbmQgbm8g
cmVhbCB3b3JsZCBkZXZpY2UgaGFzIHlldCBldmVuIHRyaWdnZXJlZCB0aGUgZmlyc3QgY29uZGl0
aW9uIG9mIGhhdmluZyAxNiAoOCkNCj4gc2cgZW50cmllcyB3aXRoIHRvdGFsIGxlbmd0aCBsZXNz
IHRoYW4gbWF4IHBhY2tldCBzaXplLg0KPiANCj4+DQo+PiBTbyB0byBhdm9pZCB0aGF0LCBJIHRo
b3VnaHQgb2YgaGF2aW5nIGEgbGlzdCBvZiBzdWNoIGJvdW5jZSBidWZmZXJzIGhlbGQgd2l0aCB0
aGUgVVJCIGFuZCANCj4+IHRoZW4gSSBjYW4gYnJlYWsgdGhlIFNHIGxpc3Qgd2l0aCBzb21lIGZp
eGVkIGRhdGEgbGVuZ3RoIChlLmcgMTZLQiBvciAzMiBLQidzKSBib3VuY2UgYnVmZmVycw0KPj4g
YW5kIGNvcHkgdGhlIFNHIGludG8gdGhhdCBib3VuY2UgYnVmZmVyIGxpc3QuDQo+Pg0KPj4gQW5v
dGhlciBvcHRpb24gaXMgdG8gY3JlYXRlIGEgYm91bmNlIHNnLCBiYXNlZCBvbiBkZXRlY3Rpb24g
b2YgYm91bmNlIGJ1ZmZlciByZXF1aXJlbWVudCwgDQo+PiB3aGVyZSB0aGUgc21hbGwgc2l6ZSBT
RydzIGFyZSBjb21iaW5lZCB0byBjcmVhdGUgYSBuZXcgU0cgbGlzdCB3aGljaCBjYW4gc2F0aXNm
eSB0aGUgDQo+PiBUUkIgY2FjaGUgcmVxdWlyZW1lbnQgZm9yIHRoZSBTTlBTIGNvbnRyb2xsZXIu
DQo+Pg0KPj4gV2hhdCBkbyB5b3Ugc3VnZ2VzdD8gV2hpY2ggaXMgdGhlIGJlc3Qgd2F5IHRvIGdv
IGFib3V0IHNvbHZpbmcgdGhlIHByb2JsZW0/DQo+IA0KPiBBcyB0aGlzIGlzIGV4dHJlbWVseSBy
YXJlIChuZXZlciByZXBvcnRlZCBpbiBhIHJlYWwgdXNlIGNhc2UpIA0KPiBJJ2Qga2VlcCB0aGlz
IGFzIHNpbXBsZSBhcyBwb3NzaWJsZS4gQWxsb2NhdGUgb25lIGJvdW5jZSBidWZmZXIgd2hlbiBu
ZWVkZWQsIGFuZCBjb3B5IGFsbC4NCj4gSWYgbWVtb3J5IGFsbG9jYXRpb24gZmFpbHMgKHVubGlr
ZWx5KSBwcmludCBhIHdhcm5pbmcsIHRoZW4gd2UgaW1tZWRpYXRlbHkga25vdyB3aGF0IHRvIGZp
eC4NCj4gDQo+IFdlIGFyZSB0YWxraW5nIGFib3V0IHNpemVzIHdoZXJlIDE2IHNnIGVudHJpZXMg
aGF2ZSBpbiB0b3RhbCAxMDI0IGJ5dGVzIG9mIGRhdGEuDQo+IA0KT2ssIEkgYWdyZWUuDQo+IGVo
Y2ktdGVncmEuYyBkb2VzIHNvbWV0aGluZyByZWxhdGVkIHRvIHdoYXQgeW91IHdhbnQuIEl0IHJl
cGxhY2VzDQo+IHVyYi0+dHJhbnNmZXJfYnVmZmVyIHdpdGggYSBkbWEgYWxpZ25lZCBib3VuY2Ug
YnVmZmVyLiANCj4gDQpJIHRyaWVkIHRoaXMgKGluIGhjZC5jKSBhbmQgaXQgc2VlbXMgdG8gYmUg
d29ya2luZyB3aXRoIG15IHRlc3RzLiBJIHdhbnQgdG8gb3ZlcnJpZGUgdGhlIA0KdW5tYXBfdXJi
X2Zvcl9kbWEoKSBhbmQgbWFwX3VyYl9mb3JfZG1hKCkgYW5kIGtlZXAgYWxsIG90aGVyIHRoaW5n
cyBzYW1lIGFzIHhoY2kgZHJpdmVyLg0KSSB0aG91Z2h0IHRvIHVzZSB4aGNpX2RyaXZlcl9vdmVy
cmlkZSBmb3IgZG9pbmcgdGhpcyBpbnN0ZWFkIG9mIGNyZWF0aW5nIGEgd2hvbGUgbmV3IGdsdWUN
CmRyaXZlci4gV291bGQgdGhhdCBiZSBvayA/DQoNCj4gLU1hdGhpYXMNCj4gDQoNCg==
