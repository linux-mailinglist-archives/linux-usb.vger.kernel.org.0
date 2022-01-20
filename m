Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B7D4952E1
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jan 2022 18:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377222AbiATRIp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 12:08:45 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:34148 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233179AbiATRIo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jan 2022 12:08:44 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20KBU4Qa019111;
        Thu, 20 Jan 2022 12:08:38 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2059.outbound.protection.outlook.com [104.47.60.59])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dpmt68p0h-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Jan 2022 12:08:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcppcVBI2e2dySMXIOnazKbpy7M4TklgoSX0FJ5WMkC5g5yNKLcLfQduartjwhQbDf3nVZpj3E0BrQk3lMulJnRU5mH8gA9DW9eNRe+yaCMZ3wArCN2heVTpV29kQvFJJLUqKsci4KZCnE2pO++1tUWSDwlrjYhQkBhlnugzigxfwDjf6Sw/i1JdwxAV4JtHSLsXnMFV0on6t/HcUXVC8yf07XsfoAhuLHbAuuQruZkoX2W4Bx3xIrKUs7B2J2UfXAnrP3JGTDRQi2ZFckuYo87PsN0rgHQIp1q/Vy5qUGMpE8EW1GhUx0iCETBcGkdGWQWYPKbrHuEtbxNvVYzjHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/I/22Z2oVsG1IyKTu+TUts7zPyN/ZLXHjCb4USg+lXs=;
 b=mcvW0KLR09epwY+JaFU01+/t2ExVBlbLu5uBMUtQzfuS2vsVM6HsNc84q7VgfhSiB9HHmcq1gy9abq1um6c+nBhedVUsIy8ti4PpNNG7072vZVOBKq39CIXxyTxDTmNLSteiyzkI0KEqM3y/q58an83r6BUl6JKskDGQuzmDy2JQgSk119XrsQyt9pPyOXfsVciaQqBrMh6bRIXoWZINDnl54fx44Nh+xK7vsmQDCGuBLaCVm0JMeKg+S2mwxB4KJjmVKJz1HOk3CK2gNEt41jXJAAe7YnVmbccp38FWjiUFtQhidXvHJJj2dItdIodSHJypS7vkusDngsLSh5GGjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/I/22Z2oVsG1IyKTu+TUts7zPyN/ZLXHjCb4USg+lXs=;
 b=2vCUhqWJyQoMByB3oAetIO9DJItyziMT8T1FULh29y4NCCgVc4kwr7JMKJo9W0266AF3PWLXe70JdAm68g44TT6DnnqLzyKUovi5ZYw4syB739f6k9YtYbOJm9BIxae3lhKZt447rG76QYYlHV9iwQYK1eVDGli4Hk2NToSYcJs=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB4463.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:3e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 20 Jan
 2022 17:08:37 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 17:08:37 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v5 2/2] usb: dwc3: xilinx: Fix error handling when getting USB3 PHY
