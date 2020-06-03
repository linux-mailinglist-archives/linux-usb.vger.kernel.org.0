Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF4F1EC9C3
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 08:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgFCGx5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jun 2020 02:53:57 -0400
Received: from mail-eopbgr20082.outbound.protection.outlook.com ([40.107.2.82]:8110
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725883AbgFCGx5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jun 2020 02:53:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaFc6dyr1jV11DphCQ24RjxEemzGuTxwfl5hdlrWdxudFUsYoZo6/DDiC/YyxqAkkx/h/B7gwuN3Cw+GguKykEdOQRhqZaV1DDQFxa08g0sXGpR8k2mDDs960q6tjUIYXI3WJ1UgqXudRAOCHduiU+1o08+Qw9i3NScE79w9u6VaOTdSw2C1V9t6T1NBJ3aDZTuJQ4/XTb62ioRjkIe7rcyop6imywvIz1NjP3CfDECMpTs/3lM/B9cBD3R57JPVw1bhR+HKfaqvRh7Dm8Scfm/AIvl56NdRAHjG9mj+2jHBxRSopJG8qWrawTyYB7509okkQUOEcG75qbLBJPYO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zScD5707ZrdOuAyvp60sSppNhry5GhF89ozRh2WjgEE=;
 b=eMVLocv7edOud3j6vWhuwuGNDWj6FiIOeNPEM+MSdUdMGpPCXJ4nUPQYmSotAyMxOFGK1sKDnV39jVtHTUEnwSAYbJswbAe43PF7ikfS2U2YYt8ilWZ502o3wMBg2o38W+Ov+3hmnnGQh3ZtIWgONdAteW68tu+bfGa26XkF4S7nSORu6SoDNTil4o9bBq+4d+yBjwYQrA7FgzRTe0Lf4mKLXifvCz8lbN4Z9mQ5CaVNaJeU00wp1qOkNEe68n7z0H9+Shn+L+p0/60H0CXtBEvotF8obZGYfcVvdQmPLAPaLBH5QT9Hx3IUBYKSwIy6a8EQaH/B7Uo4g3ZQcbbW/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zScD5707ZrdOuAyvp60sSppNhry5GhF89ozRh2WjgEE=;
 b=LS1njGTf/e4HTYzZBB344uemcJ4L1Rck1O4AUNrSF0NAMr4q9Hzz/XV7COKCCKfCnaYOsC1TL2+xHJJKsp/Zmx8Mpb8FE1Tl1shc5Coh4rzOVO0BFV+dfGks/iuhgqUzRjTbOw2MeJW75VucU6AfxIdjkWVi1knvBbGSafSHAhA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6824.eurprd04.prod.outlook.com (2603:10a6:20b:10e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Wed, 3 Jun
 2020 06:53:53 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 06:53:53 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 3/3] usb: cdns3: gadget: fix some endian issues
Date:   Wed,  3 Jun 2020 14:53:56 +0800
Message-Id: <20200603065356.14124-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200603065356.14124-1-peter.chen@nxp.com>
References: <20200603065356.14124-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Wed, 3 Jun 2020 06:53:50 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d032d118-ffb2-4a22-6261-08d8078ae0b7
X-MS-TrafficTypeDiagnostic: AM7PR04MB6824:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB682456972EC56A4C76437CE98B880@AM7PR04MB6824.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1NBcGelNiFe97yGWTmWith5FKWcRe/YN4hhCMtgiuGVSPeJ86yJr6LXIkXDn8Fs7fpPNM+yRLLmSgeOPX2cZ7pwbMEK3mbWg1N87YpM8KGDBPswRHs+g5Yz8tpLNXkCtGjDSA/IxDi6bckbQNA/O/4maRCCXtmPOefLUm2pJkoumXJm0adZYry90W8ggAaa1sAHu7moWHo4rnHJE2GYGX7z3fJzgudCDzOXBX7nsFUjcmYDiIuKEsebhrPd7q2K3IUQDAM77ZA2Gf+3PfhYatMZvev3IHnEkINaW2aNcHDO98TvyUOJbQPvmMguYmkls
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(478600001)(16526019)(8936002)(6512007)(6916009)(316002)(8676002)(956004)(2616005)(52116002)(6506007)(186003)(6486002)(4326008)(44832011)(26005)(2906002)(30864003)(1076003)(86362001)(83380400001)(5660300002)(66946007)(66476007)(66556008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: q1JMzfy8nlZkhBTEwMJL0oiRganEDfGzjy1OlIEVOY1WjHOgr2Zqf7qICeGBqZCcWRdosir1MAVOqeNflC8PvywGoyGRcSmw6Z7sw0RtLqafcHWy5OclYZI64ylcIA1dBzK0hKqjxjFMXoG20MP/BKSKhsCKA2J7c/4cj9XBEC1qMMmEz5eqpNeTyZaL4h8OjIokwM2AB3B9RjpCxqAQCTWqBIQ9EVCT1zQCm57nHz074P+lPzNO3YbXUwOVhGEWeNF/bJXfUGH9OmQBAd4tF5vz336vcxmLUNvWOmtUA0nDlwV4Ae0zn+p3Mf3J5QW8wHSY6iojOp6UlL28WcSvrX62fZ7gPLWTBEVqd1ZNpVPFzNsXA2ugn7i5X4QSTgE4DMbs0JP8uijcuKTjyaWGeDHkwD+PdeAgOHI6+3Wy/R0ieUKJa3sZktgAOnl3sfGiOkw0a5LJRgGd8xw5MydNdkvh8xQlGCOQ+TvahyECd2Y=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d032d118-ffb2-4a22-6261-08d8078ae0b7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 06:53:53.3107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4OHggKI/60m3WJqfbmbXLQHmEA3rz/rzqgYUJw90NcmaBhPlikS9DnopeURsGT6o9Sc7DkKi2HCJkiHWwASzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6824
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is found by sparse.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 80 +++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 2cee12195978..eac01b1a4958 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -82,7 +82,7 @@ static int cdns3_ep_run_stream_transfer(struct cdns3_endpoint *priv_ep,
  * @ptr: address of device controller register to be read and changed
  * @mask: bits requested to clar
  */
-void cdns3_clear_register_bit(void __iomem *ptr, u32 mask)
+static void cdns3_clear_register_bit(void __iomem *ptr, u32 mask)
 {
 	mask = readl(ptr) & ~mask;
 	writel(mask, ptr);
@@ -137,7 +137,7 @@ struct usb_request *cdns3_next_request(struct list_head *list)
  *
  * Returns buffer or NULL if no buffers in list
  */
-struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *list)
+static struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *list)
 {
 	return list_first_entry_or_null(list, struct cdns3_aligned_buf, list);
 }
@@ -148,7 +148,7 @@ struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *list)
  *
  * Returns request or NULL if no requests in list
  */
-struct cdns3_request *cdns3_next_priv_request(struct list_head *list)
+static struct cdns3_request *cdns3_next_priv_request(struct list_head *list)
 {
 	return list_first_entry_or_null(list, struct cdns3_request, list);
 }
@@ -190,7 +190,7 @@ dma_addr_t cdns3_trb_virt_to_dma(struct cdns3_endpoint *priv_ep,
 	return priv_ep->trb_pool_dma + offset;
 }
 
-int cdns3_ring_size(struct cdns3_endpoint *priv_ep)
+static int cdns3_ring_size(struct cdns3_endpoint *priv_ep)
 {
 	switch (priv_ep->type) {
 	case USB_ENDPOINT_XFER_ISOC:
@@ -260,8 +260,8 @@ int cdns3_allocate_trb_pool(struct cdns3_endpoint *priv_ep)
 		 */
 		link_trb->control = 0;
 	} else {
-		link_trb->buffer = TRB_BUFFER(priv_ep->trb_pool_dma);
-		link_trb->control = TRB_CYCLE | TRB_TYPE(TRB_LINK) | TRB_TOGGLE;
+		link_trb->buffer = cpu_to_le32(TRB_BUFFER(priv_ep->trb_pool_dma));
+		link_trb->control = cpu_to_le32(TRB_CYCLE | TRB_TYPE(TRB_LINK) | TRB_TOGGLE);
 	}
 	return 0;
 }
@@ -345,7 +345,7 @@ static void cdns3_ep_inc_deq(struct cdns3_endpoint *priv_ep)
 	cdns3_ep_inc_trb(&priv_ep->dequeue, &priv_ep->ccs, priv_ep->num_trbs);
 }
 
