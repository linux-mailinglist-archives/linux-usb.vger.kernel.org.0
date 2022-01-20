Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C80E4952E0
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jan 2022 18:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377218AbiATRIo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 12:08:44 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:33298 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243979AbiATRIn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jan 2022 12:08:43 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20KBU4QZ019111;
        Thu, 20 Jan 2022 12:08:37 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2059.outbound.protection.outlook.com [104.47.60.59])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dpmt68p0h-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Jan 2022 12:08:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSZ64FapiN8674qhLHfGI1O81sOwoOGFoP5Xtbd/cwgcj95axGgrrVO/cQnB5McCXfKqyCeSJwT/nn/RhYysxQkWEZ+/TPZqdmdM+0+WivnO9LyWFX1bn/VntZcExsiQUv9h4AlkC/4c6/xX0Ub8fUWGTfhl2wG0+zWXe6oAzrT3MM8nKN7VbJ5EBfsrmdogRkOPF0Rkmgp1BwOLmgN4GsNuRWcsPQyM9++gFoVnASv4cbVSXW+yn1qDh61zRH+9aDH5yvx/geuUXPsDvO2msZgL727qKKB7U9TbpHMOfYgp2hphJKU3QThG9WW2mN7eAZ8yvJNxuLWOSKE23hkjjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+D3fgwE77//+LJ/u59LDGJ6v9aP+LrJdh8IqVspVkwI=;
 b=ANjYbHIK+9egoBOl6AE19hPsfJnN3Rl8KQTW35j27pAYP5IS3XbyXeC7IStTsktgtGruGVyw1ePN4p7U27qCwfxdv2dsZRxvL7VUTtz/5CC0taKQpjYq739ZADSNZCystkBTugJOEYZZ1kTVpUCfglqtahp158hrysLA2+AWbEYgwQW2IIf6GSHe/xCwc7f42HAsIOZ+tIIPVry1DVAbhpTISVSjgjeY19TYUYruaiGko/Up2+Y4xUCY1lnilOuj5pY9yOdgU9YWB8+xO+23K9Lvrn+Ijb3bGin1uefiKdCQj+zz9rAT9Jbl3EsFdeP1VdSxJUGweRoGNtnVr2T/WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+D3fgwE77//+LJ/u59LDGJ6v9aP+LrJdh8IqVspVkwI=;
 b=gWzVvvyRz5BGuR6KHC2eXZW/LaFE8c0SJBaMwMjssk09jMIULESoAkEPMt4KcoYr68WQ5PhX5+ttfTFHw2vOYjIZjcaocckP2PLVa05qRB/TWD8bbjexUSCiGwdDP7n2OmtTMSfZM/E33hclk4RPEbgYp32yl7cgJB3/HBv5FpE=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB4463.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:3e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 20 Jan
 2022 17:08:36 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 17:08:36 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v5 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for USB2.0 mode
