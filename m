Return-Path: <linux-usb+bounces-13182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A0994A16A
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 09:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DE04B26B86
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 07:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5081F1C461B;
	Wed,  7 Aug 2024 07:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aLoeoiEL"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013050.outbound.protection.outlook.com [52.101.67.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672B01C3F35;
	Wed,  7 Aug 2024 07:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723014752; cv=fail; b=HBAwurqkt5NmzPXvRRel2298yEhCqfe7iWgIi25p5B/Eu5yFdjzXESUlkNWBw4+eXJ4kWIhGDpeW7nadqXk5Lc1FLTSeHkESQveWG82/RmC5UkH97jr+RUFg5YsJf92RsufWonUIxfTRBToFo1ReKz0UsnLGW9MUu8J8EjgXuVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723014752; c=relaxed/simple;
	bh=2g+n79OBrrWAimAvE/7JlSYO8Pp+taqlpseGOsrL50w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tozFKxTXV9AISDaDFqQb7eJoBfQ0b7koBamZ3GTsm0t36CgKvM3d1M7C0wWu2GrDUG2ZfX03AKPLldyo6DNTbp/HVEynPmLfyYTxO1uhCPhM5vnLhzZ0bk60guXWHk/xkkMm/Br/f1Trz8+uBETw/CIt5FG/v7AvUdTyOCif7jA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aLoeoiEL; arc=fail smtp.client-ip=52.101.67.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0Ou7lb+aqI4FtMU1vg+ctnzY3V2DuEsq+K5HL4tJ1qBCAs9n3ykMXaLWNM+mQFPnECxV9X9gH9vSm8EVR5QUX+ES7CKjVuLtQfvD1n2ZHfP8bT2TpHzJJmjWB45/vMxUWugz5YgF4nxOtAEPMiH+WR8fM2UK1OFzEVCPl4p5gUMJ2Rj3Ku92N+XeXY5AFcX/pp3eqBopL9com4Lqhsun4+Qe2NVXZ4mWhG5GOqSCO7kNYLIvCVO1Dg18y0kG1sU9xaMEb26OTaFOZXVsNKMu/aY46azveH5qps7G+9a+L5iMGd23rBB0xxFtM1YebWzy3yIWXTduECFt494nfHOZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sU0ZSgrKRq862i8WjDiHViP4+YUaMvfQmoZirSv/lk=;
 b=KgXy0HP99v5CC5mYo6+wQFdKYfNvdrTHPjoMtKUfnePduOWpYSfyxZqQxeqmHbQRgV9yDNbrJTy4oSoUiXfK6vO1ucu3BJM7mLO5vuov5ZzrDVqO2uDWZPQ5HDpvroobUiSPZRG+i64QO/ANW2O47BsNr9Msu3tuP0jfs7ul6OqsLu9akap3R79eLnuZ7igzi9sktglQoPpG1MAQ9tLs9xNPsKIj3kGWcwYvKeYi/wdAM7n0c9YJH8T418RT2nVgU3VzCLabGd5FK1ArOclbVTGWVgqT8cxKpcwIXnjYihgd/+Eh6zanIE+klb82+Ped4bkQC+haWGUwVhOdz5XPqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sU0ZSgrKRq862i8WjDiHViP4+YUaMvfQmoZirSv/lk=;
 b=aLoeoiEL6dgFOQF20jerpfNoQL1wW8SL0MCT4PUmPTOWUjfOunGI0RwilTianUNoup5s7dCNyf5xzm6n+8URpk/z2PcV405ss0wPANq6ShpD/FvLiVprxpuq5O/0NXgAVihYJuPUSnmQuJhw3L2HtJ29fHhFkHN5RyK37eZEfMAUntgLJRJgEy6zlX+F4cNrYD4iqpeUoNUysiMGj9suaGUxHGiCT2547p4xtQC66RD8rigGrQo1PLZFDcdfUKZbSrb2xT//81IHmhXN2LAXzd7c4VeTh6skNEOFRf/GIdP2EpU0XavMHNINiuXHRgVh6Z3c9tTaH27bNJKcD76iag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10201.eurprd04.prod.outlook.com (2603:10a6:150:1b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 07:12:27 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 07:12:26 +0000
