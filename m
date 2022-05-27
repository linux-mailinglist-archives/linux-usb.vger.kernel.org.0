Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42742535D1C
	for <lists+linux-usb@lfdr.de>; Fri, 27 May 2022 11:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238483AbiE0JQe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 May 2022 05:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349886AbiE0JQZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 May 2022 05:16:25 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C905F278
        for <linux-usb@vger.kernel.org>; Fri, 27 May 2022 02:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNeEuz6yzZI9+WnIAm+k4XWxm2HaMhc+75KOTecqQaQUpw9t6DjN9Wah+tLRF/yXXPaBWDlC++pY6Fhm0Nt0OkVS4A2bIH5eS3kQE+btGuEFDHBXKbz1hO1PYpTtDYCvo8Q72Y4NoyGbRx2ezUWsSOWGscRBgrPDNuFxluDtJNFWyktbWKl8PxROaFLuQtDNKD96Ne198AxJuzaMg0gv7JOIMng5xvLarC3ImTkWdAn2xV3yk26C1vcFCwMF9f5YUecJrDT01uMP4Oom84Glzf/srSJ84yHp6lpoyy9SCOmtqCo9KJqo6GCxTzLoOLwPtAHh3NZ3+amypn4jRjwEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FT1cYwWQrESCYRpbxZZpvghH3OsOOjuhKMgzxma6w7E=;
 b=hl1Res7FBxRopsOSxLSm0fyPQ3YFKEZLxrJBrIUO0zakUNi7FBL1mCUQG/GMEskxEzXPPp4oC7hTPiBtcaMC4VPBPnEaMW4/lMpDXmNj+s1a6NzG/xGIpMBRWQDrlTmmsWCq/hzV0ZtCh8K9ntWDeZ9UpEUP0mwFQAtbIFF0M9FO7n9VcsJiSBySh9YMWaaR0KroH0oo9YY3DlGDCQHqymyYAmt92hOw6nO7jFzft+VqCCjIfIiwNJ0SLJYWhRZFZ7BAQrwymd/jXPh64GVwcTRw+yfIKmHwZZBY6jXF+uy/IcsKWRJmhfyHNz+sYfdmgLvNmkEcG0vU4nIGizpVbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FT1cYwWQrESCYRpbxZZpvghH3OsOOjuhKMgzxma6w7E=;
 b=IqHk/YL0xh011d8N0vjvkfPNFdjdF/uWpjcBGH/Wy762gNTqcI617JpIw2jkoW4wZlp8J37vPO4phVz2pQpAKKYHQtNHKn6a8g7blh3IrJqlWePKUCLPJzrpgbtCxORu3qHWuylZs7C+BvAi7qZKxSbO9ARyrDxWKEH+4+qjprQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DB8PR04MB7161.eurprd04.prod.outlook.com (2603:10a6:10:124::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 09:16:20 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::a130:5b1e:a94b:b348]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::a130:5b1e:a94b:b348%8]) with mapi id 15.20.5250.018; Fri, 27 May 2022
 09:16:20 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        jindong.yue@nxp.com
