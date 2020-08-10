Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC972400CF
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 04:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgHJC0c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Aug 2020 22:26:32 -0400
Received: from mail-eopbgr70080.outbound.protection.outlook.com ([40.107.7.80]:49993
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726439AbgHJC0a (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Aug 2020 22:26:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEteHrgaAOYbeHj7wMm7HQisjlgOiML6bjh0INvBhUl/UWz2474W4Hm0l+cn6sgDXNzVkl4vquODsGsGTF33Y/CLZotoQ7vw9k/vHQ6BmaO1ZZ5eKNx89imu2sikk2n1fZLZCEwLNAZapkabDXOEA2RaUo9gX+jUgtsqLbsKl2W2d20b3ENOAFewTOMWUhUeBcQ1r2iH8ZxTqQwsXVSqfR1pXFVmOPkQkXVG7gCm4m3fKcNmOy+TKKn2fBoK4GhRU2NILLfWcb2kZj1UeC+ftHwTS/96PrU4+hFYvUrH754YlOD6s2cSAmx61Ww1+dvoK/46QDna1NidtSKOQGXFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LadakCicYClT/PEX2BESJbCtQT30Vuhzg3n6kn1u8YM=;
 b=ehC6ka8j5HOnW0oP84cZYU22E7OSZXLTzMiJCv00v+ArOsPp7bAeGprMVRGRQUfkQhWIyGUEc3V/43NQ3a2BZQl+/iXu214HAqVSBSMzWooZYWJo+ii3Wozvgznd0LmSyJOKztP1wQLOpweMWWLzTDvlvRbivDAe/VFr+qZ9yRBZqmMmEZTrDeXeTO0OSR6B+h/G2JqUgoLrMIxFYnHVnVjs1VmJ3HDfxDAfTGWwPpZ/iz/j7aTh7zxmq65bVNUehbi9Q0Ny0h7QFyOKGvTmwGe3cPkH0YglZ2OMMzm7ubnCSdzJMQRksZBZaiLgKWA2UX/Y8cC9pZ9tCR1rHobtww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LadakCicYClT/PEX2BESJbCtQT30Vuhzg3n6kn1u8YM=;
 b=L3rCnSfkTsebrcowmNjgGVENinrESYnErjxBQ5DKaH35Dn6ie3GhfASD2y2I3jo9ukPrT7nfAXTipCiRuzLOsHs45e/DdL6WRB/1FBLsStqgO+1qcHYaBYcvl7cxR3htvkFdABcZzPs+VcOUXDOToe69cQ1msW2meNpeStfj8Mo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 02:26:24 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.023; Mon, 10 Aug 2020
 02:26:24 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 4/6] usb: cdns3: gadget: fix possible memory leak
Date:   Mon, 10 Aug 2020 10:25:08 +0800
Message-Id: <20200810022510.6516-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810022510.6516-1-peter.chen@nxp.com>
References: <20200810022510.6516-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0120.apcprd03.prod.outlook.com (2603:1096:4:91::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.5 via Frontend Transport; Mon, 10 Aug 2020 02:26:22 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7f7599cb-2816-41ac-68b5-08d83cd4c708
X-MS-TrafficTypeDiagnostic: AM7PR04MB7160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7160C029C9E9CC47D081DA078B440@AM7PR04MB7160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1NAHX4zCv6CqzSW5tX66cUU+L5jONxMIfLNfYN2ZV5bALE+PtE2mrEUs3kAvK8irzdwKl0kktB71OoCaSdamZRXed+VHH/SOibcMRxr8CwZY5/7MzGSrLMZL2CeRNQpQQNaYoJhJfKooTU7rHmqvhbPLkyNkklXNnkzgWi8tJY4SGy8nmRTqbMBmNcS8oiTqbwxpzxDe3KjBZiYggnPkqoqnwsZVykU3sJgmWQC3LaJNIxNOqUjUg6Ffho9f5x29mT5Hsw4vWYChQ30pvd6KxDOCwxSkZ+IJy76nvSuLWamkm1m2BGoP+0YGG6+xtnxG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(36756003)(2906002)(86362001)(83380400001)(1076003)(5660300002)(6916009)(6666004)(6506007)(6512007)(44832011)(2616005)(956004)(8676002)(66476007)(8936002)(66946007)(66556008)(478600001)(16526019)(26005)(52116002)(316002)(186003)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: LuGf1Fp62ukE1VW2O61zRA1Bgr8Z+qB6GjfAQnS3sDqBOnMxg4GrQr/cpisSgeqwOaWK6jujUHAQENiMDCi9xwff2PWGuRLqCnBCeHEoW7AG6NhQ3LRSOQL/+aWapjwXZtRmNqk/BSTfVRUImipYQuQT0E5jF6uMv6cfvvhbHoN6/FwH1b4GrPJyMO5+xRwV+x6qELtP/Jx0sPhmo60A9HIVKsHElnE2b7mJGsurRM2em8qpssscuAoYD4LFHIOI6yGmH1sBslTTrDaipLwFihS0mxWc6J1xUlyjn1BFv86N59qQI315aGmMn1vVeA2jB7h5cJhsaZo5Oc7p1htLUDX66WexkphsDNL18yKvgMw8bFQ0TO47zLziBL2Kf6nqZcG1RgSX8vbRu2/Scf5LXQLAVdj+sHO/HOxSM6yytYgcIApxzCtcfSOrf0zs8OXOa127svAdbgkkpx9l/JRjkEx7CZe+i3Lmc6HsAJODYiscVptz8V2hV5iX/vHL7qBICKjzdps/XxpJKvHeaH5is/vNma94ysUOxHicrmVCJzbMx2bd5jMNs+rx9SQflINvlh5YVAsYbXAiCw5Tsqi8qLFVhvsAF+eahUZAM5Zv0YJN6tUgUxYgt5EJdO+xOIZwnh4deSFhFhXyajZWKhiyQg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7599cb-2816-41ac-68b5-08d83cd4c708
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 02:26:24.4478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKUZYAIF/m4uVvEfibV7B8J32mEb+NeHcqlesDLveAFJQ/Wtjdt0aGokkQVIYok4yOPRCW1JgH50rm79ZklhyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If cdns3_gadget_start is failed, it never frees cdns3_device structure.
Meanwhile, there is no release function for gadget device, it causes
there is no sync with driver core.

To fix this, we add release function for gadget device, and free
cdns3_device structure at there. Meanwhile, With the new UDC core
APIs, we could work with driver core better to handle memory leak
issue.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes from v1:
- Simplify the method of get private data pointer at .release function

 drivers/usb/cdns3/gadget.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 814338476a2d..e2925a29bee5 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -3043,6 +3043,14 @@ static int cdns3_init_eps(struct cdns3_device *priv_dev)
 	return -ENOMEM;
 }
 
+static void cdns3_gadget_release(struct device *dev)
+{
+	struct cdns3_device *priv_dev = container_of(dev,
+			struct cdns3_device, gadget.dev);
+
+	kfree(priv_dev);
+}
+
 void cdns3_gadget_exit(struct cdns3 *cdns)
 {
 	struct cdns3_device *priv_dev;
@@ -3054,7 +3062,7 @@ void cdns3_gadget_exit(struct cdns3 *cdns)
 	pm_runtime_mark_last_busy(cdns->dev);
 	pm_runtime_put_autosuspend(cdns->dev);
 
-	usb_del_gadget_udc(&priv_dev->gadget);
+	usb_del_gadget(&priv_dev->gadget);
 
 	cdns3_free_all_eps(priv_dev);
 
@@ -3074,7 +3082,7 @@ void cdns3_gadget_exit(struct cdns3 *cdns)
 			  priv_dev->setup_dma);
 
 	kfree(priv_dev->zlp_buf);
-	kfree(priv_dev);
+	usb_put_gadget(&priv_dev->gadget);
 	cdns->gadget_dev = NULL;
 	cdns3_drd_switch_gadget(cdns, 0);
 }
@@ -3089,6 +3097,8 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 	if (!priv_dev)
 		return -ENOMEM;
 
+	usb_initialize_gadget(cdns->dev, &priv_dev->gadget,
+			cdns3_gadget_release);
 	cdns->gadget_dev = priv_dev;
 	priv_dev->sysdev = cdns->dev;
 	priv_dev->dev = cdns->dev;
@@ -3176,10 +3186,9 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 	}
 
 	/* add USB gadget device */
-	ret = usb_add_gadget_udc(priv_dev->dev, &priv_dev->gadget);
+	ret = usb_add_gadget(&priv_dev->gadget);
 	if (ret < 0) {
-		dev_err(priv_dev->dev,
-			"Failed to register USB device controller\n");
+		dev_err(priv_dev->dev, "Failed to add gadget\n");
 		goto err4;
 	}
 
@@ -3192,6 +3201,7 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 err2:
 	cdns3_free_all_eps(priv_dev);
 err1:
+	usb_put_gadget(&priv_dev->gadget);
 	cdns->gadget_dev = NULL;
 	return ret;
 }
-- 
2.17.1

