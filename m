Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4030E1DFBB3
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 01:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388117AbgEWXXC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 19:23:02 -0400
Received: from mail-eopbgr00066.outbound.protection.outlook.com ([40.107.0.66]:23517
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388047AbgEWXXC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 May 2020 19:23:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eP87jLrlqo1ZZ1bGLkyJONyrpD768DDHuneA2B7tGB0QVZpWYM4sI9PCNC4As4azI/5rVbfaKJVoM5RdbjVLkSMviUIQfBRp0Lrj6uHmz9cd1p5dKrB4sd2cN0Nw/nYEtw8IpAhK6Wz/MKBznAfCWAOAOjvMGSbJ8ysFVhUfQ3TAzhlteRDtIB+GutDbCl+1F+8lWH6pNvgB42Pcg5FWd0xdtCRG5g0ueb/xGRaFHQpsIXGDwIW5xBPx4ANKhVtgmcBXm4veTeTFjRyw3A5kDMcIi1Lo7MP2f56833JByi7I5edvCSwfBQMnD33hmALjlHvVHPec+aAOH8osQENzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0G8Zb6XJUTT773hqb6jhHN4QNVRflHkt6ARwDkUeTE=;
 b=kzvV/Ion3j2tioMLb5HTGUBVDK73tzxrJC0yLa+TvmVyoDIPActYl98/X4e3GZ6Gj2XldPoOKz/7HnDVPsK5D1QRx3pv7916rwEPdfMVsCgPN3v05GuQ1AyohmRmbGdlFNBRFRIXZYTqwa5D5A0GFmP6hCBKQswLfUVYzC/LrHx90jbngBM27A0M0MaDUa9mgrplyhVj9MM5o2sVN2xtpgdgADcc8SloBt7D3Y77t+P10Et2MOwqx7NreQiIxA8hzWK5z42y6L8wZh/p3JPClTsgX81dqodp8gn1+yZjF5s3PcuQ/9a43rfGS+1bdJx1qygi8Da1Ezt0f9H4Mg7zmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0G8Zb6XJUTT773hqb6jhHN4QNVRflHkt6ARwDkUeTE=;
 b=RD8C2IARAFUSSxn7B1lEAgqwaXmtaQGAQrNrkw1LwkdgqwTW2RGU67qDoGWbdaz6duLNMzQJGi91ollccj/gOnLSZzwQi8VBD/Z7wdaEKlQeMCIiBNoTxwlWsm99I3rAJvtsMK66ZEtzTdigydHHVVVGTj7Gq9V35NsNgFHsba0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6918.eurprd04.prod.outlook.com (2603:10a6:20b:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Sat, 23 May
 2020 23:22:55 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Sat, 23 May 2020
 23:22:54 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 1/9] usb: cdns3: introduce cdns3_set_phy_power API
Date:   Sun, 24 May 2020 07:22:56 +0800
Message-Id: <20200523232304.23976-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200523232304.23976-1-peter.chen@nxp.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Sat, 23 May 2020 23:22:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e74fc0a4-3927-4a84-dd3b-08d7ff703891
X-MS-TrafficTypeDiagnostic: AM7PR04MB6918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB691811E56EE922F2BAB28E0E8BB50@AM7PR04MB6918.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0412A98A59
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sGcwVJvipvKbcQGLRuu74tbiCGRQWG3Ig1jyfFX3vXB1zd1K2c3k+4snuhfRbBYQlqbHhyUbXA16E18Nxc3S4H3A4qEiDsasCB/XAYYq1sFY/3BzmBNlNgcaP7PY83TLagwKn9dbDgsVa5gNszg3lI7I5VH8QpTaYlRjzkF7zQhj04hkI+02MHfXhGx5el5xM8hu2c9yDRxduuAuAMs0Q2JTWkn8xupIRH9EE49Vy9wWNl6MQsBnp8dub7AnLsBBBWZeYbvbunsGkqDppLtdDD1PKxIFyP+V+dO2v4/FYLxRxAw1OmGI8lB/sB4y1979H9qAis2oFFPc1oRVH1YpZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(8936002)(2616005)(2906002)(44832011)(186003)(6506007)(8676002)(6486002)(316002)(478600001)(66556008)(36756003)(16526019)(6512007)(52116002)(956004)(66476007)(86362001)(26005)(5660300002)(1076003)(4326008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: RHjJ9xOGv8IAirllFrS4MDnvhamh6klw4yPXL4mIx9NDqASMf3dCZcQVAYVx3yskZLIOajHGGZh7XkEn1UC9F40RE4VHHpkw59Dj0R0b35hlNtuiUOGF6+7g65bfC0kCSQ24l5jgfDHxZWPNyy73JIqFc2G2TRf7S3vQHiy4I/Nlk+UtdznYm5gvHJmZyKWi91zOyqAs/GXCffhKmzZimCBR+SAtttr7PTq8inoks6ZEAnDCLZxm9QMg5eKPcudZyG6Y6blevXyH262JhaQykqGJvoU+k1Znawzqa9jT/qu1H4Jol+bMI2MwD+kDkZlxR18oSxkOspB8x+zyNhnjRgl/u5QCOueBHc4G1ou+mPywYn4y11uiuUx2PmVFeVx1zS/561XgCshOxXBvh1NRMD5S4BblPG7sL3c0e51tkVC4mwuqQc7FeayEzEZy/IOiwscOSoYKoepTWucgKOmGjzBoYNu7aomFD4EmL3YC2ZQ=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74fc0a4-3927-4a84-dd3b-08d7ff703891
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2020 23:22:54.8888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nzob9tai4EX7v/vQQkzWmrWdV7YHOhRmrMdnyouBhFZBW/X6tdIAZ4U/IDHnPfrl57LJIzpNy6lx7iSd7SrA7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since we have both USB2 and USB3 PHYs for cdns3 controller, it is
better we have a unity API to handle both USB2 and USB3's power, it
could simplify code for error handling and further power management
implementation.

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

