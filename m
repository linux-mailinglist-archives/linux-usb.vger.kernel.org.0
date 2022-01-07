Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAF85486EE4
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 01:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344295AbiAGAc6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jan 2022 19:32:58 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:28983 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344140AbiAGAcv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jan 2022 19:32:51 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 206HU9vp023113;
        Thu, 6 Jan 2022 19:14:06 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2054.outbound.protection.outlook.com [104.47.61.54])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vqg6jm-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 Jan 2022 19:14:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqZW2Q+4Yn5saMUDwmNSICsi2R2s+V6pZkrzco1tStckf9xsUyjZeV9Avq86NgM+6AFuPBs1WRNX+7jS2vp8QnVRF+fSZWw+i+WdTTcU66PsjH3d+jlOpcjvJ/fc3NAUXKAdd7cuXKSBX1WiXumGcUKkFuAznHARlpqHq1uGgJGP6M/Qqh+Ilu6mLw4gGNK/kr0fXYqqVXhDJNFmeVm4UnyerR4A/WCkDHG8aYBDmqF6i4l9C48pPKCDtKJPxPqHwHhnL2nBzJWWLpJO6uTv4Yl50nADyFQ/3tv9530ACS60+db7MRWMNYCVLdoCqKPzOoWa6WpXguXyx5e/dakHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/I/22Z2oVsG1IyKTu+TUts7zPyN/ZLXHjCb4USg+lXs=;
 b=JeV9/9jcqrYOC/QSgDHCMJstmTvZq7MJcM75Aypz8SujQgVVUN8V1o+fV0i/ceImbb0frykyzMj+0jAiMfB2a7mEJfKgW63kqxtbOl88P9GBmnqWjiZWrU2qmBhVfzQdlBxuq9g9YqBUH5fTVGBrkDaLHbE2klsL7HJHQ1azs3xM58eDJQrkB1UO6AOISpfCz1Kz9J5fs6IQhy9UmpFa22+Hw0qbTDsC2+ZN3kKc3sB/RH03vZ49WDZmXeHQuUnc0M+B5kVnddX6zkofUtYAeq8LXX6yV31e5nZJ1z4DaRNtIC7998YAr/nOOrMJ876Td6JMB3S2qpBZWn+FGVwwVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/I/22Z2oVsG1IyKTu+TUts7zPyN/ZLXHjCb4USg+lXs=;
 b=SyRZYby6nlS8s2j+CvSqY0WHOm1iHmmZFoTByoJl954o4FWPgCRzoUcIaVdKmi+OocerPqJhEuW9HEpcEUCXsXkb3g7xNMDWBjkOTmedTWbP3r+fNLc9zxv0BnNC8hhRXycVVJFrBu/WhJCFJXDnJVq3IxauaJXPqvieLynHk6Q=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB5488.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:53::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 00:14:05 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 00:14:05 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     michal.simek@xilinx.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, mounika.grace.akula@xilinx.com,
        manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 2/4] usb: dwc3: xilinx: Fix error handling when getting USB3 PHY
Date:   Thu,  6 Jan 2022 18:13:32 -0600
Message-Id: <20220107001334.991614-3-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220107001334.991614-1-robert.hancock@calian.com>
References: <20220107001334.991614-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CO2PR06CA0066.namprd06.prod.outlook.com
 (2603:10b6:104:3::24) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c644122-aaac-4f2a-1fc3-08d9d1729d48