Date: Wed, 7 Aug 2024 15:11:43 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, vkoul@kernel.org, kishon@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
	l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: imx8mq-usb: add compatible
 "fsl,imx95-usb-phy"
Message-ID: <20240807071143.6njojidi75xsjkxr@hippo>
References: <20240806050639.1013152-1-xu.yang_2@nxp.com>
 <160dd5fc-83ba-4311-a173-44521342a3d8@kernel.org>
 <ZrJLS37GFmvkQpml@lizhi-Precision-Tower-5810>
 <bfe6430c-a022-4e8f-ab7f-8d8e8cb10fca@kernel.org>
 <20240807055701.o7fo43efvv3jxlhv@hippo>
 <9127e97e-64ad-47df-aa4f-03feafafdbb1@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9127e97e-64ad-47df-aa4f-03feafafdbb1@kernel.org>
X-ClientProxiedBy: SGBP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::15)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10201:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e3e088-740a-4152-2486-08dcb6b04ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YoEcVRVYlXb6XCCsOSek8PjF+DgDo7ESrKwjq4WTL/pRYXja1UgehbC4ur4s?=
 =?us-ascii?Q?RrWV4YRhTgdVRdrEGsHFpYxd6Kf99u+pSI392gWVFDpOrNN7j/Mc7d5mrQsw?=
 =?us-ascii?Q?OJW2umRfseVEQsoEoa1IK18xmqTsWOOWJhz4I/ZygxYXqUd7ajKTpggDYVWg?=
 =?us-ascii?Q?6/bczoGFv8vN39sFQ8caVCFDdz+3hm5qg0YRPMj9/roEBr/5v9ooz2WrRVKn?=
 =?us-ascii?Q?KpA+vuKKJPmlnWLrW5AAsQRQcwMTWQabAeYLLlQ0jkr63IoOWgmoX2qVSRTp?=
 =?us-ascii?Q?S+zaTcRA3oSQWt7MdtYUIMC8g3a4JzBOmHSZ8/XqpzWqu4c4Wt2RxYWBgAhy?=
 =?us-ascii?Q?7liuDTfYhc7d/lIxrhVnK9wVR38SdJivz4lj0Bl9JrzZzgtJnkC9q5AairAS?=
 =?us-ascii?Q?hSg5NulFHkCmL9xihvJsBXCZB3iIvvk/yGReMtVCtr6Yf9ZRqUmFSIcsYp3I?=
 =?us-ascii?Q?qLDQpQg1Y36SrgxZ/hRi6Qd1vBhn24pFveGCQyHkpJTlfETN3UNDaYlbvP4C?=
 =?us-ascii?Q?jCsgL3YZU7agQYbzquJ9OXnxwNhADGu/XzVWgKYz0jn3jIWgzfUYTF1CfxON?=
 =?us-ascii?Q?Icrz1In8NeqVpeXncKTzRx6mlHWdtbcTIWpyUPg01vXO0LV2But0Gx0DGtfL?=
 =?us-ascii?Q?wOXyIeHKNDZkHkff7e1LujWw+P6/nOeaadawlUILQZ7WMpyotUbuhKQxRMaT?=
 =?us-ascii?Q?Um69wMMWagWvkP4GdH+FrrM1wPSghKfCs3jVeXgAkLAVCfUXA31DPko8SUoD?=
 =?us-ascii?Q?ztg4z+00Ye+VxMDn7HnOKLlP6KON2p1Bs2i9flXug4ppZ4mEU3CxDhHPwLrI?=
 =?us-ascii?Q?Z8GtKEhsbVAikanc9d3DJqrj++8A6yoAShZ2NWupOvQsE1yR10mVLbIEVpr4?=
 =?us-ascii?Q?kzKWrpH9NG2MYh+4aV2UVNQE5r0LVNcH51wnoxptVb/zyHTPQxITvOcX/tOJ?=
 =?us-ascii?Q?U3WqtcVOJo3bN3VqsBaJqCB5i5NO9ktoVUFLoJsEQASdIvwQEnlscYJX/5zG?=
 =?us-ascii?Q?/0dDKVCj4eX9od0vQR9r5z+lsahYA1M5VgriFoaP5Ir+OGKuwot7GlkeYoFp?=
 =?us-ascii?Q?ryt+AC57/7hCJlA87QboCRf+MjWGby55Kg0ddRerXKYQV29RAN7oQtlRkLO9?=
 =?us-ascii?Q?+2xg8BDU0iy77R6nMA6OorlWIQ6cDZ5uC9NkNIQWBA1BE4PieFIDVZEkP0pX?=
 =?us-ascii?Q?EPBrzxZRKLr6FDY7lIoRDJbAUDkN8DbvY9LhJf4xp66Qjj6LsmUrVNKQO05R?=
 =?us-ascii?Q?8lV+bpgQWIgEATkMP5kYFJZgrZEMk6G9ceXRhLxx2KengrS16AyG26a9A+ft?=
 =?us-ascii?Q?S7d48Xrb7qVsFeh045sLQR8leB9Et+rZgqhhKtm8gFgdejwSiBknfFf+hPMR?=
 =?us-ascii?Q?5Zxwzkg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JDN6KO7bIYZAbNU0H6VWZESAHDlnxfVjz7XViGg94f9WGFpljsrkGfF5+QXI?=
 =?us-ascii?Q?C+yIWUTYhCXLHr/UQMAiuBh0nM7tAJkJYN6u7XIkKnkjoAZEfhKkeBhg7a4O?=
 =?us-ascii?Q?se3uI3v6KVMstKBJBG4unW0M+wzvTxNIhfcppNjeHRM0MaOKgK3e1BYY7pbW?=
 =?us-ascii?Q?mTxIjxwf1oGgsMVSdB4Iw2n6LKSOcPOBAi14Dv2UUcMEBhUfPk4jh/ux58Ld?=
 =?us-ascii?Q?NqMJ2K2I/9W2KWw0H07Sj9vK9at349djJ8Ny+hkl/AeIpj4RGFN+8W/lkmKm?=
 =?us-ascii?Q?9Docs46R8DuQnGsZXdtisKd4oLEd2k2PFk3apcwONihd+reutw2U0w4yaR/P?=
 =?us-ascii?Q?q8plwEzYcn9UILlwrZf+bTLlEsp1vTmd2N5LWUKwATkAfT/J5z25+/VUssd9?=
 =?us-ascii?Q?5RMAlJ2iH+JSD4dSr60ZjzQOpVAHZ57AqM7edW6V2OX6LT7+dgBhlP/MAV90?=
 =?us-ascii?Q?gEEo74GO6Ut4rBgsZ/+iDMiJBDcpmSMV0/XHCoPf9khs2/NIc0NozgRutTAb?=
 =?us-ascii?Q?N5McxxByh14D1AOw8URZe8rBG7dHb2xvQ8vUlbElB4yT6xDh4mzjM2LC2dKh?=
 =?us-ascii?Q?LgL0/CfVuKhLTyOycTXwDG/1V0ESKIv/xaPZPrl5DZIvXHTxBNkL16XtwuzT?=
 =?us-ascii?Q?sd81/bT9325KI/Pf5ljX3Dof7U2gebPBzS9tBQMUuzyT5Bw1DamjGf8ukRFf?=
 =?us-ascii?Q?LjEH+oiABAD+pNmR8c1j8clDXyr3yf3ywxeTfqzv+W+p9nBbbF7XvGTwhtcx?=
 =?us-ascii?Q?RD2MddesmDGn6UfNGsP1A5Zk/pIrhSDOsLPWFy/OYyHWcsIpQ7nh287pq7Mw?=
 =?us-ascii?Q?8guYxtmbz5Ik5mHEaCOP/xw8g7KNKfIHvXJi8DmpeWA9A1jD5KCcRpKAhXOp?=
 =?us-ascii?Q?w8WbceDjPDSdQJouf7b9wf2JnZd50s3qiorl2GgzrZkBb505EIEHuq5p7Tcj?=
 =?us-ascii?Q?fFDyA25yEJw/hO+tWvCuqCVlZ9f+c6YDFu5mCO8/E/dApdA0lGJxIEAFCVah?=
 =?us-ascii?Q?HW/sFnwMFncD9Cd8wN4m3Y8gN4ohyO6sheTC3TCI7xkrLzrLontaAAkWUu58?=
 =?us-ascii?Q?3COmXDycamdcQ7KsRhp5r1gxzh0kAPESzqyIrtI1B8h0Zxwno+qeAurKaHCv?=
 =?us-ascii?Q?r9ULVXWlJL0emgfzeWwwS6gYG8UxG3T2wkG0kZsHQExpymlagpFcolYQRsRO?=
 =?us-ascii?Q?P2s9yXIrIutB1wiRfTwqswfWzD/FwgCw/v354oUsP7GUzNHep7ljxlofhVm6?=
 =?us-ascii?Q?DXiPuKL9f3VapXoL6tDFQCbJZ8SLRKdOhbNVMTY9gtdnJgIrAkA4+DSQ4OZP?=
 =?us-ascii?Q?eGgexB3379GA85FKq4n0VlNnPOFwG88vIVRioosQTp8YZzU5mVlP9MuSP5te?=
 =?us-ascii?Q?aU3cnq0eV68vVlGk0BKABiDbTOiaXUGUNOq3wTDxBqLc0sqMV2vwRzCTTaP1?=
 =?us-ascii?Q?12vp7WFRjL5e4LQ3FI1YEMo1dH5gp6h0QCx/5sd6gJsizsziniQ9E/kGA1S5?=
 =?us-ascii?Q?7LjzqYn08E6anFnGJQwWMU2hLy18BRa1EvCMU3E6LrBEDv/ObayxZiSYAnkg?=
 =?us-ascii?Q?5DHiaaWYX98Do/iuESsdRbDt1l5l41MkwGEBUds4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e3e088-740a-4152-2486-08dcb6b04ab3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 07:12:26.7048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGGyY9x2lPwIFOvgpkmdMncdYGwwdMZfZKN1LotdBLAJQpn6zKzUiBdvY7oz0K3JtZ0JjEXLabEJalXOH9LDsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10201

