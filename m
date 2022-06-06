Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44BBA53E60B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jun 2022 19:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbiFFJGe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 05:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbiFFJGd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 05:06:33 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE86F58A
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 02:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoSTltVj6kHlMMW057vg9nZyWH7+EwtVg8jOtftJgSQsmvRMRVsar3bPkFqUzwLYsGKf8XDeDTEhckeQuKGo4jARcgHDCinklzDAoP4oR+PSAmbJQyIAf8a1HGuyvZ7nHd625B0LJo5jR4fM0Nyx6MljDJVSRUylNZvMsf42Mb+YGQHinjfCKiQLA662DqBGjwC40ij4Hn3G3il9Z9x2pRBo7rqHvz/RzTLAJHzmSK3Q3/Xns++bfahWpPK2I7gNEuDTMQAIzLQmHhTMfSZIKeYhDuqZDv4A+2BVsQev3ZqIxhAYS53mIbjIOj5rDFKzNgt2nvYKWiqr4gSbmXckuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7PkZX3rj0zVpQ5NXMLMAu9tql75D7hYOjC3PeNMe1c=;
 b=nLwg31oIQrduZGRbzv5SYbi8Y1yzOthvtYri2qSWTGa7HGwDAgTbAKn7IWhOgSzTPZh/9t+/L/LWmLfY1V7i/vZBi3huTKytKsvZjo1DmhhsXN1bMgbDUx/M5Wx/LiHseijrL44T/aNZbT+A65ui8pToos6QolQaoZ8qWTsAFChswtNAK7FhcObAs4YX7AMhtNq+Sy9lwP6/Ug0FzQNejyq8T9lU9zy9Ow2OTHHTHOfKnYy5C4M69GH3E7AfiPplZRynO2SHvTo2ZAsz+fj5/iQeb18FaCEy72GrKAXPnUZ+84Ha+y/hxgxalzK5Z186/klFPPnjwTDVjBLQVGgfLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7PkZX3rj0zVpQ5NXMLMAu9tql75D7hYOjC3PeNMe1c=;
 b=eDpbB4aeofg6OXxbWPUoepgPUu8HuMhW+H7lZRjhoytnK13tu3aIyDLzyAiSz8COJdTcjFfRLSOlVRle3B6GDdHGtYwQTsk7I3ZOks9zJUSyxSs4erEs/kjxGYuxQtCpEALCy6s/uYh9Ynxwif6qNZCwhKmufWSKwqKtNhAFTm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AM6PR04MB5237.eurprd04.prod.outlook.com (2603:10a6:20b:5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Mon, 6 Jun
 2022 09:06:27 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::10c:56e5:4208:3c4f]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::10c:56e5:4208:3c4f%6]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 09:06:27 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        jindong.yue@nxp.com
