Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF704032C0
	for <lists+linux-usb@lfdr.de>; Wed,  8 Sep 2021 04:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347231AbhIHCwg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Sep 2021 22:52:36 -0400
Received: from mail-vi1eur05on2066.outbound.protection.outlook.com ([40.107.21.66]:39393
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1347392AbhIHCwd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Sep 2021 22:52:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnWE96eHkJVZQU7CAp2RFDBZQSXyccefCGPjIWfruDKnoXxRG6aNxCZA9PXu6EEBoRFN50E1DDRKZOEcWfZ0pidbK9MM5SPeBrctjAoywjqbCrHlKRahjCiE2rXd3vg7XmNgjFzKB/mTdt972BlLle4V9vkKsZiEteDaruzDkFsTbWrfumGrDobu1w7pO4lsQoD7nC0EqB54F/VFbDseLusWgp7aSfo2v8WiMjFwOr99z5qEcmFtEiURZAXK/kICzxq6CdG1jx9rckfmvlr0teYQlRZA22yBiLxAUhhHejfTGSFXFACBMcGZ+JlGwmvct+kBqYNVm1hrnwvQq8IL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qcDBzkqtIYzbmQUFZlNaexb5j7/dxM8Gfu/NbMGwCPI=;
 b=bCC/WRrriK0ozeIywKV2M89XrFNOHumR8+fvpREf/AXly1q/FVb7r/N6ofush+Td+9aZejSevWry3Aot/evwsRsKkK8w6taioO4vAV+6jykoVJlRjI4LUcuXAcpkxKwVDGSbLiYYjfWgmFXPQUEL9xc4OMpd8yYTZc0t0cFJzVsgnDKRxUU8CaMyLXQaEd2JRaHuQKCBSF7wZROyArXleq81g255ctJuCehaiClWI2ddvvrdWzl2UqUCxmdshP0EUlmd5fWfR5jp33TT40mmB/aM5ubvBdWkv/0zJ+d0nMEI72/0TiB4rMc+ZLWYGwV40vd9kgIPSof4CKl7g1MPkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcDBzkqtIYzbmQUFZlNaexb5j7/dxM8Gfu/NbMGwCPI=;
 b=co0altoBhSI6YyR1KupKIkayOnbUCSQsEJmPBUpLqZE9EHktJyLmDiwxtjPnkIah4FviRTqKLg6sMvVL4kHmGgKxtqQKeYhDquU/VGMTcOO5RVx+/rzXsgnkxNrO4H8o2C1F5rC8JkZn4xr+DZsgsWj9+LMu4PBa0X90NJVJQ10=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR0402MB3438.eurprd04.prod.outlook.com (2603:10a6:803:5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 02:51:23 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::9db8:6f9e:2538:7a4]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::9db8:6f9e:2538:7a4%6]) with mapi id 15.20.4478.026; Wed, 8 Sep 2021
 02:51:23 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     Thinh.Nguyen@synopsys.com, chenyu56@huawei.com,
        john.stultz@linaro.org, linux-usb@vger.kernel.org, jun.li@nxp.com,
        faqiang.zhu@nxp.com, linux-imx@nxp.com