On Wed, Aug 07, 2024 at 07:59:02AM +0200, Krzysztof Kozlowski wrote:
> On 07/08/2024 07:57, Xu Yang wrote:
> > On Wed, Aug 07, 2024 at 07:48:43AM +0200, Krzysztof Kozlowski wrote:
> >> On 06/08/2024 18:11, Frank Li wrote:
> >>> On Tue, Aug 06, 2024 at 10:29:47AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 06/08/2024 07:06, Xu Yang wrote:
> >>>>> The usb phy in i.MX95 is compatible with i.MX8MP's, this will add a
> >>>>> compatible "fsl,imx95-usb-phy" for i.MX95. Also change reg maxItems
> >>>>> to 2 since i.MX95 needs another regmap to control Type-C Assist (TCA)
> >>>>> block. Since i.MX95 usb phy is able to switch SS lanes, this will also
> >>>>> add orientation-switch and port property to the file.
> >>>>>
> >>>>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >>>>>
> >>>>> ---
> >>>>> Changes in v2:
> >>>>>  - replace minItems with description in reg property
> >>>>>  - remove orientation-switch and port
> >>>>>  - refer to usb-switch.yaml
> >>>>>  - use unevaluatedProperties
> >>>>>
[...]
> >>>>
> >>>> ref should be rather in top-level. You can always disallow certain
> >>>> properties for devices, if they are really not applicable.
> >>>
> >>> There are some "required" in usb-switch.yaml,
> >>>
> >>> oneOf:
> >>>   - required:
> >>>       - port
> >>>   - required:
> >>>       - ports
> >>>
> >>> If put on the top, it may cause DTB check warning for other compatible
> >>> strings, which have not support usb-switch.
> >>
> >> Hm, indeed, that's unusual case to have such different devices in one
> >> schema. Did you test that above $ref in if: actually works?
> > 
> > Yes, it works and this yaml pass dt_binding_check and dtbs_check. 
> 
> I know it passes, I am asking whether it actually works. Is the $ref
> actually effective? Is it properly applied?

If imx95 usb phy node doesn't contain "orientation-switch" and "port", dtb check will
show below error:

usb/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
        'port' is a required property
        'ports' is a required property
        from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#

Do you want other test results?

Thanks,
Xu Yang

> 
> Best regards,
> Krzysztof
> 

