Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 527911DFBB8
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 01:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388140AbgEWXXT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 19:23:19 -0400
Received: from mail-eopbgr00066.outbound.protection.outlook.com ([40.107.0.66]:23517
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388047AbgEWXXS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 May 2020 19:23:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKip/8N7wXFWhezUzgz6bBybL0bSfoDzbSEpYDcQ1FGz/rXz3SvaTv9ux6yX5NFs7B+pqFOT/Mvdxg4MGNrtzfV0hU7OXxhAWD1+bgmXE9XexbHRnmegacVIA9Zc3/lwdbOYUg9qGab4AFcObLLBkenZHpAQWfJkNCIvkeixjI63RITECFtwdEhPd1R34M7iGohZIOoH+6SOAnKEXX4+l7mRdnbogk5fFvqvbn1va9ovMk7BAN/Qut4XUt6MfGVKlBaxJ024saMEog1SXUu+CLefb509HbSXQ4CxhcfV4w+hD2PYpupRZ/HNYVU5wXetoY5Ndrn6ykW5tSzeerzJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zYPHqZggGbZCeqQx7aK4CzhnlnQJPLSxIkcwYP5TVA=;
 b=Rx4OdEeP7gVZGsU0szOIliKA7DlN93VSbP+gjUj8pf7ctya3SnlMazg7e6DBSRuMRCWNxbebllt5tupWAya0A+Q7j1XiB57QOkcBc530ZSyqldByl0Yhei293TFhy7lsWZZzLfJOGoEo7LntgMCRgfVrTFVYsf/U2CbHnaq2sYdGSyesx/VxyP0Du5bcF6yLpfXRLkH/ld1Kf5U1X10piPpF0UYOJcHr1QdIqymqopl4BCPpgVFs7/WCI83C+yUVO0VL3Axy8wIIhzC9dz6zWpSz8eEwqCdo5/6kZhoNH2fb0xWIi/pUxiQ389kUVzgVCJo67HTWsDQvTsTtu4487Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zYPHqZggGbZCeqQx7aK4CzhnlnQJPLSxIkcwYP5TVA=;
 b=mo22g+PzOCbCE4of3ekB6ogzTmDlIrUuz/3UdtOPWutBrSSU3qKKdcxf/+Xi6ECm8mWHCE6a9DFEE7ECPezZlqKJPi6whqPuo7hx/vXstfrQSfCG5wSBMc25V1BIbuBWS/M3+8WO70LrwbSO4nCGFW7kO3keiDKXo5sXQSy7Qz0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6918.eurprd04.prod.outlook.com (2603:10a6:20b:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Sat, 23 May
 2020 23:23:07 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Sat, 23 May 2020
 23:23:07 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 5/9] usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
Date:   Sun, 24 May 2020 07:23:00 +0800
Message-Id: <20200523232304.23976-6-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200523232304.23976-1-peter.chen@nxp.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Sat, 23 May 2020 23:23:04 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4a5d906d-5396-418f-2e2f-08d7ff703fee
X-MS-TrafficTypeDiagnostic: AM7PR04MB6918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB69189A710C81631870D4BFA88BB50@AM7PR04MB6918.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 0412A98A59
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SLHUelwsAnP31UQe2v3Sqv1uY6CZNbuRgCM6XfPGb0CdHszKwMEMfE2QFWEbBpU0E8adGtECDUz7/T7FASlCsK2AYYBuUidKk68d1mGG8avkEQ57K0D1xk0qOWkdkhkQwtt9r76obTOnhOjdfyZIfFS3D8Zbw4iLwvboW6hoN93PCABJGkpTIH2WV6ahGhMX7QPW8vxYIEruvk4bKeEQCyRfgTkZrSgj4sC8R5y6iMr1Ga3rug9qGdY1myfZb67kgmg9acwuaHa05DH6b9H9xbkewaTQu8JRvEPOeFicAhJ/iLBgNUzOh1DTY5zeKdoOU0CLc7CsWhuzLjcbQMw1NjgQCOCfTJXbQkWCjkqQk8WKmz/a7Ie5s3wmrmkuvoPI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(8936002)(2616005)(2906002)(44832011)(186003)(6506007)(8676002)(6486002)(316002)(478600001)(66556008)(36756003)(16526019)(6512007)(52116002)(956004)(15650500001)(66476007)(86362001)(26005)(5660300002)(1076003)(4326008)(66946007)(6666004)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: iJAYe5ipYT1Fb+UyvRkTWxIh8buxfGhBcq1VA/KpmybaD+B2YLQRoZpmoUBdy0ePtCIiKeqexKmSAvJMQSOrqynd4sW0j0iERikSR0WZ/NTGWwruwnBNKnYq4rcWmbMR/qLKPiOM0SGul/gp9h59dLNofxdi9ek+xppVOh6F6LxW2dWfr2kKbnXcS0lvoz7uc/mrr1gyi4wtp7hr6J4BjOexfxj51ph4kDgffjXuGYix0Wzi9+D2K2rViXl7vIlVd83OZrJo9++GLAFQL+CJp23qYPSwo90+SILeci1GAxCujT+w4K7X+h8exqWsl2hhcTw3QX5Hh05azjbZCaAfaP669MovtPohCmUs+CO6Z72majDUZ0qeGApWXMVx5XdJ3XlFi5UGpQUV3zzY/0mqHdocrXfdCP2PbD2m7QmgEyUjexq5tF6DAN8UQL1oMKMqsOfkcE2FVxrXTrSDbEMSYO3KuyM37mzcqu5zp00Nf4k=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5d906d-5396-418f-2e2f-08d7ff703fee
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2020 23:23:07.1791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeP3AFZreVCZ+4Ga9N64mfpiFaYyB8g7oEUhNnsD9CTz4o/IHeUJFw2xLt3XDh09KUF1sSN2MN/p/B2BSou02Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918
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

