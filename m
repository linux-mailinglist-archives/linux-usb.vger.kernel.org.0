Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD7526410B
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 11:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730181AbgIJJNO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 05:13:14 -0400
Received: from mail-eopbgr130043.outbound.protection.outlook.com ([40.107.13.43]:44418
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727075AbgIJJMi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 05:12:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9N9vnTkuGXeL6TDxDlrd8T90gPEZbba2+RRkkX1I/pbMqEyOQsLA0+ymvLdU/zWOgHlMM06iiMYqUKgq48UCUT5zcKj2YajCXJ+rVyLGKFLLVEwZw91UxkK2hG0sWCT+kKjdlhUGO/Sj3nIt8bZibFfUeunPcVbbPJyMULMcKE3pAkSSaa/pLNjlWgnS5WjIzkjBuX8u6uCCnX8ynxmlQB81H4CP+Q0jLlvvLAtRliPLTsKs5jXgXJMT+GNNdzfErwQpS9olYHRBn8JDiyVggfeJAAka6iGGf9F/rIpeihUbGLW2FUxX1DW4XvHA7NL8k0kOWLB1ST11ZYO2/Ukzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kzhd1u38yKj1pgHVDsxh4YBmcOqFwJKaOu8dAmxUddE=;
 b=bcHiXs2yI9NGqBPGK0BJrNvZfjatQE/FBH1SHPUHpNZiVfSmdo1NCixLbdMB3LovbHDn4tUo7HyMYSJTn7CTN4PrqivpsitytySL4KNuG7LD39LqfWZvGYRj7WgG8ulqdrIl74mvd/VixtfbYCTcZODjW2Q2q8Qry6w18yYDRlgZT5nkjZcyeEwBqboe0nNVvIvTnAnpE3YHQvsN7NqcD+8g2qqee37oFgRL+aZ1BupI/3QNFal11/3QuF8TEhmzhepTLt7QDoB0naQbYJf5d+N0/Vhu9mksQyHbGk+/KaoBWF0P77wLWjnVa4pSg8SJy5GiL3RyHIJ0Pbe6Z5GrIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kzhd1u38yKj1pgHVDsxh4YBmcOqFwJKaOu8dAmxUddE=;
 b=lEz8yxG4Pl54abfILuQdbNwsCytVDqTDmWNlaQBrgnwiSEJC7QrZqMlM7kSYY70JijWU71H2c0ZGQ+jjmgUhcfuca4zuhHOKAkRHt0jV51pFXwfztMgb59iJ7hT55P140+LfPC3M4gYiJ+pyuRLEf6DF1xAYbaP+XL7UfnA3PrU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4168.eurprd04.prod.outlook.com (2603:10a6:209:43::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 10 Sep
 2020 09:12:22 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 09:12:22 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 3/8] usb: cdns3: gadget: calculate TDL correctly
Date:   Thu, 10 Sep 2020 17:11:25 +0800
Message-Id: <20200910091130.20937-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910091130.20937-1-peter.chen@nxp.com>
References: <20200910091130.20937-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0134.apcprd06.prod.outlook.com (2603:1096:1:1f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 09:12:19 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b1f1c657-d90f-4cb0-712e-08d85569a01d
X-MS-TrafficTypeDiagnostic: AM6PR04MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB41689A3F5C3C074BF6A651708B270@AM6PR04MB4168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SeQ103sh05be4JD4YGnVeHkV5cnV4IB4xpM+1ue5iWx3ZWWYuQ7/fQwKWugudTVM1s96RHBWebGBqgXX0rnrE83KtkHG6+iLFM7PWx9fZwOP7tBhxSDgmHi+xzmYC+5ZIy8hdIXVY43pI1T9AAAjtry7CHpL2DZRItr8R3B1Jc7CvrODatckoICjJfZLt10Sa5LK2bvytbtthm3i+sKwK3XnttLxu9KPAKtAUSpDOs/pTdZYlhdcVI+FK0F/JFG8v9kkwNn19pl5VP5EcjHbK0EQ3orGtK4zNoOAXw0bj6z83dlKh1uGf5KWOaeC5wV391Q4QCxVgQd8DRlmJoiG7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(4326008)(6512007)(83380400001)(186003)(6486002)(16526019)(36756003)(66946007)(66556008)(1076003)(8936002)(66476007)(52116002)(26005)(478600001)(44832011)(6666004)(316002)(2616005)(2906002)(8676002)(956004)(5660300002)(6916009)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: J/jGpAPGuyXFzHFznsCTH0/zehqQFoKmOwMyr7/2/dC1Wo46RqZfv0iMYexSqwGdJno2YAjBFtcpdGnpzQ4hlpf7skWilZCFe86LMok+yucW/td4qOxhJevAM7IJXS4/rzhJWeuJKsISplCsLG/98jdSzTm2oVKWyaOhmto74bz0ubM2td5k3SQRWI458i8Zu4QraaLsw9+oSEuHmMZ6ZMh3rW29R1brl2tOIknBqw+ghC4f0PvPgzUBSi/kuCv7Sm8/DM7+XErUwid46kFpCfqYCUUbjocIw3KH33fMV+bAimo8tx3dcaVVaoEba+IyFjmkMlYgcifckGGmnKoJX9P0mjMDTUGp0emRNj06cK4Hw/naaNKULaSx81CaUSWR1Ia9Dj8YzEbcapARJZtPFmbhQhfftOOw+1A2cpEQTBZXlC0i6UNC35bHHaLI+y1xwgyGG+8UonXTBZgH2topLXOfIhpbxWmuk0Zcd+dv0Q/CsIuSvZ3p6vzIGhatmkzje4xFfB0WQ4rreOUUL9j/Huc6NymU+7HjTpJZSmYCK2pF19MOMlZlfe4b8ZOZK66OXvV7HurCH+g2nbccu30ILpPKPW94Dbp3NDk8AlXdc3IaM+PQ32vXKeC42dq1lSaNh+WhG6e7NnuX3IRMTEp4vg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f1c657-d90f-4cb0-712e-08d85569a01d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 09:12:22.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0QaFyMXa33bpjq9O2eabERu03In15NWAjeq1kwKj90r7osnISBE2pQ/T0Vj+stI5S6NSbs1JanzWGXgicR2nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4168
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TDL is for TD length, so we need to calculate this value for
TD (request), but not for TRB, the TDL value is only needed
to stored at the first TRB in TD.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index d8eb5b1717f8..f1626df65255 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1101,6 +1101,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 	u16 total_tdl = 0;
 	struct scatterlist *s = NULL;
 	bool sg_supported = !!(request->num_mapped_sgs);
+	u16 td_size = 0;
 
 	if (priv_ep->type == USB_ENDPOINT_XFER_ISOC)
 		num_trb = priv_ep->interval;
@@ -1169,10 +1170,17 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 
 	/* set incorrect Cycle Bit for first trb*/
 	control = priv_ep->pcs ? 0 : TRB_CYCLE;
+	trb->length = 0;
+	if (priv_dev->dev_ver >= DEV_VER_V2) {
+		td_size = DIV_ROUND_UP(request->length, priv_ep->endpoint.maxpacket);
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
@@ -1184,20 +1192,12 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
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
@@ -1228,6 +1228,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 		priv_req->end_trb = priv_ep->enqueue;
 		cdns3_ep_inc_enq(priv_ep);
 		trb = priv_ep->trb_pool + priv_ep->enqueue;
+		trb->length = 0;
 	} while (sg_iter < num_trb);
 
 	trb = priv_req->trb;
-- 
2.17.1

