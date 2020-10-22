Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 230AF2955DA
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 02:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894509AbgJVAzv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 20:55:51 -0400
Received: from mail-eopbgr140040.outbound.protection.outlook.com ([40.107.14.40]:38030
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2894507AbgJVAzv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 20:55:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1R7Q4k4KykH+xMcA5QI0uIKTegSCJEpqn+ateVb3WMaOVFEBXCQ/c8XavPKyFY+qlnRYBeMg4UdQC1tpIJxpOJwF1e7IS0p+Kim2RsRhW8RURVEKr3OKP5LH86uJdKWOl/Z+GCLr1GQ27OXSsJpQ2zea40hpxqskTIQj9eVNTokxJevxC02JA7Gm2jRwb/p/WkF/HKfH3wtEPGoNB1gfQThAuTgzyxsy/FqINp78PoO6rtosCnwRlEhdcZK8dfnT/OhBCqWnaiaiT30AVhjOFKmq8BeCQKkkra0nT7+u7tzDmB6OgxZssJs4422GYWZOECuO7F/DFsFAG5kLXpW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7c5HR8HrM5+fxmEUM/dMcKRr94cLeohRWQzk4Rt9BQ=;
 b=F+VjxsjkXiUDj7IR/kKwOqqrk7zILcy9xN7Pwxfo32Sjv9rSl9uykrA0zUdJ0H6TB/+C7kJyMFsZM+T/mrUAnCgliB2O4ZJ2gcpb4NaC2xFv2K6LQ1yV1M15rF+MZaOAUKqAvLKvxGEys2JGXD7nEZR6sU7U7IqCp9kPRQ7hZSAJ+l/zd/if0gQGqOFOc0bkNiMwU1aKznBvx3Orub/68NivYFXIyhKJXokB32rVjjfZi/B7O15ZNz7ivWGpXxOm+eHOprJCt5WisMZlBzkXc99B0+L0ftznk2ycchEmvynUSse94406Che5iWTG2s44bmjOBSEiVtHufgXWz5yrXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7c5HR8HrM5+fxmEUM/dMcKRr94cLeohRWQzk4Rt9BQ=;
 b=jwf/Z4HNLF0Fp+Zz3/NnG7Pxie4ZyobdRO42VhycoKdDZfY9d2JTWsbK79rF8vMrPJ+2Dvt1uVlfgjt30ZBqFWOMKKt0Sd2UzXPlwdQSj5HgHeH308x+scEUpdoxavRuugCUAEit+uZYhAEBr7MvgKjvOYeJbFgCwCn3wI6Le4k=
Authentication-Results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB4355.eurprd04.prod.outlook.com (2603:10a6:208:5a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 00:55:47 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 00:55:47 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 1/3] usb: cdns3: gadget: suspicious implicit sign extension
Date:   Thu, 22 Oct 2020 08:55:03 +0800
Message-Id: <20201022005505.24167-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201022005505.24167-1-peter.chen@nxp.com>
References: <20201022005505.24167-1-peter.chen@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 00:55:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 523d89ee-dd4e-4688-0474-08d8762536a8
X-MS-TrafficTypeDiagnostic: AM0PR04MB4355:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB435539173F07C257ABCC85B98B1D0@AM0PR04MB4355.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sUsvT2Zbd+1H/Szh3S1Nsc+bkEMsi2QTun/DDCBiGqwFrMFiMMFyuqRGpprEkANn/VK3Vo3XmGCWQalOBMF5T6XW2m35pzUhxwNIi0bx1mGJuCApbIBPHT4I6EwnW9/nD+NrepiwylGaQqglSex1L8bQNfqxHYfmx1bto1OhaZCbaFfFabjImKgGTy+atkHNFmcpgNOjeZ9jbbUN/3+k5ztweC3VvfuBHLxnOgkSYjHeYYnE8kJ5JtBusRR1VRR5viRCGt8S4Pj/Vr3gHuaJp9YJV6dZNHhatTKsdtHZ1bs9KPjOIrtBteZkJkMcjAOJksj4O48oALp0qBW9mx4Kwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(86362001)(956004)(8936002)(6486002)(2906002)(66946007)(6666004)(66476007)(66556008)(5660300002)(1076003)(36756003)(316002)(6512007)(44832011)(2616005)(16526019)(26005)(478600001)(8676002)(52116002)(83380400001)(186003)(6506007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 8k6gFfySE6UBSYiHEva9gyx0KYBVueHQPR5v3ztE4jbOSUq8jaDAZk9Z8H0866tMdZTMLBY7QY5dx5eeCrDKn6DBq5ZX84NUGYmsjaCxgnNP/tq4qIVmFUMHLQqSPeuJxF1kiScuFzYF8igDtUKoERrTVrEa6QLUTM5EauT0Ly50QAZraZgln68Nt/GjQzdjiioE5XkuieBB4TblXn60daJ8J9q7g9QFjkJzzLfvCMSnoMvOpUh+YjavN3amT5jqE0zbIa5oMYFgpikq3SASmEu6YSnh/mXA/BWst2hrkbAlik9emp9x5f72bBC4fEgbNt6M60+UWzW2vc/naqrt29rZNGSoU633tbFOuSZ/7nUL5VXSujiaRY1tZQ+AukoYnaTN5PRWJ2Re2pBsASI0ZoME6n332yrEwTBxBDub+J+R3D01STCRata1oT2G6DmuERYiF6cY+c8HgOSig/AbGV8GYzCnoAqsrVOs/hM31nAA0+ypAegMMLvdsEWtMXlQF2xnbHxvxOdD9SnVUpGZ+wYaXdh9GdSdP4axUdrwTLPC/XElliq3dhbM//ro0B5Bz36q0tG1NYlKXkCFUqU4Shc7ahLLb8Txn5Ayc3N+QGXJfMIwwJz5tVkeoNlpOFD2WvXWYuQTupIGHt6o3f5kUg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 523d89ee-dd4e-4688-0474-08d8762536a8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 00:55:47.8541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3C+THhtQTSgZ2D9K8ys+2HnPZ1yLyxtpjRM6KFfxDO9kd2Kug/273wfK6iAz/DcETbk29NzLXdvZTzBXXQ4xPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4355
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The code:
trb->length = cpu_to_le32(TRB_BURST_LEN(priv_ep->trb_burst_size)
	       	| TRB_LEN(length));

TRB_BURST_LEN(priv_ep->trb_burst_size) may be overflow for int 32 if
priv_ep->trb_burst_size is equal or larger than 0x80;

Below is the Coverity warning:
sign_extension: Suspicious implicit sign extension: priv_ep->trb_burst_size
with type u8 (8 bits, unsigned) is promoted in priv_ep->trb_burst_size << 24
to type int (32 bits, signed), then sign-extended to type unsigned long
(64 bits, unsigned). If priv_ep->trb_burst_size << 24 is greater than 0x7FFFFFFF,
the upper bits of the result will all be 1.

To fix it, it needs to add an explicit cast to unsigned int type for ((p) << 24).

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v2:
- Move position of explicit cast to unsigned int before ((p) << 24) [Patch 1/3]

 drivers/usb/cdns3/gadget.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/gadget.h b/drivers/usb/cdns3/gadget.h
index 1ccecd237530..737377913788 100644
--- a/drivers/usb/cdns3/gadget.h
+++ b/drivers/usb/cdns3/gadget.h
@@ -1072,7 +1072,7 @@ struct cdns3_trb {
 #define TRB_TDL_SS_SIZE_GET(p)	(((p) & GENMASK(23, 17)) >> 17)
 
 /* transfer_len bitmasks - bits 31:24 */
-#define TRB_BURST_LEN(p)	(((p) << 24) & GENMASK(31, 24))
+#define TRB_BURST_LEN(p)	((unsigned int)((p) << 24) & GENMASK(31, 24))
 #define TRB_BURST_LEN_GET(p)	(((p) & GENMASK(31, 24)) >> 24)
 
 /* Data buffer pointer bitmasks*/
-- 
2.17.1

