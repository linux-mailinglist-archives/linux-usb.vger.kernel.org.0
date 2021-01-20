Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4A602FC6F0
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 02:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbhATBj6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 20:39:58 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57370 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727833AbhATBjt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 20:39:49 -0500
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 222B0400DF;
        Wed, 20 Jan 2021 01:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1611106729; bh=m5sz+YvNckb8QjMAKgXp3O6iDfE9St/bt7gVszkgoKQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=YcOOIg9u1bUZEKzC0r+7KBbJF+o4P4Opji+Rn/TZOytBkOuvFge5SWODaWYQLy/Pj
         wamlcdtJfbd306RBt7knWcGng7J4uXvu9ga6S7Vwf/PMjennCFld4vbE+Dg9P2fT2K
         F+MrnfAZh7CKbV/YMCb7hdQD6X47I73YHz1HZClHzJnZsaEqR5Jbv9Dhqth0lFRUgK
         mWsYCiiPIWIvHEpRnVAFSe6vQzGvwejw3xej/N9dF1VYuNtwt2dIvM87Hs/RJr4oSF
         nB0Q8yldw6wjo7ulslATQC+xBB2GxYRkG/aBC1ukn8PGdoj7+pLv1daXECujh/xjvt
         Ta5dms+ANsZ2g==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 84C21A0084;
        Wed, 20 Jan 2021 01:38:41 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7B9C74004A;
        Wed, 20 Jan 2021 01:38:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="iBZn2H5F";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzHGLBV47WLAJ1Duz0tRlAI3LqgEsMT7ZLaqb7638tvUy9B6wVAdjn3/eNfR42Xn/b9IZSZQU4HnUOOLe3Gx5ezOgipt3vzaZk5ldx3fEmQfxLwSLsMDMK4fGH262CxvFF8H9D7oImlEHerwBvEBk+F3vVgQ2mNnzwPo90NueW4FQG/LZM1sHEHYrwsKwQbIL1uTLq6c4ryEnasAYUE5TBk9IZRfgJoT4tp49ihjwqHA89FMxsNP8e5Ce0CqcgF+C3m4BjOt4oG3x2XFC7xLMVYwl8BIAf/Bl/CSGGOKxRpai7mHunRwnvkgvTgIE1BeYmP5yq/BA9wN9uZ59r0BPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5sz+YvNckb8QjMAKgXp3O6iDfE9St/bt7gVszkgoKQ=;
 b=KAa+KPpT0j3FrLw8ptRNBh1rftDmypfyOsz1FrG1kMMvnrlw85JI71LYBiY1WZuNul7NH7PZnWqamGpHFmPqtwi9PUeAdeQhYAc1d0gO54FxE16DNHLhQ0E6kZk3xjOWuze6TZvyqmeSzyHcuNy2vwfUMlaI4l1ll3nEUGBqwpoG5XOM6acnyc9MsEyl4+qDmehMq470b5NKmLmA0B/UhY+TBWBRtcNd4UtO3RYyYY0Z+CkhfCdrsLOnIhjhFbLRv2rg4bRpn+P3j0zIX03MHpgcaCeURHKDZWlPGpQhn4G+oVctxhtLIIExiWjr9Xk0gYKNLYXK/GQGPTaB2qWAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5sz+YvNckb8QjMAKgXp3O6iDfE9St/bt7gVszkgoKQ=;
 b=iBZn2H5F+wpMYHbU8c5dBGSuURXwLfk/b+6XrcxfOoZQnJX+KKjuCAogqMWAIrsMFn4AoAL6Qisd1CNailDj5aiKYEXBLEAlTN6lhm+jWizTm6KQMUSIzDAe9TDANMtcpYncApNzEhznjlbWw7jKMuyv3E6KgDP7Mv98eADJszQ=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3095.namprd12.prod.outlook.com (2603:10b6:a03:a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 01:38:36 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 01:38:36 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rob Gill <rrobgill@protonmail.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        Dejin Zheng <zhengdejin5@gmail.com>, Bin Liu <b-liu@ti.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v6 00/11] usb: Support USB 3.2 multi-lanes
Thread-Topic: [PATCH v6 00/11] usb: Support USB 3.2 multi-lanes
Thread-Index: AQHW6iBUH9wcPvaDw0m938/NJobTWaotrjqAgAIXcwA=
Date:   Wed, 20 Jan 2021 01:38:35 +0000
Message-ID: <350a3898-7df3-1897-66c3-f2e3f9602f92@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
 <YAXIb2ABpnRR5PCc@kroah.com>
