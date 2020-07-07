Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5CDB2167C4
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 09:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgGGHuG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 03:50:06 -0400
Received: from mail-eopbgr60055.outbound.protection.outlook.com ([40.107.6.55]:9880
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728125AbgGGHuG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 03:50:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWiFUVebEtP/13RFXGQPhyQRRjbiK1sG++CQ3h0yN1h/8GE/ibzrFTWVq4lN5e2TL/DafF2BXp2xZ5NKxPF//l/5yrmOtX/89pGF2tMzCGZrdK2Wktx7bUoLZRRDN3eV86a4fT3LjewnhXcZMXSh5M4Z23BWtSqnKO8+FqwElnrcPJoSdBfLaBA10bxxczjGCPY3zLmJyTJk703a4r/sJvt4fJWIJcFHPORZ5DwCflFKtPotvwFnE5m5IqQljlbIzmn8Ge9nnoqL+iXKz4URce5GWFoqdUC4GwOJVNIrmm5Spl/WXBxHlKrQdbiR0Hut8GpMtsKQ+zmMxIzzOblviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMQLfBPyXbpDrAKzqHD/p2xqgDbJ7+uoe7MLUV+kjNw=;
 b=nYwPOXcmyMMx/r6wmfh9jw/VcGLOXKA4FLY5shZypu7JxTGiwMdtFyICSjs/y3drcUJyxSwtayi+ejdishXivI1qY+txmTr3lJd8SYSbJ9vTQGrJ+LuRoaCZHzC2VbTDCBFHIOGTHRdtA7rYjvrv41ilDe5lezhHB9KBNfYo37PixHxofQfWXOA7L35NF4wZ2tN4oTbRUck4Xaz03UBjxxxTE3wiI39/cCPg43z2mzSU7mJTWs11VET+SrrZIyLijT4ukITjX0MfcP9kaYTcpr4Gfzx7xGC3meDeWiAfa7KnVxCkdwdOr8PZYGC529CcjRQG0D9WmmPPFl5ht6GvPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMQLfBPyXbpDrAKzqHD/p2xqgDbJ7+uoe7MLUV+kjNw=;
 b=FKcWZWtZYH/xEVEXjdz7wgvM8urZc/ST8iLwfBwCjyJAPgDxQsxOD/a0R0MCCkCeXM8DUWOVqBwU7Gnyg3y/05w62eYaXQsBhyGg80QXrK1IHeAR/P+Nn+qWf04wWFZ0FfUoKBBfPJrdK4Dpqm9pa/9+8RASOctLBoBJDiQ31hU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5608.eurprd04.prod.outlook.com (2603:10a6:20b:a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Tue, 7 Jul
 2020 07:50:00 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 07:50:00 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 5/9] usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
Date:   Tue,  7 Jul 2020 15:49:37 +0800
Message-Id: <20200707074941.28078-6-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707074941.28078-1-peter.chen@nxp.com>
References: <20200707074941.28078-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:3:17::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0022.apcprd02.prod.outlook.com (2603:1096:3:17::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend Transport; Tue, 7 Jul 2020 07:49:57 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0243efb0-9186-4e81-21d0-08d8224a59d1
X-MS-TrafficTypeDiagnostic: AM6PR04MB5608:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5608D3E9A52F2317B7C8CDB78B660@AM6PR04MB5608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2w3qzT+nWnd6nOx+mw3wHEcdcoCZZimj9kkTz1HRD9jiPMugf672+ZT3oR9O9cW5L076B3lFZnJPuGBG+Dv5WxZGhaTIOFBjsQi0uuvQ3byt9q8lI6szadzH3lCu2/KWl9hv5B38yv4aAGnnXZ+5HzkPD3ej5vNbGW5mj7oIQtrKK7iXO54+JOy5mymdHk/BLl+0hbDSj8nqkn1FqW4nWSH5vAcmAiMjVvfG9N4JDi8nlbghFL+Wx/8DSybdCz463CRhuk1IG96TI3WtGQwcxDQDVWTUnSHhz2dCsOHXVmU1eWComgOfh50Oy3/V7LQ3brshp1NDESDB0oiNsC6KBM6W52UdA6FEAGnhpzF6b/3BPdPs3HLsiiFDJ+omynCK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(1076003)(6512007)(2906002)(8676002)(478600001)(16526019)(6486002)(186003)(26005)(52116002)(4326008)(6666004)(6506007)(83380400001)(8936002)(15650500001)(44832011)(5660300002)(36756003)(66556008)(86362001)(66476007)(956004)(2616005)(316002)(66946007)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: dFQQlym22hBNwnNaOG8v/SBRc2/aVxIQXrwio95c3Q8fpXLruQz2EIXTYsYHQD5gsjy2k6Xiw6tRMBB+g0xeSHIrukVujh7IwoEKZrPEdtnbPsk5iHWamhTsnky8mxumyIxidAB5B5I3nB06EM2XBPagJ7L2N8/Ss3Cl7d4P9OUTvvn/28OWHvVCY8WMIflfZrcTfxxfSboOpQt3fgC5BTNmoOvp6ddKYHPW823bmFclRf/iRLAtOa7ID6yAEyml0nCtwONVGFA0yaIuvnyTWkQ8aioQg9EWe7/wZvNW02Lno5wAvimBknzbHqONf4B3CkTSSFHNlNlTM/8tD6C1lRalpSL+iD+XG2+n7Yxjqs1QnC5fkYhKwAfWmCcQoVL4xzc3+gwaRRxG1zWUJMOnuEiaKUnIT2Jv2D2zgxsfoIp5o7ngd1VmWEgCNjXmoFKGBya8QxlRY4ERhMoN2BuWxgGOO8EpZIXryOhXOvzsO130uX+7BbxVqbaIOM0aGvFT
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0243efb0-9186-4e81-21d0-08d8224a59d1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 07:50:00.4838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQRrw0wKOn99tUM6K4jwHYkgBgspf1mfYRgWq+UxAeJ/fPlLqpaerWxXqe6oqYwPz4vfK2L00KfXk/rRFRA1Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5608
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

