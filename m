Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D0525A902
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 11:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgIBJ6V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 05:58:21 -0400
Received: from mail-eopbgr00079.outbound.protection.outlook.com ([40.107.0.79]:13312
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726247AbgIBJ6T (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Sep 2020 05:58:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdFicS/nRPBQCSrYuyIeOKqRJ+EbPP9gY6w1wtgbFSzVtDbRre+A+9IrvAwfpQdDEJDzdpgMD74Xgh3ct0yy+naawg/76mVWgBM5rkmzbxxu7yXbGTQ1IIzCnXtGqZ6QSX46bG+eWna+kRkXJGQ9NOAdPQKCDoZRclKFWqB0OK2ZvWi7l7Jhgl+7g+JhqvPG/DrqdONgfBY2KqoxwkPnbrzU0rmCOfZhj17OkDxtTFbvPo7UHF8r4np+rq2BmH3h3JG+FKje3VFxV3XH5e38ul9ItaLU2HzfhZgdlP4atrfOke2303lKm0/VDrKI2f8EOe67rJhKvru8yB3jS24npQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+NF+KVpb6Tagy+/1OlRGAJF84BWrr/x6YkZpUw/59k=;
 b=W10KVGadDWV8gjT9xZwjWsm7ScqDXF2koWHwpX4fOlxkyus+X7E3ZCLECSv+u5/yvzF648qBRffoYHtuRAH2Nr56tUZ08wFxTFkNAmFQ/JA3Kvw4fuNlLJbhkyR/+QK/+F0/G7Axm4dReWH0EbjE9lTvRB0SdzNnaJ6PNcZNC1VSuERNNpu9szfTFhyq4LG/rwzBos/TeBT7Qjbl9UCsXbTlUIl/BTMEVPcWQQbopwpyFnrNGhzxfrNoU3YyTuhnOx2Fa67/byfi3C1HPu8sCcE2YDEfDJ2Gol2y8t5J/bBFySPnkIss6GU/1cHDXsNd2eLhoZQRRsvdgXbNhVDILA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+NF+KVpb6Tagy+/1OlRGAJF84BWrr/x6YkZpUw/59k=;
 b=gpPhfv6+PyslVbONhUdPJ0PXUCJvmVL4R3mpr90G9Fx4EzOlcnpBV0y2pGaE50NX41IvFBqbL+le3msDmVXJVsABHs/y+2kWIx171x87SzaYUxu6bD5wexEKqMjd8Uu2WRcHkozCbHAz8JHasM9DvLWlIaheqVN6bo+ccONXFss=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0401MB2484.eurprd04.prod.outlook.com (2603:10a6:203:36::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 09:58:08 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 09:58:08 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v8 1/3] usb: cdns3: introduce set_phy_power_on{off} APIs
Date:   Wed,  2 Sep 2020 17:57:31 +0800
Message-Id: <20200902095733.3453-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902095733.3453-1-peter.chen@nxp.com>
References: <20200902095733.3453-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0164.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::20) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by SG2PR01CA0164.apcprd01.prod.exchangelabs.com (2603:1096:4:28::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 09:58:06 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5dba1ef7-054c-4cee-a6be-08d84f26b1fd
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2484C5CC644C48FAA7FF97DA8B2F0@AM5PR0401MB2484.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h4OkMRO7gunskdqhi19YnL9/0vZuT35l+/La94Z4nnAkQm6fqe/gAuQ/308sefOyZckJOKfj6KdT0FltRT9+4/ynqrEc3fr5scA5s8clYK/zFDmjecGcczXeRDHOkZtfToB5GryZV0zE4W5ZU3q/QtAnZuFg+UaDVrePyS2fd0qGdxp1nwjRMpL++BNWLfyU+LWznQRZIgVoon//LwWWFGURCswWb92BVmT6bsmSy0pUq0wcpD2ZZxrLFfeZZWHV5P3I3H9/2UN+0Pl2tBMJ/dT5791bjMGaZ+EljOsDH3+lobxP1FeBlFVsNPpt0Ebg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(5660300002)(1076003)(956004)(26005)(8936002)(8676002)(36756003)(52116002)(2616005)(86362001)(44832011)(498600001)(16576012)(66556008)(4326008)(6486002)(83380400001)(6916009)(66946007)(66476007)(6666004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: xAl/bvKW6em7AswTNT16eALfzrJTjUdwf1JZFci/VjlKzr5Spd8tTWjUPRm0aZHvZ6g27v/8/F1UjD/51QL7LA/kVYD+fK+5giL1COQFeK0rLzXSl47UDeCaoB4vM4KszSLmsm2kSRG7gIvF57K34s3gvQtEKX9uL/KJ0HKYTUwQR5R7hHEsyglyqBGkigv2qq7xeObhFSxY3uOeDfwRJdcVm1vO3ZfenE6s0XIio49oyFgMuFo7BwENAA/fMvps7nYQd02kSltZ0FvgHIRAzKPrGwHWGI0V+o7kL+WzDgMhaMC1CqT6GYBK7WqyhnAiW+X/J76gzCeOoXX8xJ0AMPEvMMfm9YZHtvBQJjuIDe/931lb4PNBOjFNfrL5LkKTp0sKeDFuAsKVoxJ+VIw2BixM8s8SBlfDI0ewhvPawOaMaPDY3cr2l4WdqRs3davFE3rXiVO0BY9T+2zxI62y8wVlUBva74BfMJ/8LmydKBcqb6kVKV/MTPZpNMR7lViVXXfiXr4NF8bm5BPmmcVi3wjVuP5mbAFEw/mJXDFzILpyAjrG3x5BXAmEEyXitw51AaiaWKilMdv6Af5FLI6Ngv8H9B3ALUYsE/85dvt1ewDaVzOObBNVGhFqhRzOk4fDZ0tYrNumii060Xvaon2wrg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dba1ef7-054c-4cee-a6be-08d84f26b1fd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 09:58:08.8169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwWsfQGgXe+350HfnGqJsOubVCbJp1sZ0nSfl60xz+ikZjGnag3aQoVUFzk2PjBxZd0GrJZMRWsaH59I2Z2d3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2484
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

