Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3CD34BA49
	for <lists+linux-usb@lfdr.de>; Sun, 28 Mar 2021 01:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbhC1Azq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Mar 2021 20:55:46 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:33486 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230490AbhC1Azl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Mar 2021 20:55:41 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A1F134011D;
        Sun, 28 Mar 2021 00:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1616892941; bh=2im71q8uYg+SotMCi6oyxIZbzKRODDn4ZpGzFdkW1EM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ZJa7Qik1KC3qJBVy0APoXH/yusWu06niaqvA8Rj9gO0Owkm0uSMJQLRE1sHfpRlM2
         W1SPm86J3NdrCPk04rHHcKS6W4ZqFpq2WLOEws4VLVVSYAU7lAES1LkFEs3ImimNhW
         p51fY9CqFgjqVhJgvH/eCgDXEW9tdeBbC6d8mqMK6GumdQAOIr8TdGuPxmDj8J42Jq
         UOdMAIsIJrQkAJYREmXz/CIq2MlWwtfydnPRuR8PnBlgeU+g4dlIToaDXJv4GG+ciY
         Tz9nWzzDDerAIbsbROzJCc2fGzSTBDFEBmVmOw6N92oXKVJ5Z8Xp2rlF8Mg5bC7Dbf
         lKGEGIQc3DU/Q==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 356DFA005E;
        Sun, 28 Mar 2021 00:55:40 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id F13CC80091;
        Sun, 28 Mar 2021 00:55:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="rPaCQ8cR";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpIJwZI707GakKR6olNI2u95OkFzoWDrVVaTvunx89ov70UdeadOdJgcYVYLokxilgji55aFtPKwrhQDENR3iknidRz1ynlrIZ4vZbirAPFT5eXi+YwKun1NSE52Kmf7YsQSjuD408KlaQ3WqwkjJCymK+TcEPAqEIIxGUP+Fzi+NPW7Xr0s60Zc7L8IZzQTeJaX6dIxLuT+uETqb01ybeZ2dEHbJBScPQk0783EfsKqNxEXa/tZt/MMdRK5YIxMMuPsd00h3dpUF40fe8Z5nOSGJUhRdj5cvsohOEt3EwTUJj1fd4w3jSR5sIqGvwkOZc6hyohULQ74B0rr9ZOHBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2im71q8uYg+SotMCi6oyxIZbzKRODDn4ZpGzFdkW1EM=;
 b=JWxxIaiH4x5wd2OnJ5Mp6u3sRg/ojCPKRKGNArR93SRhUtG6Rq6uxQmPiSpqbpZZaeVKDWRiDPfxEz1t8/IEwp6/fjyju2dbo79ioXgJpybccb4cLWhPHDk7ylyHRtSX063pWnft18zbjXcTHLnZEOkRx39llxdGIg7/6h5zXwJj+ozCuIXCLPtiHAtZMjXoOYmxNdOoWqoHhquDufnxGPHBwbHcyvVWdHeg1yHBgidW/DFrryzpbEtvw8/TfQ8tlQF0IoLcY9YwycK5jI6ebjjvfH01NOpxl/D7OylwetctTKJusqsucw8/OkXP1CA2KwBPKQoXQLSHjsV0VonIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2im71q8uYg+SotMCi6oyxIZbzKRODDn4ZpGzFdkW1EM=;
 b=rPaCQ8cRGCtZyqFWTRyvdSJ7zo/l8yRoLXAwo+yNpE6gStgm5kFbzy2L3X8IKI9ZvtrVdDCU912uJs33YxD3ECBboCPDmSNrJZVwtAU9HaDFLpqrzMRM91mSoOKWNkubuak4EMLcFYERj4meLFHiwLKMQxKQnmack3td/ztOVMI=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB2712.namprd12.prod.outlook.com (2603:10b6:a03:65::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Sun, 28 Mar
 2021 00:55:36 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.3977.032; Sun, 28 Mar 2021
 00:55:36 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: Create helper function getting MDWIDTH
Thread-Topic: [PATCH] usb: dwc3: Create helper function getting MDWIDTH
Thread-Index: AQHXIRku2Fv2ANz34UuBKlHqGikb76qT8v2AgAJV0YCAAk8egA==
Date:   Sun, 28 Mar 2021 00:55:36 +0000
Message-ID: <d90b8223-c690-a3b0-fe8a-084c62335327@synopsys.com>
References: <f6c3bf1ec9d6e36a36ed84534988014f2dd70035.1616636455.git.Thinh.Nguyen@synopsys.com>
 <b4e8500c-fe6f-226a-8822-c26072e4d710@synopsys.com>
 <YF3kKePNnF6wRUbj@kroah.com>
In-Reply-To: <YF3kKePNnF6wRUbj@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65a2ab32-7a0b-4fc2-4a01-08d8f18432f0
x-ms-traffictypediagnostic: BYAPR12MB2712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2712ED933C58151A9CE7E1B9AA7F9@BYAPR12MB2712.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nv9fxMJ4IWvSWZJ9t8jlpxMd3T7uG7af/V2w2CaISvwes8lS+4/V1xa/D7X4o4LkrwUJ9A/c4Nr4kNzOJXYAnTNqSkte00GTwKtvFk1MI1YcD+Zp+f91jcY4220gOiLNF8shnbXnIvTsd/6/zH8XGV/DSr8V8OOT7do0nsURG83OHkbNgDzpM+S6R2hTvMsXhZ+afz6J1IvRfEo+hXyrjLLzDPOj72pGxGtKM9Q+j0xzD8D/jMoApKluIxJ2Z85p8SsqfAY5uEM0PReu4OBu2Zca1XS1IkUuTHlCSJ6YeCIrbPlfwCw80O834ehNTzsqi3IYsEuC0P24xcvE1apezA9inQ4uhN2NV4kscO4NHHuaIWWcHYWPimpuJ/PnFy9jyl22wydmErIxDw2E4Db6CO4c5mZ9EYS+xa4b4ppcktGN6X4CQLVxGTGugxVG1tNM29iVzaSn+NcJq3Gpv9vwFcHfhChyGztZwxw/iNeRUtRzmfvYV3+c43D/9PXUIpprQ6KluPDU+pdhcLYRAcqLt5tZDJaSzC5Ge3TlHrPxYoOSav0UUXs8/g8MDXA9ZdhljSNuS/V02wVKuJmsj/+4vJ5g43bE3AYCvCt3HSK3WMQ4/OME/xYmaeTgN7bn2WKM9DMe3XF9CRWbJddIFpso/oyUeMLsTQQbPZttrmMiY1sRdiuAxzsythumCRHzCFJzJPdLb63zoVoZG0B45j3zkGsfKR5hLt0y1ulfKMxkiCI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(346002)(366004)(39850400004)(396003)(71200400001)(6512007)(6486002)(107886003)(2616005)(478600001)(83380400001)(4744005)(186003)(4326008)(26005)(31686004)(6506007)(36756003)(8936002)(86362001)(2906002)(66556008)(316002)(31696002)(110136005)(64756008)(54906003)(8676002)(66476007)(38100700001)(76116006)(66446008)(66946007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?S2tmZW5UODU3bldKUjh2VGI4cjNNSGtBRjNaQXN3S0VDMEVhbnh5M0ZuNE0r?=
 =?utf-8?B?NkhSOTRwSXFyOVJsZjNKcEtMTldkaDNCb2hpZnhRYi9HQjR5RmVtSGpOcjJh?=
 =?utf-8?B?MVdJYXdnenphY1orWGVBWCtiNjIrajZIU1RQenZ6VVRhNGNrZmtHMEFqR3JB?=
 =?utf-8?B?czhxZzVuUElKSjBQZGdvREVnaWhNcTlDN08xNXg4cW9zaitzU3dPdE1PR291?=
 =?utf-8?B?MUprcHFPeUxiQmRpL2QrVVduMjE4N1RHcU9vMm42R3IwZFFMT2UxVlVsT1Fn?=
 =?utf-8?B?dnhvTXY2RWJGaTNQS2ZEY1czYmxrUlNPbG5qWG1sT0RCRnAwZmxYK0drUVRr?=
 =?utf-8?B?TkNtQUdhNEdFYXlaR3lZSjdvd3hRWkdyL1hSaTdBWSt4NmVWTWg5TjFETHpJ?=
 =?utf-8?B?Y2NXTTFNTGg5UGduVTludDZpR0NoazJZblQ5T2t6dGpISGNEQ3NPTWM3cXJL?=
 =?utf-8?B?MGFQV1U2enVqRFI2SG5KaEsxMVRta0hOazkxNjlGTW4yMC9xUjNSOVNvWHYx?=
 =?utf-8?B?UWF0TzNOZm1hTm1xRTl2aUVuUlVJdlBtYnRXZ2dOUFBVUGxNV0o1eTZvTGMy?=
 =?utf-8?B?ekVCTmVUQ0tzVlg4MEJUWFFTN01YL0NUdmk1OXdLMC9MSVQrcjZ1RTZESjZx?=
 =?utf-8?B?dW8yYlBRN0JkeGtiUGRVY3Q2eGFocjhjekI0N2NtclM4VEVKdXY3T2tqcGFS?=
 =?utf-8?B?YkNpQi94YTVRUHNHS2JLcXVJb0hXRWpFcUhlVFBrUUxUM095Ni94d0tBVjFI?=
 =?utf-8?B?QU1UUjZ4VWQ2NFpLME5kRkw4ZmxXMlh0eUlOQVJ6YUNSUXRnazRPWitHV3ZQ?=
 =?utf-8?B?ajNUS0t1TnZvZmRDcXZzbWp6eTBNSzc0L2R6bXRDQ2pNb28rTUd5Ukl5TU1k?=
 =?utf-8?B?K2NYdXUrOERhTEUrR3RPbVdkMlpHblBCMitIbkRVOCtqWENodjIzaUxqS0p5?=
 =?utf-8?B?WVBCMXVDeFYrWTZiQ1FkbUUvcjFtUmM5MU1kOUJRNzYwc0NPYStVR0VSWjk3?=
 =?utf-8?B?bGlSQjdMK2RXMmRJdmlrQU1nODk3aWtZQUhnS2swTlJqSFE0MWx2TnFiQjNV?=
 =?utf-8?B?RThnTTJ4K1RjaTZLdFE0LzhBNDdDVjNJUG9pNXNRVTNsZnJoWWg3bVpqOGNG?=
 =?utf-8?B?ZzIrSjR4TzZpQlFYc0JYMHFMaEh3MS9qWlAwbG43Y1NlNnJBMUdWK1AxTmxj?=
 =?utf-8?B?QXNPcjhsK2ZBL0o5NzJIOHord3lrOGFqQnNja1c0bCtrUDcwSkg2ZjdDbi9o?=
 =?utf-8?B?Z1FTdzR0QlE2eWd0NEorTXhwelFNT1ZObEZiaUJDWVJ2SDV6YW5OSVFuWmV2?=
 =?utf-8?B?QXVpR2lIS0pkREpjVXQ4NElTNXBYNkdDWXF4OG85K3plMGttVmUwUFpyZFlL?=
 =?utf-8?B?K2gxNUt2UFE0c0l1TktuYkxHS1M5SkRTTTZJV3Y0SUwxUzRVYnhrb1oweUJt?=
 =?utf-8?B?VUV6SEhhRzJMN1diOCtkVTI5czYvUm1YRngzbDc4VkhBNmlyL2JDMmJPMnJw?=
 =?utf-8?B?RGxYSnZBNk1GM0lyamxobTBFWVJZS2hrcllac25hekU3cFdybDFTKytlVVpk?=
 =?utf-8?B?M1ZyeGVYQm5xOGRzMVVzcUtzL2E1TGt1MXVJUlBqVHpkbVo0dzl1czZ0S2Qv?=
 =?utf-8?B?bXVQV3B1UkIwaVJ6aUFGT1Y5ZEYxb2pmS3JTQkdTTDJEenRpbTBBMUZVWlgx?=
 =?utf-8?B?OFNRTlZULzJ5RkcyOFA2UExLUEJ3dlJtS3RGOUhkeXdBYSt6Q1FOVGNEQ2ho?=
 =?utf-8?Q?oOQMbUjQdNgVGgG+gk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6206F729DA258D48B30CA267725D8A37@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a2ab32-7a0b-4fc2-4a01-08d8f18432f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2021 00:55:36.4231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OOirsfUu8QK60buw3wq68jOl7dilhQ679G3e/lCS2iJY+WTQ262YantUZbsyiPiTvsO8lGlo/FIL70dIQnq1KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2712
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiBPbiBUaHUsIE1hciAyNSwgMjAyMSBhdCAwMjow
MDoxNEFNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBUaGluaCBOZ3V5ZW4gd3JvdGU6
DQo+Pj4gRGlmZmVyZW50IGNvbnRyb2xsZXIgSVBzIGNoZWNrIGRpZmZlcmVudCBIVyBwYXJhbWV0
ZXJzIGZvciBNRFdJRFRILg0KPj4+IFRvIGhlbHAgd2l0aCBtYWludGFpbmFiaWxpdHksIGNyZWF0
ZSBhIGhlbHBlciBmdW5jdGlvbiB0byBjb25zb2xpZGF0ZQ0KPj4+IHRoZSBsb2dpYyBpbiBhIHNp
bmdsZSBwbGFjZS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmgu
Tmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4+PiAtLS0NCj4+PiAgZHJpdmVycy91c2IvZHdjMy9jb3Jl
LmggICAgfCAxOSArKysrKysrKysrKysrKysrKy0tDQo+Pj4gIGRyaXZlcnMvdXNiL2R3YzMvZGVi
dWdmcy5jIHwgMTIgKysrKy0tLS0tLS0tDQo+Pj4gIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMg
IHwgMTYgKysrKystLS0tLS0tLS0tLQ0KPj4+ICAzIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlv
bnMoKyksIDIxIGRlbGV0aW9ucygtKQ0KPj4+DQo+Pg0KPj4gU29ycnkgZm9yIHRoZSBub2lzZSBh
bmQgcGxlYXNlIGlnbm9yZSB0aGUgZHVwbGljYXRlIHBhdGNoLi4uDQo+IA0KPiBTbyB3YXMgdGhp
cyB0aGUgZHVwbGljYXRlPyAgSSdtIGxvc3QsIHNvIGFtIGRyb3BwaW5nIHRoaXMgb25lLi4uDQo+
IA0KPiB0aGFua3MsDQo+IA0KPiBncmVnIGstaA0KPiANCg0KDQpZZWFoLi4uIHNvcnJ5IGFib3V0
IHRoYXQuIEp1c3Qgc2VudCBhIHYyIHRvIHJlc29sdmUgdGhpcy4NCg0KVGhhbmtzLA0KVGhpbmgN
Cg==
