Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58501773D0A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 18:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbjHHQNX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 12:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbjHHQMH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 12:12:07 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C337AB0
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 08:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4kzOC+G1S2Ov6QXCFQaggHnuiSZ8QQybA0Elhy75ioLJz3GktYfiOvEeX003ZbfgElON3eLyVizJYcmY4g1PyR2oRPwcjxIO1pZhqEtgzM/1RkuxGQJSNlK3lxFB7/S6p6LCBogTyji8kwf/r2xqNG6waC/jyjvdqjp25H507y1yjKnH0ffOzSX/doloXH6CWdXpKhu+0McbSXcbrRJvgVAguZ+fr/3R1hb1IjXxzv5VdqIWN2xtgimemihNCXNCbTrD3h2NrE9906npwUgagwvvpI0otw/D/UmO7iXwF90o0PbvTheEBKJ9Ed8APYa1bi23AjFqxqnK5AC0gbSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32N5mGLb3ZHYIIfcQ7bPzzfEq6MtTw9LTvxHuxMLt00=;
 b=awVDXliMLA5g/kFuS7jztgGKoU36X1kspD5LHsrrgaRR641VPHhEMHfiAoUE4ohZz6sxpUxiJyGD5ttk9u4EWmrtAnop1sp5G0qF+2NllB4daVgyFjKVWFbD7fBAd3w982AAjwt7dL4MN0dDUMVEOribYGpDosFyBUgDV6XAP05Vqrxps9+80Od/A9+TMOWwG2EgPeli8hBfP5pnsDBC5i7lpsIuRhqkZH2OIrR6wWu5EVr5vJk3FcVjh5iGUzprOOrLrFomknccqqlYLfbqH3ZCTds8f3tBio07gT4kN5G22/zqrl5Nw2Xo66Kg3XveNrosMHN6gLjVwgbILhf2pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32N5mGLb3ZHYIIfcQ7bPzzfEq6MtTw9LTvxHuxMLt00=;
 b=JCHenCQ5ALtK0op+RFaW1EyjzJajGJghnwe1wAPiVsaL7o4gi3+dKGh+fnqeGQgDAvQcLvXwTniIBbpVTBHHUpGtpJcFgQPvJkhXZrzpjzl7FJRHKCVr09Yg9MeNaNJ6Tw+EBqeYLdrIu+44FJtz7j23v+gnQbQx1KIYMqANj4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS8PR04MB8372.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:25:52 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 10:25:52 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     stern@rowland.harvard.edu
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com
Subject: [PATCH 1/2] usb: ehci: add workaround for chipidea PORTSC.PEC bug
Date:   Tue,  8 Aug 2023 18:29:58 +0800
Message-Id: <20230808102959.479264-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096::12) To
 DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AS8PR04MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 36574ec7-2333-419f-61f0-08db97f9d743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CFQJXY0zKNdh0tEscUK9fwoSdZrOQeG5LfVfuxso3VLVJ8P8M/5QO4RSPASnGpf3vx1hi8vUablyS/FC/J0Vu4vbFZNWDuvt2FqH6C8ESRhtSmoey/rQW9T+XAag8Dz1B/JbDbq9EtdaVsyaHbCL0N6uU1GHYBuct9AiiDLqbOzdNwqD87Qj0RBBeVD4uzyB3CNe0r0UxESHbFvIwiCwM0mPSOzTYFze1LZ5+imiXjhQvkygYPTKkIhbSSoeNpIFQ4BaQo4pZy4REUkaIUfJsNC65D6kF1OPpuZl0gts/vlA+fHKzLqKxUHDhq24n5bpQBS4Dt1sEhd6o+HHu9iQrz/UL6q9EXzBXAgOZ7haRIGO4z3saYYSz7IyI6DVPvlsd+3+8R6mnssvvz5X1469pqqQmorbNj4gPwpsLCuBMMvxOKFwLDtQTPygS2D7KQw4DD8/J4ratknNc682QBRnsEicOqgzgpO+uAoNKEkEEc3fctoS60ZRXZj73S+b7VqnBfXXLs1wNZyj9PQxBQwI2zTdFoTGi8a+xOpgymJyVasTz55Sm1czIJBUHcFUL6oCsdid78OchyXWBdW4tsBuXmo+LNLKot4cIrYFRf0NB0nM1j+83ADcCtEflNCo+gsn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(366004)(136003)(346002)(186006)(1800799003)(451199021)(6486002)(478600001)(83380400001)(2616005)(6512007)(26005)(6506007)(1076003)(8936002)(316002)(66476007)(66556008)(41300700001)(8676002)(4326008)(66946007)(2906002)(6916009)(52116002)(36756003)(38350700002)(38100700002)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zERYl/g7kz8xhZ29fVmVvHJbZ7Dyc9weCdYI1t81gpNy1ycMWtfu5gMA1n1j?=
 =?us-ascii?Q?dJ2e5sY0GNxUDJ3FobJuFgh5EUh4TNO5hoOskNgXadZzwOsul8tboMtegvw7?=
 =?us-ascii?Q?FiBv4qJTKp3BCwQfoOQvTiBiEl3gF0uWXvriN/ONvA5SaLE6yyBKofFPKtr+?=
 =?us-ascii?Q?RZAW3EUwIQ+9Q2LPrXd9gyzyIIC5Of0G6XH8C71eMvcQllVWbykCSxsiMp4u?=
 =?us-ascii?Q?7cBuLt7SYHU656lmZsH2c1NCGDImh37fNns5IL8uFO+z3OOvj3xIfupjsDOb?=
 =?us-ascii?Q?pbUdMB0n7FVWiRQXYB42tRbhYEfNPZQqVgsXcpIQvsX1nlzEEkb5VFOmkL2x?=
 =?us-ascii?Q?qt2pKs+Aall09sm6hoa7bTj1DeSAMCz3Y5OLA5OGAeIbFClHJqA2ToqEh0Zt?=
 =?us-ascii?Q?btzbpV2hRHi6KVME+r7Lz/dseMYY6s1KiADpl/1fvRehfZ7nTIahTCzGbCjw?=
 =?us-ascii?Q?zr76qf490SWF4hHowF4RBjoW5n6u141RxFoJje+jkOaVV+9LELOzl/yhdfbq?=
 =?us-ascii?Q?g7OZZlFCDSuhgyAWCHivsnKNUv2pqbZM20j1XahcoIU5J72P16+mSIwYKAvm?=
 =?us-ascii?Q?T9jaOiqhNeZ0qCKwrwz1Y3/gb1FDLpfcSgQyQUIAXRRI4/jJIrTQ/7diM2v9?=
 =?us-ascii?Q?ZA/QDhIHTORJL7qvNOUK0x8kt0dub6/Ae5Rz7mOXQk210mhGWUurIuWQ9FG+?=
 =?us-ascii?Q?R6ubaF4v2ItCLICIt+/OP55rDydGv9mjfeufswTsihNG6M6h0AmYvAg9PuL7?=
 =?us-ascii?Q?R7soOvUrJ/ywWRhHT85XNThclffXn4hKmifDnwZXK8gq8ZtXvh/tqNuaj4I1?=
 =?us-ascii?Q?2PH/EfbzLBwKsIGccuwl0p03HeYlS7COuWa/htENHtumRyZblPBBBwExu6vL?=
 =?us-ascii?Q?oARQU3rkVThbVTWHThY2jtz7/JgMuBnCnzi2XBGHFSZ47FW2ggWkVyo7u4UP?=
 =?us-ascii?Q?MjINSQ8MobFFHQpG7n5wPbNUyYChT9Di3P09BaYRr8rEGQenHuO5UVKQc5v1?=
 =?us-ascii?Q?0o10B5mktnmvqSLFkOhrVODqYg50I48hpkAkKJc/FqXkTzMWBOivTmDMP8E6?=
 =?us-ascii?Q?/RDdknGEm2+AtX2wsX+rRx8no8ISTGN55uL8QS9LUtVb5U4GVuftuhbgJqGM?=
 =?us-ascii?Q?sjjRpakz0myJheiihxqvh2B04WAknY6DLYzCRzW5VwiZhWoQjRlqFIZ6JfUs?=
 =?us-ascii?Q?RELSS21Mrc5W1Q2W2lDnqFi6c32vb9EdkW2kKDpk7JV0nzkX8DLXaWAWNxfF?=
 =?us-ascii?Q?j24PASnSlf/pxX9wAGioEss/GiR4g0Z99FfRXnh0YxB5lpjpjlKEWag2zIau?=
 =?us-ascii?Q?ze0uEMdjO27EuwctVeyxvfe3gk42apeG6uSrLB+/L1JU9TSa+J6M6QK/wLyb?=
 =?us-ascii?Q?XJ/QYdzTj/dNw6TTxGfeEYk2oVpTVAsPF5+tGtv4AbI2gv/lsAX7u9yRtMKG?=
 =?us-ascii?Q?v+XV8zX3325omkUP4TGwFLOt3CNo8yISYwMwtE9nFa1pBjCvou5kIs2O3tRa?=
 =?us-ascii?Q?GBj7ihRiKq7Irkohbyd/02ZwXzieCN/ytr5ugAyZLoUW0AdPZ5s9MHBb0deD?=
 =?us-ascii?Q?sjTgu8iSJPnGCjcR1sKLdXormXKzhZYIzmXFcCJ7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36574ec7-2333-419f-61f0-08db97f9d743
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:25:51.9458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcqQsXmItsKyxSRvA2zI3gGdzvYQWOSlxik8Lkju3cJxjnSI4bDpl1dzAKQbb6pF0b6BevG3mr3V7XbGqtxTLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8372
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some NXP processor using chipidea IP has a bug when frame babble is
detected.

