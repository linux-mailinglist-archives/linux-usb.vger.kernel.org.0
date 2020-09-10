Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B9C26410F
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 11:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730165AbgIJJOJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 05:14:09 -0400
Received: from mail-eopbgr130043.outbound.protection.outlook.com ([40.107.13.43]:44418
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730177AbgIJJNN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 05:13:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LK1GVfr7yjpbI3zIFLp/6KI88YuzLIsWQwzk6xKmb33xUqK7GOAup9aaEccfWJjUqUznFDhZ/iIieKtTuqM5JLr/pSVOqEDd/qTioRih2IYK6+bZFUQZ8GTE10/EkDCovATy8T1rcar+iketGcUMw/8nfH/DB8Dd/I69F48bPMKhNzL7kR6HYiP4ntQL9fRBZu7t8AAUzbJoIbWdBkc4/muJwtJlbw0f5bo5ywwZvAdjY/A/c7v9noKkUmzyZHUeqElsAytGLoi+QvrAkBrh7JPHy+GfowYvmTrYI/v3JxJx/wwi11cGGVxclUgPgyxqjtrCDlrKSE7W4VaBlW92+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTZmjZWNMZCjHBPHg0BPqkvhJxm5r5BxUflKtKkFW+0=;
 b=nqibcxjh2DDWqtYQP/+Zxac2JlmEHZf6fHhXw6SJJ2aD+4Mlspw8++gsstWHtKpuo7TFJRHmiuNNJ5OweGFF5BDm5Y0cfVrXRzdOESQS+647akQcVkVKotrtDLeZZvuPtgDHSmBHC0PmR6RGHuKMDiUF0txD/o54tEtDovnf1dIwegvC9U9TGA7my24RKmlwEsqP+SdmS7FPGeljVkpK/h0TOK9tDEWZPgVSoM0sScstAyQAoSGYMM/qouqncb5VXuQfQsmlWxcYLezPtj1QzoY1tjAuXVHG7N4i26sttnrV1BiYhJd1BzXAzS6zp42HxaUDxpO3wrLv97EN6Iukbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTZmjZWNMZCjHBPHg0BPqkvhJxm5r5BxUflKtKkFW+0=;
 b=fGqlE5y8iSZbHzYf2QUsRxAOnHSL0rispQxJ5czz2urBeqOK8vUXziPll8CNsEFTueYCcj66GEcyI/gdDXOJL6w+bE2OsnAMwf3YQQ90+V94b8GEiQy09tkQUH9yZ3fuAlEZa8d6XQxt/YrLLWgLpxxFDKuHQLj6Er6t/yyzFt4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4168.eurprd04.prod.outlook.com (2603:10a6:209:43::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 10 Sep
 2020 09:12:28 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 09:12:28 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 5/8] usb: cdns3: gadget: handle sg list use case at completion correctly
Date:   Thu, 10 Sep 2020 17:11:27 +0800
Message-Id: <20200910091130.20937-6-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910091130.20937-1-peter.chen@nxp.com>
References: <20200910091130.20937-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0134.apcprd06.prod.outlook.com (2603:1096:1:1f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 09:12:25 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8697f3ec-050b-4579-8567-08d85569a399
X-MS-TrafficTypeDiagnostic: AM6PR04MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB416850E017CD7111A8131A338B270@AM6PR04MB4168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NVCEm3jBslzA/baqy4xxGhkCE4GHiDM4VPrIq7wk/mNsTnnAuasRbsCWow1LH+AAdwDocyVL6tyGSwZIVEaF9w6Osq64usdFikBLq+MIuWbdeJEjqHlVDYIfOhAOpNV/cP8RoMrYm0jmr6q4p300K73TFsT08P7o74ORHkr40ztFhNEBT5L5ACdVQZOfhvv7gVoPxPEFzPoLFa7bXyB3aqkfeIkMfnh4Lg9wV4oRJcLhCfxKRqZ5T3Nw/lH+tfF/Pc62MQ0PoVfr8XzBWRDPwh1XCglqbu4RkYwxDyBam+aDRcFj58zrzbJfY7C6nLDDNf3xtFK/24BOOv/mmnLY6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(4326008)(6512007)(83380400001)(186003)(6486002)(16526019)(36756003)(66946007)(66556008)(1076003)(8936002)(66476007)(52116002)(26005)(478600001)(44832011)(316002)(2616005)(2906002)(8676002)(956004)(5660300002)(6916009)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 8CIbcb7BRfzyNwEdKNuxh+ahLj9q+Nb9FEJWwZwxvlLqtvBJWytpeE6bQiRRr14GvjZi6wKv1qXk07B/VMgUgNHxiWOnMRCpeq9MGLrQk74TvtWBvIe0Uy1TPo28JjIQgpZIhqy7c2awpiVKW0K/RBMKEPhE73fNvLi/npRYW6u8EncQuUnIYvajVhrTScGn92csFtjTumpFFgWFMDV11xZ1vCnSGnG07LwSQ80sIxY5G+yd99wct4wUxmviykOqRgkc1kRa2kbtezxabIz0faVBMkfeJ49DcXrgZnnh02upYQPVGgqEjTWvDrHZcjXXe/r7Q42/p/D9wQQJuOPBrvppKhP/CInBVs2bRq1Z5o7gP5dCQpfCx7Bd1uv7swH3Jc7mLS5BKfsFoMgcY8ccebrw+Va3IO7FQTTIyb3RHBFsVofxPfGGV1I97LIMwFgUcGXYzk4KDCNCxiUZvkqQkKLFzjo3HJJefQh7ftD9FxNfS2BEJhg9iz00+0XHrJI5W3eq+f1SYnPKLLzrNnH9qzxGECt9i3bByKAWZcuTj51HcLshEXAZ1SKoTS+r1ABVNFHhAWk8QUq5v9R4QdO9K0nVvfqz8RKo6cR6sYZfzh8XbtlCIL6aubwmGZdAiAcWQtt7W81T/tW9EjaMcn4PKg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8697f3ec-050b-4579-8567-08d85569a399
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 09:12:27.9521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJB7MnhSjfHF05EME+DAakGfghrUIZ7U4L48QIZO7YafDci9YC6autBlwqUB1nQQBI0SalaSG0zrih0gyHmeeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4168
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

- Judge each TRB has been handled at cdns3_trb_handled, since
the DMA pointer may be at the middle of the TD, we can't consider
this TD has finished at that time.
- Calculate req->actual according to finished TRBs.
- Handle short transfer for sg list use case correctly. When the
short transfer occurs, we check OUT_SMM at TRB to see if it is
the last TRB.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 85 +++++++++++++++++++++++++-------------
 drivers/usb/cdns3/gadget.h |  9 ++++
 2 files changed, 65 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 1df4ee2857e9..a5dbe1a01050 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -817,6 +817,8 @@ void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
 		       request->length);
 
 	priv_req->flags &= ~(REQUEST_PENDING | REQUEST_UNALIGNED);
+	/* All TRBs have finished, clear the counter */
+	priv_req->finished_trb = 0;
 	trace_cdns3_gadget_giveback(priv_req);
 
 	if (priv_dev->dev_ver < DEV_VER_V2) {
@@ -1240,6 +1242,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 	trb = priv_req->trb;
 
 	priv_req->flags |= REQUEST_PENDING;
+	priv_req->num_of_trb = num_trb;
 
 	if (sg_iter == 1)
 		trb->control |= cpu_to_le32(TRB_IOC | TRB_ISP);
@@ -1361,7 +1364,7 @@ void cdns3_set_hw_configuration(struct cdns3_device *priv_dev)
 }
 
 /**
- * cdns3_request_handled - check whether request has been handled by DMA
+ * cdns3_trb_handled - check whether trb has been handled by DMA
  *
  * @priv_ep: extended endpoint object.
  * @priv_req: request object for checking
@@ -1378,32 +1381,28 @@ void cdns3_set_hw_configuration(struct cdns3_device *priv_dev)
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
@@ -1415,7 +1414,25 @@ static bool cdns3_request_handled(struct cdns3_endpoint *priv_ep,
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
@@ -1437,12 +1454,8 @@ static bool cdns3_request_handled(struct cdns3_endpoint *priv_ep,
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
 
@@ -1458,6 +1471,8 @@ static void cdns3_transfer_completed(struct cdns3_device *priv_dev,
 	struct cdns3_request *priv_req;
 	struct usb_request *request;
 	struct cdns3_trb *trb;
+	bool request_handled = false;
+	bool transfer_end = false;
 
 	while (!list_empty(&priv_ep->pending_req_list)) {
 		request = cdns3_next_request(&priv_ep->pending_req_list);
@@ -1477,20 +1492,32 @@ static void cdns3_transfer_completed(struct cdns3_device *priv_dev,
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

