Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB27149BFD9
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 01:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235101AbiAZAFT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jan 2022 19:05:19 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:23922 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235095AbiAZAFS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jan 2022 19:05:18 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20PMTh2t020266;
        Tue, 25 Jan 2022 19:05:13 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2057.outbound.protection.outlook.com [104.47.60.57])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dsyrhrssg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Jan 2022 19:05:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1wVKbQvzSHdD3H4g7RjebSwJzqJwAn4OBu13NGYNcgQYiRHjodrJp/HQQLWccYs3+DecDPJGtel/vD+3oqumw2WurzbNusrdmSJgL2UB29WpzRVN8qmWGALj0gppknhWjLEvnbdmN801pYZ5Z28morSaIX4DaK3jS9/3OY+cz4niP8PVXByihuU0NPqqvi3SRmgga4FutN/JdvawUH2fLoHR20u/sdDy/Eh4nYltjW7uIP1hcS9wt1isP9QRDj9U9pK19W09dZrLA/J3/Vq2D+kvReAoSTRs5DykeixxHEeLdfXhgcsGTwTCwia7cXjxst9ecIk4iofnmakDHafwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghBXjrKj4h07yKXjMO/OAnSWqzE9kD4yknqRBRLKyFU=;
 b=gXjsKDeKBoKZ7Uw+/VyWa01+xMChqoOh6ppbIWi49aFitS608CSUxHs8zzW4whzBS/N4z95bL0dwB5MvxuRkAJNVUN6yvfUrTUloMOOzPrHSAvO4/dasTLndy6tvT+2dsTk11dq/bbHSl8pBOXakMt4Quoq4WkbkMlvnd4a/np0KRXEiKeh26sRik+/CtrMl0oLcBcCcLY8XqIY+VaZYXuogVOF9xnU3UTbWVVa0+8zxzVWoYOBlOJfYtSuTFwsnKrjIKDA/CgJG1AzHo/3PbkV79Q6uNb1kMkPV5Pa8bqn/SCeyu4QRx3J7yOD90DQu95ZAnTiDK2hU7kQ8qq4RHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghBXjrKj4h07yKXjMO/OAnSWqzE9kD4yknqRBRLKyFU=;
 b=Xf8G3272sS6OUsRObywWb2qreagAllemWLIHO1K3a1F2a6Y4Xuk0lIGmzG9lcQALfF03diniMdRfv5vLvrO7PRq7NcFxBum8vq9WoWXsHWO4n/zmOn2FqXx09iea9Byc/XYZFaGfW3/wUSDvAhJ3bxFTk4VikCyK6ByCs/ZLrU4=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT1PR01MB4172.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:28::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Wed, 26 Jan
 2022 00:05:12 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.020; Wed, 26 Jan 2022
 00:05:12 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, piyush.mehta@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v7 3/4] dt-bindings: usb: dwc3-xilinx: Added reset-gpios
