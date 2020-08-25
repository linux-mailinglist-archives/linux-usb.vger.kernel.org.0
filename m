Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58FC5250EC4
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 04:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgHYCM7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 22:12:59 -0400
Received: from mail-eopbgr80083.outbound.protection.outlook.com ([40.107.8.83]:56846
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725850AbgHYCMy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 22:12:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flrXarWEfOeZfTeacBELSnBLTQyj5TJDnm8Fdaih6rTIuGI8n9uBYlhaVqtLSXzc638XPSvfyyWeZMZpWe6Ww8h4Khc8sWF/259e2mSLFvG4AM5QdSdlHTR0Xrts/93+b/hnP+JpAQj0mB5dVlUwYyR+HCT6vec9F4Pd/U3TRUePrTKxmXuy0Ou5F9HA5ny5GDMUQ6NvCbpSRWr/up8ZIQ6a5qYABTE44EskMiuFpmLqKfQv4duTqHv1xtRAYoRiLF2qClNay89MM2UDT6IqrCZ7MCRvuM5jZL/4eVIDOySBaHL+7pKIXsC+xJlH8K39T3q6ey542m6DHOJlz42uZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+NF+KVpb6Tagy+/1OlRGAJF84BWrr/x6YkZpUw/59k=;
 b=LD3E5WPZ0Qo8mvs0CQn78+bsLeAtGsxdvFnfpS6WqRRoDwe9SQS6OcA2WGLozE5F4FKHRFrql6mzTYiRNZykeBOcMPYuFrjIBvJltuqp+xHo3WmVcRsoPzdGigQGmBofn0f53lHEVVZbt8mj2RViPqykbAWcTg2l3M/zCCo9znbrurRUZia6hc9XBDBJFivpm9i67vKCc5BqCbpAjc6s4Hoe2squyeBAm3UF6XzVHApTI1f0lEcGKAlX813OMCG8mk8CG4gQ0Be2vHFD5XaIAXqYz4nqGZjT/aeRE9Pkztd2nTPcKJ18KxgDAYB9/Iw8LUCSAePvwJ2XqcDieD14CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+NF+KVpb6Tagy+/1OlRGAJF84BWrr/x6YkZpUw/59k=;
 b=i4KrvnuZW2/aYNtYFdJbKKp/YDlXUcNPA5Cej5/AD6sf8TeoE3gri6DMuDEDUgWuIjqB4SMsZE+sv8zixSOKS7AchBHgIjGH3vookyyEJPQtdGqOne1Ibs7tQTJfijDO6fAcrpbkbPUwwW0eS1h7ntjeGd1ZP0H+9gVAqn0q86s=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0402MB2851.eurprd04.prod.outlook.com (2603:10a6:203:99::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 02:12:50 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 02:12:50 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v7 1/3] usb: cdns3: introduce set_phy_power_on{off} APIs
Date:   Tue, 25 Aug 2020 10:11:18 +0800
Message-Id: <20200825021120.4926-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825021120.4926-1-peter.chen@nxp.com>
References: <20200825021120.4926-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0160.apcprd03.prod.outlook.com
 (2603:1096:4:c9::15) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0160.apcprd03.prod.outlook.com (2603:1096:4:c9::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.10 via Frontend Transport; Tue, 25 Aug 2020 02:12:47 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 03115b92-9f71-4a77-3580-08d8489c5e2c
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2851:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB285166EC7C1F426A46159FAD8B570@AM5PR0402MB2851.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xF5IbWvf8wmx4k+fYOOanvhoPv0f2aRiJXDMWdeQzL2m6QwASIbP1M8DZUwqc0qxbWaIuMHIyrQB6MTMXYwXw+GYNNWXQiFfBhKY+xByq+IktleivzC5X6lXTo/3m1HCw5OyhKGvAADbA0mEeliRGKfl8vDUrKBYrLbjl0ohsMssJRuUHxg7WHjfG7p7Z7EwxCjNTuuCfNyyDeCk5pVtEFN92lSjUNRAbUDEod5kFSqX+5Tbexf/IfiERTfI0cyyJo3bjSX2E5Zn0Fr38Dkw/j7pWJFO1kA/oXbx7fDzxlIbJc/5HW4jD7wxo3A2chxx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(6512007)(6506007)(2616005)(4326008)(956004)(6916009)(44832011)(36756003)(52116002)(26005)(16526019)(186003)(478600001)(8936002)(1076003)(66556008)(6486002)(83380400001)(66946007)(2906002)(86362001)(8676002)(6666004)(316002)(66476007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: iPIyf3EPa3bE5U6ljf7Xj8070SwKkJW+WV/REj9GbCrpgrPrV6XiY0Je13L5oemNJOfMT55rs36jj7PhyD2GlV8Y5DBcpXTCZWOakhsYnmkhSgH9z82/h4MjS6UJ47da68uquBsg+kBzYUpMp3oDuNn6QPM+/13+OxarjWXvicAnfck9eIAJ/73xtKov3B1mJUuIFYMOcMe5r/dAqPy6ofpLWZL9c9ZyFtkFbzLJkA5hic+CLb2gxX0F+AF2b+CXk8WlIyEskwNjEWl90UXZY7kJDrUzY+2Gm5IZkErsPJcRRtnfwP553hG7X18M/GZN3eSZ0zynTFh5rjMYiqeuXoznmijq1B0G9wpSOXPt+R/8kXnFVx4EUPKnKFkdbyEc9cczM7nQZa4cWjmxCBR2MEpWm3pja6pQ3TdLupMg3myDZfZbdkWHmhYe8VUmisGalpf0hzyxRiMznV7c0QXGYBob9Cb1Kchb11KEEzgrO8yep5UwIUFPQqVDf7EK8AEu4cJ5AefVlxNEvFcNZtb52GQMvIhGYuaIizr6yHlp6V3BV3Pq3REuphVtXRpAzBiOCOrQIJKXWi/o/WcXCRXJgiCjZdq/Vtx0LC+2vBtDKfr+g7j9T7K83g9+sdyWcQOUEyzXoBjs9WSxj6kqTi1mzA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03115b92-9f71-4a77-3580-08d8489c5e2c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 02:12:50.6631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgrBudIvp5tpE/XGPgwh+8p1rRSopkR7Zg7HsAFqwN7yyNqr6PaCHGefsPQ0gK3bcxjfdthxvbPYBMA5f/L/sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2851
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since we have both USB2 and USB3 PHYs for cdns3 controller, it is
better we have unity APIs to handle both USB2 and USB3's power, it
could simplify code for error handling and further power management
implementation.

Reviewed-by: Pawel Laszczak <pawell@cadence.com>
Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/core.c | 43 ++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 5c1586ec7824..e56dbb6a898c 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -371,6 +371,27 @@ static int cdns3_role_set(struct usb_role_switch *sw, enum usb_role role)
 	return ret;
 }
 
+static int set_phy_power_on(struct cdns3 *cdns)
+{
+	int ret;
+
+	ret = phy_power_on(cdns->usb2_phy);
+	if (ret)
+		return ret;
+
+	ret = phy_power_on(cdns->usb3_phy);
+	if (ret)
+		phy_power_off(cdns->usb2_phy);
+
+	return ret;
+}
+
+static void set_phy_power_off(struct cdns3 *cdns)
+{
+	phy_power_off(cdns->usb3_phy);
+	phy_power_off(cdns->usb2_phy);
+}
+
 /**
  * cdns3_probe - probe for cdns3 core device
  * @pdev: Pointer to cdns3 core platform device
@@ -463,14 +484,10 @@ static int cdns3_probe(struct platform_device *pdev)
 	if (ret)
 		goto err1;
 
-	ret = phy_power_on(cdns->usb2_phy);
+	ret = set_phy_power_on(cdns);
 	if (ret)
 		goto err2;
 
-	ret = phy_power_on(cdns->usb3_phy);
-	if (ret)
-		goto err3;
-
 	sw_desc.set = cdns3_role_set;
 	sw_desc.get = cdns3_role_get;
 	sw_desc.allow_userspace_control = true;
@@ -482,16 +499,16 @@ static int cdns3_probe(struct platform_device *pdev)
 	if (IS_ERR(cdns->role_sw)) {
 		ret = PTR_ERR(cdns->role_sw);
 		dev_warn(dev, "Unable to register Role Switch\n");
-		goto err4;
+		goto err3;
 	}
 
 	ret = cdns3_drd_init(cdns);
 	if (ret)
-		goto err5;
+		goto err4;
 
 	ret = cdns3_core_init_role(cdns);
 	if (ret)
-		goto err5;
+		goto err4;
 
 	device_set_wakeup_capable(dev, true);
 	pm_runtime_set_active(dev);
@@ -508,14 +525,11 @@ static int cdns3_probe(struct platform_device *pdev)
 	dev_dbg(dev, "Cadence USB3 core: probe succeed\n");
 
 	return 0;
-err5:
+err4:
 	cdns3_drd_exit(cdns);
 	usb_role_switch_unregister(cdns->role_sw);
-err4:
-	phy_power_off(cdns->usb3_phy);
-
 err3:
-	phy_power_off(cdns->usb2_phy);
+	set_phy_power_off(cdns);
 err2:
 	phy_exit(cdns->usb3_phy);
 err1:
@@ -539,8 +553,7 @@ static int cdns3_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(&pdev->dev);
 	cdns3_exit_roles(cdns);
 	usb_role_switch_unregister(cdns->role_sw);
-	phy_power_off(cdns->usb2_phy);
-	phy_power_off(cdns->usb3_phy);
+	set_phy_power_off(cdns);
 	phy_exit(cdns->usb2_phy);
 	phy_exit(cdns->usb3_phy);
 	return 0;
-- 
2.17.1

