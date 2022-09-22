Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5C5B5E60D6
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 13:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbiIVLW1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 07:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbiIVLW0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 07:22:26 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F551F61C;
        Thu, 22 Sep 2022 04:22:24 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28MAO1OJ019793;
        Thu, 22 Sep 2022 11:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=NiTemnX/lz0UfWtMvMg3KoQ2ucogVxPbOAamhFs96T8=;
 b=L2OgE/wItDNNr6d1w3BEX8xgj7hh51RiVuThDXxvDpWMACdmrjlZXfyFnjnxFu0xUOka
 o8m34wNtixjLLuavKkpJj2ALScgCfFWqOR/2zl9/sk51iP9OSaGsIGOOA43K3pNGaCVV
 eZk1GVKb5Na6zgYDONhKd/OuBqvu4sasbhp/QcDF0j3ZGrHQuaHZD8EeP+sdWzBVMUwB
 mnIxURLMgORmh3rIamep58ThBXrTVvHjJF0MEGS0Uj31mSLpzvhKTKllQhYL7jqTm+v3
 s0MFGCFlqhlbwQykrcb6/w0/ab+tOO66gO0Mvatb+zBN9xMP+OQVwiNadkhp6RAiApAv XA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn688mnsg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 22 Sep 2022 11:22:19 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28MBKuvQ010233;
        Thu, 22 Sep 2022 11:22:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3jp3cb5mee-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 22 Sep 2022 11:22:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpEPwhhHtDefpTDlv/9IML64KL7+o6h7Sqv0XvO4IOTHjutyb8fepj2ehedLC9njOEJ4snEat5Alv0rmcoP+diOpJFHKprhVy97Cf0VqGp95OaNPVp0hR3BvuFM3h49BwOCQ2hIN5Hw85g2q0XNUMvvOaMeKzop+4JchG7DVFS2G206FgN5CyyMRvIbrSEO0t9xW6b3whGhgafuDirFTvvWIlBwkT5ueWMluRyB7AgrVzas8vMGqNlttmDINxIkepoB6S2yXN2GbnVn7n1ZNxa9f0Pdix3y9OZdlOAcQptqBQhASNAjqllC6fjNs9V9ZgJabR3AL3HU88LhFitFtpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiTemnX/lz0UfWtMvMg3KoQ2ucogVxPbOAamhFs96T8=;
 b=oHnYmcPcFjIKDN/uBcG8UacsvZhJxvld2PPEkURtk2EkazU4B6RCfwpj+CqwSLkDTbbuxrLzluVIruwUxQ+3TJ4W9G/YPr0EPpJhzOoIxPf1pCHoDDy5fKMfVnuJ9H39PxUJuZhUoMpMymOYIXl+Y1JCrN17H3/VEyC8nf3R0WGyKo65la+I5ORE00N/v6AGAiAAegY5vWebN+2RDRqq2/V+vmYeErKBt7YPQbaXRMFGMRVD6r0dGjwwLE1+Yf1mb2jVttyZPTrAP6x57aNu4hj9vLGRP6RSnlap4r5hXjVKASq0xLhGcQHdVZtup02l9GCOmfklh716UWvne42VZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiTemnX/lz0UfWtMvMg3KoQ2ucogVxPbOAamhFs96T8=;
 b=p9sdKQp32lCBkPt/40hefIh9aqqTCFhs9ahobqQgoUdezgeX5oTT0w7BCGq45Ka5KMAIIaJM8WknQijGHIPelYgihkCb7sGDIaTH9rHNQbcXpZUeMhV82Mcn/Eql+Cmjrjm7OGde2dq/4I8mYRG8ZvTY36dF5Y9GZQtbtEQ7B04=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB6347.namprd10.prod.outlook.com
 (2603:10b6:303:1eb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 22 Sep
 2022 11:22:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5654.019; Thu, 22 Sep 2022
 11:22:15 +0000
Date:   Thu, 22 Sep 2022 14:22:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Felipe Balbi <balbi@kernel.org>, Ray Chi <raychi@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: dwc3: core: fix some leaks in probe
Message-ID: <YyxFYFnP53j9sCg+@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: LO2P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::33) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|MW4PR10MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: 79cb4c0b-542b-4a9d-71e8-08da9c8cb3f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CZbl264pKJSElr1GwBusKn1rApV8LfVcJDXpM2fC8wz/1DPVfs07efnfQXAQo7UH2eEoEP/K1ivoncEhX23hhWQv4HvYi+LqvkdjRHtphRVl0yoTO31PurQVTJlazvJNFPDKRqYSiqVHPLtqxSVvGZTb8PvhS3MkD84uBuRbYDBsE/ToVJftChH3w9dPZ25wjXrs7ZA9VHSZlLTxYl7DrrK1xuVY1ddrfrD7D3p8bdARkkeywclTuHNeZn0RWISKEUO290+gmHrsZRqg5bBZBIC2hbDxaKeCbmIyyVj/dwG0nlmsS+EX/35x0YzyADuMMFOUsvVz8zF5g6S6I+1EZ0RtsePO/dZM3JAxvwsBiM+htv/fP2qDTOIDuvGzq82q+/OHjy/Ht9YYzcwfyiWiw02Xn+gS1ShESiDAYcEC84/H0Gjp3hfRy2lNSb/QHcT8ICzQBcxea+4CzYiZDHSBT/QW7ScFLwnBtBrMuk+pYSWsiyyiSu6TWjN3/eMlkixuDxzbCoqEmfv80bcp0Zur9JTFUjQt+LfPdHlfo4wjjU9SVNOjK3F7OKYb2+FGimoTLUOPQvGmghZsxxh2IgSVIznkRO8efdnTWMGlrYpODlklWws9hzrOUuO+1fVJalQRk3urM0qH3f6+9rYZ8dcQBIm9qtkRf7T9D9vOZToHjJOIZ4Y5Xz8iZu+O5AKSPGRm+A3yRFDOlf/OJNIaoNxXow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199015)(86362001)(44832011)(5660300002)(2906002)(8676002)(110136005)(26005)(316002)(33716001)(38100700002)(8936002)(41300700001)(66476007)(66556008)(4326008)(6512007)(66946007)(478600001)(6666004)(6506007)(186003)(83380400001)(6486002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2mo0Fz/o8zohvFdrg9qJaGfSW5G/ihwT35VoikpvtSvYUBnVkvzZ+K3jk25h?=
 =?us-ascii?Q?r4ZK1Ex3UTzCNP4gaiwuL0sHT7h1T43W/xfCFSdRUXxmZbGvaggiMZY8V14A?=
 =?us-ascii?Q?hSosipaxnPexMDT+3AhwqS49mHoIYsDwnlwCc+hPiXwrPtBXCMgz5qZvhl9d?=
 =?us-ascii?Q?ZHNpeIfrWsMh+U+6N21zCsZnsKWno65N43lOmwYhUufer9ksCh6IWlteKmdh?=
 =?us-ascii?Q?V0H5BOGoQCgbIzeqigKOX1Vh4o1w6qsclet6MDvWko1znH4SQNgOiKXhRdgC?=
 =?us-ascii?Q?xLCakdYKIc/ybVZ9kVvHqToroGaqWd7eLa1vaL6rOXCHFDtzw++ZfPTwQOCO?=
 =?us-ascii?Q?BoaCEIUdBUlbj8yWDzzxOWwAirMHaY+whVUADL4jsHPWbfmMdIxJodrx1dPe?=
 =?us-ascii?Q?K8Ze8RSJI9VSQ9xH1G6WJD0BdTJCo7R/ffod3CjHPeTqhBgd3yOGzkNzWJN6?=
 =?us-ascii?Q?pKRd3HLU7nDqhAux+vLWRF7CtF7TEuLNiNgZw7Wt2Y1LGwIJ6mpP8G+uyBTq?=
 =?us-ascii?Q?s+V4pSN6+8a6eT8YIWT84OZVnHi0srvf4ed4aHr6XvS8TUBCDp4OGHyBS9qc?=
 =?us-ascii?Q?Hc0VV4EJ8qsJBKw+A32DfRwsbDnNSIGy+MMG4kzS7VG/V13WyYkEfOxwUOGe?=
 =?us-ascii?Q?fryf4u9m94ScPMJRZQtg6VWwMJKc0jE7EeeL81M+88Nx1Vc1iK3orHQP09vD?=
 =?us-ascii?Q?PMMTn5s/FLB8mUhji3vI0kKccbhl0LwNOkiTbxX49jdYZJ2wGYDqaV3uK50E?=
 =?us-ascii?Q?w51QJjnnCg/xYBCkOLL9oQB8xLRup0aPfI/NE4NYF4Weg9yp+6qGtA/a/hrB?=
 =?us-ascii?Q?aOKQPfwFlA6LpCgWMt0L5sZk6gYeSRGkcCQYb/digQtiNr98MhXPGcqirsn2?=
 =?us-ascii?Q?Dw7RoF19xYC/h8nUKKzPX679r0oRSieA9wzibSoPQknR1kSKaXEAIrO5Q7ac?=
 =?us-ascii?Q?KhotrUNEizAAwWj5nj5GypmsxzzaBv5hWimlLOGojlndvRyd1ayoOar5DX+t?=
 =?us-ascii?Q?ScP5YpxOKGx48qKgaWEvxV3Y7nWsLo4XxauwHr5M+U771ZC/xe2oRT7CYbii?=
 =?us-ascii?Q?atFK6uSA7Xl5ctuhZB0+0noOxlwnVS6uuh60wuD9TlvPxik6OT5iXeZeGi1o?=
 =?us-ascii?Q?4OI7kTvcxbrYVUYZal8bmCN1PHG0GaqkQG4sODZzh2VMb/jPyCdz1HiyVOGK?=
 =?us-ascii?Q?gAoORtSuwFTp3u1esbAcslZwPVElARp5PrpTY8lpVzzMgXtJ1BzVezddS7bb?=
 =?us-ascii?Q?iNGIzDV0K33goe9T733E/CS0fKF+dfuWU2orIBH9oOfBw2TYHvi74QgweG5S?=
 =?us-ascii?Q?+nko9sQJ6X4CGhiWV7U6G3LBuJqn35tuDF3WO/9b8cE4K8l33QSNC7vbGEpe?=
 =?us-ascii?Q?i3/H+mfvU7qDiY83xEkAKUHjDhlSA3S+KBiUDYhbDpE/1OaaMsoE3j+nv4F5?=
 =?us-ascii?Q?+lzj8oAPcrFQZ+/QN4hX4wYtjjtwzAKmUxJI70Tku7s2/BgCyYjgqFOmeDrH?=
 =?us-ascii?Q?q/1YBR0tGt4J8Buf+/5WI651GI287ruyObg3lI2VusoaKqDaC/V1q6xilWlb?=
 =?us-ascii?Q?Ynx5GREQIK/W5kVc9jwbdIQYNB5B2vuM5jdVCS8eeLaD4tQ8D7zUiHOdMElQ?=
 =?us-ascii?Q?YA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79cb4c0b-542b-4a9d-71e8-08da9c8cb3f1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 11:22:15.8083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0a0vfr2I8penuqXFYYV9NoLT+J1WMv66FiHQR6PtnKAab0tEtkBJ3QPHIyTRqbPkfw5qXZZr9JiVLrTx5B7ZApRWfyRD9dLpIhC/CzroOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6347
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_07,2022-09-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209220075
X-Proofpoint-GUID: IEGQWUg7fxLzXDbc3dYCx-UHOE8ORyfD
X-Proofpoint-ORIG-GUID: IEGQWUg7fxLzXDbc3dYCx-UHOE8ORyfD
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The dwc3_get_properties() function calls:

	dwc->usb_psy = power_supply_get_by_name(usb_psy_name);

so there is some additional clean up required on these error paths.

Fixes: 6f0764b5adea ("usb: dwc3: add a power supply for current control")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/dwc3/core.c | 58 +++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 656bbf9285a5..92b5fea9fe3e 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1753,8 +1753,10 @@ static int dwc3_probe(struct platform_device *pdev)
 	dwc3_get_properties(dwc);
 
 	dwc->reset = devm_reset_control_array_get_optional_shared(dev);
-	if (IS_ERR(dwc->reset))
-		return PTR_ERR(dwc->reset);
+	if (IS_ERR(dwc->reset)) {
+		ret = PTR_ERR(dwc->reset);
+		goto put_usb_psy;
+	}
 
 	if (dev->of_node) {
 		/*
@@ -1764,45 +1766,57 @@ static int dwc3_probe(struct platform_device *pdev)
 		 * check for them to retain backwards compatibility.
 		 */
 		dwc->bus_clk = devm_clk_get_optional(dev, "bus_early");
-		if (IS_ERR(dwc->bus_clk))
-			return dev_err_probe(dev, PTR_ERR(dwc->bus_clk),
-					     "could not get bus clock\n");
+		if (IS_ERR(dwc->bus_clk)) {
+			ret = dev_err_probe(dev, PTR_ERR(dwc->bus_clk),
+					    "could not get bus clock\n");
+			goto put_usb_psy;
+		}
 
 		if (dwc->bus_clk == NULL) {
 			dwc->bus_clk = devm_clk_get_optional(dev, "bus_clk");
-			if (IS_ERR(dwc->bus_clk))
-				return dev_err_probe(dev, PTR_ERR(dwc->bus_clk),
-						     "could not get bus clock\n");
+			if (IS_ERR(dwc->bus_clk)) {
+				ret = dev_err_probe(dev, PTR_ERR(dwc->bus_clk),
+						    "could not get bus clock\n");
+				goto put_usb_psy;
+			}
 		}
 
 		dwc->ref_clk = devm_clk_get_optional(dev, "ref");
-		if (IS_ERR(dwc->ref_clk))
-			return dev_err_probe(dev, PTR_ERR(dwc->ref_clk),
-					     "could not get ref clock\n");
+		if (IS_ERR(dwc->ref_clk)) {
+			ret = dev_err_probe(dev, PTR_ERR(dwc->ref_clk),
+					    "could not get ref clock\n");
+			goto put_usb_psy;
+		}
 
 		if (dwc->ref_clk == NULL) {
 			dwc->ref_clk = devm_clk_get_optional(dev, "ref_clk");
-			if (IS_ERR(dwc->ref_clk))
-				return dev_err_probe(dev, PTR_ERR(dwc->ref_clk),
-						     "could not get ref clock\n");
+			if (IS_ERR(dwc->ref_clk)) {
+				ret = dev_err_probe(dev, PTR_ERR(dwc->ref_clk),
+						    "could not get ref clock\n");
+				goto put_usb_psy;
+			}
 		}
 
 		dwc->susp_clk = devm_clk_get_optional(dev, "suspend");
-		if (IS_ERR(dwc->susp_clk))
-			return dev_err_probe(dev, PTR_ERR(dwc->susp_clk),
-					     "could not get suspend clock\n");
+		if (IS_ERR(dwc->susp_clk)) {
+			ret = dev_err_probe(dev, PTR_ERR(dwc->susp_clk),
+					    "could not get suspend clock\n");
+			goto put_usb_psy;
+		}
 
 		if (dwc->susp_clk == NULL) {
 			dwc->susp_clk = devm_clk_get_optional(dev, "suspend_clk");
-			if (IS_ERR(dwc->susp_clk))
-				return dev_err_probe(dev, PTR_ERR(dwc->susp_clk),
-						     "could not get suspend clock\n");
+			if (IS_ERR(dwc->susp_clk)) {
+				ret = dev_err_probe(dev, PTR_ERR(dwc->susp_clk),
+						    "could not get suspend clock\n");
+				goto put_usb_psy;
+			}
 		}
 	}
 
 	ret = reset_control_deassert(dwc->reset);
 	if (ret)
-		return ret;
+		goto put_usb_psy;
 
 	ret = dwc3_clk_enable(dwc);
 	if (ret)
@@ -1909,7 +1923,7 @@ static int dwc3_probe(struct platform_device *pdev)
 	dwc3_clk_disable(dwc);
 assert_reset:
 	reset_control_assert(dwc->reset);
-
+put_usb_psy:
 	if (dwc->usb_psy)
 		power_supply_put(dwc->usb_psy);
 
-- 
2.35.1

