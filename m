Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003FC24CB32
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 05:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgHUDQB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 23:16:01 -0400
Received: from mail-eopbgr70089.outbound.protection.outlook.com ([40.107.7.89]:8928
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727040AbgHUDQA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 23:16:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxmNPWtl0ew9JvO2e4AKy8ERpS/vTzBOleLxLWafdrP92oa/DHisPPx7EjCj85BNdSzQer93yA16j6E31axwbFM0NKgRK6qhB925VWybdFTStP4UW0KqZHid2b2xwCnd7iOuCGYd7wxw8OWfZ2ZZy/N37Nu6UQhVLr5K25oL1rj2mob/z+1RJw3TQr4JhVg2OGfwkjXKuFt3tP95xcMFFcqGLQ1z/d4qbCsTFP00kXa9MYmywo8H3BD3O8mxrRk2LP8xdO0rf2+HK4QT6StxE++wLA42wc46BcTpXIo/Fy7MMcwpnBu6du+JRp4FOpC2YM3vXMukIWT2zpxCYImDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfU+1etNBhcqbhN+eUpg8iKopOuQHGo/PbHtmL8+rjU=;
 b=gdC2Mm5CGHsIiPUoTdpMWxn/9RrUGGkHm6C5SLtR2nJzuFAFLrI0WahGvSRkuZskIf3/MIPypuMmo2geQAjd9rfmxCjo9wroyQvn98K9V6BFz4iEEIpjNpaYlts2/B+t5TYu7AvYHvrWKTbWPuK6g81Lh52bMCrHDwpfEYWFV31OI0tcw6aJkUUn5Y+Fo0UyFs+1iq25vuOmpC33tjbqp0H+oHbSJU7pe2WmqV1jb20unHtnO9Od4S5OQzt5/R6bjSALCB5Cy5ocfGWsd5t+fnwV30i9gLP7rOjza5sShXDvfI5+hsb5LjNtg5KjtD3dsgXc04uV1bVajWxvX8aqzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfU+1etNBhcqbhN+eUpg8iKopOuQHGo/PbHtmL8+rjU=;
 b=LBjTpGFqdtNt8b1xEdzj61i/E5AGaOO7+rKbiCtzU/wCP+PJugPZo5AteD38LUxxCXcdEE4bC0Nxt46PIi786kiQigkX8lCPGn0JUQyimdC0UMmV4C9goqiptRNJwfuONbK8zpC39xQnIBpL+PJslM0VukLRuv4YTsFljkwgHQI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB8PR04MB6841.eurprd04.prod.outlook.com (2603:10a6:10:116::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 21 Aug
 2020 03:15:55 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 03:15:55 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH RESEND 1/1] usb: cdns3: gadget: fix some endian issues
Date:   Fri, 21 Aug 2020 11:14:37 +0800
Message-Id: <20200821031437.5008-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0140.apcprd03.prod.outlook.com
 (2603:1096:4:c8::13) To DB8PR04MB7162.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0140.apcprd03.prod.outlook.com (2603:1096:4:c8::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.10 via Frontend Transport; Fri, 21 Aug 2020 03:15:53 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dbee9b90-b62d-40f5-57bd-08d84580849c
X-MS-TrafficTypeDiagnostic: DB8PR04MB6841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB684120F24816C9C8C9291E328B5B0@DB8PR04MB6841.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Mbu3+E1Bgj93jVIeUWHI29LjkuREw0hQzh5p4Nnz+1mAzdHWykyxxPcwj4mZFnWXzZ78lWPz2MNeMZax2KbmxJ06CpSF+AehlukAwqGA5+l21zDVVABAStWQGTFDDvkup4XgUCOVwUksvbCDpL2UCNrbR2S3R7/oVUsjx9pxe3HULco9fkyR9RZ2xgkqIE1TRbNGA7/QJ3LSv3P+jJe7Z4bo+OP2ybStxT6mvyTL0DmAnGxG3jow+OmG5q8zrAP07zWcvkAawRZCOyL5yxi9OX3gIkMZNsLL7SRf2rtk87Zb86WTZWUaBEZLdy1nm5dsJmh8Qc4I5trPQemrYUkFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(66476007)(66556008)(86362001)(6512007)(8936002)(1076003)(5660300002)(66946007)(316002)(2616005)(44832011)(16526019)(956004)(186003)(8676002)(6506007)(6916009)(83380400001)(6486002)(36756003)(478600001)(6666004)(52116002)(2906002)(4326008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 3KND5d3dcaDB1Cq/1e+9aHnqaPJnKpGqx0Ejcji3vhteeldv7spxGeUxgVaIz2Xc68YGxFiMYn0bzOgP4mXlpPMxdfnUGhtygFzNPQrlpLCa+RZ4SK6BNrjnTq5G9Gwrkth3DTCI4TI6NSBeCyPHy5P3LwwbbLnk9lXbn9SuSeEfoTsWbYaG0a/EEZ2KbUb50g8EQD0GAoNOrWKcfdY9oO6nYueWFPQwXaGGySxKSXtvKXLCwoBEY6KnvS5bVGuV44u/xeTe+XfmfSIbxmLzlcZQ3WEQrzIzEFYQe1u+9UnpPqHUN/3sqPOHlZZmxg8aPMXalMBV7PBl1IdU3jkAhg7mBGbM/cosvzFMTpdCwziSI7wwMZ9d0/27L+wASGKUj7PbJSYuQay6KJRR+u38vmhCtweMgXUnY+BFzGh0zFiuqqPPDXQsHOLrOIbuZ8Q9/Dx+S/+GWsMB6vaARTvHMN1LmceObQXy38fWB8y7P5qBKMnWbwnCbVwjvpJdTGRaDP3xbs6cDzZh1DWGrNTIAxmUteEcqjJaP7EaCU8rPLabeIuighSsi06vX7IV8E9mUFvEApwevFh2CE8t8NihDN4lG+q1v76WmDcI72wATCzo9M4x5eYXgs+8qyElhthmk8St2ZuvP2tOPqOGkrxuhQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbee9b90-b62d-40f5-57bd-08d84580849c
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:15:55.8114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djWBXSbUoVNsJ5mukOUovBAEVivN3175YQ8X1GxwWNVIkl9kCqc+UL87al3HKM3uwlA39lyPIP4swP0ZkAcVEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6841
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is found by sparse.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
There are three endian fix patches for cdns3, the other two were 
accpeted, but this one may be forgetten, re-send again, thanks.

 drivers/usb/cdns3/gadget.c | 60 +++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 721e7914d91c..2551901e8470 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -261,8 +261,8 @@ int cdns3_allocate_trb_pool(struct cdns3_endpoint *priv_ep)
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
@@ -847,10 +847,10 @@ static void cdns3_wa1_restore_cycle_bit(struct cdns3_endpoint *priv_ep)
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
@@ -1008,17 +1008,16 @@ static int cdns3_ep_run_stream_transfer(struct cdns3_endpoint *priv_ep,
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
@@ -1027,11 +1026,11 @@ static int cdns3_ep_run_stream_transfer(struct cdns3_endpoint *priv_ep,
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
 
@@ -1156,8 +1155,8 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 		    TRBS_PER_SEGMENT > 2)
 			ch_bit = TRB_CHAIN;
 
-		link_trb->control = ((priv_ep->pcs) ? TRB_CYCLE : 0) |
-				    TRB_TYPE(TRB_LINK) | TRB_TOGGLE | ch_bit;
+		link_trb->control = cpu_to_le32(((priv_ep->pcs) ? TRB_CYCLE : 0) |
+				    TRB_TYPE(TRB_LINK) | TRB_TOGGLE | ch_bit);
 	}
 
 	if (priv_dev->dev_ver <= DEV_VER_V2)
@@ -1172,8 +1171,8 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 
 		/* fill TRB */
 		control |= TRB_TYPE(TRB_NORMAL);
-		trb->buffer = TRB_BUFFER(request->num_sgs == 0
-				? trb_dma : request->sg[sg_iter].dma_address);
+		trb->buffer = cpu_to_le32(TRB_BUFFER(request->num_sgs == 0
+				? trb_dma : request->sg[sg_iter].dma_address));
 
 		if (likely(!request->num_sgs))
 			length = request->length;
@@ -1187,10 +1186,10 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
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
 
@@ -1212,9 +1211,9 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 		}
 
 		if (sg_iter)
-			trb->control = control;
+			trb->control = cpu_to_le32(control);
 		else
-			priv_req->trb->control = control;
+			priv_req->trb->control = cpu_to_le32(control);
 
 		control = 0;
 		++sg_iter;
@@ -1228,7 +1227,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 	priv_req->flags |= REQUEST_PENDING;
 
 	if (sg_iter == 1)
-		trb->control |= TRB_IOC | TRB_ISP;
+		trb->control |= cpu_to_le32(TRB_IOC | TRB_ISP);
 
 	if (priv_dev->dev_ver < DEV_VER_V2 &&
 	    (priv_ep->flags & EP_TDLCHK_EN)) {
@@ -1254,7 +1253,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 
 	/* give the TD to the consumer*/
 	if (togle_pcs)
-		trb->control =  trb->control ^ 1;
+		trb->control = trb->control ^ cpu_to_le32(1);
 
 	if (priv_dev->dev_ver <= DEV_VER_V2)
 		cdns3_wa1_tray_restore_cycle_bit(priv_dev, priv_ep);
@@ -1393,7 +1392,7 @@ static bool cdns3_request_handled(struct cdns3_endpoint *priv_ep,
 
 	trb = &priv_ep->trb_pool[priv_req->start_trb];
 
-	if ((trb->control  & TRB_CYCLE) != priv_ep->ccs)
+	if ((le32_to_cpu(trb->control) & TRB_CYCLE) != priv_ep->ccs)
 		goto finish;
 
 	if (doorbell == 1 && current_index == priv_ep->dequeue)
@@ -1442,7 +1441,7 @@ static void cdns3_transfer_completed(struct cdns3_device *priv_dev,
 		trb = priv_ep->trb_pool + priv_ep->dequeue;
 
 		/* Request was dequeued and TRB was changed to TRB_LINK. */
-		if (TRB_FIELD_TO_TYPE(trb->control) == TRB_LINK) {
+		if (TRB_FIELD_TO_TYPE(le32_to_cpu(trb->control)) == TRB_LINK) {
 			trace_cdns3_complete_trb(priv_ep, trb);
 			cdns3_move_deq_to_next_trb(priv_req);
 		}
@@ -1574,7 +1573,7 @@ static int cdns3_check_ep_interrupt_proceed(struct cdns3_endpoint *priv_ep)
 		 * that host ignore the ERDY packet and driver has to send it
 		 * again.
 		 */
-		if (tdl && (dbusy | !EP_STS_BUFFEMPTY(ep_sts_reg) |
+		if (tdl && (dbusy || !EP_STS_BUFFEMPTY(ep_sts_reg) ||
 		    EP_STS_HOSTPP(ep_sts_reg))) {
 			writel(EP_CMD_ERDY |
 			       EP_CMD_ERDY_SID(priv_ep->last_stream_id),
@@ -2556,10 +2555,10 @@ int cdns3_gadget_ep_dequeue(struct usb_ep *ep,
 
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
@@ -2614,7 +2613,7 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
 		priv_req = to_cdns3_request(request);
 		trb = priv_req->trb;
 		if (trb)
-			trb->control = trb->control ^ TRB_CYCLE;
+			trb->control = trb->control ^ cpu_to_le32(TRB_CYCLE);
 	}
 
 	writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
@@ -2629,7 +2628,8 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
 
 	if (request) {
 		if (trb)
-			trb->control = trb->control ^ TRB_CYCLE;
+			trb->control = trb->control ^ cpu_to_le32(TRB_CYCLE);
+
 		cdns3_rearm_transfer(priv_ep, 1);
 	}
 
-- 
2.17.1

