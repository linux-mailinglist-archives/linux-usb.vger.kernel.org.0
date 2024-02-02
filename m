Return-Path: <linux-usb+bounces-5760-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE81846BF7
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 10:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B1ED1F2D186
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 09:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4B177F0A;
	Fri,  2 Feb 2024 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="WPTa2qXc"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3FB17999;
	Fri,  2 Feb 2024 09:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706866178; cv=fail; b=ZCflf/xAqFFbcgoFViBkI0cBVjFI3lK8rHRXqc7W7yHPrkc58D9HCwxjaOOCJwiPQiuo4J8nDmochOWH5vexKwhNsKCSK0sQ+boK7m1AKpwOqFhL2K2Vg0J6GXYIFlTqjnXRmOhTqr4lh8BZR3rrzeHpq9MKkfzm+kfamkzTHxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706866178; c=relaxed/simple;
	bh=vGAxvGBhvXUMSYvXRftlIH/NIBMTIOXDJYPNq0KeNoU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QaKfO5loyhTfHbNYgoD1UUxcyJ/cXCva3qlrw5djEMSoqL1cuXDlAVQp8+UradTO1+IV9INsx4x8KBUOUCBNyujGZhvf2RkFOpSCQYfXpi+oyyS8oDMoCxt+XbVybkAn4sHmqTVn7e3mW+fxppe9IJOevj5tqsBj9kxM1Hmu1Qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=WPTa2qXc; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0eWNZ0el6bW9Art/jPr7nFiAbu98Tk7WlSQwkltNZkbI4rQVbWTZvyLwOjoFwrueyvUSEeljAqvWHiaOGJJiqe+w4gbUKIrKeyrBXKzDaV7CKioUrNl+gCcWTZJKcFOfDff/VAb+BKBvW2sCYwIQxIEwziKIjbVebsfZXyZ1eFDyGC4vsywpqzq+ZeeF6Cky6pge6k7jGq8txzQQUMg+wnSBprmE3+u8ooUpY8NkfuZVcXzeUUOflBmpNOIqQ4gFTdXczjIrFrcZR84NS27oHXRNG5Dd1Lfr4nBg3v6Cg1jzz6jyfDkKZM//p4dxwlU8pi8TqLIywXomcpSb16TfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGAxvGBhvXUMSYvXRftlIH/NIBMTIOXDJYPNq0KeNoU=;
 b=E3qqpouQDt+MzOSERIye8aiZwV7vnCjXSfYqbcFiRYlq/umf1DsG3BpuA9i0JlqnzN2+OfW0ZRaoPSdM+nbMNOg0xx88AIELXXqBB5cz3aqnxlGeWXXL5rAA/prcr/mc+fmITg4YgB3fbj6LmDXblUX0xIF8ZlKHWSdGL2EM/I4mWtjYxP0a6wSBeXFB1G6YM8/7s10Cs1hD+5dZaEbEFKDTTrYLVrmGzF9m6MYNuKWHH/dddEapdHgxnrHc1+5D0eGcDVFu5kEldDUa193LRAhppSSTs3OhkDtc4JECWrhACJ/Nccxf9JROi6K+zSCAkPBNYojFOEQPyQAMu2Zjtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGAxvGBhvXUMSYvXRftlIH/NIBMTIOXDJYPNq0KeNoU=;
 b=WPTa2qXcrh0kJVuyLwBfANZp67n2oSIQiw3L1Ke0L4Gr5Csy48QegP+UvYWUGPY3NJVoT4mpTaAM360e26jlwzptdZpbu0iWmrdO0fUVLk/8jl2jRSd7KoA6Ux48zq/i5qosx3GiLB7WAmqCoeyga6a4sH/3KR7QYv/FL8YDDD4=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VE1PR04MB7230.eurprd04.prod.outlook.com (2603:10a6:800:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Fri, 2 Feb
 2024 09:29:31 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 09:29:30 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "peter.chen@kernel.org" <peter.chen@kernel.org>
CC: dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v5 5/8] dt-bindings: usb: ci-hdrc-usb2: add
 compatible and clock-names restriction for imx93
Thread-Topic: [EXT] Re: [PATCH v5 5/8] dt-bindings: usb: ci-hdrc-usb2: add
 compatible and clock-names restriction for imx93
