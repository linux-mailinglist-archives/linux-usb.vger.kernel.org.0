Return-Path: <linux-usb+bounces-7952-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC5A87BD02
	for <lists+linux-usb@lfdr.de>; Thu, 14 Mar 2024 13:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBB5E1C20E5C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Mar 2024 12:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2502258AB8;
	Thu, 14 Mar 2024 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Sb8b4k4H"
X-Original-To: linux-usb@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2086.outbound.protection.outlook.com [40.107.114.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139EC18E20;
	Thu, 14 Mar 2024 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710420561; cv=fail; b=W8zRYfuL7tWT/qq+kw4IjBWQOzPIs4iVn8MoxfKNw35esRLr1K1izGalNvDNoloMDepqebZbtcw8D9lrnD7MAtSLfM+DQsxP3RxqNEU+gnGmFi/FeVx7pWj0tSKSKZMQRceJuu6pIbQRvgXdTpwkMXOXDwsqA/JjcxSaDOVLkkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710420561; c=relaxed/simple;
	bh=/xY/oWz6DXLweiASjzCdSRP2o1EsTXeECXxCpsAeOY8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hx3zYBXCFoZnL/0FhPDv3WKNYOC/01gPd/6o0ywp5vnlwRgUv2ItiEtZcbPsH8Mp7RnQxYgB20F2CkVMDpxgVZtbjEzPhEIlVxyHe60gxg9O45RvsgTzuhQ29xXxlqFOQdWA08A0rbAMYEv35l2IztW0uxDsKB6NWJtoDTp4KLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Sb8b4k4H; arc=fail smtp.client-ip=40.107.114.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bwt73bjCotqP1KMspnyBR2cnC78xfegyseIb8ujMiHBOWMudByjzbe+i/lxGLnzeaNciSkFesrrXLGEpg/p5rjJzpsMksEdUk++2aBlx2fUYiI9OtotAWAq9JA6C/gZiCVt5dSLomSAPIyUt6GQa5Ox8r9SPNKTnO7LxR1IGmnkeGQdn4YGYExSh333HPg15YQCeEjW+aW13e8crwQ5t5C79OjQR496cONicoGJAF/zaVetu2LGwnwzb9vHWv/TAqYTIFuETC55hDd7Ob9qGAG4O9bRRZiN9KyE33rX+ua6PZ7wcVxw2b0EnGf5LNV/e2UkFLMH2FGTCr2VOLkRsQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xY/oWz6DXLweiASjzCdSRP2o1EsTXeECXxCpsAeOY8=;
 b=LTTbQTy2PtRjOeYzutHFGnVKPijKDyHkJwbpsX8eqLl1bjIUFLetdbmvVs61VkDTCH8S2cmnhR5SVl4qypiwBzZsWsY5xwzZ/CpADKKB2l5NWb3dfhgvp3ejjeFWdKKkUxdkGrYHih1P0Aml+F0/n2gphjbPKql2vfdE9hbwqUHOzfz7XnAVs/Otk2dinBLM7gIgsPdWstR0B1wEpFPYTqw5YPi34Rsj0+m4PC0lsSzse+6fUcbhrwLX3NNPsUkN5uf/fNmZ1X9R7x+yiBH5F5JqYGg2H9bXz4Dy7w5v3EBBgpxslyVyv8N8a9E9RzPdopiwyspQlmxm5LloIYMgfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xY/oWz6DXLweiASjzCdSRP2o1EsTXeECXxCpsAeOY8=;
 b=Sb8b4k4HXfB3A76sEsPh5ZPq/cZVRrTqzxOy6dOO9/9xgh/FO5B7Hiq2pdrpf5leAKC348ncraP4GwbZqtJHz3mcWbtlipjeXJx7YTJ3RQg/xop+xxwsMtHN//HHaJp2yQYeBSc+89Np4PnqvfkegCIT5HagO/BRv5j7vtGqeB8=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by TYCPR01MB9748.jpnprd01.prod.outlook.com (2603:1096:400:20a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 12:49:15 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f%5]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 12:49:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huy Nguyen
	<huy.nguyen.wh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 3/5] usb: renesas_usbhs: Update usbhs pipe
 configuration for RZ/G2L family
Thread-Topic: [PATCH v2 3/5] usb: renesas_usbhs: Update usbhs pipe
 configuration for RZ/G2L family
