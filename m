Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092091DFBBB
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 01:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388160AbgEWXXZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 19:23:25 -0400
Received: from mail-eopbgr00066.outbound.protection.outlook.com ([40.107.0.66]:23517
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388047AbgEWXXY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 May 2020 19:23:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XysI6klXpqbigkVh6HZujCv8+Twjs0UPzDPgK1XafOEt3dCqWrgcgTpgtt1II6IiI9Ewq7RZm3y/DM+VPWOGDGhqCMcJs604B5gS8WKnZT8qV/uqmF0NU30A+ZS17KRltf1xe0x/mORV6P1lqs2s6pMb0DDL+YuwX83cMBIeUnCMNsjMwpWuFUZvtKpIv3JcUOhPf0qMo8LDdWcoekaFDJJObs5Y/mUyYdNBBeP/q/dZPPRdeX+K6jCZ+tid682GZLPQqsa+8VZBqAcnr8nzp+u7H9QyTYKu+WI7HYgIJf4GmjM8DNDIug9+VHIHDeLlDT2S4rCnHEUkk5O2/VauEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcEVbLG6zordQYs4WJVrxEQTtS9H5+8QbEWPdQxlkl4=;
 b=QVeyv7yK5/3G4ADO32xsPqfzXLN4TvhxcK+qGImhIltnveKLRngFWDjon/EuCjuE9w6JDZHWVagInLBqYzpfk37NBPgb1FEWp7w3uUbjnDDYXSe6qG4JrnKlXeefEZqpJ3dY0JPq9yv0+HpS8FIhBFpingBoJ5amacVMpkFZxdCIJR86n4srLQxVOMN+YQNSI3paLzBPPvu4QfsQ+47GPxCDAY/8cnvbGnc+tFg3jBKpg02ax3skiAthG4kkt/am+i0gpFJKapH+WHdw8aTkRLJbMqhM3KEDq/zJ9TfuYAG7DC6zsRxbZY6WV3h+T3LQpVVpVYzgvbOal9NqLIhjRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcEVbLG6zordQYs4WJVrxEQTtS9H5+8QbEWPdQxlkl4=;
 b=pGAvlxTnmNZyMA6C43PRRanjmfeSoDTWks0inKIPd0gjpkGS4WJoOB8erMAQIAEhZ/Xtr7krTkqBysvlczAORbxc0nKTT0yfLN+qisn/kw+9trq1fAP9XJZDGGb8hNfAnEdfWBvMSLXVTxPz42QQ4VQajwtdkcwZlw5totMgsk0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6918.eurprd04.prod.outlook.com (2603:10a6:20b:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Sat, 23 May
 2020 23:23:13 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Sat, 23 May 2020
 23:23:13 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 7/9] usb: host: xhci-plat: add priv flag for skip_phy_initialization
Date:   Sun, 24 May 2020 07:23:02 +0800
Message-Id: <20200523232304.23976-8-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200523232304.23976-1-peter.chen@nxp.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Sat, 23 May 2020 23:23:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 201bc19e-48c2-4fcb-89eb-08d7ff704392
X-MS-TrafficTypeDiagnostic: AM7PR04MB6918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6918518E2EBBD8D2F99D92528BB50@AM7PR04MB6918.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0412A98A59
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t9J8i8TVTPyz/3Ot1doA7OpPLVhwfTenD1ok5P0WXFo9W6cOdWKxuEqwQQqzYAiNpx94R/pARZmVkIM1kjF5Aru7AadPT1LbY38pLPPgsIPMvKBTw+CRJMlcovyksrX9qpTP+d9tmqX8Xytt91b+vX56wFhxpFFopoEA5PVSRiW8DAfhCv2zWyGogAhqSEHq1J1mCaJK6G7pU6T+INLzF9Y3K8pWtfG86sYz8GEMbw71nbkNnL+/94NiZiDV3EHv6wM0oXzhQPFFwszj9Po1n4dI0JlZ/F/mFUR84pbDMjdUdzijVXMmrMaqZTCLH0dz3DnUTjsGbztaDHN97Xa+bQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(8936002)(2616005)(2906002)(44832011)(186003)(6506007)(8676002)(6486002)(316002)(478600001)(66556008)(36756003)(16526019)(6512007)(52116002)(956004)(66476007)(86362001)(26005)(5660300002)(1076003)(4326008)(66946007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: n05wFMnq0nricUaIhGi/Jenp/F74U+XzYYOJw9x0If1ZimdZ7pZiN5t34vLOQdJ6GcmknoyOGE1z0xD+wGJ7D2eQFBSQQzG1ut0O4mGpeaK3SWvMxW1Ul2k9eED2DD4ifceyc4B9clLdGSYe3UB/uSLjvyeREAjNvDPd7CYxvaLxvBmDbf637z0bdQKNjsiC8A03cnskVjlRryIfyU15iJO6ULpBd/kPdFvUhUdlyyxzLiSRJ6crLYc+QSz1r6pg7Pmw9isD0L1kdbjZGbiytGGB+zeo7XREAmVVnB6uqrsomlKUBpugX8QOyVpdN/MyHI8gG+nI5KJbzrPB4jt0vhWCqRNMoRC5hP2x4u9LgnZsQ7mr53IxK2dEyNowAkTEgYyM8AA+PXMzlJHhUHIA6HHKzUdTFYnuOobUivcTUxAUNYv0XwqC8y4S5YBq72Gj3LQlCbFMuRx4whhK5/tXa4q6uZ8xXwW6UsKd+OEX0eQ=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201bc19e-48c2-4fcb-89eb-08d7ff704392
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2020 23:23:13.2944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7zg0n026DLIG8UxKXMMLGXQFIho0riCW6WvlpaJ8wK6KKd2Z0NWWnDABt1mHukaNAjl/jdU0/UWFnh1AuULwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918
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
index 03d6bbe51919..a3d6cb464186 100644
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
+	if (priv && priv->skip_phy_initialization)
+		hcd->skip_phy_initialization = 1;
+
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto disable_usb_phy;
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 1fb149d1fbce..8825e8eb28d6 100644
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

