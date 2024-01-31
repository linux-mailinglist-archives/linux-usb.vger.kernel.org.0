Return-Path: <linux-usb+bounces-5689-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3293B843A46
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 10:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B37142922CB
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 09:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BA67AE68;
	Wed, 31 Jan 2024 09:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fPXSnQUc"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2041.outbound.protection.outlook.com [40.107.13.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEDA664A3;
	Wed, 31 Jan 2024 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706691768; cv=fail; b=aciLL4Gz3v6BePwpcy65dX3C2vShZTM3cGuQM0s4cD0SiDlKd0YdJK4CzN8OgIiDttY6KHC7+OxmAm8fy+eQsTBqiqEz9BWqXgnykOFpSZgAJVm1Yp7nInZVz35H4iLK/TURKiSV7ReNgG9EgNFNTFOx8/73ks9PBFHEq0QQEis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706691768; c=relaxed/simple;
	bh=vOeF4sOU10IPrw27iTgYAobcEwoCZZw120pw6rhjQEw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DeJo0kaodAlcTI8VNwmpwzRBqnKBeVeTkAjM78Dh1jiglV4rAkuGvTBqhZCI3/6cBnbfOQG42cdeXdFWEI0mqbXvmAci1JLmEmlZGHrvV2Th1pcaq8ymcNzBynN+Z+jYQF7c6zal3iKx1VO0Vhtfk773WnGnukigj57oze2OK1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=fPXSnQUc; arc=fail smtp.client-ip=40.107.13.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3J5pdJcNlrC4vYU07iV1ShdoHMMLqMejuFOviPKTX9XTkv19sH124nY7mBVpI1V6HTlJwiS+PoQJ8h9cBPRCq7cWYtCwhEVkP8xaGcGC1VJ0IPuK7TnHQ9NLJyvfDNSs69WhVZRt2hRQT/E8cbUvdYE0TjEud82EixjOMeXECQ907OfCC3W9XTqjffsl3v3cy1FOvFGGeZgYTO+ui9Na7/I/1Ccb454W0NHPtd+wYK17O7wisIyYppJitkpwKXG4Mbuzgca5ebbhRbHD9JK/qud+a+EBXuyu3/PN3ZRnlhuWgZDVCMsSuitGbcrk0gvi445hSCxJjXaSeT7rQhy7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOeF4sOU10IPrw27iTgYAobcEwoCZZw120pw6rhjQEw=;
 b=HF/Rr1inp+PPPadvSt7Quq2KYGYvmbHOBrNiYITUGMtng/SlLbjba5mXUey2lcbOO//eHNBRGXhftoWMx59sDPRCI9Xb7LEwnqn3W0OSMyLuodk6YRWsIW3Wja9u261eNlrNFJvGUndzw8fjccdXOD91eo11SiLBgEGZBGTnVlbbjhKVFqSwZjG+TURlgG4xNjUjeyXKMFYU/XCHXaI/ospC5NbPHK3NawbHgMG+JF9vkbaNMEIbvpeaS/A1pbBLBdVaZe6KdAP38xPLDpw27Uayg0Y3IDOIon6pB1O/WdRyahe3yWPfww70RMsUlaPObgGWGacPilkKdD8oSVtysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOeF4sOU10IPrw27iTgYAobcEwoCZZw120pw6rhjQEw=;
 b=fPXSnQUcFbiBhIFiNHv2tk5sm8zJ6J469WbuWJrCEj2aZq7R1h4V/eVShah4cAsPS6EPIKy16Cg1e1uXLMhOi/9JiwlJaCLKszAart8x7xRxDTEzydUcS/HmZgy/pWHeAnSkbAgTLelXRsi7gK/cXVVeCdBqNRhE0qqF3za9LoU=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7656.eurprd04.prod.outlook.com (2603:10a6:20b:29b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 09:02:42 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 09:02:42 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>
CC: dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Jun Li <jun.li@nxp.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v4 4/7] dt-bindings: usb: ci-hdrc-usb2: add
 restrictions for reg, interrupts, clock and clock-names properties
Thread-Topic: [EXT] Re: [PATCH v4 4/7] dt-bindings: usb: ci-hdrc-usb2: add
 restrictions for reg, interrupts, clock and clock-names properties
