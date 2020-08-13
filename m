Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7A42432AD
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 05:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgHMDVF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 23:21:05 -0400
Received: from mail-eopbgr150075.outbound.protection.outlook.com ([40.107.15.75]:52133
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726526AbgHMDVE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 23:21:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fbd0GI5E9TsyHzO+6AUTUh0ScnY+QC/yqnKOohPQVWJDrOGPCRlEbJpiHuDjnoc+Xtc7RAVBNlvD/sf2pm9uHjhXhm4kPo8KRmPVdB8D50TQwl+igv7C9QAesuIuww61S1PS8k1RwdMB/jINhtB8bbGNPSQHWv7p5MdilUZ2B2c7STUJSg+KLHC8R1SaSUUFgEFqdx6OhV1Q5HUGEvRPw6Xnplmk1ZgKSqnG51MyBi8+YriK9P7B/nn8XzmMvKIMjt3Fuw2AhZUwfcilQWbZ50w1s/ZVLY0k3BwZYzeVvHFmbJaqMFJ9oPbvB9LucQbuG+UfmAsvSY3J/yfjqNnErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQIbGsv6KhLrgtwZ3nA81pdzq53viPdys13T8DyBmOo=;
 b=V6brOBKIegI4gYK9y9ClmUdogC9FmwbvyrQuXLKq7TemFIe/CLZ8cSz9iXmRb/0tSX1jdUxb4odheldI91ccihSGmwsfYTZ5kPkd/e8vqgyUlC5VDnCcF/IlBsmRqrjvlX2QKOKvFg4fQe4k9DKP6Nku8PNRGMy+zR+wJbZZ8BDgP2y4f34TKg6Q2hqy9FciHbeGjUAtbrdIo2y8uPJNWePU30cclMkv5MH7V6lrrFzJu3u+rw5adsnLh3SAj1vMWHSix1yT/Z7ekVGfTN0DEv+nhXf6Ldz0CxzvG4KFLw5FwM6LtbBFl369lCUzcttxNO3H/IlTc1T8JG8FCgxCoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQIbGsv6KhLrgtwZ3nA81pdzq53viPdys13T8DyBmOo=;
 b=gZvRWtWCycf/Sd0PpuZ1T4WWosrYmbpxTQALjg1KvjqOeZ42InSXS30MkvuqQasw1eS7gm/Q6mUH+NXM+dKg0zTqkLSNd5Et1oWqsrmE/rPXzCf7gqaytvoxvRpJj3tMke6OQowwb1hRMsWprNgUSkwLpW8PpAiY1K/bbCnm8+8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5911.eurprd04.prod.outlook.com (2603:10a6:20b:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 13 Aug
 2020 03:20:59 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 03:20:59 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v3 2/6] USB: UDC: net2280: Fix memory leaks
Date:   Thu, 13 Aug 2020 11:19:49 +0800
Message-Id: <20200813031953.13676-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813031953.13676-1-peter.chen@nxp.com>
References: <20200813031953.13676-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 03:20:57 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 85cd17f5-f44d-45a2-f051-08d83f37e67a
X-MS-TrafficTypeDiagnostic: AM6PR04MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB59114BCEB6E2E3430F75E18C8B430@AM6PR04MB5911.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HWy/R6Diz120bqP4hLziAkVnv2tuZBg+LfIYwLUfD3hATEnJQvQw6c/mdzZ0MvMFUmDcJqvGBEZBFWL1H0mapOQ3OgKVmBdfBA/Jzhp2MoiiZ7Rz3k8zJm2J2uGDVnmwL8f4OQAiwxUXtqTFfKlE6Fq0aTLf3x2r5iv/e/pwH4acIPqQ0cft2aZOXPxHPx16+zApfgugruq4kpHFULTRmJoaxUHVWKUo4FLywxNg3/47DlH5zOiTHqCNISAUTswEKb/6Ucniyt+0N6IqAA+TK1wcZYI7w/CUzEng71LKZ8cDIg4tGvgAnPZKnB5FrQyUyRfg8uTz+MADixQyqxIPGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(66946007)(316002)(66476007)(186003)(6666004)(66556008)(16526019)(44832011)(956004)(26005)(2616005)(6512007)(1076003)(8936002)(52116002)(6506007)(4326008)(86362001)(6916009)(2906002)(6486002)(5660300002)(478600001)(36756003)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: edQ7rG3gwYaOG70caiObLwvI8o4g+fqMNq/93EUkDn6loP4hy+SXXTDsaKjKG/h/10X8uvTa+nsbwBpDSIDqkk9fhWNkBz8UT8grR4IhuRar5CPE50dgKbp7iVJniibbmp7N30b/BbDMcXgaIhFl6500d0q1kYt5L41SdSvV5Loee3XZ3Zdje+nnyjVYXjrUdH9Gz5l8c2T8HjHDucUeVM9JLEW9jbFb/tJklGx1fMfcHYlwwneo+acbWYyRe83GVpgwFVFv6uLfeMvvJRh5BRbHTMi7hb+50W4k3A+1xcmRwfRiiwpY+XgJN3MSkE60yXIYLA6tMB/V7YU4yqnnIF5dLh1l0d1hfVQOJ3ZvDHc6ryjjgwFv3/cShbk5TU2xsMisod9bezEYQLDOig3S+nfCtlNBnvRRFFG8Yq3bwqvLysuY9XLePf+K9vvdh4kk3BTP6+nNfLD7/qzybUx9DOZ5EUDs9QQtp03Hclh0Mow9PYgtwzvkublLeUpxBUHyTA6Elm2TVjT2NRPMU5cmRHZSc+OR70IRRh4ezOMXzBYQltXh9G/uzHO+/BE+GlrMHwQi0OAgZSjbho8AGWQzPPuBjUJ8Y0hGMqEOQu/W3mXmeOKYTdlx7ngww2UH1ix2JsM/QaZjXKfvAHxUS33oAw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85cd17f5-f44d-45a2-f051-08d83f37e67a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 03:20:59.7125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmvfLfxA/zfBShsCkXaWsyCEesE1Ocs6oQWJ7kFmBXeJKAIBlIbl/YHYZsa5VeWMTIIoM4zkFuVa41yQzLiFzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5911
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
---
 drivers/usb/gadget/udc/net2280.c | 13 +++++++++----
 drivers/usb/gadget/udc/net2280.h |  1 +
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
index 7530bd9a08c4..31e49cc34316 100644
--- a/drivers/usb/gadget/udc/net2280.c
+++ b/drivers/usb/gadget/udc/net2280.c
@@ -3561,7 +3561,9 @@ static irqreturn_t net2280_irq(int irq, void *_dev)
 
 static void gadget_release(struct device *_dev)
 {
-	struct net2280	*dev = dev_get_drvdata(_dev);
+	struct usb_gadget	*gadget = container_of(_dev,
+					struct usb_gadget, dev);
+	struct net2280	*dev = container_of(gadget, struct net2280, gadget);
 
 	kfree(dev);
 }
@@ -3572,7 +3574,8 @@ static void net2280_remove(struct pci_dev *pdev)
 {
 	struct net2280		*dev = pci_get_drvdata(pdev);
 
-	usb_del_gadget_udc(&dev->gadget);
+	if (dev->added)
+		usb_del_gadget(&dev->gadget);
 
 	BUG_ON(dev->driver);
 
@@ -3603,6 +3606,7 @@ static void net2280_remove(struct pci_dev *pdev)
 	device_remove_file(&pdev->dev, &dev_attr_registers);
 
 	ep_info(dev, "unbind\n");
+	usb_put_gadget(&dev->gadget);
 }
 
 /* wrap this driver around the specified device, but
@@ -3624,6 +3628,7 @@ static int net2280_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 
 	pci_set_drvdata(pdev, dev);
+	usb_initialize_gadget(&pdev->dev, &dev->gadget, gadget_release);
 	spin_lock_init(&dev->lock);
 	dev->quirks = id->driver_data;
 	dev->pdev = pdev;
@@ -3774,10 +3779,10 @@ static int net2280_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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

