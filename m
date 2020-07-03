Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D366B213421
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgGCG1P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:27:15 -0400
Received: from mail-eopbgr150088.outbound.protection.outlook.com ([40.107.15.88]:48441
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725764AbgGCG1O (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:27:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOoXu2HHfgRiqKlXc7OCvTAbhalo7dUlUoIjDZwima6jmSS7UQnZcJ5UkidESG/mGdHYp068S+S/HWBpA58UZUipMi60kOGhvt2nWLUEIV7vg2ODzI/hsbMiQd7iJNdZ2r3YghVu51PeY73rMZRzp/i7UkFOf8CsJs9Rq6DIc2eeVvZH/8XMT7JN9MFMv5kr5x/FkfDnETDlVkS08hGZfAxK80QN22CL7HYpqggUXym39rCILiuCIyJ5ItBtex0Q2EeCXgcLI5E2fEeYCi8g0Mmk/xJnTcPSuGBqk26VxLpeFIKu2tx5z8q6vc9EPMlxsTz27pX9aGiQPpJmsasTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMQLfBPyXbpDrAKzqHD/p2xqgDbJ7+uoe7MLUV+kjNw=;
 b=XPEaC8A9YpLYB+FX1N8IFdiZ5howzf9OqwXPquT5GIKkO3hoRwmliY1qMisczK7TH2RReg8rBH2qB378/qL0vTXXpOlODu+Cjkh+U+MWURv1lik4yzG/5VQmRIaf5eAHEUPM4vGFK0PZC/t6wGH4wwV0WtCRzVENrOgp5X/bEpmrXWWP6vPpzIXoHMBxt6GAg3W+DemOfVf2+2DfPxv2NaOeRO4cvL9PIwV8pYlS4ctOdSznxkr6vqW0H3BpWhdXzbMSOyw9mCJUnwp5P0T2UChvi4N/lIUxCNLxtngHy/iUxhZ55Q9fpHFJklO7MxRNRbmCKxpJRMWIPSFh/6wz3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMQLfBPyXbpDrAKzqHD/p2xqgDbJ7+uoe7MLUV+kjNw=;
 b=Zck11C0GuJ21lga9MVMw6/I8+9zVGumu1Ybkns0UFr8srZW2sb62c53Jyevay/AE5mFTCdh3Hbfdr3IqyQ+ZWPA8GASjpIrn/165c197gdry/L8FgBgBWUFyQ2iCIxHsnPv1YVpXPx9JNc9vEKjTgASmyFSG+aI1BKJuUOcmpT8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4166.eurprd04.prod.outlook.com (2603:10a6:209:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 3 Jul
 2020 06:27:10 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 06:27:10 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 5/9] usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
Date:   Fri,  3 Jul 2020 14:26:49 +0800
Message-Id: <20200703062653.29159-6-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703062653.29159-1-peter.chen@nxp.com>
References: <20200703062653.29159-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0107.apcprd03.prod.outlook.com (2603:1096:4:7c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.12 via Frontend Transport; Fri, 3 Jul 2020 06:27:08 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d0111dc-9fc5-4e0d-462c-08d81f1a1e18
X-MS-TrafficTypeDiagnostic: AM6PR04MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4166D91DD3DBBD9731088C998B6A0@AM6PR04MB4166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YJytynxvIYbSJ0o8SpcsTA+iT1ZkYBTcNPEUL9Efp1IL0WlK+XNPuykJPVoMOw/FyTDzlKndaU0ND+4P/U+n6ZI1sGDdqUNWcraMeqMQ3vphP9Nx2IJOxZmT3d461tNyt6kfm6eTrMYmn8XY/Z10kDIp0kdelfmytcGqtinKn4cO/sO4xev/RdQ493TFta6oJD7l8W4LblRE73tnkL/Khma2EGZr3mjUAsNDxBN8f3VrhozBRTIZ7nEXK3DJI4Dh6MyVRFJp1WjOl8JccWXSj7DFY1DbNX65j8T4BFrnYXdkjmsTQzRfI2u0NlhsSrOGe1qyXFXr+xDuhivDs/nIc7e2Q9fG7u/eHeM6TmtmIfI13cUV8xSRy/ysRQRqIMY4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(52116002)(6486002)(1076003)(8676002)(5660300002)(2906002)(8936002)(86362001)(186003)(6506007)(16526019)(15650500001)(44832011)(26005)(36756003)(316002)(478600001)(66476007)(956004)(6666004)(2616005)(66946007)(83380400001)(66556008)(6512007)(4326008)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 97tn5f3EDMvtb+HhMBrK+jHxYwFzaNuQUNT1RSwx8DwpeawYR0O9cyGI+BfYnhBq++75qOYUM4RDVUQ2TEYmZGV1CrvItnSDqq3Ovd5hXIqNHB7NJVAuH/lWoaioyjceTjvzRWAxEZZ08ODd8YAc2PHOY533+B1kRwX4cM6sngd1CffseT6BpnRgIhA3/3lUYRt8m0P0FJsoTocCvw8wjM+Ow3K7fMj1YXPKtmE8BhDOwDVNu0PwFy/uXY0op9tebn9R2wO/u2f93hjw7F8kouxMjds3HIwqW8HpCqvVua1bdzc+dzzaf3mtUixMrXPPtHxZhHgBdQO82XRr2IN55MvygCnPE9D61odIoYtWrq29BUgjx39VJxr1OG3BP9X7jK5vXt3RdeVcXQkumCMsLZqkacctbzMyv/cKv+JbkBEQYl/yzPfjakRPAqwaUqdy8v82Q6O1t19RlQvirw2PX2dqzooJbej0Q4YeCdOPtbk=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0111dc-9fc5-4e0d-462c-08d81f1a1e18
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 06:27:10.8986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQZrHUtxWyPu2Xel5wCrcPBs5c+kAV2AwcUA87TY7NAZ7BqTSF08cvQKO04jaijNat93rf1ouscU8K8u38J6/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4166
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some platforms (eg cdns3) may have special sequences between
xhci_bus_suspend and xhci_suspend, add .suspend_quick for it.

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 19 +++++++++++++++++++
 drivers/usb/host/xhci-plat.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 38bea2b6a17d..51e20464fe0a 100644
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
@@ -401,7 +411,11 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
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
@@ -438,6 +452,11 @@ static int __maybe_unused xhci_plat_runtime_suspend(struct device *dev)
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
index b49f6447bd3a..1fb149d1fbce 100644
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