Thread-Index: AQHaSqcB79p1gYhHLUyTMBj8CefoV7DxADiAgAKZllCAABN7AIAAANlw
Date: Wed, 31 Jan 2024 09:02:41 +0000
Message-ID:
 <DU2PR04MB8822AF13BEF021D5D615253F8C7C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240119071936.3481439-1-xu.yang_2@nxp.com>
 <20240119071936.3481439-4-xu.yang_2@nxp.com>
 <0a3f5446-7179-4855-b627-72acedebd883@linaro.org>
 <DU2PR04MB88228BAE9D747424B065E5B98C7C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <d9c2bd53-40cb-43b3-b051-616f27b8f49e@linaro.org>
In-Reply-To: <d9c2bd53-40cb-43b3-b051-616f27b8f49e@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|AS8PR04MB7656:EE_
x-ms-office365-filtering-correlation-id: f647b56f-98c8-4e44-b8ac-08dc223b61e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MOvclVdkk45tEa1k1nimo9NbCbflaEKVAdZ9/2hMUDSrquZzLlt2mXQoLW+Ufq72eVN9dL77yEzd6tBcDKRI34OrwLE810djONbym4uDpnQYDsYnncUtqDcGh6ambKT+zMc46fNlbENXSQbD9RcFETpRqUCte70dBpJHJll/a+94YV/u2Xm/3gD5CCUswYEgmZvjQlAQiU/rZDeR320PB73Nh1AlPKJC2eaLzTy07oMLsfgrh7pGsKUut45tpwUWESholCz2DFK/y3nDhjzM38dq1+m5Gdt8vA1TVG8d12MxrtHRWD7NTMvQbkV/ko7Jex+bXT12vZu4bUDD4a6vn8oN5e8IaPuqFNA04ncAWxd4qHooxGga/Addz82AtaGlGqqfYJZvJAGkmswfU2sH9Xc2EV2lMn5ZsJfI/W3qOlZs1Ne02bX4pWuyEHrFS0KGw2nE/KnFAw4F0aGuccVNrYIErHiX9u/8Inz5Ez7r3EGZcCq/gUEHVtEfayzNr+b9nUCY/PzgSZrK1ogGZAHuWutP5l4T0DriOCWR8Le2tUp++xV4+yYffVUjir+t6okxTV1T5ZxKJL5iYzmzI0waNDzlB8KOOLYCcpZpkxM1bxI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38100700002)(122000001)(8936002)(5660300002)(8676002)(316002)(33656002)(7416002)(2906002)(66476007)(66946007)(66556008)(66446008)(38070700009)(54906003)(76116006)(55016003)(64756008)(110136005)(41300700001)(52536014)(4326008)(71200400001)(9686003)(6506007)(86362001)(26005)(83380400001)(7696005)(478600001)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MDc5QmtJVDJPQlN5K0R4RTdCRHFrRUgxSXcyOHBVNi9scjF3cS9OVU1STTV2?=
 =?utf-8?B?anMxSmFpQ1JnMHJJd2cwSmRERWgrUDVJSXdWMWoyWVFMd3k1NDlpTy9kejY5?=
 =?utf-8?B?cko2MjlmRUlJSTJjU2ZYTVZybzE0a2dSaUx5UHVWdThvWEZTbTIvMGdhdnJW?=
 =?utf-8?B?T0NiUFV2ZjdNMlJKejJ6RjRBUnpYeVlqVlFTb1BNS0NzTER5MmFPR3poUFdZ?=
 =?utf-8?B?Z0ZBMldESDFWd3AyRFA3azdtWkpBRDJSQjR3YnJwcjRWdFFySXI3VTFjMWhD?=
 =?utf-8?B?U1pLTUkwWHd1YmdTWmJLc2cwdVJtcDJVRDZ4aVJhYVNQQ1FUYWJjWXpnRnhW?=
 =?utf-8?B?dnkyb3oxbUg4K0NSekpFalJRa0NkSFdLeDdGM0VwOHRrTVhBVkN4eHNYUFR2?=
 =?utf-8?B?NXJZUmp2TFU5d0c1QTEvUUw4MXpLQW13cXlxTGVSOVdaY1NVUTdzbWk2U3FS?=
 =?utf-8?B?UCtqZGtuaGE2VDl1dGYwR2ZCN1pIUWl1VVdvcEJhcXk3cGpSRzNrY3FlQkxR?=
 =?utf-8?B?d2JuZDFvYXJCQ2Z4WmY2LzJoMnhKRGJwUi94bDYrUTRXaU14c0w4ZEJWdU9K?=
 =?utf-8?B?UVRNTGZERkkxMXVVZjFpZVVXVzkrS0ErdmZXR0NkNmwxWHphNWtrMnFYdWM2?=
 =?utf-8?B?ZEJWTjRhdFhVMFJTL2ZUYVZqT0ZISGIzbXZQc2tORzJRZ2JCcEZjQm1peFBl?=
 =?utf-8?B?YW9BUDNBVGQ1SFQ0MFozL2E2RndwZWxWbm9lbHEzei9oeHI0WEU2eWg3azg4?=
 =?utf-8?B?QVI2ZTRWWk9SbWdGb3NDWHlJZ1VEaXFGa1hqODBaVHQ4RGZDMEd4bnVkcllD?=
 =?utf-8?B?aXR1L2ZzSVN4citiVDEyUkEybUY5ZkZGS2svYzllbUNvb1d6MGRwdFY5TTY5?=
 =?utf-8?B?Y1drVHpMTUZYZ05ObVZBTFFCT1N0czNLanNFdDgwVlhsajVsSzFGejNnd21r?=
 =?utf-8?B?a1hZbWQrUEF3cXM5UnlsYzFuSGtjT3ZmMUxGdk9UT1k5RUJuSVhNbk1GU2JH?=
 =?utf-8?B?b0F6NmwremY4bUgwbTh3ZUovVzZXSUxGUU1jU2R0M2h0aVpyV0ljZVZKUXdH?=
 =?utf-8?B?eGFKT3hhcnNVQWNnNGdPK2xvNlpRck81WWF0UnJpY3RUb2tQZmNUa1RiUk56?=
 =?utf-8?B?TnV2ODRuZDgrWm1FZVdYUU1WVlUvSHJjbzNYdkNqWmZjRldOTWcrTnJmNTFT?=
 =?utf-8?B?RTNqcGtRTks3Y0l1V29QUk9NMDZzd2hEZHVsOWplclJwV0JOcUR1Vk9LbERR?=
 =?utf-8?B?WkYxRXFwOUwySXA2Ui9la1JXUHV2QXZud1RHSjVyeXVVMDNrQkVuQldhOGRV?=
 =?utf-8?B?ckcrNDlWeWZNczRpOExsTTVuWTU0WUtlWCtRa3h2NHNGU3NGaWYyMTNWdS9z?=
 =?utf-8?B?SlBOTENGeGU0cWRuNDZPU2U2dm4rMmNMWDlXbkQ4OXhLT2tLS2Z6YjVwTThn?=
 =?utf-8?B?a043VFNlUVFPeVJobHJqWlhJN1k0SkhoNndhald0U0lQS0YzYitNZ082eWgv?=
 =?utf-8?B?eFF1a0g4eWwrY3NIVnNseFFEVGwybEYrK1VhQnl2YU4yV3RjeHNKVi9xZjNo?=
 =?utf-8?B?cG5nTUhEYmZHdXRkWndINkJibnIyODBHcXNZYnFIcm1xMFpubnV6RXpEZjcy?=
 =?utf-8?B?NU1PMldKTHA0YkZ0eDdlV2x6Y1A4SjN1SUFQVVhkQWpEWkNJYlQyRmhWcXVw?=
 =?utf-8?B?SG9EOWRLVG1rSXJhMUFRVHFNbFFaUmlZQjVYVWFBZUZ3VHlaelZoOVZ3Vmdu?=
 =?utf-8?B?alJEeFA5NmVwYkNYLzlKYkdVZWZFUFBLeGNyVEJVenYxVnUwMkNrclpuK2k1?=
 =?utf-8?B?eFZKdnhqVVZzOGFQbHpHeU9odWpaVW90Yi9CUnRzY1BiRXlYQnRVR3orNStW?=
 =?utf-8?B?Vnh3WEM0RWo2M3NpSHpoUDFqQmQyWHkvWVI4Q0FxeGNib3VYTG9abHdZS3RY?=
 =?utf-8?B?aHBHU1R5WGxyYitwNGFKNndpT3pMb3FjelZoRGNpOVFvSnIyd2xwMDRPWWZm?=
 =?utf-8?B?YmVVU3lIOUQ4M0pGOFQ3RENGNnErdXhad1d2cWFvTjBreDdhbkJobUdvKzFs?=
 =?utf-8?B?bXhjcEFlR1p5K0lhV1Zmem8reVZkR2szM0pGckgzNHJnWldwYmNjWHJuVGxE?=
 =?utf-8?Q?uN1E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f647b56f-98c8-4e44-b8ac-08dc223b61e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 09:02:42.0083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FR943uXvfbyZC0YWo8gNEsAhL79cFTRs1NGEQ2D7rVC2dp+5T1PARv/eOKSjs6ERlVOgpefHiiIVhtlYvyfrRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7656

