Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B23C311713
	for <lists+linux-usb@lfdr.de>; Sat,  6 Feb 2021 00:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhBEXYt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 18:24:49 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:53858 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230379AbhBEJ5J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Feb 2021 04:57:09 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6812CC00CA;
        Fri,  5 Feb 2021 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612518966; bh=W7tZCDqbBtsbL+yo2hZB4lyFWjoh0J74Rk417P0YqhU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=UjO6dQ8aZPlnl0bpRDhwnjprF/DUE1D5XwH0g0l6ARjNIckfa1zbfFzjEIPFONuqI
         Do4sFi2NBEBgg0j4VPkl+MKTJ5M1VtP3wV6oezcMwYzl3rwUu+UW0H/KcwCKh6xR0l
         RtN8Et2/pXpKMdqnHXlnQ2aPq7Eh8b4KfxM7ju8YA/1+y+HZECylwiN7Qzc8FQHEj7
         BjvFcNSSoxBUNE0QhE3AcAJj+GYeL/c98DDUnDVwSP1RBtToYu4AoBTGbJNIcS0TIX
         nvzO5esEa54K2BNH+JCwdZXaVwXrewMNUGxJbyNVHZjUs0wwZCDXC3+4Jeii4ZsLmy
         Ln3pRVnlXZn2g==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 23DF6A006C;
        Fri,  5 Feb 2021 09:56:05 +0000 (UTC)
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2059.outbound.protection.outlook.com [104.47.46.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C957980218;
        Fri,  5 Feb 2021 09:56:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="RSIGXWJ3";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSe5MjKaEB/Nsys6jFjLJeVfx1S+zEFVLUhnRgrt+Bon7vtTU9oKz1eUxmzy4ExFG+8Xc0+IDbtXKajdhapC/F1cxVNfK2CWCk3O6nK2vkq8+MH6QtLTzsVj61STTuqHEALDg+1tgyzN2vR0rVnBPMjWuvwkCYQvkfxsHN+uJCMtt76JRg15bqvApEsXE8+WxbO5/n9ECFbLKYDkY5L2fksNNrXXFDe8aouctc4nXlq0IitPOddxRcHEei//g/8+KYBHEB/QvZ2lp1sskWsBRUzqT/tqH85tfqcJ3IozteANXR5CRa66SPiGm53XpwV3NId8GRjIca2ZbC8HI1vScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7tZCDqbBtsbL+yo2hZB4lyFWjoh0J74Rk417P0YqhU=;
 b=B8TXIi9qAPadjzzf/uydJQ1MIjFq38fAVz+OnbKzKRskwfHFqF4hH5kAP2I3brKtgdicbMvsmkXO2LwVSIfw395o364D4TgQtt3gV+luLupOaCwBtI5Hnwdo2+e70d4Fo+th+K4CobUwD0B6OAhgqXrRxU8rzCp14zyVXm2cIAZ3VRADLuGFZ8KbgSQCDISYt4tinvMHmMy+V96Kvs1VFtNLiLyr7KcOW8SyK+WE2ih6ppokb1KxsPefOt2/7NKltRFs3LXgwXjaa4f4ZVpfrs7cWVrKrt/jMdpnszwru+/Hgz69UMD4DwZuxhXzVEfQPnp9bIKY6rS99QUrF/0tgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7tZCDqbBtsbL+yo2hZB4lyFWjoh0J74Rk417P0YqhU=;
 b=RSIGXWJ3O5fvE6OrhGI6q3fUP2Oxr9pcDZxNJEGM7sBRBmxkx/68U+1bnNI0hhptb2G4Vw0xMnUi6ctKFErOSnJodkX7LWm6+VL+/3yRf1T8O1Wz57vOjmzwXN4dP3RJkFOEC9wkv4tUSEoHhFsUehQ+Z7xGZP9kBlBul+xhxjA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4933.namprd12.prod.outlook.com (2603:10b6:a03:1d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 09:55:01 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3805.026; Fri, 5 Feb 2021
 09:55:01 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove check for bounded driver
Thread-Topic: [PATCH] usb: dwc3: gadget: Remove check for bounded driver
Thread-Index: AQHW+qx2ypzmJFmPtESHlvJqVGtiU6pJTJ6AgAADq4CAAABzgIAAA9oA
Date:   Fri, 5 Feb 2021 09:55:01 +0000
Message-ID: <8afe1bff-3a95-7930-1d2b-65d46267cfc3@synopsys.com>
References: <7077bb0f5691732b9814ea76d38ae8e9312a61f5.1612412038.git.Thinh.Nguyen@synopsys.com>
 <YB0PRf9H2erqMGB6@kroah.com>
 <e81699b8-1768-d54c-0419-3cbdf5b84ee8@synopsys.com>
 <YB0Sudllcc8f4lN+@kroah.com>
In-Reply-To: <YB0Sudllcc8f4lN+@kroah.com>
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
x-ms-office365-filtering-correlation-id: a03eb2d4-4f06-4e5f-048b-08d8c9bc1ac9
x-ms-traffictypediagnostic: BY5PR12MB4933:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB49334BD4D832498827FB9E9CAAB29@BY5PR12MB4933.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nAC2RusQjUXg/Opf2Ch9OpE0ICJE3WrTAD15765+EkUiVwMCpClE2uIsIdnScdmLNEB0ax1zG6iGzf0eSDudWndFVNKg+qsdzj/ljk2w6LB0PjBlgaxK8jIe83htG8isQQZaAKidDc4WD6h0lciJhnkEorb8dZ3WD+8tHxXwxO7zqZxf5XYGzBfal3aJ0L9NFTJX7+FW9naAyQ8gijuKUTHHic9tV8xzWBb+5J0zbGh+2wCd9um+GgXwBErW7QsVjIF1wfDs7gDePQucFNVZ7ui/Wlz2Kb0GkKpwMJ59WI7dutYUWW1SCQsabh3/kfAVQoAeut0rTIn/u0gDY7dA5/MLzc0infyq5GusMxQzBxElGscDQV8Fcdm1PJK9wDZVJnCwW0VBx2s+CKnwWIL5mCosJ9P1GpLLrVloqo5jIF2388v3KAPRRckEleb/XyaWbWnP7GWvzhu4bQd9slNXzVDo9M3S+k2dmasBr2GUC30Ax9XK0mjqfMKaOSdtWkmXmvKoBdNcwTqYnRCfnxOBwky57TQuDjLg7uDcPBaIgM/eGcopEmHZ1uyWsbFGy9k2Yfyvc4pZVH2LlVB0+Yga4Mr1hhAs3/CkdEIBZYOsZpo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(136003)(396003)(366004)(376002)(31686004)(186003)(2906002)(26005)(2616005)(66446008)(6506007)(64756008)(66556008)(66476007)(478600001)(6512007)(110136005)(316002)(86362001)(31696002)(54906003)(66946007)(6486002)(83380400001)(71200400001)(5660300002)(8936002)(8676002)(36756003)(76116006)(4326008)(107886003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?R0YyY1AySjhrS3QyOXk4dTBhUkwzYlAxOGZ4eDh5NGd6b05UZVNDSTdPZUtO?=
 =?utf-8?B?Ukg4dDQrZVNab2w4NEdzTEtyTGlIQnNnZXJNQytOYUswb3VGMzNHc0g3Rlhi?=
 =?utf-8?B?Z0ZxUHRsdGxQWWR2amlNOTlLOEE2TGtpMWw3L1VlaEpHd2wvaitkOW5LSGw4?=
 =?utf-8?B?Zk5Dc2grZ3NINGI4cFUrLzVuRTFCZGpTeGZ2aUd3WWR4anoyZ0M2dVBjdnF3?=
 =?utf-8?B?WVNOU000b1NMVC9Vdm4yY3pPOXp3R0RLbjQ0MUo4K29JcGJjdzRPRGtMOXIz?=
 =?utf-8?B?YWMydDlpUmZWbXhndDdoZUNJUGk4eGZ6ZldMckVQMUFWdjFTa1VzSEVYcXlK?=
 =?utf-8?B?d0N5bzRWaU1VOGJuSG5zOE1OYU1yNjIrRngxL0lEWncra2QrUGF3akpXa0Vy?=
 =?utf-8?B?MERoMFNaYVRvNkw2eldkdnNzN3F3Z2poTy9pbEU3bk9hOC9YaDRld21SUndH?=
 =?utf-8?B?UHptOGd0OUk2SGgzTWNPc09NOTI2TllKZlhwZHRqZS84UEwyUlBDV0cxQ3pm?=
 =?utf-8?B?TWJMM2dGcUg3WS81Zy9vT05RSEVVN21WZUp1aEk5TkpqWC9RL01TWGJQNjRY?=
 =?utf-8?B?ajdzN3ZiSnJkSEFpMXBFdVJoejRKT2xIcUNIZXBNZ0JzdjZia08rdTUrcHd2?=
 =?utf-8?B?UnVQWUM5L2hVaHhoUUViaUVidGtlSDQ1UDBhY25HUmJLRnRSTkVaVEIrZDdq?=
 =?utf-8?B?R1Y0Q1AzMWt4c0JWWlhrOUoySEJpTWwvVDVXR3NWZ2NBY3Z4SmFTcnNKanV2?=
 =?utf-8?B?WlI2RnV0eVpWdW9xdWtacHJrdnVEQWNyRWxmMXpTazFjd2Vrb2dFV2R0cFMv?=
 =?utf-8?B?RVN0eGtuTVdPZyt2SnB1amJRMGt1anFuNzdjZ3hrZXBnQlljQkNiakU3b051?=
 =?utf-8?B?Vm5tdXhORXpZZUtoVnBwaURCSWtTUVV4OFhnNXRpMEh4K0xsMHZTcXZkT1g0?=
 =?utf-8?B?RFY2TWpmMDRKQ2phYUpmQ1J4WUxWQ1Y1M3pFbHdDS1J5UGRvU0pkdkRqR3I4?=
 =?utf-8?B?U3NTRWU0M0s2RC94aXM5Sk5nWWYzNzlQa2JBN0RLalpsNjB5K3dWNXU0L1lM?=
 =?utf-8?B?T1VNN0RjYjZ0TmE0ZURYTjI2ektlUDcveHg0VUh6WUtWdjM4TG5lR0x3cHdt?=
 =?utf-8?B?NFlSZGdjQlRaUnMreVpUci85TzkyM1czb2pjOE9IOTR4Vm92WXgrb0cvR1F6?=
 =?utf-8?B?K2lmektLUGZ6Yk5qZXA1Uy9FNGk5OGZqN0ZENUhXWlBJWklEcFpGczY5OU4x?=
 =?utf-8?B?K3hYUytxVmtjMndqUlR0d2pBTjFFZWZxKzB6R2V3ZTA3Sm1TZkpzTGNQaG5q?=
 =?utf-8?B?L0JTemdqOEw3Y1BGbEd6cnA3dkI1MFdIOFA3cGVSSDlmRjZON3hYWEJuTWt4?=
 =?utf-8?B?Z3ZacjAwN25QUjJEU0ZPTmVuYUdKZldXVXBwK0R4bDl6aW8yWCt6THUvb2dL?=
 =?utf-8?B?NTZnNmVMY0hrUXR3MU1XeVZjbHVHeEgrOGs3dnM5Q3ZEd1d0ZnEwdTJsUXpp?=
 =?utf-8?B?TUt2LzAzampGcXZJalQweEY5SWhGazhzLzBxTnViaTh1d3lweWd4ZVE5QlZT?=
 =?utf-8?B?eEQ4OHRmMWtic28xR0t4eEpXdWJoaHczeVhFZmpSRTRmR3ZVUmptM2xEcWQy?=
 =?utf-8?B?R2VYdGdSS3E2WUdEb09aM0R2ZmlKMXdTREZ2NzRlOExhTzZydExXcGRDNjJT?=
 =?utf-8?B?MmVSUUtKTDU2aW5Sa3BZYi9CTzZuSUY5R2wwNVZnU2tjVWdCVmRQWkVOb0dm?=
 =?utf-8?Q?2AEMVAddEHqajoHLbqYNp+Frjg++kU4ZUgGMIaD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9980AD47601EDD4D9CD26EFADD74C737@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03eb2d4-4f06-4e5f-048b-08d8c9bc1ac9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 09:55:01.1902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VO7qzYv7HyL8JYg6O/LPjoLgfTZUFAmEJNM/sxCSeTqceUlDtzX7g9+cKVvu+mmiOCgKYKUDlCL1oqrl3GHB1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4933
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiBPbiBGcmksIEZlYiAwNSwgMjAyMSBhdCAwOToz
OTozN0FNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBHcmVnIEtyb2FoLUhhcnRtYW4g
d3JvdGU6DQo+Pj4gT24gV2VkLCBGZWIgMDMsIDIwMjEgYXQgMDg6MTQ6MzdQTSAtMDgwMCwgVGhp
bmggTmd1eWVuIHdyb3RlOg0KPj4+PiBUaGUgY2hlY2sgZm9yIGJvdW5kZWQgZ2FkZ2V0IGRyaXZl
ciBpbiBkd2MzX2dhZGdldF9zdGFydCgpIHdhcyB0bw0KPj4+PiBwcmV2ZW50IGdvaW5nIHRocm91
Z2ggdGhlIGluaXRpYWxpemF0aW9uIGFnYWluIHdpdGhvdXQgYW55IGNsZWFudXAuIFdpdGgNCj4+
Pj4gYSByZWNlbnQgdXBkYXRlLCB0aGUgVURDIGZyYW1ld29yayBndWFyYW50ZWVzIHRoaXMgd29u
J3QgaGFwcGVuIHdoaWxlDQo+Pj4+IHRoZSBVREMgaXMgc3RhcnRlZC4gQWxzbywgdGhpcyBjaGVj
ayBkb2Vzbid0IHByZXZlbnQgcmVxdWVzdGluZyB0aHJlYWRlZA0KPj4+PiBpcnEgdG8gdGhlIHNh
bWUgZGV2X2lkLCB3aGljaCB3aWxsIG1lc3MgdXAgdGhlIGlycSBmcmVlaW5nIGxvZ2ljLiBMZXQn
cw0KPj4+PiByZW1vdmUgaXQuDQo+Pj4gV2hhdCAicmVjZW50IHVwZGF0ZSIgY2F1c2VkIHRoaXM/
ICBJcyB0aGlzIGEgZml4IGZvciBzb21ldGhpbmcgdGhhdA0KPj4+IG5lZWRzIHRvIGJlIGJhY2tw
b3J0ZWQ/ICBJZiBzbywgY2FuIHlvdSBwcm92aWRlIGEgIkZpeGVzOiIgdGFnIG9uIGhlcmU/DQo+
Pj4gT3IgaXMgdGhpcyBqdXN0IGEgZ2VuZXJhbCBjbGVhbnVwIHRoYXQgaXMgZ29vZCB0byBkbyBu
b3cuDQo+Pj4NCj4+PiB0aGFua3MsDQo+Pj4NCj4+PiBncmVnIGstaA0KPj4gSXQncyBnZW5lcmFs
IGNsZWFudXAuIFRoZSAicmVjZW50IHVwZGF0ZSIgaXMgbm90IGluIG1haW5saW5lIHlldCBidXQg
b24NCj4+IHlvdXIgInVzYi1uZXh0IiBicmFuY2ggc28gSSdtIG5vdCBzdXJlIGhvdyB0byBwcm9w
ZXJseSByZWZlcmVuY2UgaXQuDQo+Pg0KPj4gQnV0IGhlcmUncyB0aGUgY29tbWl0IG9uIHlvdXIg
YnJhbmNoIEkgd2FzIHJlZmVycmluZyB0bzogNDlkMDhjZmM3ODMwDQo+PiAoInVzYjogdWRjOiBj
b3JlOiBJbnRyb2R1Y2Ugc3RhcnRlZCBzdGF0ZSIpDQo+IFBsZWFzZSByZWZlciB0byB0aGlzIGNv
bW1pdCBqdXN0IGxpa2UgdGhpcywgYXMgdGhlIGlkIGlzIG5vdCBnb2luZyB0bw0KPiBjaGFuZ2Uu
ICBDYW4geW91IHJlZG8gdGhpcyBwYXRjaCB3aXRoIHRoYXQgaW5mb3JtYXRpb24gaW4gaXQ/DQo+
DQo+IHRoYW5rcywNCj4NCj4gZ3JlZyBrLWgNCg0KV2lsbCBkby4NCg0KVGhhbmtzLA0KVGhpbmgN
Cg==