Subject: [PATCH] usb: dwc3: add power down scale setting
Date:   Fri, 27 May 2022 17:03:15 +0800
Message-Id: <1653642195-23889-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d2f8e05-7618-45ba-2188-08da3fc18fbe
X-MS-TrafficTypeDiagnostic: DB8PR04MB7161:EE_
X-Microsoft-Antispam-PRVS: <DB8PR04MB7161A2991BB98E4E70C853DB89D89@DB8PR04MB7161.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j+BnqFZcdcXbEcQvHbhHuZwI9w1Tg7JL64QZKHauuObfuAcDMLHqw0pqCp6Jcowj51OxAvbqGehcxn73FSIH1zrgKGE6ulYztsMJiSeVtiX96IdUopMPfAN81AjsqHTEGmLq3aQJBnDKWfM7SV7p1K6yMPQxObp0Fr2Z35DHGaMu1qS2kpQzq6KDhm37HcGmFj1v5PRmtHa6CDi273do3+6V42q1tMX6FhrexDjwNnxRfs3T24YekNRhCzoZIH9OKZPg6mjwZp6i2+gMH8TWwb9cIyviuHBMOvSVHqt989ZULyVjwuc7KM89tl+XYgv/txIjyVyoLDLbusaLbkzZ9JDyczKw0ujlpL3W2ge/29KXmJweitI4viVL14t4Sg9XEdrmzeH3+5DbndpN3o7ZnUrM8ogmkLUjzbBsla/p8TM5/txBGi62/j2FFqu93mdpIyAp0mN5AKVmHK3vOM5i7YLtBQ4S1/Ct0L+BQTf+es1mc+5anFktfB5iXUSuD3lak62NFapkWB0utUeacnFNqgEleAEAy+tvnQj5ElbMeiuQiIJpR4g63ioxWaJ1t6nzv/dOn/vOo5KzzowlY6pdSC7WAXO4MtBg2GUmjJJXLltQo1XLrnoK4UQ05LJyACfwi4tD8NLZ5pkmS172M67rIxEnPInHKisiu+/OrxJ3GBkzCp9Nx9KOw3GT8QajirdcXBDG5s6rjxi0rXlp3OXJzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(6666004)(83380400001)(186003)(5660300002)(66476007)(38350700002)(38100700002)(316002)(86362001)(6506007)(8936002)(36756003)(6486002)(508600001)(26005)(6512007)(8676002)(66946007)(52116002)(4326008)(66556008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e6Z63+UJMJHfkkB2FjqnwEO5uyCEbktCwGvnKpjEM5L0eMCxs8seW3G4IL/x?=
 =?us-ascii?Q?oakwe1tz54yXFCZ/EohaHZHUipLf85FIvqs5kSuH3/getCwg+zSwgRp+euGh?=
 =?us-ascii?Q?JT1Afh0sqxk0DEAHMq6QBFeRB1hieSXYftJBLVTCM5IH/O1XyeddU1vTpxuE?=
 =?us-ascii?Q?RDiVURFyqMlSjuP4En0iXzI0SqnQhqVdvE9XPfbKaCk347H4SxFmTOKjYbuV?=
 =?us-ascii?Q?wBo8zvmq6V4E0W8gUnosFdO1wrbNQIAJupPJGLkPDaiIJKiGETwWYMc8Xei6?=
 =?us-ascii?Q?Yi5iEDmIL3Oiid0K9wuZcZbMd275FmAmMLQgoqWt15566cWgWERpzGpSp8pt?=
 =?us-ascii?Q?d/aGCEpZ3IfDXrAyuv9mFsRNQuFmM0L0v9yawdT0JB6zKwNdQPxVdpnRGBTx?=
 =?us-ascii?Q?gOpT2b2fpRSz3jE6LsZ4Nhk75JnnfOwaVOu8fcs26VeBfelXVwFNPOHeQ+pg?=
 =?us-ascii?Q?wg3dfsTaLZrZH7feXwHawvujOZTVInUS5gKjmppkS49dcZ3i2914L8cIi5JY?=
 =?us-ascii?Q?68Bv7xyQ6CsmzbTwSiM8pEvGjdeWx5mjyTcTo/sSgFujtz/jJPDABr8VL0vw?=
 =?us-ascii?Q?8ozf7v9Ld7xZLVl/Qu0mdg58Yq9cw8s1RpCCoBm9ynRUpfrRdJ7HxZiYaCNz?=
 =?us-ascii?Q?xNMI5TfNx90ILgAhO8zTITlLm/B/LsD+du8xRzDPzTEVeT+d/GYSokaMHeFP?=
 =?us-ascii?Q?lMiWEf7Metb7491pJSwUx0vZWThWZDqgTF3FzxgkkqpkL5bsotzceosW9G3M?=
 =?us-ascii?Q?knS3TF+Qfk46xJG1F0cNd/HJFbwfh/8m029ZO5Qn+Wy7xDcPf70SFWXgfw11?=
 =?us-ascii?Q?+Wn1NkCTDkiFqdaGWiSaeH0od3cnGjthMJUVYZWFMZx66jYk718ZiimVLUSA?=
 =?us-ascii?Q?PXy160xU8rIXMf1kef6dJQtLQQAl2MntT9s5gUq/ohajiy+p6GI1ecFzU1XG?=
 =?us-ascii?Q?cnD3idzd3i01CR+usOq0pFjEXpA+W/su+TqWQvnk64kBFhz9k2b6seH7kLED?=
 =?us-ascii?Q?cVxZdaQoGzzguzYgT/nv2tkG8fPtYDKVgytERtzJqqxPaEfDNfwDCJpbVI1A?=
 =?us-ascii?Q?NLyBBhH1rjyKeFITyl4YOaxy7EfFAYHn4QlENIVTlzyOi8iTIU/Kk9kxJKph?=
 =?us-ascii?Q?SyefElac8LjLzRL7MILegE5Yf782iaOe7UZn8EYt6b9GuNl/QR0V2tHZ91YV?=
 =?us-ascii?Q?KSgATo35eR02wfCnvfdK/SdpNIzHGZzWccdWKNWSXt6u7WNFOPAOLxeZ+sxs?=
 =?us-ascii?Q?T4bYw6/OPuiAOhWclp3k7psjBzFIyIgB+AhNwh89oLmT+5GpaQycaAlkKZzC?=
 =?us-ascii?Q?jgNqjcJ9Q4gYCrUVh4wtxaUjNIsw8h6T0fRTLhMFlcQYYv+EL8B0Ij6skQs4?=
 =?us-ascii?Q?25ywzv26byJjQGXkhWhhR0F1zSQZOvlZpZqKd6dDQd/lB35F+RqfZJJjNLiD?=
 =?us-ascii?Q?9/jAveqgGq2AuBISBfbYNcyct4RApePuxI18JBKycctFs4s/Oaa1mESUmneU?=
 =?us-ascii?Q?gC0Wu40KwdRFgrPnV3rKKIfgEn8YKQFjgE0MnH4JgHjbxBFbiUe7+rUK2AzD?=
 =?us-ascii?Q?GVi6RytcS186EKOfTyCDa5meeK4xhVT3Sz2EKiC2ZS4c8AYvw5EkIps9kPhz?=
 =?us-ascii?Q?Y+aTOJI2bhg8JsMJgtPhPgiVjLeNzMbINA+uppOCh+c3NliY0PEUIIFE9iHu?=
 =?us-ascii?Q?PhU4LpLqwulmkEpxpC2q3xxSCIwpyEbDZkNXE3/WY7SxejUYMajRAwMKyVrW?=
 =?us-ascii?Q?oAjgLCmDIQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2f8e05-7618-45ba-2188-08da3fc18fbe
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 09:16:20.1530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhlGPVPwsL1ATEbFucyQQdMl/nc6S4KaDZlxmaO3NT1mBtwpqklJmx2LPjONRAye
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7161
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
 drivers/usb/dwc3/core.c | 22 ++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index e027c0420dc3..16d441dbc28b 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1029,6 +1029,25 @@ static void dwc3_set_incr_burst_type(struct dwc3 *dwc)
 	dwc3_writel(dwc->regs, DWC3_GSBUSCFG0, cfg);
 }
 
+static void dwc3_set_power_down_clk_scale(struct dwc3 *dwc)
+{
+	u32 reg, scale;
+
+	if (!dwc->susp_clk)
+		return;
+
+	/*
+	 * The power down scale field specifies how many suspend_clk
+	 * periods fit into a 16KHz clock period. When performing
+	 * the division, round up the remainder.
+	 */
+	scale = DIV_ROUND_UP(clk_get_rate(dwc->susp_clk), 16384);
+	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+	reg &= ~(DWC3_GCTL_PWRDNSCALE_MASK);
+	reg |= DWC3_GCTL_PWRDNSCALE(scale);
+	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+}
+
 /**
  * dwc3_core_init - Low-level initialization of DWC3 Core
  * @dwc: Pointer to our controller context structure
@@ -1105,6 +1124,9 @@ static int dwc3_core_init(struct dwc3 *dwc)
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

