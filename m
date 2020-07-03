Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9873E213426
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgGCG1g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:27:36 -0400
Received: from mail-eopbgr00087.outbound.protection.outlook.com ([40.107.0.87]:65506
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725949AbgGCG1g (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:27:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ft3zrkcJZxu6Cp2ijodfAp0Hdrr6/SCZXOj6j6sAK6Q5iGsCQ3vUJqure20Gbm0PidloUpIo45bsd+7IUTDFujrpu7MPrnyK+udSPG3MFJde5+8gkFimnt6QnaohFlfJqv+O1PSGBtTi4dz1KdJfvxIFwcSyh4CoLeY/UvAV19a8rxIH6XUqOBMMR1vo68pxjRH3pqMoZzrmxKToDAoUnRTCAS50s8d1tYAn/dkLNbFIP9CQ8grEESIplh7KhM31u56+CBU3JmvuvT8UC+qNWpzKRP+0gyejq0+gTqQ4EfcBk7Xg1kuG6ohzFCpVbN1kB8Jws5OabPAlKW2SjYcPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iBh9S1En+jgXFDcmC1n8n5luYN3vZHkUBV6VM5gTpg=;
 b=ZgYg3MYD7ZBR30XYrkTJzfgYg55CPxvBxNP3hJBl1pKCu/EvpYDng5LSJplEIghA6KPIYYuGrJ/v+9yjG9PhhT8xNrF7n9x0wa54uPqSMUCulS14/0YBrR3zH6BAZx9sYW0P32j1uTPTiXwHZMTK5nHRzJO6NgbBil9kH6edrml8sPLo/sCdg16puFZFQF1KwksdhLIWXqdgbqCitXLDNJIyXuhZenO5FTs6ixGwcuIXwh29mqIC+KiCpSHG6UgRnip86MV8jEptadoODAMToePqcUNVDM24zmzMA3Y1c0ij/by9AeKxMOSzbPoIzap/dokg+6ZTlMM9cxnZwutomQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iBh9S1En+jgXFDcmC1n8n5luYN3vZHkUBV6VM5gTpg=;
 b=WnETqRjvrIZvaK3eYXidKhelYjTTadLCiLhETPv2YczLQrVksT7Nu7NFyW+EOHS+Pw2sSfOhj8AIkPs2KlZP3QlhgzFx3Jj41fBGtKSJv91PCl+kWk1GNIJwcqd+2XBNtcf3cyU0sWys7IWQp3w8AeImusOzwaE0YrJMQL16qm0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4758.eurprd04.prod.outlook.com (2603:10a6:20b:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Fri, 3 Jul
 2020 06:26:58 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 06:26:58 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 1/9] usb: cdns3: introduce cdns3_set_phy_power API
Date:   Fri,  3 Jul 2020 14:26:45 +0800
Message-Id: <20200703062653.29159-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703062653.29159-1-peter.chen@nxp.com>
References: <20200703062653.29159-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0107.apcprd03.prod.outlook.com (2603:1096:4:7c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.12 via Frontend Transport; Fri, 3 Jul 2020 06:26:55 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b50fb005-247e-4062-cb12-08d81f1a16ae
X-MS-TrafficTypeDiagnostic: AM6PR04MB4758:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4758DEA25315B184621CE2EA8B6A0@AM6PR04MB4758.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qeEZmwkKSnYUL25JKGacvZOydNBcKnGVzmh5Fkpn+wcxvhE0Ie+y98Z5cbBsPqyVBx6ngulmL5Mcq6ahgJji9tGv++9mx9uZqOOS+f3SKXixWAZOUafZtYb+CJJ3nJPyHL+0SgYzvT2241GkhkyaXMzFQGVBx2CYwS/LDPUnOhskhmCP33RcqMVlYJG2Wtazsf/sAaVPxD3I/9mJfWV6JpsYCgH/geDvZRCgQjQvavjc5RGvxUjkZB4+oERnFshaPjsju+1QQuHmREXk8IsKGFiTLYmHGD9MJ3ylCOLsLowyvhAzB8FfiK3UY4fl7wrojuj3NmEsa8pVN3n2CNAL/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(316002)(4326008)(478600001)(6512007)(956004)(2616005)(5660300002)(6486002)(36756003)(66556008)(66476007)(44832011)(1076003)(6666004)(52116002)(66946007)(16526019)(186003)(86362001)(26005)(2906002)(6506007)(83380400001)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: o9x2Rb1i3kit3BcLDIdMG4dB7b0IEaowOg5Q83FvJ2gPYP4Y4FM0STvrPLHSy5mEgczSTb+bim2EeX2wd199kIA0PVyMHTbV2T7MrFwd2e9QJXMvOulQI/WaJZuLyqm+mMHFyFshFfRBUH7MqlFlI2yDcfyUtG2yYcU7k1Kmq9v6tEFB6+IwhgmS+OKB+EP9wkZCMRwPJpMesdt0zQeH43sF9M7RQtFhqG8n10mvM/hm3kOroVDOSUGb6psuBPXUI83xxS8Otv3MFVCrMPZhJo+fIBinB/FvrXt+dDg+SUr+FoJGUfHsLYrpBo4SxLsWgzw6hBTGDt9lfe9RiYAc/fBAcy16CbHVx84a7DeQPd5eObqBIhsjvBdIqFenC5yyWkyGmCpEoi/+GV5oej2MNzcHF3rRoCtx8qi1rk1sY/zOX8DOwmHfenSv8mdnuIt+y3gBJNEiZocvJzxuC8ls3hDWK8DxqfFCXJRYk767dFU=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50fb005-247e-4062-cb12-08d81f1a16ae
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 06:26:58.4513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqipCpZw5UKkuXts8vBHVPYXSy3HsJm++6esI+QNKD1F1BtRj+LEi7dGyQfKerBp8e12pXDVqZ0ILBpyFVrd6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4758
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since we have both USB2 and USB3 PHYs for cdns3 controller, it is
better we have a unity API to handle both USB2 and USB3's power, it
could simplify code for error handling and further power management
implementation.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/core.c | 44 ++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 19bbb5b7e6b6..bfd09aa98c12 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -384,6 +384,28 @@ static int cdns3_role_set(struct usb_role_switch *sw, enum usb_role role)
 	return ret;
 }
 
+static int cdns3_set_phy_power(struct cdns3 *cdns, bool on)
+{
+	int ret = 0;
+
+	if (on) {
+		ret = phy_power_on(cdns->usb2_phy);
+		if (ret)
+			return ret;
+
+		ret = phy_power_on(cdns->usb3_phy);
+		if (ret) {
+			phy_power_off(cdns->usb2_phy);
+			return ret;
+		}
+	} else {
+		phy_power_off(cdns->usb3_phy);
+		phy_power_off(cdns->usb2_phy);
+	}
+
+	return 0;
+}
+
 /**
  * cdns3_probe - probe for cdns3 core device
  * @pdev: Pointer to cdns3 core platform device
@@ -477,14 +499,10 @@ static int cdns3_probe(struct platform_device *pdev)
 	if (ret)
 		goto err1;
 
-	ret = phy_power_on(cdns->usb2_phy);
+	ret = cdns3_set_phy_power(cdns, true);
 	if (ret)
 		goto err2;
 
-	ret = phy_power_on(cdns->usb3_phy);
-	if (ret)
-		goto err3;
-
 	sw_desc.set = cdns3_role_set;
 	sw_desc.get = cdns3_role_get;
 	sw_desc.allow_userspace_control = true;
@@ -496,16 +514,16 @@ static int cdns3_probe(struct platform_device *pdev)
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
@@ -522,14 +540,11 @@ static int cdns3_probe(struct platform_device *pdev)
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
+	cdns3_set_phy_power(cdns, false);
 err2:
 	phy_exit(cdns->usb3_phy);
 err1:
@@ -553,8 +568,7 @@ static int cdns3_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(&pdev->dev);
 	cdns3_exit_roles(cdns);
 	usb_role_switch_unregister(cdns->role_sw);
-	phy_power_off(cdns->usb2_phy);
-	phy_power_off(cdns->usb3_phy);
+	cdns3_set_phy_power(cdns, false);
 	phy_exit(cdns->usb2_phy);
 	phy_exit(cdns->usb3_phy);
 	return 0;
-- 
2.17.1

