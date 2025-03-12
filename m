Return-Path: <linux-usb+bounces-21671-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B031A5D821
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 09:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55EDB3B778F
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 08:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE07234987;
	Wed, 12 Mar 2025 08:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Td662Z21"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012071.outbound.protection.outlook.com [52.101.71.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073C71E3793;
	Wed, 12 Mar 2025 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768053; cv=fail; b=rmUkEwygvsgmx7yWdELrlPqzbiPsxwDHoUaN18eaCBGXVWPnTTu5KwxYOIL18+UiBkAI/QDWGCOovRfUKAHZgDyQ9PHs9GhkJQHhHG89vDsatGvn2/oq8VfJs49B0YZEw45hb4DmdWkpELyXB4lPPNk0BXzVj6xeSwqeJ0vVsHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768053; c=relaxed/simple;
	bh=x+JAxeQYSYJoQLUACynG4lkBsYcTbVrNlN5fycUfA+g=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=vEs0AtXcheuw1sijSkwbiR6Ke2WArFC7BwTKpkZDkVWZ/9aTXZzmGPuMhpLiAARwXUYp0D73V0ttAu91QV9s5unoFfIRbelE0UfxHKxoIoZs/UpVVAiWataywREOyQgpSRfQqkZ5e1VHfWugnu0waLAaBRErXCELttr6eOpeQXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Td662Z21; arc=fail smtp.client-ip=52.101.71.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFQd6DyW13DsThMAtNRPeMhcqMPKM0UXTwWUckTCw7m0ieCEXw9wuZHdQ1fK18jMmPVI16TZN1RPMTTSBFvQ1gQCxakUbVyDQ3ks641p1tjH8zLImMhidGIr2RaFtpxxmHOP0g3r56cweXQq1uqB9++wMi1wqm8KPYzdmZ+kCasYbApKzVc9qlQltB6A/VxcJvgGB/P8H/A6yKXZWu++y0MaFBZ25D4oRd2dtRiGbMGJLjqSDau9C4cDJFC/SaYaYVKH1WjkfHmdn28e3eb3xNcaXRRcxPBRdM2O3IxWHiWlBAtXruYiCWfHH1lVl3AelwOdYvS/jXMscqkwHIGF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RMczWQkGBiR6EJyXEh0beG5cmQlXVA9h9X9AJ14Mcs=;
 b=otr6Vso8oE2ETYdW6dK8V3VAKY2VLHj8FQzxppuR9wu4P861w3gz1NU3eQ7diDqgP56hT8ZyZEClQuf//HYDFCls97eQYiTnT9Yr087eJ+2hwx2glurbKBryE4fgDHLIxhCcJ2k2HtQUv9McERz6c0sndsEnQXmc36m58vDzknmQOHzaEDZb98tLAGN7DMVxyD4/uiZp19YzLIBJqDG8wtouUp826DQzOf8fZqnksWuI+WOb5dtRJu8su7iSWSm1zme5Rghb0bH71yaKao7ArjOdUI+Gaaqu7TrTBvcqtONUC/RDUaQe3kqp/nkCOS1+wiDdkzmHV1Utpvlr1sSKQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RMczWQkGBiR6EJyXEh0beG5cmQlXVA9h9X9AJ14Mcs=;
 b=Td662Z21eW5JyIKafhofVcSayLnfLhUk1OIriOI3lhKzEeXaXjxAWhUc9709bSOkE5X2Ry8lsr7YMnlCw1BGc2lvhIFhtDmPqtUg48vNe+MTp/OkNNCAP7pnmS9hcW9zcmdAZnKX2MRF1+PjSmhrFFNImz9NMMQA8UxkWuemCOQ471lc2QKt5+NZtq7V4fZ1Njk4Eha1egOPwrOXPCO4OYcls19jNYkiayiPGIAUwXVMIDcPWCeFc8zHR0rEASnQ6ARkkzz4ys8tUwiJPeBSaZyGoEKkKbuI7hbqNCdvwBLaCWUmk9UtYETxBt7JeoYe3GMItL1kBCKHtopqRymqQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 08:27:28 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 08:27:27 +0000
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
Subject: [PATCH v5 0/6] add USB2.0 support for i.MX95-19x19 EVK board 
Date: Wed, 12 Mar 2025 16:26:54 +0800
Message-Id: <20250312082700.260260-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS4PR04MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: 52dd6e20-67ee-4b3b-8232-08dd613fb93d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OpNMxgB3jbMED84w+vuKzyWv7mDaORGD1eD5y3ijD667VYLqVu/0GlmeUmUT?=
 =?us-ascii?Q?2eNws6cK/hmrbhqDVmSvEsU+f4xfV3dpi/LhJMNHFQPOOuih/I/2KxSY/Rez?=
 =?us-ascii?Q?HvVY34HWu3x6vzSfMAKMezYgteOJUpOdYri3QQT/j9qh9PXFUC0aNC4WyOMe?=
 =?us-ascii?Q?2wXHeMg/1ZR8WuGd6gTkX7bDV8jdGiouPtwJKrtPzgUQ26gDos/wn3pYC3Li?=
 =?us-ascii?Q?kRievvXTD0QY+9fzVp49X9yMJNiDxi2sc4Mr400ozTGDsszThN90zG2ex1/+?=
 =?us-ascii?Q?23LKcLMcvSB3hKDVIQW4ynr4V1KSHRV/tmXrjKhLYT044oE+kZHrvTDv+TSw?=
 =?us-ascii?Q?6TfQQkmx4vQbDu/L/KcLoBzfgDo7HcYBSpHf7H8Ye4KQN5cWQO7xOP/JQ3dA?=
 =?us-ascii?Q?bRDFgiL7tmB7nPgtY+knBoQW5quKOhM15jTXj1UNT6ced/uq56RuvuQrp2Py?=
 =?us-ascii?Q?vUbSivZ6lrkVG95OZtWV/2OqsDunNQGimpGEVtczkJPFGW+Sssh+51ztB0zk?=
 =?us-ascii?Q?gFOEUP1i/g7pe9P85kfpeeb6EdKwMW3njJAYBdRpMbXr4EHFEX3/K4xEMEl8?=
 =?us-ascii?Q?AuVNz5Lqo97W2PLRAtPJojOc7WUv0GaO74tGA6ZzIitu29uQaEWWSMmLZqxC?=
 =?us-ascii?Q?o+ahSpHmcT2IQw67ozlVMCs69rPokOhuv2w6SoPO1RjZBHk9HQHqZjwqpRAI?=
 =?us-ascii?Q?AllQK971jfSTq96h1SdPkvUsu8j9LW3Iyr+gF/0vXlr3kToWd08fXmmutb+t?=
 =?us-ascii?Q?3xW15EboYi8EIuACTgfhuMJB0mGAIg0ajHMzQtCpmhI4igBa9mQhrTYnYfDT?=
 =?us-ascii?Q?qVCTOqb9DGvTl510ioTCVkGCK8cPwrPaRlv+13AnYUh9UxfZhjSHn4VpTsiZ?=
 =?us-ascii?Q?4+vFgE0p/JgL4rgRmC/ewG67e5xFemO5i2RVWHkGQAKUstOq5iqi6v5pdfIJ?=
 =?us-ascii?Q?j52xkD1b/FrqDQ28MopQL1EIXg3hHTXvuv7x1qr5FMmnH9i49CgsAjavOUQI?=
 =?us-ascii?Q?ADvWMrr/vv2VmzLemr5xVSspgLMs4mlmf1nOA+Iv37Br2Vo32wdyokMTdWsU?=
 =?us-ascii?Q?Z/UN/y20xM8iZ1n/UxE/lvPnIQwRbba2M7+j0FDNmWGg+N2uC6w8GIhpFl7i?=
 =?us-ascii?Q?74sSP8IPrUfPNBdsJfejBh7tnNMm+3X9sTO7sJji96DgmuXpfBauOajZ0nnn?=
 =?us-ascii?Q?f2fTPP5ErQSmY4EljUY+I91Or42h9LOunjNVAP90IKRMeqd4DchD4pae4bj5?=
 =?us-ascii?Q?2WNnuWee2HEwS/uGZydlID/0I3qoc683YxT1uCyq175r7KYJcckutFaRxgjO?=
 =?us-ascii?Q?2XC0l56vpRU9X+RFELTAikWwAt2DOI9HS13pRciUw4ut8yLDxZZL5y2anL5j?=
 =?us-ascii?Q?LO54yiofmrB/AMBUjSFgdEBCgwJWZKHKZIv8mRE444gu3TIU4FuZoq7d9h8P?=
 =?us-ascii?Q?z/BhaziU08rFJjyfObTbLMkRAOSa+zTO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5umgxkulJVzlblFiNQ3tdXLC2sQpOpWvh3z/gWRsZ4n7+Eu69mXFd4aWSD0M?=
 =?us-ascii?Q?RJIGMGqxhfuUoFg7UzUOo/5E95f7Fe86CWQT1vLTPqipkSpg7fvbZZuZWbVB?=
 =?us-ascii?Q?ATv3ANMSDWTHs3BLzpHZJ+P3uyi1zcjBUy6kmWK0AhJFbOX0JeDsDTuOeX+o?=
 =?us-ascii?Q?PhUM8tsnSWGs6qClX3dnHbM5X8C2pMWtReNdb6cveLqDO4n8HOSUAe2a9RC/?=
 =?us-ascii?Q?uXDJ/J7gNkX+jvino1Ulekxg2lr/bDB69AlJJGVkizfEyVJKTAVHVo6LMqWH?=
 =?us-ascii?Q?sUGu5h5hxMloqdWITX0/j/svl8thPNDzAz6kLlXAAWCMX5wIQ3vD20nXs6dA?=
 =?us-ascii?Q?yvI9Txre4A86cXYA5m9NXsLub1RxzHrsJF0H0MbADbwQH5ccCrSIZ/QQzKhR?=
 =?us-ascii?Q?YgBfGbxO4KaGrrGGwuCrHsVF72+I7YCJqc3ZKb3U0VNeb1w9Rcmu8v5MYyWf?=
 =?us-ascii?Q?egXOol6KbepoOeiuLhfCKOCDi9Po7GToZLzIsOVDhFz04PY1tGv8mRMjB5b0?=
 =?us-ascii?Q?sRgSGfs9ohCB9N5PCgFtpVN0yNGbZPuKNC3Nk/dhbPhEtuE7vqVwDLxNMrfC?=
 =?us-ascii?Q?x6nLXHJX2cDoLMw5dTR7g4rVTTCrwPFiLSWFLrkzCxkCPrSSauZ13Z67jeGa?=
 =?us-ascii?Q?xfEZhCZ/h6luUcMNt4Tyg9cADvVq7CxckxYsQXkWCwbRs6Ob/rOP/9d8ZtIh?=
 =?us-ascii?Q?kLbnl0EU06kyWOjRWg/VRj3oCHHcAouUDoYFOC91sFCgvYG6qpO9MYXLpC0z?=
 =?us-ascii?Q?8oWi98wz9Jllz3vBypujx6PXAL6P4OJq0TjFPcAEcniXz4R3Fwzc1P5MFpfg?=
 =?us-ascii?Q?ja32vm2M+jvPi+Biz/Ha3uPoWJ9kRmkwhxwuHGlXd0CTscZKIgIUYI8qujGt?=
 =?us-ascii?Q?5k8Pz/GrOD/kpwDSS0ov8CiCXpIF5ApKm+iXLH5rtZAQjOpsFgGGlgaWLbbE?=
 =?us-ascii?Q?KkTbEDNueTGTPNlwSYOLf3oJuM9mmlj+DN38OIuTp8pzUPy47SATDT0CLCtd?=
 =?us-ascii?Q?c+ufrpwY/I7OBqLsx7VYtXLCg5uhXoGbK5kqwbVXGh6OYtJ27ssgyJs6STQI?=
 =?us-ascii?Q?rPuJkLbGwuS4WJR2Du7WCACU1oGTBeBg6j8+RRF5l5U14lKxtalAw1L4dP5o?=
 =?us-ascii?Q?YPB4p52qwzhb50jDaPSI+f/7tEJYtreIwJCfpaKCAVZFuVvUQ6mvw7xFBlbe?=
 =?us-ascii?Q?3WM36BPoWwep44WoZGbnGJ1ouMZN2yIWuqKaSRxHvVvqmz8Rhx+Y1AxtPP20?=
 =?us-ascii?Q?GAUcbWwP5R3w6QqnSoI/lzyCvef9oTcLgV84zb0SVCYEnQFZpcRRwxqJyPo2?=
 =?us-ascii?Q?xjSFgZsmGMMjegzpZ+Od0q6Y/ROx6v4iOlwoLz7L8opI+kkq5Y0C26OhTHAU?=
 =?us-ascii?Q?8S0yYGkXJHFQTt4GDDqSLdfzjYNfWLDyaFcaU87a5XxmYiM1lxQjiph7o62w?=
 =?us-ascii?Q?1bUUIVputaq6dCs4X8CqNJ0wMIfPJwUhFfp6YVFsbeKRXWDdMoQOjdHYb7Ys?=
 =?us-ascii?Q?h7tA/V1Vgf0Qh97QEpoEpbcAjQxCUP7RmkdCBhcOho9XLdtCq705EPtpgrSg?=
 =?us-ascii?Q?nG3PaIzaFd3jqFk84qYJDhfNfp7HK3ZqP1uosVW/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52dd6e20-67ee-4b3b-8232-08dd613fb93d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 08:27:27.7558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhEZ1AgNtHXAidKo97wUK1lcgUv/SZV8+VUml2mrsh21bMZCbEJ50a6ebpfoHS9CoAStBRTCb+RVQ61EUl3X5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9624

