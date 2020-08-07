Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654AB23EAA6
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 11:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgHGJnN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Aug 2020 05:43:13 -0400
Received: from mail-eopbgr50089.outbound.protection.outlook.com ([40.107.5.89]:59671
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727081AbgHGJnN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Aug 2020 05:43:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dcr97cSC7boA3TcRSuRnbwPwszmWVbbr2gTMBSdixVIoUCbolZ0CdM+XA0q8J2DyRvHx9/7L9/3pn3LEQuyrdAqTLqEYlCjU1Tkj8lBEeW8GViturIIXx8etJz2fpjNf6lhO+jA4g2OrHjzSV692wpfN4NSBtY19fzMx0R0Hh5NNG6pnNm3EoEg+Fqr+KGxmOU2TYTZHBInfwBk+H1LdKrcnVrdjyugLAF6ixAsK32lEJv08sQ9fxY74Dp+ICZLRar6610cMKfrz+RtcK58aP9KNwfWWkw63mi6uEUo1QjGJQeEF1MxAbldDwcBWYk76074yGF5XMSfMWdvgUST/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgK/3fQr8NwvRa75TJlO2+NlrExsY07aedE1ptpH0Ts=;
 b=HgUz91mGf8jC3WPTgpx20tAcg8FFqaX9cVDBtmq3qNptN4RBUSARsD0AX2cY3CMCsY4TvENMQeW6vaYUsPfXKvryk8K02emU6B3SilT4xDLb4CPpAU7zjg/blX7ArGUjsxy4hc73GoGf1sSPLGDuKolx1HT6ZTarlnk2YdL/Sf5SBlPqfuMKCR+H7HNV7E6tvNATKXfp39LVx5raQaEvGCxTG0+aaucoMw9Tn3J94rQaMm3BxIMcoy9pErrmf+18cebacYGEG4DZf5rVnizpanSpO4wDX863KLc+lFswvaCajnP2V0m/DwqZYPMJZg9R3SJ7MkmE0ZkIDF7KizRIlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgK/3fQr8NwvRa75TJlO2+NlrExsY07aedE1ptpH0Ts=;
 b=gXAyOBvEknf2fRh/t9E6pgRf6+SdmTa9e/pUy1//Draj8adHnUgCZTJlSh3vOCpToSdQj/jBXcbWtvPLZZUTxR4hxe1CYK0m/BhTAvz29OqUhOHZALITkDNdhOUWR++WWp/46FnQspXARBbl+kLmfTikyv1nNUr8Oqzf8Ug9CLw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:42:54 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:42:54 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 4/6] usb: cdns3: gadget: fix possible memory leak
Date:   Fri,  7 Aug 2020 17:41:49 +0800
Message-Id: <20200807094151.13526-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807094151.13526-1-peter.chen@nxp.com>
References: <20200807094151.13526-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.5 via Frontend Transport; Fri, 7 Aug 2020 09:42:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f69c9631-c406-474a-1e38-08d83ab64235
X-MS-TrafficTypeDiagnostic: AM7PR04MB7077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB70777812EE4AA7B5F6438C1C8B490@AM7PR04MB7077.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t+7sA2cM3JBaQef1zdoaw8axeIbSmRqgzogtoQK4tSrEzPAvJ3s1smpe6utPqnKJkV3FCg1WMuDm1PNfv8u5zwQHNPlG+30gY/L4rxbkX00/47LK9Y+ozO/dIT28aMUXu/PMwCRvaTOacJQWIZgdmklAl/hp6lqbz8s9lmPBX3gTo3hNyLSV0appt8sCyjt9TyISqBFYe3J+6VvC7atMJ+ZUpAXgyymCNyCCWxu0sFaGrppG7vcvSQOV10LLnXsDA+8ioqyj7mA7a0rkeGW5DZg6xsQALon0PaK7SZr7lfwdt2/DnG7O6IZ78F+hnDV7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(956004)(2616005)(5660300002)(86362001)(16526019)(44832011)(6486002)(6666004)(186003)(66556008)(66946007)(4326008)(6512007)(26005)(52116002)(8676002)(83380400001)(1076003)(66476007)(36756003)(8936002)(478600001)(6916009)(316002)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 0bnolqQbqCqqAH0di6OKlwVO42UMRzsiuLQw+oAMN8zfG3oi+3ytlVxEgxkg9qrisLSJHll6YDEZAI2uL73tR6n9SeS1ulP1iN2NdK9NYMPHm7dNPuKBoTAqiAKFON9VIQLSTaEz5bnq5pQq8M2rPPlGWEgTBZl5yJ5uNV0umrzlPBFIG6Q+ArAEUiaaxAejx5izCi5/emUsX3LQFn81cRAwa8zclvvkj0+58CiM2FlVlFmwKJwuAjJShp3VkmB9z4psZTWMu03vKvFY+J5W+FShI9DpBvOAx0QIaZljz0Y5iTWKAcXTp253iUzjK3fQto0uvARYGGZ3G9rLHpmjX+VEmBrN0zO/10MGJa24EpSnIYgyYKWqz51p5MhCHUnU6GU6PQRBEfTj7oWQC4nwUVLi4un7nxZLZd8sxSM41Tss/j8+AQPGC4w8zaVRzEHuW2br612n3TFp4qRGcLu1bNBNNJOQmXD2euxhcIqU3bexZwEhXOD/zlc5R0UGIcbcCZTqL4MI0ukTBVsvbZVus+FoNrf8gydcmgeZ1Aiff3eNnmu1aZjVsUP2nqEALi6sz0tCoTnV3kLgo4BHRTL/V8K6K3ktYGUfedp39n3DzNSwVwGm5uXKLRoHNlnyig/f+EqlgaNjSWW5gj2w2l4Vfw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f69c9631-c406-474a-1e38-08d83ab64235
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:42:54.3824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHPZEa+862q7KiTbsBaQYCMqMmkpv1W1L+V0/72LOJGkW0Gulqj7bzsKxBfxdVOYPOOkySSNTL9pKOtwrcssjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
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

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 814338476a2d..924f2bd3d40c 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -3043,6 +3043,15 @@ static int cdns3_init_eps(struct cdns3_device *priv_dev)
 	return -ENOMEM;
 }
 
