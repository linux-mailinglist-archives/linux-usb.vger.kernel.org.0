Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73155258A99
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 10:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgIAIpa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 04:45:30 -0400
Received: from mail-eopbgr30042.outbound.protection.outlook.com ([40.107.3.42]:38273
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726102AbgIAIp3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 04:45:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/VRTk8SLM0slNipMjNBTJyNWnQGkyI19N7av0soyFSjvTZ9NIk3JoOUL3Pml/o6xeQhRTBguIG73Cnz1VMfsWUuMxHKlPhb9GJSbhZXMQIr1/rPcXerWWVqG0acmT6YXgCVhkYFG/WjPOIEw1HvcViHufa3Ky2datLuyaXqkbGiI2p7hSBE5PZKHq/wyG6CFjSgsV1wVfMFLZpwMsy5Rb3iadldSwz5tPmPqnVqwOMJde4kq0uaku8JXVS6wc2DT+fczuD64zQNHvQakhURz3/GgnKyZB3/KqruVUX0RaMFzLNAmS+l8DVvD8zCooqqeqsuVwk8XwOCfnhc68hqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1roug5CjisULmrLgVpHP08Kq/L2sqFO677koEUOcXh8=;
 b=PlFHy9aMVdgdEldR2jS2iP5AbV7NOhGURW4SfjWH2yQBmi3DL6MYJ1qgYch8+BtTCAMJsuxrsm5KLkvCopjZdJdeRflRd3HQ/hMIMGd6ZkJqVL4foGygNzoLbX7KmIaNxtNtrgiOBITjtawS0sfGJqcsYSztSErUDF5b5VRnEcH+LP0e5Oz3Ll17BcDCPoBPhCNJZXPxEAXD24aphAFUe//DPI0fC23Ygu0dqTkQD7PLU1gVT6ieQKa+RHotI5i1T685Q7RV4yY3iQUjjIvB2m5cSHxilErtEQh30Oio4eeexjpzM4Bt682J4YGZU8bJ1vftzPN3hTpXgHf6t7Hrcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1roug5CjisULmrLgVpHP08Kq/L2sqFO677koEUOcXh8=;
 b=nJ4k703QS2/OiHBjkn+XQig1dKaMLKTK1wKcXzDXf/oDa1UsgCn6FFEKlqMlid5x20cZkhvzqms2zV5NG6FRV6jc9PJqfSUgDSUR5LUESmAH4uqsxrRIT4UFzMPHzLa7iuDhmdk6bPxIjr5Zbbn69XSh0MSAQg4azTtdaCHrVIo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3543.eurprd04.prod.outlook.com (2603:10a6:209:6::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Tue, 1 Sep
 2020 08:45:26 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 08:45:26 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/8] usb: cdns3: gadget: using correct sg operations
Date:   Tue,  1 Sep 2020 16:44:47 +0800
Message-Id: <20200901084454.28649-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901084454.28649-1-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0226.apcprd06.prod.outlook.com (2603:1096:4:68::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 08:45:23 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a8778f1d-0e87-4b02-ed00-08d84e535f41
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB354383C3F6373739564720238B2E0@AM6PR0402MB3543.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:255;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dFcXVdbAo/9m6JXLnRuBgMUmEOP/D2v+2Hx0pURlsu81Ap0Dw0DfGYr/IVI+zpDyetVaTww1YUoHUKXsmeNRzSZvU+QKlerbZ9dvyMEzJi2orMDGnxzG5FDZDPDBJgGgTIS8BibLGyO0ELnMzJUCLl7Bw+v0S0eypDpiXthy7BB7jbJicsXqKAW+f9aS9qO4a8VHtnawV21s+03qB0a0Duz4G1H3NrWDDAU9wFcAwmYfAjDiNOdY7BSO2dib5wYVKW/5nhka/SGJn0PDIirQY2CjlsVarLwwmFy0XFVkSQ0AFY+bIqHrgcdbZqbCEo+5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(36756003)(44832011)(6916009)(478600001)(16526019)(186003)(26005)(956004)(52116002)(2616005)(6506007)(86362001)(83380400001)(4326008)(316002)(5660300002)(8936002)(66476007)(2906002)(1076003)(6486002)(66556008)(6512007)(6666004)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: e9mfHXp5ox9a8U8g3nNVg4UWYX04iXpEXSJfcaHVIJzwxJghBlGysVJuv1gBxskYE0h13+KQ+knqJm13MLDPbY69kUBvvfnNYBG8Qh7vXGkMsuZboTl0g8K40SY+sb3zur3tsdb/ilaXZpp4z6mVfTRkyhhOKd2Ka/a/138D+QD8lu1ThGvLT1upw+pFGPIyj0Wo2FCBFnc+WRcuUBWqCjovowjY0Y1XE0pbpodvUrhRZmVpvW4ZvhSYX8PL8/zKk2qJZI4AxRrdhdhuFiXMIxDX56znvJgR9/zPpiKfZOFbcgBitEYzA1GTRXZSy+B6mSe2jbvMq1R48XfgIaD8rPWnjSHV15CNjslFclZiB2LKOi7DCJrwb7PbA2od5x8WXltG2LZ23IiOEQkE2yj+7Cw9yVLknntMlZVFVJqOFdkpKrBUq7oA/qNJjy7HEc28H5395ykltVdgHulxFh0kzgyJuWQQpdFaFiIK1+uXMWqbk767r14fWjBBoH/Zsl1vd6GQG78FI0oelXqjs29n9e+4YBbvX3fNcFNL/IX+UtnCGdwy3t5E8pAQlCW1kOgxBEEb2aauXtgtPT5Tufdf5dU6SNyN+uKj039Qu1p5olwsaGejRwiAjtRzLk/1EQDA9Vx2rdfw4TXUBeWkbKG05A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8778f1d-0e87-4b02-ed00-08d84e535f41
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 08:45:26.1996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsZkdWxmiSIifNyN0IPz6BEKWwPcy/37YjHT2rjM08pUrV4aNfAbCiYPCb5sO7JhxaXsemCOForZ5ijzcdcWcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3543
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
 drivers/usb/cdns3/gadget.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 2ea4d30e1828..50282cab5fb6 100644
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
@@ -1162,22 +1164,24 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 	if (priv_dev->dev_ver <= DEV_VER_V2)
 		togle_pcs = cdns3_wa1_update_guard(priv_ep, trb);
 
+	if (sg_supported)
+		s = request->sg;
+
 	/* set incorrect Cycle Bit for first trb*/
 	control = priv_ep->pcs ? 0 : TRB_CYCLE;
-
 	do {
 		u32 length;
 		u16 td_size = 0;
 
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
@@ -1215,6 +1219,9 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
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

