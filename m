Return-Path: <linux-usb+bounces-16734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAF49B1676
	for <lists+linux-usb@lfdr.de>; Sat, 26 Oct 2024 11:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7554E1C213EA
	for <lists+linux-usb@lfdr.de>; Sat, 26 Oct 2024 09:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17481C6F72;
	Sat, 26 Oct 2024 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mbcIEuxC"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011040.outbound.protection.outlook.com [52.101.125.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188C1531D8
	for <linux-usb@vger.kernel.org>; Sat, 26 Oct 2024 09:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729933989; cv=fail; b=ERWzDJfmphqS4lbTGsZtUI5QKT1RERyDOQYDWBWM804t/s0EvCLY97tY9IwNCLFYzsb/WnqMfI8NgXs7jiuuDEQJWq1ltZkydwa7XbYUNVZDIzUVIJjcvfxJcwkN2YvSNUe0QTHMT4jxudhbtZeWjfA4m9vzjSbbuVm9QV5ufKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729933989; c=relaxed/simple;
	bh=28ob5Px/gxXE+Wlnfovk6/E1xyH9xHXGnG4RWclLWbg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HymzvZ6noqYwDKz1OOPsBI/75zL3CnWl1SxnCm1a0bk68GNvmgwPH3o5nS5UN24QFyjTBbcz6nWLv3xycmk0bUcX6PJEIMR8yCpXB+Iemu7Fvw8r+RdJapf8jPj9S6yhSmTMtvbWCaF62ajZJVCs4UW36mjQGb2PgaMsIq07Pvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mbcIEuxC; arc=fail smtp.client-ip=52.101.125.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQw0W4wAkB7QuTZDapoFbhcIHRHvRH9bE8C6KZIhvgE8fW8Y2wHqeod1ID1caM61n556idjnfzSm8CxjsmbJi8CO8hG2d06tJux6z4vnhWjIagYSrkE4xDysP7ugGOpQfmNH+Lip8PrHr0XF8TmKDM3Hbkzuq10NOupZ2aEEaph1feoHPDu7GNwcRU+ZaOJ+rCG0XFD6D0LbGXn8ia+Xg689b6ehD4fN9Mt9T1U4kOeqQe33RWpE3mc2gXhlEgfjjIJZl1ujuqrQwq7/U1ygG65UXKPxldoo3LQo/ZYuq8mafl8kh6eb+vv/0GkQ3rq40tEPmTxXxyzZwoq5qA0AqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28ob5Px/gxXE+Wlnfovk6/E1xyH9xHXGnG4RWclLWbg=;
 b=KBfRvcPwu+AVoh2XlF6ljs065CMgRuTUtPajonLzPi55ZVYX48usUjTgVkIB+ugG3pto6N4NUd8pN0FykuMjlkpsNxTO67NZwmz5INDEeQzibqwQn/ZVVG+7kOaJfhFhRzmlyIE/wAHB+ng0zQEKrWTE+YqHAJkjhEU62JtXe6rSvVupfw/xzEaJeSwG5qmUhxgXiXPStwFhuTGSJVrcAEVF2VkLr6xz5/wIsrLO11FAqD8T5qtjeAIvhPdgFLNvWNjRETdUJAnYhQQ8CZYJe3qOu00R8duFIAopu24PTlMv/w8e5buDCAC8Lz56e8R3GfaxPuMyEDtO45OilMY++A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28ob5Px/gxXE+Wlnfovk6/E1xyH9xHXGnG4RWclLWbg=;
 b=mbcIEuxCmOamDaOSjIVv6sjoBsgOwG6PkUaXBeNIN2Wfhn2H9/RzjZMP6VtbODkpgP9RBd1YKRu3g54//08FSE0luOWC5henYfeGNC2zx+5aDSB1wyPUd+/wVN7Fq91Is6IyN7lSdO4D6nrCmfpCP5WKM0fEZNENeuIe2aW9ISY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB12023.jpnprd01.prod.outlook.com (2603:1096:400:37b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Sat, 26 Oct
 2024 09:13:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8093.018; Sat, 26 Oct 2024
 09:12:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: =?iso-8859-1?Q?Facklam=2C_Oliv=E9r?= <oliver.facklam@zuehlke.com>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"biju.das@bp.renesas.com" <biju.das@bp.renesas.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: usb: typec: hd3ss3220: request on how to test & submit a patch
