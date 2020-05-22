Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5402B1DE481
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 12:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbgEVKdI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 06:33:08 -0400
Received: from mail-vi1eur05on2077.outbound.protection.outlook.com ([40.107.21.77]:22662
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728362AbgEVKdH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 May 2020 06:33:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZROki5I3ddgDLMDhxbd+EZWYskTMR8f7NdXUG9K9cMADc9eXYDw4ZjueZpq46cfDW30oafdR5BNT6yS+O7wYQoGbB6X3gK15m8iQ7otoH4TsJ7XTvz+YsuOmmYmXk7JfhMt7hODHtk4LBFGvAWgIN8tgi6+j1xqeJZAM96oo4XogbA/OnftGoj7hpRN6avN0kE4JLwEDmj/6inlunlllALHN1Vga76tFKIlKNeRIoybqos+3noov8tZgvnUURcPxOr5DQNfGDN8UnzZ90eGmt7jhlYL5uJTVW5bLPhb3njm/yf/jF4L4Y+QePaNVZPBu3WQeFjtitJRviVbRn2tb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFc2zv0nLF2LMvjg973n077bmgO6MpzTt9Gk2uJotQA=;
 b=PZBvixOTErZH1RJphR/QzB/8ZvuUvZRFAjPSxNammJrWaqQjlhY+HCYr+s/nIXARj7jqQYIcO7wQ2DbH1lPsPWMhLyIUKMDrsyeE0bOyQgoDslOj0zKnOr/niqY3Nxm0hXI2Gu95EIDnP+M6klCm0gKQ3qxA4ohr02wsCYAnDNWFj2u1aXvs1xrmDVzJ+bQInAYr/pR+J6Sqyo2/XE2W83lCy4W7zXCYTQQW/AQF20PdlK0ouD9PPOBD4J7/EIH10SaLx5IiOR0Z58mdOJf63pwixwGhV6BDPySSpbhha6UElK1x7oaivPVNmMRUMMzEnAFE7m6We+90JSnmm6vueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFc2zv0nLF2LMvjg973n077bmgO6MpzTt9Gk2uJotQA=;
 b=WvxcbxtrxZjpWZdjJR8D5ul/LzDZy3rnhhAuCVHaUrEOmHMmM1o2r2fuCh6++bG7Y75nV4DU8ZlALLVlHxwD3rK9MMXYeSJ7DD6gpfEV8cPwEwCPY9gDXwpWECi8gCD7SlUk0HxRGTagDwtyFtZFfmD795uGEby3Fde02HvQjmo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6984.eurprd04.prod.outlook.com (2603:10a6:20b:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 10:33:03 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Fri, 22 May 2020
 10:33:03 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 6/8] usb: host: xhci-plat: add priv flag for skip_phy_initialization
Date:   Fri, 22 May 2020 18:32:54 +0800
Message-Id: <20200522103256.16322-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522103256.16322-1-peter.chen@nxp.com>
References: <20200522103256.16322-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 10:33:01 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f6e53b07-98a6-43f3-55f3-08d7fe3b822c
X-MS-TrafficTypeDiagnostic: AM7PR04MB6984:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB69849023467331E563C018368BB40@AM7PR04MB6984.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SCECt8auMhb/u8liTXrSJq6EPDqMAFWVNJdMDFiOxlOZOhSTOuG0e1xYBq7T3IlNu3zUiLpaqBIqCgnPsg7ZP5DehKVBWlP5ct4mPZzF4TRiyQLu8ta05++Q6F6H4eFjquJ5iGP0tIr98YqUqZbbXGctjfws38KjaM+Wm7ZH5SV4b2DFYPA4o0Ry6/t3uSM1ddxOkSQjwmdDf/ARLMyWtF0TJ/0bn/YFoFf9vGzy5Y8908ogEFNQNsF7a+HiO03Kt8v/FxrqzDLIdd7+kMlFZGqh6GpVzxvmWjuaX0rd/QgVU0ZAEKKL8dS0V0w/USef67/3c8k8qdiYNAVPgUntUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(2616005)(956004)(316002)(16526019)(186003)(2906002)(6486002)(86362001)(52116002)(44832011)(8936002)(5660300002)(6666004)(8676002)(6506007)(6512007)(4326008)(36756003)(26005)(478600001)(66946007)(66556008)(66476007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: BeelpMu1lD6aFvcCygge+Ec6xnw57gNZwv0o5qEDBVinVt8fc05/3ppBOP9/YGXFS5Pcs9Oquzcwr+QvEAnQOkJWQXaUw4DQajwhjAm34A1yVDPj3iK/nUC1m/SbMNNMeDyz9yJWSohpZCjdxOC5H80/1EI0ReAcMzhhhi+8RXep6kEzKqyYKqH+0QNyXHndqCBcgVFrt9ZDBy+kwf9hlvBp+dQLl3t6v3+kb4W0pR2qCPimqzrm0lhxgaaP5zI7EuNk4O83fyQirI2gBu6U7BNalsnqRdzCsAIhfxKzPNoGE6WoaSAobh08bZQObADVrFfq6KjY0QBADbBCd/sRVDa4X/RzGUeszjebDzodG6hQQDjkFKGRKyYMzH9VRqk7aGBk5KjX++5WpGhu1Zy7S/dCVly+pMfp4ZuXrCf+dUR3knZ+VfSw4j0TkNPciXtPttCbe2nsLKtcIih6u7IZoetmPepYS72n+5Dsh44xzAg=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e53b07-98a6-43f3-55f3-08d7fe3b822c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 10:33:03.8864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bictITf6bEa/zuLTVfCTJt0t7ECKb8Vwc8YIttzB8Kk0bSUCag6k/U8gYZazBGernNNcZKD/13IV7PRi8TezMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6984
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some DRD controllers (eg, dwc3 & cdns3) have PHY management at
their own driver to cover both device and host mode, so add one
priv flag for such users to skip PHY management from HCD core.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 8 ++++++--
 drivers/usb/host/xhci-plat.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index a45c7ec33ed6..f653b717c098 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -173,6 +173,8 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	struct usb_hcd		*hcd;
 	int			ret;
 	int			irq;
+	struct xhci_plat_priv	*priv = NULL;
+
 
 	if (usb_disabled())
 		return -ENODEV;
@@ -271,8 +273,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		priv_match = dev_get_platdata(&pdev->dev);
 
 	if (priv_match) {
-		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
-
+		priv = hcd_to_xhci_priv(hcd);
 		/* Just copy data for now */
 		*priv = *priv_match;
 	}
@@ -324,6 +325,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 
 	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
 	xhci->shared_hcd->tpl_support = hcd->tpl_support;
+	if (priv && priv->skip_phy_initialization)
+		hcd->skip_phy_initialization = 1;
+
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto disable_usb_phy;
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 9338a4f946d0..d78e86e14f59 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -13,6 +13,7 @@
 struct xhci_plat_priv {
 	const char *firmware_name;
 	unsigned long long quirks;
+	unsigned int skip_phy_initialization:1;
 	void (*plat_start)(struct usb_hcd *);
 	int (*init_quirk)(struct usb_hcd *);
 	int (*suspend_quirk)(struct usb_hcd *);
-- 
2.17.1