Date:   Thu, 20 Jan 2022 11:08:17 -0600
Message-Id: <20220120170818.1311306-2-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220120170818.1311306-1-robert.hancock@calian.com>
References: <20220120170818.1311306-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:610:e6::16) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1b10c4a-87cb-4dd9-0394-08d9dc377ee8
X-MS-TrafficTypeDiagnostic: YT2PR01MB4463:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB4463DB924EFE147B2361D084EC5A9@YT2PR01MB4463.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uKGnuvjiGrkmcbVHBWtdJheKyKkKXAgvaATMCX/hSUDNSrGPzB0mJe/rqvnnZDb0ouxbCA0hzqjZY5sHroXmULnXeUftQC2zAbKg5oqRrLcfwI+HSF6mGKJHelYQNuAV6ZIJQQKLdRzYA5jyIcA0cGpKIsqemcE/r6pM4WjgLiekyqGKqW5tmaFib9ZMB3x62HhWrZbo7JBrm6Xw1dMCH7cA5e1OecuYH6BQLxpG1qT/pNoQ4SRA+Z3yudLEVyU90W4KJYIViDg/2zxyyTsCkvqtMLMV0g9jcFDAahb5ayfrTox6eYDXM1/BNJK1AzQVeiolG5FfFE9Lb7m4AwAD/eunW6q38LAkjFiAX3ncfxkna/QoEprm9aY1ma6D4skNd4yap1VoKS8JYKWjXxkwzbR7RhotYuC3FKdMdJpHgYXLrpjoF7+DOqSNJGbkw4Z/kpvAjexUYF10r7TbbpTH6xwVMsl8wbMyuoSB0OffpU4Wn54suZ3mPLRiWw4uEZnRgTxFBmoTh8g/K75kiqNhVZ1WtUk6QxFVeO0eZx302FJlAcp9nDOhuu26CWBmbFt2nGpaTGOLGvFwPX4W5o3Fd/9KbhGxFpBjYw6a2Utt9o5FaNSEEK37WRjwA1VPB1+Mcxm8uwOTIoGEJXSa5IwMoOP2/6Gzds3OkmGFn4TMykDX7hEYL9bRe8gqWPtX6ow12HXQ9w9DxYiAHYPA+Xc66Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66476007)(4326008)(66946007)(6512007)(107886003)(508600001)(6486002)(6666004)(52116002)(2906002)(186003)(44832011)(8936002)(83380400001)(6506007)(5660300002)(86362001)(6916009)(2616005)(26005)(8676002)(36756003)(316002)(38100700002)(1076003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EpUmU4C35QqyuFcQEw2xwiO8VdUNlDPBLf78MF/r+EjceaOTraZk6vTtjhPX?=
 =?us-ascii?Q?QzPIrrrO/19e7m1xxpOgVlFYAPA0Hz6FjbfOnemdIKNd7zwk1f4tbHX997kI?=
 =?us-ascii?Q?s5qj7bav+PzSs48qUp3Do5aHH/SnOQFtrrLOJRh6LXcKP5x+iIeGkLlJPQQN?=
 =?us-ascii?Q?domVSl6/hUh2vJjK1GMQfSXjvd2DMiaD18syUghy0pqE2v78FYI64TQpCQuO?=
 =?us-ascii?Q?q95kW2SgCwNf3xxQ6AGoHVmfZfHPcz+g2wO4not/L3OmidtZP0qKfEE0aq/M?=
 =?us-ascii?Q?Zod7V3kwxf6ThV28akUVkSD7yESWzZEi4jdcxGuBons33LG3YvVt/9HFunt0?=
 =?us-ascii?Q?Qh8fCMCGx+Bsm2EjWrlQdPxLUtU+ZdW+cbOc1F00LJEJKXc1GYAejPgVFOwT?=
 =?us-ascii?Q?8epyyrwMIJYSD/SakhotfucZRj/jS1Xzyxo+hnqKPhc1XsbcFZY6va2uLsW4?=
 =?us-ascii?Q?keBqnjYlPYeqkaE54mh3nLEJmhBk2DiWsu18mzqsqahgaXWCMA47nIPuqR7b?=
 =?us-ascii?Q?5/8IrodSor+E0XY8CgvfYFDKmI0hbjpywJUNVBSVGKPG3/rHT4u/IRQXRLCF?=
 =?us-ascii?Q?RArNnI5Zz5WK7wkOZXUhxHfKY1hDSITLMBZZqLi9qkMUi+rzivfnfXliRYkR?=
 =?us-ascii?Q?z7NlakKtNJ1TwUGanVJbef/B2aYHzaGVUIVxPtbwN21IGNM/zbzWD1gMJZ1M?=
 =?us-ascii?Q?CCQBmUnGKXfD4H8KG1LTM8HrfS4qtVjbz6ObXreENuQaw3OkPjV021GZMaJx?=
 =?us-ascii?Q?qvTMioHz82NIzExzvfNFwOQQCbTLnW+VIwyQ2NKLymXXb89cI2/px2mpre8l?=
 =?us-ascii?Q?9Ib3YsAqoQS78UELDMUyc+/gAfeYQMkbZ/ubyg9n9KA5VXI1rfc6szi6TVHU?=
 =?us-ascii?Q?4P5nMs1XfyUMhjO++VnxjzO3ctYIZKz6nMY8xu/G91c9fjopVpqUxeWjVKyk?=
 =?us-ascii?Q?CMJIxPdjcCpieZJTXBVtcXOnsyAdQCfWsBJEMiLq6HUN8MjbP5NWr1NRv2af?=
 =?us-ascii?Q?2+sYAWnYA06HlG2GH3nzwCWHA7r7TwcAxl3qUtwUIGYP8LoSuo6NwHNUuVrH?=
 =?us-ascii?Q?jLtulqal1LifVXSC/4ikZznuc9tS043HJQlPftSbO+MeYd4LDuhrm+JTQ4xi?=
 =?us-ascii?Q?OTlwQy/cFf3bsUEe9IIqUyGM4rkagMRIVAmYuHmiYUlBoVUpUfjvgaL8XqWj?=
 =?us-ascii?Q?17+UjdqiY8VBEE/UH9C5ii5XzZ3zPdx4a6ed5EW/HcAPy1hAX1yOJXBkoySr?=
 =?us-ascii?Q?E9x+gbqxaSSC8nfIircZ2KeqUwh1qqtkbanRacLw9lAShjUDuhQYH3xe13ZJ?=
 =?us-ascii?Q?VSl5Znjcc5wRnPTWYrbwhJ0+GiH4SCPdP+V1pZkUh5XLu+uUMrEanFuiBoEO?=
 =?us-ascii?Q?83k77a+tvIRbX/UJhF2E8HHpt1ZDnIzMlAmHvMIdjvFa4vrqIkeQzZPgkkQM?=
 =?us-ascii?Q?pAPBOVOdevbQ2iAaT5LFGRjQxnKb6bQfQyQcKpfVVF5BhUF65NkCiGiWOr6s?=
 =?us-ascii?Q?lUK6GQw7zYhmhNatgdiLWexpBJxN+YTBuTT46GH3jvXBjOw8sgXjT7/Z4HQb?=
 =?us-ascii?Q?PgFGob7gJHAWqzFQ6tPVQbZ9TUXKO8BE/x8+ls9t3G/ZshF672BpqiQxDvnT?=
 =?us-ascii?Q?NHLlrMM4Jf8oErcAuYSCP7ZzWfei0BeiCI4J3NnPfxQB29qvfseWADPeqLnX?=
 =?us-ascii?Q?pEDLz98KC1hI5hvwUobj2sdXLQ0=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b10c4a-87cb-4dd9-0394-08d9dc377ee8
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 17:08:36.1800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +w1pOBkobQEQVe2MZeN2NLiY4f/LKyFDjf2+ySniptMs+Z+xMzOgBAj9+FLVJNshiWrUFaSxvanIvkf5S3qOP2nPfLHsPhVl96LKQtdhtK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB4463
X-Proofpoint-GUID: nzkXhzk2fMsd1Oj5LO6wDjWAGa7v2E71
X-Proofpoint-ORIG-GUID: nzkXhzk2fMsd1Oj5LO6wDjWAGa7v2E71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_06,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=905 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201200088
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It appears that the PIPE clock should not be selected when only USB 2.0
is being used in the design and no USB 3.0 reference clock is used. Fix
to set the correct value depending on whether a USB3 PHY is present.

Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 9cc3ad701a29..3bc035376394 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -167,8 +167,11 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	/* Set PIPE Power Present signal in FPD Power Present Register*/
 	writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
 
-	/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
-	writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
+	/* Set the PIPE Clock Select bit in FPD PIPE Clock register if a USB3
+	 * PHY is in use, deselect otherwise
+	 */
+	writel(usb3_phy ? PIPE_CLK_SELECT : PIPE_CLK_DESELECT,
+	       priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
 
 	ret = reset_control_deassert(crst);
 	if (ret < 0) {
-- 
2.31.1

