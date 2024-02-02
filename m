Return-Path: <linux-usb+bounces-5759-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E5F846B94
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 10:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C6841C275A0
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 09:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B38276023;
	Fri,  2 Feb 2024 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="OiYaKrIh"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2049.outbound.protection.outlook.com [40.107.6.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86FB6A002;
	Fri,  2 Feb 2024 09:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706865035; cv=fail; b=aGmE6JBP8xYO4Yt5LtKIeu1SJvWduYyYqq7oktA5ACOLR/+145A/WKbQlFvEUbF8upVYZF5McZzBH1ivRLuR8L6MuTOuhYST/Db/tBHRtmzWMkV82wFyOAXBINYm9I4KTASYwdLTKc42B0pZMQ14HtLhZ900h2+5EcU+7rKyMs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706865035; c=relaxed/simple;
	bh=mynDnNImNE2/JD1Ay9xuRYRSSn/nKXZ8aJig422Aaf0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M1awS6g56pZzlNJKYgyobBaO5IZWNsJtfkbsd9W8sS3s53w58c6VOrIldY+WKyxE/hQbS4Yse68pmU07uzP3UknIyEhD30X2iLKsDU4w+E07GJ9b+S1Sfc6RfCL0nDOnA7A65P69OeCn4kcOs9rGu6XyiWT2zVztQcasRXr8WLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=OiYaKrIh; arc=fail smtp.client-ip=40.107.6.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8G/DSVYMjQWKwZmNrnTQw3glvHESa3mL9MwNsHGnNL+tlOg/M9f8aEcHn/W6vbtJrbftYcnKBv6LI29UpyneQevzquLrz2F+FgyhE5HinAUAYpM4MxdK8+rQOS7/SAZPFsJSIpbLkU+4gYuW7dAqcohuQUd6LXvR/g8nirFQSS1L2XWxCR3NqaJ2FRFIBFfJHwJhVe+bUDQ4jZ8w8gbm5XKqiJULKW4gsHW+SHb0ItrS921D1MubeUcdiRR7HcJO4yGJOINTWbF2Jm9v/KOrSDFwUOXlMSejFx7fw1Cwo/Pgus1hRmzjyH2iUCBnBWFpq72b6K/SEztb0nVKs1lTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mynDnNImNE2/JD1Ay9xuRYRSSn/nKXZ8aJig422Aaf0=;
 b=g1LvcKaQZ7IYkGUgvw0PEgsPPY7vr02y7OZHOqnFOG4+qYJjv5rzVYO8H7Wz8cxzE9Nea8kQqLWEPvXQwDXuI/7pUbyMDUqtO1GhbvkVEC70Ma7WBh9Q5GXSMjeT4lCtHhAS4ukpTAKLLfIHxpZvmK+niDZm8Z6be1OUKuLp+Tu4MMb+g2I+Zwb7q9qCeHjCGY8nE1T11O9fHdIGU2phCUYQ8pf+IRWqOvh1KjzO4RliFKLk4LyG2ulDMPIbvPLij+TazEmroS05R7yXkBd0lB/WdGeKzL4h9Tk3kbf6p7lPNlRruNpnPhNCv9LGOrzZ0oPFkZN4pGqlv8gY1mJxww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mynDnNImNE2/JD1Ay9xuRYRSSn/nKXZ8aJig422Aaf0=;
 b=OiYaKrIhGdzUWbr6/oISKYEEpTiQg2FOyc5nWnFTmhzgBQ508bIoqyH2g7U7HJm/GQzqMhaZs0D4bSFwml2v/j2K828TNzCLtlLVHz/qSehxYkX8ijO4eTyLUS/y3TgwfRhfSV5eapBaGAp++cc8lUEBJe9tqRr+fTv1t3U6LSE=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU0PR04MB9321.eurprd04.prod.outlook.com (2603:10a6:10:354::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 09:10:29 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 09:10:29 +0000
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
Subject: RE: [EXT] Re: [PATCH v5 4/8] dt-bindings: usb: ci-hdrc-usb2: add
 restrictions for reg, interrupts, clock and clock-names properties
Thread-Topic: [EXT] Re: [PATCH v5 4/8] dt-bindings: usb: ci-hdrc-usb2: add
 restrictions for reg, interrupts, clock and clock-names properties
Thread-Index: AQHaVDnR5mcgOXJRdUiha/FdRGQ9p7D2scSAgAAP73A=
Date: Fri, 2 Feb 2024 09:10:29 +0000
Message-ID:
 <DU2PR04MB88221602EB986D2C2A5BBF8D8C422@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
 <20240131114324.3722428-4-xu.yang_2@nxp.com>
 <a0134089-a283-488b-8d7f-3f59dd938b60@linaro.org>
In-Reply-To: <a0134089-a283-488b-8d7f-3f59dd938b60@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|DU0PR04MB9321:EE_
x-ms-office365-filtering-correlation-id: 1a95e045-4e68-4c0f-a85c-08dc23cecd83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jnnKErkfjZN+5xrld8g6kCa7UUbK4VHlQpbHxGecvsYAFLBQj2w/+DZtVIdg5fVWNbIRZ3gWH4uzpdtTpgcdU4l3KEH6zbXvl9YYYshZ975XVBQwJgR7h+gASzonPMo3vVNcbyykyKFIpBTldCgp4ajyXgOpvp/WFqa4msUXVKWfaok7JV4/ppm/fSolF/QRTUR5xthamZKiH0Ub5NnDiwoBoNwAs5WrxGVIhzg31U55pR7KTFylSImxWdzrtAhGFcSTxOWFAluq0/0OZ6u/jjl+0s8zPYiaZ7k3nwhWmvUqlv/c9OwCyOi4/4ZhZmP81xmy3Np7XEGLaMCfkjFf6ct5t+RxFvoFsu7gYh4QTksbaIyWxW0LURuyVUQBq9QMle6A9s2UxEjZtmaW2sLGURVrCe/qkuX5r5G3ke4lqS4p64eNT3WEkLU4FgsoAnVkMmouNgOQIgrnOx7WPWIaOw9j0xlPUYKUjsUckAMXl5Vdrqhn8Y8OpXf5vwSJbufYQ4FQtKRzv7Vg5BT4b+mFXT1kK3N3z2fOOBMvw1Pwj5G1pF+M/EGNZ1GIzbLVwtgkgNXLW9C60a8nld/qxi91iA0dFX7BFaOUl251pcDrsm4ODZEiw0LYcZi75BQK21s4uZ3I3WPrsYa/1QjrF4VRqQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(9686003)(26005)(38100700002)(122000001)(5660300002)(52536014)(8936002)(4326008)(7416002)(2906002)(7696005)(478600001)(6506007)(66446008)(54906003)(64756008)(71200400001)(8676002)(66946007)(76116006)(316002)(110136005)(53546011)(66556008)(66476007)(33656002)(38070700009)(41300700001)(86362001)(921011)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WFd6dTVVeXgvVWtwUzkvMHRXRFlFTjVVZ1ArQjhuckJvWXhPZDFsUDRsNGZu?=
 =?utf-8?B?S2tmWDhqeGd2NloxMm05R2pHUFV2aXROb3VYdyt1bE0zeU1uRkd6eEE4c0xI?=
 =?utf-8?B?NHFqbjNCaFZRT3ZnTFQ5TU1FUU51ZGo0MkxxRW83OEZTTGxtdTBzVit2UGly?=
 =?utf-8?B?RWVMZ3VjdVo5SWt2OGlMeEJlZEtKbzRuSWFFYlNEUk9ZWGlyVnZVb0VWbXI2?=
 =?utf-8?B?WTRwa1FqRHl2eFBEUEZ4Zm5ET0d2QkhtckJMc3V4MmFSem56WDZ3Y28wODVW?=
 =?utf-8?B?U3Q5U3NaVy9FbWNjYnNuT0FEY3RGZHFYSUlWcnZ3TGc2ZTZocjI2bFpEOUVi?=
 =?utf-8?B?dFppQlZMUWJtaXQ3cFBMZGRLUlpPMGl5Sml3S1hEdllkeEhpeHB5d25idEow?=
 =?utf-8?B?TTZKUEdYK1M5RU5UTi8yUWE0NFdzK1NOdXRoN05oUXJZUnRuc0U5L0ZsUEZa?=
 =?utf-8?B?RWEvN3hzbEJhVVNnazZlM3haS09PTGJtNFNrS3NhWWQyVVcvVjVNVDZkWkJt?=
 =?utf-8?B?Y08zdldpYnhQQmJHeUk0ZTYzdjVFNHhudE1uYmhQeWdFTEFLd29PQWlZcTZx?=
 =?utf-8?B?V1VuRnA1YW9qVGZIRTRsd3E2WlpQU0NKaGxnWW5RL1RzeE1qZnhpcGJGT1l0?=
 =?utf-8?B?VG1KWDhYZlhHWnh0R3FQMjFITVNxN0FhV3d0L0pVaWlMVHhZZWtmWkk2YkhG?=
 =?utf-8?B?T2ZGdSsvM1lUWk1jaEE0WXI5NkRIN1k3YllMOVRUbGs4T3ZnU3BZLy9LYys3?=
 =?utf-8?B?YW52Zzc4Z1ZzWTJaRk52ZDQ2Z0dEOTQwQWdxUjFFbkEvendiekNxSEtuVXhi?=
 =?utf-8?B?QW1lUGlGMzU0MU9VWHBURXVQblhUTzZZV0dLTjhLaVNhU25CTlF6dUVVVnFK?=
 =?utf-8?B?OXZFbmN2SXJhbnozUFFybFZ3TUlVdXd3Y1FCS1BERDIxTGJFNm9pZm83RXZs?=
 =?utf-8?B?QjJhT2Y4WDc4V3VJL2YwOERLUlcxL2o3THEzY1V6Qlg0amtUU2dZamhUcjNC?=
 =?utf-8?B?byszM0xicUJCekRWRWNUMlAzclp1dldiU01nRCtLQzlSbEk1dWNRVjk4QnV0?=
 =?utf-8?B?NS9DNXdmM2huczhwQnVQOXJQV3VMM3MrbUlKTnRkOGMvYmVMRHpiekc4aCsy?=
 =?utf-8?B?OWVIWXh4WmFyVTRGTVpCdkJFMDdhUzE0N2hTQXhzbGFWNEZqbUFSSUNodHM4?=
 =?utf-8?B?RjVFVzZNYjhRMXV3cWplMVgya05ta1cvMHZTaEdUY1lwcTRVNm96UTQ0WU5X?=
 =?utf-8?B?UWsvU0F5a0xxbDlCYXN5S3ZWWmRFNXFGSFQ5RDdCcUVHblRmTnlXS2VLYmls?=
 =?utf-8?B?THBDSjFjTzJIeWdsWHA2SVNidEJIN2JzUjY2c0thWVFwZGlJMlhzV2JrM2Uz?=
 =?utf-8?B?S1BGb2tKVy9BaW1sVy9PKzlsU1NUd29ZVU5OTUFlWWJsekt3dmlFM0xMbytK?=
 =?utf-8?B?aWVrZHBZaDBZSTlxZjB5UU1PT1JseFVOd3loU1VKSHdlT092WjNRUHNaNHpN?=
 =?utf-8?B?bmpLUnRLQ3dRSlVrd2RrSC9sd0UwYlpNeUVTNER5VnZtRDBXNUo0YmQzL1l5?=
 =?utf-8?B?MmQ2c1ZMWUtxa0EyMTg5UEtscUU5NjJhM1J1VGxYZ2VhWFFkaDRUYlFGL2h1?=
 =?utf-8?B?OGJWaXB3aXRZMlFsWFgzbGdEcVZ5eGhwK3RqY04xd2xMT1Z2Ty9oTlFsQnNh?=
 =?utf-8?B?YXF4c2QySGcvTVkrZmRHMXRwOElhcnBBK2JxSithbU14bEV6WHQweTUrNG0y?=
 =?utf-8?B?bDhTMG1lZHBaUlJQWG5UWGc4Z1lzMmNIREVyRkkwdGxWdWlDWW1Ra0JQYlBZ?=
 =?utf-8?B?WTJlUjgya3RCMlF1WnRBRjZzZWRiSXlYVGtGUzJzaGs1dmxNRUNoWVBCYk9H?=
 =?utf-8?B?ZlNyUTFGaTMyK2d5WURoZ041NUJZcytKNjlaTXNJMlRtUldmTGtkaVA0TWM0?=
 =?utf-8?B?UDNiUUh6djQ2OFJFVzJ5Syt3NjhQekJ6TUN3OEZnemNwRlVEc1IzMGZ4OGE1?=
 =?utf-8?B?MWx2SFZYQTJUVzVWRUx5cDN0RjE5Zmt3aVZrK3Q0eW5YeVRkak1ZeVlIYm02?=
 =?utf-8?B?QzR5cm1EOTdJaFp6YXltbm1UT0lOUmt5QUNieE5UOWw3bmpOejIyVExWYnQr?=
 =?utf-8?Q?qVTo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a95e045-4e68-4c0f-a85c-08dc23cecd83
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2024 09:10:29.7730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xx2QtL8LrzEZZUCMK0WIsshduhMqPLTWYYtP5mn19sKOio2s11BZPFDCMXuQHVAkCdMFRu8D1dX5SBvX6lTUDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9321

SGkgS3J6eXN6dG9mLA0KDQo+IA0KPiBPbiAzMS8wMS8yMDI0IDEyOjQzLCBYdSBZYW5nIHdyb3Rl
Og0KPiA+IENoYW5nZSByZWcsIGludGVycnVwdHMsIGNsb2NrIGFuZCBjbG9jay1uYW1lcyBhcyBj
b21tb24gcHJvcGVydGllcyBhbmQgYWRkDQo+ID4gcmVzdHJpY3Rpb25zIG9uIHRoZW0gZm9yIGRp
ZmZlcmVudCBjb21wYXRpYmxlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFh1IFlhbmcgPHh1
LnlhbmdfMkBueHAuY29tPg0KPiA+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiB2NDoNCj4gPiAg
LSBuZXcgcGF0Y2ggc2luY2UgdjMncyBkaXNjdXNzaW9uDQo+ID4gIC0gc3BsaXQgdGhlIHJlZywg
aW50ZXJydXB0cywgY2xvY2sgYW5kIGNsb2NrLW5hbWVzIHByb3BlcnRpZXMgaW50bw0KPiA+ICAg
IGNvbW1vbiBwYXJ0IGFuZCBkZXZpY2Utc3BlY2lmaWMNCj4gPiBDaGFuZ2VzIGluIHY1Og0KPiA+
ICAtIGtlZXAgY29tbW9uIHByb3BlcnR5IHVuY2hhbmdlZA0KPiA+ICAtIG1ha2UgaWYtdGhlbiBt
b3JlIHJlYWRhYmxlDQo+ID4gIC0gcmVtb3ZlIG5vbiBpbXggcGFydA0KPiA+IC0tLQ0KPiA+ICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvY2ktaGRyYy11c2IyLnlhbWwgfCAxMTggKysrKysr
KysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMTggaW5zZXJ0aW9ucygrKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
Y2ktaGRyYy11c2IyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L2NpLQ0KPiBoZHJjLXVzYjIueWFtbA0KPiA+IGluZGV4IDNiNTZlMGVkYjFjNi4uNmFkMzU4MjA1
MWI4IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91
c2IvY2ktaGRyYy11c2IyLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi55YW1sDQo+ID4gQEAgLTQxMiw2ICs0MTIsMTI0IEBA
IGFsbE9mOg0KPiA+ICAgICAgICAgIHNhbXN1bmcscGljb3BoeS1wcmUtZW1wLWN1cnItY29udHJv
bDogZmFsc2UNCj4gPiAgICAgICAgICBzYW1zdW5nLHBpY29waHktZGMtdm9sLWxldmVsLWFkanVz
dDogZmFsc2UNCj4gPg0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4g
KyAgICAgICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAgIGNvbnN0OiBmc2wsaW14MjctdXNi
DQo+ID4gKyAgICB0aGVuOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNs
b2NrczoNCj4gPiArICAgICAgICAgIG1pbkl0ZW1zOiAzDQo+ID4gKyAgICAgICAgICBtYXhJdGVt
czogMw0KPiA+ICsgICAgICAgIGNsb2NrLW5hbWVzOg0KPiA+ICsgICAgICAgICAgbWluSXRlbXM6
IDMNCj4gPiArICAgICAgICAgIG1heEl0ZW1zOiAzDQo+ID4gKyAgICAgICAgICBpdGVtczoNCj4g
PiArICAgICAgICAgICAgYW55T2Y6DQo+ID4gKyAgICAgICAgICAgICAgLSBjb25zdDogaXBnDQo+
ID4gKyAgICAgICAgICAgICAgLSBjb25zdDogYWhiDQo+ID4gKyAgICAgICAgICAgICAgLSBjb25z
dDogcGVyDQo+IA0KPiBUaGlzIHdvdWxkIGJlIGp1c3Q6IGVudW06IFtpcGcsIGFoYiwgcGVyXSwg
YnV0IGluIGJvdGggY2FzZXMgSSBxdWVzdGlvbg0KPiB3aHkgdGhlIG9yZGVyIHNob3VsZCBiZSBm
bGV4aWJsZT8gTm90aGluZyBpbiBjb21taXQgbXNnIGV4cGxhaW5zIGl0Lg0KDQpUaGUgZHJpdmVy
IHdpbGwgZ2V0IHRoZSBjbG9jayBieSBjbG9jay1uYW1lLCB0aGVuIHRoZSBvcmRlciBzaG91bGQg
bm90DQptYXR0ZXIuIEhvd2V2ZXIsIHRoZXNlIHRocmVlIGNsb2NrLW5hbWVzIHNob3VsZCBiZSBw
cmVzZW50IGF0IHRoZSBzYW1lDQp0aW1lLiBJIHNob3VsZCB1c2UgZW51bSB0aGVuLg0KDQo+IA0K
PiBQbHVzIEkgd2lsbCByZXBlYXQgbXlzZWxmIGZyb20geW91ciB2NC4gSSBkb24ndCB0aGluayB0
aGlzIGlzIGhlbHBpbmcsDQo+IGJlY2F1c2UgdGhlIGZpbGUgd2lsbCBzb29uIGdyb3cgdG8gdW1u
YW5hZ2VhYmxlIGNodW5rLiBJIHByZWZlciB0byBmaXgNCj4gaXQgYXQgYmVnaW5uaW5nLCBiZWZv
cmUgd2UgcmVhY2ggc25wcy1zY2hlbWEgbGV2ZWwgb2YgY29tcGxleGl0aWVzLg0KPiANCj4gUGxl
YXNlIGRlZmluZSBjb21tb24gc2NoZW1hLCByZWZlcmVuY2UgaW4gdGhpcyBmaWxlIGFuZCBtb3Zl
IElNWCB0byBvd24NCj4gZmlsZS4NCg0KSSdtIG5vdCB0aGF0IGZhbWlsaWFyIHdpdGggZHQtYmlu
ZGluZ3MgYXJjaGl0ZWN0dXJlLiBJZiBJIGRlZmluZSBhIGNvbW1vbg0Kc2NoZW1hLCB0aGVuIHNo
b3VsZCBJIGNyZWF0ZSBpbXgsIHFjb20sIG52aWRpYSBhbmQgb3RoZXIgZHQtYmluZGluZyBmaWxl
cw0KdG9vPyANCg0KPiANCj4gSW4gYW55IGNhc2UsIHBsZWFzZSBwcm92aWRlIHNob3J0IGNvbW1l
bnQgaW4gdGhlIGNvZGUgd2h5IHlvdSBoYXZlIHN1Y2gNCj4gZHVwbGljYXRlZCBpZjp0aGVuOg0K
DQpPa2F5Lg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=