Thread-Index: AQHaVDnUnFFowoGQB0aV6aYL3kEy47D2sjoAgAAUp3A=
Date: Fri, 2 Feb 2024 09:29:30 +0000
Message-ID:
 <DU2PR04MB8822552D13485466C78B95938C422@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
 <20240131114324.3722428-5-xu.yang_2@nxp.com>
 <41d1bc21-ea4a-4af6-93a6-b498ac1896ef@linaro.org>
In-Reply-To: <41d1bc21-ea4a-4af6-93a6-b498ac1896ef@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|VE1PR04MB7230:EE_
x-ms-office365-filtering-correlation-id: cb8891cf-08d3-48d7-74d5-08dc23d175ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sfdGUewSY5g4wZjNbKuOlEx/RkIsaQXrlTrGng7WI/RFAz6IFXyOQyFhoO+IUNnu/oiZafauUSu8DrzUoPEX7D/KQL8ggxF5+SVQchUw2KkztFM04Vum5VSAzJVKa79izM7wXpBq5l7qf7C5GbqlgEJNidpr9h2aOedB0KQ+BHtnzUdMN7DL9bfJm/Pm7YMeVYHYCGjQg69SnVeFCKCQ38P29J5eRysI7xWqlLbCgsZN0mdMJT0JncMEvZcrl4l3RBBvAjgRIlvsXblIuFkfRa45IHUjebiykGBqXDAX9qS6Soo2Z2J/CxCaC47N/A6ptdXwtaEDgYXYeyyeefJOGT+BFddixmn0jU0/UPRnO9XXJbptvyvaiIe6IEdK4L5sy9CGxulIFQ6hbN21IQy40LBpsF+e31fWONWNaOvQ3nkdvcor1C+0qO7w9s963PNfJCdkEYwfixhzdnE6cv6bWuU2A4dZJ407PnCxDMvErZ5KQldAXqAyXCQV9GsbOcMHAtCjiYp8BqZ5GrIse1c1kJwGMO5vaT7YYCHuiKDRaPCN9Nj243xvdXxw7yA5UAfHYyaEgwmKhCWRzNw0nDvgACd2F22S4qq3mybdhbiqra463g2avg1VS4ZlZnzIk+7xLmv63eHRSu4dwbHi+iOgOQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66476007)(55016003)(76116006)(110136005)(64756008)(66446008)(54906003)(66556008)(7416002)(5660300002)(2906002)(52536014)(8676002)(8936002)(316002)(66946007)(921011)(4326008)(478600001)(86362001)(38100700002)(38070700009)(7696005)(9686003)(41300700001)(53546011)(71200400001)(33656002)(122000001)(6506007)(26005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YTZ1dVJyS0ZDcURPa0hJcDlOcVk4ZE1ubGZrWUxTbkcyTzFhdm5uS3U0eDFt?=
 =?utf-8?B?bTFNTERpY2UvL25ZbExONlJyMmFZL1c4NUF0L2dwaGpLVy93UnNUUEI4UzEz?=
 =?utf-8?B?YmE1NlEyaG52Ky83ZjFabVExSFMzT0dVZ0FKT3lsZnpobmtFYlE2aE9BK3VZ?=
 =?utf-8?B?bnk5MFYyMDV5L2tqRHdzU3ZWbUk3eWhrMXlyVStaVGxZQXg5MURzQ2hWektU?=
 =?utf-8?B?SWVmZXMyMmlTS1NTSU9WM3p3VTlhWFFtSnNLWENGSzI5NzBnMkI0WFpOQ0xl?=
 =?utf-8?B?Yk9HdEpYZVZqYnpTZ2JLVi9mVlI4RmpGNE82NEJ4Qm1pTXR3T054RktVN1Vy?=
 =?utf-8?B?MkprNDhhajFWZW14M3ZIWHVtR21GZHVNZnZzOG45Rmc1eUtYWE9iSHRQd2lP?=
 =?utf-8?B?MWlEYUF3VHByUko0eUJsOGJ1V2MwZkZFMjVxT2xJTDV0eFVVNmp1M2NQTXVa?=
 =?utf-8?B?S1NoeXlPSTFWUGFScTBuWDVyWXZDUzBOOXl0TWNyTU14VzhWdUNsYThYUjRJ?=
 =?utf-8?B?aVZYRDhPOWVqNDJZQ25BTnlROHFWUFdCbm1TT0NjYTNLSTBqYy8vdFJSSC9N?=
 =?utf-8?B?Y3FBUklreTU5V3VmbkZ2czFTd3VkZ2paR2dwVUl2RDd6NEdxeVBGL3d6Umlk?=
 =?utf-8?B?OTRwQ2QrTUhtMzlYTHVtRkZPNE5yYW1zaCs3alJIYWNFclRpN0hENUh4SVN0?=
 =?utf-8?B?SUM0SVZxbHk1cGdIUzVyYXZqeVVnVkw1eDE3bC9sUGZHcnd6d2M5QVNEeFVT?=
 =?utf-8?B?ZEU4MHRBMnlLdUhTa2FsVHRELyswTUpzcG1nazltNUl0V3NhRi8vdHZ3emxU?=
 =?utf-8?B?U2hJUG84WDNOMWhBK1B0OWZJdmN3OWUzKy9DSDA5clBHZ3lDNHJBTlNuR2Mv?=
 =?utf-8?B?bVlrbEYzZFVGSlA3NlVBTkVsQkExc21XL0hab2Q0VmowYTdTTms0Q2ErYklm?=
 =?utf-8?B?cWI3eURSRXZnTGhPeitITitieHVsTHovK3Y2K3VPVFlURldTQzlkN3NjZE81?=
 =?utf-8?B?VFNYTGk3K1RDNGhiRHlqK1lZZ1JPbjRSMXRrWlpMZThPWU1DdmV6eWc0Rzd0?=
 =?utf-8?B?ZnZTTEg2cGR4T09GS3VUQlAvTkJzUmJFVXpSdW1YNnIwSjRSdVV6ZjFpYzBR?=
 =?utf-8?B?YnVyRkFOSzJqRjB4bStxZitGMllWdzNNRW1YNlljLys0VGpmTnJGKzh2ZldM?=
 =?utf-8?B?LzFpK3U1ZzErL0o3a2dJOHpVS1JzR0l4QVNKYnFNYTVxdEkwTjFEZDB3QVk5?=
 =?utf-8?B?M1BjQWJBMTRmM09mL1E1KzIrRlpvU3ZUZVdPYlVvZW9XVUNKNFkrUFhLZmw1?=
 =?utf-8?B?ZHVSaWtGZjd1K29PcjlvcGMwVTNDNFBacnk2R0MvZU1RWXdLelVHR2VOSkFP?=
 =?utf-8?B?M2w0T25DTjdhcW5XMTF4ZWVzOUNhS2UvYlJKQU5xNmJvOEtnOG9EWVA3VUxH?=
 =?utf-8?B?dCtIMkZacmJ6U2ZmcGlsakNXWnJ4blRtcTFvNlhIb2ptQzFMd3doWlhvSThv?=
 =?utf-8?B?SFlySzNvZG9UNVVpVHgrNWpmMG13MU11eHNHOWVUVjRYYlFYcG9ZbE5WMFkx?=
 =?utf-8?B?VldFRHJEY1hybE5zRGZHR2crQ1pnSmNtZTlaQmtZLy8xd3VWL2MyZmNhYy9o?=
 =?utf-8?B?Mlppclo5K0x5SG5VTmovYnh3YW0wVSsyRVAyM2dzRHNPdlA3NnhLbkhHYmpH?=
 =?utf-8?B?U241d2YzOWg4RmVITWhUOXZHSWZLVDBDWmt2RUt4Y1cvcmI2eXFmTGpTS3NR?=
 =?utf-8?B?WCtyVXlwNVJvc2pmTnlNek1Sb3ZndkhQWlUweHUvNkdaNndJVVVnMmRxR2Vh?=
 =?utf-8?B?QURKSTAxVDRwMjBYODQ4Vk8yaFhsZk56OGZZUjhLWWxBL3AwU3A0cHN5cW4r?=
 =?utf-8?B?dWR5KzU5c01MQXpJVUF4UjVxVHJxMUg3OG5jNDVzMUFrdERNYjRBbWVNSlIv?=
 =?utf-8?B?VlU5M0NQdEluK1kvbHQ0RnYxY2RJTFJ1R0E0WEdHVVBvbUFmU2dLZGRLajlE?=
 =?utf-8?B?dUlFeGpZWjlGVUxNV0tsUG9MMVYwODVrd2Y5ekhiRWRuVFZxaHBvR0ZIeGRn?=
 =?utf-8?B?dVJaS0RHZG9BREQxOVcvRU1CQWtFaXZPU3l4Qy9hNTlLUFBZQlpRTVdpZC91?=
 =?utf-8?Q?niDg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8891cf-08d3-48d7-74d5-08dc23d175ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2024 09:29:30.8865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dKYSw49iIvLpMZDgh6VndVfLiS2EPCv+wn4ZwC96JgQ0WGmkayYoQ/DS11SVT7uC/tDR1OSrhKWEKwyVF2QTsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7230

SGkgS3J6eXN6dG9mLA0KDQo+IA0KPiBPbiAzMS8wMS8yMDI0IDEyOjQzLCBYdSBZYW5nIHdyb3Rl
Og0KPiA+IFRoZSBpLk1YOTMgbmVlZHMgYSB3YWt1cCBjbG9jayB0byB3b3JrIHByb3Blcmx5LiBU
aGlzIHdpbGwgYWRkIGNvbXBhdGlibGUNCj4gPiBhbmQgcmVzdHJpY3Rpb24gZm9yIGkuTVg5MyBw
bGF0Zm9ybS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAu
Y29tPg0KPiA+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAgLSBubyBjaGFuZ2Vz
DQo+ID4gQ2hhbmdlcyBpbiB2MzoNCj4gPiAgLSBhZGQgY2xvY2tzIHJlc3RyaWN0aW9uDQo+ID4g
Q2hhbmdlcyBpbiB2NDoNCj4gPiAgLSB1c2UgJ2NvbnRhaW5zJyByYXRoZXIgJ2l0ZW1zJw0KPiA+
IENoYW5nZXMgaW4gdjU6DQo+ID4gIC0gcmVuYW1lIGNsb2NrIG5hbWUNCj4gPiAtLS0NCj4gPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi55YW1sIHwgMzUgKysrKysr
KysrKysrKysrKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy91c2IvY2ktaGRyYy11c2IyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdXNiL2NpLQ0KPiBoZHJjLXVzYjIueWFtbA0KPiA+IGluZGV4IDZhZDM1ODIw
NTFiOC4uMTI0NjZmN2FmMDBiIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy91c2IvY2ktaGRyYy11c2IyLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi55YW1sDQo+ID4gQEAgLTU3
LDYgKzU3LDcgQEAgcHJvcGVydGllczoNCj4gPiAgICAgICAgICAgIC0gZW51bToNCj4gPiAgICAg
ICAgICAgICAgICAtIGZzbCxpbXg4bW0tdXNiDQo+ID4gICAgICAgICAgICAgICAgLSBmc2wsaW14
OG1uLXVzYg0KPiA+ICsgICAgICAgICAgICAgIC0gZnNsLGlteDkzLXVzYg0KPiA+ICAgICAgICAg
ICAgLSBjb25zdDogZnNsLGlteDdkLXVzYg0KPiA+ICAgICAgICAgICAgLSBjb25zdDogZnNsLGlt
eDI3LXVzYg0KPiA+ICAgICAgICAtIGl0ZW1zOg0KPiA+IEBAIC00ODYsNyArNDg3LDYgQEAgYWxs
T2Y6DQo+ID4gICAgICAgICAgICAgICAgLSBjaGlwaWRlYSx1c2IyDQo+ID4gICAgICAgICAgICAg
ICAgLSBmc2wsaW14MjMtdXNiDQo+ID4gICAgICAgICAgICAgICAgLSBmc2wsaW14MjgtdXNiDQo+
ID4gLSAgICAgICAgICAgICAgLSBmc2wsaW14N2QtdXNiDQo+ID4gICAgICAgICAgICAgICAgLSBm
c2wsdmY2MTAtdXNiDQo+ID4gICAgICB0aGVuOg0KPiA+ICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+
IEBAIC00OTcsNiArNDk3LDM4IEBAIGFsbE9mOg0KPiA+ICAgICAgICAgICAgbWluSXRlbXM6IDEN
Cj4gPiAgICAgICAgICAgIG1heEl0ZW1zOiAxDQo+ID4NCj4gPiArICAtIGlmOg0KPiA+ICsgICAg
ICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgICBp
dGVtczoNCj4gPiArICAgICAgICAgICAgLSBjb25zdDogZnNsLGlteDdkLXVzYg0KPiA+ICsgICAg
ICAgICAgICAtIGNvbnN0OiBmc2wsaW14MjctdXNiDQo+IA0KPiBUaGlzIGRvZXMgbm90IGxvb2sg
cmVsYXRlZCB0byBpbXg5My4NCg0KQmVjYXVzZSBmc2wsaW14OTMtdXNiIGlzIGNvbXBhdGlibGUg
d2l0aCBmc2wsaW14N2QtdXNiIGFuZCBvbmx5IGlteDkzIG5lZWRzDQp3YWtldXAgY2xvY2ssIHNv
IEkgcmVtb3ZlIGZzbCxpbXg3ZC11c2IgZnJvbSBwcmV2aW91cyBpZi10aGVuIHJlc3RyaWN0aW9u
Lg0KT3RoZXJ3aXNlLCB3aGVuIGRvIGR0LXZhbGlkYXRlIGZvciBpbXg5MywgaXQgd2lsbCByZXF1
aXJlIDEgY2xvY2tzIGFuZCAxIGNsb2NrLW5hbWVzDQpwcm9wZXJ0eS4gVGhlbiBpbXg3ZCBhbmQg
aW14OCogc29jcyB3aWxsIGxvc3QgcmVzdHJpY3Rpb25zIG9uIGNsb2NrcyBhbmQgY2xvY2stbmFt
ZXMuDQoNClRoZW4gSSBzdGlsbCBuZWVkIGFkZCByZXN0cmljdGlvbnMgZm9yIGNvbXBhdGlibGUg
PSAnZnNsLGlteDdkLXVzYiAnLCAnZnNsLGlteDI3LXVzYiAnDQphbmQgb3RoZXIgY29tcGF0aWJs
ZXMgbGlrZSAnZnNsLGlteDhtbS11c2InLCAnZnNsLGlteDdkLXVzYiwgJ2ZzbCxpbXgyNy11c2In
Jy4gU28gdGhlDQpiZWxvdyBjaGFuZ2VzIGFyZSBmb3IgdGhpcyBwdXJwb3NlLg0KDQo+IA0KPiA+
ICsgICAgdGhlbjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjbG9ja3M6
DQo+ID4gKyAgICAgICAgICBtaW5JdGVtczogMQ0KPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDEN
Cj4gPiArICAgICAgICBjbG9jay1uYW1lczoNCj4gPiArICAgICAgICAgIG1pbkl0ZW1zOiAxDQo+
ID4gKyAgICAgICAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICAtIGlmOg0KPiA+ICsgICAg
ICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgICBj
b250YWluczoNCj4gPiArICAgICAgICAgICAgZW51bToNCj4gPiArICAgICAgICAgICAgICAtIGZz
bCxpbXg5My11c2INCj4gPiArICAgIHRoZW46DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4g
KyAgICAgICAgY2xvY2tzOg0KPiA+ICsgICAgICAgICAgbWluSXRlbXM6IDINCj4gPiArICAgICAg
ICAgIG1heEl0ZW1zOiAyDQo+ID4gKyAgICAgICAgY2xvY2stbmFtZXM6DQo+ID4gKyAgICAgICAg
ICBtaW5JdGVtczogMg0KPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDINCj4gPiArICAgICAgICAg
IGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAgICBjb25zdDogdXNiX3dha2V1cA0KPiANCj4gTm8s
IGNsb2NrcyBtdXN0IGJlIGZpeGVkIGFuZCBzcGVjaWZpYy4gTm8gY29udGFpbnMgYWxsb3dlZCBm
b3IgbmV3IHZhcmlhbnRzLg0KDQpXZWxsLCBJIHdpbGwgY2hhbmdlIHRoaXMgdGhlbi4NCg0KPiAN
Cj4gPiArDQo+ID4gICAgLSBpZjoNCj4gPiAgICAgICAgcHJvcGVydGllczoNCj4gPiAgICAgICAg
ICBjb21wYXRpYmxlOg0KPiA+IEBAIC01MDQsNiArNTM2LDcgQEAgYWxsT2Y6DQo+ID4gICAgICAg
ICAgICAgIG9uZU9mOg0KPiA+ICAgICAgICAgICAgICAgIC0gcGF0dGVybjogJ15mc2wsaW14NVsw
LTNdKy11c2IkJw0KPiA+ICAgICAgICAgICAgICAgIC0gcGF0dGVybjogJ15mc2wsaW14NlthLXpd
Ky11c2IkJw0KPiA+ICsgICAgICAgICAgICAgIC0gcGF0dGVybjogJ15mc2wsaW14OFthLXpdKy11
c2IkJw0KPiANCj4gQXJlbid0IHlvdSBhZGRpbmcgaW14OT8NCg0KU2VlIGFib3ZlIGV4cGxhbmF0
aW9uLg0KDQpUaGFua3MsDQpYdSBZYW5nDQo=