As per 4.15.1.1.1 Serial Bus Babble:
  A babble condition also exists if IN transaction is in progress at
High-speed SOF2 point. This is called frame balle. The host controller
must disable the port to which the frame babble is detected.

The USB controller has disabled the port (PE cleared) and has asserted
USBERRINT when frame babble is detected, but PEC is not asserted.
Therefore, the SW didn't aware that port has been disabled. Then the
SW keeps sending packets to this port, but all of the transfers will
fail.

This workaround will firstly assert PCD by SW when USBERRINT is detected
and then judge whether port change has really occurred or not by polling
roothub status. Because the PEC doesn't get asserted in our case, this
patch will also assert it by SW when specific conditions are satisfied.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/host/ehci-hcd.c |  5 +++++
 drivers/usb/host/ehci-hub.c | 10 +++++++++-
 drivers/usb/host/ehci.h     | 10 ++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index a1930db0da1c..d6b276c354db 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -762,6 +762,11 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
 		bh = 1;
 	}
 
+	/* Force to check port status */
+	if (ehci->has_ci_pec_bug && (status & STS_ERR)
+			&& !(status & STS_PCD))
+		status |= STS_PCD;
+
 	/* complete the unlinking of some qh [4.15.2.3] */
 	if (status & STS_IAA) {
 
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

