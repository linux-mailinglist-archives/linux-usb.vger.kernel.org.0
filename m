Return-Path: <linux-usb+bounces-20811-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C1BA3BA44
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 10:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 337933A91BD
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 09:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4771E0B70;
	Wed, 19 Feb 2025 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GRZQBECx"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5C01DF26F;
	Wed, 19 Feb 2025 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739957437; cv=fail; b=tnNT4mZWnLgJZrQjkAro8U9z70+CH52+uOQHnbXMETcq46HYuDWBe2dqRIbfxr1DlQhRwQqw7joTNjpS1r+C9R1L/PE+pXa2HWrNOlDdWlpSEkaYvSf3KrU9zzQMtnIebciruS0wbRP3B8ka7BcRvm9T+/a0Vce5cji2HoVe7C8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739957437; c=relaxed/simple;
	bh=YBV30EqvNFBxn7ZeALdASbxvarguCEJ5iz0sPUSD9Us=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Z6p33IPzcORwWQ+K0P3GLPCU/wsJbFsOwHfl0Iv8Ic0+ChbE7bw77BpjhgLGkma2wc6J8jVC/BTU9Wq8vMqWCmiZxVbgOdV1d42lypetnX3pu7EKYUn1WDK1CtC2x7M9DmoxmYrH89I7ndRaBthOHjvlQRhEfzXDt3h1vRDn/TQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GRZQBECx; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAIEUFEXNWQsKakBpG70df7z7LMWPdjzjNr3XpOCJboS0m+PX9uyNHX9vGIOHE8Yu2mCm1FkDTEmbadO1UtFgX4JRJlVmekJc9b+Z63p9azaQgJJT8iWAR0i3qVH/6A6tZEtRdOwCMQ97DRHI5Uo1rqKaPJU6YBqmZAgXjxvSpx/wm09c4rj2z1Tjx3G3fOXVS2y2+LtR1bhzzCs0ZaZcDFrNTV9sL2VqK67ai8BJJVcVBQzyVjGpszuiCXX6LmIQyl1MdF14coTQ4FAiPqAVZiHcFJhS3kLGZbr9f27sLv27kWcauo3RgaGt6VqAbxOfcvcYRIB5YJETke+GLA0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLmEffZdP+Tsz+XAOJ2iHMRpS2Hod37kbSDx+LVpmuM=;
 b=TiyzpMfpvJ/lEPHppmImAG/XM1w3i+FcLP1ow4/c2giz45bMYedARxANEfG3TlRdAVmtO6i6GUJXbZJE4tuKx4WJTXwNJgaDvIXAYuDUVMbVFrnlim5cJNRxu/Z6fHH8h2pD3BDvxRM4SNETaJ0WhGvbX31HaP7YK1lOaGFdsOH3fUtvBeSF2JYHy14v2EUMM0Y7oruydnE3OeNP3yn08HCGzdavjqdJokjiERTEMvHIabJb7DFBVQJbYd+zNdup4rJ/XtIz/jt0EkgHc9m4UNvFDu9e6TaYXgp06Zanyv3d7EIu8Gs3f2MwuOVqttNnFWuIfQTt5EMZjvbaMMhPkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLmEffZdP+Tsz+XAOJ2iHMRpS2Hod37kbSDx+LVpmuM=;
 b=GRZQBECxxRLUm5FbIQ8TcQxCdXgIu0r0+RGfhL4kd1eBc3plBOmdMhlXRO7P5H7wdy3mKAr14qe5QYWgaE0GJcBCvdjarc29PHWi3i9mgVspUqkydCug67Q9gIpmpVluAH5RM9iEEP25Z23xJQ3PxTLWeDT6BBXnibbpdioC5A1HxB3KaRqlFGo4anuzSKbvr6SUGudcV3yRlRgJnJrqsSoWODUXNAhZK1lclzkLpF8/tIcFAkWkhPx/ARMHzQMkgiDsdlfDDpKENtZeaPAxl9er1IlaUpJNklKgajHeDA2f9SGyYIlYPrZg5a36EDc6ZLy5Bq3ZFVYuQx7+JHMA9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI0PR04MB10370.eurprd04.prod.outlook.com (2603:10a6:800:214::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 09:30:31 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8445.016; Wed, 19 Feb 2025
 09:30:30 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH 0/6] add USB2.0 support for i.MX95-19x19 EVK board