Date:   Thu, 20 Jan 2022 11:08:18 -0600
Message-Id: <20220120170818.1311306-3-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: 73c7bfc3-8582-4a45-ec86-08d9dc377f87
X-MS-TrafficTypeDiagnostic: YT2PR01MB4463:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB44638F42486766AC45C279A4EC5A9@YT2PR01MB4463.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UW3magGS90q11q1bvxgsLTusmWC1Pt7m/xTvFMeJAy0zNEQkpYceLyYgGsdvzu/dRx9qfTxuUVW2t+GG8yddzEwXr1GrKzVXsW6amGuwtkYzbzGKtJCNtgCzziUohA61M8YWTxpX82+SyfaC7dURxuz4ry557DdL72e1/L2qI7Qlc1g3svsTs2NC4jU8+cwGi5nbjl19qdBFJ2ajBhSgmKN8sbeE05CRq8v4RyWGz7lNLPfdg8wBDNHp2qwvN+WnRsTuv/iBVEWt9Fue2k0Z+vqOu1RIulpAUfWy4NKP0IoaQJ75OEOKgynyohFq26iO4nYsbxREFoaZP3i4rjAaV0aNA2ACfcg8u+S+svebhoU3TQtzAixMZFkz7INGLu2VCs87dGa90OdgSbfUS0pH34u9VnoWknhcjLwYWR/VjWkexwexi4hTA5V17wRfLk5xIXGvO764tzuIVCBs229pb8Q75CblkiYgo4ksEfvAnHnVvS+eXWCrcMhRujZ2HCyCiZXTX1rJXMSZUOp1lA/pjnUxMqXqSu0OgimvZNZvev7AlyGk38cJqiFsiXjDKIuQgD0rqEAJJeC5QNFgKyavcwTnRxjm7BbaYHqiBVSQdQTStSTFzZyUrm6anXj5SKaGrNdQajocmi8MZyrxVWZCZ0z2rDpL1nLp2z1eyOgzZo57BRKIPSMme73kreEgoyPcfk21/8x4RSIlAsHluDgkZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66476007)(4326008)(66946007)(6512007)(107886003)(508600001)(6486002)(6666004)(52116002)(2906002)(186003)(44832011)(8936002)(83380400001)(6506007)(5660300002)(86362001)(6916009)(2616005)(26005)(8676002)(36756003)(316002)(38100700002)(1076003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DXSbDGyG/Vit94Aa/v33YlplHL6r1kuS38MbHeWoEF1zj7JPECkr6Jra0BE9?=
 =?us-ascii?Q?qKdZyWB7FFPM0/TjocAd2CToZr+c4HAvRgnRfFw3zuQghNfOnPKPZtCicyPf?=
 =?us-ascii?Q?AYIZkk3wMfyhcy2IXKuIboYq6KeJjruB9VRfoRG5VaLLJ0AKcrvTYyMLjmUK?=
 =?us-ascii?Q?a/ItBmyK26e710fos7atuGiwUKbdMOVXNpQiOUQ4D4eVBCq5w9ZiXXq7GNhe?=
 =?us-ascii?Q?4HyVwS2YbrGf0HFRNNnND7cGJdl9xaDw4jPlAgduREkz6fe7SaZgHsM6m+sB?=
 =?us-ascii?Q?7pUAEUJkL5lIeRhRpNkSn3Vj/2MMpUgoWvJzfwf5hiRlyP1hHSuWTf4MyAin?=
 =?us-ascii?Q?EJunpV3ARBY4LzX2mVnu8AXSDoy6yzPy5zTEmGMt7xA6NruzIvmC+8li4Xmq?=
 =?us-ascii?Q?W1LFp5kLJY1LZPwXxW6CEvYOfOxFGCRqyS1gA++m+ZlU4P1CHnbB/qtx0rcf?=
 =?us-ascii?Q?Dxwpd71b7qDvMB/NZkTIXvAoR102qxh/nQI31KhPkYBQzsZ8ze058qByXaT9?=
 =?us-ascii?Q?RQ8dn0NAodlZG3Qk4GIYtt+e8TN9AUO32ARwfSCMAKO9VfY8hqeCz9Uj2KWv?=
 =?us-ascii?Q?qoVnLcRf3AgFX55i6wHpW3eYaYYdwOodVrupJplM5GL+BaDZRIG6nc4FNtfD?=
 =?us-ascii?Q?Vgb3FwyJdxBucOX1kDM/MxMLW1xu3FsbmrqfcVTpUAnFjxRkZk9gMfe8AvaV?=
 =?us-ascii?Q?+EaqS30AOuHhqJB7p0GE4pubx/V4d9DiRn4f8RzsEtWyLkloj7Z+SXPJkG2w?=
 =?us-ascii?Q?eu15rkRsLFLcYq6nqrySyacrQ0ixzsRaRgW6HCVTFPe3WrYo5FBoxprqiEcD?=
 =?us-ascii?Q?3xikeUnJunhjVNh4Uv/Vd17d7QKmYOxZhlz8EAn0oXDXF3sUek8GgPz91dtn?=
 =?us-ascii?Q?nts6w4X203hCr1RhPvpWClaQ3jt3BqaAHBUj7gVPR2KBSaBfkTney9LwRUNa?=
 =?us-ascii?Q?QIe2pAyUk8yJoMLtH7H6MojQpHR0qLIlQok8bIzXfs+V8lRhMAX6kRfQDInB?=
 =?us-ascii?Q?1VkDPdZCszXA+Ih8YM1rJhcqYfeQ8eECEdpl8TSQ6RG55aQbH6J7W3Uk0lmr?=
 =?us-ascii?Q?9ZetRDIfVXQG0CWVuq3zxu9xw7JUh4nKMLuXDER36drCjzWUBXpG9F6FhhY3?=
 =?us-ascii?Q?E5E1RPXFNLkHOhZ70VkPVWNzn6st2E72bAZeNV47WO3obEHMnMYOH9OvS0Ot?=
 =?us-ascii?Q?lT/p2ZnoUah3OxzTRHvQ4DUUEwFy/JDtHODMOZPkaXed1A1O4WkIV1oL7lbQ?=
 =?us-ascii?Q?pKDhyieTSbKrCEEURUd8gumRJ7eQ3PEBNKGiDT5Q+4WuxtMNXt2pefOqgK3S?=
 =?us-ascii?Q?VyuZxLdeFlcvZjl0wWCRkaGeKQF809H2AOVYGFhQjwDbi2hmlzY8JWOxbA+7?=
 =?us-ascii?Q?WsbIYG1X1u5FTd7H5vfo5xU0ZhaqearlyonHh2roEAz/tnY+u6/gqWzzq6Vl?=
 =?us-ascii?Q?/a7T0GhLppYPuo22KmfUGqJxe8LcQ5jfnBzf8rZGJsdGtM2H0jLFLlrtvs9V?=
 =?us-ascii?Q?7l8AhEnV0/O9YfK8bLmiQt1/y+8RoWQ3o82zhWeD9tO1oS144nYjV1i3gw3v?=
 =?us-ascii?Q?rXcE82Uej4gsd9lhl59DbtZNu+ZTqyBHMOO2vIR8DRdiyIdgG/zACid6wcM8?=
 =?us-ascii?Q?liWvX6qIqmXEV6LMDqt1CY66YKJkEiiTvulXulnoaTjcOYXSHq5H6oeTgPgF?=
 =?us-ascii?Q?3R4NplwIJR/AjDp9rkFWa2/yQRo=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c7bfc3-8582-4a45-ec86-08d9dc377f87
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 17:08:37.1968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3sFYfc31UYKnzovLRQsv/bSw4PQWSgNFyqkWzjbNbBSNGKkl3SzVCqbfojIRaCXAanR6rOJ69T9lpdCSC+WnlYAwP3x9qIxG1xGJble7kcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB4463
X-Proofpoint-GUID: sJqwVfrbdKBTGpmIzASfSKif2JBjAP1G
X-Proofpoint-ORIG-GUID: sJqwVfrbdKBTGpmIzASfSKif2JBjAP1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_06,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=591 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201200088
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

