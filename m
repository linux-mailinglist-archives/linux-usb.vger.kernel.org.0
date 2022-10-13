Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E62195FD56E
	for <lists+linux-usb@lfdr.de>; Thu, 13 Oct 2022 09:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiJMHMu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Oct 2022 03:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiJMHMs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Oct 2022 03:12:48 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2049.outbound.protection.outlook.com [40.107.105.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF20FF8D9
        for <linux-usb@vger.kernel.org>; Thu, 13 Oct 2022 00:12:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bu4DpN4LJzPak0EqptqWFoB7C5ou688zRcm1zZwv/ddNSv3IGAUbzRiupfZAOotThkAZQ/k2gYeJ+KfNEiYp8svRX66fHR6E+9sjdAA6RztjykfuD2dNNx9ICQfpbYZ04/BQOzDsnV/AG7ocHNSzqVHFfuK4gFtkoKpQOtPA9o2sek5x/VxCu9G8ADLJVoh5//dvpEWaTe2sTP/MIEClwl+cZcil7l3k9PGfFL3Sii9zjxbSSbhmUfoMK5XKWV3JTBnEOLYrFMAcZLlne+suCMOqLysj7hXInMvNvBuBX8Ba3EY1A/40MotwKMyMo9AHYai7OI+HwOENc9doV04dSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUpR4uRS1DZzx0OzrwfstvoQHQkSSU9yC7liSc80kEw=;
 b=NwsJJZgNQqSXjKe4Qitbhk6cXR29w3n+152359YB2uE4KrjU98nD6ilWFXF+l3oUkYsNFWvI7KxIkKeYvZaLEyGWb7z+boi2YCVAcVv6gqnbSQ9QhQQEYL1MgSFAlGe7Y2wTBKD86wh3MkMrKVg+DCuD72WtzOJLvcu/gINEpVZhYvWELYbqqrnUNyU73SiW5krdV1vxnipGnPFBVnbLyuNDY0WjXnLfnRzX8kXVWcihxBusNpteEgh1io58niKIpOBA0H2nmIisyDfgOI9lWor6Irb7hdw5dgNVB1tDLN2Cltf18hxyZ6aZKHfn7Hlv/tn4evA3jOnMvzywc0v1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUpR4uRS1DZzx0OzrwfstvoQHQkSSU9yC7liSc80kEw=;
 b=aFFQ0fKhJjz+GPImVZ26PJCWiLaAfijPlNga4h/XXUu8wJBCPJdCuCvT8ehC3qdCZ+IpZdDmUntQujiLn+VXifNShiivz2FBn+1Q7vz9kmgPP0auLGgbHtORz1XIur0pn4XSPEutM1Fuc3cq/OVZvr8LfyOfoC0mwT25We2tLxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by GV1PR04MB9151.eurprd04.prod.outlook.com (2603:10a6:150:26::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 07:12:45 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 07:12:45 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH v2 3/8] usb: chipidea: host: add suspend/resume support for host controller
Date:   Thu, 13 Oct 2022 23:14:37 +0800
Message-Id: <20221013151442.3262951-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013151442.3262951-1-xu.yang_2@nxp.com>
References: <20221013151442.3262951-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0091.apcprd02.prod.outlook.com
 (2603:1096:4:90::31) To AM9PR04MB8777.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|GV1PR04MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e744b56-2a6a-4c37-aae9-08daacea53c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yShExSoZwlYLk21H5tL4VaMMje8+b7kzA5/8W65gyxJCiZde6MaFvmt6fDgme0e0Qmz4BZre6/jr/0zLPhXKnSGOmqGHwswqBtBgZzOMe2RZ23fBVQj9hBOexpaMEggt1SoN1+QZ/ROtfUsCyqzLQrFYi8WKwW6iWUqgK7QXqoFjdIkXMKl0nw4M1eUJFF8c6TSd0eTWCXpBAe9StstA1+CTEqFUlkI+FKuxa9h7YfPjMjoBeebGBCW+1t00JQ2izXDXBuYF2sV5XmCT89Hmmk40pZ/dgWDntpOkNRN3zOz603h3//+svAh6tI2xAI8DHoQzlB6d5ANhOcYMkelgSF8MqkZGumqhw79E4927qLPfkknE3seMzJZ8oPBPRso36WP7/Ypsmn4f1ySmx7Gaap2MMK2rXowq4pEZWd7aJbnImPCp3SXKFzfCO4ZT3CTjbOfRmsHOOqY80FqyvhRL/WBsIePxzE9A6n0LwcKgsu5bHv22DjA6Tueu7oKwXetWeYcnq+a2WwGzSTTThTWxWyRnOro6jbyKiXgKn2Sd9K7FMNeGuNUmr1UPzYDcvWQWU3JohXNoS3M0YIv1NIVgMpCGZ+mZCCqfjxAR8GvC4sOnSPWZSFMKLeLYyllOtSewc4g9qSJf8fjityP6uGJxnRu5uEaKNWrQOVpLrCVop5iMX83uPXRqBw+iAnUfglkEBWMG5WOZebSGCNqctlfq4i9rrfJ283JluT4Kb10SR6FzwiBrH1vQClLsNCoQWJJThFTA0MCE/kK9jKE78BQF0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199015)(6636002)(316002)(38350700002)(66946007)(8936002)(38100700002)(15650500001)(2906002)(41300700001)(4326008)(66476007)(66556008)(8676002)(5660300002)(6512007)(186003)(6506007)(52116002)(6666004)(26005)(1076003)(2616005)(83380400001)(478600001)(6486002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WTBz+Z5CY/wwTEkljDtCr/4Oj2OsDMLcBO1813LQ8r5GVLTHjjZ114ORy+Xv?=
 =?us-ascii?Q?OqcZiigcT3TDGZLc7cw+VYOjX5Vf8IJA9tGV3DNeo7NyMPrQbb92uDwshoGY?=
 =?us-ascii?Q?4de8E72LpgHg2B+NpcAeAQXhc63jEnoH9jHtN/d/NLCW7PKF1sxx4AffAq1x?=
 =?us-ascii?Q?4tHO+JCeICT3cGRifWsUoufRLlGwTrw3XKJ+VFyIU1rQ2uVIhaQOUrevxfXB?=
 =?us-ascii?Q?unTXgyWA5oSS7l2rDLS6eoTwTLrx4QwgPnP2/STE25VqeQm3JhGNfnDuiWpQ?=
 =?us-ascii?Q?TxjCJyq4WaC+uOLpBLC1pgXVrQF0g+xgkiAJpQ8LOhjhv4OQO6Jz28h0tKkX?=
 =?us-ascii?Q?/ywkR4LS1GlN0kX7cYRvgXxPTnR1m70W1lm62fP4P/VjwD3+ysmZ6yEcYIYh?=
 =?us-ascii?Q?G6uENsgzCis8gLjZeWCqo2m4co93MYPqiI9D8kompC9O3ayrkmky3TLg++rX?=
 =?us-ascii?Q?Op9FSvBMVzWx72DNN9Bv41U3IA8noWVjwnP1b6v4JBiOJK1xZeW1DOwkniuD?=
 =?us-ascii?Q?/pE38uZMaKaXs3smkKt6gfsPAifcVB0tlWgOUtqaXLizc4cz2ZpEJ6d1azWE?=
 =?us-ascii?Q?iwzQkIzSC0Kd9FYngSAYGScIgLCulJoL/OAk1T9lkCK6zFfqA7Xm8QCU3lHq?=
 =?us-ascii?Q?tvz4O6fDS15av47dsCEmtfHLYW+86oqg/aIyJcn/qbPY5hOIEiV/6FmkhJiQ?=
 =?us-ascii?Q?fX3piF+PBXQCgRQrrdkgg8KI6uaiR46Cx11O8RrOsx2HdJVeD7nLllnyTCeL?=
 =?us-ascii?Q?hA0M9kBKWpCR3xnY1g7G+jRhidnSGLNI6PqT1JCML7pTSPxQGfzeH/Bi7i1r?=
 =?us-ascii?Q?7yDn8Eey9Rwml41KAjnceDSFRJUpZ8kcwYFBd0MQoJKbte8N6sLRJRUPzYVi?=
 =?us-ascii?Q?3nNiBFWVDlvZ3DHuFZorTWwsmF1UmyIIS8g40On3l5st5AZB7n8ksMOgL20Y?=
 =?us-ascii?Q?uitGumHrJyEJxilO6GrbAIio0xJj3bSnkvaU0Kc/GZCp7XakLvieK5qJbSIu?=
 =?us-ascii?Q?O4XIbsE5W3eQZwb7USqPrKSa9PNVpb0atkllOMbGqul7BVSk+wDnAerKknxo?=
 =?us-ascii?Q?ynHl/tHoqCZVbIjjzT5FFH5K1eQBlWT1hXWsRNYvij5Xvx+YyVkO0DcI2i3E?=
 =?us-ascii?Q?ycUrAa5wtbNiPbUgOuSGpkfXC12Q2/t2DhALfEgMSekjkF6XyGeRWRjpfoy+?=
 =?us-ascii?Q?vrr1mYFRSi/kUg2Ae8s34n6/wg1FGjUfpGOY1s3uAc2wcvJUJVVsS0FGXtg0?=
 =?us-ascii?Q?T71nfhjfBVdkWPHUwFztpbrELR3FlJoKN8xBcw8DUwkPZrCSrUZR6SlJD4Ki?=
 =?us-ascii?Q?zGNdYMWXDwdQTfiLQGo2NWGb7wGVYH8Rcx/yww0F17sRbN7wZ4K4pdPfrB92?=
 =?us-ascii?Q?rEEOb5wjIUxnKWvI/wMYVpwA2XvXKYDjA4CoQmhoQYsHnJH/Gu/pa04FIHRH?=
 =?us-ascii?Q?P9j0HrmwvchWL6OdLQX+h/Zt9WXD2gwjQWjyFUadLgQn3ZkZm54aq41MIafh?=
 =?us-ascii?Q?XyWXVjHV5HvuZExA17X1/zyfcyTdSac6zdynh6Ko83d5td4xkoQ/ZS6RLLAC?=
 =?us-ascii?Q?gx6pgWHrfN7Ayj7FDurm8BcXZRIE0sz/hN3K2CAF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e744b56-2a6a-4c37-aae9-08daacea53c1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8777.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 07:12:45.7803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqUPLNxABQcT2WJIig34z13Tsc7o+lSV0n116zrR2PPz7CAXnJEzRQEMpZJ0yeboMAVUlQs16nJTHaBkNIQrpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9151
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The controller's power may be powered off during system suspend. This
will add suspend/resume support when the controller suffers power lost.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes since v1:
- wrap suspend/resume functions with CONFIG_PM_SLEEP.
---
 drivers/usb/chipidea/host.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index bc3634a54c6b..ebe7400243b1 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -459,6 +459,18 @@ static void ci_hdrc_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
 	ci_hdrc_free_dma_aligned_buffer(urb);
 }
 
+#ifdef CONFIG_PM_SLEEP
+static void ci_hdrc_host_suspend(struct ci_hdrc *ci)
+{
+	ehci_suspend(ci->hcd, device_may_wakeup(ci->dev));
+}
+
+static void ci_hdrc_host_resume(struct ci_hdrc *ci, bool power_lost)
+{
+	ehci_resume(ci->hcd, power_lost);
+}
+#endif
+
 int ci_hdrc_host_init(struct ci_hdrc *ci)
 {
 	struct ci_role_driver *rdrv;
@@ -472,6 +484,10 @@ int ci_hdrc_host_init(struct ci_hdrc *ci)
 
 	rdrv->start	= host_start;
 	rdrv->stop	= host_stop;
+#ifdef CONFIG_PM_SLEEP
+	rdrv->suspend	= ci_hdrc_host_suspend;
+	rdrv->resume	= ci_hdrc_host_resume;
+#endif
 	rdrv->irq	= host_irq;
 	rdrv->name	= "host";
 	ci->roles[CI_ROLE_HOST] = rdrv;
-- 
2.34.1

