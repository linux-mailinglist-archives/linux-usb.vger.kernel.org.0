Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602AB49BFDD
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 01:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbiAZAF1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jan 2022 19:05:27 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:22397 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235110AbiAZAFW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jan 2022 19:05:22 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20PMsNru008783;
        Tue, 25 Jan 2022 19:05:14 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2054.outbound.protection.outlook.com [104.47.60.54])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dsyrhrssh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Jan 2022 19:05:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giylEG9MA/07f/Z05qOO6dTIGdo3i86eIWLTHP2H1ScoAFZx/I7pgbbxllOXxBSfmbXBh+NQREtT0DZyNXcHWzY50ELbi0le1dOrfKLarkn/jkSdSLJ6UxJZoQuJFQFsNjfR1et5VtFyrHHN4k4xjwC0AWVuT/TFgmY/ZqYX4ZO9PpXJABaFGI+YA48fypbEH5MjgNqHV84Y42jiuo9hKsZCgSNbQGhDOE9ICj4kY9rnoYEpTuTi8E4LODhI+JEOTowRRvEqKkicOgfw97BfbPkXUt1tXhExs70w2Y50ot2keZJ/FVpsNgC9+L8uqriHHtNL4R29ZhMm9FIWMZxfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlIhxCy2al0R85WxKbglTRjStDZSw4Lisg9na0PGouQ=;
 b=X06LZqlFiE3hGjHRmcCIHBRq8o5ZzPkYxCGCqKog9Tyuu9foVjM3BHa64aSCVmyVfrLytTNdvy0eD4XtsmReU6CorDGzD8b1rOpUNhyr4/wUQFZ8bruqrEGekDnxm6IDeQ5y9IvcOWR9mLTGiLh3VekfkW4JJL6Y9H2oQ80LmEn3xMP/bJ6hFsoXnlHPnzVJOcHjAdJCLmJBudnJPrqb8Aqfh2YbcgJkLeY5FN1GpaZbRnLHgmppO0HUxG+F/UBTETGv2qK5jgWepr5Th6NEF1CLVfbi7hV/uewoge6fTEywQDAwKM+RGKOCt73ompxYJRrIhYNBuba7FzaYiB7UPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlIhxCy2al0R85WxKbglTRjStDZSw4Lisg9na0PGouQ=;
 b=UMtb1jY2TFClIiCcY7c6/btJuQa+N3gS9XKdUMebKoGtDKcYjMMjq2k4Nj2Egkhd3RBY8g6slUrHp3j3uRcv5rdixb2KKFezlCaF5QV9rez3RBAJOSEP4rhWiDspda7pv3RPxFLPU7ENIf+6Ry/VUzdMo/eY+O3FG54KNuqavbY=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT1PR01MB4172.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:28::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Wed, 26 Jan
 2022 00:05:13 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.020; Wed, 26 Jan 2022
 00:05:13 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, piyush.mehta@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v7 4/4] usb: dwc3: xilinx: Add ULPI PHY reset handling