X-MS-TrafficTypeDiagnostic: YT2PR01MB5488:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB54886DA5891212FD7E70C124EC4D9@YT2PR01MB5488.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9UwhxZZ8vXRQtTcfs8sB2bmxwCDCEkJV5BNsivQywo/Kiih7A+YK9DJzUb7foR6NV3becbpPw9TC8UhOgb6YxSZrR0pfSz2gGkF0B8fvlHLfrXrilEFtvpLytNplIJx/8yqLApyIU2AmU22QDh8MFi8xXBItO+ALr/PqAKe63tZ0WjcSvLN+BTnyJpsw04SzbsIcNspk9PC+ZkJd3RRTI6Www9QLHmxdCpUbNKGc+majksHDZ+ihohNGF+NcwnbGMHZlcqXTheEVTj89/3irBt5kHtLRK/uWM2ArGnoXzZq8dlX9vRM9OLfkqGeqzsnmMPmVCZqPpkJXmzcgw85/NAsAb3lHEoKrcOqUpBjCjtNZHzWgHU6tERhfFRZuWUpFR9VF68p3KEWYjh35PZDsUX92krtCm27v87JPKZIlZwKgfAf26WGOhER/mFBj9ivFmktZCWyBYUrMX7oo6u/jG+7uNZpjecL0tBx9RgJsN6OYUnDcG3cLZHeomBLUw0r0Li7E3/1KLybyiqUkKkdTZ5ZZ7mgClR6QojHtJ3hl9pMdyE6Dg+WnCd2hMKO+mdbkPG7xZ8J7Yfi2BmuP2a1r6F1H26XQW+11YeZ4PVcYfUxCqnqzYsPxfJnj+/cn2oS3xU+yy1TPscVQXByLyNQwjGc23DdXWlfoKm5N/GSnflmsjPgaFiMbWGFEyWPcUv2RlgKbjibhHfA3BqQrGCmohw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(6916009)(38100700002)(508600001)(2616005)(26005)(316002)(6506007)(107886003)(44832011)(66556008)(66476007)(66946007)(6666004)(186003)(86362001)(6486002)(6512007)(4326008)(8936002)(8676002)(36756003)(1076003)(2906002)(52116002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jOZ0q2DKUOFGtI6tTgqGTeKN49IRkG0KYyDMxgZqPIxHc5YPmmpklfdKDjVc?=
 =?us-ascii?Q?CWW+ixRAmFd99FtBgdwEQN/VJJm2KGrc0Om02RHQ8LDpU2SlXNE1cdE7+W4y?=
 =?us-ascii?Q?iKzqoMJz+JnO+E0l1Y1LhZifVjJkkts5FY8ZN+7ihoMsz/sWlrQPVmHa66Yk?=
 =?us-ascii?Q?u7sOWrbHFi/P4lzb1zgmBxOZHypC1HApDI1RuVMmet4x/Liz5xSO25MN+LfX?=
 =?us-ascii?Q?+RSsD56JiFFrtMrfjnFyrEAHbPhXO9LkE3v1n6PtzIH3c2ko4uUYESPrIY4z?=
 =?us-ascii?Q?FNMRCqHSCySW0SJEPLSiTsLBM2c40/PT9tQArpWFthucTWs6vnCCxp4YjVO9?=
 =?us-ascii?Q?9ywZLQi0z9OVrUepJgTzwZbFpyqUoEyFA4GF/Zxx5MnbiXzxqOUNVTgK7JPO?=
 =?us-ascii?Q?Jv5HCmstehiXci+tTXYMRYY+el+w0zjaAaSTKVWuNvBDGSvOhFt1ztfmAKcy?=
 =?us-ascii?Q?lJHJczbSNcHRR4XVqybe8iX3xlwOAl1wdyiZZ3ZXwyEZ0q5uXQ0cD1CzHkrD?=
 =?us-ascii?Q?5kwU1LsmWKqeXIhq/17WOm5mdtmC0j9JmA1VSic8jlhAunlvPdzm3Zky+xTT?=
 =?us-ascii?Q?Kw8Rxzgg7CKfBFH+daQuTAacqaEDGymyy9LWvV9pPY+jk5QIyAFA/WVHlcz5?=
 =?us-ascii?Q?pxCgwJssAKj8Af2HIVpWfqtS+EPOiUKFzsickA9b7Ib9jdANmgqXovhHfTZO?=
 =?us-ascii?Q?S0m2au99UvgxkAsdmCWcutxUs9600I1d8MEqhV8Tmqn95lyyGyBPMKEAUnWf?=
 =?us-ascii?Q?aUIBOHthOHAUdwZ7W237FwE7RwvZmxgivMHpwdEOZQDyplkMlp26GXTaCXTR?=
 =?us-ascii?Q?IobMKQF8huwf/M56gsGZzjFKI7BMXHdnGDJl7y5dUEBgHHHvVXvACtFjJU+2?=
 =?us-ascii?Q?b8Br2BZv6OJTfQrrLno1eKOmpQtNfytK0CqC8Q7+k1uLHKKwb0YNedgaTn2Y?=
 =?us-ascii?Q?wyf5sKCBU5N44h+coEPIJ8EbApt8LI0yYs8CvD5eE036Y1MISy/ieblVHuJp?=
 =?us-ascii?Q?46P1wFIomQr6yFds1GZUQ38Iak83dll60C/fk7Iu6Y69tlrlInb3S6WNZuG/?=
 =?us-ascii?Q?E4ZzLMrEQh2GyJE5ZJKqVGVmjdjF3ylhhwWmPnOVmH3/63YTO3SkizYpX5ms?=
 =?us-ascii?Q?888/LQK698tDdJ5oW5Ob7g+nOOpOOkh1H8s3ASVHk6s5RCrIT19UQUQc8X3R?=
 =?us-ascii?Q?2TA6LcVIT3LMPAZRI5FhNB3CE+iAPxhf9Na5ATRZokUpDE900blQpj9jx/cd?=
 =?us-ascii?Q?fvdvNnVgpEh/ebpZ0b+etywPnu818AZFLl4Z31Jc+T/wPVERR/j/M2Dd6Jjq?=
 =?us-ascii?Q?GCirEsncWBqFa1jFJxtynv3V6dMrYg9kFo6/UmPir0PvcV982QJND6VNEtz3?=
 =?us-ascii?Q?8yIhNnxHz+6LjQQJmGaUKXv98qqd+ZlESXjyP1KPbwbT/LBLm5sfdUxNBuwG?=
 =?us-ascii?Q?SPPW2KK6uOhsxtc3lq5XtHmlfvpgp+ewoZtQTzGIBB3hniIxd7gtGbGA1S2n?=
 =?us-ascii?Q?NVQt3QP4gQj5bZqcXrYPNRwI4PiBizhw04PWOIH8ZwGww89j/fwFZDbvXLOf?=
 =?us-ascii?Q?E/xGlW8iM8FVOwG9ydZ+M5FnW+TbMNA/z8BOuI1N8UpLsQCVtj1d4VBuMLJz?=
 =?us-ascii?Q?mmydkIzE3mSWPSFy9dpaz9eAlEKSF62j2oj2yAPbXS+g2M36mj+ejLpXBa+7?=
 =?us-ascii?Q?Cgyd8g=3D=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c644122-aaac-4f2a-1fc3-08d9d1729d48
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 00:14:05.1412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlmnJLf95ZQVlL8TFYGfEyOVDrFoXNJdBvb5ewIfbxCjeA96s5fqbLI9vPBzMbMB8FmcUBoAG2HKeOoo7wWqn3ZMX5DiD4zQGielNvXdJWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB5488
X-Proofpoint-GUID: JENv24hYfcpODexMlPavyHGAe_p1nFc4
X-Proofpoint-ORIG-GUID: JENv24hYfcpODexMlPavyHGAe_p1nFc4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_10,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=602 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070000
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

