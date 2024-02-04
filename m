Return-Path: <linux-usb+bounces-5842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B306D848B98
	for <lists+linux-usb@lfdr.de>; Sun,  4 Feb 2024 07:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6A5F1C21DC8
	for <lists+linux-usb@lfdr.de>; Sun,  4 Feb 2024 06:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A73379D9;
	Sun,  4 Feb 2024 06:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="FpwL1v7k"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2062.outbound.protection.outlook.com [40.107.247.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872AA7494;
	Sun,  4 Feb 2024 06:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707029803; cv=fail; b=vAvddO7pDXkTDeIFyrYwFHsnsnb3620Ck7XbggfPlV3SFisAIx1zdhdPmnY6f2ymmIbIswUkzKQ/Ke4IwHAbGpvzTzVNQVLfByIQ5ZOsLzi5rG5T2pmH/kRVzVNbHCJp8cdG3sZ8O/8YqoXUztkyMqW0h8Jpg0xwz9W4CdMky8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707029803; c=relaxed/simple;
	bh=U4viSi6joHedUpGLenNLZp+u2y/LPGdPK+IROQR/8YA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PG5lwapAZ4DD6Y8T3+LigqfZPDGSi5VoqukchtCJwLxBSnyv0Q3VDc2MhXyqcs0nJzArjK48rllzzK0/lqI7qK6V471CyQdLoJ6SwhjanE8yd83NjUdFF2XZOLF2u3q47b93R3KnC9dFNTuWUzdRYwVVn9XPrrm68knTpmCxjQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=FpwL1v7k; arc=fail smtp.client-ip=40.107.247.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIxirE5vm8beZgfJjZ+rfJ0uVFk6AvZOmazovgviofoNJ5kLb427u/kTIInZIe5WIOxg3Wb9qIRpaaC4yoAj8KX5EOTb67+68Gef8Cqsbi3rL3sVFHoNtiNHRwgaeSs1F7WgnvqCxGVgj6b8r2crjbm7GKbsUfjEjFXqSYXdT+qKP8aneqEzbhc+KrV8cktMTdi2PYz0A8YH5pQzYR3wueEjBdz9I7KV12arb9QQBxlKaxcXJ9Rg/xyYMvY85InBtfq4TpjVWdK1GeUg8sv6XySB7ubgYgoLB5iPvXTy8BJ8Y9knZLNtm8dmYOFSKT5BRxLI3xWqmx9qicPLMojwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4viSi6joHedUpGLenNLZp+u2y/LPGdPK+IROQR/8YA=;
 b=bAUCmFr+zl2yvKclg9nx5ctgBv0Zwq0ORwNAb3jlug/NrMNk3zI84Cf4czAwBQt5FvZ03gAAxdKdZLHLFcKbjCU94n5H5zeS5F+cQHE3VtuQQpARy3dyV9d3UiiSulEKMnTcLzyuihLfvZhDmLZjdbw3qkIfTAshbHZN2MAupSHjuSx6BwlgRJTcEXJo1n4q1GxCx6Rw0cT1wu5JGfOcYT2q86pPK02XAf8z+scxphD9luR5JxakTpTXyP3F3nHCySIgkVadqXHj683CY7+EmiFnpxytLqVhUAUm0f8RGj9CNRrjcnCGGvZo8LZlvr0tONneemT+fz6Km81Y/8XfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4viSi6joHedUpGLenNLZp+u2y/LPGdPK+IROQR/8YA=;
 b=FpwL1v7k/2K59UOooGhSKgQdUKcqoIsojbsiNRm6C0jWK1Z6SZvZXwVDk5ymjZbcieBLUe3nxNQo0UNYxi70Ivm6AglQo+0eTw09RPyy9kfMcVYDvN6CmDDAu2CYSv9w9/0ThwCwxqBMVg5rwRCyIYa0/p4dZDxggAtAEJHe5D4=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DUZPR04MB9946.eurprd04.prod.outlook.com (2603:10a6:10:4db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.32; Sun, 4 Feb
 2024 06:56:38 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7249.032; Sun, 4 Feb 2024
 06:56:38 +0000
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
Thread-Index: AQHaVDnR5mcgOXJRdUiha/FdRGQ9p7D2scSAgAAP73CAACXDAIAC3clg
Date: Sun, 4 Feb 2024 06:56:38 +0000
Message-ID:
 <DU2PR04MB88221841F66A22B5A5DE47258C402@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
 <20240131114324.3722428-4-xu.yang_2@nxp.com>
 <a0134089-a283-488b-8d7f-3f59dd938b60@linaro.org>
 <DU2PR04MB88221602EB986D2C2A5BBF8D8C422@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <bcd733ab-ea9e-4ef0-a521-8e6c2023479f@linaro.org>
In-Reply-To: <bcd733ab-ea9e-4ef0-a521-8e6c2023479f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|DUZPR04MB9946:EE_
x-ms-office365-filtering-correlation-id: 118b363b-ed92-4ccb-aef8-08dc254e6f3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jOf8m21Ksvc9CY8WQBMwEq1Iwne9l0qSHb8ro+RDiqcFp1P6MptSU2pmvKFAIzr7NhuVzWK+3zs+qPIKBCLqccW9QKDQ9iejFCP2cDOG4L+52RcHe8lyqfTzG2Pey/SWl99pKeJqkn5mYt0pzPsxc8NCfZRl4jkPEDa766YRrPsAEjF/5wa1ATL0F7WvYKy69+Z+/thjGKn+OQ66oDUF/P0p2cR3E5wb0TuW4QS+e++DOpZxqsTw3IggmpLA31OY14yRkirsgo3HA488D8MdCkxZO4QLcDKcY0WibGOv3gVI8Rw7W2zgtjM92HrZZVrNSAd69g9S6KDNus4twGaPcgcK0CRPYUW/wOXMMqQOZkjnfyXXqEuB/FcpA59q4MmGTs4aVQl1jtGTS6aBm3tbPtPM4FTpoVhB7S/GS1I5vQNJB4+W42yu+iTiX/a15Cy7g2KqjUwwfiAv/b2TIJVLqldVCOYK3vSXbgy++UDfmKDhaEVCNe+jQO+DD3gl+/Tc8kwcNIuD55dAclMpfycKU3InH0b4vpHgF1upjonzB7noALK0H0PeFT/f2CRfmFU/R3SzQooeq/bZ0YEmTsyJMvztNSp2pq0Ub3mYL0pKn4EfHUDQEguehtXYl0IuK4pA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(41300700001)(52536014)(8936002)(8676002)(4326008)(2906002)(5660300002)(7416002)(33656002)(86362001)(110136005)(66946007)(66556008)(66446008)(64756008)(316002)(54906003)(66476007)(38070700009)(122000001)(76116006)(38100700002)(7696005)(9686003)(53546011)(6506007)(478600001)(966005)(71200400001)(83380400001)(921011)(26005)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NklwYzJYYUUyV25lY0NZcVltSFM0T2xQZVRHZ3kreDFZSVlWVk1XYjFBUFow?=
 =?utf-8?B?UGM3R2NOQ2xlbGlzQzQvME9teUZUVmRqSGJOd2RoTVdwZE9mVUtCOFJlc2ZX?=
 =?utf-8?B?ZHN4NHIwdXZXSGhJMEtBRnlWYkUwc0dTcmZLbFM3ZnNGMnpLS0dQTFNuUURO?=
 =?utf-8?B?RjlTZW9PVHlFZnd4TlZHWVo1UjRUb2RUMFBuRllaN2xlU2V0ODA5NXNnTGdF?=
 =?utf-8?B?Zi9WaDZ0SzRNejFCdjNJbFkxSzIvNllBQ29za1dCd0tuOXorc3FiS1JYVXFS?=
 =?utf-8?B?UUdsVHBQMmNNUitjZVRLa0hobit2cTNUYlI4c0pvYXZ6bktXTkM4eXlSMmpI?=
 =?utf-8?B?dWE1Z0VUeDBtMGR3Uk1talFBOGY5V0pOVjNQQlFaWDBHVkZkN2FkVnAra0pm?=
 =?utf-8?B?RUgxNkJUV3JhVWRkZEtYcXh5OWNSWFBZN2ZNMDJPYmVJbXpaYkdqVHl4U0py?=
 =?utf-8?B?YlhUT1BFSlh4amJlbkZaS1hSTVRZSEEvRW05NG9WT3lxSlBFMjNReUJIeGow?=
 =?utf-8?B?dFo1aFplbkN5VWFJT3lDd29NQUovUXNHWmd0cjd4cjVZODJmM2ZNVFh3N3A0?=
 =?utf-8?B?M0N0ck9SY1ZQVnpOY3dBN3FmSWErWjdJWW4rTmdQeTJBZ1p1RVZGdlN4UXJs?=
 =?utf-8?B?ZHpRZ2xCWXlpMzgzQ0FpYy9kbFBrbWM3QlpRemVweHU2QW0yd0Frb3ZuVHRY?=
 =?utf-8?B?anVZYnZOMTRFMGNBSWFMcC9PTTdrTFk2RU1GLzVsRm95U1NPS0ZuY08yWW91?=
 =?utf-8?B?aUhVSE1sd25WaHhtUVBuZElVTXpnQS91REVvbDFHVUJrOTN4bVpqODRsWTFB?=
 =?utf-8?B?amhlN2hZUzI0YWRRak5xZHpBc1F5eDNTeVpsMkhydW1PNmFSNkdvSGRuaEtM?=
 =?utf-8?B?cHNjNThTa2hGQkFpSy9MRUtTNGlmQko5V0dGRHhvKzYzT2V6b1huY1FVWkdv?=
 =?utf-8?B?dmtTR0FMd0lJNGNSbVlrZ01ZQUhQa2ZiRVNkcTNOOWZQQnQxSkFxSlEzVlkv?=
 =?utf-8?B?a21zU1NVY1hQR1I3R1FqUFFkV3ZZVy90MktDU09DSktLbUVnUEVQR2NqdERT?=
 =?utf-8?B?NDN2c2pYSkszUFJ0WkthSDBYTWdySEFOZWFtOEhmZi9oQmRGNTRyWVlOWDBn?=
 =?utf-8?B?MCtnMHN6UldDNW9abWRYbnk5NlFzNHRycjYvbDF2dXhvdDRoWElpV2Y1aFE0?=
 =?utf-8?B?NjBwaksvQVpmNU5IZDhOTnZyNXZDOFRpRGcvbzdNYXRjRDk4UHI5TFBNSFJi?=
 =?utf-8?B?eUlsTVA4Y1FPVE9qSCt5QThWYXcxUEdCUHl0ZVJuUFpJamczSFN5bTJSc2FM?=
 =?utf-8?B?VS95anZ4YmtCcEkxbWhuWWhzU3JJNGp3YStMc0puKytjODB5dXdWdGNpZ2RX?=
 =?utf-8?B?Z3dScEhsNklJOEdwblQzOG8zZXJ2S0w2b2lLWGM1MDJ3aHZURnl4VWxqcHBu?=
 =?utf-8?B?MVF2ZFU1Vnk0NXl3bmdvdmpqTEFqeTVyQzc1Tzc0enFoN0lBSnZWY2gzS3p2?=
 =?utf-8?B?TmRYUGFROGtZcWFvL09DQklMdE1ETExvNDJqUzFjKzRMdTN1N1hOZGtkZGRm?=
 =?utf-8?B?aHBnYUx4N3Z6bGVSSTFuSTlVTGF5UnZqb2dqQWZuVnc5SFFuL3MySXlFblJU?=
 =?utf-8?B?bDArdlVEK0pPNU1FYnJpQ0UvVStwTlJBOFEzUUQ4R3BuZyswd25iWnpJWmNN?=
 =?utf-8?B?OEUvYzd5VUJsSHg1ZFFlK21rZ2UramdtMmIzck1tY0NXNUQvRE5YSFFRdUVC?=
 =?utf-8?B?aGQ0TnMwSGVEZ2NoMUh4bGR6SWRFenl6eFFUd1ZnS2ZGMHBkQXc5VWF2TFMy?=
 =?utf-8?B?SmhSSVdHN01SNlIrUUgvZWM2MzY5TmlOMlpHRXBJRGpWb1lWU0JadXBTOG9O?=
 =?utf-8?B?c0VFbmg5ZkNJNkcxNVJkY0pUWm10bG9TWjBnQnpVM2FBUE1qaGJMSU93RUVL?=
 =?utf-8?B?S0NCVG0wT3VZMFo2RlFMaUpYOGNCWEM4RXQ5Q0dxK1hEV3RjUnBvUGJnYUlU?=
 =?utf-8?B?azk1YWIwNm03SUJVRThGby9PblJaNkJZay9MNEpvb2o2Mzg0aUViYTJaRWFx?=
 =?utf-8?B?eU1uVldEWjN5Y05ZRCtGOHViN1ZZR1lCMHNFeE8xYnlXcTVPZGFKNFJON0tK?=
 =?utf-8?Q?ZHVE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 118b363b-ed92-4ccb-aef8-08dc254e6f3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2024 06:56:38.3697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QZfWcNivB66FgUYOzxHyMMh/6fyNcJ/kljvKmx3kWvTBq9MsUW4L31z9ZutRUkbG/DfIh0Yr9xnFKL1kdc43pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9946

DQo+IA0KPiBPbiAwMi8wMi8yMDI0IDEwOjEwLCBYdSBZYW5nIHdyb3RlOg0KPiA+IEhpIEtyenlz
enRvZiwNCj4gPg0KPiA+Pg0KPiA+PiBPbiAzMS8wMS8yMDI0IDEyOjQzLCBYdSBZYW5nIHdyb3Rl
Og0KPiA+Pj4gQ2hhbmdlIHJlZywgaW50ZXJydXB0cywgY2xvY2sgYW5kIGNsb2NrLW5hbWVzIGFz
IGNvbW1vbiBwcm9wZXJ0aWVzIGFuZCBhZGQNCj4gPj4+IHJlc3RyaWN0aW9ucyBvbiB0aGVtIGZv
ciBkaWZmZXJlbnQgY29tcGF0aWJsZXMuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogWHUg
WWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+ID4+Pg0KPiA+Pj4gLS0tDQo+ID4+PiBDaGFuZ2Vz
IGluIHY0Og0KPiA+Pj4gIC0gbmV3IHBhdGNoIHNpbmNlIHYzJ3MgZGlzY3Vzc2lvbg0KPiA+Pj4g
IC0gc3BsaXQgdGhlIHJlZywgaW50ZXJydXB0cywgY2xvY2sgYW5kIGNsb2NrLW5hbWVzIHByb3Bl
cnRpZXMgaW50bw0KPiA+Pj4gICAgY29tbW9uIHBhcnQgYW5kIGRldmljZS1zcGVjaWZpYw0KPiA+
Pj4gQ2hhbmdlcyBpbiB2NToNCj4gPj4+ICAtIGtlZXAgY29tbW9uIHByb3BlcnR5IHVuY2hhbmdl
ZA0KPiA+Pj4gIC0gbWFrZSBpZi10aGVuIG1vcmUgcmVhZGFibGUNCj4gPj4+ICAtIHJlbW92ZSBu
b24gaW14IHBhcnQNCj4gPj4+IC0tLQ0KPiA+Pj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Vz
Yi9jaS1oZHJjLXVzYjIueWFtbCB8IDExOCArKysrKysrKysrKysrKysrKysNCj4gPj4+ICAxIGZp
bGUgY2hhbmdlZCwgMTE4IGluc2VydGlvbnMoKykNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVzYjIueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvY2ktDQo+ID4+IGhkcmMtdXNi
Mi55YW1sDQo+ID4+PiBpbmRleCAzYjU2ZTBlZGIxYzYuLjZhZDM1ODIwNTFiOCAxMDA2NDQNCj4g
Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvY2ktaGRyYy11
c2IyLnlhbWwNCj4gPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91
c2IvY2ktaGRyYy11c2IyLnlhbWwNCj4gPj4+IEBAIC00MTIsNiArNDEyLDEyNCBAQCBhbGxPZjoN
Cj4gPj4+ICAgICAgICAgIHNhbXN1bmcscGljb3BoeS1wcmUtZW1wLWN1cnItY29udHJvbDogZmFs
c2UNCj4gPj4+ICAgICAgICAgIHNhbXN1bmcscGljb3BoeS1kYy12b2wtbGV2ZWwtYWRqdXN0OiBm
YWxzZQ0KPiA+Pj4NCj4gPj4+ICsgIC0gaWY6DQo+ID4+PiArICAgICAgcHJvcGVydGllczoNCj4g
Pj4+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4+PiArICAgICAgICAgIGNvbnN0OiBmc2wsaW14
MjctdXNiDQo+ID4+PiArICAgIHRoZW46DQo+ID4+PiArICAgICAgcHJvcGVydGllczoNCj4gPj4+
ICsgICAgICAgIGNsb2NrczoNCj4gPj4+ICsgICAgICAgICAgbWluSXRlbXM6IDMNCj4gPj4+ICsg
ICAgICAgICAgbWF4SXRlbXM6IDMNCj4gPj4+ICsgICAgICAgIGNsb2NrLW5hbWVzOg0KPiA+Pj4g
KyAgICAgICAgICBtaW5JdGVtczogMw0KPiA+Pj4gKyAgICAgICAgICBtYXhJdGVtczogMw0KPiA+
Pj4gKyAgICAgICAgICBpdGVtczoNCj4gPj4+ICsgICAgICAgICAgICBhbnlPZjoNCj4gPj4+ICsg
ICAgICAgICAgICAgIC0gY29uc3Q6IGlwZw0KPiA+Pj4gKyAgICAgICAgICAgICAgLSBjb25zdDog
YWhiDQo+ID4+PiArICAgICAgICAgICAgICAtIGNvbnN0OiBwZXINCj4gPj4NCj4gPj4gVGhpcyB3
b3VsZCBiZSBqdXN0OiBlbnVtOiBbaXBnLCBhaGIsIHBlcl0sIGJ1dCBpbiBib3RoIGNhc2VzIEkg
cXVlc3Rpb24NCj4gPj4gd2h5IHRoZSBvcmRlciBzaG91bGQgYmUgZmxleGlibGU/IE5vdGhpbmcg
aW4gY29tbWl0IG1zZyBleHBsYWlucyBpdC4NCj4gPg0KPiA+IFRoZSBkcml2ZXIgd2lsbCBnZXQg
dGhlIGNsb2NrIGJ5IGNsb2NrLW5hbWUsIHRoZW4gdGhlIG9yZGVyIHNob3VsZCBub3QNCj4gPiBt
YXR0ZXIuIEhvd2V2ZXIsIHRoZXNlIHRocmVlIGNsb2NrLW5hbWVzIHNob3VsZCBiZSBwcmVzZW50
IGF0IHRoZSBzYW1lDQo+ID4gdGltZS4gSSBzaG91bGQgdXNlIGVudW0gdGhlbi4NCj4gDQo+IEZv
cmdvdCB0byBhbnN3ZXIgdG8gdGhpcy4NCj4gDQo+IFdoaWNoIGRyaXZlcj8gVS1ib290PyBPcGVu
QlNEPyBUaGUgb25lIGluIG15IGN1c3RvbSBMaW51eCBrZXJuZWwgZm9yaw0KPiAob3Blbi1zb3Vy
Y2UgYW5kIHB1Ymxpc2hlZCBvbiBnaXRodWIpPyBEaWQgeW91IGNoZWNrIGFsbCBvZiB0aGVtPw0K
DQpJIG1lYW4gYmVsb3cgZHJpdmVyIGluIGxpbnV4IGtlcm5lbCB0cmVlLg0KaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS1y
Yy5naXQvdHJlZS9kcml2ZXJzL3VzYi9jaGlwaWRlYS9jaV9oZHJjX2lteC5jP2g9bGludXgtNi4x
LnkjbjE5MQ0KDQpUaGFua3MsDQpYdSBZYW5nDQo=

