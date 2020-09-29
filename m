Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC40727D592
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 20:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgI2SN4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 14:13:56 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45426 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725320AbgI2SN4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 14:13:56 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 181FCC0711;
        Tue, 29 Sep 2020 18:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601403234; bh=Q6TaX+I6gsqV+L9kAVMjSEhtKicyg1qNtaIlMlHlN4U=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=JHZP6FnowvbWjNym030ufkwShjKneIPesO7z/vOjZzBuSbq5UJzDFkgTxydjyxUMw
         zBZOJ3WcD5PzI6ETOKQgYhARdVj/7xdFSDsrykaRKynQPfH/ijY2qbwnUYQzPdxdFX
         oxSCJaIwersWyGHQsx7emjhajiJsbvH3BXlLqQ856nSr3XMHbkX9FgdlBW16iCvW5Z
         TzwMvchesp4RSLfSHd8saClcfdABv1VwaleOJZNswqjQXPohAn54+cYqz5leNESbee
         SqQTOS9VuaqCm+wHhinmu+7CHuuT2KiykrEWnZ+Z6LKCaR7HlkwFDru2RfV9w+HC/X
         tKgpz9E2QZxDw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id C6808A0082;
        Tue, 29 Sep 2020 18:13:52 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 79512400C6;
        Tue, 29 Sep 2020 18:13:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="t8kGP8fV";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHgMAYmomxCV69diBBQvnmLDm/TT6G8QYEa+IcGRD3GCkXD1esC6at98OJjCIRsDPKczh+BSyVyETtD9XVSVVrofWWCTRVxtvtYK1HjluD308/YowTvMt0Un3uf/ek9KBCnrxkapUCTJEwfuZ6cbDfoSNhamHUzuiFYgVZhmg/69mfFU9x50MRYINJ8wQMi1blLgfiUJNkdqe8k1n3ObCnnzXG3L+JF+/X2tjr9pZQ81/nbvSS5ebxDgwAh64GGY9vF86/m1E1/+P3iPbFyM79g5SZkU61h36LM9BexsLA0t1jgHC8BTj+MnTBmab5rCfc1eaoMBAvQfNW/hMic4gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6TaX+I6gsqV+L9kAVMjSEhtKicyg1qNtaIlMlHlN4U=;
 b=AigY0ph6YIFjmXAr6Mtn0FUgLEO89ZZAK2gUhXura9spTmqvd1s0q0sASuXU2Npd5wmnipqUJHrNhF+J9sUPXx1P2egekk0yxakZOTBlvUIGutnMDHJ3krZvyKLEOe1FrY/vD2qTwz9uIayZ7l1TBl0emV19Fv0/9C8du+PUycEtBIHkBH7BE/wUbQjboUPayMwn40a9xNLybQzkundC0plghwc39gBAHwtB7olSGT9Wy5NeiDITVeUz762OgJGuZTh6NwbzbJ7N3JsP+iKod3s4/9fwouBODYLHe4rhTknDt+rA8OggOGzXsAdJTgYN62ATKGUcNQMsILHPUgmFBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6TaX+I6gsqV+L9kAVMjSEhtKicyg1qNtaIlMlHlN4U=;
 b=t8kGP8fVq/8Rqqd+VM/h1wx2LCjr/QUhjMFIN9JHjqfo2NcXn68iO+pUdXtpLGRtlTIaRsWnBDqYXnp7icC69dCWGS8qwKXttICjGzkbmjVyr4OfGctpJlsr/OpzkxBu6f/TEsMpAdpXccW7g5W0QR5CTY7RugLTwKsvnaALL7Y=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4306.namprd12.prod.outlook.com (2603:10b6:a03:206::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Tue, 29 Sep
 2020 18:13:49 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209%7]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 18:13:49 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dejin Zheng <zhengdejin5@gmail.com>, Jun Li <jun.li@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v5 00/12] usb: Handle different sublink speeds
