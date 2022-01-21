Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0340C4964E8
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 19:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382082AbiAUSTH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 13:19:07 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:5515 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1382017AbiAUSTG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jan 2022 13:19:06 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20LCs50M028142;
        Fri, 21 Jan 2022 13:19:00 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2059.outbound.protection.outlook.com [104.47.60.59])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dqjeurge3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jan 2022 13:18:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1Xv8KHOP9pcgfOZqj0SQdg+USIufjSv/ZTEKXSkJt/Ti70gDDI2rFbkwtYr7A6YpsdXRk2T6WbJLeY7fH1qfcL1lfRhMxctIPOOk3jClp6vFD2g81xPHKoT3gRRaN4mvCAivl22LzRFVDPYy62hpR/rAPreM7u8WmBYB0k52cD1YBgCtdham2GEyK6/pGI1P9DUFrGoW46PI0qevzSA1PdjGijk6nXA1qAE9FPgql6RIRvMc5EgITV5hB6+1uHE+B5BAvTltGDZAr3ZMUVTPwO88DzsEBVe2qyxpixCdI/omS+nzENzsvj2e5rakh4D0rkuQdLtqZbV4xXm8PYAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/vchom8+LlQitKYroWg77AQs4AlfeV2KHbQ5grdLmo=;
 b=jO1eYiVHuKWStXzmJfvMo0RY/SOQrmC+cvAxK5XX+wmJ9/0OoXeh530Ts25nJ0ERrBYBhvtgFJpsiqWGu57GQwxXnenIYXR0gja1dTGZpOeCLaz3IKb9u9t7Ta5DWOGrQ3Svix0tJhGCDaB3LzsVhIX9kIxAfQTpE4JDtyMIG4PBt1ymwrDIXA7H3+CogwmkqGMe8BgkPCb+foeQWE1jl7AErB0EmYtluSnth72xKGJOoXBPClzb5D/lP4R1nOiltl27RywlkwHSNV6kMv3yWtarFv5gWrya9FVOtaCcj8qD4U0t5Q3Ithp3qAjK/T4k+P3tAP4am1WEzpP6KLYumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/vchom8+LlQitKYroWg77AQs4AlfeV2KHbQ5grdLmo=;
 b=qn2QulJM6XphS454UHt09A6zZzY0l2lHPCIUn5a8iOyVc/egopDmsKc88t7guG7fXcigukUNBqu409G/6PEoPHgtUB5fusy+xXuA3MH/NNztLuSg7KjJEGu3yDa+tiiIsK1+/TjYnWg0N4rL9fjNAjKOKQSCD4QgB/HU8+YW7Ck=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB6612.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 18:18:58 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Fri, 21 Jan 2022
 18:18:58 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v6 2/2] usb: dwc3: xilinx: Fix error handling when getting USB3 PHY
Date:   Fri, 21 Jan 2022 12:18:41 -0600
Message-Id: <20220121181841.2331225-3-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121181841.2331225-1-robert.hancock@calian.com>
References: <20220121181841.2331225-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0067.namprd04.prod.outlook.com
 (2603:10b6:303:6b::12) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b9a2a73-c154-4880-bd10-08d9dd0a7dbe
