Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C68172167C6
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 09:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgGGHuK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 03:50:10 -0400
Received: from mail-eopbgr60089.outbound.protection.outlook.com ([40.107.6.89]:56576
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728381AbgGGHuK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 03:50:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Va48UUooVRsV9jwcPonzoRuQdFlFcL3SvQP/4V/YpyEb1M/zNnoU1l9OXw17aQgD9eXSPZ0Zmcat3/J5SJ9Zz06WjSbyS5Jpp/6mfgIbyKcIv+6hgqifKJMuwrz/qQat45jvpeWE6Puwyya1MY0ECBGjnpzsmPib3IsspesFn0Uvrzly4EH+edQSuRGSl78IHEaXE3ml3ImK5Hytrp3OG90uZjClM11nMrWjd8dZmpFxOGyUzIFLz/Kl2s5GJ6Y9mr55E177IRd/P8FByfv+qhmo1D+gRlTVKmA2elW6K6/SeFXAjzLoF6st71FFyQgALFS6JYvwnEiMYvtK+fo/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhqiqvdaFCt1c+T6UW3GBMwC2+QBPcfHNhVRZlPTY3M=;
 b=gZP/+Y094+bVqmKBYUZlMuOksAhjPOjgRKlQ64WlGM3lGd2Pq0vb9CLBAVDYqiQyvkxkcICnMYPiEZpabxCvR2KqLQxQvYnUC0IMJwm2GP+BdDLDV7+vQmQCpf2WPJ8/vNx1xSoVIRE6o7noWMCkFNnxJaKjhkNNrpysrEz/fyBHZePWSvhonYsPyq3CRAAycFC1O22dcdP3FgiCwDJ40WgY8cxq3PMLlc1WTJkE94dMrkQX7zYnCcAfs0JApyxIq5S+PDP9Ey0zuePVjvbnVx5i9DK2nteIafUu3i/f8F1wDF8ti46tZWNpjpjuSdWNjJP2rG3CMLE9Fs9CUl9S4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhqiqvdaFCt1c+T6UW3GBMwC2+QBPcfHNhVRZlPTY3M=;
 b=pbuVlrLa3ZgsySvYio3ZcH73a39ZuQnydl0g/gOjO07mDFchWveXVFHSibDK//vfevnl1WytMP7P3fpLsxumRGuZHr7eTHbLLP18fUI+7+qm8NWjXcxY6W6kGECPBkCVconUzmFEZbacXveeUFvglNnDwCI3p9ZB3Ddvj16vECI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5608.eurprd04.prod.outlook.com (2603:10a6:20b:a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Tue, 7 Jul
 2020 07:50:07 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 07:50:07 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 7/9] usb: host: xhci-plat: add priv quirk for skip PHY initialization
Date:   Tue,  7 Jul 2020 15:49:39 +0800
Message-Id: <20200707074941.28078-8-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707074941.28078-1-peter.chen@nxp.com>
References: <20200707074941.28078-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:3:17::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0022.apcprd02.prod.outlook.com (2603:1096:3:17::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend Transport; Tue, 7 Jul 2020 07:50:04 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 52987de5-ee97-43a4-3238-08d8224a5daa
X-MS-TrafficTypeDiagnostic: AM6PR04MB5608:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5608426379FCF9B37148A44F8B660@AM6PR04MB5608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1dtJnANnTCWHyNylfpT5y74EHYldnTw+kqhrmn5ycE9PYe/AuF2GW0/87hJZlJ62srXhcte7waOXbuSxNCUfEuhMoJYSQBpEDUOE7tUeFnZwqWLQ9YbaBfmFgoYHm8ETx5Y5gSp39spM/GzsdPvuKiMgl7B+fZMMBbPT42YPHZ23Z7QxaljMhHWpbnXkb5qSRVFGtpAjCMnivwn821SHCCF60V/1uB+UZBAU9UT9JzXkfm8GXNvGvAbP3xlPPSD15dDrF1VDYhIzLwUhEBgLXNK8yGGKe5DEodTti55J176EKMTsja19gll3GptuUIxwlD5HjuAoNJyoEqZlHDenUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(1076003)(6512007)(2906002)(8676002)(478600001)(16526019)(6486002)(186003)(26005)(52116002)(4326008)(6666004)(6506007)(83380400001)(8936002)(44832011)(5660300002)(36756003)(66556008)(86362001)(66476007)(956004)(2616005)(316002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: pR7U1JXyTz75DsZ2FvC6NI9qEPz451EBIHH/Qb5TD0vhxnR7ncvMTcgS983DSBkdj361Ht9qgzMrFpi0zKQ6cYEe2lSEyt/mFP+y19yguwuJDKSJRe/h3EldIfadiD4eCrrL8XAcMQ4v6pkNhWALSEnLFqqBV56Ij+g8SOg8GVZS67ekrNoAeuj9Yvy7833ASqcvcO5NZmvOowMp3trtRM9is0sYmX0FZuX5QIjMHMG6tHnyCD3QS1x4A4YWk0l5ieDU3FcMaH2kIJHQU1Qu+HhK7tgrdNmJ7laqreFVKP2Y4ZgH1ggGYt7ZHRFQeV750rIDfde0DnQ83CQYf0mtzU5+7HMv5bNL6rb62XPQnt1Rc8HcSHnvi6ttYwgNgAvwanx2/84kYfj/x0UXx3Ty7g9DBB5yT5HpC91BOmETIJw6IvTI5/PUF8ZUt1Blf7H5wghz5/AV/8CfC+rI+Lfywe3gseNfWtQQMsdfLAKhwnc+gRs+HL/VEkUOd8zYSaVe
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52987de5-ee97-43a4-3238-08d8224a5daa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 07:50:06.9385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XL0Pzp+ZiGc3UMTKtyMItl1HYlMYC4tHh5/uVcezQPTPjlMJHaUQ6H+qnmgrmc+AuDy2Ftu8IQ3XDIGStCZAcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5608
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

