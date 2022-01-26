Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C87549D649
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 00:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbiAZXkl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 18:40:41 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:29261 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229764AbiAZXkl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 18:40:41 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20QIucbl025547;
        Wed, 26 Jan 2022 18:40:35 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2051.outbound.protection.outlook.com [104.47.61.51])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3duc16g6ff-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Jan 2022 18:40:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ea31moqZwRhJaCH+RFI41/qlAkd7p9tFkK9Rcf+F1ILIskh42cXQcchQaHVpQxRA3o5pTp87nYaGUZkxZCpfqcXLv4Gb5d5PbfizrlFfnhOAFY2skmMacdkhXYBf3NbJ+bU73AU5Ic+qRK3VS7QabGTFMyYdEGrU/sDmJ8ddJyTrTorkYUbksef5EfgVB6/vr21S9h76D29xodWQ+AdF3s96pYK1MwJyQmmb+5JKsH2tmM5P/Z0PuXw7Zbltkx2nkhZbAwqYR7Ytj6myAL3lyPU+xXCYdDulz6n9pA/sjajX8JExrDkdVZyscDr71lsc+d6Rhc9MfA69PaiMHd/ySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUc/8rol8dYBnH+7Pw1CbDvp/GaqSmv1BW+hg24+IaM=;
 b=bAYE3gQoCl/xMNw0tbXEmlkT0MsUvFNAWgcRyXt6xrCnY3pXXzxhQPASOV6d1/39Q2Dkk6CeIqAuN4RaO6mTU+DDJoHggHHI9xm+7hdc+KyDP7n2cLDwH+vazDUtJIATolQz8/Tnu0goZA6Ek31IR1/QuzC+fRRTmm1ldVq0g/0UV7E+Dtg4CSjex64CJAYKNIsRZDXsq3oxiIzXaf4wJ5PZOrqO5vkH/sbIqAVme4IS/l1TKAFpWfxDSidp8V2Pz2AvTdFe5vsm4ho1nizbOg7XHI6KU/h6wijfX05eJvDGYjGfJTe57IE7u4deQhoYVLeYgusWXWy2xyrWleLgiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUc/8rol8dYBnH+7Pw1CbDvp/GaqSmv1BW+hg24+IaM=;
 b=214lVKFXmxrdP+a8fqerApaqam831/LHgeG8LwWOJRic3kTvZRtSlhwy0s7kuU5A2zgSL/rCiqPIaYX4jUQAEtzJ+p+XPEaiwlj/dDxx0nIj58jxtmL78cefVpvUNkDw5QewlSianVAOwLD+MlHaDMGrImG/7RIynC0Fftn1X6s=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YQXPR0101MB0853.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:24::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Wed, 26 Jan
 2022 23:40:34 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.020; Wed, 26 Jan 2022
 23:40:34 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, piyush.mehta@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v8 3/3] usb: dwc3: xilinx: Add ULPI PHY reset handling
Date:   Wed, 26 Jan 2022 17:40:17 -0600
Message-Id: <20220126234017.3619108-4-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220126234017.3619108-1-robert.hancock@calian.com>
References: <20220126234017.3619108-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR14CA0023.namprd14.prod.outlook.com
 (2603:10b6:610:60::33) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a82da99-06e4-4c21-149b-08d9e1253f1c