In-Reply-To: <YAXIb2ABpnRR5PCc@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5c18346-9df5-411d-23d0-08d8bce41ac7
x-ms-traffictypediagnostic: BYAPR12MB3095:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB309524347CA5901EF737974AAAA20@BYAPR12MB3095.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uibzgHNoyg68piQvyD9KvDnKzL0ukEZqtglojYTe/32+Aas0255aQtyHMY2d+h8+rK5auFXw8etddbOj+r8R1Vs1tcSnnxXoXrQzkVr/w71Ell1BSuu23VJPZOyjNqwPG464EIGg4OYNNZAwzvvmSgIdevZ6xNi/J9Xgc8yWq1u47r23yLui9QzDV8P5yTCVIpBQUTFqtXBQp3qbg1DlkctKtr7TraJjIns9nDCzvd2MPFP4SK7kyujkW7AegUZpOkqaMGhRidt9sRRC0GKI6JabNkmatIegYce8kiWWZmMpfMMo/6oyuaLpByRL2dx/cJsn1R6TRd8ra1RvEt7JAatHomRvCb24GHVNvGmNUmSRVL5/s5HjGfYL5541/TbEp3hZFZL9wc7HAUvNkjT+hoyQFQmtbdC/6BYceUV/At02PXSMKmTtgmyyIc8a8jaR6mjiC9hpxlsiJ9+2d8PKzW5yCQcXeUJeUXw8oF2d6p8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(39860400002)(376002)(136003)(2906002)(26005)(31686004)(110136005)(107886003)(71200400001)(31696002)(83380400001)(36756003)(8676002)(316002)(4326008)(478600001)(2616005)(8936002)(54906003)(5660300002)(7416002)(6486002)(66946007)(6506007)(6512007)(76116006)(64756008)(66476007)(186003)(66446008)(66556008)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QXNqN3VvYlYzMkVnVWdUbmNZQy9zWEtOR0ZWOFRmZWRpQTVta2wrclNaTjZM?=
 =?utf-8?B?WDJHYXVwRFcrS0R0VGZWUk91b241NTg2RG5oQk5XN1piMit1UjY0ZGNRWDhB?=
 =?utf-8?B?NHovT1NZdURYUlE4Tzh0WTFSa0l3S1hVR3RHMFZJVVgyeGRYOFAzSDR0cVND?=
 =?utf-8?B?N2ZCd3hORWY2OWdFSXBHK3V4ZjhVd3AxdE10U1R3MFZkeTVmbC8zMnNZYVo1?=
 =?utf-8?B?Rm9zbERFSXAzWnRhYnhKbXR5Z1poZk5Qc3NpMmJ2QUVORlpKb0pRMVpBNzBL?=
 =?utf-8?B?R2t0OFhsTTJDakY1ekNTVm9tL2VyekhzS1hMa1I0OStPOXN4amFYd3VHL0cz?=
 =?utf-8?B?UkdjTm1ZakdlVXZoaldYdkxmNWdUZG4yUllnT0tqN2hxajNIbkkyRVlYaE1C?=
 =?utf-8?B?cTRUektoN0xMR21qZjhodTZhL1YxbHJTeS9US2VxUUxHRnJiaHJ3RFh5WUlB?=
 =?utf-8?B?a0hheUVOdnc4TllKQW9mTWhXN0ptOGRoSHN0RTd4L1E4U1dnSWdTVlJvOWZV?=
 =?utf-8?B?Q2hqV0xGM29iRnN1N1RmSkFrOTlUcFJ1aXF4d01TeWk0RmNmREtxanJsNndo?=
 =?utf-8?B?clRKZXJHNzJxNmxsWWZYdDJrR1FHdERoWXNKR3NYejZpMVZmbmpLREoyR0Fl?=
 =?utf-8?B?c1pvd3FEWkpDWXVmWTJmellsRWxjcXgrV00vODBxck9yOGVydjFPeHgzaTB1?=
 =?utf-8?B?eHpWSG1JVkpyTGJtOGNBakJvbWVpaXlWeE5ndExVbG9WRFVQUHBxVDM0UWwx?=
 =?utf-8?B?dC9kL01lV1JlQSs2NlFwSGpOdHhwT1BTVjgyUUhBRStrTkt0ZkZxNzJKM24z?=
 =?utf-8?B?aUxGdnRWajEyQVBpSDBOT09lSFZnYTFHdFJxTFBEREVtRjB4VVdieG9Ga2xQ?=
 =?utf-8?B?a1lza0ttR1k4TUx4dlVNZTVMQlU1YVN3ZVJGQVJMTStPRzh1S2VJdzJveFBp?=
 =?utf-8?B?TGp6OHR5L29uaU5lNkg3bzErRm1LaGN6MkVhNmhzZm0xNEpNWEY3My9ESjk3?=
 =?utf-8?B?eTU4SVpjZ1pqVGk5NnBXQWZhMmkwK1UyM1E0K2o3VElQc2dmMjgvM0tYT1hB?=
 =?utf-8?B?ZFNpSEZWVGxXV0Z2YXZRN05abllDSGpiT0k4RWhFUTNyeXRsV0hFZ3hvQjc3?=
 =?utf-8?B?T3IrR1BmakVSb0VTUkUxV05wMkQ2QXEwUTc0SHg0MU5XemdtNldnSGwwanZj?=
 =?utf-8?B?MWdMb2hLNlpZdTQ4djRTdC8yQjBuY3VWUHZsQStYRW9kYzFBeE5YVDFTcmFi?=
 =?utf-8?B?OWFoaGErSTJlMGtEYWtLeWhzTkJjTVc1aUtPNU1teHdTcmZIYlVDbTMrcG9m?=
 =?utf-8?Q?8tFDST2x04PJ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BABED48146B25F4499FA662A69A850B9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c18346-9df5-411d-23d0-08d8bce41ac7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 01:38:35.9509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qp6agb/AVTLu9Ir+JDLL8E8unb6xy5I50fsObTEBokYRCVSoPwRuK9lzIrdhXgryf5tk5D5U7x9dxMAMzGx7rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3095
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiBPbiBXZWQsIEphbiAxMywgMjAyMSBhdCAwNjo1
MjozN1BNIC0wODAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBBIFVTQiBTdXBlclNwZWVkIFBs
dXMgZGV2aWNlIG1heSBvcGVyYXRlIGF0IGRpZmZlcmVudCBzcGVlZCBhbmQgbGFuZSBjb3VudA0K
Pj4gKGkuZS4gZ2VuMngyLCBnZW4xeDIsIG9yIGdlbjJ4MSkuIFRoZSBEV0NfdXNiMzIgSVAgc3Vw
cG9ydHMgU3VwZXJTcGVlZCBQbHVzDQo+PiBnZW4yeDIuIFRvIHN1cHBvcnQgdGhpcywgdGhpcyBz
ZXJpZXMgdXBkYXRlIGEgZmV3IHRoaW5ncyB0byB0aGUgVVNCIGdhZGdldA0KPj4gc3RhY2sgYW5k
IGR3YzMgZHJpdmVyOg0KPj4NCj4+ICogQWNjZXB0IGFuZCBwYXJzZSBuZXcgbWF4aW11bV9zcGVl
ZCBkZXZpY2V0cmVlIHByb3BlcnR5IHN0cmluZ3MNCj4+ICogSW50cm9kdWNlIGVudW0gdXNiX3Nz
cF9yYXRlIHRvIGRlc2NyaWJlIHRoZSBzcGVlZCBpbiBTdXBlclNwZWVkIFBsdXMgZ2VuWHhZDQo+
PiAqIENhcHR1cmUgdGhlIGNvbm5lY3RlZCBhbmQgbWF4IHN1cHBvcnRlZCB1c2Jfc3NwX3JhdGUN
Cj4+ICogUmVwb3J0IHRoZSBkZXZpY2Ugc3VibGluayBzcGVlZHMgYmFzZSBvbiB0aGUgdXNiX3Nz
cF9yYXRlIGluIHRoZSBCT1MNCj4+ICAgZGVzY3JpcHRvcg0KPj4gKiBJbnRyb2R1Y2UgZ2FkZ2V0
IG9wcyB0byBzZWxlY3QgU3VwZXJTcGVlZCBQbHVzIHZhcmlvdXMgdHJhbnNmZXIgcmF0ZSBhbmQg
bGFuZQ0KPj4gICBjb3VudA0KPj4gKiBVcGRhdGUgZHdjMyBkcml2ZXIgdG8gc3VwcG9ydCB0aGUg
YWJvdmUgY2hhbmdlcw0KPiBJJ3ZlIHRha2VuIHRoZSBmaXJzdCA1IHBhdGNoZXMgbm93LCBJJ2xs
IHdhaXQgZm9yIHRoZSBEVCBtYWludGFpbmVycyBhbmQNCj4gZHdjMyBtYWludGFpbmVycyB0byBy
ZXZpZXcgdGhlIHJlc3QgYmVmb3JlIEkgY2FuIHRha2UgdGhlbS4gIEZlZWwgZnJlZQ0KPiB0byBy
ZWJhc2UgYW5kIHJlc2VuZCB0aGUgc21hbGxlciBzZXQgb2YgcGF0Y2hlcyBpZiB0aGF0IG1ha2Vz
IGl0IGVhc2llcg0KPiBmb3IgdGhlbSB0byByZXZpZXcuDQo+DQo+IHRoYW5rcywNCj4NCj4gZ3Jl
ZyBrLWgNCg0KSnVzdCByZWJhc2VkIGFuZCByZXNlbnQuDQoNClRoYW5rcyENClRoaW5oDQo=
