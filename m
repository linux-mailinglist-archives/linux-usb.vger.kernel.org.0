Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F051DE47F
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 12:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728956AbgEVKdC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 06:33:02 -0400
Received: from mail-vi1eur05on2057.outbound.protection.outlook.com ([40.107.21.57]:6057
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728822AbgEVKdA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 May 2020 06:33:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdEmWjC428PywjN1Opc/sVOWz4sGVkbmi765KLJguJQH0EXofKI5tzILyuT6sHAi63qOYCVmIEmKjwbnSQpVBxpG3+d5YYmlJWTn0JytotRs8bf66gb1HRcQq3hgcOY6q7wy3yhCGhFeMF/3Ihzhg/Ow6BVlw4mdNLbobJosh49TFOfHCPsXIonX9Mtu+7n4hRxh5q+W6JfOhh5UsGnWgZFgTQn2vS7QJT8eMBBjfcZlvGJ8J4XskQzW9vwvZUf7g1obondZEMgfAJRSJPgobxirsWDiRN8BjBXn9WraJZubNPa8STzdRnHvHIRxNFJLGxTzP8rGON6kc3qVokZT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFQB0uOvopwrAkhXDCmpo0sPpiaxTGFnzQu+VG/GRmE=;
 b=G16YQ0u3DP017v7wCTcubzASz6o4X4dVEYkzLee5mWv8jlcfwLjWXcGyMYzauHO7hMD2vVCQp2OcY6Jc4nwp0rUHellP+GU2G8bgxU1umOth3LNHFF7f0lBDRqZBEqh+MzhDVWRB4SdgUOpxzznHEyydGV1RtB5ivgxfaixn1C+h6c6RzcilRA7wxYG91mHCAXUwKFf49GcF9ZSKx7mcBNx98egyIXye6zrVrYe3DAtezIDlIA2HsCECIMT4a1VfC9jknd629ovWtuozU5f7tBorVNYKiP6CCCPuWf/uZEWJR31ZAkHo9DDWltdbx+oZ5gPndpun2PQ2YskNHvkNyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFQB0uOvopwrAkhXDCmpo0sPpiaxTGFnzQu+VG/GRmE=;
 b=glluzVudw9h3F/wz7mHpQa8n4Cx8WuXIYZu0jgzbh9HRs6BbwCfXLU8gVWa+P+MK1vPkHg6ZhFcFDSxMtNs+yrdqbe5/Q92CrL6DDWX4qZTw24Jv3eW7Z4RaEpaBRa9B+Y4gsqPJJNc5APx/leWJOAgDfVjyCSPBx2AmQGx8ElU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6984.eurprd04.prod.outlook.com (2603:10a6:20b:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 10:32:57 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Fri, 22 May 2020
 10:32:57 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 4/8] usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
Date:   Fri, 22 May 2020 18:32:52 +0800
Message-Id: <20200522103256.16322-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522103256.16322-1-peter.chen@nxp.com>
References: <20200522103256.16322-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 10:32:54 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 33a8b879-776a-411d-7692-08d7fe3b7e56
X-MS-TrafficTypeDiagnostic: AM7PR04MB6984:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6984E22F254A022E610DF0328BB40@AM7PR04MB6984.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rGvkEmLD+LiWcRHH9s9ic4w7YuNcHx8PkI2E2hG+ZoPEDOwAO/ZDIBp+4pVGoLeSYgwCeAQvwTo0wS2sUZdEAHfIRncT3XUyITr1EQlV91hw3FRs7Ueu+hDdvG0NsgL/cXCup80sZeRNoGEio+dOuixFqTW2WbDs+ykhjf5V+2JRf8bQ4I6LoGFGfdqeOfZSaLFieJzrqZzjM6RdprPDo63+xMyfaNGTH7AW8RJPFUkAqyCz3ZGySoHmODsrVU3WO8X6hCECjDxXF+7Y9U0bRxxWtjqSdLaBh4jVobs0C3+IDFiTtYxGh6XWhHiEzgyiIZ8Ma52sViFeGgTDf5Ugm/ARptnGw3q+wyqG6xsv0wjTkQUCA4vYKs9jBHW7k7mv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(2616005)(956004)(316002)(16526019)(186003)(2906002)(6486002)(15650500001)(86362001)(52116002)(44832011)(8936002)(5660300002)(8676002)(6506007)(6512007)(4326008)(36756003)(26005)(478600001)(66946007)(66556008)(66476007)(1076003)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: CvS4g7kGYgYfDQRTCTRvB6gju1vQKEob7a7D6jZFPK97ePMsh44zYccEumz0DdK47DivJwae9Eqz6LyNOtphZqW1xhD2dxn5xWpJXGUhf0IL+ZxSNdAR2Xt5MFWIsHp+rTgMxsloSiwYsaichbfAcyJOjVHb1teGg9Ssizs4Dyrv63HaH1DcvhhTuYyGLfDmQcsf+UBRDwFYS1RNTwwmzosSuXyCiDKxvzJ9ha/FpZV8KHNDJkuMWbJtzv1n+8esPC7Qc36wtjag01aS6oXrEpMF0SXQXDIwi4+goKEueAyvg0rpQILBSHKlCpRbFbdwylivCewuUr3zrVmrJ8I35/NIR4C9aIkqMJMNNpumuNuvNu5BxOAixZiW9vNt4GyGtdwonbEUhdctq/UsiKLQpDUteSfYhgJZdJl/oB+8pVy1Mdk8hBfnkIHBiXaYKUQ0rS2A6HA1z2zVFKZLv81CCUQuNnL7l46/3OZ7SgkaF2Q=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a8b879-776a-411d-7692-08d7fe3b7e56
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 10:32:57.4735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJxhIxx6pi6o8ykPdfUGBommfUozw4bM0gv+AJ/0VqgNb9ttucwTGe4I04+aREY7Qyn90YtP66jqGkqKUNu9Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6984
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some platforms (eg cdns3) may have special sequences between
xhci_bus_suspend and xhci_suspend, add .suspend_quick for it.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 19 +++++++++++++++++++
 drivers/usb/host/xhci-plat.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index e00efd84ea1a..ca02e7f36238 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -54,6 +54,16 @@ static int xhci_priv_init_quirk(struct usb_hcd *hcd)
 	return priv->init_quirk(hcd);
 }
 
