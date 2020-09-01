Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF865258AA0
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 10:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgIAIp5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 04:45:57 -0400
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:53473
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726536AbgIAIp4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 04:45:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idMZ1JLtJUBFHZ7G9zj4a9y9PnVYgz6h4FLIf6C+FlYFadiHOBrEx1ixUpiGvaxCWr3EJMyXA2Cmr0NXI5nzOcyaDnhZzxLnYzoBolx+b1J3B91jRswnfyfKkxQ+XIWUx6GnS+ZESQXrlBkLcIcHixMqPLX7+/Meg9WYrWlDpuw3aKwCPB/+1yf2LXZzIIJYWpG4TX+bl6uU2r3k5sJqHoV359fK+FG8IYLdXqCvZ1YiC/5Ih3S5HlEDnMiIDv3eusPDnPluhgU8f09d+zbVTpQNeK9Y2GCkejqUziPhvnItSWq16oITDh+nACFNugw+AX0LGI8dEydp2FI93TiZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhy7UcLevaxuqwBgWHcX2TitDFw+S+hOxViz0DqG+P0=;
 b=eYzdCqrW3UlrNhZJOwanAQrvUnQJ3NXcvJFRYP4WUeDCBMZnbTx15PpYjrKhkcn0euLLNItI8yHX1dFeduHn8KRtbXQwjpLpz4AXFPjC3WjeQCkWryntRZvnLEU8Nj+fq/AaZQEBWvMccSp8PtkOIdLeNbDbJZrdEURTXPvIDl9ixVyMvtWyjW2FxvzL8nQbqikV9Pm10ZPxtwphx12Vc1mwSRQU5QesmN97Vqj0S67AXtxDVRg3v7KEEYEmAwJPTxf2aAdiruPRR/X5MLQlia9lZb4Fzwg5v8QA0rtYbNt8Sw/ZNG+VCf943TMUHsrkDRIyeg5f6KfSeW9P2jXchg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhy7UcLevaxuqwBgWHcX2TitDFw+S+hOxViz0DqG+P0=;
 b=ggv5PhUkh/RPtN2h9jrVEqykaf/ytqJ6f2FxRq9BnTjE5tTKsvkbkCXiHrjrjMGTg1PfVPZ7tfK9yIPvFRfL9w2e7QVQXpiAbX0vi5nZSmpDmEwyFmoj+3dBVpaiEu4Z8h36vPsK2WlprTqa+otwNqLjZprv/JeAGbk+p6qZ3EY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4360.eurprd04.prod.outlook.com (2603:10a6:209:50::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Tue, 1 Sep
 2020 08:45:46 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 08:45:46 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 8/8] usb: cdns3: gadget: enlarge the TRB ring length
Date:   Tue,  1 Sep 2020 16:44:54 +0800
Message-Id: <20200901084454.28649-9-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901084454.28649-1-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0226.apcprd06.prod.outlook.com (2603:1096:4:68::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 08:45:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 958b47d1-b72d-47dd-3483-08d84e536b3f
X-MS-TrafficTypeDiagnostic: AM6PR04MB4360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB43603473E69E9B90D0BF80CB8B2E0@AM6PR04MB4360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DbJMjyZYV4B4QXVGSC9kW1iq0+e2PvDgGpnzgP78hxTCqRHyRkjgp6376UQC9t4vKq1gCk8IXLuafbBYuW/lGWXS54QutMC+n3fKtausBCRkfV+JhLwhFRfb59tVWdkV/9+COijDyEDVPQR219SVhHGqW1VZrHHZtNqEQLPh5gePI3bMjD7qxjp2AoR22lM+wUODhzkXz44Mf335RHi5Kn9hNlKh5XgKhTNZ78reHWFTqrA/KcNxcz6zbfr6lwHunA4BhHHyMUgW5lXumP3yW6EccMsGLLGW42eyzo6wgHdOGZm0rErveet7UmUBpQPnlAgigUeRnnx3Mb0ohQkLymb50RwQLiM5SNEAYzmnpI4gA5O16KQcZXrbKzAcoSelkU1v3oPMh/H1loyGdVpzXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(956004)(86362001)(26005)(8676002)(8936002)(66946007)(2906002)(36756003)(1076003)(6506007)(6512007)(6916009)(2616005)(316002)(5660300002)(478600001)(4326008)(66556008)(66476007)(83380400001)(186003)(6486002)(44832011)(16526019)(4744005)(6666004)(52116002)(161623001)(147533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: VeOvBbOOys9LlnoqOzhW9w+VoUDViXTqs0Ir6bPPE7Um4ieODIC1r0QUHRN0v5ezunEvdBtgPWepA+Bhn/LYRkMP55geerk5u+PQDdrbC1JINRdsdnZQlXzAugUd69JeCSbvR7qwVtyMOUo+NGaHRAXyOpxRLQujuorop3QKky/QD2zfYd4NY0zPAOHClwonA1xqZ1TnSVMLmRxzP4IGOMVfuWPpeAaKhgN+4g0lOJHqOXC2X42ug4nFT/Dm1Z6AFS6Y04bREgANmk8vJCaRC2l5OkPMiBPJRmYN0SLySXfSfAMTpnuM++/AJyXcTx1pBCa34Wxhct9Gs3zHFYRxqmCEaXm+ik62HHSElphMNyIsM7Z2MrOXiNAcBiy0vI/E+XbAM4UJuRT17fh23h7K1UbJoLpRknT/SgvI/yvsTS+gBPcInYXk/vZn7OYBuAj7gNSZwCUns/YsG/n/WE5CMwJDONFXx/X8Ih8NQtJVRYt5bL7wLhOBDJkSkuU7LlkUL2RDvq9H7YBSWKXJnOp0s51T5aKeqj3o1kSive/eQlVioJ6VCoIVrfj0v2lApyWMQG8OD5HbgDHAm7GvkN/J/qWMr5BzTAZEhfQNHoUGuOx5c+v7slUWLOdPvskiz6uRs/i9E55tn0BoctGV2ncuZQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 958b47d1-b72d-47dd-3483-08d84e536b3f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 08:45:46.4528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aiQ61qzGqJ7EC8S6agP7hhlwqsXWqV4lSKcOGzHntx2RT4P17oysL6IrL1AVZN7bM6/6z3qAt4y9QMNaW5Ni0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4360
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

At Android ADB and MTP use case, it uses f_fs which supports scatter list,
it means one request may need several TRBs for it. Besides, TRB consumes
very fast compared to TRB has prepared for above use case, so we need to
enlarge the TRB ring length to avoid "no free TRB error".

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/gadget.h b/drivers/usb/cdns3/gadget.h
index 9f8bd452847e..1ccecd237530 100644
--- a/drivers/usb/cdns3/gadget.h
+++ b/drivers/usb/cdns3/gadget.h
@@ -966,7 +966,7 @@ struct cdns3_usb_regs {
 /*
  * USBSS-DEV DMA interface.
  */
-#define TRBS_PER_SEGMENT	40
+#define TRBS_PER_SEGMENT	600
 
 #define ISO_MAX_INTERVAL	10
 
-- 
2.17.1

