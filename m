Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A892A486D
	for <lists+linux-usb@lfdr.de>; Tue,  3 Nov 2020 15:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgKCOl1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Nov 2020 09:41:27 -0500
Received: from mail-eopbgr80072.outbound.protection.outlook.com ([40.107.8.72]:48501
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727754AbgKCOkQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Nov 2020 09:40:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTqisU0XKw/K6hnA6yXUhE4A5WFjIUf4WIRMIQgFlhkzZ6/gnsmHMBITts6Z8qJOqzffYPqJmxH+oYkHCB9fZTmIkBLOdkNbOgkxHyr0OnVYtiVDoZI0jXFRuWfk+DEN28iQNKjpHMD9i1wmEozEl4F2V0QXXnmnArf/R/IsxTh+g/hlVY2lXKRAFK/ENKklMRB7LoEgnLV3XL/yVtUVGyza9YwxCWNQPtCl8MwXLWXvbeDlhH1yd1dQJHMwfbFpqd2ykA+7WLLdhL47zbqRrcqqfAWEIqUWojGc3vyYKbNbns2RYdYT9uMTEmzHJ4+4RuEbfac48x083gfAfxWEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9xm20+yg1a850AJVhIHsOmcwtjFwnj2OY2iYDULtZI=;
 b=DexJ32y1dOqhPPfeDfMlHl1q5LekoSXqivhzsDEpwXZSROPHEz2YOqLb7tr/VBQSQ2OOB/dcpRdfP+S0kOD1/MwTzPX6p54Tg/RmD+dK4mngRlcprc1H/F9UImXH7ibH8cC4BsiKK7miMMpsYZa/hOusE/bpLc/GANfOxQ8jU8Ie5/kjDByHWPxIeK58PWtOHpuu6ORIpmiiQ/c8l9a2n39Ot4YdHyaJtmOdTICjT82Ul+zI6ABROSWVMBBX4yTpxk1mNg8MGhMUWoirn0kH93//iGDll5wCxMxVFxA75HlhGqUCLldHjHRLhngryGAJH+wjYwe529Ch8RsntOPWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9xm20+yg1a850AJVhIHsOmcwtjFwnj2OY2iYDULtZI=;
 b=dCzpdojUQwAsvngEvIFkdiG1VOq4QL7VG2GiBs23gHLbI/JAyYNhit4Lb921j9aP/9tVl8hBevqbhtUEU1nlTCvD8R4p/GSpPDEiNrtJu+YgzOD7nqsjrDk2ZQA9skb30wywarwj6qrJt71K7Pk0zl58HRbEyoXGvG8vj5aCnGg=
Authentication-Results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB4004.eurprd04.prod.outlook.com (2603:10a6:208:57::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Tue, 3 Nov
 2020 14:40:13 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 14:40:13 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/2] usb: cdns3: gadget: calculate TD_SIZE based on TD
Date:   Tue,  3 Nov 2020 22:39:29 +0800
Message-Id: <20201103143929.8257-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201103143929.8257-1-peter.chen@nxp.com>
References: <20201103143929.8257-1-peter.chen@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0141.apcprd03.prod.outlook.com
 (2603:1096:4:c8::14) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR03CA0141.apcprd03.prod.outlook.com (2603:1096:4:c8::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Tue, 3 Nov 2020 14:40:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9bf42574-6cd1-4834-22ad-08d880065f8b
X-MS-TrafficTypeDiagnostic: AM0PR04MB4004:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4004C390660E92B0B9179D378B110@AM0PR04MB4004.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2VBd1rOTpU17/nQ+ZVvqd5HBmRCxGPYu2dbeBMI6uHCxsgSkwQ3C3el2QFQ4EAh4wsApii7ixHpiGsn6H9U4g0bj6HF/fGPe3q2MAnFUUWnP9g1dtRWFjHsPO/zwaV/1OgZZghg8J/DFSssfV0XQFRj/7/zLa2JHGs09lh/t3IcwSFNlyvC+PxtmDjWj0XMnfoe2yCskwEXohvVXBAAUsk5B9wIHRmwTrdCx726rNXMj4U5zdBKfAYTPgAtEe5sy3Anfe9fIQEqGMGEusTpa1fAJh9M/ceI3IMwSIq9DJc/DeNTS1QG7y4jdBAMl8PeZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(44832011)(6666004)(6486002)(8936002)(52116002)(66476007)(66556008)(8676002)(66946007)(498600001)(5660300002)(4326008)(6512007)(2906002)(186003)(2616005)(956004)(86362001)(26005)(1076003)(16526019)(6506007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: sYCcN8KR4TmtpuCqjLSFXjf3KuwQBCjdcYX04MMsYndADZYC1jhENetTCGgumc0fBTCAIUc/vBLDMBS+EAmqrzh95U1qXG+slfdvmjlpdWPOphmRQlxxqbHVz0hPMCR4E9SSwkkPOsYxCIFeE5frIp3sx1DXeyac+0dVB0vxZNAhK5wMDrPBmGfyZYmI962yguzju2v+LjoXi3xNZalATDdIq+f6tj+mRZfyFFVilddJ0rNJfglVbcvfdi/twTHw5qjWwImyZUP5uwSvqZ5UMx3pe7WUnvs9XTXZw2Ab1EoOn0/fVGPd2IwYkTgwOz4hj5OFYQg/QI+0LHD64Az/mJli6i/r9ilxutKTPxCCeTulv5oI3r7GYe5kiJJLiIvljMcbh9zkUg6uOhD0lxkieuUjil6nMV5+U9bLALcwqhtdMgBZ7/aue9aV4UHvT00uROZ5URRl1tyG1ofSO/iu/s8Yf2NyFtdJELw7dRq/valGOBqV2ZBBTT5lcNeTU05g/efmrn5eoXnpquTFhhNhPcWnjVNZOqseWiyld4f52lo/ZtRO9LmeD8pwvCTa4p8JY8vDSC8W44YxUNMIQoBOEebAjZCwWPAtehC7dwQHD2FDHq0EL+UTbrpZw58gDQoK46KIC55//Mp1Lcg2L5wPTg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf42574-6cd1-4834-22ad-08d880065f8b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 14:40:13.5959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOYUB8oGG1sJuVeoJNr/yVd1Sy1zGbAvS8RjqiYcZJq/ctp0yDLjYQg2jsn385mY5Bz6s3VVe4jGNsYdCeD+mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4004
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The TRB entry TD_SIZE is the packet number for the TD (request) but not the
each TRB, so it only needs to be assigned for the first TRB during the TD,
and the value of it is for TD too.

Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index ec1730109fd8..c62e09ba9231 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1193,10 +1193,20 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 
 	/* set incorrect Cycle Bit for first trb*/
 	control = priv_ep->pcs ? 0 : TRB_CYCLE;
+	trb->length = 0;
+	if (priv_dev->dev_ver >= DEV_VER_V2) {
+		u16 td_size;
+
+		td_size = DIV_ROUND_UP(request->length,
+				       priv_ep->endpoint.maxpacket);
+		if (priv_dev->gadget.speed == USB_SPEED_SUPER)
+			trb->length = TRB_TDL_SS_SIZE(td_size);
+		else
+			control |= TRB_TDL_HS_SIZE(td_size);
+	}
 
 	do {
 		u32 length;
-		u16 td_size = 0;
 
 		/* fill TRB */
 		control |= TRB_TYPE(TRB_NORMAL);
@@ -1208,20 +1218,12 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
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
-- 
2.17.1

