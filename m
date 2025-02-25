Return-Path: <linux-usb+bounces-20996-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F199A434B5
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 06:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B5BE7A3014
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 05:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B482561D3;
	Tue, 25 Feb 2025 05:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AkOJb1eR"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5FE17E4;
	Tue, 25 Feb 2025 05:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740461935; cv=fail; b=t/jE7u7Ryz4C+lKCK0kdom4vuF0mcDUtZMk5j65Yj7Lfzo74udCASXnGdb//YHLnxp+wnm6NUIEJ63e/i1u2x4x+bsYlMj/z46raoTwqme/VQZb1gMbb1530iZ31J//l+w2/sQiJ9tXxI0uQhStXRyRCJVVUpUOL6tJSYtuD5NM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740461935; c=relaxed/simple;
	bh=sWVSwDnVgrnJGPchbdnNmxmCoznOJotO2ZJocgn6MsA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Kag/6+kRwUBUjhk6H3YIeJXVQ+I0+d7UkwoUDEpFs+3sxdzj+uYoB+EUvpZwEpRN1BrPKUXYGIIMO5fIQ33lnejtsc1mKXVT6+HI7NdfQnQWY8RUP7qOLUjYvxXMEEthe/14aM8cC+Z4p2WzWxLftP/6QtE5vMqk34ERj4v2chY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AkOJb1eR; arc=fail smtp.client-ip=40.107.22.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQIBStDWLs/XhDybw3TR7WzKxK63Mne+KN/rFBA08OD9SDgBEg0t+J1l/ziEvRW25XLlhRDLiP63uy70IZK/WmrHU8LVRHoVvYTIqtCqs5Md13dKwsEdgGzSisP/f3L1bXU1658+6fFGzmJFdLAJfRSJsB0b9uTEY7WezqDyRSE3K70MXuWESgxJfKQuMun5+VprCVEonkOM+2J8BBWVd4BkN51ET845vXzzg11xMwkWkpeitJYwt0HMUHc5RYOxDj/aSWcOyGJwOxoIMprqIwsrQwYUO21zoOqY6MTNCbZKpzqIJwFW0sWG6LhRVrCbATU66fuQnWuh6xoKrnRaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eo49ys8EUSFslu+OQBbphPLkjAAGlPDaZdCRfg7rEYM=;
 b=nk6NHWzgmFBVw0KBCkSFJcmVy5n4v+GoVy+aoqmnsIr7Fp2W+JspgN5pGRKghESeCCQOU67OIuozWbH7kTLUkIqaVamwlqfk3ijIsbEVcSb4KJK5pC5/pFJFBxL87U5IwQAsx3gCkgRRnhARbta/TvEcrdpanRnOnBPLoXv9WiOIA3qsXHA8ea339ZebbTfS69TbEzqrKdp9T7WpTbvRYlTGY7POoLGbQoiW0XpeHHlo+L+VU0lx4BEVi81j3fjXvEFGg3ymG4Y/RO/qivKZHRDoPZeT/7RjQ0eaCT9wcHBg9ER/kjvhFDPJe3GKTodJXZPcITCGo7kyYXuhYCJ9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eo49ys8EUSFslu+OQBbphPLkjAAGlPDaZdCRfg7rEYM=;
 b=AkOJb1eRFr6+lAEjGo2tBL+nbwnjbjMGHWQnba5ADVUirqmMB0lqY9YFgR9XGjbSq4IaSBzshqD3uX2Q6oUyj9+xfpfFutqAWYf/FWORkvjaGDfZtu+oceYr8Z1+7xqf861Uqli8wBg1gg2iv+z5NKRcRONicjBqOxzvTqtR2bclhNPbkWgESahtOFg8FRw0CB/5IHJpaLYQLB8NKd+MGwW0DvPUmsg+YhBmX/E02dYfm+TLXAUHzA35mxKoyTPZZyZRIQOJm/Z0YtPXUeRnqMMx/AIphTvP3YemLKqstycMp+wMT6xAgKEdIL1gMKwHZWqUW1/A8djhs6vtp/fDtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI2PR04MB10714.eurprd04.prod.outlook.com (2603:10a6:800:26d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 05:38:50 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 05:38:50 +0000
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
Subject: [PATCH v2 0/6] add USB2.0 support for i.MX95-19x19 EVK board
Date: Tue, 25 Feb 2025 13:39:49 +0800
Message-Id: <20250225053955.3781831-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI2PR04MB10714:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dfa7e04-ba3c-4fe4-bf3e-08dd555eae06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iuMklcWzRnPI6ThiGyH7lmXOk7HS3Dco7hvKIxD8q+y1stBoC231eVPQCI9Z?=
 =?us-ascii?Q?XNAldGrXW/78CGamb5gsIgp6tGrtCEHyRwYwN5AaCCIWfBAaNM0fb9eu1Igq?=
 =?us-ascii?Q?sbzwPWBj3h3S2Zf+wt6fiR/Uw6wj2uCR6y0WsmDjgQgeGPFjd9JaGkNE1eB4?=
 =?us-ascii?Q?hNf4ij0JmGueVJpNoTx0eTTPITA1VksOr3uESTMw6CpIr7zNfD4BrUBNcI16?=
 =?us-ascii?Q?NWi8wBU8l+AXGmqI0AdHHexvAyIEqFSLvQVdoVmKlZ0urOE90ptph1ulD3B/?=
 =?us-ascii?Q?7xRuoE+6LVAMw8g+1AGEbmyRsnW1i1uX1ySw8HTuZ+CgQhvhcAs+fJmnRlef?=
 =?us-ascii?Q?OCS18nYOseeBI3Ny/Uybr9bWYYjj9HDRR+OiXdUb7t1iboF6njj7bVJR8FwR?=
 =?us-ascii?Q?/Drd5fUyrjxO8sb4p4LFyx9zSIBjgLjcNrck9RNp0/QxhcP1o3FNcfgcn7A+?=
 =?us-ascii?Q?p5qCioC5ZxDfsJwSMVbXjsDZ/Xq4koqdIY9zLVYfmxTL7p9shAC7/PkqTXhA?=
 =?us-ascii?Q?HL5Z+JNo0rggCtWp7aNo/Jcm4wglN1eerh7lFCz+w+4YYME3b+Wq1dofKx0D?=
 =?us-ascii?Q?rEYFtKHhpNXeJU3QsFf3buQ0BhK1FfPGnuYRZh/DsQMBukn7rzkWBoOWP1dg?=
 =?us-ascii?Q?ZuZueYueg4rVMV6Py2Cvg36mwkTMHiWulB79cpF0XvDnn+HEOqRwtYH/tQ9y?=
 =?us-ascii?Q?+6Lab7PYIQjncOw6Hqgm3qdEtoVAw/mQK67CR1V/CPcJFjIyYTkEEeOXki7L?=
 =?us-ascii?Q?xNZJxfYj77DUTY2YwT1GDmEBIk03tbC47dceSUrNByTYdQfOu3VlOH9p967x?=
 =?us-ascii?Q?CBpAXXSWXuMfr4v54zwS8dSJqZ863WeKv+q0cDM5kSOA6fcy0w52fb22jJvg?=
 =?us-ascii?Q?fM1BfGgYk++raUJX8XahPfQ5gjoF7viYDNLaMsSYy2iALYVSj4F90qfdfyHx?=
 =?us-ascii?Q?TlnSef5OfTp1Eh3ffoc/Gq3rRjZ/0CylSy/T82UHFTfFH/mDuVFpqJMhcoI+?=
 =?us-ascii?Q?+sdFUTz2vie4TddbDYR4aZdL+AU6k/JQy3Xpe3nWIdXINgiq4SWVriC6gZYX?=
 =?us-ascii?Q?Mk/xb9T5Z3OxCZ/obnyLx2By0xgkwiV8Y+wBuceLgP3WfrQQxTudwzlXNraC?=
 =?us-ascii?Q?K3tM4RhyjPNv9TzjpCd8BlzusaQqSR2BsX+ZD56tV8i86/8x4ne5vK3bQzE7?=
 =?us-ascii?Q?Ege3l0ZGIC1c5bWG3lSOo9spNO3jMEAo27kOWgAlm8wh0VsGi5XUhjaiypre?=
 =?us-ascii?Q?K8OMXJcNXqx7I1SsA8sPwYBdcR2uY4P6XOzzURTCzdtE9+f52WcpkfmsuQBa?=
 =?us-ascii?Q?OnGOLSKPFat6XXUjHc4yrG3jAA+vT/GC4CNEdfaJrG0ec3wER8QP0vYSalYL?=
 =?us-ascii?Q?G7wL09gZf8zfdVXYXTwsCTpHw3yO7MrRmfMOhkBLfKJdq3Bb3w6ML1Lr+wRX?=
 =?us-ascii?Q?qesTwBdeQK+P0J6AFouW6nV6CKmqK8M3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+t9wyXfUDJKxGyq9mVaykUjSX8Ts8bfM94HzaMgHj0FtpsmVV7JcxGowxLCb?=
 =?us-ascii?Q?UebppDCCaZvHQiRY3fHAzXSfrOh8ir7qnLyAIynGva25KXSY4s3Z0IZBilRE?=
 =?us-ascii?Q?s8BaH5OwFjcixVoriOaxAdFiP4bGcDPZFvEiiq/PyPLCjzEcnIe3HlzFj5zB?=
 =?us-ascii?Q?0XSCTHj/9zeP3O1fTOGdNlcbZ1SrzURgp63S/vAPA5dDjQq4hru1qdF/N1E0?=
 =?us-ascii?Q?BgVEZrqxI3P7vckKOGn2EagxWMBbrKpm7Ols4cos0yjDJ4P2R4ygHWWFMq/Q?=
 =?us-ascii?Q?dEfIy0fA3sZdLfqjIjYT19BdIoxJkRTW7FLEb9kVWMPceMH3pWjIsrcPHGv8?=
 =?us-ascii?Q?OkZQ26qykOaFSeQkqv8QYKP7BufAcuRLKIntGdCWDHpMSr6YAXhJsQG7JRbo?=
 =?us-ascii?Q?GUY6JqZEP2+OFvjWPpgLUD77tKn29faXhLOcPmI3Ov9AcQboSKOj+Om8+R40?=
 =?us-ascii?Q?PTgfORjwKyk0hYBs7/6rbiRiZQd5rAED+5mMkINifZA1tBrA2X1FKU6xqPD6?=
 =?us-ascii?Q?saT9QLFyXv06R0PnYpagf9SmkAvXfzpdEOGfHCwM6jLwgS01r7rmZEEUiCtC?=
 =?us-ascii?Q?Q09vgVCgOXCNVwMwcw83oA+x35pCxckQ8VUUwUNJmpesX4cBiqnbP6rHT3Ie?=
 =?us-ascii?Q?eiax+x0mfj96r0Kdue6FRDeF9bpib1XjCrQDt5joIZnrG3VW9AJ0eW6eIl8D?=
 =?us-ascii?Q?o72RZvuOy9CFVsrCnjDahFFDmyPssYVBu/MW61dY3uBFd12YQ9TZUlLVm5ax?=
 =?us-ascii?Q?FZl3+X8aAcL3NK3EnkBomdEFOcwJ9ARDr2BHB4eucGtKgzrlhgl7lp4aQwia?=
 =?us-ascii?Q?fzGKWwMrk7+hP4nMNui11/Zgb0NkoLtq1AlK16AMMZIi+hQo2rM5O06IbYwE?=
 =?us-ascii?Q?D2jCyJrTcBci7rj1cw5eAh4zBGAu6BDtl3cxMJDATLt0t+XFJr/mw383meAc?=
 =?us-ascii?Q?uswwiLRXNDInorPv5DInYmplDPz3sOPtjkg2uiI2tlWMscLd0x5Nfs80TURh?=
 =?us-ascii?Q?CjfwwUCeav9zhxRiUStiTB4Fkl5JYXA82yRHrGZ14Lt5wGqqeVxPbjLP7sCo?=
 =?us-ascii?Q?yLkz0VSQKlfen6k8D4tSlLN85IwzPg3ThBkVG4arTRt+HTPq+laM8zJXKvIP?=
 =?us-ascii?Q?IQOh7Od8cck6iKm6NReptECwvbLuWd1Z9QUx0UfBSzD2sIvaYnQHJH1rckXW?=
 =?us-ascii?Q?uXd+Gczqny2IvPkPQvflqOq6b22BFyEYHnsOUMPqHtGMQodZzN0sG2yDoqaL?=
 =?us-ascii?Q?/+2waiURIuEXzwKlJaFNc/EEe48SQmhMs1x1+MjAEMMvt2JXacUqr7Gi1bLt?=
 =?us-ascii?Q?upYKvqsCKdV/kb7Ww4uL3YHbynLpvewXHYSs+MF4dtKaT/6vPI8jPLB7emJT?=
 =?us-ascii?Q?DrwhV5UDIGx/jPlRjd97bxA37dcKVIOOCIvABeQuGnr0YEPWQu4zK+9CWvA4?=
 =?us-ascii?Q?v239m0EhJLWv9DWuuPgpWSg9OJ7rLiNHHA1agHClg1DrKpkf7BWcF6FLvQuK?=
 =?us-ascii?Q?GSLDFwDZRJUNVn2q1WJzVXfoSIa8xmhf5oKDCUlTKDlv3gg3SZkq9RrELS10?=
 =?us-ascii?Q?hPSrxSHeF18HVPdX4OLFx169cyiidg4XiyklaTbI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dfa7e04-ba3c-4fe4-bf3e-08dd555eae06
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 05:38:50.2180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlOfRBPvVer3rASJQPT5RHIZ0EaNWETOBL967p9/rpcXxpgWJ2YIMQ8wejtNFinlhSCprBuyKkv7p6zCYIVQpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10714

The i.MX95-19x19 EVK board features a USB 2.0 Type-A port, with this
series primarily introducing USB 2.0 support. In the i.MX95 architecture,
the USB wake-up handling mechanism is integrated within the HSIO block
control module, utilizing a dedicated wake-up interrupt. Therefore, we
also implemented corresponding wake-up logic code to properly manage this
functionality.

For detailed changes can refer to patch commit log.

v2:
 - apply some suggestions
 - improve wakeup interrupt handling
 - add Rb tag in some patches

Xu Yang (6):
  dt-bindings: usb: chipidea: Add i.MX95 compatible string
    'fsl,imx95-usb'
  dt-bindings: usb: usbmisc-imx: add support for i.MX95 platform
  usb: chipidea: imx: add HSIO Block Control wakeup setting
  usb: chipidea: imx: add wakeup interrupt handling
  arm64: dts: imx95: add USB2.0 nodes
  arm64: dts: imx95-19x19-evk: enable USB2.0 node

 .../bindings/usb/chipidea,usb2-common.yaml    |   3 +
 .../bindings/usb/chipidea,usb2-imx.yaml       |  24 +++-
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  23 +++-
 .../boot/dts/freescale/imx95-19x19-evk.dts    |  16 +++
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  30 +++++
 drivers/usb/chipidea/ci_hdrc_imx.c            |  32 ++++++
 drivers/usb/chipidea/usbmisc_imx.c            | 107 ++++++++++++++++++
 7 files changed, 233 insertions(+), 2 deletions(-)

-- 
2.34.1


