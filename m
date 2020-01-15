Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48B8813BEBA
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 12:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729927AbgAOLoq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 06:44:46 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:60510 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729797AbgAOLoq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 06:44:46 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BFD86C0633;
        Wed, 15 Jan 2020 11:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1579088684; bh=gcbsRI5YHsh5GMnw8g7N08utDU3tdoDQ6a6yF795Lzk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=G03CmvIOn2V7znayKjKAvmHQuGF7Bq0Cb3yS88XZxTjYlu3TAE36klmnD7YvUP9N+
         y65GN+itb7wwHuRDLeARDSPbgvJc4Bl2Gwgdq/rUbUNHn3qPsKMkGGcb+W2Uhs6+3u
         0fihFBkjXwUBBRJu3CjN86GX9UrkWbTX9zZURYCMYDMEnDDem7Tf2UDM2H+Gd3FTbd
         5UeTegAlQuthHYnTMFOgawCruqkiaDY3PAQqiWCXQg6AqzAxl2qu43HIUvBkE13gp7
         f5r3xR9Zhsd9Q3eI2tRkzdLDHM7pVYzppJ15/iKkr5eCGis77Pj9wR21yQuUxgzKY4
         Y68GdtmjlhQZw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id C681EA0079;
        Wed, 15 Jan 2020 11:44:36 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 15 Jan 2020 03:44:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 15 Jan 2020 03:44:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doIjGFrQum9Zl9l1f/zEsd4jZLrCbyDs8kKdl4H2RDvSKM9d7TSAfFwkAjbRQ/PiHIwkj74Ol9IdZJyWmtBpuRVTAR6QkOsh+hOLQVnxOd2uCN1LGbS5VAD3rkYbPJn1acgM7Uz0CSQ3cz2jVuKXcg3R1Hz8xpyoWOXsp6ZtWgKmc3p/SMeybdrFu8kgWn0nbhO+T1LQ1kMyhYVKjwJO7hTx8RQEPhWxGYlVFNIH1s7IS9kemk1/i1MFETIV8M9FhhCjzehbI++LRegEqlFUsTh7nVeT+kw3vLV6Cporn+rPzao+mx3UB2uNH1C0AG4oaVT/vic0a3HTzZZrP9C8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcbsRI5YHsh5GMnw8g7N08utDU3tdoDQ6a6yF795Lzk=;
 b=mIXF75Qhpp7vRgZ+6OnWdVOPxRkf1utqT48YTQX4BJmMe/gre5689uaqZmMxjqgL7x+P6zsUh0NzOUvQGo/UrfGLNRsFLFdOtlIE756anExT6gWtj7OtWSJDPgdzoCA0353Rt28vraNBmKiz/RiLBjsOiveQxPjgNA/GdbStykLAIqnDCocghxW0YEBQ4g0m419KhhqahT4rHtv1PAJl94FAwJSByYaW6Lmgz60kTWs7du9SYFWHtVOXNlgDzCKW0VfrUI2jTRrnlLqGqiVwPIVC8Y0RkAHEPG06B1Ctr1hMj1zXYyOYUWfiEwz+pLRfStUybfxn+rup5IGb5CC10A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcbsRI5YHsh5GMnw8g7N08utDU3tdoDQ6a6yF795Lzk=;
 b=Qg/gEYD3H6OokXKjqzCyogppbUEIkfjEfHnMp0WKyiXzkh3cYDpgU8Tu4Vw4XQtLjaGOglY4f0kebAxtt0ryK53sS7pIEmqLANjf/6C0N/WVds6J5vEZPexn6+XN5Z9fDlbY3s43k+SUIJK7aE/slM+X46QGIUUOyxOBBZUyJ2M=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB3967.namprd12.prod.outlook.com (10.255.238.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Wed, 15 Jan 2020 11:44:14 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8%7]) with mapi id 15.20.2644.015; Wed, 15 Jan 2020
 11:44:14 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Lukas Wunner <lukas@wunner.de>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc2: Drop unlock/lock upon queueing a work item