The i.MX95-19x19 EVK board features a USB 2.0 Type-A port, with this
series primarily introducing USB 2.0 support. In the i.MX95 architecture,
the USB wake-up handling mechanism is integrated within the HSIO block
control module, utilizing a dedicated wake-up interrupt. Therefore, we
also implemented corresponding wake-up logic code to properly manage this
functionality.

For detailed changes can refer to patch commit log.

v5:
 - add wakeup_irq valid checking
 - add Ab tag

v4:
 - add blkctl NULL checking
 - warning if wakeup setting is missing for imx95
 - add Tb tag 

v3:
 - fix possible build break
 - remove usbmisc_imx95_init()
 - add Rb tag in some patches

v2:
 - apply some suggestions
 - improve wakeup interrupt handling
 - add Rb tag in some patches

Xu Yang (6):
  dt-bindings: usb: chipidea: Add i.MX95 compatible string
    'fsl,imx95-usb'
  dt-bindings: usb: usbmisc-imx: add support for i.MX95 platform
  usb: chipidea: imx: add wakeup interrupt handling
  usb: chipidea: imx: add HSIO Block Control wakeup setting
  arm64: dts: imx95: add USB2.0 nodes
  arm64: dts: imx95-19x19-evk: enable USB2.0 node

 .../bindings/usb/chipidea,usb2-common.yaml    |  3 +
 .../bindings/usb/chipidea,usb2-imx.yaml       | 24 +++++-
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  | 23 +++++-
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 16 ++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 30 ++++++++
 drivers/usb/chipidea/ci_hdrc_imx.c            | 37 +++++++++
 drivers/usb/chipidea/usbmisc_imx.c            | 77 +++++++++++++++++++
 7 files changed, 208 insertions(+), 2 deletions(-)

-- 
2.34.1


