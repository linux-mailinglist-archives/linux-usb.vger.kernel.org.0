Return-Path: <linux-usb+bounces-5102-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC5382EA94
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 09:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0094E1F24145
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 08:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CDA11CA9;
	Tue, 16 Jan 2024 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="dKQEgUjZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2064.outbound.protection.outlook.com [40.107.105.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1243912B80;
	Tue, 16 Jan 2024 07:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsGBkOGNCw/sOnWX6W4oOal4gsNIbLS5Iu1GwZ6f6KThS2CxUEmO43yNjrx+ell50l1AtUDqCCPw86mwo1wXmup7xJlQqajUE3Oq7oQefqPPwhVD2IfKpaOjkakxRvYQegT4dWTmfDOIEGpUIV8nYIej0FfgGFEusLKVr3NEhi9DRM4xo5MW8CF+S3293uH9YYOM+Ax6VnIMf7CZY6aEJtdDyCcSRqenq7tb/4SGF10urZECuTMjXqIlvV/BRZV1dXKoaE5KG9szd192R9Q2FRp3M/+Gq5PyL2ChvoFbljhlrTZUOyDVaS0glq5qZr+luzP/04tZAamU7G9K2Wf//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCQvfSJ5X9xFGXTv2uq0PSRGGY88egMqjzzlc0SQEGQ=;
 b=jT/SNKVOslWreGEQOeL05VxQfAUDjbzmMK8GdThNxOEkT9skfjPTeLx6XxhaOc/kY3c0NfJjaPxGDL2QlR3DAwgOmG1iTwU/fO4L3U04xnEhhPAm1vhc/wcS8WNh/8FJYv/hMBJBgpZ9bIsn1iRtErg1y9D7vLZcM+JdeSyAbvBeJOmB29UNIDC3cyzkDGhKBeO/gKBxi1xBPybUBZ3Vszsb7ZNGX7xLPLvE9cdMUz7jmLey/l+KCFL4uWmsLDry1dfXTJyV2iNQ6nVktnoPX+20y2SJb/3Y2FpYd7BMpUTRirAi8qTh4GUCkWIqbR0bQKYnjVCxDUDn3OkL2Ncfog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCQvfSJ5X9xFGXTv2uq0PSRGGY88egMqjzzlc0SQEGQ=;
 b=dKQEgUjZ1jAk0cyjI4pgTaB9mqnYn76vKt/QkmZORgHF7bBmieuILbajHibQCL8ItP5Q16LvlvJmtMsDkxLALRYdh2qRUtyEUovqUa2txrplfglkwPfSY0JYBS/AEM5bf01jzQk+JFkd9Hdd4v0cQcfBh3hBjOj9gUwavE7ptSo=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU2PR04MB8662.eurprd04.prod.outlook.com (2603:10a6:10:2dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.29; Tue, 16 Jan
 2024 07:59:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.029; Tue, 16 Jan 2024
 07:59:57 +0000
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
Subject: RE: [EXT] Re: [PATCH v3 4/6] dt-bindings: usb: ci-hdrc-usb2: add
 compatible and clock-names restriction for imx93
Thread-Topic: [EXT] Re: [PATCH v3 4/6] dt-bindings: usb: ci-hdrc-usb2: add
 compatible and clock-names restriction for imx93
Thread-Index: AQHaRUgjzNmZ+WDWXkmfSRtDZkmevLDaubUAgAFTw5CAAAnPgIAAAYjQ
Date: Tue, 16 Jan 2024 07:59:56 +0000
Message-ID:
 <DU2PR04MB8822CF6BF97B6FA5AD4198168C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240112111747.1250915-1-xu.yang_2@nxp.com>
 <20240112111747.1250915-4-xu.yang_2@nxp.com>
 <3ade5e2c-e3dc-4cf4-9c12-2487e30a2253@linaro.org>
 <DU2PR04MB8822D31A8AD7BEE1F50AC78A8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <95e2b70e-c6fb-4c10-b341-efd1f9cbf6e6@linaro.org>
In-Reply-To: <95e2b70e-c6fb-4c10-b341-efd1f9cbf6e6@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|DU2PR04MB8662:EE_
x-ms-office365-filtering-correlation-id: 94998da5-444b-4e43-2e25-08dc16692195
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 k89p78Ex3NLNR8wdN2vH0G2Z7YLa0RYYv4K2ROb3fJhpoGYX8d0I+5RlTbfgxIaIDFmrBzpgOyCdON+3m2UyKkd7ww/Hy3U2C4TYwnZzKI+XCnlmHxP1EJAs13P8oFC5F5K7R3b9jMALCDG+eyDr01hnczlQ8DpcUYd5p7ptuyUeZk7JX5yfJq0rEPTs98GjjQPjXwDFfwSRSpqhLYUDrqSUA9OpCcjrPMpDjIowx5o4wma9vQZk0VMMKhRyCt8D2Xos6JntfN+dAB2awtIq/aZo8K2k9kwQP1kW0xOpo8ojxcpG5vWtolvNydlpVnMMm00jHvNo+n11hqBSpqcfc5iGNms9Usx2r/wL4CdJAIMFtA0jBVJPN52/nLKtRpuZp26tr4dMVUqFF+wC3kTZHiU0JAolPWQl+N3+mqTLrHlJ18y0x/jIrqPhjymAMMQ4NxCjZyI9OmxXWmZDqQrAAdWgm8Lv3kMXVR8ljkD3UAHuWdwYldmEYY+Yv7D85koqN8UyOx8tDtYk/gkpmCVSU3XstdSCdBdEI9v9mTdh5w3np8hTisQGIafTIuMcnDoJ7Tis1ycaQsyWF6HeSm/ZRepSegTuc7XSTVCiU5IJtCBONHQn9cPDedUgi0XantgN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(4326008)(52536014)(2906002)(7416002)(5660300002)(478600001)(33656002)(86362001)(71200400001)(38070700009)(38100700002)(53546011)(9686003)(83380400001)(122000001)(41300700001)(6506007)(7696005)(110136005)(54906003)(316002)(66946007)(64756008)(66556008)(66446008)(66476007)(8676002)(8936002)(76116006)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bDV3QU1KcDhlaVQxUGtPWWg4c0J2Zm1vangyL2pTbkovWnROdk52dlNEb3VZ?=
 =?utf-8?B?Y2pyK3dyNTlwYUgzUjBSSmFhenZUTUJ2TEdHajA1UTVtdkNqcEpzdGxnN2V4?=
 =?utf-8?B?cjVsTERWTEd5UktRNk5vcmlOUmFZWS82NjN2aW9xb0lIVGVaa0lGczNpQ2tz?=
 =?utf-8?B?cHFFUFFoUFErZ0EzOTlmOFlxSmJmMWN5MHN6aGI3UlcrbnVYZDZPdldnSUxE?=
 =?utf-8?B?MzFObzRKZWIzTWRmZ0NTcGpPaDhHSHEweTZkV3krNlIrWk5xUnFmd3E5S0M1?=
 =?utf-8?B?eVRDKzN1Q0tLNGUvaS9nelZ4cG5BazJTakhZTnJYTVhxN05SNVNDZHZlbXV6?=
 =?utf-8?B?Qkw0blM0Wm9YWm5iTTByWjBjS3hsalhURVpNL0JvRE9EWU8vVStLS3JVeWVW?=
 =?utf-8?B?NFc2TVdaQlZZZ2tHdFpxbHArOW9KejdLVjVYT1ZPc0FPc1BpRWVlS3pNSlJt?=
 =?utf-8?B?NXduUXFHbWJzZngrcGN6Vk1BNEF6eTFCbU8ycDRUb2pRT2NyT3VUaE5zN3BJ?=
 =?utf-8?B?aDAxdDc2bVBqU3dXZzdLeW9xcm55aWFjSFlIMktnKy9qcW9MVExNWFNiR0h1?=
 =?utf-8?B?OGR3T0tTa3huYXUrVlBudlk5WnVsc1N4N0pSa2tiRTNVdldDU2hWZm1WVUZ0?=
 =?utf-8?B?cDN2L0VRanh1N0cweEV5ZTAxNHhWZysycUE0aS9yaVVZMmYxMFNVUWlDb0Nk?=
 =?utf-8?B?eEVZV3RqdWc4bkJpaGlGdWpVcE9Ob2t4YW5vbzJyRmdlOWEvSllxVUtKN1VY?=
 =?utf-8?B?WXNLZjRockNDRTFDYjdyalk2d0sva2F2Y1pHa2VmclMxRWhwUyt3VEZiM25h?=
 =?utf-8?B?RmtNZk90UklDcUk5czBNOW5SYVg4dkVKR1VFUEkxdlgvU0xWbjBsL3VYWFMx?=
 =?utf-8?B?RUZHc1U5NkcyNWF2MmRYUkN1WDdiSTY5c29wNzQ4M0hWaXRKK0dyb0JiVVpX?=
 =?utf-8?B?aUNzYTJCdjNuRkNUeEI3UkhjcnppcHVKZXN4SkdOL3NMVWNDQWdKekt3bnFV?=
 =?utf-8?B?eHcvZ3FNbHBHTTRJMWFMK2NIQUJ1RDJDTm5CZVJuYTFUQnFxcVJZMDQ2UzBt?=
 =?utf-8?B?UDdlTU96UzczNG9ydkZuZzBrc09KVmZzdzQvRkx4Sk9mVEt1T0JBM25rb2d0?=
 =?utf-8?B?T2JvQ0dmZUJtYkx6Nkt2WFpVUllTWEhqOWZnQXV5S3Z6Y1lmcFdmL0RNT0xG?=
 =?utf-8?B?eGlsMVd1K0hobmRZMjA4Y3FZYm94QlZxdGZzYkFFL0FXWFNITTVMTlVTRC9O?=
 =?utf-8?B?TGs1VWRxKzN6STdkalBZTnhHbXUzcVNYeGJTd1RLUmNUZ2ZjRURSaFg5eDl1?=
 =?utf-8?B?Ym5ETnJhaXROa2VHMHc0WXlaWTR4WXpDZGxmYWxDQVhEM0pxcC9oZnhiZ0F1?=
 =?utf-8?B?aWllOWtTRnEzeWYrOFZIQk15RWxqbDhuZ2RRT1JoMVYyTXl0VGJCYzVVS1Zy?=
 =?utf-8?B?RzEwS1RIanoyZ0JScFk4UkVQUWRsdTBWZDZPRlZGM0xES3d5M3BPcHZYYm0z?=
 =?utf-8?B?WGtJN0ZQcndCekZkR1ZDcHFlUURLVy9uaTRZVUVETDJEcDdtaXA4eCt4elZw?=
 =?utf-8?B?UXpBc3g2VFVTbkF4Y29SQ0t3MmwvWjlzalpEa2xjb2lpRnBQU0xhMGZ2ckhO?=
 =?utf-8?B?OEJFL1BuQzNRZUhveHhJcWFTdWFrbjZqbTd0Q0pLYW9ub1Z1VzBkdVJmejRS?=
 =?utf-8?B?TE1VL1FPb1FXRkJSUllTMmtRUUZVWHJ0STlLOGsvZVIzcnlZWUtYVmJUMlgv?=
 =?utf-8?B?M3FtcWRLTWd1U3hNSUM1T0FZU0tTQ0hCSEhCUHNIbjFLTENkNC90Q0dOY1ZF?=
 =?utf-8?B?U0k5V3N1c040VGh3VlMwQldXZ0ZlZ1VKdG9nbWtTMVBrVVI0bVBEa2JOSmp0?=
 =?utf-8?B?b3JlVk41QlJIb0UvdmVNbDlhWEZkMHBPZkJPejV1VWtZVW9hakRVQ2Z2QUhT?=
 =?utf-8?B?cTdrbm5kbWRFN3JaR20wZ1p5a3F0QTJVOUFXakI0SHFvU3orSTRvNzRVRmJI?=
 =?utf-8?B?Z1RiYjVFZGZianAwN0tFckMxRXJaK0c5K0VrUy9IN0RzUllwR0czR0JiY2E4?=
 =?utf-8?B?UGcrTjhWWUhuc3lQMGwwSWVRYy9ISzR5OHFpUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 94998da5-444b-4e43-2e25-08dc16692195
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 07:59:57.0025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EfQfRMC4DxhThUzygiFcjp/Ek01BsQgOUjulpDwmu/WVVJmSUCuLFM/HGkFjLOYz0+IHZ9FKqBcChci+qbEaTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8662

SGkgS3J6eXN6dG9mLA0KDQo+IA0KPiBPbiAxNi8wMS8yMDI0IDA4OjQ5LCBYdSBZYW5nIHdyb3Rl
Og0KPiA+IEhpIEtyenlzenRvZiwNCj4gPg0KPiA+Pg0KPiA+PiBPbiAxMi8wMS8yMDI0IDEyOjE3
LCBYdSBZYW5nIHdyb3RlOg0KPiA+Pj4gVGhlIGkuTVg5MyBuZWVkcyBhIHdha3VwIGNsb2NrIHRv
IHdvcmsgcHJvcGVybHkuIFRoaXMgd2lsbCBhZGQgY29tcGF0aWJsZQ0KPiA+Pj4gYW5kIHJlc3Ry
aWN0aW9uIGZvciBpLk1YOTMgcGxhdGZvcm0uDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTog
WHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+ID4+Pg0KPiA+Pj4gLS0tDQo+ID4+PiBDaGFu
Z2VzIGluIHYyOg0KPiA+Pj4gIC0gbm8gY2hhbmdlcw0KPiA+Pj4gQ2hhbmdlcyBpbiB2MzoNCj4g
Pj4+ICAtIGFkZCBjbG9ja3MgcmVzdHJpY3Rpb24NCj4gPj4+IC0tLQ0KPiA+Pj4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVzYjIueWFtbCAgICB8IDE2ICsrKysrKysrKysr
KysrKysNCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4NCj4g
Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2Np
LWhkcmMtdXNiMi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9j
aS0NCj4gPj4gaGRyYy11c2IyLnlhbWwNCj4gPj4+IGluZGV4IGI3ZTY2NGY3Mzk1Yi4uNmU3NTA5
OWI2Mzk0IDEwMDY0NA0KPiA+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi9jaS1oZHJjLXVzYjIueWFtbA0KPiA+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVzYjIueWFtbA0KPiA+Pj4gQEAgLTU3LDYgKzU3
LDcgQEAgcHJvcGVydGllczoNCj4gPj4+ICAgICAgICAgICAgLSBlbnVtOg0KPiA+Pj4gICAgICAg
ICAgICAgICAgLSBmc2wsaW14OG1tLXVzYg0KPiA+Pj4gICAgICAgICAgICAgICAgLSBmc2wsaW14
OG1uLXVzYg0KPiA+Pj4gKyAgICAgICAgICAgICAgLSBmc2wsaW14OTMtdXNiDQo+ID4+PiAgICAg
ICAgICAgIC0gY29uc3Q6IGZzbCxpbXg3ZC11c2INCj4gPj4+ICAgICAgICAgICAgLSBjb25zdDog
ZnNsLGlteDI3LXVzYg0KPiA+Pj4gICAgICAgIC0gaXRlbXM6DQo+ID4+PiBAQCAtNDEyLDYgKzQx
MywyMSBAQCBhbGxPZjoNCj4gPj4+ICAgICAgICAgIHNhbXN1bmcscGljb3BoeS1wcmUtZW1wLWN1
cnItY29udHJvbDogZmFsc2UNCj4gPj4+ICAgICAgICAgIHNhbXN1bmcscGljb3BoeS1kYy12b2wt
bGV2ZWwtYWRqdXN0OiBmYWxzZQ0KPiA+Pj4NCj4gPj4+ICsgIC0gaWY6DQo+ID4+PiArICAgICAg
cHJvcGVydGllczoNCj4gPj4+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4+PiArICAgICAgICAg
IGNvbnRhaW5zOg0KPiA+Pj4gKyAgICAgICAgICAgIGNvbnN0OiBmc2wsaW14OTMtdXNiDQo+ID4+
PiArICAgIHRoZW46DQo+ID4+PiArICAgICAgcHJvcGVydGllczoNCj4gPj4+ICsgICAgICAgIGNs
b2NrLW5hbWVzOg0KPiA+Pj4gKyAgICAgICAgICBpdGVtczoNCj4gPj4+ICsgICAgICAgICAgICAt
IGNvbnN0OiB1c2JfY3RybF9yb290X2Nsaw0KPiA+Pj4gKyAgICAgICAgICAgIC0gY29uc3Q6IHVz
Yl93YWtldXBfY2xrDQo+ID4+PiArICAgICAgICBjbG9ja3M6DQo+ID4+PiArICAgICAgICAgIG1p
bkl0ZW1zOiAyDQo+ID4+PiArICAgICAgICAgIG1heEl0ZW1zOiAyDQo+ID4+DQo+ID4+IE5vdGhp
bmcgaW1wcm92ZWQgcmVnYXJkaW5nIG15IGNvbW1lbnRzLiBXaHkgZG8geW91IGFsbG93DQo+ID4+
IGFueS91bnNwZWNpZmljL3VuY29uc3RyYWluIGludGVycnVwdHMgYW5kIHJlZz8NCj4gPj4NCj4g
Pj4gWW91IHNhaWQ6DQo+ID4+ICJIb3dldmVyLCByZXNldCwgcmVnIGFuZCBpbnRlcnJ1cHRzIHBy
b3BlcnR5IGlzIG5vdCBzcGVjaWFsIGZvciBpbXg5My4iDQo+ID4+IGJ1dCB3aGF0IGRvZXMgaXQg
ZXZlbiBtZWFuPyBIb3cgdGhleSBjYW4gYmUgc3BlY2lhbCBvciBub3Qgc3BlY2lhbD8NCj4gPj4N
Cj4gPj4gTXkgY29tbWVudHMgZnJvbSBwcmV2aW91cyB2ZXJzaW9uIGFwcGx5LiBJZiB5b3UgZG8g
bm90IHdhbnQgdG8gd29yayBvbg0KPiA+PiBleGlzdGluZyB0ZWNobmljYWwgZGVidCwgQlRXIGFk
ZGVkIGJ5IGFub3RoZXIgTlhQIGVtcGxveWVlLCB0aGVuIEkgd2lsbA0KPiA+PiBOQUsgYW55IG5l
dyBzdWJtaXNzaW9ucy4NCj4gPg0KPiA+IFlvdSB3YW50IG1lIHRvIGFkanVzdCBiZWxvdyBwcm9w
ZXJ0aWVzIHRvIGJlIG1vcmUgY29tbW9uIHByb3BlcnRpZXMNCj4gPiBhbmQgYWRkIGRldmljZSBz
cGVjaWZpYyBsaW1pdGF0aW9ucywgcmlnaHQ/DQo+IA0KPiBZZXMNCj4gDQo+ID4NCj4gPiAtLS0N
Cj4gPiAgIHJlZzoNCj4gPiAgICAgbWluSXRlbXM6IDENCj4gPiAgICAgbWF4SXRlbXM6IDINCj4g
Pg0KPiA+ICAgaW50ZXJydXB0czoNCj4gPiAgICAgbWluSXRlbXM6IDENCj4gPiAgICAgbWF4SXRl
bXM6IDINCj4gPg0KPiA+ICAgY2xvY2tzOg0KPiA+ICAgICBtaW5JdGVtczogMQ0KPiA+ICAgICBt
YXhJdGVtczogMw0KPiA+DQo+ID4gICBjbG9jay1uYW1lczoNCj4gPiAgICAgbWluSXRlbXM6IDEN
Cj4gPiAgICAgbWF4SXRlbXM6IDMNCj4gPiAtLS0NCj4gPg0KPiA+IEZvciBtb3N0IG9mIHRoZSBk
ZXZpY2VzLCBwcm9wZXJ0eSByZWcsIGludGVycnVwdHMsIGNsb2NrcyBhbmQgY2xvY2stbmFtZXMN
Cj4gPiBoYXMgMSBpdGVtLiBTbyB0aGVzZSBwcm9wZXJ0aWVzIGNhbiBzZXQgbWF4SXRlbXMgdG8g
MS4gRm9yIHNwZWNpYWwgZGV2aWNlcywNCj4gPiBJIHNob3VsZCBsaXN0IHRoZW0gc3RhbmRhbG9u
ZSwgaXMgdGhpcyB5b3VyIGV4cGVjdGF0aW9uPw0KPiANCj4gSnVzdCBsaWtlIHlvdSBjb25zdHJh
aW4gY2xvY2tzIGZvciBuZXcgdmFyaWFudCwgeW91ciB2YXJpYW50IHNob3VsZCBoYXZlDQo+IGNv
bnN0cmFpbmVkIHJlZywgaW50ZXJydXB0cyBhbmQgd2hhdGV2ZXIgZWxzZSBpcyB0aGVyZSB2YXJp
YWJsZS4gSSBkb24ndA0KPiByZXF1aXJlIGZpeGluZyBhbGwgdGhlIGRldmljZXMgaW4gdGhpcyBi
aW5kaW5nLCBidXQgYXQgbGVhc3QgeW91ciBuZXcNCj4gb25lIGFuZCBwcmVmZXJhYmx5IG90aGVy
IE5YUCBhcyB3ZWxsLg0KDQpPa2F5LiBJIHdpbGwgZG8gdGhpcyBhbmQgdGVzdCBpdC4NCg0KVGhh
bmtzLA0KWHUgWWFuZw0KDQo=

