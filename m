Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCED2258A9B
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 10:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgIAIpj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 04:45:39 -0400
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:53473
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726204AbgIAIpi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 04:45:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjFhv/YPMVMBDXaJ2BviMiYysmMlnELCD+LZUJPfInGx8mvikzBwPu9+clYlKldIxNSQ39sYbHfeFfweUbwFisPjgtXcIvvzkH0lPJtVQfAhJJKu6MYNuZHK2E6RdR/8ia0iIhS6gl/zaqF/21LPniqH5mgdXjKfEjvZv758HzX47J5pYQ38CMQGh19hWalkiHI7XYCxJjfgoT/nfuoBc5uBtP7sHLjGZlTg4Lo0wYgN6EHS+3PVGD7BzgZtpmMnIMKQk/rUMOdZGvLvqxauPmYv2wDkn4aVF6rf7tdOwQqFBtpIC7Va6AKSOkQUiU9Pxo1uD0EZ9OhlCrgAgbpZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6O9t0kUQq8Q4cKspPaKLNAHdXfkLa+kxGjfJVaK3PE=;
 b=X191Zv+20VOTtMUi8bOHuf9rehzAAq+Xb1XxBSMMH0iBT62fJ3yII52NTeXRZiFxCYwBf/px7blYssrpxfd4rNlzYPjmgpggwWxErt6O3n5SF9bCWysUsszNg/M9Apq50DPmV/P9MAeZWT8fZ5w4B66IIySzEv7CgVLOXl53JLN2syYt9/FgQd5+cIpPXRiodG5uOkj7ByJZf3DA8fOFVdjknOwocUmHwhH+6BpYskN2UKTbX4qRGfENethVUdH4aavzVHfgMLDr0tumw4adRd9cpO8AmkFcp29RSgDNQaKpVs1pFjLLA6tFAN/4UB02icHeyNNIeZK/wbAh4qtaAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6O9t0kUQq8Q4cKspPaKLNAHdXfkLa+kxGjfJVaK3PE=;
 b=TIKpID3+YVCuruGqhDViaEZlbVtF+64VjADwdpT2feAbTODunB2QN9GFaseh5OWq8vC9QvulAso5sGumwHHdZYv7bWcMX/kwpmHCsBSEEGEon2R3nmMES2huUD0z8N22jkHN0fwif1W9BHXUrb5XHvUmBeA8y/jJTZfqqWs3x7w=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4360.eurprd04.prod.outlook.com (2603:10a6:209:50::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Tue, 1 Sep
 2020 08:45:33 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 08:45:31 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 3/8] usb: cdns3: gadget: calculate TDL correctly
