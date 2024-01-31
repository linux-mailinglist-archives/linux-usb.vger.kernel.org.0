Return-Path: <linux-usb+bounces-5686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2F6843930
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 09:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD81C1F2A7C4
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 08:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6AE951C27;
	Wed, 31 Jan 2024 08:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="l8jgPqxr"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2064.outbound.protection.outlook.com [40.107.247.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D9C65BC2;
	Wed, 31 Jan 2024 08:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706690178; cv=fail; b=KrZ8Py3q+XoQNi1uziTswal5AbfoZMTKb2X4B9cpv2k9kSg7y7uEkLRJA/WjIKNx6UtT5fqNtESnoyqjZT5r+hhv9Tw34TMtOpxnoX8YOR5gIVC9RqFWwKgN6KInfWOT9Qdz/b7rsXfMca8GAAdVXEH2BeJGL/OsaVW2ZyZ3aak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706690178; c=relaxed/simple;
	bh=5GaKjdnGx1KCeRtq6Bzdt/gvKHX7vO8T91/PRNTXrws=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jkZNRXKpMQ/G1RMACJlVHbjXpSHMStDMa9LGYmIxUuhyEe4+QWsFA428PNkPrOBAs9b3UO+oJ6bUo+RpFbHzMkIfnKmKyekiOJf2/bk1TOZuaOJ4EAkG5RTSJe8BQCQ0zvYIWxmMZjZ+mV0YLrHF/LSxy78309fCIO9AoDsd1So=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=l8jgPqxr; arc=fail smtp.client-ip=40.107.247.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZiSgvCZsBjQuQ2AIShcDcnfj48S7UhvGSiZxwqMUWOViLdiIBDA6yDy7yoP0DGVHOEU/6tewhuZ8KQtG4c/byTAClWyxE7mdUFLNjb31Q3Kprozvp+3oMi24FkfVahO+uc9OHQ3roFX51xU5+pH0HgyAcOvN9/MKslAO9pQVR5BT0YOg1GR2tcdbTV+oGb0hXK64nTh5iOw+eh6k0L6DdiH9lJa8AkHiv/718cpN9oKKNO+jHxG01MRHBIAMq6j6T/m/fEVzTtGWM92Bd/JfzBNQsLR9v8Z77O0lEHsTg/pl7m4AL/UcQt+gUv9HO7z/ar6OqQWmjyQ5GmaisS06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GaKjdnGx1KCeRtq6Bzdt/gvKHX7vO8T91/PRNTXrws=;
 b=k2thv2BRrUAFyo7t6U+3amGBifrHmbeFXG+SXfqAfocjpLZeBRmkvPmHMYI3Qjbo0/1OwDb99FTP4Ktrh18zV0GS9PZ/lQYz7KhE+XzvruCHmtXrayiqPhWCnKpdWs50gr4HzpsVWnuA+HqdA4UTm51y6iSoROvpR5wAbxVdGhdMveKlk0BrVqPRhuSsNIIubFqkqz2ZwUFUGa/lMvj5q3VdP8/a91Q4V4McsqVZTF2y/RAMBQwAhbxpRvZ1T/WQqJ+MmwP9JLv1QfFydfvWnX1T4P0Mo3gcmm7Yq7si9M49KQex4yNygKXLpEWBz2OBkDbmCFmy8WFLKrv3Z5TkEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GaKjdnGx1KCeRtq6Bzdt/gvKHX7vO8T91/PRNTXrws=;
 b=l8jgPqxrVXj3qwqDtP0hXaDSGMr+ehn6tD/WYxrMvNq8sO/nb1UI/9S8Zee+qB0mUDaQYKZeTdzQWKovVl2+qGO3OTKlEd5F8TQJiGGCMcDf2zTy9x6xVCugaw6WovD+NdfwCxHHSNR33o9sONYfN8FiIkP+cgMpGmdXnxwXOxM=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM0PR04MB6884.eurprd04.prod.outlook.com (2603:10a6:208:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 08:36:11 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 08:36:10 +0000
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
Subject: RE: [EXT] Re: [PATCH v4 5/7] dt-bindings: usb: ci-hdrc-usb2: add
 compatible and clock-names restriction for imx93
Thread-Topic: [EXT] Re: [PATCH v4 5/7] dt-bindings: usb: ci-hdrc-usb2: add
 compatible and clock-names restriction for imx93
Thread-Index: AQHaSqcED0XO3wrhTU6RxgRPgY6pp7DxALaAgAKpzbA=
Date: Wed, 31 Jan 2024 08:36:10 +0000
Message-ID:
 <DU2PR04MB88227179C7D48F17CDEC4C0D8C7C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240119071936.3481439-1-xu.yang_2@nxp.com>
 <20240119071936.3481439-5-xu.yang_2@nxp.com>
 <a33723fa-6fae-44fc-899f-797d24c7f776@linaro.org>
In-Reply-To: <a33723fa-6fae-44fc-899f-797d24c7f776@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|AM0PR04MB6884:EE_
x-ms-office365-filtering-correlation-id: d9debf14-7ff7-463e-5489-08dc2237ad77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Vko+jXriErnLr5BxxuRXMF7GPpuC82iZ+mXVDGKPUB9uSAkd+sHJwq0WYavNPngqTBpYohlpMACOr+KaGYUkWaQIrDb/vP4RoFc2k0o4hQwf4x12BDq9B0ztDkUFI3U/BVWZL/gZ0LbhZhkcxqaeBGieMXFFg0Tyuwca+5Yz3Ooj6tpd71oRMeCxHS3zW6WHcZMG8FqvTf3dhBvnLjHyH4KGxS2/Ik08OTaMPQbMESqmgA1rKkI9a6VmAktv7nK/386ZdlObyiJNabJ6gfCopLn8p4+SXlsv4YlNJdImEeeo1kF3Xsu0qGY/lI73s6eJWAdXjforzTcIzaZh/8KHdPdpZ+RKE+5cC9E/5IOjeXGzKg4rwJBHvGkecD7l3Lpp76c51BSryasZBOQP6fpvjS1g+LhuuHsmwrJZNFzQj8iqShvu9lBsnwYWLylDGnmnbZlDzKj21GwCh5djJDt9rIfXCJRbgp/gARyOt3w69JjCnxumOEty4wjHW087zRWIWzds8GrRglgt+XklRejtCGs2GoKXCbPaHCTmN6r28MCBpgeGqZ2zSJNuHprm/Mar9Nv0J46TNnUBdsjxP/5ZLxQyNAnmKmnGE9jX6IhDuU7FqYSGn7dZM50xoZJ/k6Sp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(346002)(366004)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(55016003)(83380400001)(33656002)(86362001)(38070700009)(122000001)(41300700001)(26005)(38100700002)(9686003)(7696005)(6506007)(2906002)(53546011)(478600001)(76116006)(110136005)(316002)(66946007)(54906003)(71200400001)(66556008)(66476007)(66446008)(64756008)(4326008)(5660300002)(8676002)(52536014)(8936002)(7416002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bk9BVVVxYVhxZUNqYnFwUi8rWkltQlJqaVk5ZmFKVnBOQXVxWCs3V1NDRXJN?=
 =?utf-8?B?NEV1NytVK09QQ0NxKzlWVXl1ZW9QL3JldEtBNENGU3lHNVpZKzFJb29Ed0xh?=
 =?utf-8?B?UUVaNVoyK21HZEhGNGx5cExqMThKdm5ueGtOMEdQdUFlcWgrSlBWajdRUXVN?=
 =?utf-8?B?MThhRTRMbHpSZ1JDMGlXTjVadERVTGVTaUdqd3lGRldjM0ZTR2JidFdmN0hV?=
 =?utf-8?B?Uk1lbm91a2dCaG4rQVRlSlViSks5Tjl2RlI3cmdlSCtGVlNSRU92aTFtUXZF?=
 =?utf-8?B?dzN6V21qeHVueGRtbGFDUGFBMnZnTXE5cTZOc0tXcGxFaVJVWGNrTG1HanNx?=
 =?utf-8?B?VlgvclRSRjhCbzJCR0xWZW5Pa3R6YkpMU081SFNSNGppVlV3ajZrU2tLUGhj?=
 =?utf-8?B?dy9GTnBCZnB5WGxzRkE3azdqdGE3SThMQmlXQWJWVlBuYWVkZ0gxSU12a2hs?=
 =?utf-8?B?Nnd0aXFJZUxwbzBYWlpoREVhSk12RXZLc0xzUml2MXVpMEJrUzZwWVVzczEx?=
 =?utf-8?B?WVoyOFNjUUJicE45NlFBZG1nUGZHUVg4RHVtYjI2NEhZYzhLNG13Y2kxWVpt?=
 =?utf-8?B?andCTnpJcnlyU254TkJoZEN6bTRjL1VjaW8zZ0oyeEJSdXpIMURITDhHSkx4?=
 =?utf-8?B?S3VZUm9HSFFQKy91dTlnOHF2ZGRlY3BwTkx2d1QrZXFJS1V2c0Y3cDZpOFRx?=
 =?utf-8?B?aWlpUnRPaTJ5QnllYkhucy9wRnhxUzlkNE1jZEhrcUJOTllTTzV3bzJuV1Rj?=
 =?utf-8?B?bXpuWnRPa0VReGFnL3hlbUZndjB2a1RoOEJIMHQvZDRsR2h2N3JWVEEvVlhB?=
 =?utf-8?B?WExzVDMzNGZRdmUxUHhmSzNML0JUQnJEOGxyQjlkZEZOREdVM3Q0Z01EODRP?=
 =?utf-8?B?bnUyY1ZSMk90N01qU1RhWXNUS3FzRmlRcHhHdXc0aHdXNFEycnUvWFdHc1lU?=
 =?utf-8?B?MzdHM3dYbnFqWEVLNHZSWVJDd0hueDhjSlMweUsxOGpWLy9uVGNEOThYNUJ2?=
 =?utf-8?B?a2JZTy9Hb0JCMUhIc0p6UHJYLzY3OGdnblVJcTU2bE0xNG9Iek1TS25pZHgv?=
 =?utf-8?B?VjJHVnY4bXY5VHl6UXpsbXBlVjJLSmQ5SjhYY2xqZmNjUXJkL3h3bFRIRDNZ?=
 =?utf-8?B?UFErMzFkZFdnM0hQbkV0ZTVvSEk0UUZmMTdZUHpGZ3ZGb01nS0Y2UFVIV3Ux?=
 =?utf-8?B?a1dtY2RFN1l3MEx3QnQrZmtwZFdMMDNlNDZ2TURWN1Z2M29UYWNIWWxjcnJS?=
 =?utf-8?B?eE4rQXVlUWd2dEFkOTlsbzk2TlBlME4wY3E3K0doVkxrTjVlNSt4L0R6UlZO?=
 =?utf-8?B?SC9Kc1QxUUtEQTNOQXRJTGlDVjJhcEN4eXdTcE1NK2NhemJrRER6cDByM3M2?=
 =?utf-8?B?SGxicWk3Q1VWTUpnb2RWYi92UTZyVGVUcGNZUm4zVGh3ckJHanJmQzF6Kzdo?=
 =?utf-8?B?T0Jvc0VrTUloaTFEVlh5Zk5GdFhTNFVhR28zK2lJYzE0eXAxcUdkOUdWcDhL?=
 =?utf-8?B?eGVnbCtyOGt1aHF2aHJqSnJhaW00WjIzVWh4UlJHMmg2VTVIY1JPWjQzbHps?=
 =?utf-8?B?N2dveVNpNDJOU3phU2pKdXloQWNtTTJDMGw4WkYyU3Y1Z1BPVVBrcnR3bm15?=
 =?utf-8?B?TVVEUS9xZGhBRXMyTGxVbmRBRXdXcEJXajM3VUs3MkN6bGRudXhUcGhQSmFG?=
 =?utf-8?B?ZTZPSWdZNEdNZnRmS1NycW55ZHZ0OGw3bVd4QUJaVkM5eDl3RW56YWM0cGhV?=
 =?utf-8?B?K01OTzI2THM5aFhHWjNWY1IzOWlKSVdOdkt4UWhPR2FwQU1IbHQ2Ym16Z1Yz?=
 =?utf-8?B?anVzelVrcThYV3hkMGh6UXdEdXBzR1d6V29MMEx3TXJnUEJQTCtqRFQwcFo1?=
 =?utf-8?B?VDZHZTZDZUxFWkVVSlhCMnNLSVB5VkdzSGU2REFrcENFQi80RGdVSk15RXNH?=
 =?utf-8?B?d0JQVDdSV0NSdWlBM21pNDN1aHAwQU1wQTVySEh3Tzk0QW5QSlE1SGRodEFG?=
 =?utf-8?B?TXdsdkNWVVorcjFqemlGdWxQWmlkN3pVSjZQaEI2dVNHenNmVUJ1VCtCcnJ6?=
 =?utf-8?B?NzdYMTlxcCt3Y0pqaUFHVjdOdmdDZlB1MUk5T00zTHNIdnE1TGNhK3ZxYUlS?=
 =?utf-8?Q?rEqk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d9debf14-7ff7-463e-5489-08dc2237ad77
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 08:36:10.8435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QFazJUrvHlkMmkdbUXHmNOkPSLoWW8rwygjLlVu0Jzt0rN9H7G5NfPpZookud0NGTOcOh8vi54JIediqHKZUNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6884

SGkgS3J6eXN6dG9mLA0KDQo+IA0KPiBPbiAxOS8wMS8yMDI0IDA4OjE5LCBYdSBZYW5nIHdyb3Rl
Og0KPiA+IFRoZSBpLk1YOTMgbmVlZHMgYSB3YWt1cCBjbG9jayB0byB3b3JrIHByb3Blcmx5LiBU
aGlzIHdpbGwgYWRkIGNvbXBhdGlibGUNCj4gPiBhbmQgcmVzdHJpY3Rpb24gZm9yIGkuTVg5MyBw
bGF0Zm9ybS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAu
Y29tPg0KPiA+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAgLSBubyBjaGFuZ2Vz
DQo+ID4gQ2hhbmdlcyBpbiB2MzoNCj4gPiAgLSBhZGQgY2xvY2tzIHJlc3RyaWN0aW9uDQo+ID4g
Q2hhbmdlcyBpbiB2NDoNCj4gPiAgLSB1c2UgJ2NvbnRhaW5zJyByYXRoZXIgJ2l0ZW1zJw0KPiA+
IC0tLQ0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvY2ktaGRyYy11c2IyLnlhbWwg
fCA0NyArKysrKysrKysrKysrKy0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jaS0NCj4gaGRyYy11c2IyLnlhbWwNCj4gPiBp
bmRleCA3OGUzMGNhMGE4Y2EuLmE4NmNiNWRlMTY4OCAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi55YW1sDQo+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVzYjIueWFt
bA0KPiA+IEBAIC01Nyw2ICs1Nyw3IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgICAtIGVu
dW06DQo+ID4gICAgICAgICAgICAgICAgLSBmc2wsaW14OG1tLXVzYg0KPiA+ICAgICAgICAgICAg
ICAgIC0gZnNsLGlteDhtbi11c2INCj4gPiArICAgICAgICAgICAgICAtIGZzbCxpbXg5My11c2IN
Cj4gPiAgICAgICAgICAgIC0gY29uc3Q6IGZzbCxpbXg3ZC11c2INCj4gPiAgICAgICAgICAgIC0g
Y29uc3Q6IGZzbCxpbXgyNy11c2INCj4gPiAgICAgICAgLSBpdGVtczoNCj4gPiBAQCAtNDU1LDE5
ICs0NTYsMjMgQEAgYWxsT2Y6DQo+ID4gICAgLSBpZjoNCj4gPiAgICAgICAgcHJvcGVydGllczoN
Cj4gPiAgICAgICAgICBjb21wYXRpYmxlOg0KPiA+IC0gICAgICAgICAgY29udGFpbnM6DQo+ID4g
LSAgICAgICAgICAgIG9uZU9mOg0KPiA+IC0gICAgICAgICAgICAgIC0gY29uc3Q6IGNoaXBpZGVh
LHVzYjINCj4gPiAtICAgICAgICAgICAgICAtIGNvbnN0OiBmc2wsaW14MjMtdXNiDQo+ID4gLSAg
ICAgICAgICAgICAgLSBjb25zdDogZnNsLGlteDI4LXVzYg0KPiA+IC0gICAgICAgICAgICAgIC0g
Y29uc3Q6IGZzbCxpbXg3ZC11c2INCj4gPiAtICAgICAgICAgICAgICAtIGNvbnN0OiBmc2wsdmY2
MTAtdXNiDQo+ID4gLSAgICAgICAgICAgICAgLSBjb25zdDogbHNpLHpldmlvLXVzYg0KPiA+IC0g
ICAgICAgICAgICAgIC0gY29uc3Q6IG51dm90b24sbnBjbTc1MC11ZGMNCj4gPiAtICAgICAgICAg
ICAgICAtIHBhdHRlcm46ICdeZnNsLGlteDVbMC0zXSstdXNiJCcNCj4gPiAtICAgICAgICAgICAg
ICAtIHBhdHRlcm46ICdeZnNsLGlteDZbYS16XSstdXNiJCcNCj4gPiAtICAgICAgICAgICAgICAt
IHBhdHRlcm46ICdebnZpZGlhLHRlZ3JhWzAtOV0rLWVoY2kkJw0KPiA+IC0gICAgICAgICAgICAg
IC0gcGF0dGVybjogJ15udmlkaWEsdGVncmFbMC05XSstdWRjJCcNCj4gPiArICAgICAgICAgIG9u
ZU9mOg0KPiA+ICsgICAgICAgICAgICAtIGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAgICAgICAg
b25lT2Y6DQo+IA0KPiBObywgdGhpcyBkb2VzIG5vdCBtYWtlIHNlbnNlLg0KPiANCj4gPiArICAg
ICAgICAgICAgICAgICAgLSBjb25zdDogY2hpcGlkZWEsdXNiMg0KPiA+ICsgICAgICAgICAgICAg
ICAgICAtIGNvbnN0OiBmc2wsaW14MjMtdXNiDQo+IA0KPiBMb29rIGhlcmUgaXMgYSBwbGFjZSBm
b3IgeW91ciBjb21wYXRpYmxlLi4uIHVubGVzcyBpbXg5MyBpcyBub3QgcmVhbGx5DQo+IGNvbXBh
dGlibGUsIGJ1dCB0aGVuIHdoeSBwcmV0ZW5kaW5nIGl0IGlzPw0KDQpJIGNhbid0IHB1dCBmc2ws
aW14OTMtdXNiIGhlcmUgc2luY2UgaW14OTMgbmVlZHMgMiBjbG9ja3MuIFNvIEkgYWRkIGFub3Ro
ZXINCmlmLXRoZW4gbGltaXRhdGlvbiBmb3IgaW14OTMgYmVsb3cgdGhpcyBwYXJ0Lg0KDQo+IA0K
PiA+ICsgICAgICAgICAgICAgICAgICAtIGNvbnN0OiBmc2wsaW14MjgtdXNiDQo+ID4gKyAgICAg
ICAgICAgICAgICAgIC0gY29uc3Q6IGZzbCx2ZjYxMC11c2INCj4gPiArICAgICAgICAgICAgICAg
ICAgLSBjb25zdDogbHNpLHpldmlvLXVzYg0KPiA+ICsgICAgICAgICAgICAgICAgICAtIGNvbnN0
OiBudXZvdG9uLG5wY203NTAtdWRjDQo+ID4gKyAgICAgICAgICAgICAgICAgIC0gcGF0dGVybjog
J15mc2wsaW14NVswLTNdKy11c2IkJw0KPiA+ICsgICAgICAgICAgICAgICAgICAtIHBhdHRlcm46
ICdeZnNsLGlteDZbYS16XSstdXNiJCcNCj4gPiArICAgICAgICAgICAgICAgICAgLSBwYXR0ZXJu
OiAnXmZzbCxpbXg4W2Etel0rLXVzYiQnDQo+ID4gKyAgICAgICAgICAgICAgICAgIC0gcGF0dGVy
bjogJ15udmlkaWEsdGVncmFbMC05XSstZWhjaSQnDQo+ID4gKyAgICAgICAgICAgICAgICAgIC0g
cGF0dGVybjogJ15udmlkaWEsdGVncmFbMC05XSstdWRjJCcNCj4gPiArICAgICAgICAgICAgLSBp
dGVtczoNCj4gPiArICAgICAgICAgICAgICAgIC0gY29uc3Q6IGZzbCxpbXg3ZC11c2INCj4gPiAr
ICAgICAgICAgICAgICAgIC0gY29uc3Q6IGZzbCxpbXgyNy11c2INCj4gPiAgICAgIHRoZW46DQo+
ID4gICAgICAgIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgY2xvY2tzOg0KPiA+IEBAIC00Nzcs
NiArNDgyLDIyIEBAIGFsbE9mOg0KPiA+ICAgICAgICAgICAgbWluSXRlbXM6IDENCj4gPiAgICAg
ICAgICAgIG1heEl0ZW1zOiAxDQo+ID4NCj4gPiArICAtIGlmOg0KPiA+ICsgICAgICBwcm9wZXJ0
aWVzOg0KPiA+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgICBjb250YWluczoN
Cj4gPiArICAgICAgICAgICAgY29uc3Q6IGZzbCxpbXg5My11c2INCj4gPiArICAgIHRoZW46DQo+
ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY2xvY2tzOg0KPiA+ICsgICAgICAg
ICAgbWluSXRlbXM6IDINCj4gPiArICAgICAgICAgIG1heEl0ZW1zOiAyDQo+ID4gKyAgICAgICAg
Y2xvY2stbmFtZXM6DQo+ID4gKyAgICAgICAgICBtaW5JdGVtczogMg0KPiA+ICsgICAgICAgICAg
bWF4SXRlbXM6IDINCj4gPiArICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAgICBj
b25zdDogdXNiX3dha2V1cF9jbGsNCj4gDQo+IERyb3AgIl9jbGsiIHN1ZmZpeC4NCg0KT2theS4N
Cg0KVGhhbmtzLA0KWHUgWWFuZw0K

