Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0EC5211796
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 03:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgGBBMp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 21:12:45 -0400
Received: from mail-dm6nam10on2068.outbound.protection.outlook.com ([40.107.93.68]:6185
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726824AbgGBBMo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 21:12:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ao6wj3ukTS/QQJK0WCVFNimiYdThJdeblsHDBgE29eNxb7gaqkEuvOzX5yBNFVMNx/Ev2QcFzWCqHWUA3hMiI/ZG1PZW/jFJ4DuXATGyOgVVOsat8AUTb1IStsjPR9ypYs/xfZ/2TKxgvz1a3LsyUzpjONs2azX3PyQe8obwKp0P7g/J97pSt7idx4ott9Bbunw3pLwtCrP3rxjwr9HnEM9K/HTp9HL6DfsqThX2SKTMLiVTAsXMZ9fxMQ9YMjESI7WWuE549nBcG3TTktAyLZOyKvmCb3OVBp3lcr3cFvpfuM7fhz2dXUWyRqHe2B/helDaPV9aZ4m+OwheyusJ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dywRXzhKqcGOeI9OTdNgRd2p2a3zBwjPhS1GKPSnFQk=;
 b=Vx3pya7yAHlAAD+qzU8NOjPaT3H2K1o4t9R4GUuEbpW4XxIq3nIfd1GxE0dpSVJrlrRONUrBmGWgILoWxW6fzcE4iwY3t0a3sj43jnY7Fsb2nYGqIU0K9dJAhps4D1h7gwUyNf1Qxgzlc/uYGHE0N0hg6pAl9y/81FyMFgGiXPOJ3DyJZCn06XY5Vm9a//tpkqgpCan8su7wb/mOZf+HIBsnGEWN6AjOt8qyqjZ2vgHV1QFQ/ZAMjk5ExekLkXja3Y528mfb39+Ob2z7CXDzwrkg1IoQEmczs3JyRW3SImG3O4PnPgG8WXtJkRJCAcSvBg9E+RI+b1rgCep0rJKNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dywRXzhKqcGOeI9OTdNgRd2p2a3zBwjPhS1GKPSnFQk=;
 b=LCX0ZdaVIBPti/c3d92luZlbiGRNnzi4J7INIM8r1AkM6llbhqhYe2BRvsx8aIg/om0PbylfChaVi5kbGBj8LuDEEn/UEcqo06X9qH6HnZeQLFL8jgmQzItGAhqNl9Zt82FuYmc5O1hH6qDYHNeraQmJkLfXc8lwzpJYOoJj6UM=
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Thu, 2 Jul
 2020 01:12:42 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::3d7d:dfc1:b35d:63d1]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::3d7d:dfc1:b35d:63d1%7]) with mapi id 15.20.3153.023; Thu, 2 Jul 2020
 01:12:42 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIHYyXSB1c2I6IGdhZGdldDogZnVuY3Rpb246IHByaW50?=
 =?gb2312?Q?er:_Interface_is_disabled_and_returns_error?=
Thread-Topic: [PATCH v2] usb: gadget: function: printer: Interface is disabled
 and returns error
