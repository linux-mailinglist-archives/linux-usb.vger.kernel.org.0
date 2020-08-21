Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA61924CAFF
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 04:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgHUCuJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 22:50:09 -0400
Received: from mail-eopbgr70047.outbound.protection.outlook.com ([40.107.7.47]:23846
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726964AbgHUCuF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 22:50:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhCl3OnjnxhCxiFwwdWJvyoJbKrKW+EknheHZwFRudKHhdBNFvGKBtWm26WPqKJ2+sFnC7+b3y9+1AYrE/71GuHjn6h/9UwSOKLGgcstpk3ljcgcSvwV+n7D8lV0S2MwBRrv5JpBod/VT9C6PH/hKManuH70GArJbA9lNjYlBn9/nUmvxO1dopjnKSbS6JEwBMylDIQmG28YjP58W56Us3SgfIlftYl/hA0hjA7kTnmXMGs5kjmyAUTia1y0rzwOZsMDkxFCZvwR7PPx2B1x7Thqx7DupG6zJtQ8qcFx1d9hDRuYCfCQWDoFkx4tBn8+U0nGpURoejeMCKNPIv6Jtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+NF+KVpb6Tagy+/1OlRGAJF84BWrr/x6YkZpUw/59k=;
 b=EMvtDOXXHRss6zPZAqUH03A3WNwN2Do5HyWYBDtMzaVlRRUntGtyi3KJNkrNWuA8pdOkfXicM3AXLksvRNqRGaj5hUgDFgvwYCTB36alIh+K1My59yBTnwkBVAu/vcUU02E5/dXEA6ff5LnxWrX3231zLWhkvBahHdidZf0Jg5b1v6nk5ec9p4Z/KnA2b/tIspjfSc7SZSOwsvtA3e01wvF8o1oh1gZKSGqAQ8ILrsBWytd6sCw602Jz53xHRVhq4tcxvpg3QuFlHRGbJEpkvu9bz/SfmC8P41ZCqe6jzsjHYbsGuzjsaFrYfOaF8h6asPrV/sKHHWvn7rMEaaSbOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+NF+KVpb6Tagy+/1OlRGAJF84BWrr/x6YkZpUw/59k=;
 b=DYoKdLBC/HJC4hgZDlvEJyfz9lIngfNyGBnv9/Jj67kuhA9XM28j1/1WgpmNu/YUEfHOl8QI2n7SALMzJXBLVXS9HR1a1oaRIptD16dPztjUGoqdQdgo2FzQQHCeGCdoHRcaET/bOta6j+YqmTOjo5E6M0sMv3B+13I2TgOJ+kk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB7PR04MB5577.eurprd04.prod.outlook.com (2603:10a6:10:8a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 02:49:58 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 02:49:58 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v6 1/3] usb: cdns3: introduce set_phy_power_on{off} APIs
Date:   Fri, 21 Aug 2020 10:48:34 +0800
Message-Id: <20200821024836.4472-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821024836.4472-1-peter.chen@nxp.com>
References: <20200821024836.4472-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0195.apcprd06.prod.outlook.com (2603:1096:4:1::27)
 To DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0195.apcprd06.prod.outlook.com (2603:1096:4:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:49:54 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 963f6919-b6b0-4a0e-b75c-08d8457ce46b
X-MS-TrafficTypeDiagnostic: DB7PR04MB5577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB557749FFAA08528AD2D35E4C8B5B0@DB7PR04MB5577.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HVtkXewh1KvJ01h8kSQjumeGvA9amxhiy/+k28o2FTD+s98QC0LyJMSGC24he1fipiNQ65A2vpCq8a1aRc+21d/cMmHS8Nou2Q9XLv26ltgRJ37GojGloNIurMKL/MLliKCDa7U2Gx6iH8E+2B77F/ghFAzaT7sW7JC/bjzqG0rOkDCSso77zxtks3qkThgGqMaADPmztAz4lLEoaN6TFBR71YK2itCVuvrlhhEyjyRNjVxVtsDDbDwjzGYjSS82FIXm6lR8e+NfJgHIdhu3aNNcQks4fz42X37t115YuQ1CBPVuZHOkUFdOqHctNyQo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(52116002)(66946007)(2906002)(8676002)(6486002)(4326008)(6506007)(478600001)(316002)(6666004)(44832011)(36756003)(956004)(26005)(66476007)(66556008)(2616005)(8936002)(1076003)(6512007)(5660300002)(6916009)(186003)(83380400001)(86362001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: o6wEgboT1ruwJUlLVBBi04X/eN4CXo5KTAiSoXui7+HefJ0D1eGLfcL8dAK+eX+w1bGVe0qDw31HaLJ8tHYnCqs70K4ZBvDks1+PuYAL/e+4kUIS1XWcYv7Lzii5nIoV/XBWmImXZQt0/PpRQVnOTU3Z4bLrF4pgQSAie5W5CKG1QKc/vjn511nxQJ8Q+bi5+5op9wzH2lQByWo17s1eFRCsMD3cNTC5+Wwh0zs2JaydCAGNtqMx+Ni9PVLBCUX8glyvNCQAzZz7XZmglNfxvSVswDWNu/sm9DBNnxpnA/yNZpul35yN/aBTfkuzcUQywoIxDYzd7GpRqJxU9R01lT5hJVWUbXTR/rni2FCxBm7th5RXM+fCNsW4yFIUAWBEeyGVwD3mqPg9YGtSGmEQNT6D95w+BQKetWf1AkEKpi09LEnod6EmBsEBeOOLTHh+yB9aqlzDOpSS9d7NUht1O+B9uCKoXXkXqWGgA3wbRGEb5sUxPTlfJM3iXymAtDkpCdaCI3yZU7L0yYVsa32OztNTwwDtYARnZkYpGl6dtpmcCgOnAaNauoVNmr/S/gGHoCDI7DSNL6HTdi+VoTg7IAr2wRTcu/sZ5rp8Tulaa+n9QaTwuAfJYduQMPnE/gUOyB9htBIO1A7QKtzp0/gTAg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963f6919-b6b0-4a0e-b75c-08d8457ce46b
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:49:58.5671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tE2UHZqFI1/Ta60Jz++/53r7Jx9hI7Z9mo2TMbgxA7KvYAdQCTUwt9s5LdznFTxxXVY0S/MRpVRWEux13r/E0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5577
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