Date: Wed, 19 Feb 2025 17:30:58 +0800
Message-Id: <20250219093104.2589449-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:4:197::8) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI0PR04MB10370:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cfa346a-3b47-494a-694d-08dd50c80af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?62M4Lj7W5qnGQjpJRdUVxf0v7q13eIsvSjoAFKSh5iMjv3sv+eYrzqfQquvk?=
 =?us-ascii?Q?c5kbv+SQcL6rHgSYXaJA/ZPVatnIpQiitqDoOnqtJLp6fHa3qbDJ42P1/b+O?=
 =?us-ascii?Q?Wipi278jBz/nOhf01NLeU9fGGumdVZSbPt2fNcvT4edlkl/WpVUrYENlqfFg?=
 =?us-ascii?Q?2cvGhDJyEybv0PXi3qEAAyveI8RB+ufhnlvAcJnqfeUqXC8nEie2bzJkiGHa?=
 =?us-ascii?Q?DGvEiqrqSyjGpgpHdYESYkBvvsCjkWF/MXMAkyTiKzTry+mrTLOIwEKJaeS4?=
 =?us-ascii?Q?Bmjqu+R2282Xa/hqUZBvrs8dzjRDog72+rpdw5vsoX9mjykHYwgM/kZn+/fR?=
 =?us-ascii?Q?l+7FV7ZLwUgJ83F8+/rH4RWTusvYsmPFvqzNXsmuJlOnu/66WZwxe9SZQ0xV?=
 =?us-ascii?Q?dTCwkzIs8xtaY2d8kYNU8FOWdrg5x8E2KK6n+S/7wkKkN2Kqws/KH5NELBqU?=
 =?us-ascii?Q?Mql7lIBAsOIIkezqmzRt5pwwr7XmEn2dSYRvBMDsP6mn2Z4aGzNI5cXXMPUw?=
 =?us-ascii?Q?kAxohD9HPw7xHp4QRdM0ERTVBfpCOaoNqdalq4S4xRypVgiM78n5H/mdfwEb?=
 =?us-ascii?Q?8i0IVftWOwOmQEMa41bhQEwvFp5aNu2DLoZYkwkpk7JoAEUvFJWVgCVD79iF?=
 =?us-ascii?Q?qpmpqw0ZP39p3PpK8jpFeV2cujtV3WUoQgC9LUjhjbCCIvFN/7iGth8EJlKR?=
 =?us-ascii?Q?+qlJ3z9xe6ANapHiOmFpz2uDJXsxtzROBo1qa8A0TEQh2cbUf+5YR2lcU9eH?=
 =?us-ascii?Q?yZ8ETrIakM/e5Fzr9RrvQAvnA+USXhX6/fdmcsp6mNAasalZcba9Qkacl+Bo?=
 =?us-ascii?Q?GM3t+uRoU9jPPs1EMs7C+yf9DNGMo8QBDgPN0eQRpEaq+XfCj3dJ8SLSmXdD?=
 =?us-ascii?Q?mi/jnwGn+jpn2acQoDNQEauOLUbT2y8/Bes2h9+QMe2/9bUuRonur2hdi0jE?=
 =?us-ascii?Q?k/zJpjCiYf3QSHINxwrsuPPclROR8v31I7CRN40DvkT7xLDZiscCNwRBpTvM?=
 =?us-ascii?Q?P3W3wo5PLaStEUJe46fCjHp5uJ5GTRMMPgLmU5tBRvc00JfsKgpgH5MNzX5g?=
 =?us-ascii?Q?RmoP4Nqg9WdwzHSWpe+5ecKlAGFCuc/6MHCRnaTRMOJ4yFrMFkf9xCM/NjP5?=
 =?us-ascii?Q?4k90yQ2GD+oI1h/3cjGPO/lsc8CPOJtpBnkh6wjGjsK/7qBjlDO7biePg8wB?=
 =?us-ascii?Q?YTDcXepwPi5Kb1oHPc0HejFlZ3AzQyQVyDhLgn1mJ0P2wCfdI0lqclHR/q4i?=
 =?us-ascii?Q?1d/JCTPQ6cZQo+xtwsS9On1+aqQdxl2rlCkeu2NdCa7kmLy4C/dvRhq/lWow?=
 =?us-ascii?Q?VcHlzJYbWnOx+Q3bkb8UIXe0YrjjTyQJl5KEGcSP5WNx65IqARRdveeTQTl9?=
 =?us-ascii?Q?xJEwE+wpadfVgNacQeMfbaThr6V8ErSDagRyav7QB7MP88A9Zdl0MB++PDzs?=
 =?us-ascii?Q?ZeCzpcDWzu8A241i2RHKizcPFdeEBOvu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1CKtBDTiD1+K8WHexMtNfAQ/sstkEyjZL2TYauoRwVlr2ahrKTMzzxwKVsq0?=
 =?us-ascii?Q?GQrs3Dv8fOAWCWAwCwsqGRXs8pTJ0UyfJVliK5h62mjK7DQMOha8Wg73OgOe?=
 =?us-ascii?Q?wZV11KVnHyiU1Gdnjt4bP5ZxiGhF9PoxuewRyNqvvjg7HwyKTTlZwI/0p7Vk?=
 =?us-ascii?Q?Edl23pliX5xf4T93jszmd+KvIZNCd+D3vvrlHVm50eOA9vhrxFgo8aCHTHGl?=
 =?us-ascii?Q?pRnefL2/+Yz3WSMX3SrVUdAEUEYfG6tTuLuQfhwlEgkDQmmcnPuBh5Y8dWXV?=
 =?us-ascii?Q?D4/OebONweRBPCzggXV0Jra5N1sV5XUAz0FlSwgYfvVI6Epa5cqaJJEP7TiI?=
 =?us-ascii?Q?hwyIK9nrPpRBUeAMWZVVZjdS57JctzKrAZXMFaXDXritn5KJM4pUpi7/ipFr?=
 =?us-ascii?Q?WIJgnfB/H5ETVm61obhfZUBobNdlcQ6S8E7gckDUMd5UrJVefGQ8TfvzJkdN?=
 =?us-ascii?Q?BthNmo2HrTOAhQ30cVm63sh3jwNu7WKyiWhljNFt2aSU0V0dquazMHjBJFCx?=
 =?us-ascii?Q?YjgHU3wzHOFpsULj+Fwnt3inT0QuMqEao1frx7dO+rc7CWXjdKIeaQwkOioY?=
 =?us-ascii?Q?BE9XzFj9tvL+rYEJLSHu9MjHqVfcC940EQ5zO5Ub62TSKJ7JKZ3CX1LXEXuH?=
 =?us-ascii?Q?G9epLkpxyjKTrfPJJQw2+NKivw9QwYtMbeC4JhWAsLIx0Wi4oGLdZCigV3Db?=
 =?us-ascii?Q?PWLLFZh6mhBq5ms63rVd9laQbrihK4VtQgtXx7QeVoP4LZbgl1OGoDCkvYoK?=
 =?us-ascii?Q?NDRjDH6QeUrKiK10G5mKXdUKCVhjCnA0UXNqYHL3WNpjW31ebduAR9V55QDC?=
 =?us-ascii?Q?h5JpGXhwdfG2gcncNln5xr22Lq3DUdaS2QXAVKiG8B2OexEdZoODO3ddPZmE?=
 =?us-ascii?Q?R2GRwBrIrh0RV94tI4bSb3umaTU69hQZR7jfiy3kXojuANMiC/zxNILpNB4s?=
 =?us-ascii?Q?S+tbJjcurGJ9ttVckbXNk8JqXHO1Vjy7pkakYMbtxWFZUeVeI57h82LADRsY?=
 =?us-ascii?Q?OOt30s9CqCs4lGCHTwnzqo96Q88Spl8wP4yRCKeYU3H/NL96RWqrX7CmHG/g?=
 =?us-ascii?Q?TipT3ulKKKfprO7qVt/h+Kbt9/eDrtNXnC6l4+z44NMHlnzNT/tnhJ24cukU?=
 =?us-ascii?Q?wFXsS2kRKdfbgQnXCPnZMKvB/XnPgHWB2xp0mU3E3FvYIl+N/hrPBiAoSEW+?=
 =?us-ascii?Q?DunxGFsZb6uTZ5rrR8btR+rceu+Al/GGybHVLE+fhgmtu7UhwdGVx+Atw86m?=
 =?us-ascii?Q?k6dETYFryUJehhQ+dUjG+9LyfDRHdTGx+Vgtv/3HEM1zSIkGD/ELfaxi8/R2?=
 =?us-ascii?Q?SmPxIcbkHT7/ANl7LsncNnF0dENopBgFhZRLReW/XmiungJ16i4MKM6NtiPZ?=
 =?us-ascii?Q?p+SWx/KU88Z9cLrst2GvKzwfcxqIt6spcGyDNxBgvedp96lQI4uaBeS18Ms2?=
 =?us-ascii?Q?fdQIb2MF9GhHpU4tK76/EIm+zkibCMkzlhIu1xRzIxs67KheBfThpvHvXnOP?=
 =?us-ascii?Q?IwG9FarPXzhyx1PKBgwnHO42cCj335Sn07LqfyGE5B7DtC2FFTGD3A24INmC?=
 =?us-ascii?Q?6Fg75ZzN+SsnUUIXDOsAz4lQCl8FPWBSwjPIYaXs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfa346a-3b47-494a-694d-08dd50c80af8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 09:30:30.7798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRXHPEgXCMnOTFVon2io6dwtlA+V8bp+j0A1XiePCqYUNw18w3ic3SwCHK9VQCFenNXdl123F1zJEAwRSFXugQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10370