X-MS-TrafficTypeDiagnostic: YT2PR01MB6612:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB66121CF1AED75D069580C096EC5B9@YT2PR01MB6612.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bUtciXHsoymPWGBIg6K36S+an87e4YJfs50vtgWXn9YnXqxZUWbIEtxnfEJTn7DidTOR/ZofNNt8vjVTmzviuWxCccZP9S3uifQ7pieLE+B+4sED94oWI3MjGrXxK09+OJXsS7d/X7RrNiyPOLZ/B0NYo7mvcaSvHOWIYgDouj1zMzaiiKGTJqm/lfk39YmwSD78VmLKx77K8hQm9nTeOkuRV8ogJ3170KlUkdGaOSv3jD2dXBOzf2QXKH6vasVBV4UL2WoVmuFQMCWOfuxYX7kBujgKop+A2uk+XEOofHy26rLlz6rvfcZFZQV4WaJ6voBDmjfYEqt41wN3T9EV/RWSw8x6O++nvcV0BEt/VTnP6GVBKoSDt3+mf6XNkOUjdkZFEKi6cTAfgC02F4zQRsFN0ITzJGf8mUq1WOpCoriifIy7+oTqVMruqXKbIsLXwTReUV9Ha6+sDh1JWTpfoiDrblcnvaD1eAurAqbioDViTLCQRX0CaBVf9D8kUZMtu75T17ND6I2IJC57vm6DL4+YxjWWkTiVEpUkm9PRXV4jSGKpohcTF/6uxLqAgTUbdx8pOOpsU+7MRPQcgBZaGG06lTpvvH8XlDRN3LTrp9B9ahUx80++TnrHKzdqmttsalqhYL+dr1d2Co+Lwj9mGc49o/RjuoDULfdh4kHywLLbVIHvMGHqqF5L5XBSNhg3BaPUUGPoB1HrUmEmWWldBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(83380400001)(44832011)(8936002)(508600001)(36756003)(26005)(186003)(6916009)(6512007)(1076003)(316002)(107886003)(6666004)(38100700002)(38350700002)(4326008)(5660300002)(52116002)(2616005)(66476007)(66556008)(66946007)(8676002)(86362001)(6506007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?egwrX0iNCqB/1XLSwLofT2HJNxYhfZ+N5bHDnXKavo0xyVml9YpdwjEwluLi?=
 =?us-ascii?Q?3T2ePcxnPGPCr3m1Kv3NtJCZWs0cfBeGl56rAmT3o88itEXvNu9VarS7qrkX?=
 =?us-ascii?Q?/hLOTpkifz0AyV9i+IjYaza97yZETLHGVpLNYmDmRYlvc2Vkr3RPgLQ1hQ5K?=
 =?us-ascii?Q?TdItexTwf4Sgw9zC8G6CHxUrht6dPhieVSRlvZjhTQRyoBmF0yKHPkrUgMRs?=
 =?us-ascii?Q?vRW/T133rP3gEjQGtBj2GaMNCPSPVCJdUCFfPf1nMrpHiI0kmzEypfM8c8Ik?=
 =?us-ascii?Q?U2W1l0HOo46MKwDn3EZXjPpZV1LnzydaiQ7U7Ju1awusMVC14eYkb9vIdOpo?=
 =?us-ascii?Q?xmSHqyWn3dQp6otFM3/siyUSKJyrx5D8DV32Odr700oMYiiwgYWU3V7CjVXe?=
 =?us-ascii?Q?4mCrFY085aqnfthEzUGMfmpyMwjaglNOwcmbKmIkWGpB25Z9rMYYJq0FG5Lz?=
 =?us-ascii?Q?lErXhCkygGw33SMJ5mi36HFffz0kggLLR8eVKNXNBJY4LUaW+ryUFvygh7XD?=
 =?us-ascii?Q?JFplCmTehM3h6N3IceG+kmKtjtV9BR6OuJKJWYtU/mfkncIUY9gyOKtpc0YE?=
 =?us-ascii?Q?3/yzxleWJH2A7f7mk4fJZy5pLkU1KqoTHCbufaFKSj3xT8ch2Cs1o0t5T3v0?=
 =?us-ascii?Q?qFhCdwi1plY0Uz294HRgJPVtrbbiMC/t53UFGlsP6nDQiZFd2Zvxp3U4mfFn?=
 =?us-ascii?Q?5dvGTNV7X7MJQdConfZmkwTEc9X/3zAq6W6FKVY7BSXIXCyTNchofUugwCHD?=
 =?us-ascii?Q?1T3dXOMb2xrWJ29eHTz8S4RZt1AC2ypxve84mKfnHzrK2yATXxBJ0Q6tZhEI?=
 =?us-ascii?Q?RT6iUuQ1CLAwdFFYAKLjMxaY8k/QfzGBJSb0oztWcqaw7WQ0fAFIsO1En1aO?=
 =?us-ascii?Q?Qton2PiimZBzfZRw84rvfEteetsqkjCXnssS+jRN/RlHeS+VxYkJOg+iacKF?=
 =?us-ascii?Q?46YgPU0ckXYG/pJVRqnMerl7NzSROkkscF4JuS/Xj8GvDvt6UwdNaXCd0b0o?=
 =?us-ascii?Q?wS/VrzhHRvCi6EDb1IhT5uMPaCd3RnT1L9crod5jpIdrPdUKt8EoIJiJAC4O?=
 =?us-ascii?Q?s9iDQLmKQa1/Nb2JdNtt7epPja8QPmVgaLVCiImoXg5B/Qc8kHh0RdoW2EAn?=
 =?us-ascii?Q?ZEduY41SaPa9YPbWK34KwD2cwNC6nw+1INUljZFj8xfrpwXGlvq7UoMMX2qj?=
 =?us-ascii?Q?+BamUzeTWKfSYeNePduCJH+YobYf9Ccb/1+Cw7fFmqwLq4+z62JN4l9+s+pL?=
 =?us-ascii?Q?NApuFwbQFj18Psk8BURhKjZk3GjZzRU+rqFce7ab4hOZhWEwyjPQHlZNLbgB?=
 =?us-ascii?Q?NSLqRuXHyT2wDZkv6IZ4x6fjTp8QleN9gFf1oBtJNZ7kK2YOLyzfxKi5Jk6V?=
 =?us-ascii?Q?vUtOj2OqhG6ZXwFqmMx8toV5Evak9t+qGVHF74bEI8KxsNtVn1hHFi7q9m9M?=
 =?us-ascii?Q?drhWpCRt9aVKz1u9kU9qQZ4hXldakjgjVznFa5cfI0+V0zpkV48n0JaCYrJt?=
 =?us-ascii?Q?7wd5Qpq62oUQI5gr333fA3u0aJS16zu9YvY0m5r+AsdzRe3TiASXi2awexYm?=
 =?us-ascii?Q?E/ETLkHqBMwr6ApakCPCNTE3y+JpInF4DUIJFnIodAqic73RREs2HoxhmGbq?=
 =?us-ascii?Q?grfjKCooKUOjPGSAKc3X0oE5SBF8RlhKmPAW4me0Tl5WayzISRI/yhPYLBbK?=
 =?us-ascii?Q?5IUcE6y6S4rgXGRfPpquqV2M/gg=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9a2a73-c154-4880-bd10-08d9dd0a7dbe
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 18:18:58.0417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZaMS2MECa6ZKfyXM3mlYWhbjtfV6bATgBWBXk8hCya/C3ipodFaHNaGARfIbKuoy7RxisYdo3CXZ7MuQWAhWHsJkqy/fdbsuArmy8DWMUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB6612
X-Proofpoint-GUID: Whf0GIXIvYWkx6_oeFeAY7yuy-IH9kMM
X-Proofpoint-ORIG-GUID: Whf0GIXIvYWkx6_oeFeAY7yuy-IH9kMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=656 malwarescore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210120
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
 drivers/usb/dwc3/dwc3-xilinx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index dd6218d05159..63490c261108 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -102,12 +102,11 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	int			ret;
 	u32			reg;
 
-	usb3_phy = devm_phy_get(dev, "usb3-phy");
-	if (PTR_ERR(usb3_phy) == -EPROBE_DEFER) {
-		ret = -EPROBE_DEFER;
+	usb3_phy = devm_phy_optional_get(dev, "usb3-phy");
+	if (IS_ERR(usb3_phy)) {
+		ret = PTR_ERR(usb3_phy);
+		dev_err_probe(dev, ret, "failed to get USB3 PHY\n");
 		goto err;
-	} else if (IS_ERR(usb3_phy)) {
-		usb3_phy = NULL;
 	}
 
 	crst = devm_reset_control_get_exclusive(dev, "usb_crst");
-- 
2.31.1