Thread-Topic: [PATCH v5 00/12] usb: Handle different sublink speeds
Thread-Index: AQHWkuVptHBFlYUXI0q2G4hsBmJNEal/8sIA
Date:   Tue, 29 Sep 2020 18:13:49 +0000
Message-ID: <584cf071-5ff5-8874-4d64-ed3e510f48a6@synopsys.com>
References: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ffdab77-959c-4469-dd0f-08d864a36a02
x-ms-traffictypediagnostic: BY5PR12MB4306:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB430634C3FFC3658CEC509D4FAA320@BY5PR12MB4306.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1qk0thMhuu8RAcGtrdh4drZSogTkGX96SVvgZys9j1aSo3tgDTim17Ve2ehxiQTrJetOC9v9rqnCGu2wXGDYeO7o9HFK/uTQFhP4zCW5w7MGs4RD6EQyFtZj8oIDMjrUJZf1BZcpN5cmSGQHMBw/UARXIG7NUpofi1yKzyDoceUpeT9QNVLBMFo21GizJVFdYP0jyCnfhWlOEFLZt5enGo+aAYClMpV+8scItHAkMxED6ksqex9Y06AWaBEubvVDGlnGQwg3rWPn1u34vpDo3kpbatowaqb5sGhp8eqr/2HsQA3teEginjB7Ridy9xKWymilz6Ot+KNcSjI8FsPSSfUORzwnglSRjz5Jj+GVp1lUVfSuqq1cy20tMyzaCIUCcDcgY56MRjaxDyox89JPt/mg81pLUX7cyCaJ0SPp/hbWp9sudeI1jfJrf7OE/3dF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39840400004)(83380400001)(76116006)(186003)(7416002)(4326008)(107886003)(6506007)(66946007)(66476007)(66556008)(26005)(86362001)(71200400001)(5660300002)(6512007)(31686004)(6486002)(8936002)(31696002)(2616005)(36756003)(316002)(478600001)(8676002)(110136005)(2906002)(66446008)(64756008)(921003)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ck9xPt5cde0tF6drGAAT8D3WQXpzXHBMcU6IYkwYglukXBF9JBnPXyuNnlPKkr7j8o7Ke1ZNraqw5e4m8RZT0YTZNurlp2xDgRv07pSbKmuTuqWRMjyqhCyBF4gp/euTR0/sS60KTV4Cd9TbpHjmeFxe0SCxQsZ2La5p1/hMaWJyUzo2fFdd4BFRwCmdytn2oHaK3mA78VGVvMM7UlLFShiA4MRfRe8+v9oxrbtjLrV67GPrSCqZfu8qrQf4yI7RSy+fukSB9Eqj5oP7+6WuiGE7K8P3ZEPKG/nciQIQ40XWevLPG1M1FcK3lt1XX6EtiTKkUo8yr9Utwss5pY39CNzrYLOrZfn7TtjK3Qdeq1NHmdCNv+CQ9mz8knSveSTPz4kHUQifVIDhLP250Z4PR5C8AyPTTYZRdk4ONOy+A6Nh1QIQ0jMKBC15G4nlBaoD4BVf4qmtxzvIrFkXR2at1A+hthy6R3XUGKO8dmnqdXNHq6OQf/5Pc7QYwrCcRQYfVDUEIjiLlQM2ALbWIso3nTcN5929UJ0fw//GlpRXSyxyYm1//i72GG8oTl3I+19rvhl3TRaVPFY4RhgDH5jY1n/b342XmDX6vErBzD26FJjLIbo51t9O33JmGAGMGp0VvFgDIH0H3E15a5cWbBDFaw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F469173AAC05A443A6201DC0A2A85258@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffdab77-959c-4469-dd0f-08d864a36a02
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 18:13:49.2275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PMWPwYGniCEm85PWI6HXLgevhDzgbk9xAFwjBeAZDzkpTHsjVyurQpMb/L5+PM1PaRkrw4bhj8z/mlpmwkFj1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3JlZy9GZWxpcGUsDQoNClRoaW5oIE5ndXllbiB3cm90ZToNCj4gQSBVU0Igc3VwZXItc3Bl
ZWQtcGx1cyBkZXZpY2UgbWF5IG9wZXJhdGUgYXQgZGlmZmVyZW50IHN1Ymxpbmsgc3BlZWQgYW5k
IGxhbmUNCj4gY291bnQgKGUuZy4gZ2VuMngyLCBnZW4xeDIsIG9yIGdlbjJ4MSkuIFRoZSB1c2Ig
Z2FkZ2V0IHN0YWNrIG5lZWRzIHRvIGJlIGFibGUNCj4gdG8gaGFuZGxlIGEgY291cGxlIHRoaW5n
czoNCj4NCj4gMSkgUmVwb3J0IHRoZSBzdWJsaW5rIHNwZWVkIGF0dHJpYnV0ZXMgdGhlIGRldmlj
ZSBzdXBwb3J0DQo+IDIpIFNlbGVjdCB0aGUgc3VibGluayBzcGVlZCBhdHRyaWJ1dGUNCj4NCj4g
VGhpcyBzZXJpZXMgaW50cm9kdWNlcyBzdWJsaW5rIHNwZWVkIGF0dHJpYnV0ZSBzdHJ1Y3R1cmUg
dG8gY2g5LmggdG8gY2FwdHVyZQ0KPiB0aGUgZGV2aWNlIGNhcGFiaWxpdHkgb2YgdGhlIGdhZGdl
dC4gSXQgYWxzbyBpbnRyb2R1Y2VzIGEgbmV3IGdhZGdldCBvcHMNCj4gdWRjX3NldF9udW1fbGFu
ZXNfYW5kX3NwZWVkIHRvIHNlbGVjdCBhIHNwZWNpZmljIHN1Ymxpbmsgc3BlZWQuDQo+DQo+IERX
QzMgbmVlZHMgdGhpcyBzdXBwb3J0IGZvciBEV0NfdXNiMzIgSVAuIEltcGxlbWVudCB0aGUgbmV3
IGNoYW5nZXMgZm9yIERXQzMuDQo+DQo+IENoYW5nZXMgaW4gdjU6DQo+ICAtIFJlYmFzZSBvbiBG
ZWxpcGUncyB0ZXN0aW5nL25leHQgYnJhbmNoDQo+ICAtIENoYW5nZWQgU2lnbmVkLW9mZi1ieSBl
bWFpbCB0byBtYXRjaCBGcm9tOiBlbWFpbCBoZWFkZXINCj4gIC0gQWRkIFJvYidzIFJldmlld2Vk
LWJ5DQo+DQo+IENoYW5nZXMgaW4gdjQ6DQo+ICAtIEluc3RlYWQgb2YgdXNpbmcgYSBzaW5nbGUg
ZnVuY3Rpb24gdG8gcGFyc2UgIm1heGltdW0tc3BlZWQiIHByb3BlcnR5IGZvcg0KPiAgICBzcGVl
ZCwgZ2VuIFgsIGFuZCBudW1iZXIgb2YgbGFuZXMsIHNwbGl0IHRob3NlIHRhc2tzIHRvIHNlcGFy
YXRlIGNvbW1vbg0KPiAgICBmdW5jdGlvbnMNCj4gIC0gUmV2aXNlIERXQzMgZHJpdmVyIHRvIHVz
ZSB0aG9zZSBuZXcgY29tbW9uIGZ1bmN0aW9ucw0KPiAgLSBGaXggY2hlY2twYXRjaCB3YXJuaW5n
cyBmb3IgdXNpbmcgInVuc2lnbmVkIiByYXRoZXIgdGhhbiAidW5zaWduZWQgaW50IiBhbmQNCj4g
ICAgbWlzc2luZyBpZGVudGlmaWVyIG5hbWUgaW4gdWRjX3NldF9udW1fbGFuZXNfYW5kX3NwZWVk
IGdhZGdldCBvcHMNCj4NCj4gQ2hhbmdlcyBpbiB2MzoNCj4gIC0gUmVtb3ZlICJudW0tbGFuZXMi
IGFuZCAibGFuZS1zcGVlZC1tYW50aXNzYS1nYnBzIiBjb21tb24gcHJvcGVydGllcw0KPiAgLSBS
ZW1vdmUgIm51bS1sYW5lcyIgYW5kICJsYW5lLXNwZWVkLW1hbnRpc3NhLWdicHMiIHByb3BlcnRp
ZXMgdmFsaWRhdGlvbiBpbiBkd2MzDQo+ICAtIFVwZGF0ZSAibWF4aW11bS1zcGVlZCIgdG8gc3Vw
cG9ydCB2YXJpYXRpb25zIG9mIFNTUCBHZW4gWCB4IFkNCj4gIC0gVXBkYXRlIGNvbW1vbiBmdW5j
dGlvbiB0byBwYXJzZSBuZXcgc3RyaW5ncyBmb3IgIm1heGltdW0tc3BlZWQiDQo+ICAtIFVwZGF0
ZSBjb21taXQgbWVzc2FnZXMgZm9yIHRoZSBuZXcgY2hhbmdlcw0KPg0KPiBDaGFuZ2VzIGluIHYy
Og0KPiAgLSBNb3ZlIHVzYl9zdWJsaW5rX3NwZWVkIGF0dHJpYnV0ZSBzdHJ1Y3QgYW5kIGVudW0g
dG8gaW5jbHVkZS9saW51eC91c2IvY2g5LmgNCj4gIC0gVXNlICJudW0tbGFuZXMiIGFuZCAibGFu
ZS1zcGVlZC1tYW50aXNzYS1nYnBzIiBhcyBjb21tb24gcHJvcGVydGllcyBpbnN0ZWFkDQo+ICAt
IEFkZCBjb21tb24gZnVuY3Rpb25zIHRvIGdldCBudW0tbGFuZXMgYW5kIGxzbSBwcm9wZXJ0aWVz
DQo+ICAtIEZpeCBtaXNzaW5nIGdlbjF4MiBzdWJsaW5rIHNwZWVkIGF0dHJpYnV0ZSBjaGVjayBy
ZXBvcnQgaW4gZHdjMw0KPg0KPg0KPiBUaGluaCBOZ3V5ZW4gKDEyKToNCj4gICB1c2I6IGNoOTog
QWRkIHN1Ymxpbmsgc3BlZWQgc3RydWN0DQo+ICAgdXNiOiBnYWRnZXQ6IGNvbXBvc2l0ZTogQXZv
aWQgdXNpbmcgbWFnaWMgbnVtYmVycw0KPiAgIHVzYjogZ2FkZ2V0OiBFeHBvc2Ugc3VibGluayBz
cGVlZCBhdHRyaWJ1dGVzDQo+ICAgdXNiOiBnYWRnZXQ6IFNldCBtYXggc3BlZWQgZm9yIFNTUCBk
ZXZpY2VzDQo+ICAgdXNiOiBjb21wb3NpdGU6IFByb3Blcmx5IHJlcG9ydCBzdWJsaW5rIHNwZWVk
DQo+ICAgdXNiOiBkZXZpY2V0cmVlOiBJbmNsdWRlIFVTQiBTU1AgR2VuIFggeCBZDQo+ICAgdXNi
OiBjb21tb246IEFkZCBhbmQgdXBkYXRlIGNvbW1vbiBmdW5jdGlvbnMgZm9yIFNTUCBzcGVlZHMN
Cj4gICB1c2I6IGR3YzM6IEluaXRpYWxpemUgbGFuZSBjb3VudCBhbmQgc3VibGluayBzcGVlZA0K
PiAgIHVzYjogZHdjMzogZ2FkZ2V0OiBSZXBvcnQgc3VibGluayBzcGVlZCBjYXBhYmlsaXR5DQo+
ICAgdXNiOiBkd2MzOiBnYWRnZXQ6IEltcGxlbWVudCBzZXR0aW5nIG9mIHN1Ymxpbmsgc3BlZWQN
Cj4gICB1c2I6IGR3YzM6IGdhZGdldDogVHJhY2sgY29ubmVjdGVkIGxhbmUgYW5kIHN1Ymxpbmsg
c3BlZWQNCj4gICB1c2I6IGR3YzM6IGdhZGdldDogU2V0IHNwZWVkIG9ubHkgdXAgdG8gdGhlIG1h
eCBzdXBwb3J0ZWQNCj4NCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9nZW5lcmljLnR4
dCAgICAgICB8ICAxMSArLQ0KPiAgZHJpdmVycy91c2IvY29tbW9uL2NvbW1vbi5jICAgICAgICAg
ICAgICAgICAgIHwgIDQ2ICsrKysrLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDI5ICsrKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5oICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxNCArKw0KPiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQu
YyAgICAgICAgICAgICAgICAgICAgIHwgMTQzICsrKysrKysrKysrKysrKysrLQ0KPiAgZHJpdmVy
cy91c2IvZ2FkZ2V0L2NvbXBvc2l0ZS5jICAgICAgICAgICAgICAgIHwgIDgxICsrKysrKy0tLS0N
Cj4gIGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvY29yZS5jICAgICAgICAgICAgICAgICB8ICAyNCAr
Ky0NCj4gIGluY2x1ZGUvbGludXgvdXNiL2NoOS5oICAgICAgICAgICAgICAgICAgICAgICB8ICA3
MyArKysrKysrKysNCj4gIGluY2x1ZGUvbGludXgvdXNiL2dhZGdldC5oICAgICAgICAgICAgICAg
ICAgICB8ICAyMyArKysNCj4gIDkgZmlsZXMgY2hhbmdlZCwgNDAzIGluc2VydGlvbnMoKyksIDQx
IGRlbGV0aW9ucygtKQ0KPg0KPg0KPiBiYXNlLWNvbW1pdDogMWIyODY4N2E5YzY3OTQ5OWRkYWE0
NmRhYzZjYTM2NjBlNDY4MDFjNQ0KDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IGhhdmUgYW55
IHF1ZXN0aW9uL2NvbmNlcm4gcmVsYXRlZCB0byB0aGVzZQ0KcGF0Y2hlcy4NCg0KVGhhbmtzLA0K
VGhpbmgNCg==
