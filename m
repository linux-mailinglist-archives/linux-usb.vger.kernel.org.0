Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB50853F3F1
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 04:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235955AbiFGCdp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 22:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235952AbiFGCdn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 22:33:43 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140071.outbound.protection.outlook.com [40.107.14.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25ECB87C
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 19:33:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4rMvepMalJY/C3O7rtH1leZeArWltQh7bHqZ6Tr8Nz4tYoj0LWX9nV7Nmc0kl5qt63aVyVxGAnR23SoTV4Uc7yRe8lrxjNJsrcE2OPDX9IKkgb9rdt683NokYuuxcFv2Dx8y9NjModzGzBA+sv/Cb7CAOEquIhpugQhWhQpacYsP5IZyXyD2SCZjnXE/qC17PEZKRJn+ZrRunmcmPaI85HfA+JoLoiloGgqYqCyUqkg7ok0AVvhm62LzS88NTEkbfyRaRtWYAx3lnqLVGtOFrNmx7cx/0493LcMB9PC6S8E5bKp53lAbs4+wUf2z51+j9kuZZEHB1KiXyVzBOXRzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziAXGaUHv8Q1cbBAOtn5lbi2MRDbTLZiAjglNPdgfpc=;
 b=TpTevf2LpUhSopz+zkt7Aicnm1sTSwILKIWtMVDJNiOePdygDjv3LnlpQ1owxr+/KEFTCqvLrtuVz3fAEWXLXE7R0prjT/1HKZXme1NpWorumQHKpp2S/YQR9Ub8DkLDYMOkKxyZuHKv23EZhW278KgcFX86MIp3Tt2zuttcA4bcZoKgcUWg9xVXAY6PaozmfJv6ImxEH1XsDAaMxYP9FNgzGIWVVa1oQLn3IL47m0Er3Fj3UoMCO5GPGFR/n5W0Q+QVd3sUA+I9PpGxaKmTGJyQ6l+qu29rMDAaqEn86TaC4KLNnR7Gp1rr3R6IIOdkAVPwmqMPyHDElbLE/xYm0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziAXGaUHv8Q1cbBAOtn5lbi2MRDbTLZiAjglNPdgfpc=;
 b=gXNPqUHFWT5f9UeCTFP5MJlVh9jwcuJss2Pt1YJxcTVM+zpWYlA8+2nC3JALRLZ0ZpSWkyH5RI+/54oxPK0HcZnlKeU+rR0j5VogPq1LGyft86JOpTfh7zNQOUII3L4UCzMDn8ObXoJcrOlGuHhgKGjGKENN2AZTGH3C4osPZi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by VI1PR0402MB2893.eurprd04.prod.outlook.com (2603:10a6:800:ba::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 02:33:39 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::10c:56e5:4208:3c4f]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::10c:56e5:4208:3c4f%6]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 02:33:39 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        jindong.yue@nxp.com
