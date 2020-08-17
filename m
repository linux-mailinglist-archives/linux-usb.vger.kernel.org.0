Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD8A2463AE
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 11:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgHQJqm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 05:46:42 -0400
Received: from mail-am6eur05on2075.outbound.protection.outlook.com ([40.107.22.75]:62688
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726631AbgHQJqk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 05:46:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnKJDqgIboKlYpJxHwtEYYbVd9Y9XnZTRlZol0lYE84moUDQnwPmDJ5B956XfNdGpxkjSZq5oFzdtRtcqBGXxnkNjjv7mRcd263rL2Qns0Ah30WmfKIS2PwhUOVXGTMmxYsHUFDtFHTPPB4IPyRDOHa3frhOxXUwvJXr/AeBv0fXADrwKSjTJ1+Y0FNBHF8XE5fc8vIVd/y1cD4w6fhOHJtIcxVuhQgCXjqk8JT0RLH7vEpp0vWnesDrl/ufeo/QCw2F8ELo9IsLI+k+1/xyG5vHsN1t86AGwVMG0OIDhajQefopaYJPYgAMz4lLuSJGTNrEC38uEyrp54OHfLnzIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUQGhqU2QSjGJfTEsJ50YEPIEd+emQGe7ZzPcZUwZrk=;
 b=P4Xdj6dMlHgiMLK+X4cH+Jof4UmuERiL7xD7DEN9qJCGRUHrBZHvwM1no93qSan6HE2aHPIuhBjLq9EjEYFlckyTqX/om2YekchPwl93yigLwxJJyrdocqQBcuaa5xHyPXXnQuOgwoC58pGwFKdCF2jvq61v6iYU0UuQGQlY7Hn93CD4js68taxDFeZ31K5j4hvNNoqGKWEpdTirGaRXM3PvfmrI5En2ej6DrzVmGVHnADI1N/KDbV+38ENk3dO8AXhXrbbcadeaUEsNlmAD8asD4JlePyNhjLOxbl7LhL09N7HBNnQr2bN3P24gpykHjXEZEvK+HszSVnI7j5ibWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUQGhqU2QSjGJfTEsJ50YEPIEd+emQGe7ZzPcZUwZrk=;
 b=SLVkvOscWfgNjCRXqmJrdJ7HKL6EFuNzZA2Vr50+w/YSr2inEFJKFofvRkgDexkTlVHCXatrEEIH2liYG2uDLU2kNEXTNj+8ufgIgNNgX9b0M1TvQtzBMUNmKCyR14lwagSQw3xA8itZG4UBOjZmsyRlDAlDl0L+Wyl+21eIYYo=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.26; Mon, 17 Aug
 2020 09:45:59 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3283.028; Mon, 17 Aug 2020
 09:45:59 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 4/7] usb: host: xhci-plat: add priv quirk for skip PHY initialization
Date:   Mon, 17 Aug 2020 17:44:37 +0800
Message-Id: <20200817094440.23202-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817094440.23202-1-peter.chen@nxp.com>
References: <20200817094440.23202-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0094.apcprd02.prod.outlook.com (2603:1096:4:90::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Mon, 17 Aug 2020 09:45:58 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 26e77bb9-6d64-4f59-20e8-08d8429258de
X-MS-TrafficTypeDiagnostic: AM7PR04MB7160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB71608C09FBFC6E28C3C36C468B5F0@AM7PR04MB7160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ojoYUNeXY4wZOpRvquFq5ZXpPksaC8RtRb8jsLRWnHv0Wq1MgbqgbjjKPsVQtjv7D4BCtnJyy0yclUFlg3EBBcrHrMyIRG37PqzVFnO3M9qUPraKhlnQpunC85NLdLYkS2HVTT955YET2HiOl/NO1DNbcUtWsyDBwT3Qd3A9fjI71TCcufB3QEljG1KSvvbJuYVP37SUi66Q3gZj++oQWw8vOLnU9Vx9LqR/cC82EYEgKHG1wcORVLGu+8yzU9Gx1LQvQ0Dc7nycFpe8sEAlBBG//dG8Npoth9sUtnQtyWIQswmRMwwhOSDhD3mePItrPXVLvBoM0WsULVX2VOmYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(6506007)(6666004)(4326008)(66946007)(1076003)(2906002)(16526019)(5660300002)(66476007)(52116002)(6512007)(6486002)(66556008)(26005)(186003)(478600001)(83380400001)(8676002)(2616005)(8936002)(956004)(44832011)(316002)(6916009)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: bfVf3jal6qvy0eQ4r2PfeV/EPC7SXZUGKMQv9xfSIXHLpzzeAOFHN7cI8sXWbp2wcME9J6d7vWIWAR0GqiVulmZgBCfde5TX3/pAq7xlb1IkUmvM0J7VAlZdq1f1j3tG1q5H+nXdvW0VX4D7Kr9oxc26MZn1UGOzr+eq+yaN/x/Fh6utDLWWiRtmmkpxMgAuTVSLXH7QAq4Fhj7H5ia3MpetQVmZroj9aaIzftFf+SfUvY2l+wKJ1diLQ2I2iiQPu5Dtu3rfJBT2mKC/++uFPu4q4M+sT9FUC+ZS5IhGXoXnBC+8pku6+Mu1d2l9e3+R1K1qmw5gKBwjPb4OlrVoG4vAkSIye8Pf+6PFrhfEBOcHlO0+TT04qmgVeZ7hzjkbVtv/LsJhbPJ00ZRrWCY5g2J9Ao19sAO4T8QQ/707p8q7uJ8Dorh0wMW7iONGngPA5iTmOf+6m/+pwJkREmLCC1Pz+ODZaLPORyMd8NFao9JCSlVmaNjsftP4cAEPBuCIpGCn/nEy8/ZRC8267z9Hxj+/Ge6fevBa+/++LC1m5bgAJ7dEqOXmI1LtDjwQIQ/vLZkObacK4lc71dpKCVqaghuU4Rxv2tUxHqXlcrupsn1Z9XF3Bc/6SUjwdbEVzKsOn9LlLM0EZVgz7TaSN13v/Q==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e77bb9-6d64-4f59-20e8-08d8429258de
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2020 09:45:59.8746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FK23efdOMPqZJzlumdPNo/RoB6ep96IjSKBYkEx+k2VlbuE/2Wzr4HifqsN9PlhYoimq/qNaIQFPEnOmdDjZJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
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

