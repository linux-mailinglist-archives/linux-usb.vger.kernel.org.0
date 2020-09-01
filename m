Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1769258A9D
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 10:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgIAIpq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 04:45:46 -0400
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:53473
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726204AbgIAIpp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 04:45:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFuaLQY9L9sgK7rKTtRslo4E6Ml3/BndXOl3hxxGINiFab5kcXo4CvIjN378+wxDwNBDA+1ilqW/CaOiGaVT0ZhIrACppb8neyN0YHFOSLYT40WGmt5KmtamV/VxOvGE0S6tnpk9oVXTRbvefVJsNPI9ea7dTGQDVsFlO3YAijdzIV9GVmRJEfRFbgvNd1APCDTyD9RlgZx6OkxM5kQW0uGZ5jU3UwzeH57RN1MSA7DJosyyvQS9hsXIYF2lFVWZCGJXLmgtQkW3BIqZx80R0IqV+oXms34zC6w1SdIGufBmG4r0DWhdiOfKiUbXMaq2Y4QSh3vCyeQl/AyuSfDZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kme46ZAuNqgq7TR7Tc5ir9VEi1ewUp1S0ILrYi2C+pQ=;
 b=i8VYzc7SqfzDFgcubOeaCH5KUHm6Zqmg+8AREams/KVghauMMzNFgYv8YaNVXmQskl8KsqzwhrqtLlMVvWLDAGgmMXQ9O0ZovYWHHJ/R/sDGXwWlGn260sXDP8m1sHaThRpOczEKQ0QlJ2Sh73VAO1ih3q4kzL6OgtaPRFa0it2IStMu4j/vitMJSfmp/LfmnVfxoJFiX0UYHFO3G5WsPWyXdpDmIWz6YRqSpc1i5UxtSSfyg7o0d7AIQBQA16YQmpQv+GuEkD8yNGx62Jp9Aeb1D8yZ+f2jddmHokYszgfw0XOUcLeWoJq+QP7EBcJP/PDW38UZaUQGptBxQzVIxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kme46ZAuNqgq7TR7Tc5ir9VEi1ewUp1S0ILrYi2C+pQ=;
 b=op18V+hrqfe9IovbnEtleL7bs6qYJc0hVF6l9Hor0McniowkheQYvZpoIJ1JSTT8uHM5Ku8ZL8V6/W71MNCx9u2YXVrZFIbFPGWd2raj23eusTHDmbroGq83SqpUvGtCzE5N8r84YfmcUhw/L2s93Nps5XjYi35WIcdBswfJjnc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4360.eurprd04.prod.outlook.com (2603:10a6:209:50::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Tue, 1 Sep
 2020 08:45:37 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 08:45:37 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 5/8] usb: cdns3: gadget: handle sg list use case at completion correctly