Date:   Tue, 25 Jan 2022 18:02:52 -0600
Message-Id: <20220126000253.1586760-4-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: e62ea10c-f817-4812-000f-08d9e05f85be
X-MS-TrafficTypeDiagnostic: YT1PR01MB4172:EE_
X-Microsoft-Antispam-PRVS: <YT1PR01MB417285D8EA6EAE1EEF0E5F72EC209@YT1PR01MB4172.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mJ83tTplCzddqk3DmPUNy9EHMv9txvM4EAkSwE4NZ515ir/kOFOU7uW5FzhKc7zClsKshrdMtUBwqGVuzxL5wGUq/95Qbn7OiSpjRw/eD4u02IsiLEKUj2Wz+t8tKyq6eHueoJpWLpqZvURkcBnL19VLz0oPt3oNR383UlFzM4XVPDlzApmAqFXfVNMa1iZxJ95uNlhu5070uGMNkDcDQ+PqYiMeFiY4hiGXfj0OSlwfbCkhINqSGA1YZbzIBgiGA5eztsczxBoc158u1rmkR4SsVqzstEW+zhGvrYL/h9bzJOEJ5EvZCmZF0+DVdTpP7Oa7L3+zRAJ4CJdasURj2A01LetNZaLnaoT8vZN5bb7rqVfTEQo+RPd1/B+R+Z4pIjIMhF6wpzthXFVyVUySY4bRdkrTyrVKFMhaydl1KBIoke/xx/QroVbgFhFEh1uNra6V5jsMxJ0zojBCjAvBpZ5/YXUyDwkoWhAGr9t7Dbde7tSHRo0WpYrSwVu91zhZEdi2KisfprUJepa5Y8cIO6df9XfFmVEIRlQeqBty8BEyWC3EnUzNT3bHDAh532JOByoKLE8tkVFv0waK7Y0tRNy1juzwtQIyfSo+8j5q840X396OfKi56OGrvzddYdTUH6Pk3envZ829nfkxnpxI9G3eE/KAAKab/rCpVCiYHhrP7yAVwt6fTCGzX1z3Vtn9fqmIN5eESC1wnE7EjMDuqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(316002)(8936002)(52116002)(36756003)(6916009)(66476007)(83380400001)(186003)(2616005)(508600001)(66556008)(66946007)(5660300002)(26005)(4744005)(6506007)(1076003)(38100700002)(44832011)(2906002)(38350700002)(6666004)(4326008)(6486002)(107886003)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u+CQ+HXHA6rFrUf75thcdaWuUpkPCpngADFvGkgBW/FYdBV+KrmU+FzM4T9C?=
 =?us-ascii?Q?MMw/rgTpehruyCoTjU5VgtGNOY4H9qd1GAPatSoCV2JxQbp9yPgo+umnYETr?=
 =?us-ascii?Q?T1H8hmtyjlBRfsIM3BA22EvCj8xbcqIXj+PpiAcYKeh/lpVnSeUujGAB/JNP?=
 =?us-ascii?Q?HvwZG4d6hRFldbi2gP5CCyDco65RWSMfusd6xWhSekDaVWxGCgZrDA3l5PBx?=
 =?us-ascii?Q?P+CFvh9A+KIgJ9EW4cPgeCI2lZyRdsmLYadSrWFKIDLWzuZ2O+bJca/Rifuo?=
 =?us-ascii?Q?NsPQEQ+iA8ACw1G4mSU1ntlT2UmK9KDgViieXDgWIVH8ORTbugnYVoQ/7Bsc?=
 =?us-ascii?Q?eAjrgBB/2bUc7Mn0+3QNRb6d7emRnkFXj5frJm17ei+LLsDTRGHX88hiHQVm?=
 =?us-ascii?Q?zEdkTQv1k7H6XJyd1+TMMG5XbHUHV+EdgLPUyNmppWLphANbtvWsFnEty63k?=
 =?us-ascii?Q?tBK59Z2Rth5xS7OH0FhKBnGxxrL/eL6XvftNddGZFFpuXQolEKn3BKOBylgF?=
 =?us-ascii?Q?tjzwBWpTCZY2hXXPj99TECn/q7gEEKFMbgV2L3+4yXTVATcKMy8cQgNpm1k8?=
 =?us-ascii?Q?SUT9ELpwE3L26q5/m31Y9jKdmohkBmGfi0y4v8utcAtx3QKdnoGUznEQbJAc?=
 =?us-ascii?Q?uFvioMlQH+r9y4oACA7wXN74LrDu1/imzAR3UtiEl8Tr+C7W9evd1jDsBoPF?=
 =?us-ascii?Q?QotJQMJnt3uRZlp7F+B5ijhaj6ER/xA7IxxTKmu4nyAb/rSZaUiihLehieMb?=
 =?us-ascii?Q?ePQHhQGreJ1Y5A/v+Edbeo4SY3niO0azy0YajbtwzHCDFcIk6szEOZChjMvN?=
 =?us-ascii?Q?J27u0C/FQhNy+hutrEKFRXMSOPrUQr04dztJdFw4HfVBGYyfm26LY00IYEQR?=
 =?us-ascii?Q?fv1W5HJsqUtdhLFOxaXBTUZSNL680qSJ8u1f5m+n/Bx4/es3dAARv4MLMXFG?=
 =?us-ascii?Q?bT4YngOU5wRphzAZAX03T2YrszXjaQNoYeEzQLyYI9C/9fRN9a67VC61N4Ce?=
 =?us-ascii?Q?9zhvuKFM97DYwHpTn7ffpQ621FlhsXYIEq/mdSO2GiPtP6RBs9vRAmY3LDoU?=
 =?us-ascii?Q?Q6xJxfTgjzr9hy0EwkV4z1fnrw07HD6hKmFXlcI1KUfZ9LimIYXLj1u+uX3w?=
 =?us-ascii?Q?TyCcFg3Wodp2ri69gLozf2e1qcpQGoM3gwu/3IfunO8SBgPGF7DUR+xb5Upi?=
 =?us-ascii?Q?GzXJ9h5gJKh/EkvK8LSLsI7PquBv2tXfBH6KS/sU85NTctOwWZt7/DP1pYyn?=
 =?us-ascii?Q?Cgi2TH1CKeoR39cIvtomyqQXx/yIcPIZWi5ZM1cfGYxtFqhGvYSWyIHVbhT2?=
 =?us-ascii?Q?G0eWB0gwVpwJEs453NnGVNNqMLKIekACT+kb1Eddp44nut8BB7L42CeYDmz6?=
 =?us-ascii?Q?d8x2sSXKEJiGKc0Zy33ga7BFQm3Zft4Wci5r4JDab7Tfjo0NsDslc+GezFpM?=
 =?us-ascii?Q?C35CSevD5DhZVBaVNc5FV0rj7yK6OhYqxl9E+ev9skVoty6Y5Sq02CDtI/DR?=
 =?us-ascii?Q?3EO11jCuxSEEB4noYPr6A8jRJexbkEEPDbboMInzDNQcOdhpi4IysoPO0J3M?=
 =?us-ascii?Q?K8hzLxJM2XipNBXxa+/uMtZeHCYx/LCONsLPp/zYaoo7Tw0N/pgHHDIPnhWh?=
 =?us-ascii?Q?jFRNoPg4caeeaCz8UZZwZgJMt97/DmU2shpiS8HMKf//wk6cqTCYSRxbcrN1?=
 =?us-ascii?Q?BsDlZuBOD6oYTIaSVSyqIFfwaPM=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62ea10c-f817-4812-000f-08d9e05f85be
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 00:05:12.1378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNScaU/77Gq35tCzTLjPUU1bdCwNIG/zfyxkWqbyDpdMJ1wXNXo5r1D08giEyVte66Ba3uj6P4aMgCjY+54WHJOqGclMU6vdrSCd6xbaBm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4172
X-Proofpoint-ORIG-GUID: Ee2b3bHtrheEmALjxeQJLQb_dwl0hh-q
X-Proofpoint-GUID: Ee2b3bHtrheEmALjxeQJLQb_dwl0hh-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_06,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=722 clxscore=1015
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250145
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Update DT binding to reflect new reset-gpios property.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
index f77c16e203d5..823ce731e95f 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
@@ -59,6 +59,10 @@ properties:
       - const: usb_hibrst
       - const: usb_apbrst
 
+  reset-gpios:
+    description: Optional GPIO connected to ULPI PHY reset line.
+    maxItems: 1
+
   phys:
     minItems: 1
     maxItems: 2
-- 
2.31.1

