Return-Path: <linux-usb+bounces-31195-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B639CA6023
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 04:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A81B631CC85C
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 03:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130F226A088;
	Fri,  5 Dec 2025 03:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J5G8qnvr"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013005.outbound.protection.outlook.com [40.107.162.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D033269CE6;
	Fri,  5 Dec 2025 03:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764905338; cv=fail; b=ss6Gwdj11IB/dIvO78nUdy7VqsPyVH9T9GDwbgodlqc4NbHvj+plIViSf4hxH9pMDDUvu9VuyEABbuf5sA5WxFXX8hA0fbmE1O+sLuQI0XPR3WbFrzeL4YwUdWbusvlm/tZnuJHGUAelfPsbpawc2RxhND+ZU5dIlLmwxY544iI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764905338; c=relaxed/simple;
	bh=NTxy1/L1AiRLH6tTB9YwrJ38xbyxszIm++60yVxMsG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BaDf3dQ9xer5BXDMQSxrtdpP2XjgiPk3+Nz2svPCfpngwBMAsbfMmIciCA14SQcLUIia+pupM7ieWLswR7VD1fgO+GOuSglYGZUZuNNkQskhNFv7jv480E4Sd8Gqh3wDHhBpusRbZ8kulHmwd3+UcKhRTTCURpnk09YUVhNoXz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J5G8qnvr; arc=fail smtp.client-ip=40.107.162.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEOVsc+39ORmwXrQuhLF5g+k+Mx9oV7iYAyOMoNLeI48fy/+eRDDKBpl9G9Xs9DWi8o64w5Xf4+hWCy7GXn7pHBKcbqs7M+EiC+TYSh2i8T7us8XSp3LUgdK5LqsUWb0zIzgCqsCXJMWp0ujLQcij076BKWyvK2U+MM7wmQU70WE5EPEqYF7J+UUsXiCP5zr7MwMFmm0kZ9AbICqqONF7uDQpQ4LNVZBlgk5ti9DywuVSMy+0lTujr0Ik9fvfCngTfK/tDnd+TCABn18jWpFVTDCONPgOu0I05SaIqRE1MgbX+FgSlsKcavAAynEoJzCyLfjK4yzrv0hdmtmobe03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6tzy8+xHUgSkB/cIEzWFoNVVkJcrh18P0s33L1leZ4=;
 b=Y4n6c6fsOG9q396+DU21qGQ+0gD7CWfnesUmkgLBbXux8B0LJgqFuhITWZZ7TjoOpK7ikdr3/uL8vWvNiYSUjydpN7qEFvuR7VDCfp/mYxLurz0Hjnl30I+ugjpPQL8VqZAT3p0Dx4lIKq5EUxIkCLHWffjvNAxUzG2oEn7X+tLTMFX6f4E6LbL4pbnghV4AHhCgige9pYbAE+8Y8SVWn4FN310q1xHdixxlLRFGSo0dYyEP745vMCH/l632NFZgteUtR6OVAj1vAMKF7BfBXXENq8dEMWQSl6ehmOt6a3Y/mnG2ComDV9eBqAniW3PLYvnMPLImcC1XGG6+w6P+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6tzy8+xHUgSkB/cIEzWFoNVVkJcrh18P0s33L1leZ4=;
 b=J5G8qnvrc+2WCIjK4L44338bvHvOR8be2IzyPZY9U1CgalT+OEQlziCx2g6Bg5OoFdxrTaW0DXIWkSouh3fzowhF2ptychGhiHj5uWYoYNvb1y6WImxoevA5fM7F2Xq3OPYycWu+v9aabg90/xbWIq5Lh1YoaUdPcffwJ7K4x9hQOHcs0Ukv8+2lxXO56Kg6QdU8ehyfln7x0RgW8u+8PpruGPBspOHwx2HRfWl4W/rF6r6wRHPFh4xkrankjjzF87DIOSVpV8rkaUr3VrycWauFnqSG3IaOM6cbMb3vtafOHs6PXk+6bq2UvGIAw9cV+TDeZVkSVss3z/bwloadrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9SPRMB0022.eurprd04.prod.outlook.com (2603:10a6:10:366::7) by
 AS4PR04MB9649.eurprd04.prod.outlook.com (2603:10a6:20b:4cc::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.11; Fri, 5 Dec 2025 03:28:53 +0000
Received: from DB9SPRMB0022.eurprd04.prod.outlook.com
 ([fe80::8c26:6739:46ea:171c]) by DB9SPRMB0022.eurprd04.prod.outlook.com
 ([fe80::8c26:6739:46ea:171c%4]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 03:28:53 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: [PATCH v2 3/3] usb: dwc3: imx8mp: disable auto suspend for host role
Date: Fri,  5 Dec 2025 11:29:42 +0800
Message-Id: <20251205032942.2259671-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251205032942.2259671-1-xu.yang_2@nxp.com>
References: <20251205032942.2259671-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To DB9SPRMB0022.eurprd04.prod.outlook.com
 (2603:10a6:10:366::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9SPRMB0022:EE_|AS4PR04MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c9bf98-fac2-4cdd-c074-08de33ae6a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|19092799006|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IhjNfDUUyguonJUE9N9wuUHtdwNDv4TeS96RcDqenbZ/ms+8KCMJNLA/zNOI?=
 =?us-ascii?Q?5Zd7FX/vH+MgRYLi/MTaE5W5HtusGuVLKma8VY1lxEYyxTIyTxTVAYAL8aGT?=
 =?us-ascii?Q?eRxITtrFO1c4lqGHAqoamMMDP5eC3VscmhHzOdUAp2foRNuuQihq1JLgLuT6?=
 =?us-ascii?Q?YI5goHBuG6t3SkLath1u0JsP/wU+nA98IpVEcYIrh8EqSPf24VfINKOtApWi?=
 =?us-ascii?Q?IRrsNj1HElXfCZvDmtLzK5ly3V+MdzhlvbyvSan8AWsx4xgwKvm/yxRg9jO3?=
 =?us-ascii?Q?mZWjYqf4ScX++wS1b5IYWEyPX6awEoeqXVZyf5ObE6OrVYqqE6ROfcYrD+0O?=
 =?us-ascii?Q?Bto+5czNv9CAhMW6bS+1Zc4UWhBSkB+pokpyqrCvIjsKapeEh+1TpcMMhIms?=
 =?us-ascii?Q?aFcnT5S7llzQBKg0VadCZ6e1QRwPo9bicLctNB2t5jTQa5lOabeA3k09qSpp?=
 =?us-ascii?Q?LMPXW/CZm4zWGNFeXjRT99kp4gM85f2k7QMpE5wRDADs0Z71wpT+mVZudckN?=
 =?us-ascii?Q?jVRrtFjjGkJXB/BFI/PAsJl67xfEDpUFvHXd4gzmFXEy+jxZ1MBEdYbeBpQ2?=
 =?us-ascii?Q?6odVLlAmZUGYjNY0Cq9m9l/8WzNRV2ME2TJ8UefU8yAbKO3NFUtstZ51K6rz?=
 =?us-ascii?Q?/uetvMUlSiOpvMr4+1Iu4Im7CgUITGFFYoCKtqCxpnQ9BlZdYwWS+JNk0ban?=
 =?us-ascii?Q?Fvaf4haDf0ZxpQIijZ3NrmQTvgoM9YxkFQm2jG86PLZ6CDw8pqcmCl8hS9UU?=
 =?us-ascii?Q?fUaZW0w7fPpDgoxwkfDAS4zsYHUH2NH8VSxfIw4raczllhQU4msJt6cs8h6Y?=
 =?us-ascii?Q?kGtqHHhNy9As5c8JBygSAxVj5rW7KVxbR9HEBQIG5mKNziFsUc08h8/FTjoH?=
 =?us-ascii?Q?dAjDrpO7oMj0I6xtQRQHzq7bgkZtI22TvTmGWYEzuf3OOvcGN9sqZYfu/NqD?=
 =?us-ascii?Q?Fr9tZQ4MMJeREspirGlEFsZvJ6hZP/q0BQCZ9en+RKIePwlJMytOeumngZ7V?=
 =?us-ascii?Q?9rHZ3MW8tknJeU/ZIEX3dYKdWTp6L+3YmYGGxGgkUcarKLUzbLE9jVjiq/Zy?=
 =?us-ascii?Q?79MkJRt0h4N7oDOb/Om65B/bpg66eHHk/Xm9+yy2sZXjJ8WYsafESdRyTlw/?=
 =?us-ascii?Q?0Gt/StPZr5ymYqOA9eReroZmFo4vqhoqds4u+7tnJgoy6SEIYi1rtvAFFL7E?=
 =?us-ascii?Q?wPHjobCduRf7oRvR6u18pJqITzqOM60JjyI9uSJ/+8rhHrXZGNY+Z6iQ4g/p?=
 =?us-ascii?Q?nhsyzxCHU/n9bB3osQVcrynumX3+AxBhuvINXQQrd384xA4ekLlB/klYR18M?=
 =?us-ascii?Q?PREQkSYCYUe5O2BkLpNFy9LVsnK1PaemLm0NqYLXNvu9pu8Yl7ud8GM5koYh?=
 =?us-ascii?Q?1bq4i+l5JJcrHDZapatIR+76cJOSlIJP0TbwhszZgfMNU6vQhvZX97WB4R8u?=
 =?us-ascii?Q?pi3hQWfyKUPd4QygSTfv6EwJVQjOdh1ORtMM/lG/kp4t7UJk6wIImOhEOChT?=
 =?us-ascii?Q?W+TRAv0S72JpW5ZIiIvupfsisY/v37Jr95by?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9SPRMB0022.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MW2NGbEo9gW37eMNbAL7n3SAnB8lbE+3zgkE9Xn7PE5kQ5s0IShVtIx6agFB?=
 =?us-ascii?Q?OwTxzdaqrqcY1W1dqyRilR6JEVIytn2D1zJIKeiPEIND3wEbhjtS/uNoKRaQ?=
 =?us-ascii?Q?O6g+bOelJjnAMsPoO64vx/7NuW+bQO3VjUyVjHvoieawy+lVTURfksHZiK/P?=
 =?us-ascii?Q?KqDYFj9KA4gkIW4zYjDK3GoNILfG7T0JpOG0py5hQ8RclIWmyJrJx8ncc654?=
 =?us-ascii?Q?ZdYASv6NsLUERA1V68Mr5TVqwRIG+rgVbQYwdrUDZyj39w/Gg9qkdAaY98Bs?=
 =?us-ascii?Q?Ld+YCytCXxbPnLZkJr7ZKg7LtF1pzCr5IgG1c+Jt9sICwYt0kOx4OtvaCfMw?=
 =?us-ascii?Q?bh2TFk/xDAOoY6LMkVrftp3DtnhBdywGVsA5wZP7WreoW6XD2Q4wQhYAsrf+?=
 =?us-ascii?Q?ef0tfzVlAM+Qwwfu4tUtC6OgeKwePOwQ3/gCd6gGsSWiPSi355La0hlsf1rb?=
 =?us-ascii?Q?ubeTjbIwJHTo0GnbXRmQIaeYUAuxAimC2g19nTHqFu2A4kU8bl0Ll1WfFAzx?=
 =?us-ascii?Q?Ye8WoNF/wDiUf6OHgKoqmlN12Wl7lJuedSmMlmzONjdnx0o9rwgqFtQqsLQS?=
 =?us-ascii?Q?dOMdve2FJRqqXuIOaaE8qbWo6RTdZM9Md3nlQMZFEw+n80DZgdP3i4fRLKmv?=
 =?us-ascii?Q?QEuPpn1kROUB8gbkrA3xyuPGyL076oUfn4BjHcU29ScXSOjD7q0uTUCvkf8z?=
 =?us-ascii?Q?5SeqQpuIZq7xL3G5buelf6D7T0/0owDZusbbBtJ1lpuX1Tx2iA5TgrIKD9N4?=
 =?us-ascii?Q?48lecXPxXvEpFDLbPSo3XuDJo5du+VoaGKKtsKs6Q1bd4GfFfHABNOqkKYxC?=
 =?us-ascii?Q?/ByyLUBFBEMUyaaI1HvMwfHb38xuu/h5pfwFq96Vo/PDmipprBpqaljSGIRb?=
 =?us-ascii?Q?vgDXQqxTp1mZs851qqIGKnsJCPZTa8kNqODZcrStJWTelLTIEBTzb0f95pYf?=
 =?us-ascii?Q?GpK5YFK36Z4yQG7rOoaI/WvYFXixCK/6lHOzzJSyUmL3nDC32TtHVtY5wFl5?=
 =?us-ascii?Q?bI8JbEx1Oco3icBjYQ07E2F3FZwfQkNwUmB+NqF+JlTSskMdFfX6f3BFtvI5?=
 =?us-ascii?Q?qasglJKPDDAbDMcZz/6++K1V2XLE9NX0j7ssuHnroLIldVyDoN/uYnpqM/Ex?=
 =?us-ascii?Q?AUlPUz7B3FV33BwPBQEKpKb+/WkKL7NbO9712ek0FxJsWkVnta7D/Y1neYXE?=
 =?us-ascii?Q?QdjG2klrtOcU6JmPO17P8sVhzG16S1NL9OtZR/nfd1R4THPW6juMGSZFJyCb?=
 =?us-ascii?Q?piVaFl/zPLV6nyBLqoBrBcc7DEkiAeMNLjOJwoQL3EZSJ5i8JZvt1WivFISL?=
 =?us-ascii?Q?w06fLbh2DBptKy6R/hikYijAoFSU3hdj95xp/RVxjrJkenisO9HujTNGV7QA?=
 =?us-ascii?Q?qJmGeiI2Oi3InNaxRxNuC51Q9aeqH+V9p3ZjheP8C5OodIFlPRqGrEEeIXVa?=
 =?us-ascii?Q?kQNM9rNwZ6x1K2rhupZRHVj3N17wNLfMx5zC8TCY7/NiIA8semXPlY4BpNk6?=
 =?us-ascii?Q?upojKqvypKTpDTEGqiIT8KxMbpC/T1IhD/yLgqPAJzhE+UxV2aoDjWYUEvye?=
 =?us-ascii?Q?1qjIIlzDc+faHAA7nCeYp9YiQgTN2/lg0T3KBF87?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c9bf98-fac2-4cdd-c074-08de33ae6a1f
X-MS-Exchange-CrossTenant-AuthSource: DB9SPRMB0022.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 03:28:53.7939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyEFmd2agp5gsFKQ/EU9S8hen10ZeXUgiKcWUPdV9+wh4e4yZGu5mySEoAem6juASBnQx4PIreTzbvH4Zl0jUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9649

Do dwc3 core auto suspend enable for device and disable for host
, this can make sure dwc3 core device auto suspend setting is
correct all the time, the background of disable dwc3 core device
auto suspend is to make its parent device suspend immediately
(so wakeup enable can be enabled) after xhci-plat device suspended,
for device mode, we keep the dwc3 core device auto suspend is to
give some wait for gadget to be enumerated.

Note: It's a temporary solution until we switch to using the new
      flatten model.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add a note suggested by Thinh
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 8bece4baecbf..2e13ca588f42 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -158,11 +158,31 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
 	return IRQ_HANDLED;
 }
 
+static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
+{
+	if (role == USB_ROLE_HOST)
+		/*
+		 * For xhci host, we need disable dwc core auto
+		 * suspend, because during this auto suspend delay(5s),
+		 * xhci host RUN_STOP is cleared and wakeup is not
+		 * enabled, if device is inserted, xhci host can't
+		 * response the connection.
+		 */
+		pm_runtime_dont_use_autosuspend(dwc->dev);
+	else
+		pm_runtime_use_autosuspend(dwc->dev);
+}
+
+struct dwc3_glue_ops dwc3_imx_glue_ops = {
+	.pre_set_role   = dwc3_imx_pre_set_role,
+};
+
 static int dwc3_imx8mp_probe(struct platform_device *pdev)
 {
 	struct device		*dev = &pdev->dev;
 	struct device_node	*node = dev->of_node;
 	struct dwc3_imx8mp	*dwc3_imx;
+	struct dwc3		*dwc3;
 	struct resource		*res;
 	int			err, irq;
 
@@ -240,6 +260,17 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 		goto depopulate;
 	}
 
+	dwc3 = platform_get_drvdata(dwc3_imx->dwc3_pdev);
+	if (!dwc3) {
+		err = dev_err_probe(dev, -EPROBE_DEFER, "failed to get dwc3 platform data\n");
+		goto depopulate;
+	}
+
+	dwc3->glue_ops = &dwc3_imx_glue_ops;
+
+	if (dwc3->dr_mode == USB_DR_MODE_HOST)
+		pm_runtime_dont_use_autosuspend(dwc3->dev);
+
 	err = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx8mp_interrupt,
 					IRQF_ONESHOT, dev_name(dev), dwc3_imx);
 	if (err) {
-- 
2.34.1


