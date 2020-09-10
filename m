Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8C526410A
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 11:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgIJJNJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 05:13:09 -0400
Received: from mail-eopbgr40061.outbound.protection.outlook.com ([40.107.4.61]:49482
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728971AbgIJJMb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 05:12:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/2f1RD4Jo4iBdQYq4RCc9sZmhfi/bsMT7IFFrIHoM0QhNJNpqguMVZYk8kaA21g9EmPXOZORpMQpkztRrLnBniP3Wi6StrZ2eMUG70uPzIrix7e4qq0k1vDdezgR5zmMjqZP5JnQIG6EjqIfOxbc3sZuUBMhUCHLCrctZA9mI6l+BSvVbH0CCY4SkzhijB4Ukh94X8aebxQmKtQxrKkzFzRxVcC0Hun/jdxZfv+DVt2Qx13ZB2pHex95njCOfkCuuryg1yoVJDl3JFlDH1co7CqATplzQ9uv3h18bckzhUuXWW4g+0y/ZZv6MxD+Bw13y5pvaqBy47smOjfBcQOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fhd1nfUR/aM26kdw811nX6X6ELDjEG3KUoF/PV/N8Ig=;
 b=GkeA1znK7FI7OPqjSrnYe1BUUNy4jVFNiTuONwG+vnP2LVQtGDz1+d33Uy8JzPUmN61+bW5x1/fPrNbgvHdPi2cTFrhaEwh4XiOcFrgYchcmV2MW2KXm9KGBbGvRk4/3YltyJBE55Didaf/5dFiAmmQvNautTggmEmwNgZ3rQqGS+Wb7p0woRio3MeLZQdypXZPWpEltSK9WwlrdaJ77he6P3uKNyCYFAlk9bBXNmeZKFEABBd23nMFI73nRTt3DasgZ3pJvzxId0RyxbOlPAQ2bZktWPHuM0boYWa4WbTF5C9lUtes0P3cCMCDZlyUS0DjmtAMO8wR3qxSOOIGZZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fhd1nfUR/aM26kdw811nX6X6ELDjEG3KUoF/PV/N8Ig=;
 b=NgIkZCjmnPsnGntmfvFFiWCJUOD4gsM7GMSafOnvKoKeaX1oM6iwbPs7I3IWJJaRNlrC19reiJaRPqea/l6hJeauku+5YCTvY5UephFJJ81F5jYu3ui2inoJpUYEmyJiOaEfR1Y2Ypk2M62Vh06decmgyLuQjdKFZ8s9aga5/WM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4168.eurprd04.prod.outlook.com (2603:10a6:209:43::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 10 Sep
 2020 09:12:16 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 09:12:16 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 1/8] usb: cdns3: gadget: using correct sg operations
Date:   Thu, 10 Sep 2020 17:11:23 +0800
Message-Id: <20200910091130.20937-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910091130.20937-1-peter.chen@nxp.com>
References: <20200910091130.20937-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0134.apcprd06.prod.outlook.com (2603:1096:1:1f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 09:12:13 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4a687e53-3d9d-4cab-4736-08d855699cba
X-MS-TrafficTypeDiagnostic: AM6PR04MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4168C205B1DBB9A018C0415E8B270@AM6PR04MB4168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:255;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wxQqiPUl/cyIeOzdffzUQRuw8MEko/mzgcuYuy9ITkHgph1/QVu/byhOhCSgMs6bABocAuSPtuAI2TYMmlItXAvE02PjRxbZq20dWy2qxAxAnlrUnZZA1PtxS8CLUiFrgdsFNnAo3ehu31wyPdf5DBcS9DLa6uD0nw5FUDc0Ei3xVQ/yF3R19jnQLyrInyHzui9kECR6OKIpY9T/BSR5y/NZ96QZjv7VsNIuscBw0pi3z1+1LfUBam64NOMB5BZfZBRn9M65RQOCQocmCo959q4Jatc5bgii0cMHu50IpzVx9/Qhsb0T6GMr14ho2vl3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(4326008)(6512007)(83380400001)(186003)(6486002)(16526019)(36756003)(66946007)(66556008)(1076003)(8936002)(66476007)(52116002)(26005)(478600001)(44832011)(6666004)(316002)(2616005)(2906002)(8676002)(956004)(5660300002)(6916009)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Fs8JacUkdoF7MPJcGKaz7fLyLqu+uBACW4RBfApdR3Q/QcWJ8sCwgj6I6i/71xCru3Pk10BTAwUOiRmJB4zCxedgDvNLB/X4Smi22g81wesVVcSBUNomxzzPdh5fbjTwCYuUUppcfoftOoyTXAqUi8SSNpupuHks6caE+xjEcQ1v1OiV/qWpIIGfUkD507ck+6jL0SBzwsqIiKW5A4eeQH9VJlttqWBaDd1bp09UCrgXrOaj1QUep6IUsXbl+yv6cBlUgjazxpdAXw8zBRkcOutMVvgHXvLi9X3Ba1FA8tr+J5/DbQvUKd7ZHzbThCZ8DTrErZ31u/NxJ4328OPUhDyc3B7p09tJ8Nf95+o80JLwRTZE/D6AQns6CLcdkHJHWkyQM/tFHSpXh4P6F4LjVStJBj6O0x2Z9dVtirp1ulMYw4EarouQBy3kNHrizX0Ln6DBU6GGslgDmVfP8ZAWQgnWI2CuhPmk/7m7M9QYbZ1L7uvSWutB2/6C5kgnFUsCu/o9IlOeoqHD93JeLDn3M8gFAVY5uRowA6PQLqbmdX4JpK8FUAHA3XxFtSZJoHiensmN5UU9aV8Iua6gKj/vKFv9JvInO/zMV8CuKwX3hK4l3v/+w9i3Xquj7n21LUAorLNY6Rn5oMmgqpAoiwyEQg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a687e53-3d9d-4cab-4736-08d855699cba
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 09:12:16.4117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKxXRVp6p7I5eSfwi24PZYo6IyGcJ4+YPab8UgYYi7dolzzC5RMB6A5WTaKSP/N0xqW6L7FuFGkDL2B6LhjcDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4168
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It needs to use request->num_mapped_sgs to indicate mapped sg number,
the request->num_sgs is the sg number before the mapping. These two
entries have different values for the platforms which iommu or
swiotlb is used. Besides, it needs to use correct sg APIs for
mapped sg list for TRB assignment.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 2ea4d30e1828..2d6dd6896937 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1098,11 +1098,13 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 	u32 control;
 	int pcs;
 	u16 total_tdl = 0;
+	struct scatterlist *s = NULL;
+	bool sg_supported = !!(request->num_mapped_sgs);
 
 	if (priv_ep->type == USB_ENDPOINT_XFER_ISOC)
 		num_trb = priv_ep->interval;
 	else
-		num_trb = request->num_sgs ? request->num_sgs : 1;
+		num_trb = sg_supported ? request->num_mapped_sgs : 1;
 
 	if (num_trb > priv_ep->free_trbs) {
 		priv_ep->flags |= EP_RING_FULL;
@@ -1162,6 +1164,9 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 	if (priv_dev->dev_ver <= DEV_VER_V2)
 		togle_pcs = cdns3_wa1_update_guard(priv_ep, trb);
 
+	if (sg_supported)
+		s = request->sg;
+
 	/* set incorrect Cycle Bit for first trb*/
 	control = priv_ep->pcs ? 0 : TRB_CYCLE;
 
@@ -1171,13 +1176,13 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 
 		/* fill TRB */
 		control |= TRB_TYPE(TRB_NORMAL);
-		trb->buffer = cpu_to_le32(TRB_BUFFER(request->num_sgs == 0
-				? trb_dma : request->sg[sg_iter].dma_address));
-
-		if (likely(!request->num_sgs))
+		if (sg_supported) {
+			trb->buffer = cpu_to_le32(TRB_BUFFER(sg_dma_address(s)));
+			length = sg_dma_len(s);
+		} else {
+			trb->buffer = cpu_to_le32(TRB_BUFFER(trb_dma));
 			length = request->length;
-		else
-			length = request->sg[sg_iter].length;
+		}
 
 		if (likely(priv_dev->dev_ver >= DEV_VER_V2))
 			td_size = DIV_ROUND_UP(length,
@@ -1215,6 +1220,9 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 		else
 			priv_req->trb->control = cpu_to_le32(control);
 
+		if (sg_supported)
+			s = sg_next(s);
+
 		control = 0;
 		++sg_iter;
 		priv_req->end_trb = priv_ep->enqueue;
-- 
2.17.1

