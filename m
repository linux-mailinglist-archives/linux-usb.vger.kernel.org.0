Return-Path: <linux-usb+bounces-11798-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C4A91CA60
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2024 03:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 780791F247A1
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2024 01:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C76B849C;
	Sat, 29 Jun 2024 01:54:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2131.outbound.protection.outlook.com [40.107.236.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D342033E
	for <linux-usb@vger.kernel.org>; Sat, 29 Jun 2024 01:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719626091; cv=fail; b=eb05txjy8a+SwK3lhPtCoOKTYPZ44SetZJIQPjrKeZOD3P2tARQ968YywTlz+dWUbXmD3cZq/6KrVob1Rwvzu6M8uIgEeDitUGQAqLghjCDprUmw+df1nVGdeFsi3RMFp9sFluNwU846TcBT0GaYSqu23n86mm9p7cBOmJOzNNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719626091; c=relaxed/simple;
	bh=TwK+4gzQiGXG3pHUdBZKroa4uvB+ZeuPEOdm5RdRfHo=;
	h=Content-Type:From:To:CC:Subject:Date:Message-ID:MIME-Version; b=AVNdm1nWtX6btcLC9moxeAKObwpd/J1VWqnRtIWODJwlgN4aN89GysctvGIlGki5SUJOfudYQwiEotntD7hkfi9Y6Pph/lFu5/HsA0qOK/C1xJRxDSPpnjvVqgPayjfQJ++eunNm5An/0/mOx7sqCVVfDF47/wrYGMPaf9WwVQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netprisma.us; spf=pass smtp.mailfrom=netprisma.us; arc=fail smtp.client-ip=40.107.236.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netprisma.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netprisma.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVrDFaX79pvlFIweFzTFUnE2qcFqvwkgBn9C2nFzGySB7UJsJ/0aTF1LLXWMUi1eRVv5mJn+NPnJ6ks/shGotTP4PEf2TxYt7B1akGnNeX3IaQZYs1xHOzvxrsKSFSPWSaw79qPaw38uF7zIbbjW2MPpW3haLTKibJ8IvwEadWFgLLKb4okHWllzfSFlq+OIKJPztDvV78d20DS4UannyVGBC6od/p+R7q7grqotcakVtcbXcY+f5jaPwDcBkT7YV0dHwgud2qV2ExWKdiWUSRbr/fDnRljBc8thRHnD8/RvK760ZnqoQ21G40npblyuUfS1nistNOFtF0PxNb33ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPgYzl39EXpgkHTx08/Wv1xyo6XMMNL3Kh79k+D2BZs=;
 b=ShmjO7iJoP1PpkMLvroQKgT8J0JxYkgY8Qk/IujtA2MxJnagPOs9NkitR0Ch1l5l0GPoCWgmukjqLkri8tKHLHW+BzZ8V14VHt+J5Bo+kZslNlwspS7C9/gXGo7mT0z6uADD51Pm2DgTWtZKo28VJPGnswPY4X6S3aRigYdwXq4B+46JUu2gSmw+PfVwbH8mZ/QQwMpGKGo02S2jWT0uIk7dKwxqERMOK8LoiOmFvVtpJwCTa1aaQDEmx0X+0AQse2wNY+FmN8dVOUFUWRsRpotqnLVH8SvoxYyfIjrfFFKtomnpy+Fmdhld8vHGb9FH1ZdbL/ykdF68lHzdT3lHtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netprisma.us; dmarc=pass action=none header.from=netprisma.us;
 dkim=pass header.d=netprisma.us; arc=none
Received: from CH3PR22MB4385.namprd22.prod.outlook.com (2603:10b6:610:1a9::11)
 by SN4PR22MB3255.namprd22.prod.outlook.com (2603:10b6:806:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.37; Sat, 29 Jun
 2024 01:54:45 +0000
Received: from CH3PR22MB4385.namprd22.prod.outlook.com
 ([fe80::e03a:7b82:8bac:c700]) by CH3PR22MB4385.namprd22.prod.outlook.com
 ([fe80::e03a:7b82:8bac:c700%3]) with mapi id 15.20.7698.032; Sat, 29 Jun 2024
 01:54:45 +0000
Content-Type: multipart/mixed;
	boundary="_000_CH3PR22MB438518FE39766ACDBFE6748081D12CH3PR22MB4385namp_"
From: Mank Wang <mank.wang@netprisma.us>
To: "johan@kernel.org" <johan@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH V2] USB: serial: option: add Netprisma LCUK54 series modules
Thread-Topic: [PATCH V2] USB: serial: option: add Netprisma LCUK54 series
 modules
Thread-Index: AdrJx0mN/5eNyi/CQ/e5rAnywDPfLQ==
Date: Sat, 29 Jun 2024 01:54:45 +0000
Message-ID:
 <CH3PR22MB438518FE39766ACDBFE6748081D12@CH3PR22MB4385.namprd22.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
 <CH3PR22MB438518FE39766ACDBFE6748081D12@CH3PR22MB4385.namprd22.prod.outlook.com>
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netprisma.us;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR22MB4385:EE_|SN4PR22MB3255:EE_
x-ms-office365-filtering-correlation-id: 69f1d852-8f9d-47a4-be99-08dc97de73a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|80162021|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?58MH2CisaawkkpqzCK9mU0M4TvPC+C7DXsjwXn2DUtRKkHVJ2YlgU3NCHRKx?=
 =?us-ascii?Q?VHmT2cYLNbpW1SU4GOhhEIMgSD2S5TMVeWI59pMtJ9/ws5BIUCzhT1/87liN?=
 =?us-ascii?Q?NnZ8xOVUWIccAK/TAFfwJ4x+uajN6I4RwP9cmH3czbvYa6qao7SGUM6Sp0p4?=
 =?us-ascii?Q?6m1ird5DLPZbjgdxK8CPej0AnQFfg1vOtiAJY9Yz3C6rF/pSEUrYuy0RdR2K?=
 =?us-ascii?Q?KPdrcrSmrAfZ3fgPkFlMohbuzqD1+K5O7fpx9xwvreQMoKCtjhDqlEtAI4Lv?=
 =?us-ascii?Q?KU6hvWGuccizyUjR66uvgn6Bw9Dxu9G0XXG84pM4ngandV8aKC1KWIILIR6d?=
 =?us-ascii?Q?No07s2nRullBZTYlYOQcyCbOOkmarNNjKppurYuyYrjY5yGiQiPMXtgZ/MeM?=
 =?us-ascii?Q?h3CFMKztuFYT2i17WvlpeiQfWzWGZpubpZPS7ynAG/E83KEMYFyjHH9K6qit?=
 =?us-ascii?Q?Xo0f5OssEpduHos36r5dvAWBMvDDua4WgOdtGrCQU2I320/gZX/K4SU7h601?=
 =?us-ascii?Q?Du2o8Z27KZqIKKsIfYopvS11G5Gi1CdlELikDKv3gmxk+VCZAPDgULap31Xr?=
 =?us-ascii?Q?RsAZc04vPF4jhZJzxVjUUEvzS3Y21OXZt3L0gMc62c7vxZEy+cmP/NbC7OFZ?=
 =?us-ascii?Q?i/L3JLNDzJMED8C9UOVblG0+sZCeA0cX2l32Dywz1rz6IPMBTHQ2paxHcLrt?=
 =?us-ascii?Q?H7PJMnJfL5kj8ZWGr6427qMr/csXmi7tIGcH5nnR8ZTOxAns8gnvJdpr/OIy?=
 =?us-ascii?Q?JE34B3Iyz06NV2T8ksEL95HdFdZT7rmodAA8dUHneRU4EpkUXROOv21nPITH?=
 =?us-ascii?Q?0trzTaqkSPMOtgIsW95waF7lTA3v+JmGclXEsoIHsgoOYjfu9fwsdWnq7juP?=
 =?us-ascii?Q?tyPg3RXZz8UMN1jZiGpF2Pc+T7EjLfZaLkYTMMHQhiwK6mC9NwKGACFvdptP?=
 =?us-ascii?Q?Q/KkDYT+OEwc6fLKFNif7D2n/f9WAt3V4apVzJ6Gg1V7PDK2V2M8yM5xxILG?=
 =?us-ascii?Q?XN7OIkA9paxDqamTp7RejiDN/hiUhz3M9GjI1fA/2lLy+w8031n0bDpLpapC?=
 =?us-ascii?Q?VM7YBe6oxYMOu9nOx4WO5hrtz7dA3k7r6VZYJrx/1Yr374R4C0UBAI0oBnHc?=
 =?us-ascii?Q?7bA1RGj2v9qdU8EJ2SrfOZtaFX6YACg335Dp+x6XBpPwO28x3MlfCRVYV4nq?=
 =?us-ascii?Q?vLza/p6zf83IAhFlZgD7Q6nAlEPiTfYjL1zFGZ4URkHyZ61anJQe1qxKU38j?=
 =?us-ascii?Q?xzDvzPLpvH4Eh5QSYqddXDhVCNGkxENNtBYJ6P312O+k+xnMjNy7ikpc7qE/?=
 =?us-ascii?Q?y5mhSlx3Wcs8ybKDw6scWIiIkP1CF5FSXZzXcZXBGxx8PD+Fg8fdz7K0iUXO?=
 =?us-ascii?Q?SZKEVHhECuEvopUjc4eLqNC98QqQHcWGUB8e42acOfmedj1/m8bTqf1VJ4l/?=
 =?us-ascii?Q?p/V4EyyNji0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR22MB4385.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(80162021)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?h/35kR5NdfYVScrfSuDfUWefrT9skz5+oijJFbiQ0s4BjerPPCAkakqxkhtD?=
 =?us-ascii?Q?ETbFL6Joi/pHJ0ivmSiVXukys8IqTa1e/7MjkKtn9Unvj/BfoHoxQiH2lokA?=
 =?us-ascii?Q?29tsDZYM/3kVIxEXdr9iwgfZ2SzxV1rNCsKMgkef4GDujOYMZsk2gUecR5K3?=
 =?us-ascii?Q?w810LRPpR7pFo2JaQB0C4HPQCjsfPW7U1gBU1PnmKqYI1b2TsKOEHhaNh4Rw?=
 =?us-ascii?Q?rB4jh7sB7OaScSIYVVC6cyd2P+hxOe9yMV9zrq7TFXpYjtIefeRs7127LJlP?=
 =?us-ascii?Q?847HZeeP0OBNGO019cYUb/+om4/4HUHEwxbVvb9iJymv6ZExpFOMx41cmYfo?=
 =?us-ascii?Q?ypJqRllefXi1k8VSsJMuAbApu0Yc5uqNOzgLvuAbKHmk5Ae2TIttoG27i9HK?=
 =?us-ascii?Q?cMHEAN4XuZ2+ukxYJvsxZAtHw21rQ7UK5nmqSFMFZCHEpQ5s4hrnFuCgb4V8?=
 =?us-ascii?Q?wi4iiprJPSMOpslMK0NnMSpq/+oyEzaFnlBfzt5Pl6mhwH26XqiAOyI97hVY?=
 =?us-ascii?Q?C/wyx/aYNzbJy03GSEhfxu7/o6htCFR58HO8vqsZAq9nKXttoAX6jYRJYFz3?=
 =?us-ascii?Q?jg8d5yocy3FUgD3mWbXvXjZQcMtWhX4pyUkuEzxt2qGFzNMnWkTZ31E0tc/q?=
 =?us-ascii?Q?LPoP6lxj3jVq2/zC98XED3DBcb4n/NgLHFsdYoCEokki2bJjhvmQefHJSoYe?=
 =?us-ascii?Q?HUCx/dRG9dJaWuwEkGIn7w9vtqsx8anMZMaoXUd9esbhH2DV/nR/H4nwH7UJ?=
 =?us-ascii?Q?mLfWaN2oLkSAOQEdpsrvcpLk0I64sQcU4gXLpdT0oObudFf5v2wyj9JAH18L?=
 =?us-ascii?Q?Mi2C/IBKEzlLAfT7OHMJL8FcZeNdNpElnaLcdBgPdF4VkiM/MOqTYN8I8Z14?=
 =?us-ascii?Q?jrx35X6wLKomsxbYNkTxX1bMgK16r67m+iAdwgUiIUbVhMrLiNGqgAbZ1/4t?=
 =?us-ascii?Q?NrFajLp3MzqDZTFvfM5niZ/M4XFi0RXV3iV32i/LTvR9mpurVQT7+nVyzlId?=
 =?us-ascii?Q?8oqcTUuQyYzhMONuerVwa+TKXgZUQ5woZvsx4YddaG1GJb2gfovCkwD+PAlQ?=
 =?us-ascii?Q?csBgk6hvKcrDt9lPhljdntVvxakRL2hEe5X1KLpPLuKtJAl8kyfLWnQygTGA?=
 =?us-ascii?Q?rLVcBFa3n+tZ6tiY9efsZ9iC2PZ+ACrXjDAx1/8ve2Pfu7kLdi+W9vefDDjj?=
 =?us-ascii?Q?r0n6CTLnbbzpfQXCt1T7GohgLJBXZoaDasIDYhJ18AWF1dCWPVXmkdMrbsSE?=
 =?us-ascii?Q?3DcepdQrAw3I6s8zck5uGiP3gGV0/bLEETvDTwIxF+x7YLkEp8dwNo1FSqws?=
 =?us-ascii?Q?iWfURlA8/Wbo9rJWvqV1bPWIV295DeWBJFVWhhlW5b6t9ho6ic6BBYK924wD?=
 =?us-ascii?Q?7ZjprdqsK8nQQFUb8d7d6hSg2hKI47KcLEqzfSzHKQC4MAq6kdzxHdvFqhlN?=
 =?us-ascii?Q?U7y4CTZVpMTGuIpn0dLY/CmfcXrtSZwlMy8kdFxHhZsjz+Pk82T2Tr01zSyh?=
 =?us-ascii?Q?wrvQIiTL9IiRC1g547bPrQd7M/jSPuGnllrA3Fn1Y2zXQsYR1v4BAG4vRd8D?=
 =?us-ascii?Q?1M967EWC0pFzd3lT1YhS2IUjIrYEh7fgS26dmi91?=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: netprisma.us
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR22MB4385.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f1d852-8f9d-47a4-be99-08dc97de73a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2024 01:54:45.8234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fdc90941-0026-4225-aaa0-15fff5e87036
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5T3ePbqa3gngj7siv/8yKN9NwdB7YkT0WDfA2Txbnfbu4HcF4HY/B+mKe7WByNCr9c3+R97NgreS0u60Jtg+Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR22MB3255

--_000_CH3PR22MB438518FE39766ACDBFE6748081D12CH3PR22MB4385namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Add support for Netprisma LCUK54 series modules.

LCUK54-WRD-LWW(0x3731/0x0100): NetPrisma LCUK54-WWD for Global
LCUK54-WRD-LWW(0x3731/0x0101): NetPrisma LCUK54-WRD for Global SKU
LCUK54-WRD-LCN(0x3731/0x0106): NetPrisma LCUK54-WRD for China SKU
LCUK54-WRD-LWW(0x3731/0x0111): NetPrisma LCUK54-WWD for SA
LCUK54-WRD-LWW(0x3731/0x0112): NetPrisma LCUK54-WWD for EU
LCUK54-WRD-LWW(0x3731/0x0113): NetPrisma LCUK54-WWD for NA
LCUK54-WWD-LCN(0x3731/0x0115): NetPrisma LCUK54-WWD for China EDU
LCUK54-WWD-LWW(0x3731/0x0116): NetPrisma LCUK54-WWD for Golbal EDU

Above products use the exact same interface layout and option
driver:
MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL

T:  Bus=3D03 Lev=3D01 Prnt=3D01 Port=3D01 Cnt=3D02 Dev#=3D  5 Spd=3D480  Mx=
Ch=3D 0
D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D3731 ProdID=3D0101 Rev=3D 5.04
S:  Manufacturer=3DNetPrisma
S:  Product=3DLCUK54-WRD
S:  SerialNumber=3Db6250c36
C:* #Ifs=3D 8 Cfg#=3D 1 Atr=3Da0 MxPwr=3D500mA
A:  FirstIf#=3D 0 IfCount=3D 2 Cls=3D02(comm.) Sub=3D0e Prot=3D00
I:* If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D02(comm.) Sub=3D0e Prot=3D00 Driver=
=3Dcdc_mbim
E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D32ms
I:  If#=3D 1 Alt=3D 0 #EPs=3D 0 Cls=3D0a(data ) Sub=3D00 Prot=3D02 Driver=
=3Dcdc_mbim
I:* If#=3D 1 Alt=3D 1 #EPs=3D 2 Cls=3D0a(data ) Sub=3D00 Prot=3D02 Driver=
=3Dcdc_mbim
E:  Ad=3D8e(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D0f(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I:* If#=3D 2 Alt=3D 0 #EPs=3D 1 Cls=3Dff(vend.) Sub=3Dff Prot=3Dff Driver=
=3D(none)
E:  Ad=3D82(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D32ms
I:* If#=3D 3 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3Dff Prot=3D30 Driver=
=3Doption
E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D83(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I:* If#=3D 4 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D40 Driver=
=3Doption
E:  Ad=3D85(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
E:  Ad=3D84(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I:* If#=3D 5 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3D40 Driver=
=3Doption
E:  Ad=3D87(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
E:  Ad=3D86(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D03(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I:* If#=3D 6 Alt=3D 0 #EPs=3D 1 Cls=3Dff(vend.) Sub=3Dff Prot=3D70 Driver=
=3D(none)
E:  Ad=3D88(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I:* If#=3D 7 Alt=3D 0 #EPs=3D 1 Cls=3Dff(vend.) Sub=3Dff Prot=3D80 Driver=
=3D(none)
E:  Ad=3D8f(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms

---
V1 -> V2:
1.Use comments instead of product macro definitions.
2.Add more NetPrisma LCUK54 products for different regions.

Signed-off-by: Mank Wang <mank.wang@netprisma.us>
---
 drivers/usb/serial/option.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 8a5846d4adf6..e4007901eb40 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2328,6 +2328,30 @@ static const struct usb_device_id option_ids[] =3D {
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C, 0x=
ff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, LUAT_PRODUCT_AIR720U, 0=
xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SL=
M320, 0xff, 0, 0) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0xff, 0x30) }, /* N=
etPrisma LCUK54-WWD for Global */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0101, 0xff, 0xff, 0x30) }, /* N=
etPrisma LCUK54-WRD for Global SKU */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0101, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0101, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0106, 0xff, 0xff, 0x30) }, /* N=
etPrisma LCUK54-WRD for China SKU */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0106, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0106, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0111, 0xff, 0xff, 0x30) }, /* N=
etPrisma LCUK54-WWD for SA */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0111, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0111, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0112, 0xff, 0xff, 0x30) }, /* N=
etPrisma LCUK54-WWD for EU */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0112, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0112, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0113, 0xff, 0xff, 0x30) }, /* N=
etPrisma LCUK54-WWD for NA */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0113, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0113, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0115, 0xff, 0xff, 0x30) }, /* N=
etPrisma LCUK54-WWD for China EDU */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0115, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0115, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0116, 0xff, 0xff, 0x30) }, /* N=
etPrisma LCUK54-WWD for Golbal EDU */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0116, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0116, 0xff, 0xff, 0x40) },
 	{ } /* Terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, option_ids);
--=20
2.34.1


--_000_CH3PR22MB438518FE39766ACDBFE6748081D12CH3PR22MB4385namp_
Content-Disposition: attachment; filename="winmail.dat"
Content-Transfer-Encoding: base64
Content-Type: application/ms-tnef; name="winmail.dat"

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
MufC4RuBxOIoK4VmTGbIQe3BEC3I8EuhL85vz3nWwD/WL894JKUdsRAwYzBhNRGcUDZkNMMwZjYu
RC5lpWAwNzknAGX+YqVhHpFY0FxGwFHV/9jvnyTh0OHX395PJOFAQMEQ0jJwoDgssNAr4kOMUX/i
AR9hTCBXUBvhH2DjYXK7w9LgYV8BAB1gSyBfDdBDS/XlUXNbXSBUEFwPAADN9QyC5nEgVVNCAF9E
RVZJQ0VfEEFORF8gIFRFUgxGQeghICBGTyhVAE5JU09DX1ZFKehgT1LogETTUFRPQlpC8F9QUk9D
AEPQVF9MVLOAQ9NQJnCPASDr0evRV3BcfSzmr2fnv+jP6dtMVU9w6vdB9ElSAcFV69/s7+3/7wqB
TxBJR1NNQVLrYMfp+fYY6wZTTE1woPKi//Jf30Pzv/TP74ImdPjiJwLP+Of95YxQ8uMgL2LARY/x
KIwgKi/5//sP/B/9L/8m4fjTpWD5rwJPA18Eb/3r/wZPB18Ibwl9CeP9//8PLH//LYUBXwzPDd8O
7wWfC98Uv38VzxbfCu8Y/xoPGx8J9Tb/D68QvxHPMdgTjx7/IA8hH/8Xzx4PJt8n7yj/HR8rHywv
/y0/CfQ4gCHfIu//32DQTzD/Jb8xLzI/M08p/zePOJ85r786vy9PPN897z7/QAQyM//zNQ82HyBF
JZ9Cv0PPRN//O49Bz0ovSz9MT0DfTm9Pf/tQjz/mM0WvRr9Hz1jwN0//VG9Vf1aPTT9Tf1vfXO9d
/99Sj2AfYS9iPz/mNVdfWG//WX8lBerQSP9mH2cvaD9e7/9lL23/bw9wH2Q/cj9zT3Rfnz/mLr9q
D2sfANFvbBMS/2yveB95L3o/cO93L4APgR9fgi92P/MfiVF8klTgIG3PJTHjoMuRyJFyeX8IiVFq
O9H2TeshTIXwhaVUdEFCjaAo4GHTUOWYKYeM1t0RxTczNC4xyVwMfX3VMJJAAB8AQgABAAAAFAAA
AE0AYQBuAGsAIABXAGEAbgBnAAAAHwBlAAEAAAAuAAAAbQBhAG4AawAuAHcAYQBuAGcAQABuAGUA
dABwAHIAaQBzAG0AYQAuAHUAcwAAAAAAHwBkAAEAAAAKAAAAUwBNAFQAUAAAAAAAAgFBAAEAAABk
AAAAAAAAAIErH6S+oxAZnW4A3QEPVAIAAACATQBhAG4AawAgAFcAYQBuAGcAAABTAE0AVABQAAAA
bQBhAG4AawAuAHcAYQBuAGcAQABuAGUAdABwAHIAaQBzAG0AYQAuAHUAcwAAAB8AAl0BAAAALgAA
AG0AYQBuAGsALgB3AGEAbgBnAEAAbgBlAHQAcAByAGkAcwBtAGEALgB1AHMAAAAAAB8A5V8BAAAA
NgAAAHMAaQBwADoAbQBhAG4AawAuAHcAYQBuAGcAQABuAGUAdABwAHIAaQBzAG0AYQAuAHUAcwAA
AAAAAgEuDAEAAAAQAAAAxXSJ0UHzRkKZv3JE9EXtBx8AGgwBAAAAFAAAAE0AYQBuAGsAIABXAGEA
bgBnAAAAHwAfDAEAAAAuAAAAbQBhAG4AawAuAHcAYQBuAGcAQABuAGUAdABwAHIAaQBzAG0AYQAu
AHUAcwAAAAAAHwAeDAEAAAAKAAAAUwBNAFQAUAAAAAAAAgEZDAEAAABkAAAAAAAAAIErH6S+oxAZ
nW4A3QEPVAIAAACATQBhAG4AawAgAFcAYQBuAGcAAABTAE0AVABQAAAAbQBhAG4AawAuAHcAYQBu
AGcAQABuAGUAdABwAHIAaQBzAG0AYQAuAHUAcwAAAB8AAV0BAAAALgAAAG0AYQBuAGsALgB3AGEA
bgBnAEAAbgBlAHQAcAByAGkAcwBtAGEALgB1AHMAAAAAAAIBLQwBAAAAEAAAAMV0idFB80ZCmb9y
RPRF7QcLAEA6AQAAAB8AGgABAAAAEgAAAEkAUABNAC4ATgBvAHQAZQAAAAAAAwDxPwQIAAALAEA6
AQAAAAMA/T/kBAAAAgELMAEAAAAQAAAAE8tK9PvLe0qLupzY6dE6gwMAFwABAAAAQAA5AIBgrFDH
ydoBQAAIMJvTKFHHydoBCwApAAAAAAAfANk/AQAAAAACAABBAGQAZAAgAHMAdQBwAHAAbwByAHQA
IABmAG8AcgAgAE4AZQB0AHAAcgBpAHMAbQBhACAATABDAFUASwA1ADQAIABzAGUAcgBpAGUAcwAg
AG0AbwBkAHUAbABlAHMALgANAAoADQAKAEwAQwBVAEsANQA0AC0AVwBSAEQALQBMAFcAVwAoADAA
eAAzADcAMwAxAC8AMAB4ADAAMQAwADAAKQA6ACAATgBlAHQAUAByAGkAcwBtAGEAIABMAEMAVQBL
ADUANAAtAFcAVwBEACAAZgBvAHIAIABHAGwAbwBiAGEAbAANAAoATABDAFUASwA1ADQALQBXAFIA
RAAtAEwAVwBXACgAMAB4ADMANwAzADEALwAwAHgAMAAxADAAMQApADoAIABOAGUAdABQAHIAaQBz
AG0AYQAgAEwAQwBVAEsANQA0AC0AVwBSAEQAIABmAG8AcgAgAEcAbABvAGIAYQBsACAAUwBLAFUA
DQAKAEwAQwBVAEsANQA0AC0AVwBSAEQALQBMAEMATgAoADAAeAAzADcAMwAxAC8AMAB4ADAAMQAw
ADYAKQA6ACAATgBlAHQAUAByAGkAcwBtAGEAIABMAEMAVQBLADUANAAtAFcAUgBEACAAZgBvAHIA
IABDAGgAaQBuAGEAIABTAEsAVQANAAoATABDAFUASwAAAAsAAIAIIAYAAAAAAMAAAAAAAABGAAAA
ABSFAAAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAHgAAAGEAYwBjAGUAcAB0AGwAYQBuAGcA
dQBhAGcAZQAAAAAAAQAAABoAAAB6AGgALQBDAE4ALAAgAGUAbgAtAFUAUwAAAAAAAwAAgAggBgAA
AAAAwAAAAAAAAEYBAAAAMgAAAEUAeABjAGgAYQBuAGcAZQBBAHAAcABsAGkAYwBhAHQAaQBvAG4A
RgBsAGEAZwBzAAAAAAAgAAAASAAAgAggBgAAAAAAwAAAAAAAAEYBAAAAIgAAAE4AZQB0AHcAbwBy
AGsATQBlAHMAcwBhAGcAZQBJAGQAAAAAAFLY8Wmdj6RHvpkI3Jfec6IfAACAE4/yQfSDFEGlhO7b
WmsL/wEAAAAWAAAAQwBsAGkAZQBuAHQASQBuAGYAbwAAAAAAAQAAACoAAABDAGwAaQBlAG4AdAA9
AE0AUwBFAHgAYwBoAGEAbgBnAGUAUgBQAEMAAAAAAB8A+j8BAAAAFAAAAE0AYQBuAGsAIABXAGEA
bgBnAAAAHwA3AAEAAACIAAAAWwBQAEEAVABDAEgAIABWADIAXQAgAFUAUwBCADoAIABzAGUAcgBp
AGEAbAA6ACAAbwBwAHQAaQBvAG4AOgAgAGEAZABkACAATgBlAHQAcAByAGkAcwBtAGEAIABMAEMA
VQBLADUANAAgAHMAZQByAGkAZQBzACAAbQBvAGQAdQBsAGUAcwAAAB8APQABAAAAAgAAAAAAAAAD
ADYAAAAAAAIBcQABAAAAFgAAAAHaycdJjf+XjcovwkP3uawJ8sAz3y0AAB8AcAABAAAAiAAAAFsA
UABBAFQAQwBIACAAVgAyAF0AIABVAFMAQgA6ACAAcwBlAHIAaQBhAGwAOgAgAG8AcAB0AGkAbwBu
ADoAIABhAGQAZAAgAE4AZQB0AHAAcgBpAHMAbQBhACAATABDAFUASwA1ADQAIABzAGUAcgBpAGUA
cwAgAG0AbwBkAHUAbABlAHMAAAAfADUQAQAAAKIAAAA8AEMASAAzAFAAUgAyADIATQBCADQAMwA4
ADUAMQA4AEYARQAzADkANwA2ADYAQQBDAEQAQgBGAEUANgA3ADQAOAAwADgAMQBEADEAMgBAAEMA
SAAzAFAAUgAyADIATQBCADQAMwA4ADUALgBuAGEAbQBwAHIAZAAyADIALgBwAHIAbwBkAC4AbwB1
AHQAbABvAG8AawAuAGMAbwBtAD4AAAAAAAMA3j+fTgAAAwATEgAAAAACAQCAE4/yQfSDFEGlhO7b
WmsL/wEAAAAuAAAASABlAGEAZABlAHIAQgBvAGQAeQBGAHIAYQBnAG0AZQBuAHQATABpAHMAdAAA
AAAAAQAAACIAAAABAAoAAAAEAAAAAAAAABQAAAAAAAAAAAAAAP////8AAAAAAAALAACAE4/yQfSD
FEGlhO7bWmsL/wEAAAAcAAAASABhAHMAUQB1AG8AdABlAGQAVABlAHgAdAAAAAAAAAALAACAE4/y
QfSDFEGlhO7bWmsL/wEAAAAoAAAASQBzAFEAdQBvAHQAZQBkAFQAZQB4AHQAQwBoAGEAbgBnAGUA
ZAAAAAAAAABAAAcwMjvMUMfJ2gECAQsAAQAAABAAAAATy0r0+8t7Sou6nNjp0TqDAwAmAAAAAAAL
AAYMAAAAAAIBEDABAAAARgAAAAAAAABB5Wy9JQgoS6fB1zabryjlBwDTT1AkljwSS7v2fGtFW29f
AAAAAAELAADTT1AkljwSS7v2fGtFW29fAAAcrVSqAAAAAAIBEzABAAAAEAAAAP+XjcovwkP3uawJ
8sAz3y0CARQwAQAAAAwAAAA2AgAAN7q3D0EAAAADAFszAQAAAAMAWjYAAAAAAwBoNg0AAAALAPo2
AQAAAB8A+D8BAAAAFAAAAE0AYQBuAGsAIABXAGEAbgBnAAAAHwAiQAEAAAAGAAAARQBYAAAAAAAf
ACNAAQAAAAIBAAAvAE8APQBFAFgAQwBIAEEATgBHAEUATABBAEIAUwAvAE8AVQA9AEUAWABDAEgA
QQBOAEcARQAgAEEARABNAEkATgBJAFMAVABSAEEAVABJAFYARQAgAEcAUgBPAFUAUAAgACgARgBZ
AEQASQBCAE8ASABGADIAMwBTAFAARABMAFQAKQAvAEMATgA9AFIARQBDAEkAUABJAEUATgBUAFMA
LwBDAE4APQAyADQANABCADMANABBADQAMABBAEYARgA0ADEANwA5ADkAQgA4ADQAQgAyADIAOQAz
AEYAMgA4AEUANwBFAEQALQBEADEAOAA5ADcANABDADUALQBGADMAAAAAAB8AJEABAAAABgAAAEUA
WAAAAAAAHwAlQAEAAAACAQAALwBPAD0ARQBYAEMASABBAE4ARwBFAEwAQQBCAFMALwBPAFUAPQBF
AFgAQwBIAEEATgBHAEUAIABBAEQATQBJAE4ASQBTAFQAUgBBAFQASQBWAEUAIABHAFIATwBVAFAA
IAAoAEYAWQBEAEkAQgBPAEgARgAyADMAUwBQAEQATABUACkALwBDAE4APQBSAEUAQwBJAFAASQBF
AE4AVABTAC8AQwBOAD0AMgA0ADQAQgAzADQAQQA0ADAAQQBGAEYANAAxADcAOQA5AEIAOAA0AEIA
MgAyADkAMwBGADIAOABFADcARQBEAC0ARAAxADgAOQA3ADQAQwA1AC0ARgAzAAAAAAAfADBAAQAA
ABQAAABNAGEAbgBrACAAVwBhAG4AZwAAAB8AMUABAAAAFAAAAE0AYQBuAGsAIABXAGEAbgBnAAAA
HwA4QAEAAAAUAAAATQBhAG4AawAgAFcAYQBuAGcAAAAfADlAAQAAABQAAABNAGEAbgBrACAAVwBh
AG4AZwAAAAMAWUAAAAAAAwBaQAAAAAADADdQAQAAAAMACVkBAAAAHwAKXQEAAAAuAAAAbQBhAG4A
awAuAHcAYQBuAGcAQABuAGUAdABwAHIAaQBzAG0AYQAuAHUAcwAAAAAAHwALXQEAAAAuAAAAbQBh
AG4AawAuAHcAYQBuAGcAQABuAGUAdABwAHIAaQBzAG0AYQAuAHUAcwAAAAAAAgEVXQEAAAASAAAA
AkEJyf0mACVCqqAV//XocDYBAAACARZdAQAAABIAAAACQQnJ/SYAJUKqoBX/9ehwNgEAAAMAAIBQ
42MLzJzQEbzbAIBfzM4EAQAAACQAAABJAG4AZABlAHgAaQBuAGcARQByAHIAbwByAEMAbwBkAGUA
AAAbAAAAHwAAgFDjYwvMnNARvNsAgF/MzgQBAAAAKgAAAEkAbgBkAGUAeABpAG4AZwBFAHIAcgBv
AHIATQBlAHMAcwBhAGcAZQAAAAAAAQAAAHAAAABJAG4AZABlAHgAaQBuAGcAIABQAGUAbgBkAGkA
bgBnACAAdwBoAGkAbABlACAAQgBpAGcARgB1AG4AbgBlAGwAUABPAEkASQBzAFUAcABUAG8ARABh
AHQAZQAgAGkAcwAgAGYAYQBsAHMAZQAuAAAACwAAgFDjYwvMnNARvNsAgF/MzgQBAAAAJgAAAEkA
cwBQAGUAcgBtAGEAbgBlAG4AdABGAGEAaQBsAHUAcgBlAAAAAAAAAAAAHwAAgB+k6zOoei5Cvnt5
4amOVLMBAAAAOAAAAEMAbwBuAHYAZQByAHMAYQB0AGkAbwBuAEkAbgBkAGUAeABUAHIAYQBjAGsA
aQBuAGcARQB4AAAAAQAAAEQBAABJAEkAPQBbAEMASQBEAD0AYwBhADgAZAA5ADcAZgBmAC0AYwAy
ADIAZgAtAGYANwA0ADMALQBiADkAYQBjAC0AMAA5AGYAMgBjADAAMwAzAGQAZgAyAGQAOwBJAEQA
WABIAEUAQQBEAD0ARABBAEMAOQBDADcANAA5ADgARAA7AEkARABYAEMATwBVAE4AVAA9ADEAXQA7
AFQARgBSAD0AVABoAHIAZQBhAGQARgBvAHIAawBpAG4AZwBJAHMARABpAHMAYQBiAGwAZQBkADsA
VgBlAHIAcwBpAG8AbgA9AFYAZQByAHMAaQBvAG4AIAAxADUALgAyADAAIAAoAEIAdQBpAGwAZAAg
ADcANgA5ADgALgAwACkALAAgAFMAdABhAGcAZQA9AEgANAA7AFUAUAA9ADEAMAA7AEQAUAA9ADEA
AAALAACACCAGAAAAAADAAAAAAAAARgAAAACChQAAAAAAAAIBAIAIIAYAAAAAAMAAAAAAAABGAQAA
ADYAAABJAG4AVAByAGEAbgBzAGkAdABNAGUAcwBzAGEAZwBlAEMAbwByAHIAZQBsAGEAdABvAHIA
AAAAAAEAAAAQAAAAKLJBCNSU/0mNlFI349GopAMADTQAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYB
AAAALgAAAGEAdQB0AGgAZQBuAHQAaQBjAGEAdABpAG8AbgAtAHIAZQBzAHUAbAB0AHMAAAAAAAEA
AAC8AAAAZABrAGkAbQA9AG4AbwBuAGUAIAAoAG0AZQBzAHMAYQBnAGUAIABuAG8AdAAgAHMAaQBn
AG4AZQBkACkAIABoAGUAYQBkAGUAcgAuAGQAPQBuAG8AbgBlADsAZABtAGEAcgBjAD0AbgBvAG4A
ZQAgAGEAYwB0AGkAbwBuAD0AbgBvAG4AZQAgAGgAZQBhAGQAZQByAC4AZgByAG8AbQA9AG4AZQB0
AHAAcgBpAHMAbQBhAC4AdQBzADsAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAAgAAAAeAAtAG0A
cwAtAGgAYQBzAC0AYQB0AHQAYQBjAGgAAAABAAAAAgAAAAAAAAAfAACAhgMCAAAAAADAAAAAAAAA
RgEAAAAuAAAAeAAtAG0AcwAtAHAAdQBiAGwAaQBjAHQAcgBhAGYAZgBpAGMAdAB5AHAAZQAAAAAA
AQAAAAwAAABFAG0AYQBpAGwAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAA2AAAAeAAtAG0AcwAt
AHQAcgBhAGYAZgBpAGMAdAB5AHAAZQBkAGkAYQBnAG4AbwBzAHQAaQBjAAAAAAABAAAASAAAAEMA
SAAzAFAAUgAyADIATQBCADQAMwA4ADUAOgBFAEUAXwB8AFMATgA0AFAAUgAyADIATQBCADMAMgA1
ADUAOgBFAEUAXwAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAFAAAAB4AC0AbQBzAC0AbwBmAGYA
aQBjAGUAMwA2ADUALQBmAGkAbAB0AGUAcgBpAG4AZwAtAGMAbwByAHIAZQBsAGEAdABpAG8AbgAt
AGkAZAAAAAEAAABKAAAANgA5AGYAMQBkADgANQAyAC0AOABmADkAZAAtADQANwBhADQALQBiAGUA
OQA5AC0AMAA4AGQAYwA5ADcAZABlADcAMwBhADIAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAA
ADgAAAB4AC0AbQBzAC0AZQB4AGMAaABhAG4AZwBlAC0AcwBlAG4AZABlAHIAYQBkAGMAaABlAGMA
awAAAAEAAAAEAAAAMQAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAADoAAAB4AC0AbQBzAC0AZQB4
AGMAaABhAG4AZwBlAC0AYQBuAHQAaQBzAHAAYQBtAC0AcgBlAGwAYQB5AAAAAAABAAAABAAAADAA
AAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAAqAAAAeAAtAG0AaQBjAHIAbwBzAG8AZgB0AC0AYQBu
AHQAaQBzAHAAYQBtAAAAAAABAAAAhAAAAEIAQwBMADoAMAA7AEEAUgBBADoAMQAzADIAMwAwADAA
NAAwAHwAMwA3ADYAMAAxADQAfAAzADYANgAwADEANgB8ADEAOAAwADAANwA5ADkAMAAyADQAfAA4
ADAAMQA2ADIAMAAyADEAfAAzADgAMAA3ADAANwAwADAAMAAxADgAOwAAAB8AAICGAwIAAAAAAMAA
AAAAAABGAQAAAEQAAAB4AC0AbQBpAGMAcgBvAHMAbwBmAHQALQBhAG4AdABpAHMAcABhAG0ALQBt
AGUAcwBzAGEAZwBlAC0AaQBuAGYAbwAAAAEAAABaCwAANQA4AE0ASAAyAEMAaQBzAGEAYQB3AGsA
awBwAHEAegBDAEsAOQBtAFUAMABNADQAVAB2AFAAQwArAEMANwBEAFgAcwBqAHcAWABuADIARABV
AHQAUgBLAGsASABWAEoAMgBZAGwAZwBVADMATgBDAEgAUgBLAHgAVgBIAG0AVAAyAGMAWQBMAE4A
YgBwAFcAMQBTAFUANABHAE8AaABoAEUASQBNAGcAUwBEADIAUwA1AFQATQBWAGUAVwBJADUAOQBw
AE0AdABKADkALwB3AHMANQBCAEkAVQBDAHoAaABUADEALwA4ADcAbABpAE4ATgBuAFoAOAB4AE8A
VgBVAFcASQBjAGMAQQBLAC8AVABBAEYAZgB3AEoANAB4ACsAdQBhAGoATgA2AEkANABSAHcAUAA5
AGMAbQBIADMAYwB6AGIAdgBZAGEANgBxAGEAbwA3AFMARwBVAE0ANgBTAHAAMABwADQANgBtADEA
aQByAGQANQBEAEwAUABaAGIAagBnAGQAeABLADgAQwBQAGUAagAwAEEAbgBRAEYAZgBnADEAdgBP
AHQAaQBBAEoAWQA5AFkAegAzAEMANgByAEYALwBwAFMARQBVAHIAWQB1AHkAMABSAGQAUgAyAEsA
SwBQAGQAcgBjAHIAUwBtAHIAQQBmAFoAMwBmAGcAUABrAEYAbABNAG8AaABiAHUAegBxAEQAMQAr
AEsANQBPADcAZgBwAHgAOQB4AHcAdgByAGUAUQBNAG8ASwBDAHQAagBoAEQAcQBsAEUAdABBAEkA
NABMAHYASwBVADYAaAB2AFcARwB1AGMAYwBpAHoAeQBVAGoAUgA2ADYAdQB2AGcAbgA2AEIAdwA5
AEQAeAB1ADkARwAwAFgAWABHADgANABwAE0ANABuAGcAYQBuAGQAVgA4AGEASwBDADEASwBXAEkA
SQBMAEkAUgA2AGQATgBvADAANwBzADIAbgBSAHUAbABsAEIAWgBUAFkAbABZAE8AUQBjAHkAQwBi
AE8ATwBrAG0AYQByAE4ATgBqAEsAcABwAHUAcgBZAHUAeQBZAHIAagBZADUAeQBHAGkAUQBpAFAA
TQBYAHQAZwBaAC8ATQBlAE0AaAAzAEMARgBNAEsAegB0AHUARgBZAFQAMgBpADEANwBXAHYAbABw
AGUAaQBRAGYAVwB6AFcARwBaAHAAdQBiAHAAWgBQAFMANwB5AG4AQQBHAC8ARQA4ADMASwBFAE0A
WQBGAHkAagBIAEgAOQBLADYAcQBpAHQAWABvADAAZgA1AE8AcwBzAEUAcABkAHUASABvAHMAMwA2
AHIANQBkAHYAQQBXAEIATQB2AEQARAB1AGEANABXAGcATwBkAHQARwByAEMAUQBVADIASQAzADIA
MAAvAGcAWgBYAC8ASwA0AFMAVQA3AGgANgAwADEARAB1ADIAbwA4AFoAMgA3AEsAWgBxAEkASwBL
AHMASQBmAFkAbwBwAHYAUwAxADEARwA1AEcAaQAxAEMAZABsAEUATABpAGsARABLAHYAMwBnAG0A
eABrACsAVgBDAFoAQQBQAEQAZwBVAEwAYQBwADMAMQBYAHIAUgBzAEEAWgBjADAANAB2AFAARgA0
AGoAaABaAEoAegB4AFYAagBVAFUARQB2AHoAUwAzAFkAMgAxAE8AWABaAHQAMwBMADAAZwBNAGMA
NgAyAGMANwB2AHgAWgBFAHkAKwBjAG0AUAAvAE4AYgBDADcATwBGAFoAaQAvAEwAMwBKAEwATgBE
AHoASgBNAEUARAA4AEMAOQBVAE8AVgBiAGwARwAwACsAcwBaAEMAZQBBADAAYwBYADIAbAAzADIA
RAB5AHcAegAxAHIAegA2AEkAUABNAEIAVABIAFEAMgBwAGEAeABIAGMATAByAHQASAA3AFAASgBN
AG4ASgBmAEwANQBrAGoAOABaAFcARwByADYANAAyADcAcQBNAHIALwBjAHMAWABtAGkANwB0AEkA
RwBjAEgANQBuAG4AUgA4AFoAVABPAHgAQQBuAHMAOABnAG4AdgBKAGQAcAByAC8ATwBJAHkASgBF
ADMANABCADMASQB5AHoAMAA2AE4AVgAyAFQAOABrAHMARQBMADkANQBIAGQARgBkAFoAVAA3AHIA
bQBvAGQAQQBBADgAZABVAEgAbgBlAFIAVQA0AEUAcABrAFUAWABSAE8ATwB2ADIAMQBuAFAASQBU
AEgAMAB0AHIAegBUAGEAcQBrAFMAUABNAE8AdABnAEkAcwBXADkANQB3AGEARgA3AGwAVABBADMA
dgArAEoAbQBHAGMAbABYAEUAcwBvAEkASABzAGcAbwBPAFkAagBmAHUAOQBmAHcAcwBkAFcAbgBx
ADcAagB1AFAAdAB5AFAAZwAzAFIAWABaAHoAOABVAE0ATgAxAGoAWgBpAEcAcABGADIAUABjACsA
VAA3AEUAagBMAGYAWgBhAEwAawBZAFQATQBNAEgAUQBoAGkAdwBLADYAbQBDADkATgB3AEsARwBB
AEMARgB2AGQAcAB0AFAAUQAvAEsAawBEAFkAVAArAE8ARQB3AGMANgBmAEwASwBGAE4AaQBmADcA
RAAyAG4ALwBmADkAVwBBAHQAMwBWADQAYQBwAFYAegBKADYARwBnADEAVgA3AFAARABLADIAVgAy
AE0AOAB5AE0ANQB4AHgASQBMAEcAWABOADcATwBJAGsAQQA5AHAAYQB4AEQAcQBhAG0AVABwADcA
UgBlAGoAaQBEAE4ALwBoAGkAVQBoAHoAMwBNADkARwBqAEkAMQBmAEEALwAyAGwATAB5ACsAdwA4
ADAAMwAxAG4AMABiAEQAcABMAHAAYQBwAEMAVgBNADcAWQBCAGUANgBvAHgAWQBNAE8AdQA5AG4A
TwB4ADQAVwBPADUAaAByAHQAegA3AGQAQQAzAGsANwByADYAVgBaAFkASgByAHgALwAxAFkAcgAz
ADcANABSADQAQwAwAFUAQgBBAEkAMABvAEIAbgBIAGMANwBiAEEAMQBSAEcAagAyAHYAOQBxAGQA
VQA4AEUASgAyAFMAcgBmAE8AWgB0AGEARgBYADYAWQBBAEMAZwAzADMANQBEAHAAKwB4ADYAWABC
AHAAUAB3AE8AMgA4AHgAMwBNAGwAZgBDAFIAVgBZAFYANABuAHEAdgBMAHoAYQAvAHAANgB6AGYA
OAAzAEkAQQBoAEYAbABaAGcARAA3AFEANgBuAEEAbABFAFAAaQBUAGYAWQBqAEwAMQB6AEYARwBa
ADQAVQBSAGsASAB5AFoANgAxAGEAbgBKAFEAZQAxAHEAeABLAFUAMwA4AGoAeAB6AEQAdgB6AFAA
TABwAHYASAA0AEUAaAA1AFEAUwBZAHEAZABkAFgARABoAFYAQwBOAEcAawB4AEUATgBOAHQAQgBZ
AEoANgBQADMAMQAyAE8AKwBrACsAeABuAE0AagBOAHkANwBpAGsAcABjADcAcQBFAC8AeQA1AG0A
aABTAGwAeAAzAFcAYwBzADgAeQBiAEsARAB3ADYAcwBjAFcASQBpAEkAawBQADEAQwBGADUARgBT
AFgAWgB6AFgAYwBaAFgAQgBHAHgAeAA4AFAARAArAEYAZwA4AGYAZAB6ADcASwAwAGkAVQBYAE8A
UwBaAEsARQBWAEgAaABFAEMAdQBFAHYAbwBwAFUAagBjADQAZQBMAHEATgBDADkAOABRAHEAUQBI
AGMAVwBHAFUAQgA4AGUANAAyAGEAYwBPAGYAbQBlAGQAagAxAC8AbQA4AGIAVABxAGYAMQBWAEoA
NABsAC8AcAAvAFYANABFAHkAeQBOAGoAaQAwAD0AAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAA
ADgAAAB4AC0AZgBvAHIAZQBmAHIAbwBuAHQALQBhAG4AdABpAHMAcABhAG0ALQByAGUAcABvAHIA
dAAAAAEAAACUAQAAQwBJAFAAOgAyADUANQAuADIANQA1AC4AMgA1ADUALgAyADUANQA7AEMAVABS
AFkAOgA7AEwAQQBOAEcAOgBlAG4AOwBTAEMATAA6ADEAOwBTAFIAVgA6ADsASQBQAFYAOgBOAEwA
SQA7AFMARgBWADoATgBTAFAATQA7AEgAOgBDAEgAMwBQAFIAMgAyAE0AQgA0ADMAOAA1AC4AbgBh
AG0AcAByAGQAMgAyAC4AcAByAG8AZAAuAG8AdQB0AGwAbwBvAGsALgBjAG8AbQA7AFAAVABSADoA
OwBDAEEAVAA6AE4ATwBOAEUAOwBTAEYAUwA6ACgAMQAzADIAMwAwADAANAAwACkAKAAzADcANgAw
ADEANAApACgAMwA2ADYAMAAxADYAKQAoADEAOAAwADAANwA5ADkAMAAyADQAKQAoADgAMAAxADYA
MgAwADIAMQApACgAMwA4ADAANwAwADcAMAAwADAAMQA4ACkAOwBEAEkAUgA6AE8AVQBUADsAUwBG
AFAAOgAxADEAMAAyADsAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAABcAAAAeAAtAG0AcwAtAGUA
eABjAGgAYQBuAGcAZQAtAGEAbgB0AGkAcwBwAGEAbQAtAG0AZQBzAHMAYQBnAGUAZABhAHQAYQAt
AGMAaAB1AG4AawBjAG8AdQBuAHQAAAABAAAABAAAADEAAAAfAACAhgMCAAAAAADAAAAAAAAARgEA
AABKAAAAeAAtAG0AcwAtAGUAeABjAGgAYQBuAGcAZQAtAGEAbgB0AGkAcwBwAGEAbQAtAG0AZQBz
AHMAYQBnAGUAZABhAHQAYQAtADAAAAAAAAEAAACCDAAAaAAvADMANQBrAFIANQBOAGQAZgBZAFYA
UwBjAHIAZgBTAHUARABmAFUAVwBlAGYAcgBUADkAcwBrAHoANQArAG8AaQBqAEoARgBiAGkAUQAw
AHMANABCAGoAZQByAFAAUABDAEEAawBhAGsAcQB4AGsAaAB0AEQARQBUAGIARgBMADYASgBvAGkA
LwBwAEgASgAwAGkAdgBtAFMAaQBWAFgAdQBrAHkAcwA4AEkAcQBUAGEAMQBlAC8ANwBNAGoAawBL
AHQAbgA5AFUAbgB2AGoALwBCAGYAbwBIAG8AeABRAGkASAAyAGwAbwBrAEEAMgA5AHQAcwBEAFoA
WQBNAC8AMwBrAFYASQB4AEUAWABkAHIAOQBpAHcAZwBmAFoAMgBTAHoAeABWADEAcgBOAEMAcwBL
AE0AZwBrAGUAZgA0AEcARAB1AGoATwBZAE0AWgBzAGsAMgBnAFUAZQBjAFIANQBLADMAdwA4ADEA
MABMAFIAUABwAFIANwBwAEYAbwAyAEoAYQBRAEIAMABDADQASABQAFEAQwBqAHMAZgBQAFcANwBV
ADEAZwBCAFUAMQBQAG4AbQBLAHEAWQBJADEAYgAyAFQAcwBLAE8ARQBIAGgAYQBOAGgANABSAHcA
cgBCADQAagBoADcAcwBCADcATwBhAFMAYwBTAEkAWQBWAFYAQwA2AGMAeQBkADIAUAArAGgAeABP
AGUAOQB5AE0AVgA5AHoAcgBxADcAVABGAFgAcABZAGoAdABJAGUAZgBlAFIAcwA3ADEAMgA3AEwA
SgBsAFAAOAA0ADcASABaAGUAZQBQADAATwBCAE4ARwBPADAAMQA5AGMAWQBVAGIALwArAG8AbQA0
AC8ANABIAFUASABFAHcAeABiAFYAdgBiADkAaQBKAHkAbQB2ADYAWgBFAHgAcABGAE8ATQB4ADQA
MQBjAG0AWQBmAG8AeQBwAEoAcQBSAGwAbABlAGYAWABpADEAawA4AFYAUwBzAEoATQB1AEEAYgBB
AHAAdQAwAFkAYwA1AHUAcQBOAE8AegBnAEwAdgB1AEEAYgBLAEgAbQBrADUAQQBlADIAVABJAHQA
dABvAEcAMgA3AGkAOQBIAEsAYwBNAEgARQBBAE4ANABYAHUAWgAyACsAdQBrAHgAWQBKAHYAcwB4
AFoAQQB0AEgAdwAyADEAcgBRADcAVQBLADUAbgBtAHEAUwBGAE0ARgBaAEMASABFAHAAUQA1AHMA
NABoAHIAbgBGAHUAQwBnAGIANABWADgAdwBpADQAaQBpAHAAcgBKAFAAUwBNAE8AcABzAGwATQBL
ADAATgBuAE0AUwBwAHEALwArAG8AeQBFAHoAYQBGAG4AbABCAGYAegB0ADUAUABsADYAbQBoAHcA
SAAyADYAWABxAGkAQQBPAHkASQA5ADcAaABWAFkAQwAvAHcAeQB4AC8AYQBZAE4AegBiAEoAeQAw
ADMARwBTAEUAaABmAHgAdQA3AC8AbwA2AGgAdABDAEYAUgA1ADgASABPADgAdgBxAHMAWgBBAHEA
OQBuAEsAWAB0AHQAbwBBAFgANgBqAFkAUgBKAFkARgB6ADMAagBnADgAZAA1AHkAbwBjAHkAMwBG
AFUAZwBEADMAbQBXAGIAWAB2AFgAagBaAFEAYwBNAHQAVwBoAFgANABwAHkAVQBrAHUARQB6AHgA
dAAyAHEARwBGAHoATgBNAG4AVwBrAFQAWgAzADEARQAwAHQAYwAvAHEATABQAG8AUAA2AGwAeABq
ADMAagBWAHEAMgAvAHoAQwA5ADgAWABFAEQAMwBEAEIAYwBiADQAbgAvAE4AZwBMAEgARgBzAGQA
WQBvAEMARQBvAGsAawBpADIAYgBKAGoAaAB2AG0AUQBlAGYASABKAFMAbwBZAGUASABVAEMAeAAv
AGQAUgBHADkAZABKAGEAVwB1AHcARQBrAEcASQBuADcAdwA5AHYAdABxAHMAeAA4AGEAbgBNAFoA
TQBhAG8AWABVAGQAOQBlAHMAYgBoAEgAMgBEAFYALwBuAFIALwBIADQAbgB3AEgANwBVAEoAbQBM
AGYAVwBhAE4AMgBvAEwAawBTAEEATwBRAEUAZABwAHMAcgB2AGMAcABMAGsAMABJADYANABzAFEA
YwBVADQAZwBYAEwAcABkAFQAMABvAE8AYgB1AGQARgBmADUAdgAyAHcAeQBqADkASgBBAEgAMQA4
AEwATQBpADIAQwAvAEkAQgBLAEUAegBsAEwAQQBmAFQANwBPAEgATQBKAEwAOABGAGMAWgBlAE4A
ZABOAHAARQBsAG4AYQBMAGMAZABCAGcAUABkAEYANABWAGsAaQBNAC8ATQBPAHEAVABZAE4AOABJ
ADgAWgAxADQAagByAHgAMwA1AFgANgB3AEwASwBvAG0AcwB4AGIAWQBOAGsAVAB4AFgAMQBiAE0A
ZwBLADEANgByADYANwBtACsAaQBBAGQAdwBnAFUAaQBJAFUAYgBWAGgATQByAEwAaQBOAEcAcQBn
AEEAYgBaADEALwA0AHQATgByAEYAYQBqAEwAcAAzAE0AegBxAEQAWgBUAEYAdgBmAE0ANQBuAGkA
WgAvAE0ANABYAEYAaQAwAFIAWABWADMAaQBWADMAMgBpAC8ATABUAHYAUgA5AG0AcAB1AHIAVgBR
AFQANwArAG4AVgB5AHoAbABJAGQAOABvAHEAYwBUAFUAdQBRAHkAWQB6AGgATQBPAE4AdQBlAHIA
VgB3AGEAKwBUAEsAWABnAFoAVQBRADUAdwBvAFoAdgBzAHgANABZAGQAZABhAEcAMQBHAEoAYgAy
AGcAZgBvAHYAQwBrAHcARAArAFAAQQBsAFEAYwBzAEIAZwBrADYAaAB2AEsAYwByAEQAdAA5AGwA
UABoAGwAagBkAG4AdABWAHYAeABhAGsAUgBMADIAaABFAGUANQBYADEASwBMAHAAUABMAHUASwB0
AEoAQQBsADgAawB5AGYATABXAG4AUQB5AGcAVABHAEEAcgBMAFYAYwBCAEYAYQAzAG4AKwB0AFoA
NgB0AGkAWQA5AGUAZgBzAFoAOQBpAEMAMgBQAFoAKwBBAEMAcgBYAGoARABBAHgAMQAvADgAdgBl
ADIAUABmAHUANwBrAEwAZABpACsAVwA5AHYAZQBmAEQARABqAGoAcgAwAG4ANgBDAFQATABuAGIA
YgB6AHAAZgBRAFgAQwB0ADEAVAA3AEcAbwBoAGcATABKAEIAWABaAG8AYQBEAGEAcwBJAEQAWQBo
AEoAMQA4AEEAVwBGADEAZABDAFcAUABWAFgAbQBrAGQATQByAGIAcwBTAEUAMwBEAGMAZQBwAGQA
UQByAEEAdwAzAEkANgBzADgAegBjAGsANQB1AEcAaQBQADMAZwBHAFYAMAAvAGIATABFAEUAVAB2
AEQAVAB3AEkAeABGACsAeAA3AFkATABrAEUAcAA4AGQAdwBOAG8AMQBGAFMAcQB3AHMAaQBXAGYA
VQBSAGwAQQA4AC8AVwBiAG8AOQByAEoAVwB2AHEAVgAxAGIAUABXAEkAVgAyADkANQBEAGUAVwBC
AEoARgBWAFcAaABoAGwAVwA1AGIANgB0ADkAaABvADYAaQBjADYAQgBCAFkASwA5ADIANAB3AEQA
NwBaAGoAcAByAGQAcQBzAEsAOABuAFEAUQBGAFUAYgA4AGQANwBkADYAaABTAGcAMgBoAEsASQA0
ADcASwBjAEwARQBxAHoAZgBTAHoASABLAFEAQwA0AE0AQQBxADYAawBkAHoAeABIAGQAdgBGAHEA
aABsAE4AVQA3AHkANABDAFQAWgBWAHAATQBUAEcAdQBJAHAAbgAwAGQATABZAC8AQwBtAGYAYwBY
AHIAdABTAFoAdwBsAE0AeQA4AGsAZABGAHgASABoAFoAcwBqAHoAKwBQAGsAOAAyAFQAMgBUAHIA
MAAxAHoAUwB5AGgAdwByAHYAUQBJAGkAVABMADkASQBpAFIAQwAxAGcANQA0ADcAYgBQAHIAUQBk
ADcATQAvAGoAUwBQAHUARwBuAGwAbAByAEEAMwBGAG4AMQBZADIAegBYAFEAcwBZAFIAMQB2ADQA
QgBBAEcANAB2AFIAZAA4AEQAMQBNADkANgA3AEUAVwBDADAAcABGAHoAZAAzAGwAVAAxAFkAaABT
ADIASQBVAGoASQByAFkARQBoADcAZgBnAFMAMgA2AGQAbQBpADkAMQAAAAAADXQ=

--_000_CH3PR22MB438518FE39766ACDBFE6748081D12CH3PR22MB4385namp_--

