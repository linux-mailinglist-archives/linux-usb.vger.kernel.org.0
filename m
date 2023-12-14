Return-Path: <linux-usb+bounces-4160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF93A81303E
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 13:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FE14B215BD
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 12:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704B54B5CB;
	Thu, 14 Dec 2023 12:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZGpV8gYj"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2084.outbound.protection.outlook.com [40.107.15.84])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795A1116
	for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 04:35:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnBxM1uE9quUBE3+dvkOM6/oUktcsJXiv08zs+VYV8Y7ccbk1istjriznMNYquhkpC87hh9uB6y1jXTYZTJoBEHOjtSVlrx73VTa8zHhDBclICVdH7HJccex12MySVw5cAaJAc7eFP02hrt2tEIpdEHe1oCqfLslynvSGo1xig/11qD+8bOPr2q9OYOwjKGrwk7zzmWQ4TixAsRTia7B1FtVGvcS+R5pNAGqOowphdUmnNCU7ExxT4ovcLMZKzMaWTLRL7ezTC4lH9rLhf0otwuHr4/zsygmhoD7uKOMdS8VRpAglNj/1MpwIMXebPIWGoudtKu/crTzyYWHQlg6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9SBZsHEUV0fZxq7htnk8wK7HwA3hR/sRqsZ00Jn8iY=;
 b=PdwfzuGRQaLc7X6dvIE6paShjcO6N9No8yHJlxnGFkZnUNvAjEQeVpatSU9fXNFwiR2twl5QQgj47enZzxAoCy5/8O9iTITa8WIfcSR9EN1pIpff625odkvFsXCNFLKnbX42YeL8nof3i9Yr6t4X5NSVXiodT/87W3Pp+c9blAMIa4ePkgW23/0DnHrr91w7MDn7gLXEK6Mtds/J4Z2Uum1wgPj8KM/r9zyU9XPlbaonLCVdoG1lrGvCxjKdrxCzz33KpF2xwVZh//kGVC7eazBurT1exqvrKgEoJTN0bLFTjqW/UuR1rOgMc1KfiQEwJG+a7nF9AHMgjg8Zq5W5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9SBZsHEUV0fZxq7htnk8wK7HwA3hR/sRqsZ00Jn8iY=;
 b=ZGpV8gYjsW5+SqqX4nIod06asoYeSmzbCGIaDTUwgekPsHMCGEiF57Kwi6yA8fNnbrBWKvrateFVI+0zh3yplw2tHCdd1ba6My8vjYFjoY29KcGZ/kegYjp2XFdXKBbiXRNZp+7Ti7i5ao5WSGNqfiMOzGcYFKuxYbivyX4OpIM=
Received: from VI1PR04MB5152.eurprd04.prod.outlook.com (2603:10a6:803:5b::13)
 by PR3PR04MB7244.eurprd04.prod.outlook.com (2603:10a6:102:8e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 12:35:38 +0000
Received: from VI1PR04MB5152.eurprd04.prod.outlook.com
 ([fe80::577e:f2c6:9d67:f89f]) by VI1PR04MB5152.eurprd04.prod.outlook.com
 ([fe80::577e:f2c6:9d67:f89f%7]) with mapi id 15.20.7068.033; Thu, 14 Dec 2023
 12:35:38 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
CC: "peter.chen@kernel.org" <peter.chen@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>,
	"luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, Jun Li
	<jun.li@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH 3/3] usb: phy: mxs: remove CONFIG_USB_OTG
 condition for mxs_phy_is_otg_host()
Thread-Topic: [EXT] Re: [PATCH 3/3] usb: phy: mxs: remove CONFIG_USB_OTG
 condition for mxs_phy_is_otg_host()
Thread-Index: AQHaLn+T2Kda5eqlHE6Ceq0IJ1rEFrCoo4QAgAATYEA=
Date: Thu, 14 Dec 2023 12:35:38 +0000
Message-ID:
 <VI1PR04MB5152533DB1BFD0090488CE4A8C8CA@VI1PR04MB5152.eurprd04.prod.outlook.com>
References: <20231214112622.2412321-1-xu.yang_2@nxp.com>
 <20231214112622.2412321-3-xu.yang_2@nxp.com>
 <CAOMZO5CRj2yry0Hm6wjueX0PQi+aWXNptqnyu=Ai1CYWVJC0nA@mail.gmail.com>
In-Reply-To:
 <CAOMZO5CRj2yry0Hm6wjueX0PQi+aWXNptqnyu=Ai1CYWVJC0nA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5152:EE_|PR3PR04MB7244:EE_
