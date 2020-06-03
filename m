Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34CEC1EC9C2
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 08:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbgFCGxu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jun 2020 02:53:50 -0400
Received: from mail-eopbgr20059.outbound.protection.outlook.com ([40.107.2.59]:50492
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725275AbgFCGxu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jun 2020 02:53:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REGbn3Y7mFnkAzXRCJyFIxSNd8t6FTBYQYl5Qmmt20H+h4gZ7+tib1j/2LEZlIU6KGVOKgwUpM3EAdmX0XpiFAMILm2o5N0dkToPcdVeU737pvOFHjsFIlJ071mYa130ruH2j3tzK5n6EzHDGPvA1/HTtfA2GGXjmK9IUnYw90ATXNVmchVco4AA/bunmdLIlMAp2TscUMY+ySSpRq1J8p/ZLiRKvFATXq6VKPk0p2mNChrTgWrXMueVjiPhcoF22zBz5mn4f6cq4zvn//BmnMxBzh8W5VVtSJ7zGmvMIpfFoQTiKrXEyXYIhI+0dIssUVQgYUmZxypDv/ukrnUUGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRwmwKfh+NLV93fo0B0hXgV5iLOJ/3YZdq9lRNN/2s0=;
 b=JlUJM5uyEvEpWo8MzpVc06Hg6FSJJ30GLSjXMF2474rTnVPX1xtL5oP6X+iFP8F2Xshn6NY87G2tPMsev+ggb2dbxwnU9aVUKbkBvl87qNLO81smFz++VDwrortH+A/1O8algQyUP3jApESXTX/y2DDjTrxY+y8Zao03QuHM3MEKIehVMAOFeTqHocnwTyi8DR6NHVDLCwyq7Psm5W7Btvutjra7ZnbXir6Qr05WuIgzfrYst7+TYWkGy+1x1v6Ftc5yUpvOlLXy6z28o0TvXaP+LbfZtSbv5jtMuaD3dk+eFRWU3m9P2A+As6SPAl0e20+Eyv4zKEzmYW+bfJI+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRwmwKfh+NLV93fo0B0hXgV5iLOJ/3YZdq9lRNN/2s0=;
 b=XBfefcEW4dqJ32CbSv0KyLQK7/ht2vWVc9B7DGOIKOlGgqqgZSNCeTcs5vUpGdI5YNkKOMOnzIPO2p2+3oRR2B7raRAsAoPRmylsglVaFUreA3y0oj1QEBTRq00Ma5YPKnU7m3cVhVwsP9TXbQbO4R+6Uw2POqlCdWGCaGIbrDE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6824.eurprd04.prod.outlook.com (2603:10a6:20b:10e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Wed, 3 Jun
 2020 06:53:46 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 06:53:46 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/3] usb: cdns3: ep0: fix some endian issues
Date:   Wed,  3 Jun 2020 14:53:54 +0800
Message-Id: <20200603065356.14124-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200603065356.14124-1-peter.chen@nxp.com>
References: <20200603065356.14124-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Wed, 3 Jun 2020 06:53:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c911c561-6984-46e5-cd43-08d8078adccb
X-MS-TrafficTypeDiagnostic: AM7PR04MB6824:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB68248D212D933B051DC26C508B880@AM7PR04MB6824.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OtrakbbgEn/zRjq0NlEzKhGQsd3ey98dT8PROjUYrzlrLyBFb4DK12WYMggkLSVzFAbF/+BteUPxNNR2o0e5595Uj4FFaNPSFBwXqYy3KgolNIuQhXkIdTbi+Y+POSvFbigM6TnKp0MZJSEkWashpmQeTeMYgfaYaGQHjJIMxPS7BePL1PKd/3f4gpyGy18mbQ/N8fNZ9WijJk+QviJcLPWVrwKckFvex3Y7qx8MsqTnpJgs0yGSlWmemve3sAuxZAZht8+QWQF2/PZx/xzyJgphdi6ds0KXe6mELwvhwkSc0vHyN/aWtLd7CZ9Vv139gDrZDhncV1yRRZ5XZySyYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(478600001)(16526019)(8936002)(6512007)(6916009)(316002)(8676002)(956004)(2616005)(52116002)(6506007)(186003)(6486002)(4326008)(44832011)(26005)(2906002)(1076003)(6666004)(86362001)(83380400001)(5660300002)(66946007)(66476007)(66556008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 7sxtVxs3As0hMY4J39gN6wjHQiWPQbpc00A6hmdkSZQzstH1t/+S1Fcc4gy/8gbYvXyRozhxG+Rfyhos+GihmyzuZW03VOifftoCgQnJcOGQW81rH9EHcBmKpF93P6x8AqtVHxR8Am40fKXtXs1i5LFByMsN8hBWeovnbcD+SvRsBi37MBOYdZmKbEdcTvq1WbB2XUaCg36YanYGmgCWV+ZaCz/x5d1nwrm8kZohfuP4Kwkyz44Qv5DiyYE5CT1I9AoaGMTD4HI8IIpHVfIgsIW7lcnXCIqv/nvpOno6ur6ylgIbKL94vVnfJxaFvfh4UD3o5g8AFbvgG7fznFQZK1hg+4/UPG2b1qYWtEMpMyyFfsMk4H6cWTeGQj0edAGaxRbnbpDXaT7T6iAYno/N3Ilc2dbiab+oCVaGg5jyNi8RmqlJl6bU1POQpJd+9jyGtxCUZWmwYr4Cq/OWKVsFdc0+DjCYleTRHuxBMlrkfms=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c911c561-6984-46e5-cd43-08d8078adccb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 06:53:46.7117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSBWnCcqA1C8qQQEsTnaiRtNbeKCq4KnknCR43Mi/ZVZxNcS2EL5p8lyWQH5ypOovGzDCO9YLABFLhJ07k8L2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6824
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is found by sparse.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/ep0.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
index 82645a2a0f52..2465a84e8fee 100644
--- a/drivers/usb/cdns3/ep0.c
+++ b/drivers/usb/cdns3/ep0.c
@@ -37,18 +37,18 @@ static void cdns3_ep0_run_transfer(struct cdns3_device *priv_dev,
 	struct cdns3_usb_regs __iomem *regs = priv_dev->regs;
 	struct cdns3_endpoint *priv_ep = priv_dev->eps[0];
 
-	priv_ep->trb_pool[0].buffer = TRB_BUFFER(dma_addr);
-	priv_ep->trb_pool[0].length = TRB_LEN(length);
+	priv_ep->trb_pool[0].buffer = cpu_to_le32(TRB_BUFFER(dma_addr));
+	priv_ep->trb_pool[0].length = cpu_to_le32(TRB_LEN(length));
 
 	if (zlp) {
-		priv_ep->trb_pool[0].control = TRB_CYCLE | TRB_TYPE(TRB_NORMAL);
-		priv_ep->trb_pool[1].buffer = TRB_BUFFER(dma_addr);
-		priv_ep->trb_pool[1].length = TRB_LEN(0);
-		priv_ep->trb_pool[1].control = TRB_CYCLE | TRB_IOC |
-		    TRB_TYPE(TRB_NORMAL);
+		priv_ep->trb_pool[0].control = cpu_to_le32(TRB_CYCLE | TRB_TYPE(TRB_NORMAL));
+		priv_ep->trb_pool[1].buffer = cpu_to_le32(TRB_BUFFER(dma_addr));
+		priv_ep->trb_pool[1].length = cpu_to_le32(TRB_LEN(0));
+		priv_ep->trb_pool[1].control = cpu_to_le32(TRB_CYCLE | TRB_IOC |
+		    TRB_TYPE(TRB_NORMAL));
 	} else {
-		priv_ep->trb_pool[0].control = TRB_CYCLE | TRB_IOC |
-		    TRB_TYPE(TRB_NORMAL);
+		priv_ep->trb_pool[0].control = cpu_to_le32(TRB_CYCLE | TRB_IOC |
+		    TRB_TYPE(TRB_NORMAL));
 		priv_ep->trb_pool[1].control = 0;
 	}
 
@@ -264,11 +264,11 @@ static int cdns3_req_ep0_get_status(struct cdns3_device *priv_dev,
 	case USB_RECIP_INTERFACE:
 		return cdns3_ep0_delegate_req(priv_dev, ctrl);
 	case USB_RECIP_ENDPOINT:
-		index = cdns3_ep_addr_to_index(ctrl->wIndex);
+		index = cdns3_ep_addr_to_index(le16_to_cpu(ctrl->wIndex));
 		priv_ep = priv_dev->eps[index];
 
 		/* check if endpoint is stalled or stall is pending */
-		cdns3_select_ep(priv_dev, ctrl->wIndex);
+		cdns3_select_ep(priv_dev, le16_to_cpu(ctrl->wIndex));
 		if (EP_STS_STALL(readl(&priv_dev->regs->ep_sts)) ||
 		    (priv_ep->flags & EP_STALL_PENDING))
 			usb_status =  BIT(USB_ENDPOINT_HALT);
@@ -380,10 +380,10 @@ static int cdns3_ep0_feature_handle_endpoint(struct cdns3_device *priv_dev,
 	if (!(ctrl->wIndex & ~USB_DIR_IN))
 		return 0;
 
-	index = cdns3_ep_addr_to_index(ctrl->wIndex);
+	index = cdns3_ep_addr_to_index(le16_to_cpu(ctrl->wIndex));
 	priv_ep = priv_dev->eps[index];
 
-	cdns3_select_ep(priv_dev, ctrl->wIndex);
+	cdns3_select_ep(priv_dev, le16_to_cpu(ctrl->wIndex));
 
 	if (set)
 		__cdns3_gadget_ep_set_halt(priv_ep);
@@ -444,7 +444,7 @@ static int cdns3_req_ep0_set_sel(struct cdns3_device *priv_dev,
 	if (priv_dev->gadget.state < USB_STATE_ADDRESS)
 		return -EINVAL;
 
-	if (ctrl_req->wLength != 6) {
+	if (le16_to_cpu(ctrl_req->wLength) != 6) {
 		dev_err(priv_dev->dev, "Set SEL should be 6 bytes, got %d\n",
 			ctrl_req->wLength);
 		return -EINVAL;
@@ -468,7 +468,7 @@ static int cdns3_req_ep0_set_isoch_delay(struct cdns3_device *priv_dev,
 	if (ctrl_req->wIndex || ctrl_req->wLength)
 		return -EINVAL;
 
-	priv_dev->isoch_delay = ctrl_req->wValue;
+	priv_dev->isoch_delay = le16_to_cpu(ctrl_req->wValue);
 
 	return 0;
 }
-- 
2.17.1