Date:   Tue,  1 Sep 2020 16:44:51 +0800
Message-Id: <20200901084454.28649-6-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901084454.28649-1-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0226.apcprd06.prod.outlook.com (2603:1096:4:68::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 08:45:35 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d4cebfa6-720a-4cc4-205d-08d84e536601
X-MS-TrafficTypeDiagnostic: AM6PR04MB4360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB436055A40B1D8264E968DF628B2E0@AM6PR04MB4360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 26QRroHummDX1yyM/H6v0I8TOF6Qj32bVIz7ktYpEdZArl6UlRRm33mtLKYtNBZUxHURAOPN8QgvLBApMmqjIApXd0S1MO5/g/pxEv3eJNr9HGE80zpqkvQqcx7gaoQx8+jjt4USWaSb2uA6tMXiIh+oWbz9Pc4T7Bk+rZfvXjnqs5UrqQkHcDlpD3M2nXdsgao7DrbzHue/IG0ZiHyj+cdm6AprW8GwAZcYu82M19zFbnHjtG1mfZ0c1HQT9E0XKwjj8bpvhEe/ZafYzNdScEQ0qTw0uh2h34N9wiGNmNyjsdD8VTJ3rUEpXB1hDV1OmszzRBbmIR7R2ZM4Qrobew==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(956004)(86362001)(26005)(8676002)(8936002)(66946007)(2906002)(36756003)(1076003)(6506007)(6512007)(6916009)(2616005)(316002)(5660300002)(478600001)(4326008)(66556008)(66476007)(83380400001)(186003)(6486002)(44832011)(16526019)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 8ZDTbvikT3MjK6G0zYuL0R35wUSPF2iTzFDMpySLouldQnmywaOKVNsGny67hXJYQmcK6uxm+qFu+7olXsj6yjPx/BGq0lO6h4pMTNHGvYJ7icrBNj9h5Qy5+1lTvUJTVbX5WWfpSXi0ex/qTiee4J3MCUTBSRSYQzG90GItUd9oTWCRiS8lK6003oLZqWnekJBJV9wMyMNK3Y3+DrgZDlQLyGNtOWI8mNxa3k7Flcd+yjU+FsLjzw8cEbICCp5Lspr53DtuuBllMjhkVEf/Mnvc7mq9VWIY7u0Eqmkqt62yjCoiQ4Webb63QOhsYU5HpKllfoBwb928sBr2cwSOFl7sDkRAEQH7Z/bdTir7ofaYED2DPrJYfNjMgJW7vD8Y8HDIR2jGdnsrDo7+pLQwq1ySddqPkelT/bBMTG0gH+riXOs0R1Jppd0Bj1Z4q/Lgy2gCtMxXXGLKnpPTsduwKjhmGcYNXWJwjQaL6m8dOZ/I2NiWdBFDf4yUFjXEFVDg+HR8l/Km3sEBLxOsuzP70ViXdeEVTP3oo3WYuBAfA9+Ld0dnHW5BtXvHgaoKgW8bdeiYawuQ1cGmxbVx+X6krFwRNFkA76Rv8RDndZ25e2FyBwyiIFfch1Wj8OCjXdGReYwLXrs1CTOeZYgLdL31tA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4cebfa6-720a-4cc4-205d-08d84e536601
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 08:45:37.5598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /B9cBRhF2MzH9Nu9ZNYZ82pKeESc9k6ATmgn5aBq+okgyhyWkLZfD7MuEvO7qn7wsb2QmcuT8OLr6vzA5A3Vmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4360
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

- Judge each TRB has been handled at cdns3_trb_handled, since
the DMA pointer may be at the middle of the TD, we can't consider
this TD has finished at that time.
- Calcuate req->actual according to finished TRBs.
- Handle short transfer for sg list use case correctly. When the
short transfer occurs, we check OUT_SMM at TRB to see if it is
the last TRB.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 85 +++++++++++++++++++++++++-------------
 drivers/usb/cdns3/gadget.h |  9 ++++
 2 files changed, 65 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index a308a694abc5..6cb44c354f40 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -817,6 +817,8 @@ void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
 		       request->length);
 
 	priv_req->flags &= ~(REQUEST_PENDING | REQUEST_UNALIGNED);
