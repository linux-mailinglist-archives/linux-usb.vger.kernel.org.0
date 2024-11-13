Return-Path: <linux-usb+bounces-17524-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 539B79C66CE
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 02:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 856A8285B9E
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 01:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F4E2B9BC;
	Wed, 13 Nov 2024 01:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hidglobal.com header.i=@hidglobal.com header.b="dr8G0OBK"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2044.outbound.protection.outlook.com [40.107.241.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4606BC147
	for <linux-usb@vger.kernel.org>; Wed, 13 Nov 2024 01:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731461923; cv=fail; b=cvBp8Hvpy5zmrt3By+ddhv30vmea6+9Qr9QYUPfapmTaXbl6Y8vZhgyBKy17xyk+4eLe/182HkdoNewp58mjh0vesdzZYzFJRBPz2yXx/LK45vGXxA3aty93FX8fz1xyA6a9Rc3xjwq6S534LYJJF7RmG9JNerPUC9tQYLYGMzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731461923; c=relaxed/simple;
	bh=vynKySQB4VAV6qZabvF0RxUFZT1tA8ycBCeAwryVQRM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fvjvMJoGXEStL0qoqwJYxY3bSpTKMD3JVEFcDHX0VsltXYWhydrmKpF5H0/gVhthrWZhgcYBE3sxyjUF2oqd68kNbVuEpTTAqx+/wZKxqscSHjT8LTJG2wb7wymswUc2Zor9KfdmWZgbe81Pr/VumQjk3IboNAiqy2OR15/SUdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hidglobal.com; spf=pass smtp.mailfrom=hidglobal.com; dkim=pass (2048-bit key) header.d=hidglobal.com header.i=@hidglobal.com header.b=dr8G0OBK; arc=fail smtp.client-ip=40.107.241.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hidglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hidglobal.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkzD5QMGV42Oylx5/ccYHyqSAcwILWwo+16RAh0rVjnRbPIBshzipA2cyRKtfxl720ljJLFXaR5Z6Y7AGs5pSR9V7qp7qQeMlqREXD/uaBLuEEnzBE+hQXm+D0do6e0fb9rGfWuPSoWlFX0BfX9yLKeQowCNqC/rAz7VWLLy7Wxy26rsXB1fwRrWIP6dgq4kfNufuzV918FNu6qoq42Fii/YOzFsnlRujJNJMiiM5xpUqGtcP05A9BlR3svIzDRm45Sg0+nV47fVXkB9Qp5ZB/0zgKXenA4I+1QaPu5UNUqPHgHsdSaQw2TbiYPwJjqL2Poepg8rIYCiFvpeVhQHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3YV3uiJpvaJ7aNH/xL3btxKs4mnEg8YFslPKvfpDbc=;
 b=iv0XBDJtIIWTiDqLWS+KYO4rDm5CuiTP4mmFxL6eR6WI+S/4KDbOLZDAPstIEv9Q5l1EmO2infKjn70SUGfTDro4v7pqv2XrmnVeExXfSAf1m2581TYLwdQiSzLeg7KxpkFPrbHzwQMuDexXzoZSecj3scR91Zjz3Zj0mlEWXk2WZt3ehSW+RvfnMmOJtgUpHlvC4UeotwC/p66Oft8iXalvsjwoftdRRjaC14ku2xaBsC3UGdHw/Z++Qgl/ySDic0w9yfy8MmJ9/YbAXd0MFBoKTQsznh3axk/bznOInvOCHMJ7frPrqgWEC4jUneE6WhRdTrLgb5zSAhp6Lb5vvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hidglobal.com; dmarc=pass action=none
 header.from=hidglobal.com; dkim=pass header.d=hidglobal.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hidglobal.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3YV3uiJpvaJ7aNH/xL3btxKs4mnEg8YFslPKvfpDbc=;
 b=dr8G0OBKcGp8H2/Jn5RQJHw79+i45RPsJeO9S4VvwcXplh/HDvI0TjrbdZJ0oADpQP/NcTJzA/APSJHKdKP3o5IKMAX07nsEbhfOoGoLQv/CmpEzMxBQu9FNm6bISlJYQcxaLeQt4tHThIwb166aIbtvQI9EGeskpi0OuKqvGW0DsB56YWiXFVGvoOs2iXWOab8Ta/IA7byr56mAghUnaHvmy5JaRXWNfKE2J9fJhkW1t8A+2aotR5fVh+t2wEuUmWcnUPfxvZE++pOqGfi5pXGVjZcyZ2fuQoOCVOqzI5HM3kA0ntL/8roYaE4kAfKFk9QspFUGr1nshkZEZN20Vw==
Received: from AS8PR05MB10129.eurprd05.prod.outlook.com
 (2603:10a6:20b:613::16) by AS8PR05MB8422.eurprd05.prod.outlook.com
 (2603:10a6:20b:3c9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 01:38:32 +0000
Received: from AS8PR05MB10129.eurprd05.prod.outlook.com
 ([fe80::5e4b:699c:6250:8022]) by AS8PR05MB10129.eurprd05.prod.outlook.com
 ([fe80::5e4b:699c:6250:8022%4]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 01:38:32 +0000
From: "Vodicka, Michal" <michal.vodicka@hidglobal.com>
To: Elson Serrao <quic_eserrao@quicinc.com>, "Vrastil, Michal"
	<michal.vrastil@hidglobal.com>, Greg KH <greg@kroah.com>
CC: "balbi@kernel.org" <balbi@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "Vrastil, Michal"
	<michal.vrastil@hidglobal.com>, "stable@kernel.org" <stable@kernel.org>
Subject: RE: [EXT] Re: [PATCH] Revert "usb: gadget: composite: fix OS
 descriptors w_value
Thread-Topic: [EXT] Re: [PATCH] Revert "usb: gadget: composite: fix OS
 descriptors w_value
Thread-Index: AQHbA+aNCId6JjTJskmVJ1TZT1+WnrJV3meAgCDduwCAE4nYAIAqDrGAgAB8KwA=
Date: Wed, 13 Nov 2024 01:38:32 +0000
Message-ID:
 <AS8PR05MB101294B2A8C89EE6F9154B3398A5A2@AS8PR05MB10129.eurprd05.prod.outlook.com>
References:
 <AS8PR05MB10129E57ED13CF18746FC4BE18A9B2@AS8PR05MB10129.eurprd05.prod.outlook.com>
 <5f8cdcac-6927-429a-8ef5-0891c90e8efd@korsgaard.com>
 <2024100457-able-sake-47fd@gregkh>
 <9918669c-3bfd-4d42-93c4-218e9364b7cc@quicinc.com>
 <7bab2899-9150-4e8c-9a96-b1bbf20f4d61@quicinc.com>
In-Reply-To: <7bab2899-9150-4e8c-9a96-b1bbf20f4d61@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hidglobal.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR05MB10129:EE_|AS8PR05MB8422:EE_
x-ms-office365-filtering-correlation-id: 2f590fab-646b-43a4-cde2-08dd0383e1ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?XtELAvfXbhzecEqN7rrMK7oMb/wlra54p8qktncz4ckS2PHkwNaOwVvxB615?=
 =?us-ascii?Q?8+EPxQ42dN3wJWF0bzqt1ic1/iz6GKgRNR2XnNFVcG+CFZ6Wr+6vvyNtlXzF?=
 =?us-ascii?Q?hjNRyQorhmnTHcShRT1Z25VoHst9i1UwryqsTh4hf36jLUNp8+2EfKcy5MTJ?=
 =?us-ascii?Q?4KwkMfsbDqYh9plpfkHBY/YD09FfMey5iIsJQ0o1/4k6LCpoDRAWg2HJ3HME?=
 =?us-ascii?Q?9z/Xi2f7Ghh8I1J8szisJlr6ee1yli2p4exgiYm65G9g3xK4VME/XpWy69XV?=
 =?us-ascii?Q?u9otmNGMMZinH421T0xS++s9eXKK0CaASTbpT+smoAENCAAzuuLbskXKx+Hh?=
 =?us-ascii?Q?VlhSK074A/p+cC1PA3Zi+65UsgWBpoAeLaxUD9RpNoy/AW9bXwiGYdTL087F?=
 =?us-ascii?Q?OWgmkk6G5W9UiX6Qun7gWmq/7qSD6ohn8tad+3qNBJWPMIyQmBXNi08mAGad?=
 =?us-ascii?Q?vBnvK6zkH9b4Yp5G6gEt8pPqqkA5xYr7ZPWyE+rgpuwNt8TbUeoepq7qFdCC?=
 =?us-ascii?Q?tyE2MNlOLEDiOFAfg4NlOUF60CvhbecJwaK+VRKRMfXlht0naaa1m7vVGHKB?=
 =?us-ascii?Q?9I2XcFX+X+UwGDL4cfiGAAO4brj3X9uC1ydAy69NqvBXRsgyGoRe/Dehvf7b?=
 =?us-ascii?Q?Wv/64jVVkszcJRp6GbebG0w3zTzmuS0AHDDNqIM5RTC0rb3XHyfkM5TDrA2N?=
 =?us-ascii?Q?ucZ4MrPJKuHTwRijXZYcU6a3K1FA8cN4JyLK1DvEjGhVyYicnaXBxSedQS6K?=
 =?us-ascii?Q?jY6c0Lxxe1fmyIDCGmtxx30HI4kDBJRAdeESIAqXkUvGWpunco5+zarByCI3?=
 =?us-ascii?Q?mSmYoWWdKSTfUngMBvwAAHt3qgYS656LYb5zdtxt0HOOI03AGeYjMgwEA3ZU?=
 =?us-ascii?Q?4Lz4Lpos/OZI/PjrdIxJ/kJJ6L/cnoNDQy/bx2wj8PFFcbvf6k+xSGvbCoag?=
 =?us-ascii?Q?olWsNn2yOBSTJJU0DiSAJW0xF+8SRqtFRJkiywdIKAa4CXAcCFjsz5KEy2tr?=
 =?us-ascii?Q?DQDsYv/vWljDvoIilkWbgeo5gn5HAiEYo1z43tQIpDue4VXlHbpX1gf96El+?=
 =?us-ascii?Q?JO92wxqaRu76SZYpmt4UPf3w+T/9Oy1ht4QlxQ8cjtrTfXkbQ2CZeIQeL6DQ?=
 =?us-ascii?Q?NhMzc4Db3EPoL4yLc0ke5rOnCs4DhkFiMSiOld+pT4Sixe4vFE4iJbG4UYov?=
 =?us-ascii?Q?qZFNJo4RRMQkle1Jm8cz8/qPmmJkFjG5QhPIHdP3TzPPxGbU19Vi7TiA8/fa?=
 =?us-ascii?Q?bb/fxzDg88RwFQqoo/fAGeIqe/21NV2ENTEIxotOQH8aSP4XWR5N6eGkpVeC?=
 =?us-ascii?Q?4YgMZori/84xdca/oMGm/1ChXXsmqTdisBACBMVkky4aamsGBU8s09YOhMgM?=
 =?us-ascii?Q?cbr6iBE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR05MB10129.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xb6zNv0FKr9CxJfKKOw6hBzzJ0ris1pZPO2pD5MKYIDCZdJzYChCV5v5GSbw?=
 =?us-ascii?Q?Of35R/hM2Ga72dQb2y5I6J40dV1xV2dWXxygD24VXJmt4TRsxfBxHdXMzlKp?=
 =?us-ascii?Q?HZAS/QobjHOlaaI3V8XRQdXEnFoL4ZXrHdB8NsH8JvJEfRpqej4X+Q4Fz1vQ?=
 =?us-ascii?Q?TlxhmIGHUHaoUEg+qBbnBLXe1NFGi59SGJv6vQxhSQ26sFIXRChvfD9oQEC2?=
 =?us-ascii?Q?ywqlLyYnczilv6CNYft16WbKKCeH8ws0huVTN0UbDlaAkbXNIlfYXE+fW+oA?=
 =?us-ascii?Q?s7sS3W95gDGM2IwlhmIqLNh4HhMsBQzqeWYNu5wgci4M4fAL4UbNWbqbQb8v?=
 =?us-ascii?Q?/O2/9ZUheJMTaD7EEiPS3QPnJK8GDjibniAJoPmtgyR+m6/K0ZT1omTfyYEZ?=
 =?us-ascii?Q?AtENtVPgCcOuzqo6ua0yJvokHTgid6aWaOQGD4zALIakHZPDNDs+EGGuY3lN?=
 =?us-ascii?Q?7y9JX4Ni5nyig8bXtdqt6rspCtHjJKyD12pJh+LX2d32izKhNmdO2++7yQ4v?=
 =?us-ascii?Q?UjqyFsguDu1JGq7eH3H7IH8eR0JdxolbNImb6vUByK/IkXy5sgh5ZzlgFlBR?=
 =?us-ascii?Q?Cb8Jbzg9RDCuS/lMv0kXRg8bGsy/S3zMpGwsHi1OjL/hm7R71A/u7OhHmMa1?=
 =?us-ascii?Q?BMegaGVli2+W9FSVghfu8orUDIASXyPKNdfyTs0Q/kF68wxkCg2EjS3Ih/pv?=
 =?us-ascii?Q?3wkdnTdsjPnObH1E/vHgHN+QA50JAIdqPSNxilk5NvCMqulbPkaUmu+zVG1C?=
 =?us-ascii?Q?+kRRMFpWrO6vFYmvQSRgUzPbhwkW6qwex0ntxnUOj2885DGkjijjJMN5oyPA?=
 =?us-ascii?Q?4t1ajStAYRbwbniTxdcGSAj603L6XgWY+qE2YKyaVi7b3mV6hBXYBVepkxj/?=
 =?us-ascii?Q?DpI4XVcn3joPjcrneYTKOA0zIWQZo4/u5ZZvER35xROxRQYEIQN/9XACtvn+?=
 =?us-ascii?Q?zve2J3J/BFWyuv1mc0Z4AvD5RtiKqRAlj3XM596BmZeBUtK2gd8bU7gB/6O/?=
 =?us-ascii?Q?Lhylpuo7AtP/sx6EhlLa50VhchOMFMgIRpn8xpERvmoAIsfN9OKtsPiRqPzm?=
 =?us-ascii?Q?+JrJ+5g5/PkduQdJsHfE5LL6ThoGd/1FQe7o5wX7nzv7YyQjQeeWeu1rhfFa?=
 =?us-ascii?Q?yCdtiudDMGJulR/rZ9youkrN9tZbiGT2dU/LuXMikaVnDiFRp6yNOTCxxJUJ?=
 =?us-ascii?Q?CzQV4rwW5sKwADGJ87QlLH4wNCXHpy2IE39WEzzGuMDrs5vLoSDbuZoJMJ2O?=
 =?us-ascii?Q?A9fspFkIK0tSK7eX4HTtfsjy6uM22M7MTp+JEsAlZZkqLJgVSpZT3n8DKs5e?=
 =?us-ascii?Q?DKtA508Egq7vcCqGniN0OAU+lqcYwRDNVS6NSGSWBxyITYoO9TXuAbuBqFTs?=
 =?us-ascii?Q?blNEfiRLugLnKx7czZEXXolmtBm7Ae3J2edNsmLzj29EeDAulpjmtRLcIuCi?=
 =?us-ascii?Q?u9ja2ceroaBQrbgPYf1I/nrrheOZLOSd3P0U6BZI7zl0aNVAfZQTq+q8RGVk?=
 =?us-ascii?Q?hNp2ok7k9rgHjU0OaWVoALJx7beKmjt4+IEDeJfUToKl1xa2gtYMyPclMGOs?=
 =?us-ascii?Q?UosobXpIEnG3w2hjngXTp1gmfXGznRT8yqz5xINq1t0ooqnhSIeGRzJsMtyO?=
 =?us-ascii?Q?Cg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hidglobal.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR05MB10129.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f590fab-646b-43a4-cde2-08dd0383e1ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 01:38:32.2154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f0bdc1c9-5148-4f86-ac40-edd976e1814c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OYYYpisM+kV130z124/CcgHQgxs8MqLzaGkRQBJQZ+oH6B8Bp/hkfKVOoFyCD9hJo5O0AyVsz3bKpl+cRBIqVhOaNW48n3vJmluT0ALpo28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR05MB8422

Hi Elson,

Sure, please finish it if you can. I had something urgent to do, postponed =
it and finally forgot...

Thanks,

Michal

-----Original Message-----
From: Elson Serrao <quic_eserrao@quicinc.com>=20
Sent: Tuesday, November 12, 2024 7:11 PM
To: Vrastil, Michal <michal.vrastil@hidglobal.com>; Greg KH <greg@kroah.com=
>
Cc: Vodicka, Michal <michal.vodicka@hidglobal.com>; balbi@kernel.org; linux=
-usb@vger.kernel.org; Vrastil, Michal <michal.vrastil@hidglobal.com>; stabl=
e@kernel.org
Subject: [EXT] Re: [PATCH] Revert "usb: gadget: composite: fix OS descripto=
rs w_value

[Some people who received this message don't often get email from quic_eser=
rao@quicinc.com. Learn why this is important at https://aka.ms/LearnAboutSe=
nderIdentification ]

CAUTION: This email is external. Do not click links or attachments that are=
 unexpected or from unknown senders. If unsure, click the Report Phishing B=
utton in Outlook.

On 10/16/2024 4:55 PM, Elson Serrao wrote:
>
>
> On 10/4/2024 6:33 AM, Greg KH wrote:
>> On Fri, Sep 13, 2024 at 05:39:21PM +0200, Peter Korsgaard wrote:
>>> On 9/11/24 03:32, Vodicka, Michal wrote:
>>>>> Hmm, very odd. How are you testing this on the host side?
>>>>
>>>> We just attach the device and check the registry values created by=20
>>>> OS for our device. As=20
>>>> HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_XXXX&PID_YYYY=
&MI_NN\<device_instance>\Device Parameters.
>>>> When it works our extended properties are created there.
>>>>
>>>> We check the communication using USB analyzer which clearly shows=20
>>>> wValue bytes are in opposite order than documented. This is SETUP=20
>>>> packet captured:
>>>>
>>>> Offset  0   1   2   3   4   5   6   7
>>>> 0x000   C1  A1  02  00  05  00  0A  00
>>>>
>>>> As you can see, this is interface request and out interface number=20
>>>> was
>>>> 2 which is in the low byte of wValue.
>>>
>>> OK, annoying. I am traveling for conferences this/next week so I=20
>>> cannot verify here, but presumably you are correct. Do you perhaps=20
>>> have a more complete capture you can share?
>>>
>>>
>>>>
>>>>> Could it be that you are running into the WinUSB bug described here:
>>>>
>>>> No. The mentioned bug is in wIndex and out problem is wValue. Also,=20
>>>> MSOS descriptors are read before WinUsb is even run.
>>>
>>> Ahh yes, indeed.
>>>
>>>
>>>> What Windows version were you using and have you used USB analyzer=20
>>>> to check the communication?
>>>
>>> It's been a while, but I believe Windows 10. In the end I ended up=20
>>> shuffling the interfaces around so the one with the MSOS descriptors=20
>>> was interface 0 for better compatibility, so it is possible that=20
>>> something went wrong with my interface !=3D 0 tests.
>>>
>>> If so, then I am fine with reverting, but we should probably add a=20
>>> comment explaining that the documentation is wrong.
>>
>> Ok, Michal, can you add some text tothe changelog and send a v2 for=20
>> this?
>>
>
> HI Michal
>
> I am facing a similar issue where the Windows host is unable to fetch OS =
descriptor from the device running v6.9 kernel with Android mainline. Teste=
d your patch and it fixes the issue.
>
> Host Machine: Windows10 22H2
> Composite device: NCM+Android Debugger (ADB)
> Issue: Windows host is unable to fetch the OS descriptor for ADB interfac=
e and hence ADB functionality is failing.
>
> Also checked the USB analyzer output and it shows wValue bytes in=20
> opposite order than documented i.e interface number is in the lower=20
> bytes (for Extended Properties OS Desc)
>

HI Michal,Greg

Since there has been no update for quite some time, would it be okay if I u=
pload v2 with the feedback given ? This bug is impacting ADB enumeration on=
 Qualcomm platforms, so would like to proceed with this fix.

Thanks
Elson

