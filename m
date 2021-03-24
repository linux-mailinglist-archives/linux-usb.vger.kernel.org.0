Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4F8347E3E
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 17:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236407AbhCXQw5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 12:52:57 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:60074 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237011AbhCXQwr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 12:52:47 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 31B704144C;
        Wed, 24 Mar 2021 16:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1616604767; bh=yDDHaiCsH5L5vyNwPwPlePP+/EklJYULCaiaFcIhNIs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=S5eRWFJs5BLmSLla3nvN0aErgK4m7SsLThls4d31VSKqXbh+ZVy62ll5mlqPKXfZQ
         dSsLDCykMmsKS20mfK1DoT8Y5kknZaSv7zTMY6zA8sHWRQfUm+ROSXeicFeICFPgC5
         2cWmrpcuR/bDUuSgprempDsnlkT+ZIdR+mANh9bhewArwtvmgV7iqHTojLeR0jUUxC
         hBz8DFsorhSvnq754suwNi+DEAzfatSGRvMCYMxUfFBmjkeY3rGzsxdgYXVAj36FAv
         Uj2q7bfU+tGne1+HOdAny4h74cMJ+KuybTn9AmnzaurByn+OOwIzFzgLEhEjXRUr2T
         1lZb5RYc1vmog==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id C53C8A0082;
        Wed, 24 Mar 2021 16:52:46 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A4895400EA;
        Wed, 24 Mar 2021 16:52:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=arturp@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="FQ+c05YR";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtQYJdHy+Gq5CGVZuB/ZMU6aQ1WL+LNJUSPSRAdzR+LbhtmPbjoRvhA6yLXOTaH4hnrbbR95OqOFp+L4ru+GZsL1JeMnSowiq1VVoSp3aNNwNAB0cjZs1pjpVdue7aZ1ZH+7DeTW3AfxrYYBwvx/00syGfEASTQO3QB2OyQfoyLF4T9a+4TBjWTr+5GZBx21gHPjS3UyK9isIM3g2/czDPmpeFZjxA/vT1p1A/TlQLG6bUVbw7HS4P+Z5Adb5bbK5gNrRmx1iCSvHfOkJAbADX1EVqRugE8Ny4Dfacx9vOA0ZahIKF3MAkikSCxQIB9r+c3itEReBL1OSuBr6jP/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDDHaiCsH5L5vyNwPwPlePP+/EklJYULCaiaFcIhNIs=;
 b=f5MRNCw39o9/Cv95Aktl9LiHXc6JGRjUp2FH59y4ic1/Q5APG4Y5lVXnGzJ6OpjTkrT5uWHyJp873kAj4Fn4zltwFW3iQpFH/+4w8r9O4lshQhiIbzEyOc5zwK5iYrHIdwHEAHywWBVv+Hl7M6KQrzdlHy0koeO67Ml8LYuYgQkERJ+7CAA7KhdlqBNKwrYP8KfuL1d2nSRLGlG5Lbkuj4O+awV0+aJf2LoWTVdiHqWvhtS3P3n8pgyoPNQTxI+fAMGkp7x60mDRxvjInYUULe2baaSorbNqbEagfEMhzomQQRJ0o1U555jc+UJWbEPqKUeyg/iN+2s1bokrEUGOng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDDHaiCsH5L5vyNwPwPlePP+/EklJYULCaiaFcIhNIs=;
 b=FQ+c05YRb2p8N4VBrwCDYNOezxpAKztzsU4W86SdUhdXJc/N0IgKraZwkdFvlIUicaqnIp8TzCaQEohh1z2CRtv82BOkc4dbGk9NfVdPVvP13eh5pmbbleEq54T8L6BdF5Q82lwbTO4Tjndwj4kA5G4O/E7G/DRDlOFuHvHkOR4=
Received: from SA0PR12MB4431.namprd12.prod.outlook.com (2603:10b6:806:95::11)
 by SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 16:52:43 +0000
Received: from SA0PR12MB4431.namprd12.prod.outlook.com
 ([fe80::bd3f:7f33:72ac:fb15]) by SA0PR12MB4431.namprd12.prod.outlook.com
 ([fe80::bd3f:7f33:72ac:fb15%5]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 16:52:43 +0000
X-SNPS-Relay: synopsys.com
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 2/3] usb: dwc2: Fix HPRT0.PrtSusp bit setting for HiKey
 960 board.
Thread-Topic: [PATCH 2/3] usb: dwc2: Fix HPRT0.PrtSusp bit setting for HiKey
 960 board.
Thread-Index: AQHXG73IkqPZteZ18Eq8TpubcQHLmKqRdteAgAHt4wA=
Date:   Wed, 24 Mar 2021 16:52:43 +0000
Message-ID: <83788e72-d2eb-e791-aa99-89b7a9b4c074@synopsys.com>
References: <20210318061310.D56F9A022E@mailhost.synopsys.com>
 <YFnQDRI00JN9RUYU@kroah.com>