Thread-Index: AQHadXKOqNxFa59/ukau2Ie02qSE2LE29SUAgAACbyA=
Date: Thu, 14 Mar 2024 12:49:14 +0000
Message-ID:
 <OSAPR01MB15874373FDCB149EA67D4BD086292@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240313181602.156840-1-biju.das.jz@bp.renesas.com>
 <20240313181602.156840-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUMEA2d9+H7GwDDLTfeXp2fAyBTt8jpihOzjCEMUuSK-A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUMEA2d9+H7GwDDLTfeXp2fAyBTt8jpihOzjCEMUuSK-A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|TYCPR01MB9748:EE_
x-ms-office365-filtering-correlation-id: c6e11409-fb98-4bdf-e48b-08dc44252781
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 u4zDo4Ko/mwn58xZxZygQBx6CrIH/llrfszUUPuHQThEpUVgOW49FeT8qUZZiKPksVHKO5N+Cpm06+1ZHIUpn72qYTA27b+1y2jsftd6kxzifKMvbhYpnVuFaO1NTh4fPdhCOwTQTVUxUw4TNTISpYtJoBvSwWZX+FeCpQd9beqlTYAtBcpyEAym4kmuJzTYrhDHOnVDJRnMf1I5oKEZfBTAUHr49Ub+ssMOAVIWIvEo5pGP5g9ixyYWOS/FK957jf7qTTLi64zOrkSZrLicmZ8HMXqVyGVRF7FB9WS/2wVYW24lbYEuKgZc1OYw7yVuOt/81LzpQojFpSxqcy/zpE1Avmwl/xWiEiJZrTs+3Zf+zM5xl37p7X83nZG0dDW0dMBdPAX0sKpqj/gbDlfvOlmf44RMYualbJ/5UZRc8OF7JkonLVfxB2BtVH2HvFuYhfPXKJ8DFsHqxXNXWKTlyik2tvzhauUG+zowEAEIZ/ym1YeE6JIF8WIuASH91stQUcg9bgkA/PZQP0CK6sraw6mdyf1POppY21PSIh9puNIUtHHkR1HVVqhldDQoDnanzxIHbbKaSf6lbtBy2wgN/1wKYXW1MC6sedq9jFVTjm0NsbdMQLf43e7Jr2Ld0NNcKBsQeZRKUp9CxjypHGTp2eZehBcjmxIKQTEH8WBnq6zVaFU3tbhMAgOlLQzo2BCUgPZm09XRhN7m68GEn9ZEafm0vP2XjcBUT9ZdGL580fw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RHdxaTZOektUeEd0TThGUzRrZXVUaUJMQVJpUTFqWE5CM1ZFeFRVQVdaTVY5?=
 =?utf-8?B?WW9ndjBFdlR5UjJKWHh6OW5RMVMrS1R1YWFvSjB5ZmYzd3pNQ0lxTTVGWkxV?=
 =?utf-8?B?QXUvdFMrUVlSY2NjeEpKbnoyYVQ0SnJXQzA1MGphRXVMcTRMYTg3TUQ3b2pQ?=
 =?utf-8?B?K2srOHdZbVErVmFPOFRBTm1UTHliMGhyRnV0UnMwdHVyVU9sT21ZT2NxTGhQ?=
 =?utf-8?B?OE41Y1V0eVNoNVVVOVh1QjNtd0xUWEl1WE92UWxaK3AvbUsxc2s1MEZ1VVAr?=
 =?utf-8?B?M3RTWDRCazJvbjBXOElOL2pQRU54ZlN4dTgzSmxIZ2gvWGJNSzI2MWEwalFw?=
 =?utf-8?B?dUV0ZWJTVGlZR3pLaURrZG5CaHpDZ0F6aHdKb2lnNUN3UGgvcjhDZ0ZIcWdv?=
 =?utf-8?B?U2NkTjkycFNJdVBOQkZSWVlnUWFFMHJxQlhDV1dONWlPREZVWTVWQ083SkZM?=
 =?utf-8?B?UU9uWnBuU0x0N2pEckQ4bGhzYXNYUEUvM2haalVjWkdtQ0JuUUtMSlVLQ2da?=
 =?utf-8?B?djRCWjVubUlLWVpwdmlBNGMzUEpTc3dPQ2MwV0xiazhNTWFVUmJtaU04TVJL?=
 =?utf-8?B?NytBYkJmc2hORk5kNlhuWTRaNk04K2RyR3FkVTJoQXpuZkEyNlh6MEtzNWUz?=
 =?utf-8?B?QXZzeFZFdFZDU1g4MzFJOUx6TnUyaHg2OXlLbVh2dVNCWmtUZHZKdmU1bUto?=
 =?utf-8?B?OElaSjJ2OERlNzJaTis2NWQ0a0hoTXp6L2dNSkZ6NU5MOHNxcnpCYjk4V0ly?=
 =?utf-8?B?OGFqREVjWCtMZVJJZkYxaEZOajh4dVJuY0JTQVo1TVU0TjJpR2tzdEhaeWQw?=
 =?utf-8?B?V0JBUzI0WmV3ZjNnNWJ4UDgzTXh0Q3U4c2FoR2dPUjYrMGhvUmJ5UkVJcEVW?=
 =?utf-8?B?TFZZMytmMkRHZHhiUG9FVHJTT3I4VHl5MUpGTnFtTEYzeWk4SEJEL2prQVFr?=
 =?utf-8?B?VXlxR09oVGtpM3NWOXMzYkZ1bkFVSTRQRWlFZk1IRU0zYjdNQ2VVNm5ORHow?=
 =?utf-8?B?UFpTa2VDRVFzek5NTGRvcE54OVRtY2prZWlTSHFWR3RxZkJ6UDgyYjN6UEl2?=
 =?utf-8?B?SmkzYVBlRXgxUkxXanJ6N3RKcnVLdkk5VEw4QXJ2QXBVRTEwaEJhTmkrZnFZ?=
 =?utf-8?B?ZVVrMU1vV3R4U1hKNktZVGFSUmdjYm9jc25oYWYwQ2JrN24wVTAzRUJNV1dJ?=
 =?utf-8?B?ZWo3WTJLaDFZN3BuZU4xdGk2Wlk4MlJHNVRpTW8rWnVTSnptRnZ4aEF2Qm83?=
 =?utf-8?B?YUpPTHREMnNKNEZHbGlySDU2cFBpRXAyd3RaT3NuZHcxNVQ0QkdFbERoS09Q?=
 =?utf-8?B?Y1pFV3Jod040TWtGYThyNVFCdkFoeWJZNVR4YWNyQ3NVZitTYXJoaVhkaitU?=
 =?utf-8?B?WkdtUDVNS2hZSjlRdTE4UnpVV3B0U0dNWW50aHRETlFXM1pNYWd0bGQ3Y0U5?=
 =?utf-8?B?YS9xUWMxVTBTaEdSSi9JZkdkUlN2UjNLUmJZRjZYeUdlWEU5dVVPVTdzYk42?=
 =?utf-8?B?dldCMkYxRlRpazlEOFdjcXVoak5uMG9xUzlVYlhFWlhrTjIxRGozTk40bXJ5?=
 =?utf-8?B?NXRHQUM1T3JkNkxJeHA0MURWOFEwSm5GVy9VNFp3dkJPMEVFbDlwTzQyekFq?=
 =?utf-8?B?MDRHcEZsd2k0M3Z4d1Y4VFV3WVlxWTBPVGVycENKNVBiQXZrVWdrWWpTSTRL?=
 =?utf-8?B?S3BxOHpMZFJOK1lKTGhlOFZNNkN3TUx4eUtFd3QvWGhGVENXeUFDWGx6TmZp?=
 =?utf-8?B?RVYwN3BOb1YvSUt2QTcxcUM1QWRiUkp6cFRjQUMvWFhaL2dXTjVqNU8zNHFv?=
 =?utf-8?B?Q0hTTkg3YXROSUNRMm5Wd0R6ZXdsL0EwMUFnOEtaRVRrVStqdWxkUWVudlZP?=
 =?utf-8?B?U0dEbHFpRGxFOU45M0dvZ3AyckRBbExQbTByVXJ2cklDd1c3RmNPeDVpNUhM?=
 =?utf-8?B?NE0vVUUwREVtbEZUYU1lSW16WUJOanFpQ05XQ1pDSlM2VlYyYk9COFJFYTRM?=
 =?utf-8?B?blNYUTA0K1JTVyswcnVFM1hBak9oKzhLWVVlNG1nSlhyajhyZDlLNnNkelZo?=
 =?utf-8?B?eUp2SnhUaDltcnJJUHVqd0FmVzhGM3E3b0x4RDIyQkVjSWtyK0M3azZiZERT?=
 =?utf-8?B?K0NLL2ZmeWtZSjRLRDR3cytNMHFUQjVReGxocmZiMEtoVWpBam1CQlNnc2Zu?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e11409-fb98-4bdf-e48b-08dc44252781
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 12:49:14.6915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZPmkmFoSWEOXNHydRoKlt/ufEt/dyPE+Axg2TPS1z74dWOBfDDO+z4DqQpugXaLTA4aZK79N9AmXCHcIbChhhBibuPfL7/ghK5DMraeuyHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9748

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAxNCwgMjAyNCA5OjE1IEFNDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgMy81XSB1c2I6IHJlbmVzYXNfdXNiaHM6IFVwZGF0ZSB1c2JocyBw
aXBlIGNvbmZpZ3VyYXRpb24gZm9yIFJaL0cyTCBmYW1pbHkNCj4gDQo+IEhpIEJpanUsDQo+IA0K
PiBPbiBXZWQsIE1hciAxMywgMjAyNCBhdCA3OjE24oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBIdXkgTmd1eWVuIDxodXkubmd1eWVu
LndoQHJlbmVzYXMuY29tPg0KPiA+DQo+ID4gVGhlIFJaL0cyTCBmYW1pbHkgU29DcyBoYXMgMTAg
UElQRSBidWZmZXJzIGNvbXBhcmVkIHRvIDE2IHBpcGUgYnVmZmVycw0KPiA+IG9uIFJaL0EyTS4g
VXBkYXRlIHRoZSBwaXBlIGNvbmZpZ3VyYXRpb24gZm9yIFJaL0cyTCBmYW1pbHkgU29DcyBhbmQN
Cj4gPiB1c2UgZmFtaWx5IFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlIHRvIGhhbmRsZSB0aGlzIGRp
ZmZlcmVuY2UuDQo+ID4NCj4gPiBBZGRlZCBTb0Mgc3BlY2lmaWMgY29tcGF0aWJsZSB0byBPRiB0
YWJsZSB0b2F2b2lkIEFCSSBicmVha2FnZSB3aXRoDQo+ID4gb2xkIERUQi4gVG8gb3B0aW1pemUg
bWVtb3J5IHVzYWdlIHRoZSBTb0Mgc3BlY2lmaWMgY29tcGF0aWJsZSB3aWxsIGJlDQo+ID4gcmVt
b3ZlZCBsYXRlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEh1eSBOZ3V5ZW4gPGh1eS5uZ3V5
ZW4ud2hAcmVuZXNhcy5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYxLT52MjoNCj4gPiAgKiBEcm9wcGVk
IHVzaW5nIG9mX2RldmljZV9pc19jb21wYXRpYmxlKCkgaW4gcHJvYmUuDQo+ID4gICogQWRkZWQg
dXNiaHNfcnpnMmxfcGxhdF9pbmZvIGFuZCByZXBsYWNlZCB0aGUgZGV2aWNlIGRhdGEgZm9yIFJa
L0cyTA0KPiA+ICAgIGZyb20gdXNiaHNfcnphMl9wbGF0X2luZm8tPnVzYmhzX3J6ZzJsX3BsYXRf
aW5mby4NCj4gPiAgKiBNb3ZlZCB1c2Joc2NfcnpnMmxfcGlwZSB0YWJsZSBuZWFyIHRvIHRoZSB1
c2VyLg0KPiA+ICAqIFVwZGF0ZWQgY29tbWl0IGRlc2NyaXB0aW9uLg0KPiANCj4gVGhhbmtzIGZv
ciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhzL2Nv
bW1vbi5jDQo+ID4gKysrIGIvZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9jb21tb24uYw0KPiA+
IEBAIC02NDAsOCArNjU2LDEzIEBAIHN0YXRpYyBpbnQgdXNiaHNfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZQ0KPiA+ICpwZGV2KQ0KPiA+DQo+ID4gICAgICAgICAvKiBzZXQgZGVmYXVsdCBw
YXJhbSBpZiBwbGF0Zm9ybSBkb2Vzbid0IGhhdmUgKi8NCj4gPiAgICAgICAgIGlmICh1c2Joc19n
ZXRfZHBhcmFtKHByaXYsIGhhc19uZXdfcGlwZV9jb25maWdzKSkgew0KPiA+IC0gICAgICAgICAg
ICAgICBwcml2LT5kcGFyYW0ucGlwZV9jb25maWdzID0gdXNiaHNjX25ld19waXBlOw0KPiA+IC0g
ICAgICAgICAgICAgICBwcml2LT5kcGFyYW0ucGlwZV9zaXplID0gQVJSQVlfU0laRSh1c2Joc2Nf
bmV3X3BpcGUpOw0KPiA+ICsgICAgICAgICAgICAgICBpZiAoaW5mby0+ZHJpdmVyX3BhcmFtLnBp
cGVfY29uZmlncykgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHByaXYtPmRwYXJhbS5w
aXBlX2NvbmZpZ3MgPSBpbmZvLT5kcml2ZXJfcGFyYW0ucGlwZV9jb25maWdzOw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHByaXYtPmRwYXJhbS5waXBlX3NpemUgPSBpbmZvLT5kcml2ZXJf
cGFyYW0ucGlwZV9zaXplOw0KPiA+ICsgICAgICAgICAgICAgICB9IGVsc2Ugew0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHByaXYtPmRwYXJhbS5waXBlX2NvbmZpZ3MgPSB1c2Joc2NfbmV3
X3BpcGU7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJpdi0+ZHBhcmFtLnBpcGVfc2l6
ZSA9IEFSUkFZX1NJWkUodXNiaHNjX25ld19waXBlKTsNCj4gPiArICAgICAgICAgICAgICAgfQ0K
PiANCj4gSSB0aGluayBpdCB3b3VsZCBiZSBjbGVhbmVyIHRvIHBvcHVsYXRlDQo+IHJlbmVzYXNf
dXNiaHNfcGxhdGZvcm1faW5mby5kcml2ZXJfcGFyYW0ucGlwZV97Y29uZmlncyxzaXplfSBldmVy
eXdoZXJlLCBhbmQgdXNlIGluZm8tDQo+ID5kcml2ZXJfcGFyYW0ucGlwZV97Y29uZmlncyxzaXpl
fSB1bmNvbmRpdGlvbmFsbHkuDQoNCllvdSBtZWFuLCBkcm9wIHN0YXRpYyBhbmQgc2hhcmUgdGhl
IHVzYmhzY19yY2FyX25ld19waXBlW10gdG8ge3JjYXIzLHJjYXIyLHJ6YSxyemEyfQ0KTGlrZSBb
MV0/Pw0KDQoNClsxXQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvY29t
bW9uLmggYi9kcml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhzL2NvbW1vbi5oDQppbmRleCAzZmI1YmM5
NGRjMGQuLjlkZGU1MzdjNGUyZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNi
aHMvY29tbW9uLmgNCisrKyBiL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvY29tbW9uLmgNCg0K
K2V4dGVybiBzdHJ1Y3QgcmVuZXNhc191c2Joc19kcml2ZXJfcGlwZV9jb25maWcgdXNiaHNjX3Jj
YXJfbmV3X3BpcGVbXTsNCisNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhz
L3JjYXIyLmMgYi9kcml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhzL3JjYXIyLmMNCmluZGV4IDUyNzU2
ZmMyYWM5Yy4uMzExN2Y3NmFiNTU2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvcmVuZXNhc191
c2Jocy9yY2FyMi5jDQorKysgYi9kcml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhzL3JjYXIyLmMNCkBA
IC02OSw3ICs2OSw4IEBAIGNvbnN0IHN0cnVjdCByZW5lc2FzX3VzYmhzX3BsYXRmb3JtX2luZm8g
dXNiaHNfcmNhcl9nZW4yX3BsYXRfaW5mbyA9IHsNCiAgICAgICAgICAgICAgICAuZ2V0X2lkID0g
dXNiaHNfZ2V0X2lkX2FzX2dhZGdldCwNCiAgICAgICAgfSwNCiAgICAgICAgLmRyaXZlcl9wYXJh
bSA9IHsNCisgICAgICAgICAgICAgICAucGlwZV9jb25maWdzID0gdXNiaHNjX3JjYXJfbmV3X3Bp
cGUsDQorICAgICAgICAgICAgICAgLnBpcGVfc2l6ZSA9IDE2LA0KDQo+IA0KPiA+ICAgICAgICAg
fSBlbHNlIGlmICghcHJpdi0+ZHBhcmFtLnBpcGVfY29uZmlncykgew0KPiA+ICAgICAgICAgICAg
ICAgICBwcml2LT5kcGFyYW0ucGlwZV9jb25maWdzID0gdXNiaHNjX2RlZmF1bHRfcGlwZTsNCj4g
PiAgICAgICAgICAgICAgICAgcHJpdi0+ZHBhcmFtLnBpcGVfc2l6ZSA9DQo+ID4gQVJSQVlfU0la
RSh1c2Joc2NfZGVmYXVsdF9waXBlKTsgZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy91c2IvcmVu
ZXNhc191c2Jocy9yemEuaCBiL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvcnphLmgNCj4gPiBp
bmRleCBhMjliNzVmZWYwNTcuLjhiODc5YWEzNGEyMCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L3VzYi9yZW5lc2FzX3VzYmhzL3J6YS5oDQo+ID4gKysrIGIvZHJpdmVycy91c2IvcmVuZXNhc191
c2Jocy9yemEuaA0KPiA+IEBAIC0zLDMgKzMsNCBAQA0KPiA+DQo+ID4gIGV4dGVybiBjb25zdCBz
dHJ1Y3QgcmVuZXNhc191c2Joc19wbGF0Zm9ybV9pbmZvIHVzYmhzX3J6YTFfcGxhdF9pbmZvOw0K
PiA+IGV4dGVybiBjb25zdCBzdHJ1Y3QgcmVuZXNhc191c2Joc19wbGF0Zm9ybV9pbmZvIHVzYmhz
X3J6YTJfcGxhdF9pbmZvOw0KPiA+ICtleHRlcm4gY29uc3Qgc3RydWN0IHJlbmVzYXNfdXNiaHNf
cGxhdGZvcm1faW5mbw0KPiA+ICt1c2Joc19yemcybF9wbGF0X2luZm87DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvcnphMi5jDQo+ID4gYi9kcml2ZXJzL3VzYi9y
ZW5lc2FzX3VzYmhzL3J6YTIuYw0KPiA+IGluZGV4IGYwNzk4MTcyNTBiYi4uMDMzNmI0MTliMzdj
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvcnphMi5jDQo+ID4g
KysrIGIvZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9yemEyLmMNCj4gPiBAQCAtNTgsNiArNTgs
MzYgQEAgc3RhdGljIGludCB1c2Joc19yemEyX3Bvd2VyX2N0cmwoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldiwNCj4gPiAgICAgICAgIHJldHVybiByZXR2YWw7DQo+ID4gIH0NCj4gPg0KWzFd
DQo+ID4gKy8qIGNvbW1vbmx5IHVzZWQgb24gUlovRzJMIGZhbWlseSAqLw0KPiA+ICtzdGF0aWMg
c3RydWN0IHJlbmVzYXNfdXNiaHNfZHJpdmVyX3BpcGVfY29uZmlnIHVzYmhzY19yemcybF9waXBl
W10gPSB7DQo+ID4gKyAgICAgICBSRU5FU0FTX1VTQkhTX1BJUEUoVVNCX0VORFBPSU5UX1hGRVJf
Q09OVFJPTCwgNjQsIDB4MDAsIGZhbHNlKSwNCj4gPiArICAgICAgIFJFTkVTQVNfVVNCSFNfUElQ
RShVU0JfRU5EUE9JTlRfWEZFUl9JU09DLCAxMDI0LCAweDA4LCB0cnVlKSwNCj4gPiArICAgICAg
IFJFTkVTQVNfVVNCSFNfUElQRShVU0JfRU5EUE9JTlRfWEZFUl9JU09DLCAxMDI0LCAweDI4LCB0
cnVlKSwNCj4gPiArICAgICAgIFJFTkVTQVNfVVNCSFNfUElQRShVU0JfRU5EUE9JTlRfWEZFUl9C
VUxLLCA1MTIsIDB4NDgsIHRydWUpLA0KPiA+ICsgICAgICAgUkVORVNBU19VU0JIU19QSVBFKFVT
Ql9FTkRQT0lOVF9YRkVSX0JVTEssIDUxMiwgMHg1OCwgdHJ1ZSksDQo+ID4gKyAgICAgICBSRU5F
U0FTX1VTQkhTX1BJUEUoVVNCX0VORFBPSU5UX1hGRVJfQlVMSywgNTEyLCAweDY4LCB0cnVlKSwN
Cj4gPiArICAgICAgIFJFTkVTQVNfVVNCSFNfUElQRShVU0JfRU5EUE9JTlRfWEZFUl9JTlQsIDY0
LCAweDA0LCBmYWxzZSksDQo+ID4gKyAgICAgICBSRU5FU0FTX1VTQkhTX1BJUEUoVVNCX0VORFBP
SU5UX1hGRVJfSU5ULCA2NCwgMHgwNSwgZmFsc2UpLA0KPiA+ICsgICAgICAgUkVORVNBU19VU0JI
U19QSVBFKFVTQl9FTkRQT0lOVF9YRkVSX0lOVCwgNjQsIDB4MDYsIGZhbHNlKSwNCj4gPiArICAg
ICAgIFJFTkVTQVNfVVNCSFNfUElQRShVU0JfRU5EUE9JTlRfWEZFUl9JTlQsIDY0LCAweDA3LCBm
YWxzZSksIH07DQo+IA0KDQo+IFRoaXMgaXMgc2ltaWxhciAoYnV0IHNsaWdodGx5IGRpZmZlcmVu
dCkgZnJvbSB1c2Joc2NfZGVmYXVsdF9waXBlW10uDQo+IENhbiBSWi9HMkwgd29yayB3aXRoIHVz
YmhzY19kZWZhdWx0X3BpcGVbXSBpbnN0ZWFkPyAgSWYgeWVzLCB5b3UgY291bGQganVzdCBzZXQg
IC5oYXNfbmV3X3BpcGVfY29uZmlncw0KPiB0byB6ZXJvIGluc3RlYWQgb2YgYWRkaW5nIG5ldyBj
b2RlL2RhdGEuDQoNCkFsbCBvdXIgY3VzdG9tZXJzIGFyZSB1c2luZyBbMV0gY29tcGFyZWQgdG8g
ZGVmYXVsdF9waXBlWzJdLCBmcm9tIEhXIG1hbnVhbCwgSSBmZWVsIFsxXSBpcyBiZXR0ZXINCmFz
IGl0IGludm9sdmVzIGZld2VyIGludGVycnVwdHMuIENhbiB3ZSByZXBsYWNlIFsyXSB3aXRoIFsx
XT8NCg0KVGhlIGRpZmZlcmVuY2UgaXMgc2V0dGluZyBkb3VibGUgYnVmZmVyIG9uIElzb2Nocm9u
b3VzIFRyYW5zZmVycy4NCg0KU2V0dGluZyB0aGUgYnVmZmVyIG9wZXJhdGluZyBtb2RlIGVuYWJs
ZXMgaGlnaC1zcGVlZCBkYXRhIHRyYW5zZmVycyB3aXRoIGZld2VyIGludGVycnVwdHMgDQp0byBi
ZSBwZXJmb3JtZWQgYnkgdXNpbmcgZG91YmxlLWJ1ZmZlcmluZyBhbmQgY29udGludW91cyB0cmFu
c2ZlciBvZiBkYXRhIHBhY2tldHMuDQoNClNpbmNlIFsxXSBpcyBiZXR0ZXIgY29tcGFyZWQgdG8g
WzJdLCBpZiBTSCBjYW4gd29yayB3aXRoIFsxXSwgd2UgY2FuDQpyZXBsYWNlIFsyXSB3aXRoIFsx
XSwgZG8gd2UgaGF2ZSBhbnkgU0ggcGxhdGZvcm0gdG8gdGVzdCB0aGlzPw0KDQpDaGVlcnMsDQpC
aWp1DQoNClsyXQ0KCVJFTkVTQVNfVVNCSFNfUElQRShVU0JfRU5EUE9JTlRfWEZFUl9DT05UUk9M
LCA2NCwgMHgwMCwgZmFsc2UpLA0KCVJFTkVTQVNfVVNCSFNfUElQRShVU0JfRU5EUE9JTlRfWEZF
Ul9JU09DLCAxMDI0LCAweDA4LCBmYWxzZSksDQoJUkVORVNBU19VU0JIU19QSVBFKFVTQl9FTkRQ
T0lOVF9YRkVSX0lTT0MsIDEwMjQsIDB4MTgsIGZhbHNlKSwNCglSRU5FU0FTX1VTQkhTX1BJUEUo
VVNCX0VORFBPSU5UX1hGRVJfQlVMSywgNTEyLCAweDI4LCB0cnVlKSwNCglSRU5FU0FTX1VTQkhT
X1BJUEUoVVNCX0VORFBPSU5UX1hGRVJfQlVMSywgNTEyLCAweDM4LCB0cnVlKSwNCglSRU5FU0FT
X1VTQkhTX1BJUEUoVVNCX0VORFBPSU5UX1hGRVJfQlVMSywgNTEyLCAweDQ4LCB0cnVlKSwNCglS
RU5FU0FTX1VTQkhTX1BJUEUoVVNCX0VORFBPSU5UX1hGRVJfSU5ULCA2NCwgMHgwNCwgZmFsc2Up
LA0KCVJFTkVTQVNfVVNCSFNfUElQRShVU0JfRU5EUE9JTlRfWEZFUl9JTlQsIDY0LCAweDA1LCBm
YWxzZSksDQoJUkVORVNBU19VU0JIU19QSVBFKFVTQl9FTkRQT0lOVF9YRkVSX0lOVCwgNjQsIDB4
MDYsIGZhbHNlKSwNCglSRU5FU0FTX1VTQkhTX1BJUEUoVVNCX0VORFBPSU5UX1hGRVJfSU5ULCA2
NCwgMHgwNywgZmFsc2UpLA0KDQo+IA0KPiA+ICsNCj4gPiArY29uc3Qgc3RydWN0IHJlbmVzYXNf
dXNiaHNfcGxhdGZvcm1faW5mbyB1c2Joc19yemcybF9wbGF0X2luZm8gPSB7DQo+ID4gKyAgICAg
ICAucGxhdGZvcm1fY2FsbGJhY2sgPSB7DQo+ID4gKyAgICAgICAgICAgICAgIC5oYXJkd2FyZV9p
bml0ID0gdXNiaHNfcnphMl9oYXJkd2FyZV9pbml0LA0KPiA+ICsgICAgICAgICAgICAgICAuaGFy
ZHdhcmVfZXhpdCA9IHVzYmhzX3J6YTJfaGFyZHdhcmVfZXhpdCwNCj4gPiArICAgICAgICAgICAg
ICAgLnBvd2VyX2N0cmwgPSB1c2Joc19yemEyX3Bvd2VyX2N0cmwsDQo+ID4gKyAgICAgICAgICAg
ICAgIC5nZXRfaWQgPSB1c2Joc19nZXRfaWRfYXNfZ2FkZ2V0LA0KPiA+ICsgICAgICAgfSwNCj4g
PiArICAgICAgIC5kcml2ZXJfcGFyYW0gPSB7DQo+ID4gKyAgICAgICAgICAgICAgIC5waXBlX2Nv
bmZpZ3MgPSB1c2Joc2NfcnpnMmxfcGlwZSwNCj4gPiArICAgICAgICAgICAgICAgLnBpcGVfc2l6
ZSA9IEFSUkFZX1NJWkUodXNiaHNjX3J6ZzJsX3BpcGUpLA0KPiA+ICsgICAgICAgICAgICAgICAu
aGFzX2NuZW4gPSAxLA0KPiA+ICsgICAgICAgICAgICAgICAuY2ZpZm9fYnl0ZV9hZGRyID0gMSwN
Cj4gPiArICAgICAgICAgICAgICAgLmhhc19uZXdfcGlwZV9jb25maWdzID0gMSwNCj4gPiArICAg
ICAgIH0sDQo+ID4gK307DQo+ID4gKw0KPiA+ICBjb25zdCBzdHJ1Y3QgcmVuZXNhc191c2Joc19w
bGF0Zm9ybV9pbmZvIHVzYmhzX3J6YTJfcGxhdF9pbmZvID0gew0KPiA+ICAgICAgICAgLnBsYXRm
b3JtX2NhbGxiYWNrID0gew0KPiA+ICAgICAgICAgICAgICAgICAuaGFyZHdhcmVfaW5pdCA9IHVz
YmhzX3J6YTJfaGFyZHdhcmVfaW5pdCwNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhv
ZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgt
bTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwg
cGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0bw0K
PiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
DQo=