Thread-Topic: usb: typec: hd3ss3220: request on how to test & submit a patch
Thread-Index: AQHbJyi/WCP+Mntp2k6VYcyiP+sjJrKYv1UA
Date: Sat, 26 Oct 2024 09:12:58 +0000
Message-ID:
 <TY3PR01MB113467340961ED0CA63B983CB86482@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <ZR1P278MB1022FF5D5D123ED7C07774A79F4F2@ZR1P278MB1022.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To:
 <ZR1P278MB1022FF5D5D123ED7C07774A79F4F2@ZR1P278MB1022.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB12023:EE_
x-ms-office365-filtering-correlation-id: fcdf9a6d-5537-431b-8c5b-08dcf59e6254
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3FVqnNLTFnTfpSp0TsgJE6UqP2z5a74QlXdv2+/Fxg9P+y6FL3nOvoAzDa?=
 =?iso-8859-1?Q?5ovx+ANtvdN6QWNk4GtfRTdUb04JA4BKN5OynYd2aVAZA/N8HkzO04FB2f?=
 =?iso-8859-1?Q?PG4A4QJpT8QWiva2p3+b07WQYvlO0tZmf51l6mvf63PEHDKT4/84jxVcHw?=
 =?iso-8859-1?Q?vaYdxMPG5FsygCV+61OZssx2RdgZOja3np0xKy5fS2/k4Sr2lXfMKrD5e7?=
 =?iso-8859-1?Q?xoC6dP1UjkeZlgcwsYeuWuC6TGCeh7AtmCvGBwjN7+xT+X9tyJe82ZK5oq?=
 =?iso-8859-1?Q?t1YYTAR8soiY2cN2v55IGGZd9bxe/0iKNpdqRGwG8rA8YVulBvv7AzL61E?=
 =?iso-8859-1?Q?84XRrJZ7o6taev4Ad0I7mu3XrMSBzEP5Dj3tOFJ3iL6ZnPzyHLBHP0cFiJ?=
 =?iso-8859-1?Q?S/4w28dCGbdHgnhnBD2+DncJQHsBRlazD50aThmsWKZudyeZTSQ9GE4Ip/?=
 =?iso-8859-1?Q?JvMFWFnTTdDpP0muBia0HjrUDH+hmP2KSk29knD8RTfPiL3lZBiCJlEIER?=
 =?iso-8859-1?Q?WRlQ/bM3ZxMWW59fXy3FvWa7anL+SZhatwDkBuoA1j1w7qgodDOk2ciJd3?=
 =?iso-8859-1?Q?ry+A+kPLyncJQLw6NNLBfAPKaeOn5rWBjoykS/PWsB3o2hGbe3PHK676hd?=
 =?iso-8859-1?Q?JrGZd+96RwWEVxRXQaRsN9amTaGMMqfTDvtawGiVNFz51hEjlg+yfXUqMR?=
 =?iso-8859-1?Q?ZV6ZcCZXNT0sTEsLpHxOgokLoMAYN+0P2EPVTzArSUs4pqjUrZvEHPmUfb?=
 =?iso-8859-1?Q?sL1n8Jvsk9Q2ECzFNoE/Xe2NsJvVZiIFlrqgseJYPGvJ9prBxOxHRxy4W4?=
 =?iso-8859-1?Q?tmTtXX3lYj8QRo9UmEmWbAaFPg6gf7IpRpLWrz/KhBFsMGv9ucF/o/BIkG?=
 =?iso-8859-1?Q?UhcXda4/WpyMbq07BofXxzKmAz2MBLjwLKRGg7H2notW6fCSGDx6QjoXT2?=
 =?iso-8859-1?Q?eueNQwWP7MU4AnpZOIj9e1ehi4tCedtRSPLN9mmS7SsdJtOxEtuzZ8Gw0W?=
 =?iso-8859-1?Q?egVY/yL0/MXFK+kXf1Et2+fZih3pCr/9l9DldLE2wJreQkYJhnaIJ9ULM8?=
 =?iso-8859-1?Q?oU9sYOtUVfOCtCwZ8lzojROIkvEv8B3iMoLzUoxsKF2M/L1/1rn2rysVmq?=
 =?iso-8859-1?Q?NIfx1nEK54QszeqSeVOFAOdfkJ4agZ31Bwo0HhwhPuwqq/CJ5/AcBTJvKK?=
 =?iso-8859-1?Q?VpLP5hywALYnJq44dhT5Naim8S4yjSxHWRSV9WFm2SB9YmQF3kFXCc4esG?=
 =?iso-8859-1?Q?BA3USM+5YJd3b+dbua1M753MFcYl6t+I1lPMVkJY45NCD9aAO7UX/YFrQP?=
 =?iso-8859-1?Q?WD/0kG0okY+R460GAQL6mY0rUDUOOxfCbZjyh9AjqXjJ3C/Fa4dKZa8/5D?=
 =?iso-8859-1?Q?IK/KN2gZ1O1DmRuXUDCsRIN3SV0E5UogJjvy0RpeOeEf7214t7DSAKrmdN?=
 =?iso-8859-1?Q?3xuPKpBfM9geOJV5?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?iWLZtcpHeZms52SGzF1ie9/fNfCrVf4YiTN5qBwHIf2b/mUvFCsw9+wyht?=
 =?iso-8859-1?Q?EZ+3XthzG5yNCxLVpfQtpKAOYnOad+QYj+77luOt2UQ+s55DlXjfi12pPJ?=
 =?iso-8859-1?Q?l7a12oArqjGhLrpQZsTUfccfvPHmOAH2IOY0wMbrLLaxax3c/L4jamdFAW?=
 =?iso-8859-1?Q?xnAZT0jtgTV4hT9oR3F4pzskxcWLObbj7QRVbygfjnJbV9IBzf+w3yoQpD?=
 =?iso-8859-1?Q?sWSRM2Gcze2Fdo01YS+QR3emzh+V10gDIWrfaMEbLCquZvBrYRzsHoA8Yn?=
 =?iso-8859-1?Q?APbrhr//OOkUDJq/XCRZJ0zB+Ut5HRXYazudK/Jm64y8sG9EXli0MlxiP5?=
 =?iso-8859-1?Q?L7OhoCWQaFNcXhf1GcXJbMDgC+eIZAwX65rdu861XbTJbCrFetS6x1I9Je?=
 =?iso-8859-1?Q?G9CsRTgDaZpAS5nYc5EGBkfv/QAdnhyz7srkL9HGPa3RTvjm5Wiz/Ke4Iy?=
 =?iso-8859-1?Q?rN5NV0YPtRXc16BW5fg1FJ6X9URR/2BEp5r5lQV9M2IZRJPpyNOFmGNdff?=
 =?iso-8859-1?Q?h1DRoGkDf6sxKVn9D6YopEIcJof1AN6u9RmXTooXH1vvS9Zh/JCvKe7CGJ?=
 =?iso-8859-1?Q?LxZnqoonf0BbnjFapc5f+tMR4EVD4PJADZexk9j+bWXYO3Pmp0EWijiP1S?=
 =?iso-8859-1?Q?2m171iVG8ZlQ6x54YLu5mBRUS2uxt3TUITexABtK2rIWRdwp2p9VzAGoEq?=
 =?iso-8859-1?Q?iuFZk8FThCyYwbmVOBc8v19ZDLiZmXYMJxWSV2oHixFZ46cdOneKs9im2p?=
 =?iso-8859-1?Q?JO7UBTDZRmaD0AN+/O/BPvWirTS2gu6RUsl42BBLlcMF4pe5qNRoXp1ZQ+?=
 =?iso-8859-1?Q?+b9QOiAJEfl4nYoC0sB6NCgUchKYSpYjJMp1OO8NJuRlxaYwN+v6fNVZ9p?=
 =?iso-8859-1?Q?tc3YXRDvLuTXJydrA4C/DIozjTj2uXqquhoMzeKAGO42qczgWxnYuEffZu?=
 =?iso-8859-1?Q?hM5qAN4mCQfewWaXOLiXC7sDcEw5vBE7D/oo+UaQKCgPxhAXVGJNZIcAFs?=
 =?iso-8859-1?Q?O0rnGgx6No2LjWPR4BQZrFMfNGa1n+S1MNenKNi/hHFP2llXRR4rD7+wnT?=
 =?iso-8859-1?Q?WVnrbG5Pm0CepNRveEB5Ilt0iu25XFvmjFKEZ+qvs9KTQY+vQae+UBK/Oi?=
 =?iso-8859-1?Q?4tDIamCnmzht5iFlnmOpHWJcfQQkMH0yvh4VsD8KK4oa5d5d/53GdtCPH+?=
 =?iso-8859-1?Q?QPEzVNY02hq7OmmFTL+p17+Vq1SyZ9Z9P638nPUySK82YSuQuOIXi/djJA?=
 =?iso-8859-1?Q?GpDw/DAECcXdipMTcN5q86ldzSNLxVxFVwZiI/zGNe7qISIgS+XkA0lME+?=
 =?iso-8859-1?Q?ux61i4LceKHpl3c3Sn4fLTykR4aqjfS7qB82pqjRlQFY7+hARUJvPvNPR/?=
 =?iso-8859-1?Q?cGF6dtwgjlRV7MZXKysRy1QqR82JVMmdTt47d6X2uN419aR6BVL4kMC4T8?=
 =?iso-8859-1?Q?0caJHmUWdgz42asyp+C8qJR4uWkxwncumxX0viPNjxNFfpiqnPtSRsYNar?=
 =?iso-8859-1?Q?fu5r7NI+3vgkBU4scVo9LcFJDqL+ppm9NCgeKaPWq2mWirR+tqcsnr93RD?=
 =?iso-8859-1?Q?/x8Wx/B+pBfjNmZB1DKO0BKRYkMDa9AfhJ+h5nQnvwa1TphwA7p6M+AGXv?=
 =?iso-8859-1?Q?mS83hrHOWPqNOzGKU0ggO33TBS6uyEVKWnX8ILZ2OzkXxIohxhpA7mBg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdf9a6d-5537-431b-8c5b-08dcf59e6254
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2024 09:12:58.2687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1hQC+KskxKaYNPHhWR/aYI9W3L88sT/q9GfAdrjEpORfwtm0ApV6EaVXa+Dw2EPAuanMWyOciq2BV6VqBocrkzkgLpToydgj1PWEMq0ccmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12023

