Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C03E648E35E
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jan 2022 05:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbiANEne (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 23:43:34 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:11509 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230425AbiANEnc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 23:43:32 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20E4cF69030962;
        Thu, 13 Jan 2022 23:43:27 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2053.outbound.protection.outlook.com [104.47.61.53])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dj2j2gvtc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jan 2022 23:43:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWphEKzlixJsZidtfoy7ZTuvinCTX8OkcqB9liZv02ZHzJTbu0zgn122MCTrZ8RTT/Kg1o7s45YNBsW7USMDDHAOZaO+dG/WPClN8BmlWwaV2GIw/mvpl6rgBbpWOvjaKH03Vt27kPOlG4V/qFifo/kUroQhl3m02X0NpDA6z6GZADF5YSpHDRihjcUVnx9MRLgyGpMjwt4kVFObyfMeCr+406Iu8klvlYSdAY69WC4na/uO3FA/fouyySrDr8IrEF/3QT2n+J8A2Jzgecd5OPpDxcO6470XvH82IdhQx4qIJachMqpT/L/6RgL7prrPNqVuAqMDsnuuOuiQ58+8Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/I/22Z2oVsG1IyKTu+TUts7zPyN/ZLXHjCb4USg+lXs=;
 b=KR/EXzWijRmygwRbsWf5jcaJZO1HdEheC2A2wngy14jvWYjWRNrsmqBoG/9eDHkJU5LycWIAo846sHFbGA7+fy0+YgNxv1y0e+EKThOwEn5G3LFyROQizuhccz+6P1pzE+l3XBHd/qTb1gaSxazY2u3lgmiueOYdYD1M+RWZBsVC/kHaRbYWU4+2noWQOLewpeX3b6aEB8sQ0RcHZH3jS8gZXD1HwBWUfp0pbpzgySlg0UhMYxauovN5vRh7EpJaOCKtxMt1GqsChkkJYUG7tSRwYdiQn3OzwUOGBae0PKIYWOlmPxwWites6Pbw2pSC04tPRTerwIW9yfyqvQpFpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/I/22Z2oVsG1IyKTu+TUts7zPyN/ZLXHjCb4USg+lXs=;
 b=ZdgIHaqBONIPEA7ER1LZrm502X3gBTDQMdVllB0gMx20Q9Lix/Zg83Sx31t8nWTT/cy6vk7QjduBnXdz+hIQjhA1g8xhMsmi+/cPan/jyPrwyg+s0rsTFSjLp1qI40pWeH1Giv8AwDvp1/gjtsZi7KHNHEK7ICpS7RHHOqTLHX4=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YQBPR0101MB6341.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:38::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 14 Jan
 2022 04:43:26 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d51:8098:30cc:5bb6]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d51:8098:30cc:5bb6%3]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 04:43:26 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v4 2/5] usb: dwc3: xilinx: Fix error handling when getting USB3 PHY
