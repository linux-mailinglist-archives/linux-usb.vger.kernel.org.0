Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D75B223EAA4
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 11:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgHGJm4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Aug 2020 05:42:56 -0400
Received: from mail-eopbgr50089.outbound.protection.outlook.com ([40.107.5.89]:59671
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727081AbgHGJmx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Aug 2020 05:42:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIgZT8oCsIeNxNhdB14g3W+J8K02u6uCs6jbyRSq5cbov27EWPy9b6xMsOMeiHbZXKwjNoPUwMI3y3FC12kIyqbeyEaF5f30wTG+/URtmAMR+SsE0USDT0ab565Vpa04Ne7QT8kSIdRYFQPKNfnctbhfINL1ZaKImnoQT3s+gCz3na2z9zlTRXQ4sCR+/X5elOiIoMrG40zat2lwuLnAkexZN6iWzmfD2dtLsLZMVoJg976VBprE8Jf2n2FydtZoMEv4FCDT1vSVFPgxJ9BrMmFCVPhVoE69nQv4VuGVbPlbPE2iQ0cIHW1Gd0ZsmrJIG5mkPerD+riMs77s6o8wAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Kb2oQ6FmZWJT3Kyxb0WYbD5576GuZnueYOFhN37au4=;
 b=DiNzyGqrRtFlIkM6k+F5a8W1ZpeXg/aUSH1hjodJA7+Yo2b786Ir6fR65MnRIETyTMbAEk+BO6l7+r1PbsmMcUWU5Ew4HDhPXl9Zy4xZaMC2kU959yhp/8iRLf8dT3Atcq91/XHQ/KyTV0C4T15waIQTodQZbM1h0tgswTBCIvSHpiR7VEFZ71udCpuSOwhHrb9mYGbusH666h2QZPeImat1sjiD2/qnINjsfmwCx4OJBRgrslGp0Xq+ie9FObmnEwVDcstVEsHY/VH8q6OdOR1DdA4ZVkfSOmeig/voGSO1c2N/y2cuRdu66IqHWnsKYQQD23shRbslOMNRO372pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Kb2oQ6FmZWJT3Kyxb0WYbD5576GuZnueYOFhN37au4=;
 b=MIXPf8wuObbuH9vL28b1dNwpJzzSR5aNdA20FUlPjXIHo0yBGau5TmCZ1LGMbs7pOzHNClbWaqUW66beorN+hKTEfERq89/OpNmLH3ODTajOasI1Kxg5ZlVLttkLEOarZMjqQobmWB6Zx2FyoLWEYkgFJbGbeep6GQ3MgLcNr3w=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:42:49 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:42:49 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 2/6] USB: UDC: net2280: Fix memory leaks
Date:   Fri,  7 Aug 2020 17:41:47 +0800
Message-Id: <20200807094151.13526-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807094151.13526-1-peter.chen@nxp.com>
References: <20200807094151.13526-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.5 via Frontend Transport; Fri, 7 Aug 2020 09:42:47 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56e1fce7-810e-460a-5703-08d83ab63f08
X-MS-TrafficTypeDiagnostic: AM7PR04MB7077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB707789E518980A98D944D8BB8B490@AM7PR04MB7077.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwlUzydVP8YmMOl91RUdjw8b3RQxgBUsZ9DKn+2IxdAPP+tsJvKLH6Bi3LmtI8ZIF22+8jPEB0xttxZ+pnC7oXFyAdlqQFF+DfvYxy220+y0gB6GXpZsB1q81+zw+r4I/wMVe/fcGyXb8JDaKfRbvJao4FftVFobLpavg+5Fbot8Gq8PWAcjNcL5uW85bmSkCO3wwVABFodfwhXzJ3Y2UI88xESvd7WFhHrLhgrSkvfRDGGov56Sl/GY910xWXwxM3FNwCBaRSKbJ0Jk/alSnnPap/PIQUSON7kqm2I4M8HMr/zoHvlJE15s4TGNwnut+3ZPCgYO5eWFqa0eadgGOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(956004)(2616005)(5660300002)(86362001)(16526019)(44832011)(6486002)(186003)(66556008)(66946007)(4326008)(6512007)(26005)(52116002)(8676002)(83380400001)(1076003)(66476007)(36756003)(8936002)(478600001)(6916009)(316002)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Fs4FgDvdM5kmkDiRw9XEn3/RupWyXbS9t6EC1pBPqzltluC24o9XS57OS5Sn0Cx7+FvY5Bv3HD8FjuFYpk+yUCIY02xMG4foJ6KsbiERQn9DxNlvzCYR7bhwNIlIg2GQEJ+E/R9lFIOPXtcxkW0ZJSV4zRYdGV4U24/aBbC/We2OLvyDmhaP2FeTA2QAmxrim7R6OzVrsmLiSIwcY4dnIiy/3DuRjxvV4jHUbU7U7OC1G3tWMMQUsYGpIYCzV6/I80VX0bqDyCot83VuFnXHFR6Y+fYpbijQhNOeCHegE56TLqC4xltYzs2QdSm1m1PDkwo5JgHMT7Q0KZM88aoIXzEgHLhOvZaVP+i2nv4bWJOWQQcoSX5dnSfr34k6gyUfhcncuy1asAj9xZrf4LCc3ZN44vZq6IZrXqSbmdcptpfQ2y2xq/422XReuBEUL6iZvNehuPklIKCa49HjBV9nhl/Vgt+Q+AuVmJTkmvam6+ulIV0etb8re1A6PvWzTdTfAq+OIE/acnyN+jG17P+n82yIgUDMe8A9Ug6158a15yswbTJCx7vk8OaG8LEuqpUoVnWksC6UzVYNBfWwpaTb4eAMHNv6CVafOWbUUUDALcPy2b+rvYrbejDe4BgNjkkrT3hbovnqvW8NkDkLmbviZw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e1fce7-810e-460a-5703-08d83ab63f08
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:42:49.0707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdyLFl1qIPcGh1/79qyVShwoAKtwh+G9djiTZDrEC6qf2KYoABR/zYcCP15yIUaqPhkD6yAjIPi4tmJCPfo3jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
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
Changes from RFC:
- Using usb_gadget structure to get net2280 private data, and
update commit log accoringly.

 drivers/usb/gadget/udc/net2280.c | 13 +++++++++----
 drivers/usb/gadget/udc/net2280.h |  1 +
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
index 5eff85eeaa5a..0b449f4c2da0 100644
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

