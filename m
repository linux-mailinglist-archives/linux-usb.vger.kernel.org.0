Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E283921B9B2
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jul 2020 17:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbgGJPlE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jul 2020 11:41:04 -0400
Received: from mail-am6eur05on2041.outbound.protection.outlook.com ([40.107.22.41]:52996
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726828AbgGJPlD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Jul 2020 11:41:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JReRdhZH6UxtkCjB93k45QJY/SZ2yqmSmHGxswXcsg0yMJUyQjyQNokpDGI02Z/o0MzGECTaFnG07Y3qEKDEEN+PiG3LrTDYSo5fklZEmMeNig4wFzd37WHte/iELQZLUchy4c6IHoITeapg1oLB8JufsCYls0ulaFTnUJFuu9Czhln7qUoUpcgsRrSRqX50DiGyh9HhMqx+fRFew9NcLx1T+FogZwkUNeNlXnSmUr/kACqAQMcD8MCk7EkOM43ehXPu5AnX4+ewcfIOMF9WA9a7yHAIotn9In8sViF5fRURkwLOYkV9OzMHow36ZcBoCgYrpLvpKiBHR29Y45C6TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwfXjFBXsRVgCCWk7Q7vHN51C8RvHtxp3bXTF20LjkY=;
 b=UsrN4FbWHhRaOmW3jX2QlKfDg/09EUZXWYFCcWIAABu57PO9XMisyVCvpdRr8b+Fn66NXn3HRKfKrTPMXXFy5Y2vD2cbeccvZMwsSUW0ZlNy6HQgBNRdYAt6vDy/j5zi56KwBJgDmUxc+5RtH5Oyev7lmmGB/P6EVdEXUQJq2W53MPLoqoj7u/Aqx03AoxWENDEu/hoDeWMg1qZF8FP1gcQMGN78C1cpgBc+hfNOlfetrYdGSQiZ2+ZanrEIyq8v5W1I0xTwP0LbqYx7osrm88rOWhqXtHLYp8npWxYFfmYNvJHwpFzeym3d0hEuWmYzACQ3YceOlk044375IqZCtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwfXjFBXsRVgCCWk7Q7vHN51C8RvHtxp3bXTF20LjkY=;
 b=gIBU/mlKepOsdBfUlBROZ3CPqzRfGhzBRJGVoamii434iXeDdCPP6EsXdV6NRuxNVmkXtjrvI5Qyb/7gAukf3tWm16v81dI78s8UNGWZ6UuOKZIJ6wbEBXGrGBhsrXv0DrPkKhh9yD89Yp5vzneiICm+ebFr+P/YpIuXSK2sG30=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0401MB2398.eurprd04.prod.outlook.com (2603:10a6:800:2a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 10 Jul
 2020 15:41:00 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3174.022; Fri, 10 Jul 2020
 15:41:00 +0000
From:   Li Jun <jun.li@nxp.com>
To:     mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, baolu.lu@linux.intel.com,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: host: xhci: fix ep context print mismatch in debugfs
Date:   Fri, 10 Jul 2020 23:09:45 +0800
Message-Id: <1594393785-15182-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0601CA0022.apcprd06.prod.outlook.com (2603:1096:3::32)
 To VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b47624-OptiPlex-7040.ap.freescale.net (119.31.174.71) by SG2PR0601CA0022.apcprd06.prod.outlook.com (2603:1096:3::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3174.21 via Frontend Transport; Fri, 10 Jul 2020 15:40:58 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07e0dc87-d9e9-48b9-483c-08d824e7a530
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2398:
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2398E29DCD066A49E6A2A92289650@VI1PR0401MB2398.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8oWvNC5+yGP4vTx6od9Au399kMGIKO7bfVInnpTPgb3TB2VzovrnnONW30J1RuLAm0ty5B6jfL6Elva7u+CPCmZJAdhWjOgMYHyjNrd9DDWgTDcVH3qrffgYbcwRSBIJ+nyk8Yb/CU8OuqmpNsX2tzMLjx1iNWMQZ0Z4xtOmI3fRfsjwG/d4g9XRE0m49RG2uybZfAO5W6O/r6UW54hjPiwYUYy4nCCBTo57mXoQoaBD2ZP3aIy4+u8qkNN1DzYYYDFGBC6YZQwTM3WVYozRAOfinvqxWWBDbyh2SpwweJJH3iIloSYgVJ0Fk88le6/d+/tRXfoi9VFDQ/s2SGIzcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(6666004)(66946007)(478600001)(6506007)(8936002)(6486002)(66556008)(66476007)(4326008)(86362001)(83380400001)(52116002)(8676002)(316002)(186003)(16526019)(5660300002)(4744005)(2616005)(956004)(6512007)(26005)(6916009)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: JIYs7R9IjAtkVggIxUPP58ZRKYHnsO0Dl1cRKwZ7G+p273DnRbXP2xxJpmSlxuWW/23gF3y4IDaZ0Nq8LeaP7BYvpSE8FdaVBFo+fmxrl54G0EJ+MELXrr0C5GODr0A70Gp3Od06iIEoXip02hKXxybiy0EPSMo8osZfTpc6ZTkFJe9R0KrRxLpaTsYQBEVzWQpOeCrbR6qD3Ra+vPLdjfJKSaU8qKnW9ZAxhFYgc+seV/8UIN/C2i2t9FCzEB5Mob9j3UZGO/80bPYxpLhrOzUIFubNF8GheUIJZhAH9bfL7by72/lbUwGkeiNmV1SXvGQdwkKpZKcDhgnqWkwwsGHFOLCzNDtJIdBE+QzXGso50MmzdXWKGPeMHAvFCd8P3imyXxJ8jNCScZGK5BV8fb7GdqkZjQ2g5nEVhD1T25AJ9006Fuye9D6ymtonRCbX2MKEs3mLotKL7OFzc+c5hqQLeavaYL9TYnzMKbJRsso=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e0dc87-d9e9-48b9-483c-08d824e7a530
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 15:41:00.4203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaSwBLDi9ovdN2k04n1AJJvoCjDRceZgcfK6dj0MERjwuLyPLCZNfyCjh1y5mG4i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2398
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dci is 0 based and xhci_get_ep_ctx() will do ep index increment to get
the ep context.

Fixes: 02b6fdc2a153 ("usb: xhci: Add debugfs interface for xHCI driver")
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/host/xhci-debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 76c3f29..65d8de4 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -282,9 +282,9 @@ static int xhci_endpoint_context_show(struct seq_file *s, void *unused)
 
 	xhci = hcd_to_xhci(bus_to_hcd(dev->udev->bus));
 
-	for (dci = 1; dci < 32; dci++) {
+	for (dci = 0; dci < 31; dci++) {
 		ep_ctx = xhci_get_ep_ctx(xhci, dev->out_ctx, dci);
-		dma = dev->out_ctx->dma + dci * CTX_SIZE(xhci->hcc_params);
+		dma = dev->out_ctx->dma + (dci + 1) * CTX_SIZE(xhci->hcc_params);
 		seq_printf(s, "%pad: %s\n", &dma,
 			   xhci_decode_ep_context(le32_to_cpu(ep_ctx->ep_info),
 						  le32_to_cpu(ep_ctx->ep_info2),
-- 
2.7.4

