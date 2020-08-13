Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E85952432E2
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 05:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbgHMDiz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 23:38:55 -0400
Received: from mail-vi1eur05on2040.outbound.protection.outlook.com ([40.107.21.40]:46849
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726576AbgHMDiz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 23:38:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdiez2d0kDFzYnHTIZtO/v9p/Zedj/5dsskEF3EBg1KWxtPgxW0s0EVJnYyjknrpILyP7O1MP6GAn5oarWIdI29XFgouVNYt+Yfz/A5aYRawqsyC5wAPpZNn5DMJEcLbiB5U2qzvnP9Gy1IRoKYTgHrI3Cg5A7WK2IZ/wBLoM7wPMbmyYDZoGyP7YQIx30V/qYfErNyQq1PzkjTLkXNRHiUOgfTxBNwfOoxWumC3hgCn/d5ALBlZVUgCwXUrO+RpXPtEZ3h7Oasqo8l64idxyIiT36ADG4608nRHVgS5jjF+afLCtvlrEJocGZeiel2Ko+7R3RoHg89C0mjmIBBK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUQGhqU2QSjGJfTEsJ50YEPIEd+emQGe7ZzPcZUwZrk=;
 b=UzN3FI8omZ6SdxdsQjYnZ0fbWQr0YGpE1uBR12nCJT2sHkzejBALtLkSoR1aMxSehHE1pK5stapHTw4iKwT8LyUxfK3ct0Eskhrdb90oTcB9E0JWNrStCkErussc450lqotdvoGkJqQIUZqjfaevdkKDc0VXlOuyQUTvQFWjLfZZ3MVnCSfOHXO0VmdovhLXTkuA3tk6jcC5aUw2SZc43pYT6M2CjJB+W0aCiiVxboVmd/nSnYe7wCX/wtzhWQ8AxNpqpHJE8Z1u88lE6DGkguOhiMM9ETiZyD/hVNqVUeixFTE5AMjUsaBBCIq95kp99qC8WAAlISTdazGmw9VcuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUQGhqU2QSjGJfTEsJ50YEPIEd+emQGe7ZzPcZUwZrk=;
 b=RR8YSBjGNoo1KVaztSwDa82yWcLb9GCNgsyiLvGdKHfyP/BNlz1dddXcZBurXiWJOSk0KFes4SJ3+56Ae67uuCbaNOKLPSOjf1vysM16lVWIDixWeRi/IPdeC+VWd8ujqtO6rAQ1gKaUAU9nnVCsUDBXfGkqqGYm/l9tQvDCM0U=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3654.eurprd04.prod.outlook.com (2603:10a6:209:21::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 13 Aug
 2020 03:38:51 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 03:38:51 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [RESEND PATCH 4/7] usb: host: xhci-plat: add priv quirk for skip PHY initialization
Date:   Thu, 13 Aug 2020 11:37:38 +0800
Message-Id: <20200813033741.13982-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813033741.13982-1-peter.chen@nxp.com>
References: <20200813033741.13982-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 03:38:49 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a5806590-303d-44f3-25e8-08d83f3a6567
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3654AE9E85C85F44F81F23CC8B430@AM6PR0402MB3654.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(6506007)(478600001)(316002)(26005)(6666004)(36756003)(6486002)(86362001)(186003)(6512007)(2906002)(66946007)(6916009)(66476007)(66556008)(4326008)(5660300002)(956004)(2616005)(16526019)(8936002)(8676002)(52116002)(1076003)(44832011)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5806590-303d-44f3-25e8-08d83f3a6567
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 03:38:51.6529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eg3l7sHQteGMRy6ISvK0ixCVuMHGw+rbWbodoEZ2gq8s9vOgGkKKgYeL3Z7f3x8AsxkPyFrKez3ChxLjuhewag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3654
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some DRD controllers (eg, dwc3 & cdns3) have PHY management at
their own driver to cover both device and host mode, so add one
priv quirk for such users to skip PHY management from HCD core.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 8 ++++++--
 drivers/usb/host/xhci.h      | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 07ca000a0084..14ff65a387e8 100644
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
index ea1754f185a2..7658abdfca28 100644
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