+static void cdns3_gadget_release(struct device *dev)
+{
+	struct usb_gadget *gadget = container_of(dev, struct usb_gadget, dev);
+	struct cdns3_device *priv_dev = container_of(gadget,
+			struct cdns3_device, gadget);
+
+	kfree(priv_dev);
+}
+
 void cdns3_gadget_exit(struct cdns3 *cdns)
 {
 	struct cdns3_device *priv_dev;
@@ -3054,7 +3063,7 @@ void cdns3_gadget_exit(struct cdns3 *cdns)
 	pm_runtime_mark_last_busy(cdns->dev);
 	pm_runtime_put_autosuspend(cdns->dev);
 
-	usb_del_gadget_udc(&priv_dev->gadget);
+	usb_del_gadget(&priv_dev->gadget);
 
 	cdns3_free_all_eps(priv_dev);
 
@@ -3074,7 +3083,7 @@ void cdns3_gadget_exit(struct cdns3 *cdns)
 			  priv_dev->setup_dma);
 
 	kfree(priv_dev->zlp_buf);
-	kfree(priv_dev);
+	usb_put_gadget(&priv_dev->gadget);
 	cdns->gadget_dev = NULL;
 	cdns3_drd_switch_gadget(cdns, 0);
 }
@@ -3089,6 +3098,8 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 	if (!priv_dev)
 		return -ENOMEM;
 
+	usb_initialize_gadget(cdns->dev, &priv_dev->gadget,
+			cdns3_gadget_release);
 	cdns->gadget_dev = priv_dev;
 	priv_dev->sysdev = cdns->dev;
 	priv_dev->dev = cdns->dev;
@@ -3176,10 +3187,9 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
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
 
@@ -3192,6 +3202,7 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 err2:
 	cdns3_free_all_eps(priv_dev);
 err1:
+	usb_put_gadget(&priv_dev->gadget);
 	cdns->gadget_dev = NULL;
 	return ret;
 }
-- 
2.17.1

