Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08CA0213423
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgGCG1U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:27:20 -0400
Received: from mail-eopbgr150052.outbound.protection.outlook.com ([40.107.15.52]:62390
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725764AbgGCG1U (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:27:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wo7dK/fE/A3/kmGvfaKO9TN/w8Rzn7ZizwFE2V2I/xNT0m1uCV682p27FCxAGKJNZguBmomf8/9UOd8E+lII5OY2NwM2kbGO2cB8gLz9DOSX9/ZtJ8sS+OTpr9L7cwdSldCwgbTpJHUcasnYld+V1xxLjXItEBN5B2NxfBVyVT+RJESjDrmGCnZvTrFCXCkA/906/6yt4P1Hzi95GkCoJSEOlXDRB/M0D7k3xxMqzpj7V+OA5wkaZhN/+ivnbSGamQBNU2ggOt/Qp5ME850oyoSCltTQtIc3dVG/r1dFzRYomC1eUa4HSXEyUv7HkDiLrWzv9/o6BpbUy7k75avpiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhqiqvdaFCt1c+T6UW3GBMwC2+QBPcfHNhVRZlPTY3M=;
 b=G2VnbNYY60bBzFgDuYmQIxAOS7YQ0ShXdiAtZpNsSCY6rGTVBM8Kf9qFPaWBdkSuKx2XzjXJp2RMGoqq5ynlKQ+rhaG/7INVeA/9YBxiDpm2PQ/Q+wPpaiSrwuUv0MhOT9txVTcnXlvYKEt7J74uH+9Y5kQfbwpP5A5qbJbZNDwAKX+C3dWQjZyuFwm76nCQ8AKC+HDe5a/oG0+eqkHIp/L0sIUc2klHXGgfZA89Yzy2QZznzIVlih2QOGTGvmAdx1LfqXsCay7FguVBfv4OESn8MfeCKy48s96D5pbo+T/S+5nCXHzonKXuLhTaSBLRrHf9qG3hYU71/FGKAizZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhqiqvdaFCt1c+T6UW3GBMwC2+QBPcfHNhVRZlPTY3M=;
 b=gUVkYGhqu2t71VkqzkhYETGXFs5P+7ZYRBS5uv+9Oq+CXKrVc0hO0Y0e6CXPQ9ME7vv0y/4RVybzAA4WoboUQkusU3FQHNPdFDL9jOhYpEcIfwPgfqmYC4oEMBoSbOXLsR32UR1ysBKZfEfCKDmZ+lbi3WNCRPbjbQZlKYyrKy0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4166.eurprd04.prod.outlook.com (2603:10a6:209:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 3 Jul
 2020 06:27:17 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 06:27:17 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 7/9] usb: host: xhci-plat: add priv quirk for skip PHY initialization
Date:   Fri,  3 Jul 2020 14:26:51 +0800
Message-Id: <20200703062653.29159-8-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703062653.29159-1-peter.chen@nxp.com>
References: <20200703062653.29159-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0107.apcprd03.prod.outlook.com (2603:1096:4:7c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.12 via Frontend Transport; Fri, 3 Jul 2020 06:27:14 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 09cbd118-f9dd-4d1a-fa09-08d81f1a21c9
X-MS-TrafficTypeDiagnostic: AM6PR04MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB41660B9BC807E7684F41DFF08B6A0@AM6PR04MB4166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5y8fXwWmmQdv0IE6/5MzsCPQUioVurAHoL7HjUpGHop7DDpYfAkrt4YCxbL7VoPfdTgJRQnD+Hd6IUGcy6/tQJiHZtw0WyWleTy5vu5BK601S7ZJFAWpNfjOgxDYOMcaqAWblQxvUIUGLOmwwcLY2toQL9BemBe/64jciPWkQcSIDvwP2UpRGdcOCbzhhvfz7n0gNl1h0NQ1H+HVwHvsrNfbFhESzgV4OhLMsHPq387SBAdAJX5QEWQ4ERUXru02KtS266My0CQbIanE5mA7KlSw/8V+leNvSVm2BVfWiDbCRiHozNztijqiLiNyDG0o3vdzkFY5/y3L4kuJC+MGzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(52116002)(6486002)(1076003)(8676002)(5660300002)(2906002)(8936002)(86362001)(186003)(6506007)(16526019)(44832011)(26005)(36756003)(316002)(478600001)(66476007)(956004)(6666004)(2616005)(66946007)(83380400001)(66556008)(6512007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: vNGt+DkOVvZmoOnaGZcVKYJHsM9PB3RIMe8VmVMx3Z8kff8PD0WnyT0SBLDyKKx04gtXemI/Nm7eqh8LxjCi3b6SYV+z/xDPWVdv6O/2C1VEKD4r+E9uHGgIVBEVZg2LpMC7b4+KnD3MtmIeHb4+q2s/BwVPBl7Sqpy8FAr7Ab1j2V4W1RinbAtTO9e38oNw67nGDZfLFFbrTHlqklW5EU5acFaMNZvXcPiZAil7JRsGuMh+GjqaNtN18hQiBZ+qRf+BmJ2UNfQacL1TZzzhth7XWAN3IX1k3C1e+VwWGU1gIRb3pLFaUV8TpJYqS4FlbS4O1Fk3B2Q3BNyoP6Rw5xnlA7UtsVjOTnkHKyN7E4uDAAgIUalKt1oRtUdqMMbvdNWPEIs/e48KfF9VuNsTL86oluJpc07OK+kmkL9wobtRdWrx2IWbRgkP3+X0Dd5T5eqw3IbmQUcMgrD2qBUK2QX0oghI5Gh4wV6pnL1LoHk=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09cbd118-f9dd-4d1a-fa09-08d81f1a21c9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 06:27:17.1551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhcwA3YBWoNs80JbESEtHTi62sQPg5boSjbJ2RUD85kMHYM5q9Uyk7wI6Lc241VSD5DGWckAeEgJvOrnV5YM/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4166
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some DRD controllers (eg, dwc3 & cdns3) have PHY management at
their own driver to cover both device and host mode, so add one
priv quirk for such users to skip PHY management from HCD core.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 8 ++++++--
 drivers/usb/host/xhci.h      | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 03d6bbe51919..cebe24ec80a5 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -183,6 +183,8 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	struct usb_hcd		*hcd;
 	int			ret;
 	int			irq;
+	struct xhci_plat_priv	*priv = NULL;
+
 
 	if (usb_disabled())
 		return -ENODEV;
@@ -280,8 +282,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		priv_match = dev_get_platdata(&pdev->dev);
 
 	if (priv_match) {
-		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
-
+		priv = hcd_to_xhci_priv(hcd);
 		/* Just copy data for now */
 		*priv = *priv_match;
 	}
@@ -329,6 +330,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 
 	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
 	xhci->shared_hcd->tpl_support = hcd->tpl_support;
+	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
+		hcd->skip_phy_initialization = 1;
+
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto disable_usb_phy;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c295e8a7f5ae..07d71fec18d5 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1874,6 +1874,7 @@ struct xhci_hcd {
 #define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
 #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
 #define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
+#define XHCI_SKIP_PHY_INIT	BIT_ULL(37)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.17.1