Thread-Topic: [PATCH] usb: dwc2: Drop unlock/lock upon queueing a work item
Thread-Index: AQHVn4uRIRY3I3zRxEWS1SsbsjEXaqfik6+AgAkxZ4CAAAdGgIAAIvmAgAADzAA=
Date:   Wed, 15 Jan 2020 11:44:14 +0000
Message-ID: <d11f5537-f0f8-20cd-ff5c-c4951e60d3dc@synopsys.com>
References: <77c07f00a6a9d94323c4a060a3c72817b0703b97.1574244795.git.lukas@wunner.de>
 <20200109123617.5ovxwkfnmf7ou4z4@wunner.de> <87h80x6qog.fsf@kernel.org>
 <788fc4ab-28f4-f4de-66b3-8c39ab841c3e@synopsys.com>
 <20200115113039.lmz6kzwqspq2vugc@wunner.de>
In-Reply-To: <20200115113039.lmz6kzwqspq2vugc@wunner.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d817830-e9d7-4b55-4266-08d799b03ef9
x-ms-traffictypediagnostic: MN2PR12MB3967:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB396731418E8F1ACF0DC85A0CA7370@MN2PR12MB3967.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(136003)(366004)(376002)(396003)(199004)(189003)(54906003)(66946007)(186003)(91956017)(53546011)(110136005)(66476007)(66446008)(66556008)(966005)(478600001)(6486002)(71200400001)(6506007)(64756008)(76116006)(4326008)(31696002)(2906002)(26005)(6512007)(36756003)(2616005)(5660300002)(8676002)(8936002)(81166006)(81156014)(31686004)(316002)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3967;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IRS46SihPWNb75Iuj8dzdnAW5fxb7ZuzJ3kTCGFKa3yMfOidpJWh101QYx8lSJaTuZDy3yo42iDl7aPAwM+9ja1vdJSXSkjM3t7L/3UquZK74YoZ5lw0BsxU637l9BMASW+DqTIHTH8eib/LH0N5ds09E10lN5MvlNQ2WXwstF0A5sC5JyNVY7ctOrv4HKJcra7XdjAFb9gbsAaWSdFM1yXvIdXUzyBCoEnSFdio09A11A8XfrUcOHFpAb7WdPwfTpK1YmGiNtjA6rl07DBzpkJDLB2aKcQhobBev6DL0MAw9uc4p/Onab3IM9bYgszWGi13/0lQBBci/dE1NXv5m4yA4yScx15TocRs39PlH08FTZlNB/748AWV9AQ7sPo/DRFUyC8uII+xSBrWjAbgmh6PcxKqnqOuLf1ilVcbTUqDIbSBS/H28sAe3PEqC3a8OHjDjIoWBpFsskiJ+/heITpLsBfN95G3RiwsrFgtukU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06799FD8B759BE498AB4840044F49B37@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d817830-e9d7-4b55-4266-08d799b03ef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 11:44:14.4945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: za9W3FmDaD9C0fF7nKnsffImZLBkxnmKPCE3DbLMz7V4j2EjIF4UY9fTa9rG8cbPEKtgvAwaLAfmbDytpCQksQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3967
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTHVrYXMsDQoNCk9uIDEvMTUvMjAyMCAzOjMwIFBNLCBMdWthcyBXdW5uZXIgd3JvdGU6DQo+
IE9uIFdlZCwgSmFuIDE1LCAyMDIwIGF0IDA5OjI1OjMwQU0gKzAwMDAsIE1pbmFzIEhhcnV0eXVu
eWFuIHdyb3RlOg0KPj4gT24gMS8xNS8yMDIwIDEyOjU5IFBNLCBGZWxpcGUgQmFsYmkgd3JvdGU6
DQo+Pj4gTHVrYXMgV3VubmVyIDxsdWthc0B3dW5uZXIuZGU+IHdyaXRlczoNCj4+Pj4ganVzdCBh
IGdlbnRsZSBwaW5nOiAgVGhlIGJlbG93IHBhdGNoIHdhcyBzdWJtaXR0ZWQgbW9yZSB0aGFuIDgg
d2Vla3MgYWdvDQo+Pj4+IGFuZCBJJ20gbmVpdGhlciBzZWVpbmcgaXQgb24gb25lIG9mIHlvdXIg
YnJhbmNoZXMgbm9yIGhhdmUgdGhlcmUgYmVlbg0KPj4+PiBhbnkgY29tbWVudHMgb24gdGhlIGxp
c3QuICBBcmUgdGhlcmUgb2JqZWN0aW9ucyB0byB0aGlzIHBhdGNoPw0KPj4+DQo+Pj4gSSBkb24n
dCBzZWUgYW4gQWNrZWQtYnkgTWluYXMsIHNvIEkgY2FuJ3QgdGFrZSB0aGUgcGF0Y2gsIHNvcnJ5
Lg0KPj4NCj4+IEJ1dCBJIGRpZG4ndCBmaW5kIG9yaWdpbmFsIHBhdGNoIGVtYWlsIGluIG15IGlu
Ym94LiBJIGp1c3QgZ290IHRoaXMgcGluZy4NCj4gDQo+IFlvdSB3ZXJlIGNjJ2VkIG9uIHRoZSBw
YXRjaCBhbmQgSSBkaWRuJ3QgcmVjZWl2ZSBhIGJvdW5jZSBtZXNzYWdlLg0KPiBTbyBpdCBtdXN0
IGhhdmUgYmVlbiBhY2NlcHRlZCBieSBTeW5vcHN5cycgbWFpbCBzZXJ2ZXIuDQo+IA0KPiBJJ3Zl
IGp1c3QgZm9yd2FyZGVkIHRoZSBlLW1haWwgdG8geW91IG9uY2UgbW9yZS4gIEFkZGl0aW9uYWxs
eSB5b3UgY2FuDQo+IHJldmlldyB0aGUgcGF0Y2ggaW4gdGhlIG1haWxpbmcgbGlzdCBhcmNoaXZl
IGFuZCwgaWYgdGhlcmUgYXJlIG5vDQo+IG9iamVjdGlvbnMsIHByb3ZpZGUgYW4gQWNrZWQtYnkg
aW4gcmVwbHkgdG8gdGhlIHByZXNlbnQgZS1tYWlsOg0KDQpPay4gSSBqdXN0IHJlY2VpdmVkIHlv
dXIgcmVzdWJtaXR0ZWQgcGF0Y2guDQo+IA0KPiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2lu
dC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2xvcmUua2VybmVsLm9yZ19saW51eC0yRHVzYl83N2Mw
N2YwMGE2YTlkOTQzMjNjNGEwNjBhM2M3MjgxN2IwNzAzYjk3LjE1NzQyNDQ3OTUuZ2l0Lmx1a2Fz
LTQwd3VubmVyLmRlXyZkPUR3SUJBZyZjPURQTDZfWF82SmtYRng3QVhXcUIwdGcmcj02ejlBbDlG
ckhSX1pxYmJ0U0FzRDE2cHZPTDJTM1hIeFFuU3pxOGt1c3lJJm09UnZVUXZWanE1ZGo5Q1ZVdTNu
am1wZG04OEdTNkIzckZ2N2lCOVJqOGs0WSZzPXA0QW1RSzF2eDYza05hM0JEZGZ4YU9PMUM4MEF2
bWdUUVk1d3RLSmNYYmMmZT0NCj4gDQo+IFRoYW5rcywNCj4gDQo+IEx1a2FzDQo+IA0KQWN0dWFs
bHkgSSBhZ3JlZSB3aXRoIHlvdSBvbiB1bm5lY2Vzc2FyeSB1bmxvY2svbG9jayBoZXJlLiBDdXJy
ZW50bHkgSSdtIA0KZ29pbmcgdG8gdGVzdCB5b3VyIHBhdGNoIGJlZm9yZSBBY2suDQpKdXN0LCB3
YW50IHRvIGNoZWNrIHdpdGggeW91IC0gZGlkIHlvdSBzZWUgYW55IGlzc3VlIGluIGRyaXZlciBm
bG93IA0Kd2l0aG91dCB0aGlzIHBhdGNoPyBvciBpdCBqdXN0IGNvZGUgY2xlYW51cD8NCg0KVGhh
bmtzLA0KTWluYXMNCg==