In-Reply-To: <YFnQDRI00JN9RUYU@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33f9550e-703f-4944-6fc7-08d8eee53e97
x-ms-traffictypediagnostic: SA0PR12MB4349:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR12MB4349A70B165D9FC375B597F4A7639@SA0PR12MB4349.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YHfIOfyH7Qk1ydM6rDWnz0YUPvuO9Lb7+tR3Z4Drk8B6Ma77PbN+E/zWRkDSvO8q5GPrJGCcsyVgzhS5VPeqFMKM//JuFOdPnh4IcMN5tM8dmeZt+KHI8II8NtYUZprFQaYuzh9lrJUQUrXKrbf64Gzrfv6KDGIp1fRY0pilv/l5fAOftqywDLwmUZ5/DholbIvIpz0KhTbrj/JZjwY0g9DQMUszdad71PJrl+USHIjpAIWNqJkHm/Gafzt3u2/k7ZmbZS7YZN8rCa5CBa5l1h4tKWYr1zZyY5yUDeNfhlcLayNzaUTN9doA2PNkvGRcwdRloksTIsrJjNhgszq/HChErvO+bSFfHwSVLeW8wPEtE3wL4dZn0p/My3uvHpyxiVkYIhQwa2HWsSdgl1fSOjCtJj3HbB+aOL33vsQ8fAbveIsyRQde0mRN8G5AfYcwTa3avS6xQBcVuf5s5yC/nxF7b43nZIqTiFN6vHjpqn3lOuZrAAG0pZ5i75LRS1Pt7ZGufAD82T/KxY+fTcJxyEwBfDQI51fqVb+WeLu6XVyIEOJguU+eLXJ8u5xpkwloCRkPfn/ZdhVC5RsKxBpm2QkhV8AKf4qrC1oB4SKWxQf9L7/Q+0rhJr2SE0DH9F7fy9LmZ8mPGRZ5e66/qw+AlIWD11QYB5EGmwmDt1APaaptnRLZAuD54dYbokDGeGL9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4431.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(136003)(39860400002)(396003)(346002)(376002)(366004)(6916009)(38100700001)(6486002)(71200400001)(66556008)(2906002)(91956017)(66946007)(5660300002)(31696002)(64756008)(66446008)(76116006)(26005)(186003)(2616005)(66476007)(4744005)(31686004)(8936002)(6512007)(8676002)(86362001)(4326008)(53546011)(107886003)(316002)(36756003)(54906003)(6506007)(478600001)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?OFRZTmlESmNrNDE5cWUyanJDQ0ZxUFhxYjdtMTI3QVk2SWFuQ2tqSWhhZXNt?=
 =?utf-8?B?cHBvSHN0UXoxanVYVldZQUE3SVhTRmc4cEtaWEFXL2RWSitqdGkvcmN5bHgv?=
 =?utf-8?B?SzRCUzNNSzBrNXFvNVFxR3UvRHpEODlnWXZrZ3k4N1lvQTYrK04wL0p0Q05J?=
 =?utf-8?B?VnhZM2FSaUdtWkdmSTd5ZVl5SWtMZ1l4UW9zWnVzL01oaGVvM0tUcXF4RVdF?=
 =?utf-8?B?bXhmZEpzWGd3S0Q4YnpJSG1UWmlrZ044SWdEK0xvc3dsN1JIMmhtWkFnNFNZ?=
 =?utf-8?B?Q0JMeEovMUh3RzNzVjBKd05kTGVxMVl5d1pYdiszTkxqWlZ3OXpIVFdSTmpt?=
 =?utf-8?B?eGxqR0tVODBZUS9USFJjNUV6RnRvbnE4bllwVUFRMWtHTEFwUERhdDBsenYw?=
 =?utf-8?B?OEhzTmdYZ0Nvc2dxeUdlclZuZEswOUI5eTBRb2hjMDl2WnJPbDM2enV6QVNx?=
 =?utf-8?B?b3lZQ1pLNjdvMmlyZ1lXUXZ1dDRBZzRub1VPYWUrejk2OVF4ZVV5NUZDdDEy?=
 =?utf-8?B?ZC94QmNFR01nSG5QSGtNSzNYYTBjVjFzT051M2c5Q2c3c0IybEdidDFuV3hP?=
 =?utf-8?B?bDBnYmN1TjNWM0hWZG81QnR3VE82OHhHVG1DQUxKZDJ4SlRkUER3UTl3L1VJ?=
 =?utf-8?B?bXRwbDlic0p5VHlEZjdidU9HeU1CZ2doQndTODRWTnlyalpIK2ZIc1NjV0ZM?=
 =?utf-8?B?NzBWdG9pNTJwQWNUNzRZRHJ1aWFtQ0pOaUpRdTVEb1VPREtTVFNHemtGNWhy?=
 =?utf-8?B?NjhsT0lLTCtrZ001d3E2THZpVHF3UmZuUHg1N0ZLaEpKWDNKWm13NDc4dDVD?=
 =?utf-8?B?U2FILytBcEZlZDd5K202UjdHS0VzbjIvVngxUFJ6bWRsSnk3OXQvNnBmdmU3?=
 =?utf-8?B?U2dweEZvTkxPbU9tY3h0U0tzVHVxc2JMOEpwMjhKR3AvdjBiM3FjYTlVVFBx?=
 =?utf-8?B?amtmS1ZocDhYakN4dVNSUXU1RXBFWVZmVnB1eWtIZEREN2w2amFydmZQTUFh?=
 =?utf-8?B?ZnpEdmF4UkpSU2M1alM2NmJDclJYOGl3NVkzcHBPRWhFVlV0dEZRRDBaZDZl?=
 =?utf-8?B?aEQ4Rm1kcEFWV2FYZlFpTEtKZ3d0T2F3dWtCZ0c0RnVJUmZ2S203bS93eUFM?=
 =?utf-8?B?Vm1EUVBHbFRNaW0yL1cwTHZnOWVqaWFGeXhhRmxKSGh4amtpcTNTZVlQMGpE?=
 =?utf-8?B?QlpWbjBpV211MHQ2eHhoS0kvQWVIZVREYTE2UmJTWHZzVVJwKy9VZjR5ZFVW?=
 =?utf-8?B?QnE0a3pGR0VRU0VNcHpqOVF0cVlvOUxrSUdQUTBoNUs3K2xJNGM1YnRvZkQ1?=
 =?utf-8?B?bEI3WU9KM2FRY0pyMWNreWIwekhWdHgzMVhPRE01R3VXY0J6ZVAyUS9hdGhF?=
 =?utf-8?B?YnBvQitOMEdxTWx0VFZ5VDg0OEJrdlRKWWs5bTdCNzk0V1FlczY2ZWt3NE9s?=
 =?utf-8?B?aXp6c0dZdERNMkRMa1pNVndWcG5LektwaXlSbjZmV1pFa0VIMmUxWUFXbW1l?=
 =?utf-8?B?WjNKalp3VUtDdFhUTzE4YjMxZStVdjhJZUhOSGhxK1AvbzA3Z3h1TUppSlRG?=
 =?utf-8?B?WVlhc01obS9jeE84OHp2cUU2dExQc3dXNGljSHd4QjB6UFpOTFU2UlBkcmJV?=
 =?utf-8?B?OWZuMHdVUHM1OW9UYmlTMnQxTTgzYkVUMVdkd0E2KzR3ZGpDUmNoSG12K1Va?=
 =?utf-8?B?bndtV09mTjhKSlQrYnRKWi93cWpwaVhxZHdONGFpOFd5NTN3Y1JDREtXaXQz?=
 =?utf-8?Q?Wnpi/3hEUUgVQVIxX8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8C07604F8BC4742ADC1193539BCA501@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f9550e-703f-4944-6fc7-08d8eee53e97
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 16:52:43.6226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ylGk/XlsauZPrHqFO2jrrPjdEv/nepT/GeBD5df6YVusBkYOwl2JR0CYD89rkN9EfFYhQgYy9eLbb9z7Aq0+bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4349
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3JlZywNCg0KT24gMy8yMy8yMDIxIDE1OjI1LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6
DQo+IE9uIFRodSwgTWFyIDE4LCAyMDIxIGF0IDEwOjEzOjA5QU0gKzA0MDAsIEFydHVyIFBldHJv
c3lhbiB3cm90ZToNCj4+IEluY3JlYXNlZCB0aGUgd2FpdGluZyB0aW1lb3V0IGZvciBIUFJUMC5Q
cnRTdXNwIHJlZ2lzdGVyIGZpZWxkDQo+PiB0byBiZSBzZXQsIGJlY2F1c2Ugb24gSGlLZXkgOTYw
IGJvYXJkIEhQUlQwLlBydFN1c3Agd2Fzbid0DQo+PiBnZW5lcmF0ZWQgd2l0aCB0aGUgZXhpc3Rp
bmcgdGltZW91dC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciBQZXRyb3N5YW4gPEFydGh1
ci5QZXRyb3N5YW5Ac3lub3BzeXMuY29tPg0KPj4gQWNrZWQtYnk6IE1pbmFzIEhhcnV0eXVueWFu
IDxNaW5hcy5IYXJ1dHl1bnlhbkBzeW5vcHN5cy5jb20+DQo+IA0KPiBTaG91bGQgdGhpcyBiZSBi
YWNrcG9ydGVkIHRvIG9sZGVyIGtlcm5lbHM/ICBpZiBzbywgaG93IGZhciBiYWNrPyAgQ2FuDQo+
IHlvdSBhZGQgYSBjYzogc3RhYmxlQCB0byB0aGUgc2lnbmVkLW9mZi1ieSBhcmVhIGlmIHNvPw0K
DQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuIEkgd2lsbCBhZGQgdGhlIGNjOiBzdGFibGVAIGFu
ZCB0aGUga2VybmVsIA0KdmVyc2lvbiB0byB0aGUgcGF0Y2ggYWNjb3JkaW5nIHRoZSBkb2N1bWVu
dGF0aW9uIGZvciBTdGFibGUgS2VybmVscy4NCg0KPiANCj4gdGhhbmtzLA0KPiANCj4gZ3JlZyBr
LWgNCj4gDQo=