X-MS-TrafficTypeDiagnostic: YQXPR0101MB0853:EE_
X-Microsoft-Antispam-PRVS: <YQXPR0101MB0853FBFA1D0697E4DA72EAE3EC209@YQXPR0101MB0853.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Y811Tkdjg4cWVVzTZnkO+3tSojz6/qZmE9tFWqq1b7J20R3yhE2C7Ut+qnci2hVw1qVHmgZjiIHuPzNnB9ljOgSL+QeK+nbXAL8ZX2gHbHKISfXUPcZQN6nOjMR+RVcSRf0oOlFJoBF+/4BvzRqB9cRGc1bSSA3TASKdnSm2NMmRdtZRQi6+gbKSLr3asLYeWYytJu7dVV0z/gDpSz4nfjxYlwZwtgcMJkMjplUj4mSNzvL4MrlUp6+w/vuky9VK0abZ/ONNMXW5BBeOHld4JMcEJoPc5wTd2cRqnIu0dxB+ymHDeRQBM7uc4lCWysIYzuc4IUjZ2bNJdzwNYALUXLE/cldON0o6AHEMllSczviEms30FA2nOrXgmyI9Eq6hFv/Ca9s/iQkNhxcOgHn6aut20UIkzsBju/OyyeWswjsi3HX5gsAZIlCq0HfDMm7DrloXi0HmKaR8gnM6wDWLAun63yVWiWBuBxXvF7FgDhGVoRjnl/XURQHwVxmgejs8N8JLAarQeMt+f7jGphZpSzRzHmulUqU8ZIxmaY2BY4qYXvE4J6njLH1ESzvr0iLKoDxpTzhX4PF3JFRs5i4yVq6q4an3I8WiQ9An7ivJQVwJulLV0mhiQxOHDoYDoVPjV9FkmE/VN9cJEo9hwdzGJ8Q3c14XAE+L0ceVFSHxlBf7Ekg2tK8mFWCvmYSnQcTs4AzUJGH+S8Qtytq6uvHGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6512007)(38100700002)(8936002)(44832011)(6506007)(36756003)(4326008)(5660300002)(1076003)(186003)(508600001)(8676002)(38350700002)(316002)(2906002)(6486002)(52116002)(26005)(66946007)(107886003)(66556008)(86362001)(6916009)(2616005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BTVIiCeSDq5aQlhnHJ+jq4gMDWHXurdd/oYT1gloZgXtbYLACaZ6xM5Ld/30?=
 =?us-ascii?Q?IhlTETOCaZHgRegKp0XtATlAQNdzLDo6UY0qfj2iFfoNLpzuPXLx2HDF89ix?=
 =?us-ascii?Q?FYCqHtImNVU6SQAlD0/+trytgl69sxFLrmCirqJqYo5d/IxI+77lXmzM9fMf?=
 =?us-ascii?Q?DTADBp07HcBEMs/rUoVO3vCRN5PuGenxXhF2YH5/1i5WQCkLWxLGKv54kEDk?=
 =?us-ascii?Q?Sdfk927FtDAXt0qTpXEd3QRwnEBOUdPvGonax0e7Agu0A93wTmSudwklbxrq?=
 =?us-ascii?Q?/7QUyB8SKTztnBuk2oGE4RRiwi06FP63tRLaDwRyj1SNm4peG2RzH+g7i9wd?=
 =?us-ascii?Q?Pd5DkKvnpwuO4z9GK4Zi2eXMTK44/SxjacXv/xJGa80oWI3j/LGEgCDk6w+E?=
 =?us-ascii?Q?LLz7/IdBd+KWjyQNPIXbYQkV2q80XHXOeVsiVA6ASNxNEUDtweFvFTkwYMMY?=
 =?us-ascii?Q?HGCJ/K6QaPdpEa+olbCZs991xj1mtV5dhhW6MKBX8xT9f94yGD+9cG6ydnCP?=
 =?us-ascii?Q?Jj/csAbCLrt8z5FxSDPYz79QNVcBqiovasqDpHOJbrtdhxxJXrf6Ol5jxPwh?=
 =?us-ascii?Q?iCQtw5ZKG7zQT0Bn/oo6j4LkdKaCnVAKd73BZtRzSs0KO/0/CUkinzqwXEJz?=
 =?us-ascii?Q?OO3JSSHX8mbSpIYqnuSL7/gQrGhKvCnZlV3DiValoUzPsw1yIfbq6DpO8t8s?=
 =?us-ascii?Q?w9B7PcoSks11gv5Prbz4nl/X4MPBVScFeGDDWXJXNPhDJYmyAnOcglP5IuGW?=
 =?us-ascii?Q?F7x0fEkHGku4oFJBrh3NrrMUvsV3Q25H1C17LT3rM/nJfJAGWH+wGoXzyRzd?=
 =?us-ascii?Q?vckp5H+zgcueHze+/DnGnFhVJrAYwyGZp3Ta2gzsh7M1aePIRVk3W+8itJ4w?=
 =?us-ascii?Q?yBxr/IePsg9IZQ1Q2uYbcmy2aC6FiA8gfX1xM5qAxutzwVK0V5klqo7N+evl?=
 =?us-ascii?Q?MhsUYoB5VKIctghZeYkmyhwzzt4Qy7A+7QMsA1aac3mub4i3oSzE+Dk3sbCl?=
 =?us-ascii?Q?2F4GPWm+nNX/Q58wcYwhcR8QL7ZxmlOshgsQcNbyigjKDNnbzuEP2UlvB2i3?=
 =?us-ascii?Q?F0l+vj67jMLd9+k4gGPSa2cz11fV5hWZgiyGX+1HCnyv+nW/oE91DyGemlAK?=
 =?us-ascii?Q?G/zoFllwPejXRJns/ISTQebKb7xHkBdOTZOTLduTVLPcjHRBRukKX+tn3mGJ?=
 =?us-ascii?Q?+Y1cWTqMcd0dQa+cnIw0ZbVRRwOgfy2nx4JWCgjkpZIQHQDSQWqGaG8UpxcS?=
 =?us-ascii?Q?3VdmbzV4UzvfLiogaUILbevkjwRX/ao7d9FVQYJJtZVOzdVJ4s7ZLi1F0uWO?=
 =?us-ascii?Q?fV5b9BvL53WsZ/4TzsHIzeAy6H1v962TWfga77zpPaf79AISa5YVWD6DhKbl?=
 =?us-ascii?Q?nJN3rjRt4Gel1pRG2Y2WnGxwx2U+lgFAA7Bt08gxflvKNtvDZor4DatP/axM?=
 =?us-ascii?Q?sZexrRSXgoHkjDgOQMlz1VKpOarc/3IECI2va4L0JXJFDWOUdEsIUvGN29Lp?=
 =?us-ascii?Q?A0AbUqFJVIdITGF5Eti+ryUd4Nn3q+BgKfSPMbgc65iA1WSIUqxasPTQAYZ7?=
 =?us-ascii?Q?JSBjsIVMQgURV+JqYf5WXLJtb/8MsG7EU9qua4Z8GIowFRqwdSzlMCiki/te?=
 =?us-ascii?Q?uWy0s0PM54rstEBgZwGm1xYw8F2XcibUaV9oOCW93m50ijPbeakXjUkvEOJy?=
 =?us-ascii?Q?RF91dgwsJkGe7Kv9kBNTZJF6jL8=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a82da99-06e4-4c21-149b-08d9e1253f1c
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 23:40:33.9886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLD1qaQnvfvhFdwM0Kp0LCrFFk4SZGkxdT+T/vN9vmWXRo2lU5AHyohkVBCqMpSGTZZtWVu8BAI1S71nFYe8FOOvZGF2rJQVPowVhqEEi4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR0101MB0853
X-Proofpoint-GUID: TLyuh4kZ_x1eVdVf3tvZUfxRcFHfKwIC
X-Proofpoint-ORIG-GUID: TLyuh4kZ_x1eVdVf3tvZUfxRcFHfKwIC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_09,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=898
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260133
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hook up an optional GPIO-based reset for the connected USB ULPI PHY
device. This is typically already done by the first-stage boot loader,
however it can be more robust to ensure this reset is done prior to
loading the driver in Linux.

Based on a patch "usb: dwc3: xilinx: Add gpio-reset support" in the
Xilinx kernel tree by Piyush Mehta <piyush.mehta@xilinx.com>.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index a6f3a9b38789..1ee6011ada44 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/of_platform.h>
@@ -101,6 +102,7 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	struct phy		*usb3_phy;
 	int			ret = 0;
 	u32			reg;
+	struct gpio_desc        *reset_gpio;
 
 	usb3_phy = devm_phy_optional_get(dev, "usb3-phy");
 	if (IS_ERR(usb3_phy)) {
@@ -110,6 +112,14 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 		goto err;
 	}
 
+	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(reset_gpio)) {
+		ret = PTR_ERR(reset_gpio);
+		dev_err_probe(dev, ret,
+			      "Failed to get reset gpio\n");
+		goto err;
+	}
+
 	/*
 	 * The following core resets are not required unless a USB3 PHY
 	 * is used, and the subsequent register settings are not required
@@ -201,6 +211,15 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	}
 
 skip_usb3_phy:
+	/* ulpi reset via gpio-modepin or gpio-framework driver */
+	if (reset_gpio) {
+		/* Toggle ulpi to reset the phy. */
+		gpiod_set_value(reset_gpio, 0);
+		usleep_range(5000, 10000); /* delay */
+		gpiod_set_value(reset_gpio, 1);
+		usleep_range(5000, 10000); /* delay */
+	}
+
 	/*
 	 * This routes the USB DMA traffic to go through FPD path instead
 	 * of reaching DDR directly. This traffic routing is needed to
-- 
2.31.1