SGkgS3J6eXN6dG9mLA0KDQo+IA0KPiBPbiAzMS8wMS8yMDI0IDA5OjI0LCBYdSBZYW5nIHdyb3Rl
Og0KPiA+IEhpIEtyenlzenRvZiwNCj4gPg0KPiA+Pg0KPiA+PiBPbiAxOS8wMS8yMDI0IDA4OjE5
LCBYdSBZYW5nIHdyb3RlOg0KPiA+Pj4gQ2hhbmdlIHJlZywgaW50ZXJydXB0cywgY2xvY2sgYW5k
IGNsb2NrLW5hbWVzIGFzIGNvbW1vbiBwcm9wZXJ0aWVzIGFuZCBhZGQNCj4gPj4+IHJlc3RyaWN0
aW9ucyBvbiB0aGVtIGZvciBkaWZmZXJlbnQgY29tcGF0aWJsZXMuDQo+ID4+Pg0KPiA+Pj4gU2ln
bmVkLW9mZi1ieTogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+ID4+Pg0KPiA+Pj4gLS0t
DQo+ID4+PiBDaGFuZ2VzIGluIHY0Og0KPiA+Pj4gIC0gbmV3IHBhdGNoIHNpbmNlIHYzJ3MgZGlz
Y3Vzc2lvbg0KPiA+Pj4gIC0gc3BsaXQgdGhlIHJlZywgaW50ZXJydXB0cywgY2xvY2sgYW5kIGNs
b2NrLW5hbWVzIHByb3BlcnRpZXMgaW50bw0KPiA+Pj4gICAgY29tbW9uIHBhcnQgYW5kIGRldmlj
ZS1zcGVjaWZpYw0KPiA+Pj4gLS0tDQo+ID4+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L2NpLWhkcmMtdXNiMi55YW1sIHwgMTE4ICsrKysrKysrKysrKysrKy0tLQ0KPiA+Pj4gIDEgZmls
ZSBjaGFuZ2VkLCAxMDIgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+ID4+Pg0KPiA+
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvY2kt
aGRyYy11c2IyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2Np
LQ0KPiA+PiBoZHJjLXVzYjIueWFtbA0KPiA+Pj4gaW5kZXggYjdlNjY0ZjczOTViLi43OGUzMGNh
MGE4Y2EgMTAwNjQ0DQo+ID4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdXNiL2NpLWhkcmMtdXNiMi55YW1sDQo+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi55YW1sDQo+ID4+PiBAQCAtNzMsMjIgKzcz
LDEwIEBAIHByb3BlcnRpZXM6DQo+ID4+PiAgICAgICAgICAgICAgICAtIG51dm90b24sbnBjbTg0
NS11ZGMNCj4gPj4+ICAgICAgICAgICAgLSBjb25zdDogbnV2b3RvbixucGNtNzUwLXVkYw0KPiA+
Pj4NCj4gPj4+IC0gIHJlZzoNCj4gPj4+IC0gICAgbWluSXRlbXM6IDENCj4gPj4+IC0gICAgbWF4
SXRlbXM6IDINCj4gPj4+IC0NCj4gPj4+IC0gIGludGVycnVwdHM6DQo+ID4+PiAtICAgIG1pbkl0
ZW1zOiAxDQo+ID4+PiAtICAgIG1heEl0ZW1zOiAyDQo+ID4+PiAtDQo+ID4+PiAtICBjbG9ja3M6
DQo+ID4+PiAtICAgIG1pbkl0ZW1zOiAxDQo+ID4+PiAtICAgIG1heEl0ZW1zOiAzDQo+ID4+PiAt
DQo+ID4+PiAtICBjbG9jay1uYW1lczoNCj4gPj4+IC0gICAgbWluSXRlbXM6IDENCj4gPj4+IC0g
ICAgbWF4SXRlbXM6IDMNCj4gPj4NCj4gPj4gV2h5IGFsbCB0aGVzZSBhcmUgZ29uZT8gVGhleSBh
cmUgc3VwcG9zZWQgdG8gYmUgaGVyZS4gWW91ciBpZjp0aGVuOiBvbmx5DQo+ID4+IGN1c3RvbWl6
ZXMgdGhlbS4NCj4gPg0KPiA+IEkgaGF2ZSBhbHNvIGNvbmNlcm5zIG9mIHdoZXRoZXIgdG8gbWFr
ZSB0aGlzIHBhcnQgY29tbW9uLg0KPiA+IEkgd2lsbCByZXZlcnQgdGhpcyBsYXRlci4NCj4gDQo+
IFJldmVydD8gTm8uIFRoaXMgcGF0Y2ggbXVzdCBiZSBjb3JyZWN0Lg0KDQpJIG1lYW4gb25seSB0
aGlzIHBhcnQga2VlcHMgdW5jaGFuZ2VkIGxpa2UgYmVmb3JlLg0KDQo+ID4NCj4gPj4NCj4gPj4+
IC0NCj4gPj4+ICsgIHJlZzogdHJ1ZQ0KPiA+Pj4gKyAgaW50ZXJydXB0czogdHJ1ZQ0KPiA+Pj4g
KyAgY2xvY2tzOiB0cnVlDQo+ID4+PiArICBjbG9jay1uYW1lczogdHJ1ZQ0KPiA+Pg0KPiA+PiBO
by4gVGhlc2UgYXJlIG5vdCBib29sZWFucyBvbiBvdGhlciB2YXJpYW50cy4NCj4gPg0KPiA+IE9r
YXkuDQo+ID4NCj4gPj4NCj4gPj4+ICAgIGRyX21vZGU6IHRydWUNCj4gPj4+DQo+ID4+PiAgICBw
b3dlci1kb21haW5zOg0KPiA+Pj4gQEAgLTQxMiw2ICs0MDAsMTA0IEBAIGFsbE9mOg0KPiA+Pj4g
ICAgICAgICAgc2Ftc3VuZyxwaWNvcGh5LXByZS1lbXAtY3Vyci1jb250cm9sOiBmYWxzZQ0KPiA+
Pj4gICAgICAgICAgc2Ftc3VuZyxwaWNvcGh5LWRjLXZvbC1sZXZlbC1hZGp1c3Q6IGZhbHNlDQo+
ID4+Pg0KPiA+Pj4gKyAgLSBpZjoNCj4gPj4+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+Pj4gKyAg
ICAgICAgY29tcGF0aWJsZToNCj4gPj4+ICsgICAgICAgICAgb25lT2Y6DQo+ID4+PiArICAgICAg
ICAgICAgLSBpdGVtczoNCj4gPj4+ICsgICAgICAgICAgICAgICAgLSBjb25zdDogZnNsLGlteDI3
LXVzYg0KPiA+Pg0KPiA+PiBObywgdGhlIHN5bnRheCB5b3UgbmVlZCBpcyBjb250YWluczouDQo+
ID4+DQo+ID4+IExvb2sgYXQgZXhpc3RpbmcgY29kZSAtIHRoZXJlIGlzIG5vIHNpbmdsZSBiaW5k
aW5nIHdpdGggb25lT2Y6IGluIGlmOiBibG9jay4NCj4gPg0KPiA+IEkgd29uZGVyIHdoeSAnbWFr
ZSBkdF9iaW5kaW5nX2NoZWNrJyBkb2VzIG5vdCByZXBvcnQgdGhpcyBpc3N1ZSBpZiB0aGUgc3lu
dGF4DQo+ID4gaXMgbm90IGNvcnJlY3Q/DQo+IA0KPiBJIGRpZCBub3Qgc2F5IHN5bnRheCBpcyBp
bmNvcnJlY3QuDQo+IA0KPiANCj4gPg0KPiA+IFNvIEkgbmVlZCB0byBhZGQgY29udGFpbnMgYXMg
YmVsb3csIHJpZ2h0Pw0KPiA+DQo+ID4gICAtIGlmOg0KPiA+ICAgICAgIHByb3BlcnRpZXM6DQo+
ID4gICAgICAgICBjb21wYXRpYmxlOg0KPiA+ICAgICAgICAgICBjb250YWluczoNCj4gPiAgICAg
ICAgICAgICBvbmVPZjoNCj4gPiAgICAgICAgICAgICAgIC0gaXRlbXM6DQo+ID4gICAgICAgICAg
ICAgICAgICAgLSBjb25zdDogZnNsLGlteDI3LXVzYg0KPiA+ICAgICAgICAgICAgICAgLSBpdGVt
czoNCj4gPiAgICAgICAgICAgICAgICAgICAtIGVudW06DQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgIC0gZnNsLGlteDI1LXVzYg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAtIGZzbCxpbXgz
NS11c2INCj4gPiAgICAgICAgICAgICAgICAgICAtIGNvbnN0OiBmc2wsaW14MjctdXNiDQo+ID4N
Cj4gPiBUaGUgcHVycG9zZSBvZiB0aGlzIGNvZGUgaXMgdG8gbWF0Y2g6DQo+ID4NCj4gPiAgIC0g
Y29tcGF0aWJsZSA9ICJmc2wsaW14MjctdXNiIjsNCj4gPiAgIC0gY29tcGF0aWJsZSA9ICJmc2ws
aW14MjUtdXNiIiwgImZzbCxpbXgyNy11c2IiOw0KPiA+ICAgLSBjb21wYXRpYmxlID0gImZzbCxp
bXgzNS11c2IiLCAiZnNsLGlteDI3LXVzYiI7DQo+ID4NCj4gPiBidXQgc2hvdWxkIG5vdCBtYXRj
aDoNCj4gPg0KPiA+ICAgLSBjb21wYXRpYmxlID0gImZzbCxpbXg3ZC11c2IiLCAiZnNsLGlteDI3
LXVzYiI7DQo+ID4NCj4gPiBJcyB0aGlzIGZlYXNpYmxlPw0KPiANCj4gU28gbWF5YmUgdGhleSBh
cmUgbm90IGNvbXBhdGlibGU/IFlvdXIgcGF0Y2ggY3JlYXRlcyBzb21lIHVudXN1YWwNCg0KWWVz
LCB0aGV5IGFyZSBub3QgZnVsbHkgY29tcGF0aWJsZS4NCg0KPiBjb25zdHJhaW50cyBmb3IgYWxs
IHRoZSB2YXJpYW50cywgd2hpY2ggaXMgcHJvYmFibHkgcmVzdWx0IG9mIGh1Z2Ugb25lDQo+IGJp
bmRpbmcgZm9yIGFsbCBpbXBsZW1lbnRhdGlvbnMgb2YgcmUtdXNlZCBJUCBibG9jay4gSSBkb24n
dCB0aGluayB0aGF0DQo+IHRoaXMgaHVnZSBpZjogeW91IGFkZCBoZXJlIGFuZCBmdXJ0aGVyIGlu
IHRoZSBwYXRjaCBoZWxwcy4gSnVzdCBsaWtlIGZvcg0KPiBvdGhlciByZS11c2VkIElQIGJsb2Nr
cywgdGhpcyBzaG91bGQgaGF2ZSBjb21tb24gcGFydCBhbmQNCj4gcGVyLWRldmljZS9wZXItZmFt
aWx5L3Blci1pbXBsZW1lbnRhdGlvbiBiaW5kaW5nLg0KDQpBY3R1YWxseSBJJ3ZlIHRlc3RlZCBh
bGwgZHRzIGZpbGVzIChub3Qgb25seSBpbXggcGFydHMpIGFnYWluc3QgdGhpcyBkdC1iaW5kaW5n
IHlhbWwuDQoNClRoZW4gSSdsbCByZXdvcmsgdGhpcyBwYXRjaCB0byBmb2N1cyBvbiBpbXggcGFy
dHMuIEknbSBub3Qgc3VyZSBpZiBzb21lb25lIHdpbGwgYWRkDQpyZXN0cmljdGlvbnMgZm9yIHRo
ZWlyIGZhbWlseS9kZXZpY2UgaW4gdGhlIGZ1dHVyZS4NCg0KVGhhbmtzLA0KWHUgWWFuZw0K