Date:   Tue, 25 Jan 2022 18:02:53 -0600
Message-Id: <20220126000253.1586760-5-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220126000253.1586760-1-robert.hancock@calian.com>
References: <20220126000253.1586760-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:610:32::21) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e12acbf-db9f-49a5-e5f5-08d9e05f865d
X-MS-TrafficTypeDiagnostic: YT1PR01MB4172:EE_
X-Microsoft-Antispam-PRVS: <YT1PR01MB4172AD27731A0642CD877B79EC209@YT1PR01MB4172.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NPjWkPxA3n73KiwtbLCKPa/8ZN37ddTzos4jdFUVG6T8UaSeWpHIMoSW1A/jt4JNCd8DbyIWFoehRYa8a86P5GYPtMyOOGgIuh/rK874gtJ81z4Naoqp+SFgX0rOqTyztdnyWKlb79k3aRhoF0xb5UHgBeAG6SF/Co2oU2tbZvfFI4b2syUFb15dMDe5jlGhn23cpaI5EmWvOjbtIqsYm1VTSNzUkhTnvfUoGBuVTtpkJrbZGaFdfGp1tia8b4Cjhfkew6vsbLdSFh8Y32qvxa8J1n7g7aJvsdcGfO906V/8K55vRZqiPvwEQpoO9ycB7lEwIFD7SzT7Uhy87vQz09olq2D5sMez/Lo66Ot2hPsdAaVd7qeD3mSxuBfd/pWuKL+bfypmX5HZM9EC1CtfOz4VO2g/6iFupJaKx+aQYbgMIwzD3uM5SUrmo2FzVqFXNKuwYX5DcA7wBT/f5jt8vSNLu5AfoIXk+1COc3j80jggeHWsZyylqZb0MFBfw9Y4MVJlGNV1tuEVRSi7gKeT/mLB3OuarvJpc1jh9bmb8xYMGBuuG+1ifyC16Xw+nzqu0Pa+hKwy3XHsAo420Mm0Eaz6X2UxioEOmo5nVVnPKO8qpV2lhC7AWLN80TqkEB2wNWCNMyuOFCHnTPaUPBEueUjJ6BTc6Qx58yVGXKsJgnGvDPgkrc+3qad1z/5xNP1W27TEH0kBNSBFPppK90lunQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(316002)(8936002)(52116002)(36756003)(6916009)(66476007)(186003)(2616005)(508600001)(66556008)(66946007)(5660300002)(26005)(6506007)(1076003)(38100700002)(44832011)(2906002)(38350700002)(6666004)(4326008)(6486002)(107886003)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RVLel/bzw02+0I0xhONBHmhxlXpN1uLcuzWv0K6LDoXrU2w/BgPTEuSht/+y?=
 =?us-ascii?Q?g3MZoowDS6X1GuLxjLsuoqaXburJF6oxU2saD8U56UTWqNY/BPuESP7MlTKr?=
 =?us-ascii?Q?FqcUnNH1jh8XvYNvs7vzUbQ4d3mEtkgQ+8Y6R0QlrKvMJFf8SsU0KnwAvWrz?=
 =?us-ascii?Q?LMcMkRytPeiqx2nalVzVN63Dci7a20TcXvZDcFTuo/8aSncidOZ2Lw1t5hN/?=
 =?us-ascii?Q?gS5flf3/YDP+ww4aUDT2r5Yn0DnSJdxO+yKdfj3aU/Ttz9pEv90PCifR7oyr?=
 =?us-ascii?Q?ayFyCSCWGkiImrtIBVM+BK+Og7PdPNg1UlkmkuYpqkSdkGkrVs3EYznaKq8O?=
 =?us-ascii?Q?sqc+7R9Z//oKj1hO4Wy9LBPx/5GhdAaYeNIbsstNdhpUT9qlOKSvyHM/J8h9?=
 =?us-ascii?Q?XOeynMI9NVfCzeTclzI/aDGGeRStop1n3MpHEVopeQLdJhj34KcXRub66+6V?=
 =?us-ascii?Q?YhA8xb/I0idOV0MiZUKzt4hNZQbZxswf+QuzVbgkOFSlRUp2//Mqk1XBGAER?=
 =?us-ascii?Q?Hr3wThjH0zrAc98EVXI7IltldyqUn+isu7SIh/HNYnXSUattXl0pO0XZIBex?=
 =?us-ascii?Q?ybm622pCh3HZsRs/RVr87AzPzrGcqOeH4ItuYaZgFSU+aak/dQTBbJdTk15G?=
 =?us-ascii?Q?BSPBd41mzQahWQ6iDArlEfaU5TKBvFCaYmmmmutIbBFwWbGUEOrR5h5diuBk?=
 =?us-ascii?Q?0VCLn0jz5Md//WTZf6vEmBr5b5MsBqhBBUGeCX5bO8ESug8v3ltCfCoiVCgj?=
 =?us-ascii?Q?xzq3DvpFeZn5WFDEKONaxQheMyx74Ow+y1+DN4izMuVykTj90Aqcq0sSejmx?=
 =?us-ascii?Q?K1HxX3c2hSw8cFV3o1XF0oVIy1cUtf+oo8QIWc/bb4xv17a/ftKoZq7Aol3e?=
 =?us-ascii?Q?DedXRrF1KyATdQQ6dBQL9UbkdaCMBoKxhR8/i/w2LnYemgkF6sYx0v6ztTQ8?=
 =?us-ascii?Q?eYZssqrdCH0JN8mdPiK894wEJZuunmPs9woa4ehHGtixhpdVLQxJF1Fv5Qjb?=
 =?us-ascii?Q?ncOli8Lr8oR0KmWSW1kaM/wJnXEZQyw+88D5jmP7vAMDAzVulVSDCQAjPiwF?=
 =?us-ascii?Q?hGRn9IvPL0UBMLH4g9D7hju5rW7WMc/CdA0/mcfRWzonEsnofd8ApkTgPmCe?=
 =?us-ascii?Q?ZzIuSL7ReZjn3VoLoHZtuIGQ5121L9yjeRrcMSgVEWRz4UxJCs97vWj3ilne?=
 =?us-ascii?Q?ZJM4Oph6Sf1ehArK0fBhs+zNanePkfwOdGjnQS5gmin6yTJqT/Z2M1+MBdo3?=
 =?us-ascii?Q?7T+8ZYewQcT1xInjz9y5L6/uZjR80Eb6sovEsFw8WuPxohCCq8vtX9Wluram?=
 =?us-ascii?Q?nuIBTgrLJJ4ZI7XMVmxQyml1lFA9NXABaBH96pWUzQZ8yc4Kw1QwyPHDxn2c?=
 =?us-ascii?Q?f0ed6lZ87fFvdi8YqUV5z+doTYutuyxwXmOswfYdnSDlYi2fVEVaQRr7ege/?=
 =?us-ascii?Q?ZyNgbvE+hsGjkMkDKJvok+++isEoOOZbmLuEo0DgcXcyobt+USUoiHS/8rNu?=
 =?us-ascii?Q?zy+uFuAZrNeENmEtVoE58/YxzuWqeB/NE3tPiHtTGHQy1XsnitcpXvZSSmpF?=
 =?us-ascii?Q?2SJkcOD9f2fC2vaEDtXJ08EmryD6Hd3UDixlFYz8QYRgAocoGID7Oa6h5ViI?=
 =?us-ascii?Q?ju5Prl4DBLl3NopzuVh/Tx058Snd02f5kZQeUBBlBboDgdGv+1K7WPCMzniA?=
 =?us-ascii?Q?x4raLgfGJGZLrMExPONR9WNH2y0=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e12acbf-db9f-49a5-e5f5-08d9e05f865d
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 00:05:13.1388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOMJEdwvyF/LS1tuC3uuo7X/6RJfg+DByNFJP1HZlFW4EoDH45HjHPdJxCmZJf+8Aj4NB8HEJJjSrFi7cOpf74vebk6eVErNgbvzO5qylbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4172
X-Proofpoint-ORIG-GUID: ZpCSi-SHv0aSyJcAAt6mp3pamhr_tJlq
X-Proofpoint-GUID: ZpCSi-SHv0aSyJcAAt6mp3pamhr_tJlq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_06,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=810 clxscore=1015
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250145
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
 drivers/usb/dwc3/dwc3-xilinx.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index e14ac15e24c3..0778236509bf 100644
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
 	int			ret;
 	u32			reg;
+	struct gpio_desc        *reset_gpio;
 
 	usb3_phy = devm_phy_optional_get(dev, "usb3-phy");
 	if (IS_ERR(usb3_phy)) {
@@ -201,6 +203,22 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	}
 
 skip_usb3_phy:
+	/* ulpi reset via gpio-modepin or gpio-framework driver */
+	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(reset_gpio)) {
+		dev_err_probe(dev, PTR_ERR(reset_gpio),
+			      "Failed to bind reset gpio\n");
+		goto err;
+	}
+
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