+	/* All TRBs have finished, clear the counter */
+	priv_req->finished_trb = 0;
 	trace_cdns3_gadget_giveback(priv_req);
 
 	if (priv_dev->dev_ver < DEV_VER_V2) {
@@ -1241,6 +1243,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 	trb = priv_req->trb;
 
 	priv_req->flags |= REQUEST_PENDING;
+	priv_req->num_of_trb = num_trb;
 
 	if (sg_iter == 1)
 		trb->control |= cpu_to_le32(TRB_IOC | TRB_ISP);
@@ -1362,7 +1365,7 @@ void cdns3_set_hw_configuration(struct cdns3_device *priv_dev)
 }
 
 /**
- * cdns3_request_handled - check whether request has been handled by DMA
+ * cdns3_trb_handled - check whether trb has been handled by DMA
  *
  * @priv_ep: extended endpoint object.
  * @priv_req: request object for checking
@@ -1379,32 +1382,28 @@ void cdns3_set_hw_configuration(struct cdns3_device *priv_dev)
  * ET = priv_req->end_trb - index of last TRB in transfer ring
  * CI = current_index - index of processed TRB by DMA.
  *
- * As first step, function checks if cycle bit for priv_req->start_trb is
- * correct.
+ * As first step, we check if the TRB between the ST and ET.
+ * Then, we check if cycle bit for index priv_ep->dequeue
+ * is correct.
  *
  * some rules:
- * 1. priv_ep->dequeue never exceed current_index.
+ * 1. priv_ep->dequeue never equals to current_index.
  * 2  priv_ep->enqueue never exceed priv_ep->dequeue
  * 3. exception: priv_ep->enqueue == priv_ep->dequeue
  *    and priv_ep->free_trbs is zero.
  *    This case indicate that TR is full.
  *
- * Then We can split recognition into two parts:
+ * At below two cases, the request have been handled.
  * Case 1 - priv_ep->dequeue < current_index
  *      SR ... EQ ... DQ ... CI ... ER
  *      SR ... DQ ... CI ... EQ ... ER
  *
- *      Request has been handled by DMA if ST and ET is between DQ and CI.
- *
  * Case 2 - priv_ep->dequeue > current_index
- * This situation take place when CI go through the LINK TRB at the end of
+ * This situation takes place when CI go through the LINK TRB at the end of
  * transfer ring.
  *      SR ... CI ... EQ ... DQ ... ER
- *
- *      Request has been handled by DMA if ET is less then CI or
- *      ET is greater or equal DQ.
  */
