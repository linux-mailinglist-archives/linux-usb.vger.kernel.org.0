Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4E6B1E1175
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 17:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391039AbgEYPPX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 11:15:23 -0400
Received: from mail-bn7nam10on2076.outbound.protection.outlook.com ([40.107.92.76]:6041
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390911AbgEYPPW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 May 2020 11:15:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSMq48SPDuF44Vg/8to/jAPcRVJlsE6Ui21/qdA7eQeDBDzZ42Jpk6LQ3GU0JpZ0TI8U+yBd1Tf9mp0PO/y+x/bxcK/uFzMukI9McvfjEhRnhVZqRZbsAePGkXXwW7XjT96+raU7aUfVt8qqA4/ALl4BsidLpnthkwRqCqfp7LanDx4bCuGejZkwRrWnKo9WFwKVQoWJD0mxQeZV1XosNYVjkcPL4KmMC3Kckn7EloP1aELo9sMPvmBv0cn6nnFEsyqVpVJG9JleSzcYTU+Zd5KYfO7xtQHDRGArrkYZ5vb86sVTj1du7usxvohxzBxOWhD7Sezh4k7vF4l21qgLww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlmcuCQsiI8Z1M+cmFxZ1nAr5k8jnFIhwprSDzAWBJU=;
 b=jS70wW/2nxERJHnbuy55tG5AWBizOkjg6OzLvicfF19aTqanY7iCl5OYTE1pH8B1VNB3gznQ5kI2HtcLCQ5WgG/KnmnveWGmPp9+EaxU/3UKWoTzax5LzHVXI+l2EYmeFnHENR4ugIHM5LTGBs3gEtsxHUrmJCxc1udUqbrmrQ3kLv/bKPRd1TOEwmY23ry9iE+CWoM4iPLujqdHA4SHMRFk6lTz9sXGKVk67kys72oTnZMv20JmlvusMucDN9BwojWA04qrFnZ0xpKrxsM39WypDty0utY4YL4cpL73GRAjH3zXLT6OszoKhAIk1FuML/Az7ErFw3n3S5c16c1oeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlmcuCQsiI8Z1M+cmFxZ1nAr5k8jnFIhwprSDzAWBJU=;
 b=MBf3A5LxE0aUR7pWSfsFqGJ8ZN/IIUVlaFaQyjRoL+vMpU1j1ZNNDqTme0fYxJ19s2R26FtnQIydHchptHmu5hXC/9ldCZh9UWEkxIRnPALkxqpOr1tkKv27n2X3UhDpiX7vk1B9BZY2uWoF0zLVesRbpotl/PiqjiwnIr0C+lI=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3378.namprd10.prod.outlook.com (2603:10b6:408:ca::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Mon, 25 May
 2020 15:15:20 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 15:15:20 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Topic: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Index: AQHWMqM6W5iP9Jkv9UCEGIiDuBaJw6i45d+AgAADdIA=
Date:   Mon, 25 May 2020 15:15:20 +0000
Message-ID: <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
In-Reply-To: <1590418977.2838.16.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f80289ec-e140-42f5-30b1-08d800be708b
x-ms-traffictypediagnostic: BN8PR10MB3378:
x-microsoft-antispam-prvs: <BN8PR10MB33784D6C77BAFFA8FA15DE0BF4B30@BN8PR10MB3378.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9qEn2ZPKb9Lbf7XfgiZCYFdbH6InVPegVWS35kf2bgXqDq3EmClnIRbKrK0SrJU0u/59LRshEP/4Bu5zfID9IsnSHgTkSBqt1rABIw4micmdzJR6Uo8OOMCb5Xf+l0SeHpSQFZ9yiXLBWIj9vB01UwHGyxyReu/uIMT2rjtHewDwofdXmRWpap9M+kB7JM1ZtUFaWe1+ZGlM9aB6SRO/1y+rPqZuWPOKm0iFyZtW491C6whQUlHmVAHBK+9b5dJHu8SRjLorFsa1pdWkgmcyKu1q6i92UTxkFv4+iPmutjr+NGpudf4IRQfltSMk8qOY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(6512007)(71200400001)(6486002)(5660300002)(2616005)(36756003)(66556008)(6506007)(64756008)(66446008)(66946007)(86362001)(26005)(66476007)(110136005)(186003)(2906002)(8936002)(478600001)(91956017)(8676002)(316002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: kmwP8gefNSYuv/ZXziYX3q7gRkHsNLu4C9XMZS/3yVzMSQh3+DGEQyDd1R5le22oMt4iDplqRsevqUHH95b/Paktg9aFeigrtdmFArsmeFHwKjsOjTqNaY7aT4SngiZKk+iPP3iO+k9C9XorobG9phWW8/0LBayxICDel2mpnXOykb8031GSqizkikkMqwJFNRCHeukbRdr/ejNsQ1cW2ynvU4/F2dtTA9byde1rNBkKfRxl2KuONPo95lnmKyAR4NG9yhs2lwXie1I6hy7B3+hq8wkQfMFs0zgUp8uKX0QCBPnsr9tvKof87MwGuQXHzH/qadcgcwU5QYJ6Gn6JvwoyaJH7wUqRoFbdyBpIU3xqF2Tku7zecVpw10VNq2kQSDXGDdg+G6sfhS/4WpksPkyVoJOLNkeZ4YmD5alx3D8e1p33+mKoLNwUjv9bhTyo1NjgTp2rpTa7zrM3SibbuK+ok2l63iKXX9JJ+43imYWExMrc3D44BuZOa7eaa4bQ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DB69A240D6A334EBB1ED70D3CEC3D0E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80289ec-e140-42f5-30b1-08d800be708b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 15:15:20.4521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DrGW3mAXImqVQisecdkCHETIuXRJcsBkC2abkq1KlnwUzKLuE2tiFYr76W4eanuCraN/D54TQv3rsYLt1dcBmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3378
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCAyMDIwLTA1LTI1IGF0IDE3OjAyICswMjAwLCBPbGl2ZXIgTmV1a3VtIHdyb3RlOg0K
PiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdh
bml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4g
DQo+IA0KPiBBbSBNb250YWcsIGRlbiAyNS4wNS4yMDIwLCAxNDo0NiArMDAwMCBzY2hyaWViIEpv
YWtpbSBUamVybmx1bmQ6DQo+IA0KPiA+IFRoaXMgKEVNST8pIGRpc2Nvbm5lY3QgY2F1c2VzIDIg
dGhpbmdzLg0KPiA+IDEpIEkgbG9vc2UgdGhlIFRUWSB0ZW1wb3JhcmlseSBhbmQgaGF2ZSB0byBy
ZWNvbm5lY3QuDQo+IA0KPiBVbmZvcnR1bmF0ZWx5IEkgc2VlIG5vIHdheSB0byByZWVzdGFibGlz
aCBjb250YWN0IHRyYW5zcGFyYW50bHkNCj4gb24gdGhlIGxldmVsIG9mIHRoZSBkcml2ZXIuDQo+
IA0KPiA+IDIpIEFmdGVyIHJlY29ubmVjdCB0aGVyZSBhcmUgZ2FyYmFnZSBjaGFycyBvbiB0aGUg
Z2FkZ2V0IHNpZGUsIHN1Y2ggYXM6DQo+ID4gICAgICBo77+9XkBeQO+/vSBeQF5A77+9IF5ADQo+
IA0KPiBUaGlzIGxvb2tzIGxpa2UgTU0gaXMgYWN0aW5nIHVwIGluIHVzZXIgc3BhY2UuDQo+IA0K
PiA+ICAgIG9yDQo+ID4gICAgICBY77+977+977+9KUjvv73vv700xJ5e77+977+977+9DQo+ID4g
ICAgd2hpY2ggY2F1c2VzIGNvbmZ1c2lvbiBvbiBmb3IgdGhlIHR0eS9iYXNoIG9uIHRoZSBnYWRn
ZXQuDQo+ID4gDQo+ID4gVGhlIGRpc2Nvbm5lY3QgaXMgbW9zdGx5IGp1c3QgYW5ub3lpbmcgYnV0
IHRoZSBnYXJiYWdlIGNoYXJzIGFyZSBhIG1ham9yIHBhaW4sIG9uZSBjYW5ub3QgdHJ1c3QNCj4g
PiB0aGF0IGNtZHMgYXJlIHVuZGVyc3RvZC4gSXMgdGhlcmUgYSBidWcgaW4gdHR5QUNNIGRyaXZl
ciBjYXVzaW5nIHRoZXNlPw0KPiANCj4gSGksDQo+IA0KPiB0aGFua3MgZm9yIHRoZSBidWcgcmVw
b3J0LiBUaGUgbW9zdCBsaWtlbHkgY2F1c2Ugb2YgeW91ciBwcm9ibGVtIGlzDQo+IE1vZGVtTWFu
YWdlciBwcm9iaW5nIHRoZSBuZXcgZGV2aWNlLiBJdCBoYXMgYSBibGFja2xpc3QuDQoNCg0KTm8s
IEkgaGF2ZSBhbHJlYWR5IGJsYWNrbGlzdGVkIHRoaXMgZGV2aWNlIGZyb20gbW9kZW1tYW5nZXIs
IGlzIGJsYWNrbGlzdCBub3QgcmVsaWFibGUgaW4gdGhpcyBjYXNlPw0KDQogSm9ja2UNCg0K