Thread-Index: AQHWT3mab41mxV7Qg02VVuWzDLc/rajyn3eAgADc330=
Date:   Thu, 2 Jul 2020 01:12:41 +0000
Message-ID: <BYAPR11MB2632AF09FFD1A4841EAFB804FF6D0@BYAPR11MB2632.namprd11.prod.outlook.com>
References: <20200630054407.33165-1-qiang.zhang@windriver.com>,<20200701120027.GB2184169@kroah.com>
In-Reply-To: <20200701120027.GB2184169@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ff2cea9-2136-40ec-4e75-08d81e250514
x-ms-traffictypediagnostic: BYAPR11MB3671:
x-microsoft-antispam-prvs: <BYAPR11MB3671CD29DF8C2D74A8DBE449FF6D0@BYAPR11MB3671.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g89HVM7liNleQr8artPcH8XT4Eku+PtX7tsLe2LqQweWWKzdkksHUTvHKPHvv2RlFawBzUyyzGFy9ei3yCDwFNVwcTuqu36XOkgnld48UcKKfMOzWTWtWPYuDdH1rawNmr08XsaHAR9HVdp13OCC80+5HyBNNIiEYncy4qkuasYfhdn1XYWLiuxBXWyGZFD6wPB/0nZpf47u9o0uW/yKHc9++fC9gI5cM5TuMANcJYcbOWpmWzgNsrB/qXgEMWNlwbgpXHgQ58V1TvfdRRK3IGif2eNfv94kpqAQyBaYSymtfDb+pjJI7Z3B5B73RJ9s
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(39850400004)(396003)(136003)(66446008)(66556008)(9686003)(66476007)(6506007)(7696005)(478600001)(224303003)(71200400001)(186003)(83380400001)(86362001)(4326008)(316002)(54906003)(52536014)(91956017)(76116006)(55016002)(66946007)(5660300002)(64756008)(4744005)(6916009)(8936002)(2906002)(33656002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3whfFttVjBT1qsJ/P0Lrz78Om0aoGiYJ4DQ8tyiEanYaWQZdvHxFsRA22ggIlSJ0BpZxjc9lRjKfDfeigHbYSz5BmToXJOhVl0Tbe9XuTeoeGCDlmpsef7hvtsipdAtmNrIoAbIfNudqZfZeSoixzSxgnMA/k4AJ/CZHJ+XkKlqdj48BeE7LaU+mLL/RihEa7NVkPdejnr2vbMpdcbMZl8UIFhiUph3hNPVguP/S1iWK82sNyc3ZxuUcddwpSqhLDAdAMHsGxVDxumIG+2SdgCeWAxZulOk7F8F/q9fTmN22iSURSo5torMxgmu5y13f5wLHPMP91/2748wwItr8CLW3UuCm/wvMczV0h7MwyRXDshlIaGm4Gql6igxQJQB1ozeVy73qz0EbXSG+RqEL4NI/Z7RCwAT69SmGvpIHLlUAkKl8TnQniWR7S3qaODMpk3TgbRq4DyYuz94rEDzStBBueDYUHIJSTGOi9sa1gbI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff2cea9-2136-40ec-4e75-08d81e250514
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 01:12:41.9026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WRbE3N5LiPvUlVpuRurOFORiNdxdP7BEuv2dkf2tOli6igFzgIvdOOHIXvJRfy5y8ctT7kENlquOX23sFa5l7/M1Pgk5PINwES2U0/Y0x3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQpTb3JyeSBHcmVnIEtILCBwbGVhc2UgaWdub3JlIHRoaXMgc3VibWlzc2lvbi4NCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBHcmVnIEtIIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCreiy83KsbzkOiAyMDIwxOo31MIxyNUgMjA6MDANCsrV
vP7IyzogWmhhbmcsIFFpYW5nDQqzrcvNOiBiYWxiaUBrZXJuZWwub3JnOyBsaW51eC11c2JAdmdl
ci5rZXJuZWwub3JnDQrW98ziOiBSZTogW1BBVENIIHYyXSB1c2I6IGdhZGdldDogZnVuY3Rpb246
IHByaW50ZXI6IEludGVyZmFjZSBpcyBkaXNhYmxlZCBhbmQgcmV0dXJucyBlcnJvcg0KDQpPbiBU
dWUsIEp1biAzMCwgMjAyMCBhdCAwMTo0NDowN1BNICswODAwLCBxaWFuZy56aGFuZ0B3aW5kcml2
ZXIuY29tIHdyb3RlOg0KPiBGcm9tOiBacWlhbmcgPHFpYW5nLnpoYW5nQHdpbmRyaXZlci5jb20+
DQo+DQo+IEFmdGVyIHRoZSBkZXZpY2UgaXMgZGlzY29ubmVjdGVkIGZyb20gdGhlIGhvc3Qgc2lk
ZSwgdGhlIGludGVyZmFjZSBvZg0KPiB0aGUgZGV2aWNlIGlzIHJlc2V0LiBJZiB0aGUgdXNlcnNw
YWNlIG9wZXJhdGVzIHRoZSBkZXZpY2UgYWdhaW4sDQo+IGFuIGVycm9yIGNvZGUgc2hvdWxkIGJl
IHJldHVybmVkLg0KPg0KPiBBY2tlZC1ieTogRmVsaXBlIEJhbGJpIDxiYWxiaUBrZXJuZWwub3Jn
Pg0KDQpXaGVuIGRpZCBGZWxpcGUgYWNrIHRoaXM/ICBJIG1pc3NlZCB0aGF0LCBkbyB5b3UgaGF2
ZSBhIHBvaW50ZXIgdG8gdGhhdA0Kb24gbG9yZS5rZXJuZWwub3JnIHNvbWV3aGVyZT8NCg0KPiBT
aWduZWQtb2ZmLWJ5OiBacWlhbmcgPHFpYW5nLnpoYW5nQHdpbmRyaXZlci5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfcHJpbnRlci5jIHwgMzYgKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykNCg0K
V2hhdCBjaGFuZ2VkIGZyb20gdjE/ICBUaGF0IGFsd2F5cyBnb2VzIGJlbG93IHRoZSAtLS0gbGlu
ZS4NCg0KdGhhbmtzLA0KDQpncmVnIGstaA0K