Date:   Thu, 13 Jan 2022 22:42:27 -0600
Message-Id: <20220114044230.2677283-3-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220114044230.2677283-1-robert.hancock@calian.com>
References: <20220114044230.2677283-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:300:4b::26) To YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50f48e16-ff88-4dc6-836d-08d9d7186738
X-MS-TrafficTypeDiagnostic: YQBPR0101MB6341:EE_
X-Microsoft-Antispam-PRVS: <YQBPR0101MB6341235CFCB06404C82692CAEC549@YQBPR0101MB6341.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1GAObHYGyTnDUZ9y/bVI8orkL59ulmCItKERFkjb2BIVqB/+HxWePqgeN6RMhTEuTl7S1PlsA3any61blBM5wJR89vcBFFRn0gK+Z3DNgcL5IJ2DF7lPt+R7AAEyOfbeUFOMrxc1AljhoIaL6QtGaCTorC1+r2xe0XqDTa5VuTLRjgwguC4PytblynqZxLMCSja+yCGJjiuQ6QEd+8roe1eNSkJUvWkVwetd4eGkDdoGLgcUu875ShwVZmpAAcvx752yJH3YXeTfGhwCPDTammM5vzR5qVXz/eZgbR/c92SM6cDlE5SJ5bS1qvLgHaU72R6jGUhZWzl6Arqph+2LnBM5bIvq+r6scaQ2kOunl5VXNtNW3vwnQ044ZuSbqKG2wohULnYceYnceRasHARtfqhTr3GXvaYJSH3uBN2NLjhb+PIxCiH8VNYEOg/G3jC9qakU5v8aLikZNWVrhi5XdtLhK1yZLxD5/KlAhWLMWnKrJnJTZura1tqqO/zNk6lpYlDkDc9xq+jgISNPKMsf/p9tE9nPwWQukKoxjuCUb3vfZelwtusdDgGNZT4rf135M+7exM3a0uViHhnAVKt3TBrS6xWLABUCIwLREB9opI9O0rZWcZuw+n3MJoOXmon1VCTaVPx3PuesaVoF4Oi57XRllYfQ7Mi8JcHT4n7qAnJuqNMn1uCRqC8OYPOBVp+rNKazgbO+n28msrH1neB+jA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2906002)(6486002)(107886003)(8676002)(4326008)(2616005)(44832011)(5660300002)(1076003)(83380400001)(8936002)(86362001)(38350700002)(6916009)(36756003)(6506007)(6512007)(508600001)(66476007)(316002)(26005)(66556008)(52116002)(66946007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ge/AKifrh2csS4oy/W0FWK9BYF/DoyJhiIAF+Va9XuzJuTXwXYHROkwyYRtM?=
 =?us-ascii?Q?lvYfIGdgHk1y0O1itZ3cppcA/CIYxWsKNcenHqGqx/hg6YM97j14a5RAukF3?=
 =?us-ascii?Q?GDgFYBZjbbWzwH2ThqUB2/NzWhPKC7EvlDwS2JDxJ1Q2h4jMAVStZsLLne6W?=
 =?us-ascii?Q?xs03vH6WL6C6SvDnKnO2dsLgl7x8DOfbvWenXBaLCLd/fV14JhiwX3YLxbZm?=
 =?us-ascii?Q?lLDUKFCqMBI4RkNbGIubWaRd/32KP9M2nEu9ByAGi1WWHin1CaDXIU4jsUBi?=
 =?us-ascii?Q?8B0mYeeR9MkkVF9L9YesdvykWxFHhg6Ghh1ol+ryvBpdwQ1OMwbjapuQZ/b6?=
 =?us-ascii?Q?G2pywEM6WzXU5GxitBgh9ng7AthFPgICVSgQfEntqf+xF9jx8k6/98/Mi4Bq?=
 =?us-ascii?Q?Nit+BoBD1hcWlV3l26lXfUxXh59hvSxjW+auVQg8ShDYTjHCsp+gWdLlCFQi?=
 =?us-ascii?Q?Baxn7ArohC9Ub6EF9JBqEjU0GlfNlAhqCTYJ7Ap91/VeGgxaeLzkGgqXHcMh?=
 =?us-ascii?Q?Yb2GGM47Dth5mtX93wj4jfIoopr0QYDNBQCpia8kl3DkbtvhluD7Wj/T8TjV?=
 =?us-ascii?Q?GL6RDb7VcZjpuYWn9fr1BvDYUGH1BZiZIT4yy9x5owrTQ97YrNfAEH91T0nZ?=
 =?us-ascii?Q?0hVS7EE5UTOcddpuCn2xoZpnrNqFY5CGmRSERGUOxt45tpJRUZXk/fg+4lff?=
 =?us-ascii?Q?SuwjzveM6b4n+K5DrvQoYB6yV8jBluCRtvRvyy7P5KNAEUnOAIiyq6sUfIvz?=
 =?us-ascii?Q?ztgGq2nR5fdNuTsqyHA7+bdCnimLURaXY9E6duirEMOF8h2h42rtPoHtcJ2e?=
 =?us-ascii?Q?I1qU9do2eDrpIVPkM8QOmu/1ICmwLpspou/FoibgI60BzFLORjD8qSVsMisI?=
 =?us-ascii?Q?NHKfTPcqGMrrezD/6zwga+cSmdqgIWT7q28NdwIxOr9g9baUg5g2OmIfwiuu?=
 =?us-ascii?Q?FFViFq6xe4R4GwCeEabgAd0kfzX0WMc3KtOT8KFYXKt1wGCQYSYyD8fSMDMr?=
 =?us-ascii?Q?5pA1/RekqQYZIUXMN3QOy137Ubn1KOWVkMDp6MwsQefN2wr3GZbm33965pX1?=
 =?us-ascii?Q?bYDajyztjlZzMCMR/Fnei1QGD+eTKMxcwHzUzpjoQOTCMQvASqa5pwmrMMI8?=
 =?us-ascii?Q?bsDE7DMTKsMB9dk8xAEB2DZ8II3Zbuf429MBry1hJLHxRCtP+t0b1JWgUvRD?=
 =?us-ascii?Q?3w0PsWzu1UBhKkoSzlRyiuCIgHS8u0s79nIstfT2IQoNM9p7aRqQtHNT0dh7?=
 =?us-ascii?Q?nf+cTMAkjMKQJH/qGlpS+nIIa9YhgJ+I09W0a2dUU3kK16kj9l2h7iwZrwFb?=
 =?us-ascii?Q?2UebcaeTCy1j1UpcORi+E+2PYRCPMyq2gMvEVejtvpT2SGgb1E18JbNNsppU?=
 =?us-ascii?Q?psTlP1jJDD78urthpX4gPA2XPiv/D8TxLOjtU0laKGClHpO5FpCH8WdWRdI5?=
 =?us-ascii?Q?Zg3fcdd2wePeurMeMfgfutEZRmHvOjkkIai5ZMGkBhdKJ0cL5v2zcwpCOb3K?=
 =?us-ascii?Q?6GhEVt0nqZLUXOq/IpU8yJfPiNEoc+KGfdE/L+XXhy2GytU2FO6hfUdnDGO3?=
 =?us-ascii?Q?3HfHpCM1hYJK+aCYGXSRdZS7X+8XXBiolBr+/sk5t2VLApoxpeZ8j5pzaWY6?=
 =?us-ascii?Q?zqsHYhufobuqw+uJGBDEzyFvuoU8smx98EUTv18sVU7NAs2658zJ39HFGoNb?=
 =?us-ascii?Q?kFCIOJSaIl9Q/1QhlbciFcCoeZ0=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f48e16-ff88-4dc6-836d-08d9d7186738
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 04:43:26.2455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrBH7WLZv+RRLhJeqHmbkhatWTeGZ+3Am6TEIgnPlEm4TkCbtrwtfOLGD1L0OHM53d4iCee7S7Pb/R/RzrTxrgsE0Wru9+LFU1Qcvypj7OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB6341
X-Proofpoint-GUID: -6ZN_kIb6QXonVePJ0c6DRrZqZnrb9CB
X-Proofpoint-ORIG-GUID: -6ZN_kIb6QXonVePJ0c6DRrZqZnrb9CB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_01,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxlogscore=613
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140030
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The code that looked up the USB3 PHY was ignoring all errors other than
EPROBE_DEFER in an attempt to handle the PHY not being present. Fix and
simplify the code by using devm_phy_optional_get and dev_err_probe so
that a missing PHY is not treated as an error and unexpected errors
are handled properly.

Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 3bc035376394..3b16e7610009 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -102,12 +102,12 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	int			ret;
 	u32			reg;
 
-	usb3_phy = devm_phy_get(dev, "usb3-phy");
-	if (PTR_ERR(usb3_phy) == -EPROBE_DEFER) {
-		ret = -EPROBE_DEFER;
+	usb3_phy = devm_phy_optional_get(dev, "usb3-phy");
+	if (IS_ERR(usb3_phy)) {
+		ret = PTR_ERR(usb3_phy);
+		dev_err_probe(dev, ret,
+			      "failed to get USB3 PHY\n");
 		goto err;
-	} else if (IS_ERR(usb3_phy)) {
-		usb3_phy = NULL;
 	}
 
 	crst = devm_reset_control_get_exclusive(dev, "usb_crst");
-- 
2.31.1

