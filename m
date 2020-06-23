Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399232047D3
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 05:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731596AbgFWDJ5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 23:09:57 -0400
Received: from mail-eopbgr20075.outbound.protection.outlook.com ([40.107.2.75]:36334
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731364AbgFWDJ5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jun 2020 23:09:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P30Uaxol4ATfn3rQdqcxwolWaEONd4+diAzQBcKisE7NeF2B/tll5QLOiLqxcLQ0VSnPdV/rVFaklQmgB7chY7Y3WP6y2u/QsSAncmCGFlOQpOiVYu/UJBfrqea5YSCES6OG9UOIVs8TlMu2WNKqb/H3kbnoW3HQhI7tg+O6QLaphUtJCx8ZFTlkO7mHt7L+vfCFMLbp0CDB/4XrToqC7NJWduSwSzTR5M5w4b91FSY6uiyUKM66OqEuxpQT/0xG4k+4zoKJsX4G8GUt4K5VlxchP7h2j/BOz9TkVUX/M7WTwSOnDUMjlSX+3LZbC/LSI7Sc4+ElONXrLNHSIv/LnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2dBEkO4v7+LmtIU3/KEGWtNzWpYV6FN968gI2hHul8=;
 b=XtK4sWO+ff2gebuWfqdfS5C0BkvvVx+NMwERd5TCYaOScaZXU1XweeKGDRoDUORen1U+55zCHGCZOVP0zFD4YVhVRbNXnIp9cDuu8363kAPYdf1xF8pq6a55UDucvv8mmk1wXiUPp5OCC21j2POFNP89zvEVKIeiRGGPe0BUOQZitYv1UNBhvlZlqjFwEC/wKJOdj6WXPdpXuqbxZcq4BnIrB5iAOSq/06aOLEa9eodDockPL6fyaH07tlCYoPKBKiDOfjTlvxVJcs9xVZi6BP/9zrSniO5oLMwN8ZgBNVP3D+C6zVXRiPdbLbc5M4JuHtTFY+Ibly7YZkT1MNcHpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2dBEkO4v7+LmtIU3/KEGWtNzWpYV6FN968gI2hHul8=;
 b=p9HquatY73M6gX9esSsU/x58MIz/0eNtKRTrXAmqFFpXFDD0dQcjab/l8oLw4nPOrPABFwPzjk4nDnr3DfCdrTg/mxWwnCvYbmk5MmK28M/PloWuyZNa9om4HWwNenRvFlZnRKU7BBi9u6SAniIzqpKpJW/3YbgrVAIoTx9bB8A=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6854.eurprd04.prod.outlook.com (2603:10a6:20b:10c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 03:09:54 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 03:09:54 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/3] usb: cdns3: ep0: delete the duplicate code
Date:   Tue, 23 Jun 2020 11:09:59 +0800
Message-Id: <20200623031001.8469-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623031001.8469-1-peter.chen@nxp.com>
References: <20200623031001.8469-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0015.apcprd04.prod.outlook.com
 (2603:1096:3:1::25) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR0401CA0015.apcprd04.prod.outlook.com (2603:1096:3:1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Tue, 23 Jun 2020 03:09:51 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c34cf1be-4302-4326-b75a-08d81722e685
X-MS-TrafficTypeDiagnostic: AM7PR04MB6854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB68540012FE0301F140E2B6B68B940@AM7PR04MB6854.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iSN00qggVSkQZrnso2uNjjw7Aphj2j8XA/DD6f80Ssb/FCeyp0X/FCv3Uf4G17pY2p72o2hEQJHDlCr6V6a3AnhmEtU0BAN2Lal8k1ie0m/j/Hcuj06J4ObNhheE7USRRZRpCrtBi0xaj+RYEXljbSNEF4s7RC2XhyC7cmwSW+IJ2Bsum8j8KAoEtrw9G8tcIHmvwi2YIchxAi3b+vl7R6ooPovhuvnrsJvZYIxkvwPGnDF5fkPYgIhezs15jVQniUcZk/c3y8W/TPold0A73RV42lOqwBbguK9FC+yCxjLsK6RGKrh+1voqzbtFUUJLGCc+HLD/lb5CFQLaQ0HBmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(6512007)(1076003)(4744005)(316002)(2906002)(66476007)(66556008)(66946007)(6486002)(44832011)(956004)(5660300002)(2616005)(478600001)(26005)(16526019)(186003)(6506007)(8936002)(8676002)(52116002)(4326008)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: XWvLXcgfHmqWZN2WTTdidyTjYxQMsLRcvp+QMhrXBVaTYpPx8SU8PaL/HoLikkFOSIVtqvLD2x/CrbT/f8HZIyabI8o0oS6lHLuj8qgNcEw6EfZR7KCDR/oAK6u+wVNYUvAvyM+rQD7eGiQSC2TDYGEtgAhY2KEEOgfphOjSJ2WBSEKQ9XRIAykO2sX5wGoXZ8Lf+Mlx2dgKv+GieH6bEYr15T3M6PHBTRoTYf2VWS0LXds5y/XWD6pCzNUQNBGL6QxRkQEUGFl3NYVuwDClz27YJ2orcGwVszxWpvl44yA90iSZVhC+mC0CBme4WrmyLcOcTJ8OTS6OpY5543GzSfKbfi+03krqIUhgRLScIGkpsYQkFSp+OX6mtqdVyd/9C4+lXbZzUlnVLoY407KjG8wVYGqGE3t90PEEJlhWDTumHI1AXK75JuEkurT4CdweA9DtWp9ryJhf8sPeIqcznSrGYENCxO57Nb9nQzaYB7YTpz5gzynOTJOQhVRYx53A
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c34cf1be-4302-4326-b75a-08d81722e685
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 03:09:53.9582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bT4iWOrVNd+G0LdDNQxwrFOhDe2C1rwqofaRVivThSBM9jjtrXTX/f7M6V1RVMBphh/xj3RkotC+7JoJY9FbsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6854
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The value '0' is duplicated with USB_DIR_OUT

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/ep0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
index 5aa69980e7ff..a2b9af5a80cc 100644
--- a/drivers/usb/cdns3/ep0.c
+++ b/drivers/usb/cdns3/ep0.c
@@ -610,7 +610,7 @@ static bool cdns3_check_new_setup(struct cdns3_device *priv_dev)
 {
 	u32 ep_sts_reg;
 
-	cdns3_select_ep(priv_dev, 0 | USB_DIR_OUT);
+	cdns3_select_ep(priv_dev, USB_DIR_OUT);
 	ep_sts_reg = readl(&priv_dev->regs->ep_sts);
 
 	return !!(ep_sts_reg & (EP_STS_SETUP | EP_STS_STPWAIT));
-- 
2.17.1

