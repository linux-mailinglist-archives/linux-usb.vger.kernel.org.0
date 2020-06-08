Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6841F1348
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 09:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgFHHLC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 03:11:02 -0400
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:14272
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728953AbgFHHK7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 03:10:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoErsFnpttPfxgFXCedaxpbIuOWv7kp3ruizkvzRMjwD2jsbcXwWlnILit+LRaq24iEh5wDDdYmZZ6c3t9XTUnwSHvIb15xh1rbP8aqvxtafoG8leW7+iqifHsCe9ROaYgVAM2UaVJzTqET/xDdR0fwbaIcVtxEyph/GHOR3gqRKocuUQKKEHq2lE2+mINl8M3XtuVDWFlJcVlYhoA7zS9INfvxirxg155xL5e0WyYqDldIzGm9X7Y9nvxqZAtvEfaeuTvu+6Vnojvlu+mKVpoq/9RRCLYepxSY0JjbdpRu4aGuuPdWG+iDn6OZ8Dms84UioGXdITFQg1Badc1YisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPegifVYigfyV9eq/X/+i3y5OBIGQwhBw/jxdrmMHjk=;
 b=Sg0Op22HODpmJ298rQomwN/mlVk22cBeYwr8v5UQbqww1j+CueZrmcTz08Vf629wk+8NzEfY/dOc+e9SM8KJVqmyWZVP2KKixhbCvCWKWIiCaMkLef/agc8DmdKzCJzOlKart6D78kKa7oMvUA0LMVLqwyh+zZoK3FhFNcTSRTNG1kBCDaWtDHRbD0qfOVEshcuyOrrqi47qhhL4x5PmBWvtimZ/34XXojyro7yPOBk61rKcWs5vCyx2Hgc7XbPsStQtlcu36ODX4dvvkFAz6X4aCyc+58SB6WNeQ1XeilInK5uMp3sIi8xRxtGAJBFGWMYiBWYpZn6tc3TtGb/srw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPegifVYigfyV9eq/X/+i3y5OBIGQwhBw/jxdrmMHjk=;
 b=oQ0/b8inD0UnDt2RT1JKlvYvXZ0CDvQ2Z74TxvJUbPAMU6EkFzersnNNgeF9BujXs5IULik34O2tJkn+BMRql9dgpT6JTsRlMk/Z7E73+8gUd/lmPhzRcAl5SP5ezMk23WYorPj0Cr231b0j1UUgaBH6S8EMJubT+mMhnkNOmoE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 07:10:55 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 07:10:55 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 5/9] usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
Date:   Mon,  8 Jun 2020 15:10:48 +0800
Message-Id: <20200608071052.8929-6-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608071052.8929-1-peter.chen@nxp.com>
References: <20200608071052.8929-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 07:10:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4e461cf5-c463-464c-6f91-08d80b7b161a
X-MS-TrafficTypeDiagnostic: AM7PR04MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6870D4095CF6F2FED2A716648B850@AM7PR04MB6870.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iLdWNfTMJGQUFNFrorjaKDpuaIqcbDY9yvpq2H2Iq8YQDMqKywyNYYKVi2uW5QV3MKNULabz6RnGSYae41Qq5sxvLMtOs5LWnD+k5S22PquRIhXZGg25gr7hNjoy91/ZZ8hLLiW65YeeuzBu403/3qdb7h2Ty90GCfAdP+FSPjdDpHKTcqcjtC2zpxlfEY4bkoG272OyAN3/bM6AQPI47cVK7HTez579dM8K6wBMYio+Ue/OtCSq/O/c+WXNjwRxS53VBkGwzBDNu2tucSa/f5RgInBW9beNlanxyDq8ZrfvNaBrjJFZzd/JLkSF8tmSW+mibUCmmt0CUXkyDUQFkFd7DTox2wdJXXiLrkWl5ixiZMsx41BuIEDcPAZXQaG0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(1076003)(6512007)(66946007)(44832011)(5660300002)(8936002)(66476007)(66556008)(8676002)(16526019)(186003)(956004)(2616005)(26005)(6506007)(86362001)(6486002)(316002)(2906002)(83380400001)(15650500001)(4326008)(478600001)(36756003)(52116002)(6666004)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: WBfUQvuvAW8znKqjiH3802YqRK5vgpTXjUlHX1rLVGaiPH5OOynQ7EyTH1VHACbcJE6GKkDt1mrb/kmyQwjfIxMsysEYYwRNN5/XGDgxV5YIxXuspZb7VrCt0lFwHCWVd9xCZdBSYyNNq4i8JPR/nilrcPU66zrvFXImd4gv+BgfqkOrEv017zIJNdONyAkQLt7E1LoGwvwKxA0amAnbQvAB5TVLf08RqUgJz1uuARwkaHdSrQR+LHN1lJ84Eys/oEOMYA0uWDDe+Nmf/wsaA4Hbd2Kyv4EhhBQ/KxWsJ6588q4BI5m9UDD8ToJYiuNkw/HZ40TFPcCZ1E35H2ZetAi+Gkq/v3Cza5hnKRgRwlN74OTiO3yzx20osY8CvBlUfjVdHe5+urE89ss3G0WBXGKWIiur6RF6owb3KzTfGD8S1M2UiKFoa+oK1BUjMxui3ho0RFFUJJE59fpnuE1hQhY7Mme+QJ09ZTyE0zy1zb0=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e461cf5-c463-464c-6f91-08d80b7b161a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 07:10:55.4899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cg6yLsBOBlFobui5743GW0Rz5r4V7lE2/eN8spx4wH/dBd4szxMC6uTsY/Ah67cq4CRwoR03AC4gkhe0U8A3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
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