Subject: [PATCH] usb: dwc3: core: balance phy init and exit
Date:   Wed,  8 Sep 2021 10:28:19 +0800
Message-Id: <1631068099-13559-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0118.apcprd06.prod.outlook.com
 (2603:1096:1:1d::20) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0118.apcprd06.prod.outlook.com (2603:1096:1:1d::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 02:51:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06bb62a1-df3c-42e6-d871-08d972738b19
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3438:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3438E8B7A34AF4A78AB5CBBB89D49@VI1PR0402MB3438.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PqHpNlZBR1cdfJZ7pUj5LvUveffJ6zXx8xFUxF8bpUFZ9IllPyb2FfcjNtlGRWEdLKMezyqjm5I2iYrvByCDqMS4oCMY/FYUcOI5k0CBC+bRHypggH9wQXtd2lCyUVn5lYyTRAa8xmxIcKBVV3wwChUSrNJYfPsVGDSXW+E6Xc8g3gBqecB7LAHXQPBLmfjves+Aur1chDPpXua9DzURhxFMAkt6+WSPYNubK2npxsGi9vOmtJtR8wRT3rCM1tRD+vOiv0HWEOCD2WcY1Xcf1JMun3NfgQ+zDpdwbV7LuaK6JUBE+XfcTq9EnO/aR6iq+3gzRKP+sMFpp3gfP7PIXmuYPu0gvrLhj8vhvWvZkfQjr9ahGDBag/3ROkmaZx2UP4GghQk//PM13wa7G1h0d1B9VMEXCjwI5dYcalF9XxXlUmBpv/GYNEk5XxtRxFblbI8bvD782pwDnNqnJUmyjSzfYdjXO2V9xQdwpFA7+Sl/1f+glP6+MMLq7ERIQs1kZsc+QOQaOSBBsCZiVY/vhu0EtgDMKtrfd8R83nlkDpXV7+LVGlxVLGn2GOz3nSNNhTU7wAS0neZpZz16dscowqhZ7njEi4JFuOUr4fp5p/xNRX7SpfL/ociPVkF0YiQWIU7xv9D5wfcwyXrtXehXvuymLCMf6uN9QccXDXimGR4wu5SvZ0n4DIgn3IlMw6II78+AhsJXakT+iNRE6DooTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(52116002)(508600001)(66556008)(2906002)(66476007)(26005)(5660300002)(83380400001)(6486002)(8676002)(186003)(38350700002)(38100700002)(86362001)(66946007)(956004)(8936002)(36756003)(2616005)(4326008)(6512007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h8yTrf9TbQZWQxYQa0oK8RTk5jcW5wqdj8jWwPY27cuBNBGwBn/DZwqpReTc?=
 =?us-ascii?Q?IDN3LwoKXzLVgT4x9NyvCB33xXJj7XPHUUEBDsqFhBKzPhlBtHe2BUhDNK4c?=
 =?us-ascii?Q?wU9Mnk/LCNqdxhKGyKvGwS3ytIA67JoHGiflHNp4A+5k4NNjz+yG2xxftnuT?=
 =?us-ascii?Q?9WbPd1KuOj8Sy4UZFeDDJOsrxBnSiHGXjPmtLNOQL4n+RJ5P34yGKGcV5sQ0?=
 =?us-ascii?Q?WwAzLBAQg6OUCnj2FESHJUnOg5GpymaD7ekKL3Qewxo+4FuHsuKJckmKDmmu?=
 =?us-ascii?Q?VlZSOyH/olswjSV3VWMHEkLXxU/fUOHLjYWakY3TK2tZslfR7j2SNTt7/ypu?=
 =?us-ascii?Q?a3bTCY91JZoS4Znw1Y5LfM727wyeKawksApvu1wcn+fA3GSwV60SNlCq+KMK?=
 =?us-ascii?Q?9k7F83YdicWjHO65zHrKqbHsfhhYOtdni/VRzjUXCDOigUNSEglXJ2mjBJhc?=
 =?us-ascii?Q?AwgK28zcAUlXI9JBNpHmnjZs9yFDYAjjuKK3iysgwjv+JKssby4cDlR0RKhh?=
 =?us-ascii?Q?ddNPXuTb2tI7roghqjFiHviakmkona0G6M2zU/58t2Oho2Ne8d3MHFMfCm1y?=
 =?us-ascii?Q?CAfhhF9CAhlI+AJVS8mer9F8ffwntO1qk/F5xfWd51J2fvgOQedAd3toqfeV?=
 =?us-ascii?Q?9Lzcj/wt8jXf+vZ72gXyvDjnadvQbSqeBDiwlnpzPA16z+IhinewvVduf4np?=
 =?us-ascii?Q?8PEkyoP9kmY7BUSAu12p/Bucsfk+gl1wq6DfnmYC/85VZeIRGuwWoqlqdeC3?=
 =?us-ascii?Q?CA8vN2gvhmtPnaEKJoMW1YbCXRkkRvs6F3IgJM1Gqy2ro11XeEx9InQNrWzK?=
 =?us-ascii?Q?6u8qFzSvQuBsraszIfHxxR5U3P0yv8Cfj1GJggPJKiOSXaDAqDGO+jwxYVrT?=
 =?us-ascii?Q?/6lgoV3fDAb3Dvy6SzAJXu/nEl/XibK3IbAd4KfxPd4VsS1jQ9h+xz6PSwH3?=
 =?us-ascii?Q?YOH69GNWubBHaICHbgh1VsEJIGarlqrogRWp1v3mELf+BrlbMQk3wxS8+emQ?=
 =?us-ascii?Q?LoLtx+Ssg1o8uT97DcxrycOL2ZhrFw4wddlwi/CdMHYwEsNF0XZ8AQDybfGp?=
 =?us-ascii?Q?RZc1kFlL6SdPkm2TcXdgH6nCDI57REmvI/SH+JOyCWtypZnZTLOV5NhgU7ra?=
 =?us-ascii?Q?5cKEtSzwqHu2l62HUe2I54sxQfgf9mxi9ikSc9XJ+JWpuxK2tRplA0Dswder?=
 =?us-ascii?Q?7sqmx0xFv+Q06C1k0KMe53MoKD01rdc15fQvLUUFLgZI1hySMILOfdiUwhXS?=
 =?us-ascii?Q?x1okj7qpkdZ8NSs3bQ2/+8Ezil1dddLxuSS94IPxdmxuXFIB8pc4IgttuHPr?=
 =?us-ascii?Q?ua1MFuhRsz4A8lOChFU3EzVg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bb62a1-df3c-42e6-d871-08d972738b19
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 02:51:23.2127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EpDltViF1lbonx1jVnhf8rifG/PO9IVMbVkm5z8uO0pDU+oMjaErAle327iBV/9Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3438
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After we start to do core soft reset while usb role switch,
the phy init is invoked at every switch to device mode, but
its counter part de-init is missing, this causes the actual
phy init can not be done when we really want to re-init phy
like system resume, because the counter maintained by phy
core is not 0. considering phy init is actually redundant for
role switch, so move out the phy init from core soft reset to
dwc3 core init where is the only place required.

Fixes: f88359e1588b ("usb: dwc3: core: Do core softreset when switch mode")
Cc: <stable@vger.kernel.org>
Tested-by: faqiang.zhu <faqiang.zhu@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/core.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 4483275afb8a..a02229517d2f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -264,19 +264,6 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
 {
 	u32		reg;
 	int		retries = 1000;
-	int		ret;
-
-	usb_phy_init(dwc->usb2_phy);
-	usb_phy_init(dwc->usb3_phy);
-	ret = phy_init(dwc->usb2_generic_phy);
-	if (ret < 0)
-		return ret;
-
-	ret = phy_init(dwc->usb3_generic_phy);
-	if (ret < 0) {
-		phy_exit(dwc->usb2_generic_phy);
-		return ret;
-	}
 
 	/*
 	 * We're resetting only the device side because, if we're in host mode,
@@ -310,9 +297,6 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
 			udelay(1);
 	} while (--retries);
 
-	phy_exit(dwc->usb3_generic_phy);
-	phy_exit(dwc->usb2_generic_phy);
-
 	return -ETIMEDOUT;
 
 done:
@@ -1010,9 +994,21 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		dwc->phys_ready = true;
 	}
 
+	usb_phy_init(dwc->usb2_phy);
+	usb_phy_init(dwc->usb3_phy);
+	ret = phy_init(dwc->usb2_generic_phy);
+	if (ret < 0)
+		goto err0a;
+
+	ret = phy_init(dwc->usb3_generic_phy);
+	if (ret < 0) {
+		phy_exit(dwc->usb2_generic_phy);
+		goto err0a;
+	}
+
 	ret = dwc3_core_soft_reset(dwc);
 	if (ret)
-		goto err0a;
+		goto err1;
 
 	if (hw_mode == DWC3_GHWPARAMS0_MODE_DRD &&
 	    !DWC3_VER_IS_WITHIN(DWC3, ANY, 194A)) {
-- 
2.25.1

