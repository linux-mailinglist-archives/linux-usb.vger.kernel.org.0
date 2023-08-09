Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1B417750FD
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 04:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjHICki (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 22:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjHICkh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 22:40:37 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0600.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 037F61986
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 19:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPNa+ehhpraB9CaT4h5stXBE6SYMfbUmGWVvu25Y+Gf/D3q3ecXi6pvcLu2V/d9nUU9fBe9z/jGWGQuxWU0YI89lmsNjrgy+rAvVgPg4/2oYTp+Np9vRlMWrHzz6vi7WTAV9sywHPje4eR+pU41ufXLBK45a/CjFTwe1/pPEx/KhrlylDK3jHBPEj1ram+i3unmr0hxP6ZguIM9nOkBO7RqryzNyGeBKYmOV5B3Wpj+E7wUYplz7LUbeBuou7dGYTB0SlaYhRXEoQhcdAfsn0vR00dbcOc3srfqH1TVt7hXEc/8p8gSxdZjIm86LzLhf/mF0PRwgV9fz68MrfbhaWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CrVl9W/I1Swcne2vwgFvjR3vgR1/z6eYCkxgb+9Hlc=;
 b=kyX+yWy6OUrqHfdfeTO1499rEbP5pV283Iw/BivXOSjyc3kRLXYHt/OD6oBsCfK2U4SssPWH9dYjVJ5H8D17Uy07HDpDDuU+CZ9F1IasjA6daBsuTOBjCj2P+tcf/rItoROx+v90eLOTOZLypnKQmUUqaARSdQSkdpE74x/Ho/+UEsFGILSWIm/jT1sL4xGA+OanuSr6clYJiRdf7ge31tdvKhc9goSqnAB6Sf2Z1pt/z46ZsHdyqVwgffC0rQqD4zYPlBC5gh0UHD2+cZdEsEMF5DEjqwZ1580UbA8dbb3n9zWk7k6z6bn4kg8RLPcn8pNOF+22CemP1g01PRIK/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CrVl9W/I1Swcne2vwgFvjR3vgR1/z6eYCkxgb+9Hlc=;
 b=UdW3WRPLpUh2bXeEoMLi1g2T8Xp5ZcGyHo40QjnHRTwA6IYZ+QGr7DmuhFteSPfGR7n7NOzP6rHh8fHffyEKOrS+NzbVDbVsjW/aAfyZ9Zb20YLGWznh3pjMWa+XWi3im/jfJl7XzrW+SyAm1kvHaxTIfNG6VanVbpf7TbY+jk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 VE1PR04MB7374.eurprd04.prod.outlook.com (2603:10a6:800:1ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 02:40:27 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 02:40:27 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     stern@rowland.harvard.edu, peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v2 1/2] usb: ehci: add workaround for chipidea PORTSC.PEC bug
Date:   Wed,  9 Aug 2023 10:44:31 +0800
Message-Id: <20230809024432.535160-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0128.apcprd03.prod.outlook.com
 (2603:1096:4:91::32) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|VE1PR04MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: d16c7bf9-60a1-40a4-6035-08db9881fd48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HecCzsYGjOKXMIV5wSyJaeSDFEbZ3KRLokuOSp6ldPaxL30RcemllzTrb0R/z5AVE9bGFvb7ZxXKx7guRBP2y4JHymIYGI9KNphq96hXRyQGy1BXHgzLb+2GXrcCpz57OyKaZaLE4+L0WDR/hbsuzaZTZpdjYoNgi4I6URPDL9DhY2Pi1RgAH6epcDtW48GIe4l6Kc0BRghalZCH9cxs+jUY7z32XXwUItNWa9B/Ud3lF4X/Satq6LtC8bHvf17LiYVYqf4rAuPuU1s862Y2r/Ih9+V/AsuBlzGWo7xNrOWszr3ZcH3d+9lZghtNrG3tmuqe4nbyPJTKHkrtU/DCbS7+k3AtloQJw/IRIw4f4KhyzVMojr9zLTuTEqCmu/UK3P6PEhqwM3eQy8EEfMQVx0RC8TdEG5uKisSJZ3QjjmAdZ7b2Cl+LK4a7z0WYKMc68wn5LY6XDT/XzMLUAjkMsvMAp/3g/obTFi6oQuXI2lqr3I9n2pz6uz3xMXsu5fm5mVlnQ55rW+CezwCwZsNyWTyEPXiZ+TMWSGT0GWfiUBCMYAlNe99101Ffu4NYblGGNIy/u4FhoUZKGTtzthpRZdz73/uBBDWhy/8+HnOJb8372U055sMMWcrjIWSJ6Age
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199021)(1800799006)(186006)(316002)(66946007)(66556008)(66476007)(4326008)(8676002)(8936002)(41300700001)(2616005)(83380400001)(86362001)(38350700002)(38100700002)(52116002)(36756003)(6486002)(6512007)(6666004)(6506007)(26005)(1076003)(478600001)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?URKSxaBaDFapKjzadRhXcPzVlk+uYgEwJq0aubp/gSs4MWtQZitpozS+7Oxw?=
 =?us-ascii?Q?IuTyYIDFfYqjwtvB1NBYPivuUblSt8pHZeqQOSPsWfj5s9UtwEGSj8wXogtg?=
 =?us-ascii?Q?Jx/A1H+FAZMGc1m352O2N+MQPn1iWO/pnDDLKqZqDzaOb20sWC4oRQhjewF0?=
 =?us-ascii?Q?mUfd64K1esLHYW2XQI6eN/pEUBMg1jJHTArKaerbCfbrsccJLwWxo84xzSkh?=
 =?us-ascii?Q?x7f02isCVSvDPQNWXc+IW3cLT4x+/WVKz07ZwcCyc10rss+sj+MNVegeKVbg?=
 =?us-ascii?Q?xiOMcv65SUhpxnqYEMaEZ8sIAlij+Y3iCS8AHdSFZLOWZFvPR88OqT3Oaj01?=
 =?us-ascii?Q?O2kpJKlzNNS8n6G+S0kxqtGf/Wjr4oCRBhiVTTLOpbti9NSx6XDpkeWRkR71?=
 =?us-ascii?Q?7BLUiWmyz1CRBRbv2xv84xmLlNDC7cUJHifMt5viyfeFr0Snkx10BMdsNFLC?=
 =?us-ascii?Q?yNHuJW53RBiqhAv7IUUD/P/IjyeSLmClFefLC4c504lLWesXbPcvOthiGs52?=
 =?us-ascii?Q?gdZ0PPj2Cz8CF+qQZT0GAZXBXwXu7b68QMQVA+G9u0RGI9PdnLv7Ng6MdNEw?=
 =?us-ascii?Q?dhFriWOFyymLD41EraIqKDEIlDUBNOeKVUKRFVeeCnOzdx7QZKj/VuypDa0m?=
 =?us-ascii?Q?a90UmDmXS9Xw8Sa9QJYXn8Jf7p279xxGBhZtOYEQ16+5I5/yJfauNnYGaPNL?=
 =?us-ascii?Q?jLkn5z+LIkrakgMV0HjjwqiC6mv2MU+dM5ytjGTcazTZvqjKLli6RT7LEeyP?=
 =?us-ascii?Q?rI1AD2rJDwU7VQORHNR2+BQTiHUwwi7hOvuCasNCfAcyp90DyyMOZQMc68VR?=
 =?us-ascii?Q?3Y5AY5KOse2QZkZeJyYwmHUQX6svl+79lcVL+Or3WGaY3yDzcX7WZwNoLCWW?=
 =?us-ascii?Q?OyXWnIvxcw4EYTHq9ZSHBmHPgbnMtFBC597cLX60rPbDKuUH2v2CPi4Ig5Pe?=
 =?us-ascii?Q?5y6X1RNO767MPseOnFsKNhrovjz9PsjcZL/XPJCBqIv3LSP24U5DAFIYFWGo?=
 =?us-ascii?Q?81nh3F7B+AfHil/IMTZ+fInU501EUdjEmDQWyYqwXRFvhvPWXmnED6na5fZY?=
 =?us-ascii?Q?bLAMMAJuTbio1l0Cu+/Xp0+kPjhF1WKLJ+3CxcQ+8eeMM2Qkc5NvjochDs/s?=
 =?us-ascii?Q?XmI1CAdVIydXKOfJe1opbgmBbPNDb66wTnINp5lCDmHbhby3KZOjopq+cE+d?=
 =?us-ascii?Q?TwN0Wod0eOQ3BvixlFC308KMltEpmSa68ynuspdKgiKOhsu4wZsp6nGIWW2o?=
 =?us-ascii?Q?hiA4TnEjHWXLpc+MAWO+lqx6rkLtAk4TqsZ5Lh8IwzJxY/3LCDU3YdGwYTlu?=
 =?us-ascii?Q?PEGmzGiFuWlHXqFTKefLUnMKIkKn4JjfvhFlPqYGKoPh9W9IME6cNIwl6BBN?=
 =?us-ascii?Q?kwNsugmdBlYl13nnHNLckfZvTC9EcVEkGVNrNtv3WQrFFFgdAjy/daMhTIko?=
 =?us-ascii?Q?vuQscWPXFUvOV89tSXI+wlA5vghZl6jh2+otHABj7duy8fF8gPXde9sPYT4n?=
 =?us-ascii?Q?JZ2Ol4np30FfEjMoygfmMnaJ+C3QErRsejKovqkyLlaNpjezGPgYRmuR5uKd?=
 =?us-ascii?Q?3vrfPXHoEDXdJ+ihwwM0a6RtukXxvqgeFmkovqeM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d16c7bf9-60a1-40a4-6035-08db9881fd48
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 02:40:27.2686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLGKwh9xf3x30wsVx0OYSTOEOOYxDkysTfASW73EXnCoQdNAmgFtMAEOy11E1vQYAbJqgXTOHhgaNTGiNTMYEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7374
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some NXP processor using chipidea IP has a bug when frame babble is
detected.

