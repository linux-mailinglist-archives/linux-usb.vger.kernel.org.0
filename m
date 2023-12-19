Return-Path: <linux-usb+bounces-4327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ABD818256
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 08:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BD5328687F
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 07:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6840D8C11;
	Tue, 19 Dec 2023 07:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="mj+YAsfr"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2043.outbound.protection.outlook.com [40.107.105.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C198911700;
	Tue, 19 Dec 2023 07:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bu2EalDipy6LwNfNvOHs6wOQjklbIg5YxF58tiHnDHaXakbXD/ijM4IIg5a4FaQtCFXZ0UHnQxMbbbQ9pGKcRNYRJqG5lO6ZQm2Ni2Du/sTPPOLdcba9ZWo8epQe2hP9vjIMOQtG67OhIHtxv0ykHES3oHdhrulJ7UvAXOzU7qoNZ8gPpsUlHSkbe8k4CrWXlbSq10VfitqnisUkXsq3Z5cfMLmwVK+RrnaiGXgDzIvuj+hGf1ybNVwCXvyF/uoK0oEwyBmMe5DYkA/+Qlqr3JnI6T/shCrelPLMFjeI69XjMb1JR7NZs+tvqfVFCdtfYrnzPMW+l7h+5VPLrWCMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGbCVt9yXy2f0arrQ5W3zl6YRdEDhj0cpMlm2/8cfsQ=;
 b=NWD123YAsWwN1rMzlMTwrHxMIEjTrbdEP/2tPWqI7wdJmg3vQBuF/6X1XVqiM8RQK/jCTa2q6T92zYRDddOhV9Tp1qYzgH0cNzwAZbC3S1n34PP5dTAr8yAZAYnDC/JltXe2Zv+bUf+CiWCScTwaYMTYVFblydCk/bP3s+K9uItpJoL0dGHiv8h9RsHhsVDVGGWwekw23nbERg63TRjpQTRHGTkIxxix9TpGebr6VbFAjc3YT2i8SLMgvDpAvOjbh0ZWxVvkwTD9w6YhzFvVLoFBX9AI29ibvVzaCHoJelk6a4VmSIgc2cyP/zSg653qy7BKLaFa/3yZMXw68/SciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGbCVt9yXy2f0arrQ5W3zl6YRdEDhj0cpMlm2/8cfsQ=;
 b=mj+YAsfrtFBrQRuJga0ixKngc4tFwHCW5Px9iC6IJRSH+CaK1Bva0ovUh8G5ZfWTvyjAa8isxi31TuSO76m5nzgkoaYCxhLed917KjVSDZKBd4802HDa6rgjBNc8oqylFCnbtqJ3K8yW53RVkGxJcXNrOvFMaO8bswm11NGoSSI=
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by AS8PR04MB8707.eurprd04.prod.outlook.com (2603:10a6:20b:42a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 07:35:48 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 07:35:48 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx
	<linux-imx@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Jun Li <jun.li@nxp.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v2 2/5] arm64: dts: imx8ulp-evk: enable usb
 nodes and add ptn5150 nodes
Thread-Topic: [EXT] Re: [PATCH v2 2/5] arm64: dts: imx8ulp-evk: enable usb
 nodes and add ptn5150 nodes
Thread-Index: AQHaMY8RLfDcovEB4kKV3s/AlqfBCbCu030AgAAD92A=
Date: Tue, 19 Dec 2023 07:35:48 +0000
Message-ID:
 <DB7PR04MB51469ABA1E7922B839B4F36E8C97A@DB7PR04MB5146.eurprd04.prod.outlook.com>
References: <20231218085456.3962720-1-xu.yang_2@nxp.com>
 <20231218085456.3962720-2-xu.yang_2@nxp.com>
 <CAOMZO5AZ6oLgeqvwf5_u9YhrFvwgRSiNjGq+wVMjXYsq7t3MxA@mail.gmail.com>
In-Reply-To:
 <CAOMZO5AZ6oLgeqvwf5_u9YhrFvwgRSiNjGq+wVMjXYsq7t3MxA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB5146:EE_|AS8PR04MB8707:EE_
x-ms-office365-filtering-correlation-id: 47cac0ce-f951-4ed7-1b8d-08dc00651e8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nM6FmnTvFHJrW3qevnhFmUeMRa/wdmvaS2BWfStl3pT38a2wwZBs8/OjJnL5W1rPizXuG56f9vjNoz2TG/AIMr9IGsJ8UDDzvxEUSl0/WAA4Mld1gAnsznKTah+fPY0cu/jOWeO96On8ie+rJG9g+d5KBLJQ4LiSbmGgRkn/grvshur1IEqoTjizAI7YZRSq9G6EKDNMgq2oW2WEHbQI2LBIlAxcVjPCta30gr3vx8Jm+1Xsx+E1tZFa+jydjT0v47n+PAA0nvR/TJyzu1VUVVjrhArJd0EDmgmZDMES91iCEaCSwpce1+e8FjxbSJak4v5OWVeupfOViOR3Y48f+48sK4nWWdKu4W6Z9QxRTmM919Stmp3TWv69jFh5zNtspmkL1wR8zstCx20QPyCP/uojj0/hrG9xSX/WgIgtiqeq/kRUjEOhISY5rLefXNQhH8XgzjiKeBa5Ex4KYRG4aHzr/08J6WMQqb354bA4facz3ZqdvN25jmw1i2ajDUdgOuF1P5HMQipudd83RWn4uakr7nEFk3v1d2hEkGsEHegAIX7Npq8LrrEwJ5JlgyX61ziW0Dc4prwFkOECbbaShIPu3mhsu59Grb2rsSeZOPLNHD+UrSmkI3nxgrQJhNnUovlP0OGLa4sXjXG2IwTAIdIksBlHUe+HYcdR9rAxl55Yb7zA557PC60e4MHFGg9I
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(346002)(396003)(136003)(230273577357003)(230173577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(55016003)(122000001)(7416002)(2906002)(5660300002)(86362001)(33656002)(83380400001)(26005)(38100700002)(6506007)(7696005)(9686003)(71200400001)(53546011)(38070700009)(41300700001)(316002)(52536014)(64756008)(66476007)(66556008)(66946007)(54906003)(66446008)(76116006)(6916009)(478600001)(8676002)(8936002)(4326008)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ujl0NmlWTHdiVGYxK3JBSkFKa2s4VmdhbFNvN2piTTlhYlh6cVNvbnJVS1pU?=
 =?utf-8?B?dTQrb1QxM0FpQ2VkSW42dHlvOXBvMEJWM256cDJQeGtKWkFuRzFNU0RGWUdN?=
 =?utf-8?B?ODZDdkRCS0VIaEYzdzRibFdEQlk3QzJUUHlIZDE1YnRoUVp2eDRpSGI4c2p6?=
 =?utf-8?B?L0ZjOGkxRDhhYURtWU5CN2QySm5kQmVDMnc1K1hLcWJVVXBnRzFtYkRRc3Iv?=
 =?utf-8?B?Nm50RUdZMHNmYVorUFZ0S3Z3RXAvd2pmZzVvekwrOUxWNjMrL2Y3ZFkyejRK?=
 =?utf-8?B?QitPRnQ0TWhScWcwalo4eE0wTGVJeWVCbStORzV1ekxxV08rS01VVDdwVzhk?=
 =?utf-8?B?UzBlQVFuNnBzdEwvWSt3aGYvNHZrZGRGdTZWWjF2b0Rka0Y2TFVFbXFaVy84?=
 =?utf-8?B?alNCSUFQMHZ2OWtsamUxdVdFWnlMaWw1L2pmVk9uZFV3QUVSWUx6cFFKUytX?=
 =?utf-8?B?bjgyNTkzVFEzSUpid3Y1bEQxL28vcXlUUUdaeklMWWg5VzI0bzVpZXhwdEEy?=
 =?utf-8?B?emF6dk9zcjFyZEhtL3BtVTVoSC84UDR2aktMSEtQc1BHZzJhWDFwd3p4bDlF?=
 =?utf-8?B?YTArREJWa0VIa2xkTkU5Yk9URi9jRGpwcjFHeVlVVEZtTU9SUjNkUTVKN0Yy?=
 =?utf-8?B?RWIrUkxOcGZENW5zVnZSYURVa2ZmMUQvT1NVR01LZ01MS0dFUmN3elhCOGdk?=
 =?utf-8?B?ekF6eG96OGRNK1IrcmFVVEpMTWRURW90aDhmNHhkLzF3MGRTdzIzOVkvQ0pL?=
 =?utf-8?B?SmdqZEo1VVlSa0J0Q1p2VFRKSlNTQ1hVbWh1UWYrTER4VFpZVE16aDJPejAy?=
 =?utf-8?B?ZUtTUjYrUWplN2JSb2RScDMxRHEydi9taDJKYkVhamg3aElVTVE5Wk9aRVFS?=
 =?utf-8?B?ZmRWSndkK3k0NWtERHJFMG50K29BMkdxSmMvMzJncGtac0lGZGtqNW9qMUpi?=
 =?utf-8?B?UDd4ZmlQa3cwY1M1byticjNwdnFmU3F0UGRzWXhpL3h6V3NiZlQ5cVF4dVpl?=
 =?utf-8?B?RlRFbTN2d1pCMVE1SEdBWGN5bDNFL0FlUlpQRUtaVXFyMjNXUVlQdFJLRmJo?=
 =?utf-8?B?ZU1UY0wrVFdNdjBEdVJYK2VDcUMwcHBRU09hZWhOUGRteTkzWEtjdXQxSTN3?=
 =?utf-8?B?S29nMDhrM3I5MVF2TW9pUUtjRTJxMFZhckFjWkxXVGxtY0ZzZGNNYldHZFJh?=
 =?utf-8?B?c2dBNTFPUTQrbVYvekNxbktyRGVQdDZyZ0ViUjkwRDVwSWpBMzg3aHJXVzhN?=
 =?utf-8?B?cU1acXdPODJCdVVVMy9DM0JRVEUxbmU1bENiUGpTS2xHTGFTbzQ5UE9yYi9i?=
 =?utf-8?B?TGRiWHdKUUZRY3pYcUExTTRsVzZrMVNnVStSK0NXZ2hGeFoyT0F5SDg5UnRk?=
 =?utf-8?B?amdMeEJ6UjMrMUhZdENuczAyaFIwNEplYkxpeXFES0xSWjkwV2FmUDc1YWNi?=
 =?utf-8?B?djU2OWYrcmVmdFhxZmd1aEozdzAxeVRCT2tGaHBXVGhPdFEyazFSUCttU1d5?=
 =?utf-8?B?ZktLbXNQSXhTMTZxZHpwN1RSRTlZcGVaSHE0QXZJT2RPQXB2L1IyQ3VrUGtF?=
 =?utf-8?B?Y24xa2tXaldwdDYxMlFNZFgyN25EUE1RVG85QkZOSWdGb3phUjNPSmRKNTRW?=
 =?utf-8?B?YjgydUhNaFNjcWc0NEd3NEgxOFNnUG1tZWFCRUtuS1ZsRUh0Y3dpYlVvamtJ?=
 =?utf-8?B?cEF6ZSs3dng5TmJqWGdWR1d2SGJvaVhFN3k1U255cTJxUGhRNWVaajRQa2R5?=
 =?utf-8?B?ZHFRRXdITlZZcU1qenZoMzJWWVVaVW5zOG5UUGYxS1ZqTitQcnl0ZUZoWjhN?=
 =?utf-8?B?NlZ4L0VhYjNlTGtpMkpKb0lDdW0yWHVUV1NLRHBUdHFROGlYc1oxMmlxbEx6?=
 =?utf-8?B?d0w5bVh3N1RYRC9SVUdlTEM5bW1kKzZQejRXVVpGdXFsTnJQY0FWdVpmYWlk?=
 =?utf-8?B?QWVsb3hqaTc0RmYvVjNRbVlXbkRiRitMNnp3SDh0NDBDMlhVV2pUcGZvd3N1?=
 =?utf-8?B?RHVESFdjbmVEZHNJQ0F5YzcwM3NsTWxGdWpUcXFFaU1lMnorMVEwb1ZlRFVh?=
 =?utf-8?B?bkdwTlhralpoWEhqaFRubVRKSlhUNS9nMHE2RGR2S0t6OUN4Y0JzNmZDNE5L?=
 =?utf-8?Q?ELDo=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47cac0ce-f951-4ed7-1b8d-08dc00651e8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2023 07:35:48.3692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zQX0lBmCx51bjZZrD7qCrpjB5odwBQNTG5wmWxmwq1BkrDqVchVewe/vLFd3UNgab07MbadHpsYFzDAlTwoKKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8707

SGkgRmFiaW8sDQoNCj4gDQo+IE9uIE1vbiwgRGVjIDE4LCAyMDIzIGF0IDU6NDnigK9BTSBYdSBZ
YW5nIDx4dS55YW5nXzJAbnhwLmNvbT4gd3JvdGU6DQo+IA0KPiA+ICsNCj4gPiArICAgICAgIHB0
bjUxNTBfMTogdHlwZWNAMWQgew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm54
cCxwdG41MTUwIjsNCj4gPiArICAgICAgICAgICAgICAgcmVnID0gPDB4MWQ+Ow0KPiA+ICsgICAg
ICAgICAgICAgICBpbnQtZ3Bpb3MgPSA8JmdwaW9mIDMgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsN
Cj4gPiArICAgICAgICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArICAg
ICAgICAgICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX3R5cGVjMT47DQo+ID4gKyAgICAgICAg
ICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+IA0KPiBXaHkgZGlzYWJsZWQ/DQoNCkFzIHdl
IHRhbGtlZCBiZWZvcmUsICBJIGp1c3QgcHJlc2VudCB0aGVzZSBub2RlcyBoZXJlIHNpbmNlIHRo
ZQ0KaS5NWDhVTFAgYm9hcmQgZG9lcyBoYXZlIHRoZXNlIGNoaXBzLiBBbmQgSSB0aGluayB0aGUg
YWJvdmUgDQppbmZvcm1hdGlvbiBpcyBlbm91Z2ggdG8gbGV0IHBlb3BsZSBrbm93IGFuZCB1c2Ug
aXQgaWYgdGhleQ0KcmVhbGx5IHdhbnQuIEluIG1vc3Qgb2YgdGhlIGNhc2VzLCBpdCdzIG5vdCBu
ZWVkZWQuIA0KDQo+IA0KPiBObyBjb25uZWN0b3IgYW5kIG5vIHBvcnQgcHJvcGVydGllcy4gUGxl
YXNlIHJ1biBkdC1zY2hlbWEgY2hlY2sNCj4gYWdhaW5zdCBsaW51eC1uZXh0Lg0KDQpUaGUgcHRu
NTE1MCBkcml2ZXIgZG9lc24ndCBoYXZlIGFueSByZWxhdGlvbiB3aXRoIHR5cGVjIHN1YnN5c3Rl
bS4gQXMNCkp1biBzYWlkLCBpdCB1c2VzIGV4dGNvbi4gDQoNCkFsc28gSSBoYXZlIHJ1biBkdC1z
Y2hlbWEgY2hlY2ssIG5vIHdhcm5pbmdzLg0KDQpUaGFua3MsDQpYdSBZYW5nDQoJDQo+IA0KPiA+
ICsgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICBwdG41MTUwXzI6IHR5cGVjQDNkIHsNCj4g
PiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJueHAscHRuNTE1MCI7DQo+ID4gKyAgICAg
ICAgICAgICAgIHJlZyA9IDwweDNkPjsNCj4gPiArICAgICAgICAgICAgICAgaW50LWdwaW9zID0g
PCZncGlvZiA1IElSUV9UWVBFX0VER0VfRkFMTElORz47DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArICAgICAgICAgICAgICAgcGlu
Y3RybC0wID0gPCZwaW5jdHJsX3R5cGVjMj47DQo+ID4gKyAgICAgICAgICAgICAgIHN0YXR1cyA9
ICJkaXNhYmxlZCI7DQo+IA0KPiBTYW1lIGhlcmUuDQo=

