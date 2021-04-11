Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E433E35B0D2
	for <lists+linux-usb@lfdr.de>; Sun, 11 Apr 2021 02:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235102AbhDKAFP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Apr 2021 20:05:15 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47390 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234992AbhDKAFO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Apr 2021 20:05:14 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 28216C0126;
        Sun, 11 Apr 2021 00:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618099499; bh=QxEkldSuqG587ieBwZtTpo8bb8p9JPk+XO+In+kidHk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=FDu0X3mCMkqivqLoXt+KmzGbldizbWpdz9bidL4h/Zt1JN+joECoRyKGxONmVsWaN
         O46dsrSahXk0PzMJZWPnnv5x0S5PalfL+UBl0nHHt1ZdJY0J8p7uJ9lRh1TBfQtcwi
         elvKCSH36FPc3q+7aNVYGuEUwrOM7tFbRA8Zeyg3DFIrqKCXXKrqrXrAlOfUtHEtUw
         N/9yeeIe1sobk6KZMEKFBhclZCicUEXm8QBLlilv1l2fE9vqLcMajs8OYBXthlN9yX
         hq8SjVDKvT6RwOgA79dfpGmFkN24xvtz9zFnJqRAZ3Xv9pk21LLXC9mkbY1sxMt6tJ
         8BDATVjpEAHog==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 83C56A005E;
        Sun, 11 Apr 2021 00:04:58 +0000 (UTC)
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2051.outbound.protection.outlook.com [104.47.46.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 230FB400A1;
        Sun, 11 Apr 2021 00:04:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="TNsVGTGH";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nv6edMf8NQxJRr+KjFL+mOMXMfi5yER4lXkARrUY97czANCjcVBS3Ur6AjiyhjJks4IiiRa6zPCHGD02W3L8UDHQSnUzh6bInKd52KHgzjfUIdaqQl3xz4qr1PBKYH5DS9bQZwPEE+9Pz0oXtcp9+4r8ck6QbC2WxCeOlCoC50PfC8k4pblYJKyPkXYjysPIZr/4EmiA2QnA3wE4YoCMQXQWBJyh6spH2Lg3/+aXw2YrujFw8McjYNrRE4/9UPSCSa4a36OuaDejX+q9FNDAhjvv+RgTyBVXiwMMMzO9EyDFUyx5foeJZPs0mgTj+577mFmPZ4HkHND9qHpLDpb5ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxEkldSuqG587ieBwZtTpo8bb8p9JPk+XO+In+kidHk=;
 b=OboyYp8+Ea/LUxrPuSOk9h2fn1joGGmOpdondE29JCw71RiFOElZUf7N36dxZcWB50QQYwMbiEWDWVPL9M8z/sXj785Zce1a9scDXKrLGgABhNZ4rhVuexCXfjjac4ronO9FLNE2G/lMdXm5zwZaRU7Zyq1RyZwT7uk/k0uQomLK0WujkCiWqLD1EUGs+J0CqqMWU38zKZHG/rgA1vdWB/cMURjquIkDbKXJowfdTD6i4fEF0+MaYzeHoHg0VZsKWNUrkE6aeYRNL5p1asCzDutcIy74TCWm4z5bcMouN6G0TV5Xgv5NrKyEIh67fRz+wSONey2Tl9GkQ1YtiS5rNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxEkldSuqG587ieBwZtTpo8bb8p9JPk+XO+In+kidHk=;
 b=TNsVGTGHq83KmHv5Lj1T7EazfrXB0DyQ5yHO+IzDcWkP9UlxAJEHEfMVCk7i57OiWUaKQC9YF0GmnDqxHKDS7LquzSDbT5STTcIZsEkVnVxQbjUvOX6XpkobpzMEOtispMqrhC8pM+CD/bWaKDOLMSDfTiF7bpN5jRndU6YXkSw=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3591.namprd12.prod.outlook.com (2603:10b6:a03:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Sun, 11 Apr
 2021 00:04:52 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4020.018; Sun, 11 Apr 2021
 00:04:52 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ferry Toth <fntoth@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        USB <linux-usb@vger.kernel.org>
Subject: Re: USB network gadget / DWC3 issue
Thread-Topic: USB network gadget / DWC3 issue
Thread-Index: AQHXJWGMSb8EBf7kO0mkR3W2S+2f0qqctZMAgABFgICAABlrAIAEiRiAgAAR4oCAAChFgIAAOFIAgACdRYCAAKT+gIADH/IAgAHHyACAAAP0gIAA3M4AgAIC7oCAAA9XgIABEBUAgAGTHQCAAArLAIAApsKA
Date:   Sun, 11 Apr 2021 00:04:52 +0000
Message-ID: <9bff5c8d-4dd1-22e2-ddc1-a0a1032d4c13@synopsys.com>
References: <CAHp75VeERhaPGAZc0HVs4fcDKXs+THc=_LFq_iEhWAR8vvURjw@mail.gmail.com>
 <87pmzgk44r.fsf@kernel.org> <b4763ebe-c0ff-2d24-5385-1a1587603280@gmail.com>
 <1f8ed83c-b2e5-327c-30da-56865e2b956b@gmail.com>
 <fd8d9a8a-8f57-6559-2053-4607b9da13ab@gmail.com>
 <797f97b8-6558-35c4-2dc5-9deacdf0ba4d@synopsys.com>
 <ff57b956-a777-3dd6-80ca-4e9afd33ab96@gmail.com>
 <6b3a28eb-7809-d319-d58d-520c1c7fa5d2@synopsys.com>
 <4a0869c9-6b71-5acd-e670-e4c06b44d62d@gmail.com>
 <5d8459ae-4a4c-7371-6b0a-ed817e898168@gmail.com>
 <7963d464-44c1-f580-398c-775c694664cb@gmail.com>
 <f24b6e66-1fdc-06f0-97b4-f2a9be3eef6b@synopsys.com>
 <e50114a1-f7d3-ad62-fe6d-6b8bb2b1203f@synopsys.com>
 <CAHp75Vf+3aeq8kb2oOO-qjC5jOE7ZWUgs2=MOa4mseOG08c+vA@mail.gmail.com>
 <bdc5093b-0673-ff3b-fef9-4577aa3549a9@gmail.com>
 <32951a5f-062b-abc9-43a4-0245175423c9@synopsys.com>
 <be6ada9f-bc0a-b367-b69f-c5df3771e879@gmail.com>
 <2c5bf7f3-14b6-797f-ab5d-039081906815@gmail.com>
 <0ba7a6ba-e6a7-9cd4-0695-64fc927e01f1@gmail.com>
In-Reply-To: <0ba7a6ba-e6a7-9cd4-0695-64fc927e01f1@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ec40d58-2e5c-4a99-cd54-08d8fc7d6e5c
x-ms-traffictypediagnostic: BYAPR12MB3591:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB35910D66DCDF18B7F8BBC175AA719@BYAPR12MB3591.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5V4UGtvi+G/WKyWr9dCmcQeM6Y/a0sccK5XsVVapUFLqVWwZM1zjAkB0tHrMpGaz0KuRaR4caaJded1HPRi43kRInk5BbEyue1wfZb4dpI5uoQRgPLifaHr6BmgbIaKL+d6sS0Ix8Dwe8M8B4mgg59g9C0lpQ16kAjIBM7PdHCsVuLiS99WkEdPiMLWp5+WcX3dQEnWB6N/drM+VklOwEvU1jaYRrXaTdFxb8AFJB1nWhZolEIySTOmNxbc5DxIz0+5C3KoRqUAMCr+McCPJ0q3ZgQIE5p19ba0G0BRnT4eGpjSkWFl/9jGjgrY8BsHfwV3QCFvw2iei/GeB13GKJ3uiaLZgnMtEpiC1PnBND+HUBYSsmPFlRGNDV3gbgMek+2t21XbCE/7BXxGbewYzZ0YXdeSaMTEdqch0DXX74GHB4zNIYbiMDnmIDvXouMSmO4enGpnCWom+JHCLmFVqX8CHeYL02I3RudjP6EZOmU1hc6MxRQcYDyA8wEf0gmNrI1SXnntwgaECwbkH0QWu6IYhW4EdXJD+9MATRdkN+Fhv7b5mdss+pneCSSP1/eRorccwG+xLndu0ukSiCM16fPcdTlVrhBJC7AIm6n2i4vgRLqK8zSTozPKkYqqy7HwAV9+SVirKzldW7JTExUoJzv5XZIuMugfY+w2P8hFOetNlA5xsntXvhKnYzMEL0cq8y3hjiLdWJR3atQ0TC5/wCO9AoEClkJ7nWhP4Rd8MReYukBRu2MdwRmQ1QvgwiJajCwYoCXZHdCE2QUxann0cpA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(136003)(346002)(366004)(39850400004)(66446008)(83380400001)(36756003)(31696002)(86362001)(186003)(76116006)(478600001)(66476007)(66556008)(966005)(53546011)(5660300002)(6506007)(71200400001)(8936002)(54906003)(110136005)(4326008)(26005)(2906002)(8676002)(316002)(64756008)(66946007)(6486002)(38100700002)(31686004)(2616005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?YUQzbVNmSGdPVG1oTlhKZFdvQncveGhBRFdSb1pUazhKZzNFUGVqNitiQldh?=
 =?utf-8?B?cnpOVGVaTjZUamxyb0orL1ZMTXFKMHU5bkx1aitoeFIwNExTcnNFaDQxcU5a?=
 =?utf-8?B?UGJoZE9WRmwrVWhqQzdGN0lYVkhETTI1ZHJJZENDdmNLK0dnZ1hTSWxCUVA4?=
 =?utf-8?B?dVoxVFBOMXdzREhRWjNaQi9iMWZXVm84b2lMaFFCaWFmKzlFeElFaGVrZG5p?=
 =?utf-8?B?bWMveFcvdGdGMlczOUc2MldOd2FZMUl2d1poQzdRV1laQ1lINE1zd3JhMDVV?=
 =?utf-8?B?S0RTbDBmdUhjZnozN3dHb3lXc01FRHBoZVhad0pGYmpiU0JpRlJZaEV4cmJm?=
 =?utf-8?B?Q2FHRWZaSlQ5TEN3UjRzZWxBMnA5WjMzbVIxTENWMkhnbXVxbmtkREFpUUdv?=
 =?utf-8?B?NExRMEV0VVJDSVEzRFYyZi9TbW1QZFNSSzFkbVptR0s1QWYvU0RtRGM5Sjdq?=
 =?utf-8?B?S085TXpNcnpmcEZ1WGFxM0krV3phVzNiS0VpclRFQXVjamFhWm52TjFweEti?=
 =?utf-8?B?bVBGWUdhM1BvTGdLcWlUazFKVmRVVXdsNmVweHhkRG03M0dwSXhYdzNrb3hh?=
 =?utf-8?B?bCt6anNDcHpSa080eHlXRHo4dFQ0ZDhxandlSVUva3dZUnBJYktMZkkwdzl6?=
 =?utf-8?B?MnVQRXM0NGpjMDB0eDZTVC9GL2E4VzR4K05od0tKUFFaN0N3MnBxc2JWTWVs?=
 =?utf-8?B?VDY2dUgzaVNrZ3B5QS9EdzVmRGNyWVhtUUlqczZSTVVJQWwySm8zM01RVEY3?=
 =?utf-8?B?cUhjN3IvMndNUzV6WnZLelFiRjRtQmlxUnJFSUU3MmszOEowNVp2cmhleU5K?=
 =?utf-8?B?WUJqa3ZvblE1a1I4b0MwMEx2U3BtVjdGUGU1WERZa1VQeFJtNGtCbmxYUW94?=
 =?utf-8?B?dW5NNWRIZmt6ZWlCWHdLd2lTWU9CZnRGaFRSNGtUMHZkQk16d1RjN0xOM2dv?=
 =?utf-8?B?Z1dwT1FTNUlLR3pNNmZCbW1ueUpBeERzL0ViSFdWdWhHMGU5a1lHSjVENk12?=
 =?utf-8?B?L1doSUROdWNBSXpQd3FIcDB5ZVY0K0ErOUNvU3ZPWTRtSWxleWIyRVkyelE4?=
 =?utf-8?B?cHd3SXZzaFlUdk84ZHZRa05aMWQ3eEQyTTVjQmdPRzJnb2tjTDZvUnlweDI5?=
 =?utf-8?B?TnVubW1iT2FsTUlmWFg2Z3dYOXJYN2ovWjg5cWpFVzhjOVQrWmJtQ3NsOEJ4?=
 =?utf-8?B?U2EwKzNvSlR0SDB6QWVpcytVNUxidHJId05VYmVwbjM2dW4vT0VDUTBBUmEw?=
 =?utf-8?B?b1dCZW1hamxzMG1tYzRUam8wZGpUNG1JQnpqYjNRRENHMTFMNFFSSFJIa2Y4?=
 =?utf-8?B?SGI4UFBwQmdOZnFqV2pWRi8xRU5TYXpjYm5RaEhuZjhuNytkc1YzelpZa01N?=
 =?utf-8?B?K1lFaXlySjU0MGhQV256d2lZanZHWlpnTDZoR1VFek5sMGl0UnF4aG9CdHZI?=
 =?utf-8?B?MmtHeXFaVmhzQWM5Qzl0OFUvcThDMkJSeGtzZlFabUtKUW1WNGYwQjk3b3Uv?=
 =?utf-8?B?dE80bWFMekVIMERwNXJFaVl2ckhBU3JtbHJPT3UzQ3lFYUowZ2ZTNkQvUUdz?=
 =?utf-8?B?V3JzSHhXNlVjUDY2cEFpK3AzdDJ3cmNzMjN6NmZnWWJ5OTNoREw4WDN1OGtK?=
 =?utf-8?B?TEFwVm1kQ05KRHFGS3luV1FhYmJEaEs5UkloUVU0MGFwWXlXd1NBSGQzbzhw?=
 =?utf-8?B?cXFRSmthSWl2Y2VyN003ZHh4RnhJcXdnanV1cVJkZHBWc095Q2kyaEpGN201?=
 =?utf-8?Q?qNaupiU0NU5Q616IRM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <865471D06181CD47AE7036B33D3C3CC0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec40d58-2e5c-4a99-cd54-08d8fc7d6e5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2021 00:04:52.3793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D26bA46hSMx9igpstL7e6uA7X7fcVQCihVwYNK/Wk3mB4Ch9owZChJn7hCF2m6deieVTuUbTc2yxOL/rGMP0oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3591
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVycnkgVG90aCB3cm90ZToNCj4gSGksIHNvbWUgY29ycmVjdGlvbnMgYmVsb3cuDQo+IA0KPiBP
cCAxMC0wNC0yMDIxIG9tIDE1OjI5IHNjaHJlZWYgRmVycnkgVG90aDoNCj4+IE9wIDA5LTA0LTIw
MjEgb20gMTU6MjYgc2NocmVlZiBGZXJyeSBUb3RoOg0KPj4+IEhpLA0KPj4+DQo+Pj4gT3AgMDgt
MDQtMjAyMSBvbSAyMzoxMiBzY2hyZWVmIFRoaW5oIE5ndXllbjoNCj4+Pj4gRmVycnkgVG90aCB3
cm90ZToNCj4+Pj4+IE9wIDA3LTA0LTIwMjEgb20gMTU6MzQgc2NocmVlZiBBbmR5IFNoZXZjaGVu
a286DQo+Pj4+Pj4gT24gV2VkLCBBcHIgNywgMjAyMSBhdCAzOjI0IEFNIFRoaW5oIE5ndXllbg0K
Pj4+Pj4+IDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiB3cm90ZToNCj4+Pj4+Pj4gVGhpbmgg
Tmd1eWVuIHdyb3RlOg0KPj4+Pj4+IC4uLg0KPj4+Pj4+DQo+Pj4+Pj4+PiBJIHRvb2sgYSBsb29r
IGF0IHRoZSAiYmFkIiBhbmQgIm5vcm1hbCIgdHJhY2Vwb2ludHMuIFRoZXJlIGFyZSBhDQo+Pj4+
Pj4+PiBmZXcNCj4+Pj4+Pj4+IDEtc2Vjb25kIGRlbGF5cyB3aGVyZSB0aGUgaG9zdCB0cmllZCB0
byBicmluZyB0aGUgZGV2aWNlIGJhY2sgYW5kDQo+Pj4+Pj4+PiByZXN1bWUgZnJvbSBsb3cgcG93
ZXI6DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGtzb2Z0aXJxZC8wLTEwwqDCoMKg
wqDCoCBbMDAwXSBkLnMuwqDCoCAyMzEuNTAxODA4Og0KPj4+Pj4+Pj4gZHdjM19nYWRnZXRfZXBf
Y21kOiBlcDNpbjogY21kICdVcGRhdGUgVHJhbnNmZXInIFs2MDAwN10gcGFyYW1zDQo+Pj4+Pj4+
PiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAtLT4gc3RhdHVzOiBTdWNjZXNzZnVsDQo+Pj4+
Pj4+PiDCoMKgwqDCoMKgwqAga3NvZnRpcnFkLzAtMTDCoMKgwqDCoMKgIFswMDBdIGQucy7CoMKg
IDIzMS41MDE4MDk6IGR3YzNfcmVhZGw6DQo+Pj4+Pj4+PiBhZGRyDQo+Pj4+Pj4+PiAwMDAwMDAw
MGQ2OGVjZDM2IHZhbHVlIDAwMDBhNjEwDQo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqAga3NvZnRpcnFk
LzAtMTDCoMKgwqDCoMKgIFswMDBdIGQucy7CoMKgIDIzMS41MDE4MTA6IGR3YzNfd3JpdGVsOg0K
Pj4+Pj4+Pj4gYWRkcg0KPj4+Pj4+Pj4gMDAwMDAwMDBkNjhlY2QzNiB2YWx1ZSAwMDAwYTcxMA0K
Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8aWRsZT4tMMKgwqDCoMKgwqDCoCBbMDAw
XSBkLmguIDIzMi40OTk0MTg6IGR3YzNfcmVhZGw6IGFkZHINCj4+Pj4+Pj4+IDAwMDAwMDAwYTE1
ZTBlMzUgdmFsdWUgMDAwMDAwMzQNCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGlk
bGU+LTDCoMKgwqDCoMKgwqAgWzAwMF0gZC5oLiAyMzIuNDk5NDIzOiBkd2MzX3JlYWRsOiBhZGRy
DQo+Pj4+Pj4+PiAwMDAwMDAwMGJiNjdiNTg1IHZhbHVlIDAwMDAxMDAwDQo+Pj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDxpZGxlPi0wwqDCoMKgwqDCoMKgIFswMDBdIGQuaC4gMjMyLjQ5
OTQyNTogZHdjM193cml0ZWw6IGFkZHINCj4+Pj4+Pj4+IDAwMDAwMDAwYmI2N2I1ODUgdmFsdWUg
ODAwMDEwMDANCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGlkbGU+LTDCoMKgwqDC
oMKgwqAgWzAwMF0gZC5oLiAyMzIuNDk5NDI3OiBkd2MzX3dyaXRlbDogYWRkcg0KPj4+Pj4+Pj4g
MDAwMDAwMDBhMTVlMGUzNSB2YWx1ZSAwMDAwMDAzNA0KPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGly
cS8xNS1kd2MzLTQ3NsKgwqDCoMKgIFswMDBdIGQuLi7CoMKgIDIzMi40OTk0ODA6IGR3YzNfZXZl
bnQ6DQo+Pj4+Pj4+PiBldmVudA0KPj4+Pj4+Pj4gKDAwMDAwNDAxKTogV2FrZVVwIFtVMF0NCj4+
Pj4+Pj4+IMKgwqDCoMKgwqDCoCBpcnEvMTUtZHdjMy00NzbCoMKgwqDCoCBbMDAwXSBkLi4uwqDC
oCAyMzIuNDk5NDkyOiBkd2MzX2V2ZW50Og0KPj4+Pj4+Pj4gZXZlbnQNCj4+Pj4+Pj4+ICgwMDAw
MDQwMSk6IFdha2VVcCBbVTBdDQo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqAgaXJxLzE1LWR3YzMtNDc2
wqDCoMKgwqAgWzAwMF0gZC4uLsKgwqAgMjMyLjQ5OTQ5NjogZHdjM19ldmVudDoNCj4+Pj4+Pj4+
IGV2ZW50DQo+Pj4+Pj4+PiAoMDAwMDYwODgpOiBlcDJvdXQ6IFRyYW5zZmVyIEluIFByb2dyZXNz
IFswXSAoU0ltKQ0KPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGlycS8xNS1kd2MzLTQ3NsKgwqDCoMKg
IFswMDBdIGQuLi7CoMKgIDIzMi40OTk1MDE6DQo+Pj4+Pj4+PiBkd2MzX2NvbXBsZXRlX3RyYjog
ZXAyb3V0OiB0cmIgMDAwMDAwMDBjN2NlNTI0ZSAoRTE3OTpEMTcwKSBidWYNCj4+Pj4+Pj4+IDAw
MDAwMDAwMDgyNzM1NDAgc2l6ZSAxNDYzIGN0cmwgMDAwMDA4MTggKGhsY1M6c0M6bm9ybWFsKQ0K
Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGlycS8xNS1kd2MzLTQ3NsKgwqDCoMKgIFswMDBdIGQuLi7C
oMKgIDIzMi40OTk1MTg6DQo+Pj4+Pj4+PiBkd2MzX2dhZGdldF9naXZlYmFjazogZXAyb3V0OiBy
ZXEgMDAwMDAwMDAxMmUyOTZjZiBsZW5ndGggNzMvMTUzNg0KPj4+Pj4+Pj4genNJID09PiAwDQo+
Pj4+Pj4+PiDCoMKgwqDCoMKgwqAgaXJxLzE1LWR3YzMtNDc2wqDCoMKgwqAgWzAwMF0gZC4uLsKg
wqAgMjMyLjQ5OTU2MjogZHdjM19lcF9xdWV1ZToNCj4+Pj4+Pj4+IGVwMm91dDogcmVxIDAwMDAw
MDAwMTJlMjk2Y2YgbGVuZ3RoIDAvMTUzNiB6c0kgPT0+IC0xMTUNCj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoCBpcnEvMTUtZHdjMy00NzbCoMKgwqDCoCBbMDAwXSBkLi4uwqDCoCAyMzIuNDk5NjAxOg0K
Pj4+Pj4+Pj4gZHdjM19wcmVwYXJlX3RyYjoNCj4+Pj4+Pj4+IGVwMm91dDogdHJiIDAwMDAwMDAw
OGMwODM3NzcgKEUxODA6RDE3MCkgYnVmIDAwMDAwMDAwMDJhN2U5YzAgc2l6ZQ0KPj4+Pj4+Pj4g
MTUzNiBjdHJsIDAwMDAwODE5IChIbGNTOnNDOm5vcm1hbCkNCj4+Pj4+Pj4+DQo+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4gWW91ciBkZXZpY2UgaXMgb3BlcmF0aW5nIGluIGhpZ2hzcGVlZCByaWdodD8gVHJ5
IHRvIHR1cm4gb2ZmIExQTQ0KPj4+Pj4+Pj4gZnJvbQ0KPj4+Pj4+Pj4gaG9zdCBhbmQgc2VlIGlm
IHRoYXQgaGVscHMgd2l0aCB0aGUgc3BlZWQgdGhyb3R0bGluZyBpc3N1ZS4gKElmDQo+Pj4+Pj4+
PiB5b3UncmUNCj4+Pj4+Pj4+IHVzaW5nIHhIQ0kgaG9zdCwgdGhlbiBzZXQgWEhDSV9IV19MUE1f
RElTQUJMRSkuIEl0IG1heSBhbHNvIGhlbHANCj4+Pj4+Pj4+IHdpdGgNCj4+Pj4+Pj4+IHRoZSBj
b25uZWN0aW9uIGlzc3VlIHlvdSBzYXcuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gSXQgc2VlbXMgdG8g
YmUgYW4gaXNzdWUgZnJvbSBob3N0LCBidXQgSSBjYW4ndCB0ZWxsIGZvciBzdXJlDQo+Pj4+Pj4+
PiB1bmxlc3Mgd2UNCj4+Pj4+Pj4+IGhhdmUgc29tZSBVU0IgdHJhZmZpYyBhbmFseXplciB0aGF0
IHNob3dzIHdoYXQncyBnb2luZyBvbi4gSGF2ZSB5b3UNCj4+Pj4+Pj4+IHRyaWVkIGRpZmZlcmVu
dCBob3N0cz8NCj4+Pj4+Pj4+DQo+Pj4+Pj4+IFlvdSBjYW4gYWxzbyBkaXNhYmxlIExQTSBmcm9t
IHRoZSBnYWRnZXQgc2lkZSBieSBzZXR0aW5nDQo+Pj4+Pj4+IGR3Yy0+ZGlzX2VuYmxzbHBtX3F1
aXJrLg0KPj4+Pj4+IEZlcnJ5LCBpdCBjYW4gYmUgZG9uZSBieSBhZGRpbmcgYSBjb3JyZXNwb25k
aW5nIHByb3BlcnR5IHRvIHRoZQ0KPj4+Pj4+IGR3YzMtcGNpLmMgZm9yIEludGVsIE1lcnJpZmll
bGQgcGxhdGZvcm0uIEknbGwgY2hlY2sgYWxzbyBmb3IgbXkgY2FzZQ0KPj4+Pj4+IGFuZCBwZXJo
YXBzIEkgY2FuIGNvbGxlY3Qgc29tZSB0cmFjZXMgaW4gbXkgY2FzZSBsYXRlciBvbiB3aGVuIEkg
aGF2ZQ0KPj4+Pj4+IG1vcmUgdGltZSBmb3IgdGhhdC4NCj4+Pj4+Pg0KPj4+Pj4gT2sgdGhhbmtz
IGFsbC4gSGVyZSBpcyB3aGF0IEkgdHJpZWQ6DQo+Pj4+Pg0KPj4+Pj4gQW5vdGhlciBjb21wdXRl
ciAoQWNlciA3MjBQIGJyYWlud2FzaGVkIGNocm9tZWJvb2spLCBJIHRyaWVkIGJvdGggZnVsbA0K
Pj4+Pj4gc3BlZWQgYW5kIGhpZ2ggc3BlZWQuIFN0aWxsIHRocm90dGxpbmcgYnV0IGxlc3MgYmFk
Lg0KPj4+Pj4NCj4+Pj4+IFRoZW4gb24gZGVza3RvcCwgd2l0aCBFZGlzb24ga2VybmVsIDUuMTIt
cmM1IGFzIGFib3ZlICsgdGhpcyBwYXRjaDoNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9kd2MzLXBjaS5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXBjaS5jDQo+
Pj4+Pg0KPj4+Pj4gaW5kZXggNGM1YzY5NzIxMjRhLi5hOTI2OGMwODU4NDAgMTAwNjQ0DQo+Pj4+
Pg0KPj4+Pj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXBjaS5jDQo+Pj4+Pg0KPj4+Pj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXBjaS5jDQo+Pj4+Pg0KPj4+Pj4gQEAgLTEyMiw2
ICsxMjIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHByb3BlcnR5X2VudHJ5DQo+Pj4+PiBkd2Mz
X3BjaV9tcmZsZF9wcm9wZXJ0aWVzW10gPSB7DQo+Pj4+Pg0KPj4+Pj4gUFJPUEVSVFlfRU5UUllf
U1RSSU5HKCJsaW51eCxleHRjb24tbmFtZSIsICJtcmZsZF9iY292ZV9wd3JzcmMiKSwNCj4+Pj4+
DQo+Pj4+PiBQUk9QRVJUWV9FTlRSWV9CT09MKCJzbnBzLGRpc191M19zdXNwaHlfcXVpcmsiKSwN
Cj4+Pj4+DQo+Pj4+PiBQUk9QRVJUWV9FTlRSWV9CT09MKCJzbnBzLGRpc191Ml9zdXNwaHlfcXVp
cmsiKSwNCj4+Pj4+DQo+Pj4+PiArIFBST1BFUlRZX0VOVFJZX0JPT0woInNucHMsZGlzX2VuYmxz
bHBtX3F1aXJrIiksDQo+Pj4+Pg0KPj4+Pj4gUFJPUEVSVFlfRU5UUllfQk9PTCgibGludXgsc3lz
ZGV2X2lzX3BhcmVudCIpLA0KPj4+Pj4NCj4+Pj4+IHt9DQo+Pj4+Pg0KPj4+Pj4gfTsNCj4+Pj4+
DQo+Pj4+PiBUaGlzIGZpeGVzIHRoZSB0aHJvdHRsaW5nIGJ1dCByZXZlYWxzIEkgaGFkIGFjdHVh
bGx5IGF0IGxlYXN0IDIgYnVnczoNCj4+Pj4+DQo+Pj4+PiAxKSB0aHJvdHRsaW5nIGR1ZSB0byBM
UE0sIHRoaXMgc2VlbXMgc29sdmVkIG5vdywgdGhhbmtzIHRvIG11Y2ghDQo+Pj4+IE5vdyB0aGF0
IHdlIGNhbiBjb25maXJtIHRoZSBzcGVlZCB0aHJvdHRsaW5nIGlzIHJlbGF0ZWQgdG8gTFBNLiBX
ZSBjYW4NCj4+Pj4gdHJ5IHRvIGV4cGVyaW1lbnQgZnVydGhlci4gKElNTywgTFBNIGlzIGFuIGlt
cG9ydGFudCBmZWF0dXJlIGFuZA0KPj4+PiB0b3RhbGx5IGRpc2FibGluZyBMUE0gc2VlbXMgbGlr
ZSB1c2luZyBhIHNsZWRnZWhhbW1lciB0byBjcmFjayBhIG51dCkNCj4+Pj4NCj4+Pj4gSSBzdXNw
ZWN0IHRoYXQgeW91ciBwaHkvSFcgaGFzIGEgaGlnaGVyIGxvdyBwb3dlciBleGl0IGxhdGVuY3ku
IEkgZG9uJ3QNCj4+Pj4gdGhpbmsgeW91IHByb3ZpZGVkIGFueSBISVJEIHRocmVzaG9sZCBwcm9w
ZXJ0eSBpbiB5b3VyIHNldHVwIHJpZ2h0PyBTbw0KPj4+PiBieSBkZWZhdWx0LCBkd2MzIHNldHMg
dGhlIGJhc2UgbGluZSBCRVNMIHZhbHVlIHRvIDEgKG9yIDE1MHVzKS4gVW5sZXNzDQo+Pj4+IHlv
dSBrbm93IHdoYXQgeW91ciBwaHkvSFcgaXMgY2FwYWJsZSBvZiwgdHJ5IHRvIHRlc3QgYW5kIGlu
Y3JlYXNlIHRoZQ0KPj4+PiByZWNvbW1lbmRlZCBCRVNMIHZhbHVlLiBUaGUgcmFuZ2UgY2FuIGJl
IGZyb20gMCB0byAxNSB3aGVyZSAwIGlzIDE1MHVzDQo+Pj4+IGFuZCAxNSBpcyAxMG1zLiBNYXli
ZSB0cnkgNiAoaS5lLiAxbXMpLg0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
ZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+Pj4gaW5kZXggNjBl
ODUwYTM5NWEyLi40MjM1MzNkZjg5MjcgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3
YzMvZ2FkZ2V0LmMNCj4+Pj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4+PiBA
QCAtMjg5NSw3ICsyODk1LDcgQEAgc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfY29uZmlnX3BhcmFt
cyhzdHJ1Y3QNCj4+Pj4gdXNiX2dhZGdldCAqZywNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqIHJlY29tbWVuZGVkIEJFU0wgYmFzZWxpbmUgdG8gMSBhbmQgY2xhbXAg
dGhlDQo+Pj4+IEJFU0wgZGVlcCB0byBiZQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICogd2l0aGluIDIgdG8gMTUuDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKi8NCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFyYW1z
LT5iZXNsX2Jhc2VsaW5lID0gMTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cGFyYW1zLT5iZXNsX2Jhc2VsaW5lID0gNjsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKGR3Yy0+aXNfdXRtaV9sMV9zdXNwZW5kKQ0KPj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwYXJhbXMtPmJlc2xfZGVlcCA9DQo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY2xhbXBfdCh1OCwgZHdjLT5oaXJkX3RocmVzaG9sZCwgMiwNCj4+Pj4gMTUp
Ow0KPj4+Pg0KPj4+IEkgd2lsbCB0cnkgYW5kIHJlcG9ydCBiYWNrLCBob3BlZnVsbHkgdGhpcyBl
dmVuaW5nLg0KPj4gSSB0cmllZCB0aGlzIGFuZCBpdCBzZWVtcyB0byBoYXZlIHRoZSBzYW1lIGVm
ZmVjdCBhcyBkaXNfZW5ibHNscG1fcXVpcmsNCj4+Pj4NCj4+Pj4+IDIpIGEgcHJvYmxlbSB3aXRo
IHVzYiBwbHVnIGRldGVjdGlvbg0KPj4+Pj4NCj4+Pj4+IFdoZW4gSSB1bnBsdWcvcmVwbHVnIHRo
ZSBnYWRnZXQgY2FibGUgSSBuZWVkIHRvIGRvIHRoYXQgYXQgbGVhc3QNCj4+Pj4+IGFub3RoZXIN
Cj4+Pj4+IHRpbWUgYmVmb3JlIGdhZGdldCBpcyBkZXRlY3RlZC4gU28gdW5wbHVnL3JlcGx1Zy91
bnBsdWcvcmVwbHVnDQo+Pj4+PiBzZWVtcyB0bw0KPj4+Pj4gd29yay4NCj4+Pj4+DQo+Pj4+PiBB
bHNvIHRoaXMgcGxhdGZvcm0gaGFzIGEgSFcgc3dpdGNoIHRvIHNlbGVjdCBob3N0L2RldmljZSBt
b2RlLCB3aXRoDQo+Pj4+PiBzZXBhcmF0ZSBjb25uZWN0b3JzIGZvciBob3N0IGFuZCBkZXZpY2Uu
DQo+Pj4+Pg0KPj4+Pj4gV2hlbiBJIGZsaXAgdGhlIHN3aXRjaCB0byBob3N0IGl0IGltbWVkaWF0
ZWx5IGNoYW5nZXMgdG8gaG9zdC4NCj4+Pj4+DQo+Pj4+PiBGbGlwcGluZyB0byBkZXZpY2UgbGVh
dmVzIHRoZSBMRURzIG9uIG15IGNvbm5lY3RlZCB1c2IgaHViIG9uLCBzbyBpdCdzDQo+Pj4+PiBz
dGlsbCBwb3dlcmVkIChidXQgbm90IG9wZXJhdGlvbmFsKS4NCj4+Pj4+DQo+Pj4+PiBGbGlwcGlu
ZyBmYXN0IGhvc3QvZGV2aWNlICh3aXRoaW4gMS8yIHNlYykgaHViIExFRHMgdHVybnMgb2ZmLiBC
dXQgSQ0KPj4+Pj4gc3RpbGwgbmVlZCB0byBhZGRpdGlvbmFsbHkgdW5wbHVnL3JlcGx1ZyB0aGUg
Z2FkZ2V0IGNhYmxlIHRvIGdldA0KPj4+Pj4gdGhhdCB0bw0KPj4+Pj4gd29yay4NCj4+Pj4+DQo+
Pj4+IFRoZSBjb25uZWN0aW9uIGlzc3VlIGNhbiBjb21lIGZyb20gZGlmZmVyZW50IHRoaW5ncy4g
UGxlYXNlIG5hcnJvdw0KPj4+PiBpdCBkb3duDQo+Pj4+IGFuZCBtYWtlIHN1cmUgdGhhdCB5b3Ug
ZG9uJ3QgdXNlIGFueSBkZWZlY3RpdmUgY2FibGUgb3IgYmFkIGh1Yi4NCj4+Pj4gRXZlbiB0aGVu
LA0KPj4+PiBpdCdzIGRpZmZpY3VsdCB0byBkZXRlcm1pbmUgd2hvc2UgZmF1bHQgaXQgaXMgZnJv
bSBqdXN0IHRoZSBkbWVzZw0KPj4+PiBhbmQgZHJpdmVyDQo+Pj4+IGxvZ3MgYWxvbmUgd2l0aG91
dCBsb29raW5nIGF0IHRoZSBVU0IgdHJhZmZpYyBhdCB0aGUgcGFja2V0IGxldmVsLg0KPj4+Pg0K
Pj4+PiBCdHcsIGlzIHlvdXIgc2V0dXAgRFJEPyBJZiB5b3UncmUgc3dpdGNoaW5nIG1vZGUsIHRo
ZW4gSSBrbm93IHRoYXQNCj4+Pj4gZHdjMyByaWdodA0KPj4+PiBub3cgZG9lc24ndCBpbXBsZW1l
bnQgbW9kZSBzd2l0Y2hpbmcgY29ycmVjdGx5Lg0KPj4+IFllcywgd2UgdXNlIEV4dGNvbiBkcml2
ZXIgdG8gc3VwcG9ydCBEUkQuDQo+Pj4+IFlvdSBjYW4gc2VlIHRoZSBkaXNjdXNzaW9uIHdlIGhh
dmUgaGVyZToNCj4+Pj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXVzYi8yMDIxMDEwODAxNTExNS4yNzkyMC0xLWpvaG4uc3R1bHR6QGxp
bmFyby5vcmcvVC8qdF9fO0l3ISFBNEYyUjlHX3BnIU1YZWUxcmxvTWxWZVF1WGxSNjB0OTRscl82
aW1Mb1ZMVEVGWHpZV2hTMjdkWkZBRnRINUFXc3NDWnhsRExHY2FLeTJmJMKgDQo+Pj4+DQo+Pj4g
SSBzZWUsIHRoYXQgbWlnaHQgaW5kZWVkIGJlIHJlbGF0ZWQuIEkgd2lsbCB0cnkgdGhlIHBhdGNo
ZXMgdG8gc2VlIGlmDQo+Pj4gdGhhdCB3b3JrcyBhbmQgcmVwb3J0IGJhY2suDQo+Pg0KPj4gSSBh
cHBsaWVkIGJvdGggcGF0Y2hlczoNCj4+DQo+PiB1c2I6IGR3YzM6IFRyaWdnZXIgYSBHQ1RMIHNv
ZnQgcmVzZXQgd2hlbiBzd2l0Y2hpbmcgbW9kZXMgaW4gRFJEDQo+Pg0KPj4gdXNiOiBkd2MzOiBG
aXggRFJEIG1vZGUgY2hhbmdlIHNlcXVlbmNlIGZvbGxvd2luZyBwcm9ncmFtbWluZyBndWlkZQ0K
Pj4NCj4+IEl0IGRvZXNuJ3QgaGF2ZSBhbiBlZmZlY3Qgb24gdGhlIG5lZWQgdG8gdW5wbHVnL3Jl
cGx1ZyBuZWl0aGVyIG9uIHRoZQ0KPj4gcHJvYmxlbXMgc3dpdGNoIGZyb20gaG9zdC9kZXZpY2Ug
bW9kZS4NCj4gDQo+IFdoZW4gSSB0ZXN0IHRoZSBjb3JyZWN0IGtlcm5lbCBpdCBkb2VzIGhhdmUg
YW4gZWZmZWN0IDotKQ0KPiANCj4gSW4gbW9zdCBjYXNlcyB0aGUgbmVlZCB0byB1bnBsdWcvcmVw
bHVnIGlzIHJlbW92ZWQsIGJ1dCBub3QgYWx3YXlzLiBJbg0KPiB0aGUgY2FzZXMgd2hlbiBJIG5l
ZWQgdG8gcmV0cnkgdGhlIGhvc3Qgam91cm5hbCBzaG93cyAiY2FuJ3Qgc2V0IGNvbmZpZw0KPiAj
MSwgZXJyb3IgLTExMCINCg0KSXQncyBtb3N0IGxpa2VseSBiZWNhdXNlIHRoZSBkcml2ZXIgZGlk
bid0IHByb3ZpZGUgdGltZSBmb3IgdGhlIGNsb2Nrcw0Kc3luY2hyb25pemF0aW9uIGJlZm9yZSBj
bGVhcmluZyB0aGUgR0NUTCBzb2Z0IHJlc2V0LiBJIG5vdGVkIHRoYXQgaXNzdWUNCmluIHRoZSBw
YXRjaCBpbiB0aGUgZGlzY3Vzc2lvbiB0aHJlYWQuIEkgY2FuIHNlbmQgb3V0IGEgcGF0Y2ggbmV4
dCB3ZWVrLg0KDQo+IA0KPiBUaGUgc3dpdGNoIGZyb20gaG9zdC0+ZGV2aWNlIGFuZCBkZXZpY2Ut
Pmhvc3QgbW9kZSBzZWVtcyB0byBiZSByZXNvbHZlZC4NCj4gDQo+IFN0cmFuZ2VseSwgaXBlcmYz
IG5vdyByZXBvcnRzIDEzMCBNYml0cy9zZWMgKGRvd24gZnJvbSAyMDAgTWJpdHMvc2VjKS4NCj4g
DQoNCkRpZCB0aGlzIGhhcHBlbiB3aXRoIGRpc2FibGluZyBMUE0gb3Igd2l0aCBpbmNyZWFzaW5n
IEJFU0wgYmFzZWxpbmU/DQpOb3RlIHRoYXQgaW5jcmVhc2luZyB0aGUgcmVjb21tZW5kZWQgQkVT
TCBpcyBub3QgdGhlIHNhbWUgYXMgZGlzYWJsaW5nDQpMUE0uIFdpdGggdGhlIHJlY29tbWVuZGVk
IEJFU0wgcHJvdmlkZWQsIHRoZSBob3N0IGNhbiBkZWNpZGUgd2hlbiBpdA0Kc2hvdWxkIHB1dCB0
aGUgZGV2aWNlIGluIGxvdyBwb3dlciBzbyB0aGF0IHRoZSBkZXZpY2UgaGFzIGVub3VnaCB0aW1l
IHRvDQp3YWtlIHVwLiBXaXRoIExQTSBlbmFibGVkLCB0aGVyZSBtYXliZSBzb21lIG1pbm9yIHNw
ZWVkIGRlZ3JhZGF0aW9uIGJ1dA0Kbm90IHRoYXQgbXVjaC4gQW55d2F5LCB5b3UgY2FuIGV4cGVy
aW1lbnQgd2l0aCB0aGUgQkVTTCB2YWx1ZSB0byBoYXZlDQp0aGUgYWNjZXB0YWJsZSBzcGVlZCB3
aGlsZSBzdGlsbCBoYXZlIHBvd2VyIHNhdmluZyBjYXBhYmlsaXR5IChvcg0KY29tcGxldGVseSBk
aXNhYmxlIExQTSBpZiBwb3dlciBzYXZpbmcgaXMgbm90IGFuIGlzc3VlIGZvciB5b3UpLg0KDQpC
UiwNClRoaW5oDQo=