As per 4.15.1.1.1 Serial Bus Babble:
  A babble condition also exists if IN transaction is in progress at
High-speed SOF2 point. This is called frame babble. The host controller
must disable the port to which the frame babble is detected.

The USB controller has disabled the port (PE cleared) and has asserted
USBERRINT when frame babble is detected, but PEC is not asserted.
Therefore, the SW isn't aware that port has been disabled. Then the
SW keeps sending packets to this port, but all of the transfers will
fail.

This workaround will firstly assert PCD by SW when USBERRINT is detected
and then judge whether port change has really occurred or not by polling
roothub status. Because the PEC doesn't get asserted in our case, this
patch will also assert it by SW when specific conditions are satisfied.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - fix typo in commit message
 - Adjust the judgement logic in echi_irq() as suggested from Alan
---
 drivers/usb/host/ehci-hcd.c |  8 ++++++--
 drivers/usb/host/ehci-hub.c | 10 +++++++++-
 drivers/usb/host/ehci.h     | 10 ++++++++++
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index a1930db0da1c..802bfafb1012 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -755,10 +755,14 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
 
 	/* normal [4.15.1.2] or error [4.15.1.1] completion */
 	if (likely ((status & (STS_INT|STS_ERR)) != 0)) {
-		if (likely ((status & STS_ERR) == 0))
+		if (likely ((status & STS_ERR) == 0)) {
 			INCR(ehci->stats.normal);
-		else
+		} else {
+			/* Force to check port status */
+			if (ehci->has_ci_pec_bug)
+				status |= STS_PCD;
 			INCR(ehci->stats.error);
+		}
 		bh = 1;
 	}
 
diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index efe30e3be22f..1aee392e8492 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -674,7 +674,8 @@ ehci_hub_status_data (struct usb_hcd *hcd, char *buf)
 
 		if ((temp & mask) != 0 || test_bit(i, &ehci->port_c_suspend)
 				|| (ehci->reset_done[i] && time_after_eq(
-					jiffies, ehci->reset_done[i]))) {
+					jiffies, ehci->reset_done[i]))
+				|| ehci_has_ci_pec_bug(ehci, temp)) {
 			if (i < 7)
 			    buf [0] |= 1 << (i + 1);
 			else
@@ -875,6 +876,13 @@ int ehci_hub_control(
 		if (temp & PORT_PEC)
 			status |= USB_PORT_STAT_C_ENABLE << 16;
 
+		if (ehci_has_ci_pec_bug(ehci, temp)) {
+			status |= USB_PORT_STAT_C_ENABLE << 16;
+			ehci_info(ehci,
+				"PE is cleared by HW port:%d PORTSC:%08x\n",
+				wIndex + 1, temp);
+		}
+
 		if ((temp & PORT_OCC) && (!ignore_oc && !ehci->spurious_oc)){
 			status |= USB_PORT_STAT_C_OVERCURRENT << 16;
 
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index c5c7f8782549..1441e3400796 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -207,6 +207,7 @@ struct ehci_hcd {			/* one per controller */
 	unsigned		has_fsl_port_bug:1; /* FreeScale */
 	unsigned		has_fsl_hs_errata:1;	/* Freescale HS quirk */
 	unsigned		has_fsl_susp_errata:1;	/* NXP SUSP quirk */
+	unsigned		has_ci_pec_bug:1;	/* ChipIdea PEC bug */
 	unsigned		big_endian_mmio:1;
 	unsigned		big_endian_desc:1;
 	unsigned		big_endian_capbase:1;
@@ -707,6 +708,15 @@ ehci_port_speed(struct ehci_hcd *ehci, unsigned int portsc)
  */
 #define ehci_has_fsl_susp_errata(e)	((e)->has_fsl_susp_errata)
 
+/*
+ * Some Freescale/NXP processors using ChipIdea IP have a bug in which
+ * disabling the port (PE is cleared) does not cause PEC to be asserted
+ * when frame babble is detected.
+ */
+#define ehci_has_ci_pec_bug(e, portsc) \
+	((e)->has_ci_pec_bug && ((e)->command & CMD_PSE) \
+	 && !(portsc & PORT_PEC) && !(portsc & PORT_PE))
+
 /*
  * While most USB host controllers implement their registers in
  * little-endian format, a minority (celleb companion chip) implement
-- 
2.34.1