+static int xhci_priv_suspend_quirk(struct usb_hcd *hcd)
+{
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+
+	if (!priv->suspend_quirk)
+		return 0;
+
+	return priv->suspend_quirk(hcd);
+}
+
 static int xhci_priv_resume_quirk(struct usb_hcd *hcd)
 {
 	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
@@ -396,7 +406,11 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+	int ret;
 
+	ret = xhci_priv_suspend_quirk(hcd);
+	if (ret)
+		return ret;
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
 	 * to do wakeup during suspend. Since xhci_plat_suspend is currently
@@ -425,6 +439,11 @@ static int __maybe_unused xhci_plat_runtime_suspend(struct device *dev)
 {
 	struct usb_hcd  *hcd = dev_get_drvdata(dev);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	int ret;
+
+	ret = xhci_priv_suspend_quirk(hcd);
+	if (ret)
+		return ret;
 
 	return xhci_suspend(xhci, true);
 }
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 5681723fc9cd..9338a4f946d0 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -15,6 +15,7 @@ struct xhci_plat_priv {
 	unsigned long long quirks;
 	void (*plat_start)(struct usb_hcd *);
 	int (*init_quirk)(struct usb_hcd *);
+	int (*suspend_quirk)(struct usb_hcd *);
 	int (*resume_quirk)(struct usb_hcd *);
 };
 
-- 
2.17.1