Subject: [PATCH v3] usb: dwc3: add power down scale setting
Date:   Tue,  7 Jun 2022 10:20:04 +0800
Message-Id: <1654568404-3461-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::34)
 To PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50f76f09-e59d-43e0-8430-08da482e2125
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2893:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0402MB28933DE2C601BAB4EAF6E68D89A59@VI1PR0402MB2893.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2/5khHb4vSMn6cpeDWy0J8Q6pcxmJ0I+Ksg6Bb7+TQ51xWyCGcOiB+Jdn4NECphk7uPf2SYmjyz2OFXm+851agOQMBFuXgLCP+zyEYoRwySPA29o8MsQL+OfdFwDFHdKYccg7ojV7U8yDlbXE/PXwlShnTC2Q/uneLKHg5VLVDywmszs0w0FN+Ze2LfNJBhFLAiHJRJMpbMvSjj5kPcs5KgWBwu1Gw+BoTgNQ/ELeTsDxmxcO83Yl/eNAvK/Cek9JT7poRo9WRZKtVdnMNCHDpWEfLAs/LopbGE1VzsgjmUviib7PVPDbrdy+jypwIx20n2HtCRoe8JPSso8P7oHU0znsvF84t9xOYC2hEP1YbL+EvQfZud67WWp+6q8d7q8/6kCyoY5teguSJD2330KcKpavGleJjmcnF2YWHpXHcRYpI4dlBptua9zEFdjFk96kJd2NZ3yRnFZ5PV6B75YrDyrOXyu9mKC42NRcL8FKgihNm1gVB7dd0vUZwSxevjkQ7A+Q1ex0/cE4YyrSb/K9RNAU+VB6bqfC9L5iJFXeMmwkCZQ2ilzOnSlJJUKoQ+AJqznno8lrghUoy+uiQ/OQV1C6no/Lv6JWACCuS6xY+Y0nVSOtcrhWOe3tLsd5kRqv6UtktqF09D1KK8loHo0hX8l4AjqgGcZjaO0z2tCLJc01GlKwJVZcpPOavXwhnKdY9lt2BTJ06NfGGEo7u8n2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(316002)(6666004)(186003)(83380400001)(52116002)(8936002)(6512007)(2616005)(508600001)(2906002)(36756003)(6486002)(38350700002)(38100700002)(86362001)(6506007)(5660300002)(8676002)(4326008)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4S36WCkGFCRPeCbcbhC7mri9FkAZ3kOf0rK4nNIfyqYbl5+hRuydh+rSdPsd?=
 =?us-ascii?Q?AoQoTxUjj+pWcHvALznoZRhwGsJGZHxx7wC01KwEulK9GCJR0DKfISatFDP4?=
 =?us-ascii?Q?30E5tDYVmv4Ifg785aCo6I8I1hnRkESffZ7mWtvkAOzzGnd1Rn+R5hW/p+He?=
 =?us-ascii?Q?YwDCz8IOTixqJJvOyFZCiwUO/YV98eTpJFaPhQHvW8Jl5ioZL/P/AiLtv/2o?=
 =?us-ascii?Q?0fkWpHl8QFkQBpWyT7GYiVTRUiG++VTqtdTZaQ8NMmMoidrYAbAJ2qZTHk+A?=
 =?us-ascii?Q?4nQTXbvadq56tE9iyjKlkVx83vmEPkszr09Q2jAL+y2lCW6oGnFERcxGv+2p?=
 =?us-ascii?Q?0pc3cGd5olXlpEINhkVwUWgNetPnNP9e1iMRK9wMPUR0x95CEFi/MmYqgKqA?=
 =?us-ascii?Q?LazraNJCkXgAe4FOGiokzZvrIYhv4xgzHa8Qctta6Efahr3HvFG+dKMGFuLn?=
 =?us-ascii?Q?1utZAQAnl+5dng3kQJb+fZXeGTe++gOuuFNif117A+M4Z43833zd+2PHcakH?=
 =?us-ascii?Q?KKo+5HZ2hktE/4wqEoSZGL3+FDIFYTB4vZhGvVmaLaLuHxCCaNfl0HN5hNKM?=
 =?us-ascii?Q?wffkMgEspLv8lQghZqfEic+v7b3Y4G5ediCPA0DKeZ4aLLYLizQSl1Wvi4Nc?=
 =?us-ascii?Q?Lh3ShUDC7JloQN57q3vP+a9IxHnyvsG5BP7ddhtQYuIz8+DGdoNuDFkxvYCe?=
 =?us-ascii?Q?JOdmjZSLeA89tE+VUHLtTYQaa8xvgH9wtZr3lzfIvWbq8e4d+U1cJk+bTdkd?=
 =?us-ascii?Q?Q8D2o9dKRteGRHEuB9dAcikdJkMklS0hOZHegYWHWy4U+OcVQ8EZmFR07A3e?=
 =?us-ascii?Q?Jc3HBo8DfUZhCORkRx4UCkfqh/F6XUv1bQaLI6ydDsF/r6MaXtCeYj5Yx6IS?=
 =?us-ascii?Q?VMDBjoqenQINNthF3nVegTmOK9/vgCwTvh2RMgR9HkJMQqzQ4NVZGa7rf7o4?=
 =?us-ascii?Q?BYAI4jJiXOEA46/uPi8EDvGqsekRTGmKqQSNk8ixERmT5Q7cbZkiqM4J8TZd?=
 =?us-ascii?Q?mZWAc+InT4zHAed52qJllCJb1we9cxdiTFg2Li1KuhgkpflrKFvd9p83rAWG?=
 =?us-ascii?Q?3KXe4MgZI7kI91mV8V05G6Z85fvMd2qU7Z+iCEO+RJR2Lng2FjmFuG7NXgyB?=
 =?us-ascii?Q?1KNnfZPPypE5HbzVzKMcVhruZ2xNWqrjul/mdjscLdAuX/ymTRRkRMCvz0RI?=
 =?us-ascii?Q?NXK9H84v6h0o62flmSghM5rg53kumWVwpO00Y9EIWl7LLTvYQRXvRwUefV1Z?=
 =?us-ascii?Q?wkpQuNwoTFYJ+6mawJ8FmmJMzS5HhyOP8OcqbYgTo4gkeMYjtkWGbA1k/ioc?=
 =?us-ascii?Q?ILZzfPMo+nj0QrdzGrvr8urtbk4NoLOguOYXpsr+3JqcTN6TlJgJj40xbRoq?=
 =?us-ascii?Q?OdiXjce6HHTOJk23Va+aYaWQx9uXPZ0I4yMMrGik+QPFc71jZeIqFhO+v0Qc?=
 =?us-ascii?Q?6+24ZHl2ZKA/IZlTYg+Z5mSTSdPZNw/b6bDC8Pl3mo/Hn8wimb6GR4U0MAtv?=
 =?us-ascii?Q?zs4MXRtjcdqXsHWI0BgVqgyJ18Vqil/eVcnAPuTkIjPqCKRPrVoyC4El8lJB?=
 =?us-ascii?Q?zTp0JNy/ecrxLcfdVLOxpQfk2tQjW9bxQb+4sLqystZG75efQh7j/QrkL5DV?=
 =?us-ascii?Q?244gYyDsaJoJZRYj1tU6Lb6ZnXcEc8yE+SV8r4EFCGDiVhQrBpyeXPKg1Aax?=
 =?us-ascii?Q?7N51rB0ZKe+wAQxKz2q6EcmTx+jA/15selwG9ZepDA4mPaWJcaZ5TudGywul?=
 =?us-ascii?Q?jRUuv9bpeg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f76f09-e59d-43e0-8430-08da482e2125
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 02:33:38.9866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQ5UHivBeT7sxCssyTn4UmiuZjOsGp0xzn09wP5NHXCCCgtFnjBRuwHWOoORKLYG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2893
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some SoC(e.g NXP imx8MQ) may have a wrong default power down scale
setting so need init it to be the correct value, the power down
scale setting description in DWC3 databook:

