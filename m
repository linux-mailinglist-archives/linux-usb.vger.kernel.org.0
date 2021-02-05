Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E69B0310815
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 10:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbhBEJlq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 04:41:46 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54334 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230075AbhBEJkq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Feb 2021 04:40:46 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 25C1D402EF;
        Fri,  5 Feb 2021 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612517980; bh=vG3vdB/HwnxKAKSizvcZfkqm4DIxXmtE/qfUKmwKn1w=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=CCz2WzCqr5J+h1rtN9uxf/XdDtbSP7YG8zyIC2DX7BwNIX0C1H7l5p8EL03Tid3Vc
         GlGkjdoSUEa2q75HDqGiEJYZ4QjtBLYlbEGu/8iW1O42IaZQQ8FFwKE2S0tpHEMljb
         pw9ZNzLLZJlbnZFB/Vk1dVE+Xg+toIdKVhM+3t6tH8226wCmbu8TwAfb8x2Ena4EkX
         ZzCqMWz8x/YrCiUIJvllO0cjkHeymbb4s0V5WLxrlo3pPGQXWrzlzedaBq2WMGCG/g
         KJ2VY8Qf95UaF0vyXaajjls+2OD5DwM8PJvnc0vm/nsb3nwOnOpcLtvtN3m0wsFwMq
         xKdQqFcMWIGHA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9426DA0068;
        Fri,  5 Feb 2021 09:39:39 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1DA1080218;
        Fri,  5 Feb 2021 09:39:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="jwwHF0QO";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDkfNcleNK3MolG1EnRq4RI3mtAvP24sHl2j4EtcVigW18S8+DLNCF2Tdp+TxZ8/xWWD8NVVJX1VX85FyGrJJX3695sMtSPOpT9szgVuZpzPjd8BbmKYzKit+hoU1iutuRCa4xL6OV6xr9/0yX5xndkLLmf8sxMD5eHnm4e7riCiV4XRT7Pg74PaCzzHsvYls8TRbbIAremMnxrWZh+S2JTO/13lYEan7Z/1gBq1wpS0klx9nJRCIm2BrgNrbkBTyPEtHHCZ4AZdhPzrLgtwomKqDvTzwvQH8hI7NOF+UoaeWaw6FXiU01dQ4ukoKX+JptjhRDKQqOii2nkubN1Vjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vG3vdB/HwnxKAKSizvcZfkqm4DIxXmtE/qfUKmwKn1w=;
 b=lSJuu7Xll5GcNnfgoySyi572JizwfLltZp+YJeDlKGEhzhpNFlIy5gISdVRLwz/W/FkHguavNX94oE+zKzUbNKcWqqGzyJR/4aTEGmj8HJk9NA6IgRnqdNTDBF73HYnbJkp5bfFMB2JdNTbUxGhMI3ulEcnv81qHLX8VrFiEW19oTIT4ANkKmmgoHCXrIr+zDC5cdpT31NYnJJwGgZsgN95D3dZ1/d2aMDmTHFfpDrY5ucnjvJImUjpGUmfhfIKj21BW5+qag4LbGy4MKP/rIlNIYAmEilNo7/+eywVfZ7DTVxZFm3iZUpW+6acluc7vsBLh2BEUp3w8QBF4HSFJpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vG3vdB/HwnxKAKSizvcZfkqm4DIxXmtE/qfUKmwKn1w=;
 b=jwwHF0QODrsbuozO1izLkJn/qWMJ/FzMHUYXMrXh2q0Isz/0aD4pQd482hJHUJJiI0D+l881o2GrHz6PmttYxmnA7DozGvuKwDoFI+zFHun6tH0Vx4ZZTZCCm10zBiLLfDJV7igVjzrU3sojUWM4BgUQnhHHxp7DwRg9XUXMCWg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB3860.namprd12.prod.outlook.com (2603:10b6:a03:1ac::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 09:39:37 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3805.026; Fri, 5 Feb 2021
 09:39:37 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove check for bounded driver
Thread-Topic: [PATCH] usb: dwc3: gadget: Remove check for bounded driver
Thread-Index: AQHW+qx2ypzmJFmPtESHlvJqVGtiU6pJTJ6AgAADq4A=
Date:   Fri, 5 Feb 2021 09:39:37 +0000
Message-ID: <e81699b8-1768-d54c-0419-3cbdf5b84ee8@synopsys.com>
References: <7077bb0f5691732b9814ea76d38ae8e9312a61f5.1612412038.git.Thinh.Nguyen@synopsys.com>
 <YB0PRf9H2erqMGB6@kroah.com>
In-Reply-To: <YB0PRf9H2erqMGB6@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d7945ce-b6fb-4b8a-8a04-08d8c9b9f40c
x-ms-traffictypediagnostic: BY5PR12MB3860:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB3860B38960734AE1E09939DEAAB29@BY5PR12MB3860.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9EEyhcEQLMEtVHIGzpQeoNq1O57bRPq+AdBWuw7EIuURF+uibfVIaa5Sr73YQO20uwgTy0GU2+R/ietTlcLxLe8EKIuM82wldrEMe9TgoZTdxgEB8XgRcOhJhVqvq/kxQ6DFO6KM6d+/hueL8pHMMe3aMLrtqWPtZIycYU8aUpBeZziQj61Zc98+PwcalH18Njpygxe9zJKxvCpAHWjQywHMnFCmDkoo9ho54j8K0xAKR6cGIu2NjRLXIMuOW4jSWgBXaGou9/MPzss4/F8QplJltPVYZv7qySwbWDp6Z7/oDD/aT9CsF++fmC18Wq8qsr40UMzyg+g64Bqj2QuijyxPDgW4pjThpHXcIWhrkjQtpfAm930yEWLlEEXB/A40SAYngOVPBrRIuvfV0PSvDsg8axMNTcj9CbvzBVwBXQxZHiEJSXVlJEY9tjic/HXoGtupP1qY0oMDNK4qsM2jQlIEW/26Q1HiZlT7JhrjtK4EgC8KKLyIXdDzPjLt8HcJ2XwAJv9oVsWayBw7EKzOt340To8Dp94OgOiqs4IlXCFsqVdwLjJzfzWV+ZioF2EWVZE+wG4KI3iTvR3S/4XEz4EDeg3sBW56DhusjOyt67U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(136003)(39860400002)(346002)(64756008)(8676002)(2906002)(26005)(5660300002)(186003)(66946007)(31686004)(76116006)(31696002)(86362001)(8936002)(83380400001)(4326008)(2616005)(66446008)(107886003)(66476007)(71200400001)(66556008)(6486002)(478600001)(54906003)(6506007)(110136005)(316002)(6512007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?U3BNRWx4WmJick1XWE00S29Fa1dXaDdRYXdvNEFaeFNjbzAxcUpMTThhcjdT?=
 =?utf-8?B?MERaN0pPWGJiOG95UkQ4Q3htdmRsQVRlam5hc0J1WWxHbzNKL1VvVkFTR0k1?=
 =?utf-8?B?eE8wVnhobjB6ZVFKZEhYWDQxVFZVR2UwRUhWcmlWZ1pWOC9mbVRmQ1VrQ29x?=
 =?utf-8?B?bXErdFlzenVZekRaUHNuMDc2TmEvc0VnaDBmbmpXNmx1NDYrSHFKenJvMld1?=
 =?utf-8?B?WlY1aHNxWTAzYkFqNnZibW9NZjdzZk4zWnN2ay9sMEQva3YvL3Z1UU9LNGps?=
 =?utf-8?B?YzZMNVh3WXBrOFNYSTJYSjBNWTdFRnNMMEdtVnJwV0dERXB6MWFRNDI5ZEpR?=
 =?utf-8?B?dlZlVTQvZWtIank4cXhlMDhjYzdDdzhIR2xmWkF4Ni9HeUNBcDFNa0NmT2Jv?=
 =?utf-8?B?NHBLWkJHOHJjb1lUWjd1M0hYQ2duZHErekFSU1RQN2VpM2NCUW5pK2tDdU5z?=
 =?utf-8?B?TmNqR09uYm1WTkpQSm9sY0JESUE5L0xiRjZLNXJ1dGN1eTc0bmRsd3hMeEd4?=
 =?utf-8?B?ak9GNUN3R3ZpRDFhTHpWSElGSXFnZWZsb0EwNWR5M0J4UiszQ2J3VDJaUUR2?=
 =?utf-8?B?emVsbk1xRjRWSTdaU3ZSTEo0RVN2TkZDVWV2WDZpaWFWeU9KVFo5K0xZaEQ1?=
 =?utf-8?B?WG03amFwWlhNNlp4cEFLcXRHNjlyeXV0VzE5b0tHSU13YU9VV1dwSDM0VEEz?=
 =?utf-8?B?Zkp1dkcrSE9vRjNMc2x2K1pEbWQ4U3hmQThNTXIrOGk5UEZLdldRbmVyVTlu?=
 =?utf-8?B?T1p0ek9LMFhEWVlJejhwR0MxYWlaYisxaGhKRng3d2lIRnhiTjJBV3paN21a?=
 =?utf-8?B?SGpKcnFaa3JQTGtPdW81UldWMHRLaVFDS3pmR1FmUGhFRUozZ0hubU13aXUw?=
 =?utf-8?B?Nk95RDBYbEFabnR5TUNwRzJxVEEvRk5SWmdlV3NkaGQyME5uUEpRN2RZL1Nr?=
 =?utf-8?B?bUUrYmpYaWlpdzFDekVpTE9qN1NHTjVsZkllQXlNUUhCMTZHa2pMRGpRcGZB?=
 =?utf-8?B?WFRLOGEzbjZWZlVUZGdTZndGbTNRS3VTVFRwSDBaVnc1ak9DRFc4TjAvSTJV?=
 =?utf-8?B?ZXdOZnVBZlpzL3A0SysxdW0waVhybkxUeTZsSXQzOEUzOFhOUmdaVUxYRmZQ?=
 =?utf-8?B?YU54TUdVcC9tVU9may9RT0hZNVB2OWp0WDVKeGdQb25IVDA1K3VRK2RwMXVF?=
 =?utf-8?B?eFR4cEVJeDNWUDdjdHA1Mkg0cnBrMEVVWXZ3TFJ4NkVHSXJ1V21hUCt0ZmVr?=
 =?utf-8?B?TXZGZ3dMMkRLOFFmYldpSGF1b0dUeCtMQVhYeFd5TDV0eTRmMk91TGlkbGdr?=
 =?utf-8?B?cnVheVRxL3hMUzVrOFo5SDJFejMrV1BFN3pqeGIxM1pzYjVZVWVFWDJCOTBV?=
 =?utf-8?B?U0dEbzlZbU45R0dNS3QvTU4ySjJXY2ZWRjVYNE8xSll0cXlRRTlVWHJrWW9Q?=
 =?utf-8?B?S0l0YUF2YnFiN3pJaWxXWUhZTUttZkgzZTNqeDI2dUxGRDdzaEZxaG5LT2tT?=
 =?utf-8?B?RlgvSGp0SWE0WnpLenowbUZmMHBXbkdTckZrV2tmd2VHZCtkbk9BbTJYeEQ3?=
 =?utf-8?B?YUszbFJ1NXNSaDhJVjlLQjFaSzNPN3B0M3lXbzI2U0pHekx3THE4S2Zsd3B2?=
 =?utf-8?B?dzZHTHJ5YUJXR1NBbkNmdU5oVnc1OWsvWTNDQ0gyd2FsNExYay9QdUp0UmFr?=
 =?utf-8?B?MDVzWkdDMDhLZ0Q0aGxHUFBYKzl5cE9HNmYyM0w5b0pyNG9ZZTVUQWYwODA0?=
 =?utf-8?Q?thQEECieSD0fkMQNiapRKGiJafTEKV1PRlv5+bu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DF4FCE26BCC824FAE0C37FCA4B6204A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7945ce-b6fb-4b8a-8a04-08d8c9b9f40c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 09:39:37.2610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IX3XGh83z/5hJMRqObQ+lc35IALOKH8PoHCBtqxd5ghX32ZjQWiVC2wtPPzOMugbJoyjO++J8GXnuI3AoqQH6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3860
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiBPbiBXZWQsIEZlYiAwMywgMjAyMSBhdCAwODox
NDozN1BNIC0wODAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBUaGUgY2hlY2sgZm9yIGJvdW5k
ZWQgZ2FkZ2V0IGRyaXZlciBpbiBkd2MzX2dhZGdldF9zdGFydCgpIHdhcyB0bw0KPj4gcHJldmVu
dCBnb2luZyB0aHJvdWdoIHRoZSBpbml0aWFsaXphdGlvbiBhZ2FpbiB3aXRob3V0IGFueSBjbGVh
bnVwLiBXaXRoDQo+PiBhIHJlY2VudCB1cGRhdGUsIHRoZSBVREMgZnJhbWV3b3JrIGd1YXJhbnRl
ZXMgdGhpcyB3b24ndCBoYXBwZW4gd2hpbGUNCj4+IHRoZSBVREMgaXMgc3RhcnRlZC4gQWxzbywg
dGhpcyBjaGVjayBkb2Vzbid0IHByZXZlbnQgcmVxdWVzdGluZyB0aHJlYWRlZA0KPj4gaXJxIHRv
IHRoZSBzYW1lIGRldl9pZCwgd2hpY2ggd2lsbCBtZXNzIHVwIHRoZSBpcnEgZnJlZWluZyBsb2dp
Yy4gTGV0J3MNCj4+IHJlbW92ZSBpdC4NCj4gV2hhdCAicmVjZW50IHVwZGF0ZSIgY2F1c2VkIHRo
aXM/ICBJcyB0aGlzIGEgZml4IGZvciBzb21ldGhpbmcgdGhhdA0KPiBuZWVkcyB0byBiZSBiYWNr
cG9ydGVkPyAgSWYgc28sIGNhbiB5b3UgcHJvdmlkZSBhICJGaXhlczoiIHRhZyBvbiBoZXJlPw0K
PiBPciBpcyB0aGlzIGp1c3QgYSBnZW5lcmFsIGNsZWFudXAgdGhhdCBpcyBnb29kIHRvIGRvIG5v
dy4NCj4NCj4gdGhhbmtzLA0KPg0KPiBncmVnIGstaA0KDQpJdCdzIGdlbmVyYWwgY2xlYW51cC4g
VGhlICJyZWNlbnQgdXBkYXRlIiBpcyBub3QgaW4gbWFpbmxpbmUgeWV0IGJ1dCBvbg0KeW91ciAi
dXNiLW5leHQiIGJyYW5jaCBzbyBJJ20gbm90IHN1cmUgaG93IHRvIHByb3Blcmx5IHJlZmVyZW5j
ZSBpdC4NCg0KQnV0IGhlcmUncyB0aGUgY29tbWl0IG9uIHlvdXIgYnJhbmNoIEkgd2FzIHJlZmVy
cmluZyB0bzogNDlkMDhjZmM3ODMwDQooInVzYjogdWRjOiBjb3JlOiBJbnRyb2R1Y2Ugc3RhcnRl
ZCBzdGF0ZSIpDQoNCk5vIG5lZWQgdG8gYmFja3BvcnQgdGhpcyBiZWNhdXNlIGl0IGRvZXNuJ3Qg
Zml4IGFueXRoaW5nLg0KDQpUaGFua3MsDQpUaGluaA0KDQo=
