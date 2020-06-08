Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920F71F1340
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 09:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728964AbgFHHKr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 03:10:47 -0400
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:14272
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728885AbgFHHKq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 03:10:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V32/bOxdYGY64oIDDg57IjKdlrc/vJ3b1Q2vKMr7Id9WkfT8JL/y6dAAyW2LmjloG+bbxREW6jPW36Tn2c54U7yK9+pC9D/o0cvOnK9nvzfOosJqjUZG96vY5yILn/EjlB7rji3zbaz6XKHlQ+m8YbHelKnVu8mx+qGXhOnsmtNWuKMu/6P47rX29sz0PCL0AW+WPGf7qCENd77kpAfTk5D50Ql7goZq9GV9GpsRKsdja65EzX6+LAVSvx5GFFtTmX05FzJC7y0ozXYbfnrT7s48Gjv9GZfCch/EDLdYKIoa1gtRjFf2raqc37MdZFu8rBXoCqjsLRkg+89SjMcnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iBh9S1En+jgXFDcmC1n8n5luYN3vZHkUBV6VM5gTpg=;
 b=HaFJiI3+Q9pBtpHTIxLSHrAQ7K8hI4tH/jIKAdbKT253GlrJyryZhVwyzDkuj5s+w0CeF7hiNtL7zONxoUnblvar+UEpfoYZ/AFglBY+XWgilJfcK46KPbCeOPz+DM5SY4xgiMMC8niSr2i4r81ZDYQ7kiLA/CZBuQtn51yaEgCJYUAwnLOPoRSUEfoe98W83q4HxmRwMOI1t90MnIpjLC/Y6pBIAsmCJDtXLQE3SIuU3p5urv4v97YP/1HVnwYzHpbWZ7+M/D1sWRRGZ6HDXSpkkR1OSCnizRpmZGLKg+z3PgD+W2srSzKOEeQvZ4vWOlSXGgGMt2bJjsNr6ox8rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iBh9S1En+jgXFDcmC1n8n5luYN3vZHkUBV6VM5gTpg=;
 b=ocJC0IaLNl6J85SeJhGDP+ufJLt2XtHv4q0dDw19NDDODhe/0lNSykT50loc/7r5YhmGG0elK4yb/W1jcv+Kq4EcuFgxCDu8RcZxqAApbbJbKEZd/YKP5zlXgFx5hbtex9ogHU0e4IkcaRJZFxcJ/w9erpa0TGf1ubk3cOmr2HE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 07:10:42 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 07:10:42 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 1/9] usb: cdns3: introduce cdns3_set_phy_power API
Date:   Mon,  8 Jun 2020 15:10:44 +0800
Message-Id: <20200608071052.8929-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608071052.8929-1-peter.chen@nxp.com>
References: <20200608071052.8929-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 07:10:40 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d488a2ef-c7e8-4edf-ec1c-08d80b7b0e93
X-MS-TrafficTypeDiagnostic: AM7PR04MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6870222F6B9B5138437EDF048B850@AM7PR04MB6870.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S5IYHUtVYrbPe3RLI01q7/yszbkKO06IgsY1LiEzlcy51DQmgGvQRuZTc3EQNQ3PDNSwucL94LPLiGIT3K4A7LlzBfAsEdwSjJhWSsWaNQbd4NtHI6lJP4JWWb0rX9pfDn9YKEbsQR4xH0mlMLgDha1fzK4SI5licJFqXLD+8Rk8Zj3aViLTp2S1NupBAXbaay5LIkLhD56ckr6A5cm3bARiGdTatCIPe99OQp4pY6kfLDRZe+78VqoUkTIWPTh6e7xf1XqNsWak8SuXkoQ2jFUqCXraLNhZbJssIEMqjR3C8Wadf96SBEVNp83c0Gi9/WGSkBN5+jyKFFduaXU5Rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(1076003)(6512007)(66946007)(44832011)(5660300002)(8936002)(66476007)(66556008)(8676002)(16526019)(186003)(956004)(2616005)(26005)(6506007)(86362001)(6486002)(316002)(2906002)(83380400001)(4326008)(478600001)(36756003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: sQLuIJ4+dA3ugzj90ghsokGNWBZSJFw/He/ejmuDN23e+zYSkmgDG3BFvAlYBXhroelIs7SSlAIJtssV/PonF7lxxxj5U9EXc21FU9vfJlh/JaD81oeuqT9DGRYyR0lT/1YBh0o5O8MwSHfHYGBd4DNkzMoLyPbUL0TwogaTcwpwsSAVwvFM0KOWt8XufWBRJJcsbqh7dRbFQSGeIcVgKqOQU4E6AfH6c2+AVXFv0UXcMFzyMXV3FWScIwNQzkPUObbKAis9LQkunPYxstbTR1uFrnVeFRH7cuwXN9r95YLzsntIsopRUPTYtXa/JK0AO69tdI8Flc1QUHyrumbUNW8zGb2o/JrfZgKloM68o8rX0u9GyNUwN553DBTtjaD9nDPldrMMWtSTe4ZELztgA3kCuETf3cWPwlORkRoMbmekfStnCO1wqYJyCJqZWlJPBii3egveJ7QZ7w1bUZcX+YGv/lL6f8+jQyCp7Rp21RY=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d488a2ef-c7e8-4edf-ec1c-08d80b7b0e93
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 07:10:42.8723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTyX+uyWD1zU6n+sWqMZ/0UVnmYmFIm9SNw7Yr/145hbQCYn7AZyVVjNxd3qfOSc340519Q+5C7hIvOq0Vcm1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
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