-void cdns3_move_deq_to_next_trb(struct cdns3_request *priv_req)
+static void cdns3_move_deq_to_next_trb(struct cdns3_request *priv_req)
 {
 	struct cdns3_endpoint *priv_ep = priv_req->priv_ep;
 	int current_trb = priv_req->start_trb;
@@ -511,7 +511,7 @@ static void cdns3_wa2_descmiss_copy_data(struct cdns3_endpoint *priv_ep,
 	}
 }
 
-struct usb_request *cdns3_wa2_gadget_giveback(struct cdns3_device *priv_dev,
+static struct usb_request *cdns3_wa2_gadget_giveback(struct cdns3_device *priv_dev,
 					      struct cdns3_endpoint *priv_ep,
 					      struct cdns3_request *priv_req)
 {
@@ -551,7 +551,7 @@ struct usb_request *cdns3_wa2_gadget_giveback(struct cdns3_device *priv_dev,
 	return &priv_req->request;
 }
 
-int cdns3_wa2_gadget_ep_queue(struct cdns3_device *priv_dev,
+static int cdns3_wa2_gadget_ep_queue(struct cdns3_device *priv_dev,
 			      struct cdns3_endpoint *priv_ep,
 			      struct cdns3_request *priv_req)
 {
@@ -836,7 +836,7 @@ void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
 		cdns3_gadget_ep_free_request(&priv_ep->endpoint, request);
 }
 
-void cdns3_wa1_restore_cycle_bit(struct cdns3_endpoint *priv_ep)
+static void cdns3_wa1_restore_cycle_bit(struct cdns3_endpoint *priv_ep)
 {
 	/* Work around for stale data address in TRB*/
 	if (priv_ep->wa1_set) {
@@ -846,10 +846,10 @@ void cdns3_wa1_restore_cycle_bit(struct cdns3_endpoint *priv_ep)
 		priv_ep->wa1_trb_index = 0xFFFF;
 		if (priv_ep->wa1_cycle_bit) {
 			priv_ep->wa1_trb->control =
-				priv_ep->wa1_trb->control | 0x1;
+				priv_ep->wa1_trb->control | cpu_to_le32(0x1);
 		} else {
 			priv_ep->wa1_trb->control =
-				priv_ep->wa1_trb->control & ~0x1;
+				priv_ep->wa1_trb->control & cpu_to_le32(~0x1);
 		}
 	}
 }
@@ -1007,17 +1007,16 @@ static int cdns3_ep_run_stream_transfer(struct cdns3_endpoint *priv_ep,
 		  TRB_STREAM_ID(priv_req->request.stream_id) | TRB_ISP;
 
 	if (!request->num_sgs) {
-		trb->buffer = TRB_BUFFER(trb_dma);
+		trb->buffer = cpu_to_le32(TRB_BUFFER(trb_dma));
 		length = request->length;
 	} else {
-		trb->buffer = TRB_BUFFER(request->sg[sg_idx].dma_address);
+		trb->buffer = cpu_to_le32(TRB_BUFFER(request->sg[sg_idx].dma_address));
 		length = request->sg[sg_idx].length;
 	}
 
 	tdl = DIV_ROUND_UP(length, priv_ep->endpoint.maxpacket);
 
-	trb->length = TRB_BURST_LEN(16 /*priv_ep->trb_burst_size*/) |
-				  TRB_LEN(length);
+	trb->length = cpu_to_le32(TRB_BURST_LEN(16) | TRB_LEN(length));
 
 	/*
 	 * For DEV_VER_V2 controller version we have enabled
@@ -1026,11 +1025,11 @@ static int cdns3_ep_run_stream_transfer(struct cdns3_endpoint *priv_ep,
 	 */
 	if (priv_dev->dev_ver >= DEV_VER_V2) {
 		if (priv_dev->gadget.speed == USB_SPEED_SUPER)
-			trb->length |= TRB_TDL_SS_SIZE(tdl);
+			trb->length |= cpu_to_le32(TRB_TDL_SS_SIZE(tdl));
 	}
 	priv_req->flags |= REQUEST_PENDING;
 
-	trb->control = control;
+	trb->control = cpu_to_le32(control);
 
 	trace_cdns3_prepare_trb(priv_ep, priv_req->trb);
 
@@ -1154,8 +1153,8 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 		    TRBS_PER_SEGMENT > 2)
 			ch_bit = TRB_CHAIN;
 
-		link_trb->control = ((priv_ep->pcs) ? TRB_CYCLE : 0) |
-				    TRB_TYPE(TRB_LINK) | TRB_TOGGLE | ch_bit;
+		link_trb->control = cpu_to_le32(((priv_ep->pcs) ? TRB_CYCLE : 0) |
+				    TRB_TYPE(TRB_LINK) | TRB_TOGGLE | ch_bit);
 	}
 
 	if (priv_dev->dev_ver <= DEV_VER_V2)
@@ -1170,8 +1169,8 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 
 		/* fill TRB */
 		control |= TRB_TYPE(TRB_NORMAL);
-		trb->buffer = TRB_BUFFER(request->num_sgs == 0
-				? trb_dma : request->sg[sg_iter].dma_address);
+		trb->buffer = cpu_to_le32(TRB_BUFFER(request->num_sgs == 0
+				? trb_dma : request->sg[sg_iter].dma_address));
 
 		if (likely(!request->num_sgs))
 			length = request->length;
@@ -1185,10 +1184,10 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 			total_tdl += DIV_ROUND_UP(length,
 					       priv_ep->endpoint.maxpacket);
 
-		trb->length = TRB_BURST_LEN(priv_ep->trb_burst_size) |
-					TRB_LEN(length);
+		trb->length = cpu_to_le32(TRB_BURST_LEN(priv_ep->trb_burst_size) |
+					TRB_LEN(length));
 		if (priv_dev->gadget.speed == USB_SPEED_SUPER)
-			trb->length |= TRB_TDL_SS_SIZE(td_size);
+			trb->length |= cpu_to_le32(TRB_TDL_SS_SIZE(td_size));
 		else
 			control |= TRB_TDL_HS_SIZE(td_size);
 
@@ -1210,9 +1209,9 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 		}
 
 		if (sg_iter)
-			trb->control = control;
+			trb->control = cpu_to_le32(control);
 		else
-			priv_req->trb->control = control;
+			priv_req->trb->control = cpu_to_le32(control);
 
 		control = 0;
 		++sg_iter;
@@ -1226,7 +1225,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 	priv_req->flags |= REQUEST_PENDING;
 
 	if (sg_iter == 1)
-		trb->control |= TRB_IOC | TRB_ISP;
+		trb->control |= cpu_to_le32(TRB_IOC | TRB_ISP);
 
 	if (priv_dev->dev_ver < DEV_VER_V2 &&
 	    (priv_ep->flags & EP_TDLCHK_EN)) {
@@ -1252,7 +1251,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 
 	/* give the TD to the consumer*/
 	if (togle_pcs)
-		trb->control =  trb->control ^ 1;
+		trb->control = trb->control ^ cpu_to_le32(1);
 
 	if (priv_dev->dev_ver <= DEV_VER_V2)
 		cdns3_wa1_tray_restore_cycle_bit(priv_dev, priv_ep);
@@ -1390,7 +1389,7 @@ static bool cdns3_request_handled(struct cdns3_endpoint *priv_ep,
 
 	trb = &priv_ep->trb_pool[priv_req->start_trb];
 
-	if ((trb->control  & TRB_CYCLE) != priv_ep->ccs)
+	if ((le32_to_cpu(trb->control) & TRB_CYCLE) != priv_ep->ccs)
 		goto finish;
 
 	if (doorbell == 1 && current_index == priv_ep->dequeue)
@@ -1439,7 +1438,7 @@ static void cdns3_transfer_completed(struct cdns3_device *priv_dev,
 		trb = priv_ep->trb_pool + priv_ep->dequeue;
 
 		/* Request was dequeued and TRB was changed to TRB_LINK. */
-		if (TRB_FIELD_TO_TYPE(trb->control) == TRB_LINK) {
+		if (TRB_FIELD_TO_TYPE(le32_to_cpu(trb->control)) == TRB_LINK) {
 			trace_cdns3_complete_trb(priv_ep, trb);
 			cdns3_move_deq_to_next_trb(priv_req);
 		}
@@ -1571,7 +1570,7 @@ static int cdns3_check_ep_interrupt_proceed(struct cdns3_endpoint *priv_ep)
 		 * that host ignore the ERDY packet and driver has to send it
 		 * again.
 		 */
-		if (tdl && (dbusy | !EP_STS_BUFFEMPTY(ep_sts_reg) |
+		if (tdl && (dbusy || !EP_STS_BUFFEMPTY(ep_sts_reg) ||
 		    EP_STS_HOSTPP(ep_sts_reg))) {
 			writel(EP_CMD_ERDY |
 			       EP_CMD_ERDY_SID(priv_ep->last_stream_id),
@@ -1908,7 +1907,7 @@ static int cdns3_ep_onchip_buffer_reserve(struct cdns3_device *priv_dev,
 	return 0;
 }
 
-void cdns3_stream_ep_reconfig(struct cdns3_device *priv_dev,
+static void cdns3_stream_ep_reconfig(struct cdns3_device *priv_dev,
 			      struct cdns3_endpoint *priv_ep)
 {
 	if (!priv_ep->use_streams || priv_dev->gadget.speed < USB_SPEED_SUPER)
@@ -1929,7 +1928,7 @@ void cdns3_stream_ep_reconfig(struct cdns3_device *priv_dev,
 			       EP_CFG_TDL_CHK | EP_CFG_SID_CHK);
 }
 
-void cdns3_configure_dmult(struct cdns3_device *priv_dev,
+static void cdns3_configure_dmult(struct cdns3_device *priv_dev,
 			   struct cdns3_endpoint *priv_ep)
 {
 	struct cdns3_usb_regs __iomem *regs = priv_dev->regs;
@@ -2553,10 +2552,10 @@ int cdns3_gadget_ep_dequeue(struct usb_ep *ep,
 
 	/* Update ring only if removed request is on pending_req_list list */
 	if (req_on_hw_ring && link_trb) {
-		link_trb->buffer = TRB_BUFFER(priv_ep->trb_pool_dma +
-			((priv_req->end_trb + 1) * TRB_SIZE));
-		link_trb->control = (link_trb->control & TRB_CYCLE) |
-				    TRB_TYPE(TRB_LINK) | TRB_CHAIN;
+		link_trb->buffer = cpu_to_le32(TRB_BUFFER(priv_ep->trb_pool_dma +
+			((priv_req->end_trb + 1) * TRB_SIZE)));
+		link_trb->control = cpu_to_le32((le32_to_cpu(link_trb->control) & TRB_CYCLE) |
+				    TRB_TYPE(TRB_LINK) | TRB_CHAIN);
 
 		if (priv_ep->wa1_trb == priv_req->trb)
 			cdns3_wa1_restore_cycle_bit(priv_ep);
@@ -2611,7 +2610,7 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
 		priv_req = to_cdns3_request(request);
 		trb = priv_req->trb;
 		if (trb)
-			trb->control = trb->control ^ TRB_CYCLE;
+			trb->control = trb->control ^ cpu_to_le32(TRB_CYCLE);
 	}
 
 	writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
@@ -2626,7 +2625,8 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
 
 	if (request) {
 		if (trb)
-			trb->control = trb->control ^ TRB_CYCLE;
+			trb->control = trb->control ^ cpu_to_le32(TRB_CYCLE);
+
 		cdns3_rearm_transfer(priv_ep, 1);
 	}
 
-- 
2.17.1

