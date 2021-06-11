Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADE63A398C
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 04:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhFKCN3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 22:13:29 -0400
Received: from mail-eopbgr40041.outbound.protection.outlook.com ([40.107.4.41]:25478
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230168AbhFKCN3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Jun 2021 22:13:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLRIP3YbFA8pEIIUGQ/45v8qB2HNw1/62O0LJIJZLwAmxUhbQWPhm3o2jwFkkEj5IwhF2n73Hm4brXgJO2YsWsDutBCkmO9LXxPav08hOtdxpax3mGRjCmZmitO3sTWxL8sNlFfhn5Itn0FtUYYaxTOl+OM8ACnrtutRT76BRAZWI0fkjR1phME9zeVPL7wcpA/FcMMEXPqLr86HP0qMF61nlVkY5Yl3egBEh6tUhN+gwJl0bPiztZN9bkp7sg4NSDoD/5QG+otinI5BVrXEN08TSqsxOS6sdv9UzPKAan8WlkFLqS+Ko9aUu0Wz9oKBk3D7F2/MBOJRQ9lhze0cgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWZTm6xwCaan562H0MHcjU6ymF9y6BGc8XDvyS4w4mI=;
 b=NGu2/C+vwtxJE/+KysyBFKYhAGkyiC6gVTwpy/Kr78ASOUdgYX76Swrp3VxCad0kmqWtB5fdnYaslHD6Cy+NWQ0tnuSFCRD7AcWYkuEyW6k8cEv9/2kTh7o6SPDfTfO5xW0igrwYqEVCvMz/avkLX4IdvsCeY/vwgE0GB5VNRWesjvRUVXOpZ7ij2sBIvdZYvMA+ivYMNQ88gwAwTxg7gHBwEqHpuJxZLWZdQ0sOjJXEgQXGM8O4f3BCA/RDKsjNK6HVpSPM652gjld8rS5jZHvEprmSGNcg77zdjZiIrLYsJq2h+UVehJNFVDrUqX/n40NyfDogawwNS5xuYl3JFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWZTm6xwCaan562H0MHcjU6ymF9y6BGc8XDvyS4w4mI=;
 b=LgvEbAtPhTIBCl0yLqYMetdD689uwg1MPqDNpsnRHYjfPwc2KtkR3Wzoo7dMY1itNiqUXtZo2uVXP26ECJm+pvarWDOxeJNd1tq29Bp3cTAwdQ4e+AoeVJqmkz27L+eusSGtHZN5BaF2G5atc+U7MtlVGKtg4vU1qsqR7S72LhI=
Received: from VI1PR04MB4478.eurprd04.prod.outlook.com (2603:10a6:803:67::30)
 by VI1PR04MB4991.eurprd04.prod.outlook.com (2603:10a6:803:57::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Fri, 11 Jun
 2021 02:11:27 +0000
Received: from VI1PR04MB4478.eurprd04.prod.outlook.com
 ([fe80::f1f8:ff94:2b66:8429]) by VI1PR04MB4478.eurprd04.prod.outlook.com
 ([fe80::f1f8:ff94:2b66:8429%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 02:11:27 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     Joel Stanley <joel@jms.id.au>, Fabio Estevam <festevam@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
        Felipe Balbi <balbi@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ran Wang <ran.wang_1@nxp.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2] usb: gadget: fsl: Re-enable driver for ARM SoCs
Thread-Topic: [PATCH v2] usb: gadget: fsl: Re-enable driver for ARM SoCs
Thread-Index: AQHXXmWxUlhnrLKROEeZfunAocwRLqsOEBRg
Date:   Fri, 11 Jun 2021 02:11:27 +0000
Message-ID: <VI1PR04MB447897CA4041F8B38AB761B68F349@VI1PR04MB4478.eurprd04.prod.outlook.com>
References: <20210610034957.93376-1-joel@jms.id.au>
 <CACPK8XegSCS074LJvpO2gOpvpDO_hgWORX4FNcxGe7j9xrGS8w@mail.gmail.com>
In-Reply-To: <CACPK8XegSCS074LJvpO2gOpvpDO_hgWORX4FNcxGe7j9xrGS8w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [136.49.83.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9bdb186-64d0-4d36-1eb9-08d92c7e385b
x-ms-traffictypediagnostic: VI1PR04MB4991:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4991DEB71ECC3C033672B7208F349@VI1PR04MB4991.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GMZYmwy30tOj7Yt1b5A4JZe5SBNnwav4IAIAF6euCRBCx2EblyZMeequMEYvakB1OgCA5QbmlXV6MatV8fD/vpFMJd31sHL7Tz/ZV5XPZv+9o2ecQiDbl3jwzhTZ9vYTBKMT+H6JWsEbzJU1NOjv61QNS5WKII7qJs4EYzVsIzhTtIQq/l3IJOMM2YJfXR+YBrfDpu/RttwownOdDN/8AAPE3F6QFSz5omTgRZa3CmZjFLvQSBcg2gXwmudIlrJPM0d8LMdwnTTBMMkmeDkl3J3+VbYx9XInet/1ydtKld6OtNbQU2ZNZfx3CHcx/UH8SAFJOBwJoqI/1nBpjFFdJkwq6NNVOlkYzDrsbugfK8IprMtXZRM7Vttkog19IoBw6+H7eg9SO0hwPJufANmoUbi2kXL784AG8OxrLnR7OoZQwDj1LurIoZ36RFBQ4Y4mKpHwwjwdW4MQ+5Mg+gJSuGV9u3oPX8QgH2Di6gPOdcRsCZdvI+Eye5jS8CjNkjSjfLbS7jWJHR3deAM0e6JiVsFfAHIFTqT7CpkvhcniY3maObXVyUrUDUyQQQmJwWVQz2ipW/H92lmkR6YxgGzddjmJgbHtMGRGLQeouBZAeG8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4478.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(71200400001)(64756008)(54906003)(52536014)(186003)(2906002)(478600001)(83380400001)(53546011)(26005)(7696005)(316002)(6506007)(86362001)(66556008)(122000001)(8676002)(33656002)(8936002)(66446008)(9686003)(55016002)(5660300002)(6636002)(76116006)(66946007)(4326008)(66476007)(110136005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHdwTktOTlZDcncreUpRRjBVeUhTd29kR0R6UlI1elljTEZxbWF6dWJ2Skdo?=
 =?utf-8?B?ZmNpVkhlOHVoSjRaMzdLT3BrVitDWUt0YTRybWYwRUNFUUxwUmtmdUJScUFv?=
 =?utf-8?B?WDgwdTkrMEdDS1g5VUlKZm0yK3hDZUtITUJwNlBza25IRFNpU1RWTUNYOS9j?=
 =?utf-8?B?RkRETEQ5ZWYvcWRGQjZiWVdQUDN0OVlHWmxYSWpkdzRnMmhwdkNkSmNFVURB?=
 =?utf-8?B?R2tsSG5yVjNlaUlHa2hOWnd2SU1TbENOY0pSVlk1dUh5TkVKdnRyNVFHWCtW?=
 =?utf-8?B?Sk1lNlFWSlhWQVJVRDA2TFZOTitYM2xGZmVhL2M2RFMzMk1ITTR3Sk43dmFk?=
 =?utf-8?B?QVFicWVMaTNPY3U2YUdYU254VHB2em1jQ1RGaEtFanMrOTlEVm1NSWxPSmJN?=
 =?utf-8?B?UWpKbFVHamF4UmQvMjFFaC9IWUxXVEg3dUEzQjNKR2ZHcFI2MFpDN0FjSjJZ?=
 =?utf-8?B?MGZmOW16cGh0K25nT1krZmJ5QXdzOTVUd1BmbVRpYjNjSFdMZW50ZDRVNkly?=
 =?utf-8?B?YUdwRm9lS0NHSG5nNjdpVTh4OXlRMVRadm84dU5VOWp5WnRBelFkaUl1cC9U?=
 =?utf-8?B?TEpBN2tYQUxjUGhIRC9tdXlUcXpMaG9PTHpDUXZzY2IycHlzYStFTVltSTdS?=
 =?utf-8?B?bVh1U0p4VktLT2tET3Z6NU9WRDdLbWdUbXRiSEZFQTFvTnN1TlVNUW9ZaS9m?=
 =?utf-8?B?SE03alJ6TjhrQ0hSQ2ErUjBNNTBvU1ZuKytxOWdTTVpsNkVNMjRoamZ2OFlW?=
 =?utf-8?B?OW9odFRaYjJyTHR0bm5aWCtQMDcyTHphZkV3MVYzL0V5WXhMU1BoaHN0cmpK?=
 =?utf-8?B?S3puVUQvVlNtR0E0MzN6ZHBpei9kcWhSUVpRdzBia09VMGJGYzd6NTZlTkxU?=
 =?utf-8?B?ZUV2ek43SXpoSjZkYXhZUis5Q2FrUitSTHN0bUNQaEYxU25Pem1qekEvQWEv?=
 =?utf-8?B?T0huVTJnMHJpOUpYMDhEK0VsSHdxWFNZU0p1ZUZWZkQwRFlDMGtqY09yVnU3?=
 =?utf-8?B?U1ptZ0VqeGI4WXhtdmVyWGpHQnR6eG9QeU1wcnNzTHY0SFpHLzB2a1I4TjBr?=
 =?utf-8?B?UTQ5UjE0eSt5akRIYWVvSkZJR0syZVZxOGJldEtOL3huQ25ZcFJ2L2gwbzht?=
 =?utf-8?B?K3QwVFUycXJUelRPeGlzZGV0UWRFZnY5L0paeWh3YS9MRnp1SW5jN3YrTjZm?=
 =?utf-8?B?ZmVma1A2N2liYnU0N3VPTlRGNjg4a3VGeHpBSm1kN1MyaE1ab3lUTk8vK0sy?=
 =?utf-8?B?VHFPWU1vYm1DcmpjOEtKeVppbFZjT3oxakFiUnB2bWk3UnZ0S3JCMitMUFV6?=
 =?utf-8?B?SnZzNm1PclZKa0xKTWdyeDE3Tkt0Y2NXYVNRbU80RzlvY2lFQStST1lDeE9k?=
 =?utf-8?B?WXNqMDN6eVdpVHp0czgyZmYvMGJFOWRvTzlCT3FMZUFtTGxvV095TXVXZmJr?=
 =?utf-8?B?cUgrenNpZTUyRGZhSVJLT3hHSnByRGYzR0huejFGSEdpR2Jrb3NtV0RHN0Yv?=
 =?utf-8?B?cFRneGYxWVhVbk5mKzdseFZTTHFQeTJCdy9sSklxOFd4QjJkUXRnaGxhd3Yy?=
 =?utf-8?B?cWFkREcvT1dVcC82c005SVg0TGlycHA4MkwvUTk3aTBIY1dVUlFBWlhaZDli?=
 =?utf-8?B?OXBmaU9kV2dPalhIN3hpWmg5S1JDaFZrYzFaMEUzNWY5eGVtWC9xTWQyT3h5?=
 =?utf-8?B?QmRLZXl4M3NUb0NOQzdjYmxVa0xxZS9WTXJzZlFPL3lvTXRSa2VEa0RTd3hi?=
 =?utf-8?Q?2nr9BPDnFBfWfI5RMhzzJw3EQ24AHwf2MTILoH4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4478.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9bdb186-64d0-4d36-1eb9-08d92c7e385b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 02:11:27.1943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wU7D/shuRcMRnxA0IKMdioa40jSynIYKBJhyf0BeSnxCQSP+F19prj7WoSpjVH2jAg5/i5it0/uitGzWqhpsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4991
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9lbCBTdGFubGV5IDxq
b2VsQGptcy5pZC5hdT4NCj4gU2VudDogVGh1cnNkYXksIEp1bmUgMTAsIDIwMjEgOTowMSBQTQ0K
PiBUbzogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsgUGV0ZXIgQ2hlbg0KPiA8
cGV0ZXIuY2hlbkBueHAuY29tPjsgQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT47IEZlbGlw
ZSBCYWxiaQ0KPiA8YmFsYmlAa2VybmVsLm9yZz47IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVs
Lm9yZz47IExlbyBMaQ0KPiA8bGVveWFuZy5saUBueHAuY29tPjsgZGwtbGludXgtaW14IDxsaW51
eC1pbXhAbnhwLmNvbT47IFN0ZXBoZW4NCj4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1
Pg0KPiBDYzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgTGludXggQVJNIDxsaW51eC1hcm0t
DQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYy
XSB1c2I6IGdhZGdldDogZnNsOiBSZS1lbmFibGUgZHJpdmVyIGZvciBBUk0gU29Dcw0KPiANCj4g
T24gVGh1LCAxMCBKdW4gMjAyMSBhdCAwMzo1MCwgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5h
dT4gd3JvdGU6DQo+ID4NCj4gPiBUaGUgY29tbWl0IGEzOTBiZWY3ZGIxZiAoInVzYjogZ2FkZ2V0
OiBmc2xfbXhjX3VkYzogUmVtb3ZlIHRoZQ0KPiA+IGRyaXZlciIpIGRyb3BwZWQgdGhlIEFSQ0hf
TVhDIGRlcGVuZGVuY3kgZnJvbSBVU0JfRlNMX1VTQjIsDQo+IGxlYXZpbmcgaXQNCj4gPiBkZXBl
bmRpbmcgc29sZWx5IG9uIEZTTF9TT0MuDQo+ID4NCj4gPiBGU0xfU09DIGlzIHBvd2VycGMgb25s
eTsgaXQgd2FzIGJyaWVmbHkgYXZhaWxhYmxlIG9uIEFSTSBpbiAyMDE0IGJ1dA0KPiA+IHdhcyBy
ZW1vdmVkIGJ5IGNvbW1pdCBjZmQwNzRhZDg2MDAgKCJBUk06IGlteDogdGVtcG9yYXJpbHkgcmVt
b3ZlDQo+ID4gQ09ORklHX1NPQ19GU0wgZnJvbSBMUzEwMjFBIikuIFRoZXJlZm9yZSB0aGUgZHJp
dmVyIGNhbiBubyBsb25nZXIgYmUNCj4gPiBlbmFibGVkIG9uIEFSTSBwbGF0Zm9ybXMuDQo+ID4N
Cj4gPiBUaGlzIGFwcGVhcnMgdG8gYmUgYSBtaXN0YWtlIGFzIGFybTY0J3MgQVJDSF9MQVlFUlND
QVBFIGFuZCBhcm0zMg0KPiA+IFNPQ19MUzEwMjFBIFNvQ3MgdXNlIHRoaXMgc3ltYm9sLiBJdCdz
IGVuYWJsZWQgaW4gdGhlc2UgZGVmY29uZmlnczoNCj4gPg0KPiA+IGFyY2gvYXJtL2NvbmZpZ3Mv
aW14X3Y2X3Y3X2RlZmNvbmZpZzpDT05GSUdfVVNCX0ZTTF9VU0IyPXkNCj4gPiBhcmNoL2FybS9j
b25maWdzL211bHRpX3Y3X2RlZmNvbmZpZzpDT05GSUdfVVNCX0ZTTF9VU0IyPXkNCj4gPiBhcmNo
L3Bvd2VycGMvY29uZmlncy9tZ2NvZ2VfZGVmY29uZmlnOkNPTkZJR19VU0JfRlNMX1VTQjI9eQ0K
PiA+IGFyY2gvcG93ZXJwYy9jb25maWdzL21wYzUxMnhfZGVmY29uZmlnOkNPTkZJR19VU0JfRlNM
X1VTQjI9eQ0KPiA+DQo+ID4gVG8gZml4LCBleHBhbmQgdGhlIGRlcGVuZGVuY2llcyBzbyBVU0Jf
RlNMX1VTQjIgY2FuIGJlIGVuYWJsZWQgb24gdGhlDQo+ID4gQVJNIHBsYXRmb3JtcywgYW5kIHdp
dGggQ09NUElMRV9URVNULg0KPiANCj4gVGhpcyBkaWRuJ3Qgd29yayBvdXQsIGFzIHRoZXJlJ3Mg
c29tZSBtaXNzaW5nIGNsb2NrIGluaXRpYWxpc2F0aW9uIGNhbGxzIHRoYXQgd2VyZQ0KPiByZW1v
dmVkIHdoZW4gZnNsX214Y191ZGMgd2FzIGRlbGV0ZWQ6DQo+IA0KPiBhcm0tbGludXgtZ251ZWFi
aS1sZDogZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9mc2xfdWRjX2NvcmUubzogaW4gZnVuY3Rpb24N
Cj4gYGZzbF91ZGNfcmVtb3ZlJzoNCj4gZnNsX3VkY19jb3JlLmM6KC50ZXh0KzB4Yzg4KTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgZnNsX3VkY19jbGtfcmVsZWFzZScNCj4gYXJtLWxpbnV4LWdu
dWVhYmktbGQ6IGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvZnNsX3VkY19jb3JlLm86IGluIGZ1bmN0
aW9uDQo+IGBmc2xfdWRjX3Byb2JlJzoNCj4gZnNsX3VkY19jb3JlLmM6KC50ZXh0KzB4MWM0NCk6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGZzbF91ZGNfY2xrX2luaXQnDQo+IGFybS1saW51eC1n
bnVlYWJpLWxkOiBmc2xfdWRjX2NvcmUuYzooLnRleHQrMHgxZGNjKTogdW5kZWZpbmVkIHJlZmVy
ZW5jZSB0bw0KPiBgZnNsX3VkY19jbGtfZmluYWxpemUnDQo+IGFybS1saW51eC1nbnVlYWJpLWxk
OiBmc2xfdWRjX2NvcmUuYzooLnRleHQrMHgxZmU4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0bw0K
PiBgZnNsX3VkY19jbGtfcmVsZWFzZScNCj4gDQo+IFdlIGNvdWxkIGFkZCB0aGVtIGJhY2ssIGJ1
dCBpdCdzIG5vdCBjbGVhciBpZiB0aGlzIGRyaXZlciBpcyBzdGlsbCBtYWludGFpbmVkLiBJJ20N
Cj4gbG9va2luZyB0byB0aGUgTlhQIHBlb3BsZSBmb3IgaW5wdXQgaGVyZS4NCg0KQWRkaW5nIFJh
biBXYW5nIHRvIHRoZSBsb29wLiAgSSB0aGluayB3ZSB3aWxsIG1haW50YWluIHRoZSBkcml2ZXIg
dG8ga2VlcCB0aGUgbGVnYWN5IHBsYXRmb3JtcyB3b3JraW5nIGJ1dCB3aWxsIG5vdCBhZGQgbmV3
IHVzZXJzIG9mIHRoaXMgZHJpdmVyLg0KDQo+IA0KPiBTdGVwaGVuIGhhcyBkcm9wcGVkIHRoZSBw
YXRjaCBmcm9tIHRvZGF5J3MgLW5leHQuIEkgc3VnZ2VzdCB3ZSBkcm9wIChvcg0KPiByZXZlcnQ/
KSB0aGlzIHBhdGNoIGZyb20gdGhlIFVTQiB0cmVlIHdoaWxlIGEgc29sdXRpb24gaXMgZm91bmQu
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBKb2VsDQo+IA0KPiA+DQo+ID4gRml4ZXM6IGEzOTBiZWY3
ZGIxZiAoInVzYjogZ2FkZ2V0OiBmc2xfbXhjX3VkYzogUmVtb3ZlIHRoZSBkcml2ZXIiKQ0KPiA+
IFNpZ25lZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQo+ID4gLS0tDQo+
ID4gdjI6IEZpeCBzcGVsbGluZyBvZiBBUkNIX0xBWUVSU0NBUEUNCj4gPiAtLS0NCj4gPiAgZHJp
dmVycy91c2IvZ2FkZ2V0L3VkYy9LY29uZmlnIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9nYWRnZXQvdWRjL0tjb25maWcNCj4gPiBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMv
S2NvbmZpZyBpbmRleCA4YzYxNGJiODZjNjYuLjczNDhhY2JkYzU2MA0KPiA+IDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMv
dXNiL2dhZGdldC91ZGMvS2NvbmZpZw0KPiA+IEBAIC05MCw3ICs5MCw3IEBAIGNvbmZpZyBVU0Jf
QkNNNjNYWF9VREMNCj4gPg0KPiA+ICBjb25maWcgVVNCX0ZTTF9VU0IyDQo+ID4gICAgICAgICB0
cmlzdGF0ZSAiRnJlZXNjYWxlIEhpZ2hzcGVlZCBVU0IgRFIgUGVyaXBoZXJhbCBDb250cm9sbGVy
Ig0KPiA+IC0gICAgICAgZGVwZW5kcyBvbiBGU0xfU09DDQo+ID4gKyAgICAgICBkZXBlbmRzIG9u
IEZTTF9TT0MgfHwgQVJDSF9MQVlFUlNDQVBFIHx8IFNPQ19MUzEwMjFBIHx8DQo+ID4gKyBDT01Q
SUxFX1RFU1QNCj4gPiAgICAgICAgIGhlbHANCj4gPiAgICAgICAgICAgIFNvbWUgb2YgRnJlZXNj
YWxlIFBvd2VyUEMgYW5kIGkuTVggcHJvY2Vzc29ycyBoYXZlIGEgSGlnaCBTcGVlZA0KPiA+ICAg
ICAgICAgICAgRHVhbC1Sb2xlKERSKSBVU0IgY29udHJvbGxlciwgd2hpY2ggc3VwcG9ydHMgZGV2
aWNlIG1vZGUuDQo+ID4gLS0NCj4gPiAyLjMwLjINCj4gPg0K