Hi Facklam,

Have a look at [1] and [2], Mostly you will find all the information you ne=
ed.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts?h=3Dnext-20241025#n208
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/drivers/usb/gadget/udc/renesas_usb3.c?h=3Dnext-20241025#n2941

Cheers,
Biju

> -----Original Message-----
> From: Facklam, Oliv=E9r <oliver.facklam@zuehlke.com>
> Sent: 25 October 2024 23:02
> To: heikki.krogerus@linux.intel.com; gregkh@linuxfoundation.org; biju.das=
@bp.renesas.com
> Cc: linux-usb@vger.kernel.org
> Subject: usb: typec: hd3ss3220: request on how to test & submit a patch
>=20
> Dear linux-usb mailing list,
>=20
> I've been working recently on a small patch series for the TI HD3SS3220 T=
ype-C controller, adding a
> couple of features.
> I was thinking about submitting this patch here.
>=20
> However I developed my commits against version 5.15.71 of the linux-imx k=
ernel from Variscite [1].
> While I can rebase my changes onto main, I unfortunately haven't managed =
to get the mainline kernel to
> boot on the hardware I have at my disposal, so I wouldn't be able to test=
 those changes.
>=20
> From your experience, what is the best way to tackle this situation? Does=
 anyone have this controller
> available for testing purposes?
>=20
> [1] - https://github.com/varigit/linux-imx/tree/lf-5.15.y_var01
>=20
> Thanks
> Best regards,
> Oliver Facklam
>=20
> PS: sorry about double-sending, my first attempt contained HTML...

