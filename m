Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A89929561C
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 03:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894770AbgJVBkW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 21:40:22 -0400
Received: from mail-eopbgr80080.outbound.protection.outlook.com ([40.107.8.80]:23295
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2894744AbgJVBkV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 21:40:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOkKWOKd4ml33cnVqgnZJOkjmxQaVdaXCX0W5VhnNgd2sLT0Gb4PcOYfDpTbQw/geDUIKbRXuQwxvKUMk+re5J2y2iNjbFp4x/A8+eN26D6wvAozjRNiH+K8ctOHDo7QzwEG/oQSh5ndfsHgcbDxQQUCU3BrrO1BRaYlbFNBzinbvy9YmjtLqFTNkIgJj74QPk4aLSG/YTB9tcKwn1UVLa3e1ZlIy9nUJyjm1+nQ61hLe/7wcvhQD4V9oYhaDxhT42+vslH/ZYnlVLFKsAxGwlOH6a+U3683JYzq2ribdbZeXzzc5sVcFdWqimGpoHWIFd7Ad2Bgk/RCccAcsBkGIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrT4UFQfalcNTPHcOnC9pElI+mt1QaMGwF4Q7ISbCnM=;
 b=MLnlIAUsFCCd1s7dNNP1+6PfRkoqKtuCbDGgCzTqSdGfSfSdRSUFZvk51PbQsQTTOVaGpbhUktpM+ParH7yJxE+Mtetimr76GPTu08aTV4LwcJT/FfH1B9bqyV0AEBE8hDcIdBPLf9XreFdvGp0tPPOzRw8heOWV4Wr1EDHm60YuI3P/ccuQiKVIy6cpXRiPDi7Dw8NF0i9Nq1x6mwUuZ3q9DShbvAaS53A8ITAm1QxdGf+Mmc6Xr3E45K3vNyLqwN5dxDnp3LqPoJ96eFAbblxSjmZAKXH8igy5U2BU8CcVcIjtizqrwJRDI448+mmupG5vRpBEdsNfn+C9hUJm0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrT4UFQfalcNTPHcOnC9pElI+mt1QaMGwF4Q7ISbCnM=;
 b=sos4Z+MEmpWmEozoPipvAesHNUnhCCo6adN4UKd5xALC2AJqi1+h6PMRmaXHfAVzv9NMTK1iMvcN02nlWg3SHIfNSZ9245UMVg8AK8ZjNrawPepRJrxDklbErqfX/WDnZHiHV2PYx7s+aG32ykIWDoHQamaqf1kRX44WLNZq884=
Authentication-Results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR0402MB3539.eurprd04.prod.outlook.com (2603:10a6:208:1b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Thu, 22 Oct
 2020 01:40:17 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 01:40:17 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 4/6] usb: cdns3: add quirk for enable runtime pm by default
Date:   Thu, 22 Oct 2020 09:39:29 +0800
Message-Id: <20201022013930.2166-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201022013930.2166-1-peter.chen@nxp.com>
References: <20201022013930.2166-1-peter.chen@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0190.apcprd04.prod.outlook.com
 (2603:1096:4:14::28) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0190.apcprd04.prod.outlook.com (2603:1096:4:14::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 01:40:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 18120d88-5a43-4b72-7ba9-08d8762b6dfb
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3539:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3539D936864928AA0B68C6918B1D0@AM0PR0402MB3539.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 56VgNKh8VfjDPSLmruKHyNrtCGBcwSwGYNX9PWgcRp0KO22vpjfInCX6wxsKl1XSVB22ZRCrEw2YLV4gR06nsCroFTdRo6FMa+XtswaN16fsl1fZBxzyUjBJR/14IHQZ11hSmfQLT1DlkSY+35F/0+17WSgY3fVhQ9zIdlMTLdfkAb5g0pRakHEDiuts49TdTF+uddDjXD8zCS7bBJLytQ8RY5CY6TXpOW5o1g389iM7bbb1ilPt56AUQDQn53myPrXLvVW9ZkWo5cDVX5VQ2qDr/mIcWHtKYM01Ndw3qiVuMV68G/Z6u4JBb+AMjYEJXOn1PYMwQALDyUhY6RvjZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(66556008)(66946007)(66476007)(478600001)(5660300002)(6506007)(26005)(6512007)(44832011)(6666004)(8936002)(186003)(16526019)(1076003)(86362001)(4326008)(36756003)(52116002)(2616005)(956004)(6486002)(83380400001)(8676002)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: C11CIU9/mzxsfrhq5fr9/zbARSxTvjvnEP/j9+6VXzYLyo7THhnnYb45SejFUmU3yC1h+LINrxABJxActNpdDn9VcV/UEFI/dr9oHnuOQrKvDP63saqUVIVZtynBfDpxh/Fhi38cZ13Kp5leSWQvkFh/zKASDwvUUBlxNhhPRhAPaD9Jg//ZLffBSbdZa8lfP0aaT3dbgz1FaTJB7v/CN/faOVMoq703L0ROwGDE8NSdqSwGZU6DRVXaVBJsDRfGJhQGXByaG3wHDwpldc8MekplFJcfcLjmfG+s78yUD+812LO1Wco4rX/uHoMPyY2WAcFydcnNx8UEFc3p5MRbMqBCK7UZPHBO0/pO//2cIzWAuYfv7K6xq5ZYGveMLUHJarP2AQQmOJXHVrzU0CHF+Yv9zn0UJU5Jcm4uvaG9Nrh5Et363AwGFDMTf4QWqD4SK6SgolcSPYXSQ2wzWXxhOc8EWpxt+ptwp5SmVYyEeS1MiYyhFEK8vRH9MHB5QDs8BfrHOfgwSFm78MnVMbLRumilszgImPa0rcsBehzC1N/hsJqJd7BgPDpql8u5o/97qKc41TZsu6XqydZA82AEP+HRc7LUIEkMWOazQKkJ4PBvPOJeS43VQKBkKKoIiPm+N7wHn5vjAQT7igqs69IZ5g==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18120d88-5a43-4b72-7ba9-08d8762b6dfb
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 01:40:17.6213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBx5XixcwgeRrRkBddGhfj//yZXrsnmvs9lg+7UfEyiqgp2KI9RSKyLW/Si/Pq602ozuH3VQILsY/s98UB766Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3539
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some vendors (eg: NXP) may want to enable runtime pm by default for
power saving, add one quirk for it.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/core.c |  3 ++-
 drivers/usb/cdns3/core.h |  4 ++++
 drivers/usb/cdns3/host.c | 20 +++++++++++++++++---
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index f2dedce3a40e..54d841aa626f 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -559,7 +559,8 @@ static int cdns3_probe(struct platform_device *pdev)
 	device_set_wakeup_capable(dev, true);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
-	pm_runtime_forbid(dev);
+	if (!(cdns->pdata->quirks & CDNS3_DEFAULT_PM_RUNTIME_ALLOW))
+		pm_runtime_forbid(dev);
 
 	/*
 	 * The controller needs less time between bus and controller suspend,
diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
index 8a40d53d5ede..3176f924293a 100644
--- a/drivers/usb/cdns3/core.h
+++ b/drivers/usb/cdns3/core.h
@@ -42,6 +42,8 @@ struct cdns3_role_driver {
 struct cdns3_platform_data {
 	int (*platform_suspend)(struct device *dev,
 			bool suspend, bool wakeup);
+	unsigned long quirks;
+#define CDNS3_DEFAULT_PM_RUNTIME_ALLOW	BIT(0)
 };
 
 /**
@@ -73,6 +75,7 @@ struct cdns3_platform_data {
  * @wakeup_pending: wakeup interrupt pending
  * @pdata: platform data from glue layer
  * @lock: spinlock structure
+ * @xhci_plat_data: xhci private data structure pointer
  */
 struct cdns3 {
 	struct device			*dev;
@@ -106,6 +109,7 @@ struct cdns3 {
 	bool				wakeup_pending;
 	struct cdns3_platform_data	*pdata;
 	spinlock_t			lock;
+	struct xhci_plat_priv		*xhci_plat_data;
 };
 
 int cdns3_hw_role_switch(struct cdns3 *cdns);
diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index b273ae2231d5..08103785a17a 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -52,15 +52,25 @@ static int __cdns3_host_init(struct cdns3 *cdns)
 		goto err1;
 	}
 
-	ret = platform_device_add_data(xhci, &xhci_plat_cdns3_xhci,
+	cdns->xhci_plat_data = kmemdup(&xhci_plat_cdns3_xhci,
+			sizeof(struct xhci_plat_priv), GFP_KERNEL);
+	if (!cdns->xhci_plat_data) {
+		ret = -ENOMEM;
+		goto err1;
+	}
+
+	if (cdns->pdata->quirks & CDNS3_DEFAULT_PM_RUNTIME_ALLOW)
+		cdns->xhci_plat_data->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
+
+	ret = platform_device_add_data(xhci, cdns->xhci_plat_data,
 			sizeof(struct xhci_plat_priv));
 	if (ret)
-		goto err1;
+		goto free_memory;
 
 	ret = platform_device_add(xhci);
 	if (ret) {
 		dev_err(cdns->dev, "failed to register xHCI device\n");
-		goto err1;
+		goto free_memory;
 	}
 
 	/* Glue needs to access xHCI region register for Power management */
@@ -69,6 +79,9 @@ static int __cdns3_host_init(struct cdns3 *cdns)
 		cdns->xhci_regs = hcd->regs;
 
 	return 0;
+
+free_memory:
+	kfree(cdns->xhci_plat_data);
 err1:
 	platform_device_put(xhci);
 	return ret;
@@ -102,6 +115,7 @@ int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
 
 static void cdns3_host_exit(struct cdns3 *cdns)
 {
+	kfree(cdns->xhci_plat_data);
 	platform_device_unregister(cdns->host_dev);
 	cdns->host_dev = NULL;
 	cdns3_drd_host_off(cdns);
-- 
2.17.1

