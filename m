Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C345F2167C0
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 09:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbgGGHtw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 03:49:52 -0400
Received: from mail-eopbgr60060.outbound.protection.outlook.com ([40.107.6.60]:36064
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726540AbgGGHtw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 03:49:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEn78LDMgRl3328V5UC6g8sQY0+x1UumobI0iW/Qhbry5Zg5Tjv+/43wF8EbZHqfdUJiYwKxMcPOmDiYUkTBJm24cHFwZ4PFOqrEx0pM3pt58KIiqfX+33/6qvNILw/cVLaaon/MFf8RjXbi1Dvq3Dz/xlK4TyVuuNVPOC1UqpBe+FfOSWPZDZ9LwhJNghd5NSf+fVRR8sdhfC96TOHz0er1fpn/ZK/D7hkh8YsdnAI0tDsvuyb0Wnnmt+Yd/pi2o6RERx0o/GoKGRoHQNGg9mjOpAc/I6n9iXzsIG15OamdRPF0Ff8h8ILTyoutRIJ1NeJfRIOcrnAxt0UnSu2mmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OH+pOBGrIC5plEvwcGHMbeA9goPd2/eIaV/sIYxdKSE=;
 b=LMmhpt2X2cNqKqYp7OXEIfXbMgL0il84Y9RD1nVWgnlbfh02DEwy3upnqFNFs0sBT1rfrtYLVa2PBkPiE0Epo2Y4CjfpW/Te0t/fBAVVH2SZz8C42PZWW4IBR7SWV4YT1eEZBJ0FnNqexrygTTFnI97LzjbbRLyeAjnXBA2sXGx0QzOfXEun1Hdq4iT+d3LjSx1L1eYben6rekzHuJUaXt9nIuq5fSjt5B0h9R+n9BhvJreLejjEOU+NsvhT4R70lAfeWMAMU6LH3i7fxosmOgPjO42cRxFxXtp2yaLz40Q38SggPgmsdmRZS3TfLT31FKG7vHIOVw3phb/jA5eoMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OH+pOBGrIC5plEvwcGHMbeA9goPd2/eIaV/sIYxdKSE=;
 b=HW6W86AKIdcFJgU5VQcNMWMoF3zaLkAmeaIllqqT+w7OJcSlGXDSxaXdxLLI+xW2auFBxwsuoPrATDeMx9V+eOb/37gEq3+mglaVTjUV4K3nOKAAGGAcPQ6ga32qQeUbOEe8W5cZpUt1mNdANEv0LSpeml4lqkjcv6Mu1VM9kto=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5608.eurprd04.prod.outlook.com (2603:10a6:20b:a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Tue, 7 Jul
 2020 07:49:47 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 07:49:47 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 1/9] usb: cdns3: introduce set_phy_power_on{off} APIs
Date:   Tue,  7 Jul 2020 15:49:33 +0800
Message-Id: <20200707074941.28078-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707074941.28078-1-peter.chen@nxp.com>
References: <20200707074941.28078-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:3:17::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0022.apcprd02.prod.outlook.com (2603:1096:3:17::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend Transport; Tue, 7 Jul 2020 07:49:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc9e87bd-e034-45e1-b752-08d8224a51e0
X-MS-TrafficTypeDiagnostic: AM6PR04MB5608:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5608FD4A0EF13EFF827801928B660@AM6PR04MB5608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jI+nLtbughrJMd4h3obF0702KYQoOCgXAJ4hdy+4Hh03MIm7lYf506PKyTpVkpKOv/RAuqLDbviV72Eu+w8QIQRbLud60D5VTJ8cmuipaNXx7Txfz+j7qa57nesVcsn7SjHdCUB06UAg97V68q0hLsN0C5gD3p1Oh9dao0RaaVusFeMJDDkIAc3FdDy4VWwDHy/M1i7kHDy4jDGixsD+Qg1dUqLOOTsCgDm3c2IDN+Ye8JcW4tWA6XbhNziTlRXfm6JrUVVWfT2yAIOHbjjz7am7KJCIiau8kFaoOnn6Uy5DuK1lzifmNl5Bq5jy6bMcjHl9KhsBB9U72MqWdTVeMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(1076003)(6512007)(2906002)(8676002)(478600001)(16526019)(6486002)(186003)(26005)(52116002)(4326008)(6666004)(6506007)(83380400001)(8936002)(44832011)(5660300002)(36756003)(66556008)(86362001)(66476007)(956004)(2616005)(316002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: HstLcLsYS3w6QAzEijLBzYpIaGxWiGLwWjlCb/3CHUH3yNV3jP4h+78czUbUz/q6is05RsgBJoBkFroeSx2s70LA4KqnIuT3OwKmAgjamWNlZ8YpZFmXA/tgHtZlR6g4lQrukuWjLFd7YatoMP9DwgeK3lP6PbzcOOHkgpzuNgyMECm2pqktBmgyJUdf/9l86SbbB4Q3rVxGepkFV5xztzYvanGQ9HqCBOSohgJ5Uu8D5CjRCV+1yfCTskn2c65pTWo/ghzQ6Eh82GRE8+wesfWIZf4zvW3Rk+6IZJdk1yH8qIztpEJW03pdQzIZlLUHXEqqWZOQ4Xz3TIzu+9kXvYvVBuwV9N2yEai3nCR47JhA0ZpznKmKm40orkuMSkvdMkftWHop0bjj77byjkoJH761Z8l/Or0UQ/Qu2jcyEZE8EyVR0lZ6mWp09gObD0pJzCC+o/N7otlrA5Ej4NofxDkK0R03j0YQ9+/qZyJOJ5nFU0yAXRP+wsPNX87oNeff
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9e87bd-e034-45e1-b752-08d8224a51e0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 07:49:47.2936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRcBj+bQ398fPqzfA+f9n9U0pyDYxmlAiA3TW0AbUAbMR0e21yFwhsk7sBlrNUg27V7pKS33D22xFtpC70TI/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5608
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since we have both USB2 and USB3 PHYs for cdns3 controller, it is
better we have unity APIs to handle both USB2 and USB3's power, it
could simplify code for error handling and further power management
implementation.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/core.c | 43 ++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 19bbb5b7e6b6..8818935d157b 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -384,6 +384,27 @@ static int cdns3_role_set(struct usb_role_switch *sw, enum usb_role role)
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
@@ -477,14 +498,10 @@ static int cdns3_probe(struct platform_device *pdev)
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
@@ -496,16 +513,16 @@ static int cdns3_probe(struct platform_device *pdev)
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
@@ -522,14 +539,11 @@ static int cdns3_probe(struct platform_device *pdev)
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
@@ -553,8 +567,7 @@ static int cdns3_remove(struct platform_device *pdev)
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