-static bool cdns3_request_handled(struct cdns3_endpoint *priv_ep,
+static bool cdns3_trb_handled(struct cdns3_endpoint *priv_ep,
 				  struct cdns3_request *priv_req)
 {
 	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
@@ -1416,7 +1415,25 @@ static bool cdns3_request_handled(struct cdns3_endpoint *priv_ep,
 	current_index = cdns3_get_dma_pos(priv_dev, priv_ep);
 	doorbell = !!(readl(&priv_dev->regs->ep_cmd) & EP_CMD_DRDY);
 
-	trb = &priv_ep->trb_pool[priv_req->start_trb];
+	/* current trb doesn't belong to this request */
+	if (priv_req->start_trb < priv_req->end_trb) {
+		if (priv_ep->dequeue > priv_req->end_trb)
+			goto finish;
+
+		if (priv_ep->dequeue < priv_req->start_trb)
+			goto finish;
+	}
+
+	if ((priv_req->start_trb > priv_req->end_trb) &&
+		(priv_ep->dequeue > priv_req->end_trb) &&
+		(priv_ep->dequeue < priv_req->start_trb))
+		goto finish;
+
+	if ((priv_req->start_trb == priv_req->end_trb) &&
+		(priv_ep->dequeue != priv_req->end_trb))
+		goto finish;
+
+	trb = &priv_ep->trb_pool[priv_ep->dequeue];
 
 	if ((le32_to_cpu(trb->control) & TRB_CYCLE) != priv_ep->ccs)
 		goto finish;
@@ -1438,12 +1455,8 @@ static bool cdns3_request_handled(struct cdns3_endpoint *priv_ep,
 		    !priv_ep->dequeue)
 			goto finish;
 
-		if (priv_req->end_trb >= priv_ep->dequeue &&
-		    priv_req->end_trb < current_index)
-			handled = 1;
+		handled = 1;
 	} else if (priv_ep->dequeue  > current_index) {
-		if (priv_req->end_trb  < current_index ||
-		    priv_req->end_trb >= priv_ep->dequeue)
 			handled = 1;
 	}
 
@@ -1459,6 +1472,8 @@ static void cdns3_transfer_completed(struct cdns3_device *priv_dev,
 	struct cdns3_request *priv_req;
 	struct usb_request *request;
 	struct cdns3_trb *trb;
+	bool request_handled = false;
+	bool transfer_end = false;
 
 	while (!list_empty(&priv_ep->pending_req_list)) {
 		request = cdns3_next_request(&priv_ep->pending_req_list);
@@ -1478,20 +1493,32 @@ static void cdns3_transfer_completed(struct cdns3_device *priv_dev,
 			 */
 			cdns3_select_ep(priv_dev, priv_ep->endpoint.address);
 
-			if (!cdns3_request_handled(priv_ep, priv_req))
-				goto prepare_next_td;
+			while (cdns3_trb_handled(priv_ep, priv_req)) {
+				priv_req->finished_trb++;
+				if (priv_req->finished_trb >= priv_req->num_of_trb)
+					request_handled = true;
 
-			trb = priv_ep->trb_pool + priv_ep->dequeue;
-			trace_cdns3_complete_trb(priv_ep, trb);
+				trb = priv_ep->trb_pool + priv_ep->dequeue;
+				trace_cdns3_complete_trb(priv_ep, trb);
 
-			if (trb != priv_req->trb)
-				dev_warn(priv_dev->dev,
-					 "request_trb=0x%p, queue_trb=0x%p\n",
-					 priv_req->trb, trb);
+				if (!transfer_end)
+					request->actual +=
+						TRB_LEN(le32_to_cpu(trb->length));
 
-			request->actual = TRB_LEN(le32_to_cpu(trb->length));
-			cdns3_move_deq_to_next_trb(priv_req);
-			cdns3_gadget_giveback(priv_ep, priv_req, 0);
+				if (priv_req->num_of_trb > 1 &&
+					le32_to_cpu(trb->control) & TRB_SMM)
+					transfer_end = true;
+
+				cdns3_ep_inc_deq(priv_ep);
+			}
+
+			if (request_handled) {
+				cdns3_gadget_giveback(priv_ep, priv_req, 0);
+				request_handled = false;
+				transfer_end = false;
+			} else {
+				goto prepare_next_td;
+			}
 
 			if (priv_ep->type != USB_ENDPOINT_XFER_ISOC &&
 			    TRBS_PER_SEGMENT == 2)
diff --git a/drivers/usb/cdns3/gadget.h b/drivers/usb/cdns3/gadget.h
index 52765b098b9e..9f8bd452847e 100644
--- a/drivers/usb/cdns3/gadget.h
+++ b/drivers/usb/cdns3/gadget.h
@@ -1030,6 +1030,11 @@ struct cdns3_trb {
  * When set to '1', the device will toggle its interpretation of the Cycle bit
  */
 #define TRB_TOGGLE		BIT(1)
+/*
+ * The controller will set it if OUTSMM (OUT size mismatch) is detected,
+ * this bit is for normal TRB
+ */
+#define TRB_SMM			BIT(1)
 
 /*
  * Short Packet (SP). OUT EPs at DMULT=1 only. Indicates if the TRB was
@@ -1215,6 +1220,8 @@ struct cdns3_aligned_buf {
  *               this endpoint
  * @flags: flag specifying special usage of request
  * @list: used by internally allocated request to add to wa2_descmiss_req_list.
+ * @finished_trb: number of trb has already finished per request
+ * @num_of_trb: how many trbs in this request
  */
 struct cdns3_request {
 	struct usb_request		request;
@@ -1230,6 +1237,8 @@ struct cdns3_request {
 #define REQUEST_UNALIGNED		BIT(4)
 	u32				flags;
 	struct list_head		list;
+	int				finished_trb;
+	int				num_of_trb;
 };
 
 #define to_cdns3_request(r) (container_of(r, struct cdns3_request, request))
-- 
2.17.1

