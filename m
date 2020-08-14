Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54639244488
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 07:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgHNF2b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 01:28:31 -0400
Received: from mail-eopbgr70054.outbound.protection.outlook.com ([40.107.7.54]:62158
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726541AbgHNF2a (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Aug 2020 01:28:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYej6rOp9DWEurzT69TeTbjbI4YS6M8HwUsuawFUYTZMj11f+fwydlig6CCFqRkfki0NtCr3wuLgB5h+c4BJ06Tn1fPbBEC3ujdlsIAk9beD7FKAvzXMSlNjssoeROQ4sxZ5m8FlsEe+X9Lj7mQXseEMNcNE7qbLazoSTOt0ebkA4o3NH68brn3IfY68JJGm1S83nVeW4scUtoWt2Ks6Jbfza09LbgyEvRr/YPFH5hNw2tPIDoT3v4zTPRJMF3QAtMdmCWUBvWJLvlSC+L13oL+hoIM78B4Boq23/nrmjRYBzHRyFNNI+dsuln1CHE46LUwHQU44i+QciUFm1Qp2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmTvzkZsEdkxuPEDgM0vinIHHtoQSEO1oTCTJRNUW68=;
 b=CR5AwClfczwe/EBfJGuMClBCKi2ccmWW5GVpiI6eMfd56z56Ae6wQ28cmqCzc4JSuGCEN/dQBI3bOrXe/XpbqtpcCn3B1k86ES7Fhz3TrdbDO1mjEeNNdYSrz6gQ5USQPNl3RurizYF1rquQ4V8eZ23nQpCizrMiSvcw8dPmfbDCPkAzTglRoCVm7LhxQPAGy1oEOSIfjlC/2syr0a2bou0T6d2AKJBp9evB4/a/uxBET/Yu2qycAiBIZAuvPYW5WwFJuTXprDym+yFiwLlvd2WTuu06lrDJCTdC1EdDAigWd+Upi+6ejX028O0GKvpPPOzaNH2Ga/qd0oyjfM2LZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmTvzkZsEdkxuPEDgM0vinIHHtoQSEO1oTCTJRNUW68=;
 b=bvfsyet30UNldNWbkemrPtOnazH4pJ5fjUBzQTpVkrxKlUeMigYzd9LT+RwAM288X0Xkv5hS0Q5HOv4TtVnG6ZbeL/nyxOt2xxoBgyoXIh0HAdVCkG0Ly0FH5pNaCtnOIBbgXxmd1ySdREe/zfr3mOCDR4NNUP2bM2lEGveAxTE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB3PR0402MB3641.eurprd04.prod.outlook.com (2603:10a6:8:b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 05:28:13 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3261.025; Fri, 14 Aug 2020
 05:28:13 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: [RESEND PATCH v3 2/6] USB: UDC: net2280: Fix memory leaks
Date:   Fri, 14 Aug 2020 13:26:58 +0800
Message-Id: <20200814052702.22789-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200814052702.22789-1-peter.chen@nxp.com>
References: <20200814052702.22789-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0153.apcprd06.prod.outlook.com
 (2603:1096:1:1f::31) To DB8PR04MB7162.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0153.apcprd06.prod.outlook.com (2603:1096:1:1f::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 05:28:11 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8b05c320-aa1b-4fc6-dd43-08d84012d6dc
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3641:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB36414CCDEFD5EF18BBD88F738B400@DB3PR0402MB3641.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fxTXAB/4XN4dKQU9xhUuHxNWR9Nyt80zTtxsflt+9+CHsyj0YDD7Tw4Ul8SkQKtqa+WIijfdUVR11y9S18aKMf+11ouO32+gV7qvwEYAse/PtsHx0nmZOu3u3u1KisPemNo0beNSLJZDn+bEfEmHixyqajAIasrTzVqr8OecI3aEq2X+hdg05wAW2tdp1UcWLXSF9lEwPulVncNFtnsayLc7BsSkBmi7am9wTf63g7JIdjpX66+RIEm56BilAP4HmI/9Ahebo0TzUOnUQGdfLWpAgPoIB8cpNGJQzqtFJiEcCuWMxtVC/OnVkfj7n5fG5wagcL/XBeAvdRaGBkRPWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(6486002)(36756003)(54906003)(86362001)(6506007)(6916009)(8936002)(2616005)(2906002)(4326008)(316002)(6512007)(8676002)(956004)(6666004)(83380400001)(16526019)(186003)(66476007)(44832011)(5660300002)(66946007)(52116002)(66556008)(478600001)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: xFzMpadNMzyZ6rgqJQHMbKDb7qakhz+fuheuGeLDJPl3QzyhHGTOa7x3GHyRZUPAf2XFDqlI8hydQm0o1mD5qlfamhrAD2iYnLfU+3JyzqkxeO9NdDivRpftFfCbKUhX8t6Fe/xXYINihWbTn5MUxukguWqVpIt8Dndr91/fErxvmvQWxNuw6gPRioqXvZ0JzHH46pAhfJzgdXJClJ0sRVGReKEc2sTXlqjP/pKO4Ssr8JJashhhH6JxlNKxxuxAQsgmDrPzQ/FxszvRa1Ih+5ah0TFk4LWM33S4NUvBIVEAJHLb4EGjdAMKU04/5/8jo7U5OjOmv2LFKjW+g5CNYImEynlxacCSFmAb1wbTfibVwzoyq7dZiWiaXiRMioxsqWaqk6/Lvcn+K2YIUyqd/Ayby/lpWsOeFg2Xg81D7Kcbr+cbTJHiLVZxxCIWRxckrAQ2u9ECm68Om49TFtwSJI/Ft3UBmlEpx1INQlrEhtHUX3eZTtU1/I35ATZId1o0hgmgmDWeVsxzaOQr8QvBAJBn7Mf20lr1XKwO/+vgIpsjzEt6+6AWDyvIyxcbcVq5rToW7f4TzU4BJGElVxjgwGiHarQv2VGX4PfoV85UmuEH8TtxGpr/W0OA6Cf+2hul3geYITzRt//8KUiQ+rdqZA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b05c320-aa1b-4fc6-dd43-08d84012d6dc
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 05:28:13.4150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJ0USpIoMzF7xXk9825JNjW9eWY9mMnocCI/bBdpcAt151ae4Pu2rFDiO5nAwv7wDGxH8w+rKXiFkWuwqV6vnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3641
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alan Stern <stern@rowland.harvard.edu>

As Anton and Evgeny have noted, the net2280 UDC driver has a problem
with leaking memory along some of its failure pathways.  It also has
another problem, not previously noted, in that some of the failure
pathways will call usb_del_gadget_udc() without first calling
usb_add_gadget_udc_release().  And it leaks memory by calling kfree()
when it should call put_device().

Previous attempts to fix the problems have failed because of lack of
support in the UDC core for separately initializing and adding
gadgets, or for separately deleting and freeing gadgets.  The previous
patch in this series adds the necessary support, making it possible to
fix the outstanding problems properly.

This patch adds an "added" flag to the net2280 structure to indicate
whether or not the gadget has been registered (and thus whether or not
to call usb_del_gadget()), and it fixes the deallocation issues by
calling usb_put_gadget() at the appropriate point.

A similar memory leak issue, apparently never before recognized, stems
from the fact that the driver never initializes the drvdata field in
the gadget's embedded struct device!  Evidently this wasn't noticed
because the pointer is only ever used as an argument to kfree(), which
doesn't mind getting called with a NULL pointer. In fact, the drvdata
for gadget device will be written by usb_composite_dev structure if
any gadget class is loaded, so it needs to use usb_gadget structure
to get net2280 private data.

CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Reported-by: Anton Vasilyev <vasilyev@ispras.ru>
Reported-by: Evgeny Novikov <novikov@ispras.ru>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/gadget/udc/net2280.c | 11 +++++++----
 drivers/usb/gadget/udc/net2280.h |  1 +
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
index 7530bd9a08c4..d50bc6e19f2a 100644
--- a/drivers/usb/gadget/udc/net2280.c
+++ b/drivers/usb/gadget/udc/net2280.c
@@ -3561,7 +3561,7 @@ static irqreturn_t net2280_irq(int irq, void *_dev)
 
 static void gadget_release(struct device *_dev)
 {
-	struct net2280	*dev = dev_get_drvdata(_dev);
+	struct net2280	*dev = container_of(_dev, struct net2280, gadget.dev);
 
 	kfree(dev);
 }
@@ -3572,7 +3572,8 @@ static void net2280_remove(struct pci_dev *pdev)
 {
 	struct net2280		*dev = pci_get_drvdata(pdev);
 
-	usb_del_gadget_udc(&dev->gadget);
+	if (dev->added)
+		usb_del_gadget(&dev->gadget);
 
 	BUG_ON(dev->driver);
 
@@ -3603,6 +3604,7 @@ static void net2280_remove(struct pci_dev *pdev)
 	device_remove_file(&pdev->dev, &dev_attr_registers);
 
 	ep_info(dev, "unbind\n");
+	usb_put_gadget(&dev->gadget);
 }
 
 /* wrap this driver around the specified device, but
@@ -3624,6 +3626,7 @@ static int net2280_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 
 	pci_set_drvdata(pdev, dev);
+	usb_initialize_gadget(&pdev->dev, &dev->gadget, gadget_release);
 	spin_lock_init(&dev->lock);
 	dev->quirks = id->driver_data;
 	dev->pdev = pdev;
@@ -3774,10 +3777,10 @@ static int net2280_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (retval)
 		goto done;
 
-	retval = usb_add_gadget_udc_release(&pdev->dev, &dev->gadget,
-			gadget_release);
+	retval = usb_add_gadget(&dev->gadget);
 	if (retval)
 		goto done;
+	dev->added = 1;
 	return 0;
 
 done:
diff --git a/drivers/usb/gadget/udc/net2280.h b/drivers/usb/gadget/udc/net2280.h
index 85d3ca1698ba..7da3dc1e9729 100644
--- a/drivers/usb/gadget/udc/net2280.h
+++ b/drivers/usb/gadget/udc/net2280.h
@@ -156,6 +156,7 @@ struct net2280 {
 					softconnect : 1,
 					got_irq : 1,
 					region:1,
+					added:1,
 					u1_enable:1,
 					u2_enable:1,
 					ltm_enable:1,
-- 
2.17.1