Subject: [PATCH v2] usb: dwc3: add power down scale setting
Date:   Mon,  6 Jun 2022 16:52:53 +0800
Message-Id: <1654505573-2501-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5a4ef2b-7d84-4560-8ea3-08da479bd6dc
X-MS-TrafficTypeDiagnostic: AM6PR04MB5237:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB5237AF40EF9FDA6A60E87B6989A29@AM6PR04MB5237.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZisYXorZMH6fRAE7YZWnOt2iUXRwL2Fd6DyYNh26bgCzmg33u37RbJqfNEqJdfsdp/gC49VGArdKlxIya57vUUB1Z2nUVZp8fzLveIV2eyFq4fdkAUgpMWh3f1qMtm50NZOdbx3qAU4zkvXeXXtT8sd00gHnvVNWtHPXmvO6q5XsfjTF9wqA+t3jd0UWtj9owyZ6ERtB3y0E9dOq2yr17ycf0tMue7lrqF2DFzznHWQvpdYZEE43oFyudExh/LRjN6nPbTXXpmuoeVxWp9VWpG2Na2weK8mFuusw+wWcCeeDiLXEn0e4B/mEtBHtQeaBm7+NQFXiNiBrwxbAQn1CSuhuJyvUFJY6N7jNxQIYnIYMZMKb+YswI2D9HR2ti7kTZGiyvNRgCxsDUa/LKV6bM2epGuoW2NCpHoyhNLcnqvEtpUiLSOI72DNgTRVVOVX+yEd+0Sm7Emex/BvlFe3ej9W3nCnTIYXF1G0r7YOk4YoXWGo9YS5deDTdo/VBySGroviBPq+OCEzSTBixw29ljdSMDMxxU8awYsjUau2aDvcFjJJq9uDBGc07jRz0IofEXb4CNPejdeG+Ew77i847oYD+JRKfezb9KlnPk+IAaeLIqBduI8i5y24k+2RMVsiHm5N1Hjf+RMnuKd/Fkl7otnS0DMSp9OrhfdkLX0flpSGGnm1ChubTsrGuqqDgYXyp1Td/mrs+ToLzaXOVW1EXXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(2906002)(6666004)(2616005)(6486002)(6506007)(38100700002)(38350700002)(83380400001)(36756003)(5660300002)(6512007)(26005)(4326008)(186003)(8936002)(86362001)(316002)(66556008)(8676002)(508600001)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y7x1ogs5DopIj4lwM4fPu2Z4RB+Aa91/hyZrfd8h8/tn0oO7w+42/jeFdE0T?=
 =?us-ascii?Q?YNhL1E8T4laBurWzsthP0B6LDXDziU2tQGcPSMQ9t2iHHV3V7FRpD7UBtj+n?=
 =?us-ascii?Q?6RGDKBmNqPdoVG7lyY/fvmYsCJrcyD3975VtI5l2T/KlnX2eMyMv7HCNvTzW?=
 =?us-ascii?Q?HaGN7sxk6ca5DEnqlGL5IwX4sacr3Zb5qMwfAil1yAZteojrvWcI4t8HLF1/?=
 =?us-ascii?Q?ohq7CGyXB1fhahwMw2MkJy2yWLdgw6hqsA7onUZNc7vV4MVy47GA69U6a/24?=
 =?us-ascii?Q?tXmjONnDYEyqLwloNkj9btvnoiXniC/JvhvtoJ2lm38RqYc+RKGc3bVsIcW8?=
 =?us-ascii?Q?yWQGhbkM8JZRCFTR9Uv4HamoIkhob91eO5UCgFGhEG5TUOXpJD7+/Q5Io4+o?=
 =?us-ascii?Q?wrbqupBE3W7KU9+obI+F3oTv01QQsLoeLkEKWFSgUtSAC6cvcJ61PVY7FFUS?=
 =?us-ascii?Q?XOuO2buS1tdNgTbq0g7HrFSoVLsWFVu3l7K9rmHk+cJjo11R5Ru7kAJVIs/w?=
 =?us-ascii?Q?ycZYmtnwb1I5D4Y+Ku0yRnD7WKsXCwMSVqhLfJSMeS2IsZrU38F5qu5gUgC/?=
 =?us-ascii?Q?sQAT6y3g2bgi1F/5PxdM1/oMYT3ALQhX0phHVwqtv7uYVZscnM8QkefANtzT?=
 =?us-ascii?Q?x7y4JkVwFOstf14E8kbcO46OXHeyksqYtiMwbrSG3S48yWv82JYi+1EQ+XVp?=
 =?us-ascii?Q?ts44E2CW9v5sMPcVSmdTiQDtdoBPLYTHm1lqzUSfHQdMazaW3qvGcn7AEjnM?=
 =?us-ascii?Q?Fy9ayx16guytkmdzvNHfYzv61NYL+SIrgChAwdHhbMCwMsxhMPEezpE3J725?=
 =?us-ascii?Q?cZ6wZ9o03HBxso29HG+oZajsOah0JIimlqMh5Iwp4TlDbxpcyFGWac0QLRJW?=
 =?us-ascii?Q?mDTPTU59mQil3DOt5ssg5cBhC0RaACcWY/osNBACZetJLv7/hYQQh5StlCLn?=
 =?us-ascii?Q?h8GAQ8EhZgRy4RxU8PgcFkKbRmfxK6Yt2qD7j8TJeQB//BRKoSV9ZZWArwYk?=
 =?us-ascii?Q?kzza5rOFHUpqlDRPlrcmDd5haRLr/FuV8MyAyGl/v21mnaviV6Rvx15jRK7i?=
 =?us-ascii?Q?ZdjV9YSltk0l6bFqHDAXmrNbTMjg2ZCKOKpwPPeN4zpxHe/4aRlBxnJf0QLH?=
 =?us-ascii?Q?PvAhs+hfUam78TpDBry/leCEYulhB2HBBqac4UAKSvHgIqLOXUVamZBQ7mdi?=
 =?us-ascii?Q?aR2axbkF4XMV9yk1/JqpYNI9gUFKLNPo17YFFeVZ27bTbczQ/cDuKEAxET+N?=
 =?us-ascii?Q?qfq/o7Wh7JhbEadUVhjbvKaO2EqPzeM2iQ4nryHhSvCLeM40AzEsVP6OOy6K?=
 =?us-ascii?Q?s23D2CTA/k66Xk7W9zAv/JyUQnJQ2Uh/ijogzBkvhu4rtMR1gwQQeDjaj3g5?=
 =?us-ascii?Q?HhbvxFxG3k6fwBbzYoBdWfmVAk0i42wRL00VgWd4j/U6ygn912oDmRlQnA7U?=
 =?us-ascii?Q?bCvuYfAVU9eUyWQ3yRsUAqzDJn/2inMmeslVCJO/DtNeunSHYiIHYvudRpw0?=
 =?us-ascii?Q?1XtNY/7IkkVmD99011MTCtAQgdcsyl88n/BVhYwvTTcawDXatSgQFFIq+3oW?=
 =?us-ascii?Q?MyJNKJx1T/GLY/V8YyXYy6I0+G966MF64QIvNUPuHycNlfv2DMQ9bQu1hP2z?=
 =?us-ascii?Q?BEYijfc0ryd+szGL9luEFFynoVk+Eqd+IOyW5E6dY1MdJxfx2JsDpdZgnHWf?=
 =?us-ascii?Q?OdLgFJM48ps2ypSGBmSwYNcMkdhvjfK3xlJHWU6czXQDX44uSPTtBhsx6kmn?=
 =?us-ascii?Q?ewbCFYkoVg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a4ef2b-7d84-4560-8ea3-08da479bd6dc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 09:06:27.8359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSvTBrBtFFbb4ZtRdLl0djqE+luXJiXWrKBcqt4Mw2HvK5qcMbiroX7s0qUst+zB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5237
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

Signed-off-by: Li Jun <jun.li@nxp.com>
---
Changes for v2:
- Add PwrDnScale field update condition: less than the calculated
  value or more than 3x the calculated value.
- Correct 16k from 16384 to 16000.
- Delare variables in separate lines.

 drivers/usb/dwc3/core.c | 30 ++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index e027c0420dc3..37c34690d11b 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1029,6 +1029,33 @@ static void dwc3_set_incr_burst_type(struct dwc3 *dwc)
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
+	 * Only update the power down scale when the default scale:
+	 * Less than the calculated value from clk_get_rate(); or
+	 * Ridiculously high that's more than 3x the calculated value.
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
@@ -1105,6 +1132,9 @@ static int dwc3_core_init(struct dwc3 *dwc)
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

