Return-Path: <linux-usb+bounces-20999-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90112A434BD
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 06:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8909189600D
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 05:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB112566D1;
	Tue, 25 Feb 2025 05:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J8YTw6jO"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE72561D3;
	Tue, 25 Feb 2025 05:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740461951; cv=fail; b=ZDXqqfnGwZE5XOWbXaTT8N5N1JLkPocWlG5ezyJ56Zx9L9+k/Nb3KNWR2Voo/nkIrKuDr4Qd8GJhHVDL+OQoogsB3janPZRcRuDN+8Oo9jic0hyjYQa3pDShtVn3qubCCUDDq2+4PouzBaWvXM4wQ9Mz97/sGTLHhHKNBVsrCEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740461951; c=relaxed/simple;
	bh=9v806xi+F8+X/eCg8ve4MKfCu7gqEna7U0W9tHIXTdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ux0l5F4YVGJ+3CrF+idNZ4vs7b1Qt9VQOye3z7WgYwAdv1gse/uDr/JUbw2dOJR6uijfvbQc7CwdF38khD2wQ83prCxgR4XnjrjhrZzOLpNK8a3Cy6RZDrqfeu+rPUpevSVqkZhaC+MGrfPzncBoilISXUcTpVbyZ0rBZRjnp+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J8YTw6jO; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6pJIfX7clJZJqbbQewzSv5kiHMH0wG4TdJEFyzu13gNUKsJtv4JDO1RURDengGPD/3eY8PJXsNiaUuMFcA9f0Hk5SHxx2q7BICDY4e2HMUw4YQidawlxluHHRZdO7lHN65wicqf+IVPiCRl4Q9YeH0rGl4WKCWxPfB5FSzlUY0YrXG/UOP2Kf0rJ1kEFUNrIlNl1oalgUBn6RFvWqrFCiMK9LKPatV9sBf+tuxV/nFRYt2395Ow2OHDSview6ySFwdsM3G1MeyFH588HfKQuVTnfJaYpquXWoY9exRRS01BTsmPNeJpNz6t/o1LPDtDSVgb7X4sZ0ZAgarTFKZigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzdaklNVYjAxNLz2a93mG+iUAcGZmmYL1xBzrIwmjHQ=;
 b=o6aIfYKZ4VRMKpgYJ/IDPGuWD2tVlVAwwQQFlwGRmRfzCzbONOYkClv0e/XQ5QGqJcbmscR911mqoWMp3ZOINcIHwgoKhfQe6RlanOru5eWv5FCB6UQzXxB9sIoBWuwgdSjQ7J5O9G7pkKObzt5GbQQxDXLxIgTDcCxn2/ZWLkcrtWdU65AVMZnQymalQn+QXQ1kuTVfPGyQse8uqVX+1laE0lXk47sm8J89QgWblXGLxrDFNtWmVxuhj+Mu5erhmBdtwtXBrqWl3EcreESWqLsyUXPMjN21XQSN3z+YKUcUeMhH21NhRcGuPK4IyxQBh7O401KR7Oor7XGAAmR/kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzdaklNVYjAxNLz2a93mG+iUAcGZmmYL1xBzrIwmjHQ=;
 b=J8YTw6jOgnA48fKrRLyVWQCly3YS6ZZo2unDIuv3sc1IReWLEM90/A2PYTH4xDQClF+V89Wr/ejAVjTK3WJUYEzK5THBohk/iV3Jmtfk0HaIh6RnNiJr8pXtVb7UCktTw2wqD5a6cWQPK9SKuFmnUWM0ecDUVdhY9LNyrWubFUKjdExZt/Wnkffe5KXSNwXt+ClJ2ouF3uxsbjkSK/PUk0IuWCU9Awm6P/f6uE4DEJnRejmanebYwzmwrSKpCat2PoJ+KzhdwIGI8y8KIJV8PKHso8eg2YGX8x87XeZc0CX+m+bQi7MHK9VFc3rhyr6HuuuLYWL3D58FfTfh+EmDsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI2PR04MB10714.eurprd04.prod.outlook.com (2603:10a6:800:26d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 05:39:03 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 05:39:03 +0000
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
Subject: [PATCH v2 3/6] usb: chipidea: imx: add HSIO Block Control wakeup setting
Date: Tue, 25 Feb 2025 13:39:52 +0800
Message-Id: <20250225053955.3781831-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225053955.3781831-1-xu.yang_2@nxp.com>
References: <20250225053955.3781831-1-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2f3354b5-bd2a-4615-f6b3-08dd555eb636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tjLe5ug7rxdxewqypjKlyehDRwTfPDzoIqHRrK5cOLrAdyhwGGUOB8MzDtPX?=
 =?us-ascii?Q?dN7edlLJiCkywm4spg7mnFFtgT4fQwDn8aI1mCkNyb5k/Del5mwqwg1+2DqA?=
 =?us-ascii?Q?yLFqwrsNUjvImf0xSUTQ3RjtCY0xdenTqX1uUWduSXrIBTpcT4RyMVxCfDRD?=
 =?us-ascii?Q?t0Aw+/h6ulc30LbKyo4jBfXDHLLM5wMVWmnn298T4NwUJ5WcdYrp5EJzv2Qs?=
 =?us-ascii?Q?NDLyHiDijfuk8fYY0bCzM7DT+OhLhfelUx8QWDF0VN2v3eIGzQuUpUBA4Npk?=
 =?us-ascii?Q?BSWDf0KJdDobYI9DL8q9nxFt0DQnXzsD9V0xH8WmHeSVh1mnhXU5M/t4LQlF?=
 =?us-ascii?Q?lkHpbDKsJ+pg4sNWxFuzc5016d10hQU9rgH13TtQHh1lM6RRFSX9fs5Vgi4x?=
 =?us-ascii?Q?rO4QTGTnGy0Y/F06nZD34snEzDAra0kEEVzecwCKYlkXIDT+wOkf07UgwgsL?=
 =?us-ascii?Q?qeMfVQbNCD9CLTo3eNEShHDbl1TkdmUDB12iwgnvSaxHQDzUvu4q2QWHyNhN?=
 =?us-ascii?Q?WIWtwf8MKXFVbPE92E2Kfj2n2jNV9jKAZ7TqMJ4g7Gd1fr+b6tHT+SXiUlnv?=
 =?us-ascii?Q?hEUUXAvsKG27axhal/gZ/NzVpIPHcYsEfNjf5pO6HIlNKYgxbBauADofGC3D?=
 =?us-ascii?Q?HmFc0+sKXE8ey730nEMEdXaNNMBCERQNAFLor3naWd/kFEx0w/2Sbv1saivQ?=
 =?us-ascii?Q?iJbLCPtGKJbGDb6RPA2Ar214ST9YJXzEcPpRAgDwMLQPbmK4OwjTrmDdDp9w?=
 =?us-ascii?Q?MJVJ3SiWiEx2eCQSxNAY3CMeqX6xE2wAax0CkhKBBi0RW6iOXRfocPKyWh5Q?=
 =?us-ascii?Q?F6T7bGqsHSIR3xsTGiAocW8vJ5cnNGQQKJ2IWz8sISp6usA1sJ97NKw1JDzW?=
 =?us-ascii?Q?TXZ0BhHtweg8oSIYoqXmwEwqy5hnwfZcXsZDzy7qeQR0joUpgtzcIy5Xtvmm?=
 =?us-ascii?Q?taHHMX7IZq0u2OkRyCl6FrbVRjFIMUPB1F8o3Ptbcxn9RMzbLQl0Te0ey72d?=
 =?us-ascii?Q?5POs2ja2DXonLbSlB8nSHDfsdOVYGE0MaExqWPGSN6O+jSEpvfMWUyjJFcr4?=
 =?us-ascii?Q?6UwaUPsYqpgvJWyxziV77S20GlrjvhcCmD6gHyIAmpaXBzce57QWhkbdiT9e?=
 =?us-ascii?Q?mowS3hHmdS+EPjO0wcRfJEPXfGPydhhOpo+B8TurpjE8aqjrGrtwBHTuQTTl?=
 =?us-ascii?Q?Kiisb1X9SnssIhxrOChN/RjKS7JGyFVcQXiRK6ko/QGH8BdFBKSx62Hs1jOa?=
 =?us-ascii?Q?1BwQPAfc/tAoOUppLBM6VKkW/hNrB7E69alAyR/BUJ1e4a8rWmL45EYTlC3g?=
 =?us-ascii?Q?VSnyVk1CNWYWutuQT+qjbQ/xixac2zNZh9YI3xSZP7F9NSe0zhBlhhCu6iYb?=
 =?us-ascii?Q?lUWp9SBDaIcL5eHtdIFKjDoMzOpIMAs0tqH1MrkQX4cnlhy+sv6wycUoMgsE?=
 =?us-ascii?Q?xDEB9Xzymz+03c2X+Dwey6t9DiAEE4Qm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k1bB875XCFAmlfbvlIrfFFf3xIUoALEOYDafvwOkfMxygi9bMABFTnig2uYJ?=
 =?us-ascii?Q?W4i36WNtSfI/Hypwj3FSEngzIZAo98LYBL8kk/jAUsYr0ltzWnwTsWojf35K?=
 =?us-ascii?Q?p66/Gx/x0AyFsBegblds+D1YfesnxPDmRLs372z4Ynamyg7lB+N1JIdY0TOt?=
 =?us-ascii?Q?1meKrOsUqJi4+uWB6aa2mOyVzsTZJWUgi8cin/40MhK2M4L3YwI6mxBIGQjO?=
 =?us-ascii?Q?59Q6d2xKOkSg07uw/L5gHLH5QxOH7OzC15LM1X7xfAjrdEnO4wn+2g/zV12O?=
 =?us-ascii?Q?F2qSuY2c78Mn9DPXUOItnxZ5zjIgTjTh2JiVQyl/vfuT4+bL0pkAAIqfBw+o?=
 =?us-ascii?Q?9hTNjVrfEzFDEf9jGYSC7jmKDIzw0U2YPr+32JaRO8OvWkGk5DUqLE80ZZtN?=
 =?us-ascii?Q?1ZFkmstSU8i7Qlq49aMdhm3NqHO7MgrDZqF0o+ccIQke0lWvTHozHFM0ZR6j?=
 =?us-ascii?Q?I53ASNu8jMHy32FSEJSCduSuFJtta0TJwCiSAKKpXLQa4oDWrFQpM75DYMC4?=
 =?us-ascii?Q?kEzl56gFKOr3W51hVRHub7extqGLugaAQfGiz4Fu2YDmZGmeX0VSKB+Uyto2?=
 =?us-ascii?Q?3M68iqW6KGjlJoya3ok6L2wHP1vN1a3KpoL0jt9H/LHl6wRamTkcBiPjEZLD?=
 =?us-ascii?Q?lDo7MDaOYSPqXHyTqyoVvqt86YSjz3uXN1PHZcYfO16dbik9zuSs6mOckoSV?=
 =?us-ascii?Q?jx8RKbrBC8hAoeVjqyV5O+V+9SGWZNzi3cymcOUkQUPJ0D96ljvpLeVKITy2?=
 =?us-ascii?Q?qToZvTCJquzSFMoxjTA9soqTPOPMeVklyp0JQJWAxClqXSdCf1knT59XHghL?=
 =?us-ascii?Q?uJEmFXKv6bJa13glluQH5gNlZbttf83LC5Oqwt49KNN115iWLVuj+uXkzS0W?=
 =?us-ascii?Q?RnV0O4i68PIQIS//pZ6iqjlndemKPVekN4309/5eTLFbZVWXgZwu5kzWy4A2?=
 =?us-ascii?Q?ZwVQpyY2dkB6tl8TJcDwuEKxAhOLpGtoeDY5qt43GBnNKcAhMJwHdyu6lvTM?=
 =?us-ascii?Q?QvoO8MuLh2CCi0CLQHL5Ys49wHk3O9HYwWyCUMKAMZij9PJran+Pc6SjJuJj?=
 =?us-ascii?Q?g5s71HUuUgROAaGTEPDLrTFXFUZlbBLH1RbLcKlTouCEQvLGxAbyJP/0rYH2?=
 =?us-ascii?Q?eodRUyAfvanmO1vmSKaWYU8EJ9WSnmzb3wU9Zj/XQxtOpJNmK87V1+i8WHW9?=
 =?us-ascii?Q?491naGnF+ophMQZ4sl1u9LtXLgeZcfi1j5RTNIK1YgMx+lgUaHP1Qlf9EWXC?=
 =?us-ascii?Q?S1Zqb/tOiPd5Kc6exomane2vrDk2igBaDSYTCTreKp+ydcZJeEjqdzpRFPzW?=
 =?us-ascii?Q?kWY/gtmVjVZtnJOYCcdEvxHec1wXMijua58/N1DqD1ia4qqy+PszJkQzDaJu?=
 =?us-ascii?Q?L37S4znDc5z461cqlTv1yxf5k8b00QaTni/5fYYhINV7T5PJnctbqX+pOn3C?=
 =?us-ascii?Q?qbEBiluIojgJu4O99cB/EpcpcFMJxYrmNlLz1RLao2BlGXwqJuVicOLaEaLD?=
 =?us-ascii?Q?1qkyqkAeqzXdwO/Q+NkYDDoWGwAz5f1F+L2tAGaLtazO0xXHiY7wfxbqJoK7?=
 =?us-ascii?Q?X6QgCf9RBTrAVwE8PKpaCk3BYuJk6cheNQdx8U7u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3354b5-bd2a-4615-f6b3-08dd555eb636
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 05:39:03.7565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6TA4LT1QzHcC5zwafuCtuXI8TJCzPMjMYWZda4v+/y/csONc1bF0tQnYDw8YVWOPn5e6ipFYVEYyVJvnQtHyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10714

On i.MX95 platform, USB wakeup setting is controlled by HSIO Block
Control:

HSIO Block Control Overview:
- The HSIO block control include configuration and status registers that
  provide miscellaneous top-level controls for clocking, beat limiter
  enables, wakeup signal enables and interrupt status for the PCIe and USB
  interfaces.

The wakeup function of HSIO blkctl is basically same as non-core, except
improvements about power lost cases. This will add the wakeup setting for
HSIO blkctl on i.MX95. It will firstly ioremap hsio blkctl memory, then do
wakeup setting as needs.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add Rb tag
---
 drivers/usb/chipidea/usbmisc_imx.c | 107 +++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 1394881fde5f..f933fc70be66 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -139,6 +139,22 @@
 #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
 				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
 
+/*
+ * HSIO Block Control Register
+ */
+
+#define BLKCTL_USB_WAKEUP_CTRL		0x0
+#define BLKCTL_OTG_WAKE_ENABLE		BIT(31)
+#define BLKCTL_OTG_VBUS_SESSVALID	BIT(4)
+#define BLKCTL_OTG_ID_WAKEUP_EN		BIT(2)
+#define BLKCTL_OTG_VBUS_WAKEUP_EN	BIT(1)
+#define BLKCTL_OTG_DPDM_WAKEUP_EN	BIT(0)
+
+#define BLKCTL_WAKEUP_SOURCE		(BLKCTL_OTG_WAKE_ENABLE	   | \
+					 BLKCTL_OTG_ID_WAKEUP_EN   | \
+					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
+					 BLKCTL_OTG_DPDM_WAKEUP_EN)
+
 struct usbmisc_ops {
 	/* It's called once when probe a usb device */
 	int (*init)(struct imx_usbmisc_data *data);
@@ -159,6 +175,7 @@ struct usbmisc_ops {
 
 struct imx_usbmisc {
 	void __iomem *base;
+	void __iomem *blkctl;
 	spinlock_t lock;
 	const struct usbmisc_ops *ops;
 };
@@ -1016,6 +1033,76 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
 		return 0;
 }
 
+static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
+{
+	u32 wakeup_setting = BLKCTL_WAKEUP_SOURCE;
+
+	if (data->ext_id || data->available_role != USB_DR_MODE_OTG)
+		wakeup_setting &= ~BLKCTL_OTG_ID_WAKEUP_EN;
+
+	if (data->ext_vbus || data->available_role == USB_DR_MODE_HOST)
+		wakeup_setting &= ~BLKCTL_OTG_VBUS_WAKEUP_EN;
+
+	/* Select session valid as VBUS wakeup source */
+	wakeup_setting |= BLKCTL_OTG_VBUS_SESSVALID;
+
+	return wakeup_setting;
+}
+
+static int usbmisc_imx95_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
+	val &= ~BLKCTL_WAKEUP_SOURCE;
+
+	if (enabled)
+		val |= usbmisc_blkctl_wakeup_setting(data);
+
+	writel(val, usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	return 0;
+}
+
+static int usbmisc_imx95_init(struct imx_usbmisc_data *data)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 reg;
+
+	if (data->index >= 1)
+		return -EINVAL;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	reg = readl(usbmisc->base);
+
+	if (data->disable_oc) {
+		reg |= MX6_BM_OVER_CUR_DIS;
+	} else {
+		reg &= ~MX6_BM_OVER_CUR_DIS;
+
+		if (data->oc_pol_configured && data->oc_pol_active_low)
+			reg |= MX6_BM_OVER_CUR_POLARITY;
+		else if (data->oc_pol_configured)
+			reg &= ~MX6_BM_OVER_CUR_POLARITY;
+	}
+
+	if (data->pwr_pol == 1)
+		reg |= MX6_BM_PWR_POLARITY;
+
+	writel(reg, usbmisc->base);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	/* use HSIO blkctl wakeup as source, disable usbmisc setting*/
+	usbmisc_imx7d_set_wakeup(data, false);
+
+	return 0;
+}
+
 static const struct usbmisc_ops imx25_usbmisc_ops = {
 	.init = usbmisc_imx25_init,
 	.post = usbmisc_imx25_post,
@@ -1068,6 +1155,14 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
 	.power_lost_check = usbmisc_imx7d_power_lost_check,
 };
 
+static const struct usbmisc_ops imx95_usbmisc_ops = {
+	.init = usbmisc_imx95_init,
+	.set_wakeup = usbmisc_imx95_set_wakeup,
+	.charger_detection = imx7d_charger_detection,
+	.power_lost_check = usbmisc_imx7d_power_lost_check,
+	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1289,6 +1384,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "fsl,imx8ulp-usbmisc",
 		.data = &imx7ulp_usbmisc_ops,
 	},
+	{
+		.compatible = "fsl,imx95-usbmisc",
+		.data = &imx95_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
@@ -1296,6 +1395,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
 static int usbmisc_imx_probe(struct platform_device *pdev)
 {
 	struct imx_usbmisc *data;
+	struct resource *res;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -1307,6 +1407,13 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (res) {
+		data->blkctl = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(data->blkctl))
+			return PTR_ERR(data->blkctl);
+	}
+
 	data->ops = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, data);
 
-- 
2.34.1


