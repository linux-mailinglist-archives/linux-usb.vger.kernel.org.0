Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762B52432AF
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 05:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgHMDVO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 23:21:14 -0400
Received: from mail-eopbgr150075.outbound.protection.outlook.com ([40.107.15.75]:52133
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726131AbgHMDVN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 23:21:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwEYyDa/NFBTJbPJAiHd4gUVj90jVtuAeTu+NPA2plw/CjKDidUE796/b6kkKBn2NNX+jMGYO16Jpu0IhIB/N4Qim+e8GKfS7JSG5WyC2JLcoBFwpJ8jOQwYoV6OJHIflhM9GNvYY7oPuL9oERibD/h3T/0+N/lP2GucanzACjvVYR8X+VKqoQyDvx67Vk4O8ew8IzDBtu+sm0VoUIaaamKYgluN0jmymj8Nu8IXytvNtzmacl/X5NyxuCsVRAK0bx22SfRHJCwcNtqsjaWbMVRK6Do2vElKyZ/xG4NkVwLmu3n6bmNDEb2S+dvtY9ZfJ0XEemlK+PRf7Kb03vJLow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ix2gUG0fqg9Kdg7/yV73NwSVsVephgDfBik1AQBQocQ=;
 b=QShNQSus1LSTmXkwgsnDGWQTCztQ9xCz8o+4RqP6OgT8GizWqywpFIV4taaAr1J8ynM6TMNfWBYGa3GI2ikrkct1u8Lc7yUwAtrQ7QdbrctyEDf5aWhJFm+GK0NCoU3a2hgiz0RSxs4woPJr7kgF10ZXd3SfXFcQ4okDzy5nfy44dy1ln9PrHd5K6HFiMu4TVhuYs8YqyOSyl+xS1q6NIFxZx7XyLZ6SylSeQSq1PV24EhcsC04E6UMQ/GvV6Oo4vLa9+TusIussKwEvUMZJqXGL+5mMgRXlRUgieKZcMa3nqA1qjuMbp63ZPGhyfaJI4Hd0YpqVNWrvIFLx0qnOnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ix2gUG0fqg9Kdg7/yV73NwSVsVephgDfBik1AQBQocQ=;
 b=Z47HBUnyiwtfIxIjwnvExszLoAWACdwRLOpT4EUswe/xN0qRGH6zYpf3lTq4WvBRlAhB75EVTRUN2pnP8OEGsj/iK9G/hVaoIMoQU3TU6sMISUt0rXiDfxn9jb5ROTxrDodSEZv0LxAZ3e1WFPLkvBym2gW7ZEmSQpnai1m4O/c=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5911.eurprd04.prod.outlook.com (2603:10a6:20b:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 13 Aug
 2020 03:21:04 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 03:21:04 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 4/6] usb: cdns3: gadget: fix possible memory leak
Date:   Thu, 13 Aug 2020 11:19:51 +0800
Message-Id: <20200813031953.13676-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813031953.13676-1-peter.chen@nxp.com>
References: <20200813031953.13676-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 03:21:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 85d1ab12-d352-4985-7885-08d83f37e978
X-MS-TrafficTypeDiagnostic: AM6PR04MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB59119D92C34E1B96714187BC8B430@AM6PR04MB5911.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a1Y3Lp6SrGJb0R/yHOSq7bYkk5IgSdlP0rBzuMS+QxlsiAkEcHt4G04Y+GgnPWYGUtxkr1hGrVCm/q/2VhFpdREoguEbVLV3UO+ZGPi1aNDHstZz2S1QR0JqDMUjotDFjzwv0luJP2EPWtoyrjfqCfO3ghp4PQLvRDgnnVbWEMaYXifVUbXRPasnKR4cY9Q4mCJjQTjsowLOt6ljGuGs7No59uaCYANAVQ0gzf3gRwqThZnSdXI3YDldUH8VxDAiPwk2p7jKYBUi7n0Jl2FFU8BjHlNtftQyuUwZlElGRNp4bWnONNiegxJinSONm+Q+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(66946007)(316002)(66476007)(186003)(6666004)(66556008)(16526019)(44832011)(956004)(26005)(2616005)(6512007)(1076003)(8936002)(52116002)(6506007)(4326008)(86362001)(6916009)(2906002)(6486002)(5660300002)(478600001)(36756003)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: V0GPVlCZiH5H0WM+7mwYiCMHGkzdH3ikUkvwPpNe/UIIFPuUPSCpjc7HNvYpAn9TtFEYciZSOiWQRhddmhSaSdlga3JFiyDLd1/kt9ViPbks+YPZZVQCRFB4tA0C+d1cXoH+VruVvc5bVtlSBMHEeeHwHvFZ/gU0ddz9bkKve15fJu+3nSmmRPnT3d/CL+q5pg002RIu5Wa+6sd0hRb8cik3NlcebelMRdyxqWbVrBj660URzbDSAxb5y3ldZRSrN7ZKG8/NqY++Ij1vjVSy/KvICTOWc+A7FK/4jG7EeTJ4ADhU/oTe893K9TyjUfPM+ko8vUZcvOtJhojYj+UuBNvjKWBScdkJSngY0I6NLrcdovFJSkv6VS7aIzZTTUpn3WO+cw3sWYdI5rFX6XO9Mj9+16WFLan6QzgvO6ymlBTP7fP9mdDculW39N31mHAf8cClYgQMmEVSoRXmyxeE0/3T4HQhDcxkbRvq45nxlnH9/pzIum880ElvzDed0LBmSSTBVEnkKVVzqf9meEjO1VGk6JOy2eQUr0sqDUcd5EE3UCHewzDzAmNuge4G/clx/bXQW4elEQlSNYFQtoeajlj7vRE7geVxZCjevIxnY0TUI8KVSGS8EgKJrY3IM/xGTBTEN37xAlC1J2WMmIfeOA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d1ab12-d352-4985-7885-08d83f37e978
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 03:21:04.7285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agNGupX99mZ8KMfjH5Mzdk0kPB/JFntql+cncF6nT8oAWlfpCbE7FeYS43/T9dCRLxT/Di0CKuYsyKh4+gZ4lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5911
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
 drivers/usb/cdns3/gadget.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 8bbb38cd560b..382da6667442 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -2988,6 +2988,15 @@ static int cdns3_init_eps(struct cdns3_device *priv_dev)
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
@@ -2999,7 +3008,7 @@ void cdns3_gadget_exit(struct cdns3 *cdns)
 	pm_runtime_mark_last_busy(cdns->dev);
 	pm_runtime_put_autosuspend(cdns->dev);
 
-	usb_del_gadget_udc(&priv_dev->gadget);
+	usb_del_gadget(&priv_dev->gadget);
 
 	cdns3_free_all_eps(priv_dev);
 
@@ -3019,7 +3028,7 @@ void cdns3_gadget_exit(struct cdns3 *cdns)
 			  priv_dev->setup_dma);
 
 	kfree(priv_dev->zlp_buf);
-	kfree(priv_dev);
+	usb_put_gadget(&priv_dev->gadget);
 	cdns->gadget_dev = NULL;
 	cdns3_drd_gadget_off(cdns);
 }
@@ -3034,6 +3043,8 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 	if (!priv_dev)
 		return -ENOMEM;
 
+	usb_initialize_gadget(cdns->dev, &priv_dev->gadget,
+			cdns3_gadget_release);
 	cdns->gadget_dev = priv_dev;
 	priv_dev->sysdev = cdns->dev;
 	priv_dev->dev = cdns->dev;
@@ -3121,10 +3132,9 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
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
 
@@ -3137,6 +3147,7 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 err2:
 	cdns3_free_all_eps(priv_dev);
 err1:
+	usb_put_gadget(&priv_dev->gadget);
 	cdns->gadget_dev = NULL;
 	return ret;
 }
-- 
2.17.1