Date:   Tue,  1 Sep 2020 16:44:49 +0800
Message-Id: <20200901084454.28649-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901084454.28649-1-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0226.apcprd06.prod.outlook.com (2603:1096:4:68::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 08:45:29 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0f32fa08-a42f-4cc9-ace4-08d84e53628f
X-MS-TrafficTypeDiagnostic: AM6PR04MB4360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4360B50C526466EC88AECA4A8B2E0@AM6PR04MB4360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0GVcr3W5nsPvNT+MxsQ7cnLmCnf7AZeaOPd0ICaw+qx/ERZe79VYhrN3r/FN2wIZZ5Kxi9GxJlzuNjiWqPYqJa/yVEPH7yT+F0OBWyCYBPqY58id2OI2HdJolYZUt3d8qIGtWWLRoeKUYmjHxkFYAXhAsjwQjZX1xiFWT2c1vwDUh15f5lcZZZtVR1hzdn00u63sDzZmT1+JpjGPr+Ng+DcAF956/91ePKp5CbbTei2WMO62hgBxUTygzD2/sWjw6Br1DUK4WJ90VrQkAornN4Gpgil8oN1nUYH//COQwj9Z9asRWPIaFvIZRej5YFk524bHLs3kOQTZELZKE72PfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(956004)(86362001)(26005)(8676002)(8936002)(66946007)(2906002)(36756003)(1076003)(6506007)(6512007)(6916009)(2616005)(316002)(5660300002)(478600001)(4326008)(66556008)(66476007)(83380400001)(186003)(6486002)(44832011)(16526019)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kGKoTBzpim0V960siaMJroMzGSXO+GyLRyQjf7cikhMyAa4Eu69j533CMwf905LaFTadVZYKfwZpV+onY+iiRTKtdwe0KWjCqvddX/kvAt287YFt8PGeptE8kUv1F6A12LOt6JdSPyvGl/EdxMfZ1rsNsCf4zPc6xxoPLJdTcC+jV/gcnyKnHtxLgVAQcwUbHRBii+XHPMg0Gb0s91Olme0jtoMESfU1WJKDTc9JhpC+rfy1y+DSq6KlCs3ncIMEkJVFwWptcvDMkR5SZF2vP+YkJPn/2ZtvzkvwU1WjCA7gvgjQKJgYfw2txdJd2K0sJ72dLYWjtpiRlsm9/muUXzbE15n3WoF8dDqOb99hRTQFNDu95FMZsAPhxNtD8dZsd/kumzaUpcJxrfpsHJK+KyTRWOvcgEo09DN2O3+AvAXXHX/LnYPRvHQa7JsT0R0War9I4OajXKaw72cQlRes7ikHUwFxpX8Cw7UfjOo8iM8YRCj04eHers4ODWpu/4iW2763EiQdhnfkElFMT3dz4sx1oYAFXlhnrEWqCA2qr8nAG5dtz3OoidgQl3/7B/Kpae6A5/OaxZMXhSvd1IVfsqfuri0d3n0oQkln83ROmyrzpM9St5oX80oiHENgu1CvW3T4Rz9YROeuS5Nxuq6r8g==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f32fa08-a42f-4cc9-ace4-08d84e53628f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 08:45:31.7910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frmt97nGwXZobU+2Qvl6VIJ7CUC1X34+GRXWVyab4JAWJ6R9SF6UOFh8G7kct0CDQiB5lHmwcXS2QqYqNJ9BLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4360
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TDL is for TD length, so we need to calculate this value for
TD (request), but not for TRB, the TDL value is only needed
to stored at the first TRB in TD.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index f68c30b808dc..25e3ff1cdf61 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1100,6 +1100,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 	u16 total_tdl = 0;
 	struct scatterlist *s = NULL;
 	bool sg_supported = !!(request->num_mapped_sgs);
+	u16 td_size = 0;
 
 	if (priv_ep->type == USB_ENDPOINT_XFER_ISOC)
 		num_trb = priv_ep->interval;
@@ -1168,9 +1169,19 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 
 	/* set incorrect Cycle Bit for first trb*/
 	control = priv_ep->pcs ? 0 : TRB_CYCLE;
+	trb->length = 0;
+	if (priv_dev->dev_ver >= DEV_VER_V2) {
+		td_size = DIV_ROUND_UP(request->length,
+				       priv_ep->endpoint.maxpacket);
+
+		if (priv_dev->gadget.speed == USB_SPEED_SUPER)
+			trb->length = TRB_TDL_SS_SIZE(td_size);
+		else
+			control |= TRB_TDL_HS_SIZE(td_size);
+	}
+
 	do {
 		u32 length;
-		u16 td_size = 0;
 
 		/* fill TRB */
 		control |= TRB_TYPE(TRB_NORMAL);
@@ -1182,20 +1193,12 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 			length = request->length;
 		}
 
-		if (likely(priv_dev->dev_ver >= DEV_VER_V2))
-			td_size = DIV_ROUND_UP(length,
-					       priv_ep->endpoint.maxpacket);
-		else if (priv_ep->flags & EP_TDLCHK_EN)
+		if (priv_ep->flags & EP_TDLCHK_EN)
 			total_tdl += DIV_ROUND_UP(length,
 					       priv_ep->endpoint.maxpacket);
 
-		trb->length = cpu_to_le32(TRB_BURST_LEN(priv_ep->trb_burst_size) |
+		trb->length |= cpu_to_le32(TRB_BURST_LEN(priv_ep->trb_burst_size) |
 					TRB_LEN(length));
-		if (priv_dev->gadget.speed == USB_SPEED_SUPER)
-			trb->length |= cpu_to_le32(TRB_TDL_SS_SIZE(td_size));
-		else
-			control |= TRB_TDL_HS_SIZE(td_size);
-
 		pcs = priv_ep->pcs ? TRB_CYCLE : 0;
 
 		/*
@@ -1226,6 +1229,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 		priv_req->end_trb = priv_ep->enqueue;
 		cdns3_ep_inc_enq(priv_ep);
 		trb = priv_ep->trb_pool + priv_ep->enqueue;
+		trb->length = 0;
 	} while (sg_iter < num_trb);
 
 	trb = priv_req->trb;
-- 
2.17.1