x-ms-office365-filtering-correlation-id: fa1c2dba-bdc2-4088-8d67-08dbfca12da7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8xMu1l03EsCW9ULzxOXRpnPd/5Iinff5xI/EvFgv8hySW+LP2qkSuE1bvMdaDTj9QdoMwZi6VfOOuKArCqsMPjb57xipFRM3ZhU+ZL/mxHj+JINrGhKM2CqbTFGtCbvPLMnHJs9nWFGCh5ozeb4TT9tg4t67Y6Lg+XMftaVKi8GTj6vB/gTRdXxxW8QcM9+YSnAzzCJUCie/XSvrie7LDE4pKtv/gnjpVfwuTn1QIu5cHhrvUnFbrcEuTZIfj+pJIi5W8qpHayRuglWIs4zAo9vEn8ZGXopWzJViZCuWiujk6pYkm2+xlme4Rn6v/25kneRKaIJdBIpZMymGv9E2XmDjWBgEqnEDH3GJwF/+GB6ZA5b+rvFdbRSmx3gUd9tQr+MNjnFbELgI5UPmEXNS+iGFYoe8nDTc71PU6pEYkNIAaLva5IhEyuKhmyzr9dqWGP/Vlk0hYz+2HXYMquRunSKH9aNcEmR+o9KoejNiTGjdPHX59gxdGUEsbDICz74N3JQ7F5+rlHMIpCeCVvnVSpr3J8CiuO3dhkmP+gZgrbApUwqUckWntF2rrPZbwbOgN7sEgO/tIxD9lTItpllgxUB6xoXe8jd+QW3pWfoTIPDAe9G+3yxgBYWTcEvmeMUp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5152.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(376002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(9686003)(26005)(122000001)(38100700002)(8936002)(8676002)(52536014)(4326008)(316002)(5660300002)(4744005)(2906002)(478600001)(53546011)(6506007)(7696005)(66556008)(76116006)(6916009)(54906003)(64756008)(66446008)(66476007)(66946007)(71200400001)(41300700001)(38070700009)(86362001)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZmNWdENremdkMjQ2bFRZK3JUd0d0RTZMTTZOdkNHQjFwWFhYcjJYSldJeFNO?=
 =?utf-8?B?Tk00dk5hdmtJbEdCYXNuT1RNOE9aOERzU3JoS2xXMVNscmlBVkhicWpTMHZ4?=
 =?utf-8?B?TDNJVlQrUVpqMTNmRllhS2tPWnQ3RTVnM3dEVmVCc2RSRUk4VWtyRU1HbFlL?=
 =?utf-8?B?MmF2czJOdFhxY2dDY1pKWmRpanVSaDIyVk93dEpGUTM5KzlIVkZzbUoxSExn?=
 =?utf-8?B?Q2w1M2hVU2xUN2IwOGlDc2tyWGhKRGJJa0VyakVSZW1adTFzQlZxMitLeXdD?=
 =?utf-8?B?eGoxMWtrTGh3bThpTWtQL3pGWk1lcktyNGFZcU1IdVJZVEpPOGZ4NEJqQWlK?=
 =?utf-8?B?ZWxqanFySmtLK0kwNHd0cVpEamkxckFxQ1luV1o3cHY3aFg5T1NRbnVPT0ZO?=
 =?utf-8?B?Nzk5a1Jvd0xHc3pFbFQwakRvZlJJcklibWxyN3lDYnV3V3A2QUtIWmkzdFRX?=
 =?utf-8?B?Nk56R2U3R1FZa2FFbnRqRm5oOFpVNDBZcENselUzNmM2K1Y1clRHbVFTdE9M?=
 =?utf-8?B?R2l1cjg4RHNnOFo1UFpDeWU0TDRqNWVSWjFPTkRtMk5NN3VVeU5hSXVzRCts?=
 =?utf-8?B?alpmYjhLeGU1TE9wWmFITExkdFN0djRoYlFWeElqS21KOU5ERWF2SmNiMEc2?=
 =?utf-8?B?cEROVm5CY3NsM3N5MmtZSjUxa3dReERpVlRJZjdaUlJxZ2trY3ZQeGM1ZzFR?=
 =?utf-8?B?cWozQkpYRVlTZ1ZMUDRFQ3lSemZDNTFwdHJYck9NWk9rNUJqS2tqKzFNanp1?=
 =?utf-8?B?YWZMZUlFNEtiM095M3VFQkhudmpEOXE4OEtpK1M5azZhNkpFVG1QaEdJSDJH?=
 =?utf-8?B?WkFScmxTeHdpY1lwdlh5eVRKMFFiOGF6N1N3My9nc0wwNVFwVFc4SUdLS2Jt?=
 =?utf-8?B?MlhIei9pL3BQeE5Pa09ZMUZISmQzUlAwMzlUUmJRWS9ReDFWcDhxd1RxUUdq?=
 =?utf-8?B?SEtHWnhhamNaMkFUTEE4cEM1VGZxY3QzcEVmYnVQQ2Mxc25NWnlRV21xNmtl?=
 =?utf-8?B?UUcva21vUk5TbXp5cGdvMFI2NVUyMlk4MXR6TnpmWTFpUmZsallQekZvNTNT?=
 =?utf-8?B?Um12Y3UxMnVCSHJnM1BWRXEwVXJVemtOMWM5V29qVGhsVitRa1hHdHlJQ2FI?=
 =?utf-8?B?SnBTQ1U1WklZbEc2elh6S1o4c0I0STl6NERKQlI2ZDlOVmVXcnVyUHBaa1Q3?=
 =?utf-8?B?L2FIYVZLS09ycDhpM2lKelhCKzRCVWFjR0ViUnNSbTlqVzFXY3BIaENYM1hX?=
 =?utf-8?B?TGtEdWY1QnM2SGtHREtFcjF1ZU85bUE1SEZtVUt4TDk5OVRkejNNd0F6bXVJ?=
 =?utf-8?B?Z0gzSk0waXE5STVzM0RlNWJ4NjZyZ1U4WFFrdEdKL0p6b3pkcncrMVBsUkhZ?=
 =?utf-8?B?S042d3VaZ3RqKzVaRTdGRHdwcDg1Rjg1OGVzajRpRHpHb2I1YzRQN3YxajdJ?=
 =?utf-8?B?NXRGZTlPZTdjRmpCRFViSzFsanIzRTJKNDJIaStHL1o4cHlTWkJna2RJYXhG?=
 =?utf-8?B?eTdONXVNR1lXcWdkSzNsdCt4bGZmR0xpaDZtRmswL2dmK2FBeDMzZUhpMTFv?=
 =?utf-8?B?djFOWTllTzV4MHJjbDdzMVlwMVM0U2ltbUdjVXdDYzJ1K2lBOWttMXVzbU13?=
 =?utf-8?B?elpObEc3TGFCa3p4enVOQlFuelFOM1JUY2FlYTBEeEpBb1lKVDFpUk84cVdP?=
 =?utf-8?B?OFFWU1ZUTXNvdXRIT0JlYWpLUHlWYzEzMDJYS1NSc1FHTEVRZ2ZvN3pEcWVH?=
 =?utf-8?B?RXpITzJLa3BBV2ltOG0wTnJxcDgzRld5aHB0cVJoa3NoOElYbUo5U2dETDc2?=
 =?utf-8?B?dDF0WG9ERzAxSW5lWEpoS0syUEJsY2NJa1lLa3dDWEdrbHZBTzhzdXVLZWRC?=
 =?utf-8?B?RWU5YUhZcW5ZT3p5RkFQVi9LNExGeG9iV2drYXQ2QnpBZWUvWUxLNG93b0R1?=
 =?utf-8?B?a2JlUVNyT2dvM3dFWVJvS2xRZmVGUHlBSm93WXMrZ1I4Y0luMDYwYzc0VGhK?=
 =?utf-8?B?em9UVDVaMzhIdEhCVUx0U0NBRXl2anErS1U3UzQ2UjFTNEFCZjVYR0RoK0Y4?=
 =?utf-8?B?djIvekdLWGhncndMZ3hXUVB2OGVvclZkZktmbWdWZG5vQTRQb3llY2FKM3hh?=
 =?utf-8?Q?u2lvMiTrc6AuHdG59aSCVapkh?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5152.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1c2dba-bdc2-4088-8d67-08dbfca12da7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 12:35:38.8649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yfUlF6OgN60hQcnT1xUDhquVKNoqYsnplWwtZxpidSND+DMqFftxaDIukYwfkLWWBFLIFO2Bg/glou3jPE9yrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7244

SGkgRmFiaW8sDQoNCj4gDQo+IE9uIFRodSwgRGVjIDE0LCAyMDIzIGF0IDg6MjDigK9BTSBYdSBZ
YW5nIDx4dS55YW5nXzJAbnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBXaGVuIENPTkZJR19VU0Jf
T1RHIGlzIG5vdCBzZXQsIG14c19waHlfaXNfb3RnX2hvc3QoKSB3aWxsIGFsd2F5cyByZXR1cm4N
Cj4gPiBmYWxzZS4gVGhpcyBiZWhhdmlvdXIgaXMgd3JvbmcuIFNpbmNlIHBoeS5sYXN0X2V2ZW50
IHdpbGwgYWx3YXlzIGJlIHNldA0KPiA+IGZvciBlaXRoZXIgaG9zdCBvciBkZXZpY2UgbW9kZS4g
VGhlcmVmb3JlLCBDT05GSUdfVVNCX09URyBjb25kaXRpb24NCj4gPiBjYW4gYmUgcmVtb3ZlZC4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAuY29tPg0KPiAN
Cj4gRml4ZXMgdGFnPw0KDQpTb3JyeSwgd2lsbCBhZGQgdGFnIGluIHYyLg0K

