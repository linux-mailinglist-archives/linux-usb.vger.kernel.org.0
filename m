Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276A9213594
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 09:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgGCH5v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 03:57:51 -0400
Received: from mail-bn8nam12on2047.outbound.protection.outlook.com ([40.107.237.47]:6019
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725764AbgGCH5u (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 03:57:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHjX4Qv1AVqVV7PzLWsnan+V2hWNTl1Fd4C/LhCiVq4Y/taX+6zDuaNVpfq+5FQrUGlPJNLkvqNg41LsdIXNNkoUIr04uG16R5HqIytI16N5tIYX7sK6T3GJOuJAhVSYDjbAKWCvRhLHCe44gHOI1F6VJW3zWMgwgyOEi2uXR6qw0hLWQlp5aZE6LzsKpAU2bUTsjqGKSNIb7eNMO8iYsRiT0ArgSfwBY8Y+4vIEici0uNjv06OkofZaS8rrpEOTFr4HQTWGL2ltsY9VDeqCO7p8yEJBP8gMNKje6+bMp4AH1MuUuDJBCGjV0hIdGHf7O3rbdRYZ8cn6EwWrItfJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DPhrrUkz2O53jLhy1+usxMV9kTzCM8ydw6UxBD22eo=;
 b=BPWuAIqilAWkoc99bKazSLG8mmSbPKXuQWu4vqLD9GiRE9xdA2oI/408ViP9gAXsC74fssBDZolTzuPe+x5frA08oTg0CUE0mIJg7RXKvhOOMliE9TSPs69qe4dENEaSaLvsYXae6u4n5hEN/uKM5I2SjLapPU6tCJ8488mXp961Z9VNEfqkrQOvCFXFe2f9dzaZPmS1iSG0NW8Zjtb1ZMP9nPynHv11kvSOKlHi1JoQScRbIv+vrx8waf0ByJrPi3cNox0oMgZIfKoAjkD6TmPDPflRTbgDcOpGGYOxR0nT4ccyWpYasbAFB0O/3AlxtNTFUYKyi4iUy2/RU27L6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DPhrrUkz2O53jLhy1+usxMV9kTzCM8ydw6UxBD22eo=;
 b=E+DoyZV0Xd8c0Ky+CqAK4Lsy5tEVawuXdUpbmZfPYqla13iM9MpJAZbBn/BTy1pmXK8QaJCUORQYWuIdZ7VjIHLPNt0xPi9uk1a/nIKSPr9zPAKqXSTx0FJcTOSjj9RGJ2/DjPYO7mLbgc65PcxHPYbu216hLtMiAACTYjagsLE=
Received: from BYAPR02MB4933.namprd02.prod.outlook.com (2603:10b6:a03:44::20)
 by BYAPR02MB4295.namprd02.prod.outlook.com (2603:10b6:a03:16::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 3 Jul
 2020 07:57:46 +0000
Received: from BYAPR02MB4933.namprd02.prod.outlook.com
 ([fe80::781e:8084:cc7e:f1ea]) by BYAPR02MB4933.namprd02.prod.outlook.com
 ([fe80::781e:8084:cc7e:f1ea%4]) with mapi id 15.20.3153.024; Fri, 3 Jul 2020
 07:57:46 +0000
From:   Anurag Kumar Vulisha <anuragku@xilinx.com>
To:     John Stultz <john.stultz@linaro.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Yang Fei <fei.yang@intel.com>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Jun Li <lijun.kernel@gmail.com>
Subject: RE: dwc3 inconsistent gadget connection state?
Thread-Topic: dwc3 inconsistent gadget connection state?
Thread-Index: AQHWULoCcOrSgSVXz0+SL4IzylPtc6j1YWEAgAAUFoA=
Date:   Fri, 3 Jul 2020 07:57:45 +0000
Message-ID: <BYAPR02MB4933A269D7CFAF7AC540CCC7A76A0@BYAPR02MB4933.namprd02.prod.outlook.com>
References: <CALAqxLWAvvHGo1RYef1fJ_k65WqHAPCDhLfehO6_j_f8E2jB7Q@mail.gmail.com>
 <CALAqxLXjByaYaNweqGiSyArJ=1J-D7bSm+sndCtH_wf7h2avTA@mail.gmail.com>
In-Reply-To: <CALAqxLXjByaYaNweqGiSyArJ=1J-D7bSm+sndCtH_wf7h2avTA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6301a993-6ac5-4fe0-f7ac-08d81f26c5d3
x-ms-traffictypediagnostic: BYAPR02MB4295:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB429546BA44FF99F910BFACA0A76A0@BYAPR02MB4295.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d0d/g9NYIU38zq1AnHDVOd76e0Di9eFwKDJsvwAk3R4ir1wAtbMoB3MHCZSJpwmNjNeN5goIjkwqI6FmG3tMR+2iDTuVzgF8acpOPCdRp+6muvWz7fsNc5kB9SIAp0VYB+TwAcWbtAbFZeIF6dce4EoGo/90XB6s/daW1ujtgOBhTYjlXC4teAFNcjEiEVgW4sMtgRppunx4gZwZyL7icbsITSoJc1MYEhAeuxMi2RXA+yktSbXbXPi+Y+ks47LfPFl7UL+3ObflcMgMKRiDuN3t3sTvImuR+54TkybPxmZ288ioclX1LL47M0vSAoVC6NhV94IIe5GlqLPlbdvHgA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4933.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(136003)(376002)(346002)(396003)(366004)(66946007)(4326008)(66476007)(76116006)(5660300002)(52536014)(9686003)(66446008)(64756008)(110136005)(54906003)(66556008)(316002)(186003)(7696005)(6506007)(71200400001)(86362001)(478600001)(8676002)(55016002)(2906002)(33656002)(83380400001)(8936002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: xBmeNIsY7o1qXYoacwTzsMQSd/GUIAFaciBahmZp8rIzZeTdpb7MrRg/G0OwY3lzxxl5w394AoU5I6cJ+f03AhUDm06a7gP2qXWQaPCCgCzBRf/2KdlYkuodsggwjgopPdFFiRs5b0o++Sh3D64jhrJ0IdIbzh3egHXKwPOwjh1O8BEqIfg1KKHccQ8D6UqYA8LKe0qct8cqYN1ciqdgQN3yOzuzPE6/bXCNLlzGcQ5oSqPdo6uPhmVQpk2iwXjk5QGeZRgAuukOrov8agmiSBrlgsDCRg2tt6wxDRxAFx8WNyz7H5Q4mMdN89rCAFlqgixO4m8ArvV6LKvqCxU2ZhvvvnYe6hJ5BrWWI5pCRY92neCSBAkWKPMacjoIy5OAVxJFV0kTE2hqRJ0UDXs+y7no7qLTJ0ZdDxD53h1i9ESQEZYfnB7nbDyXC+jywCQGvLsqcM9T/o66M/ZQgue6KvNhJpPzFU50/eYhjbIqkkldqefw7LbUHTZyYJHAPdy6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4933.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6301a993-6ac5-4fe0-f7ac-08d81f26c5d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 07:57:46.0127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B57UDumsyEN8RiB5RpGe+re4g6JWQBhFCEN6A8gfw9rWKldvvGdCHhDvio8Rj3oka/ItiZXXeI/cCgCljLNyYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4295
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgSm9obiwNCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSm9obiBTdHVs
dHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+DQo+U2VudDogRnJpZGF5LCBKdWx5IDMsIDIwMjAg
MTE6NDYgQU0NCj5UbzogRmVsaXBlIEJhbGJpIDxiYWxiaUBrZXJuZWwub3JnPg0KPkNjOiBUZWph
cyBKb2dsZWthciA8dGVqYXMuam9nbGVrYXJAc3lub3BzeXMuY29tPjsgWWFuZyBGZWkNCj48ZmVp
LnlhbmdAaW50ZWwuY29tPjsgQW51cmFnIEt1bWFyIFZ1bGlzaGEgPGFudXJhZ2t1QHhpbGlueC5j
b20+Ow0KPllvbmdRaW4gTGl1IDx5b25ncWluLmxpdUBsaW5hcm8ub3JnPjsgQW5kcnplaiBQaWV0
cmFzaWV3aWN6DQo+PGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPjsgVGhpbmggTmd1eWVuIDx0aGlu
aG5Ac3lub3BzeXMuY29tPjsgTGludXgNCj5VU0IgTGlzdCA8bGludXgtdXNiQHZnZXIua2VybmVs
Lm9yZz47IEp1biBMaSA8bGlqdW4ua2VybmVsQGdtYWlsLmNvbT4NCj5TdWJqZWN0OiBSZTogZHdj
MyBpbmNvbnNpc3RlbnQgZ2FkZ2V0IGNvbm5lY3Rpb24gc3RhdGU/DQo+DQo+T24gVGh1LCBKdWwg
MiwgMjAyMCBhdCAyOjQ0IFBNIEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPiB3
cm90ZToNCj4+DQo+PiAgIEkndmUgYmVlbiB0cmlwcGluZyBvdmVyIGFuIGlzc3VlIG9uIG15IEhp
S2V5OTYwIHdoZXJlIHdpdGggdGhlIHVzYi1jDQo+PiBnYWRnZXQgY2FibGUgY29ubmVjdGVkLCB0
aGUgZ2FkZ2V0IGNvZGUgZG9lc24ndCBjb25zaXN0ZW50bHkgc2VlbSB0bw0KPj4gaW5pdGlhbGl6
ZSBwcm9wZXJseS4gSSBoYWQgcmFyZWx5IHNlZW4gdGhpcyBiZWhhdmlvciBwcmV2aW91c2x5LCBi
dXQNCj4+IG1vcmUgcmVjZW50bHkgaXQgaGFzIGJlY29tZSBtb3JlIGZyZXF1ZW50IGFuZCBhbm5v
eWluZy4NCj4+DQo+PiBVc3VhbGx5LCB1bnBsdWdnaW5nIGFuZCByZXBsdWdnaW5nIHRoZSBVU0It
QyBjYWJsZSB3b3VsZCBnZXQgdGhpbmdzDQo+PiB3b3JraW5nIGFnYWluIChidXQgdGhhdCdzIG5v
dCBoZWxwZnVsIGluIHRlc3QgbGFicykuDQo+Pg0KPj4gSSBhbm5vdGF0ZWQgYSBidW5jaCBvZiBj
b2RlIHRyeWluZyB0byB1bmRlcnN0YW5kIHdoYXQgd2FzIGdvaW5nIG9uIGFuZA0KPj4gSSBuYXJy
b3dlZCBkb3duIHRoZSBkaWZmZXJlbmNlIGluIHRoZSBnb29kIGFuZCBiYWQgY2FzZSB0byBhIGR3
YzMNCj4+IHJlc2V0IGludGVycnVwdHMgaGFwcGVuaW5nIGFmdGVyIHVzYl9nYWRnZXRfcHJvYmVf
ZHJpdmVyKCkgY29tcGxldGVzLg0KPj4gSW4gdGhlIGdvb2QgY2FzZSwgd2Ugc2VlIHRoZSByZXNl
dCBpbnRlcnJ1cHRzLCBhbmQgaW4gdGhlIGZhaWxlZCBjYXNlDQo+PiB3ZSBkb24ndC4NCj4NCj5T
byBJJ3ZlIGtlcHQgZGlnZ2luZyBhcm91bmQgb24gdGhpcywgYW5kIHN0YXJ0ZWQgZHVtcGluZyBy
ZWdpc3RlcnMgYXQgdGhlIGVuZA0KPm9mIGR3YzNfZ2FkZ2V0X3N0YXJ0KCkgYW5kIHRoZW4gZHdj
M19nYWRnZXRfcHVsbHVwKCkgYXMgdGhhdCBzdGlsbCBpcyBjYWxsZWQNCj5zaG9ydGx5IGFmdGVy
IGluIGJvdGggY2FzZXMuDQo+DQo+VGhlIG9uZSBjb25zaXN0ZW50IGRpZmZlcmVuY2UgYmV0d2Vl
biB0aGUgd29ya2luZyBhbmQgbm90IHdvcmtpbmcgY2FzZSBJDQo+c2F3IHdhcyB0aGUgRFdDM19E
U1RTX0NPUkVJRExFIGJpdCBpbiB0aGUgRFdDM19EU1RTIHJlZ2lzdGVyLg0KPg0KPkl0IHNlZW1z
IHdoZW4gd2UgZ2V0IHRvIGdhZGdldF9zdGFydCgpL3B1bGx1cCgpIGlmIHRoZSBEU1RTX0NPUkVJ
RExFIGJpdA0KPmlzbid0IG9uIHdlIHdvbid0IGdldCB0aGUgcmVzZXQgaXJxLg0KPg0KPkkgYWRk
ZWQgYSBzaW1wbGUgdGltZW91dCBsb29wIHRvIHB1bGx1cCgpIHNpbWlsYXIgdG8gdGhlIERTVFNf
REVWQ1RSTEhMVA0KPmxvb3AsIGJ1dCBpbiB0aGUgZmFpbHVyZSBtb2RlIGl0IGFsd2F5cyB0aW1l
cyBvdXQgd2l0aCBDT1JFSURMRSBub3QgYmVpbmcgc2V0Lg0KPg0KPlNlYXJjaGluZyBhcm91bmQg
aGFzbid0IHByb3ZpZGVkIGFueSBpbmZvIG9uIHdoYXQgQ09SRUlETEUgYWN0dWFsbHkgbWVhbnMs
DQo+c28gSSdtIGEgYml0IGluIHRoZSBkYXJrLiAgQW55IGNsdWVzPw0KPg0KRFNUUy5Db3JlSWRs
ZSBiaXQgaW5kaWNhdGVzIHRoYXQgdGhlIGNvcmUgcHJvY2Vzc2VkIGFsbCB0aGUgUlhGSUZPIGRh
dGEsIHVwZGF0ZWQgdGhlDQpEZXNjcmlwdG9ycyBhbmQgaXMgaW4gaWRsZSBzdGF0ZS4NCkZyb20g
eW91ciBwcmV2aW91cyBtYWlsIEkgdW5kZXJzdG9vZCB0aGF0IHRoZSBVU0ItQyBjb25uZWN0aW9u
IGlzIGNvbmZpZ3VyZWQgZm9yDQpVU0IgMi4wIG9ubHkuIFNpbmNlIHlvdSBhcmUgZmFjaW5nIGlz
c3VlIHdpdGggcmVzZXQsIGNhbiB1IHBsZWFzZSB0cnkgc2V0dGluZyB0aGUNClVTQjJQSFlDRkcu
IFhDVlJETFkgYml0LiBFbmFibGluZyB0aGlzIGJpdCBhZGRzIGFuIGV4dHJhIDIuNXVzIGRlbGF5
IGFmdGVyIHRoZQ0KY29udHJvbGxlciBzZW5kaW5nIGNvbW1hbmQgdG8gY29uZmlndXJlIHRoZSBV
TFBJIHRyYW5zY2VpdmVyIHRvIEhTIG1vZGUgYW5kDQpjb250cm9sbGVyIGRyaXZpbmcgVHhWYWxp
ZCB0byAwLCAgZm9yIHNlbmRpbmcgYSBIUyBjaGlycCBzaWduYWwuIFBsZWFzZSBjaGVjayBpZiB0
aGlzDQp3b3JrYXJvdW5kIHdvcmtzIGZvciB5b3UuDQoNClRoYW5rcywNCkFudXJhZyBLdW1hciBW
dWxpc2hhDQoNCg==