The i.MX95-19x19 EVK board features a USB 2.0 Type-A port, with this
series primarily introducing USB 2.0 support. In the i.MX95 architecture,
the USB wake-up handling mechanism is integrated within the HSIO block
control module, utilizing a dedicated wake-up interrupt. Therefore, we
also implemented corresponding wake-up logic code to properly manage this
functionality.

Xu Yang (6):
  dt-bindings: usb: chipidea: add compatible for i.MX95 platform
  dt-bindings: usb: usbmisc-imx: add compatible for i.MX95 platform
  usb: chipidea: imx: add wakeup interrupt handling
  usb: chipidea: imx: add HSIO Block Control wakup setting
  arm64: dts: imx95: add USB2.0 nodes
  arm64: dts: imx95-19x19-evk: enable USB2.0 node

 .../bindings/usb/chipidea,usb2-common.yaml    |   3 +
 .../bindings/usb/chipidea,usb2-imx.yaml       |  26 ++++-
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  23 +++-
 .../boot/dts/freescale/imx95-19x19-evk.dts    |  16 +++
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  30 +++++
 drivers/usb/chipidea/ci_hdrc_imx.c            |  42 +++++++
 drivers/usb/chipidea/usbmisc_imx.c            | 107 ++++++++++++++++++
 7 files changed, 245 insertions(+), 2 deletions(-)

-- 
2.34.1