Power Down Scale (PwrDnScale)
The USB3 suspend_clk input replaces pipe3_rx_pclk as a clock source to
a small part of the USB3 core that operates when the SS PHY is in its
lowest power (P3) state, and therefore does not provide a clock.
The Power Down Scale field specifies how many suspend_clk periods fit
into a 16 kHz clock period. When performing the division, round up the
remainder.
For example, when using an 8-bit/16-bit/32-bit PHY and 25-MHz Suspend
clock,
Power Down Scale = 25000 kHz/16 kHz = 13'd1563 (rounder up)

So use the suspend clock rate to calculate it.

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
Changes for v3:
- Refine the code comments for why we need do this as Thinh suggested.
- Add Thinh's R-b tag.

Changes for v2:
- Add PwrDnScale field update condition: less than the calculated
  value or more than 3x the calculated value.
- Correct 16k from 16384 to 16000.
- Delare variables in separate lines.

 drivers/usb/dwc3/core.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index e027c0420dc3..b4c47002828c 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1029,6 +1029,37 @@ static void dwc3_set_incr_burst_type(struct dwc3 *dwc)
 	dwc3_writel(dwc->regs, DWC3_GSBUSCFG0, cfg);
 }
 
+static void dwc3_set_power_down_clk_scale(struct dwc3 *dwc)
+{
+	u32 scale;
+	u32 reg;
+
+	if (!dwc->susp_clk)
+		return;
+
+	/*
+	 * The power down scale field specifies how many suspend_clk
+	 * periods fit into a 16KHz clock period. When performing
+	 * the division, round up the remainder.
+	 *
+	 * The power down scale value is calculated using the fastest
+	 * frequency of the suspend_clk. If it isn't fixed (but within
+	 * the accuracy requirement), the driver may not know the max
+	 * rate of the suspend_clk, so only update the power down scale
+	 * if the default is less than the calculated value from
+	 * clk_get_rate() or if the default is questionably high
+	 * (3x or more) to be within the requirement.
+	 */
+	scale = DIV_ROUND_UP(clk_get_rate(dwc->susp_clk), 16000);
+	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+	if ((reg & DWC3_GCTL_PWRDNSCALE_MASK) < DWC3_GCTL_PWRDNSCALE(scale) ||
+	    (reg & DWC3_GCTL_PWRDNSCALE_MASK) > DWC3_GCTL_PWRDNSCALE(scale*3)) {
+		reg &= ~(DWC3_GCTL_PWRDNSCALE_MASK);
+		reg |= DWC3_GCTL_PWRDNSCALE(scale);
+		dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+	}
+}
+
 /**
  * dwc3_core_init - Low-level initialization of DWC3 Core
  * @dwc: Pointer to our controller context structure
@@ -1105,6 +1136,9 @@ static int dwc3_core_init(struct dwc3 *dwc)
 	if (ret)
 		goto err1;
 
+	/* Set power down scale of suspend_clk */
+	dwc3_set_power_down_clk_scale(dwc);
+
 	/* Adjust Frame Length */
 	dwc3_frame_length_adjustment(dwc);
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 81c486b3941c..722808d8c0af 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -231,6 +231,7 @@
 
 /* Global Configuration Register */
 #define DWC3_GCTL_PWRDNSCALE(n)	((n) << 19)
+#define DWC3_GCTL_PWRDNSCALE_MASK	GENMASK(31, 19)
 #define DWC3_GCTL_U2RSTECN	BIT(16)
 #define DWC3_GCTL_RAMCLKSEL(x)	(((x) & DWC3_GCTL_CLK_MASK) << 6)
 #define DWC3_GCTL_CLK_BUS	(0)
-- 
2.25.1

