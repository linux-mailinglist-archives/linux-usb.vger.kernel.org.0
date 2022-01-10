Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF1A48A046
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 20:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243603AbiAJThQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 14:37:16 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:44601 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241122AbiAJThP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 14:37:15 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI5sEQ001635;
        Mon, 10 Jan 2022 14:37:06 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2052.outbound.protection.outlook.com [104.47.61.52])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgp68r76n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jan 2022 14:37:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVOaaDj3lnMZsZUmABLQdBKO+I1Cqc8LIl+Vy6L44mIA//4gSF/dyMjhcA62Y8krXOePEHoUB1akXy1AjiIetSSIMni/BFQJz3NoBGo8atPmDBBcvlPFnMABYFxpxKaG/Ku61DSIZ7RPhJU7HWzdrDyksg2nbrApBOi9m1mMqwtcLxlcW5Ae0JLWBDtvSFOt4ngaAsOp673bWZGy9XptRKIfVGD1p2rqpedUvvDJhRDiuKLe6YzxVcmgKTetVxqkmzuDAE3Y3VpumMA4m1fU6D+4mvsUBmnjOPkWo1qwYRvK3Cxo4JQj5L8ZodJCB6vDSvcPG4fDfvwaVX++3fXKrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYYoL8ENqXn8/yzpo6DmGcjV/PxdJYZrbStIiLXDXEE=;
 b=cwQDoL++fZtI5CuAOXK0JYoeoUxoSFWsRZVynIFb/sbo00zk+bUJg2taOE11lBw/L+5mt6aFaPTcBQ3jxjyfYrexcVVwjgpXUK04LwDECKsb8B8PO/SjMGt3rWD360QnnSj1Td266vOrW/2rDzj//f5fUezSjMofSf3oS8yG53Qya922CkoMhg7WS+Vc0psp+CML9Mv34q3VWrpJs6ciJA5Spc+mvyvwohYVO1alUpQMM/BDUZC/xSDFcTeAxA96qHeDViZryw9AHZs8CfUg7ZOj8ADN20aDXm7fqnmdN6R4N/bFo9horPdrtu/uSrcNEALHVkvY1uLdYBCMHsrV/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYYoL8ENqXn8/yzpo6DmGcjV/PxdJYZrbStIiLXDXEE=;
 b=NeqAoeYTrnxFcgPvAJ382jYDCf0sEoLLqOhQCTtnCPcM3trGhVX/nx0UCqhERpDpcTrvmvz14eeGSgY8zX8tiUYnah+NVnIZOLgdFvN+TmkZ3Fx/dkEo8lKQtVBo/55TBdaPB20UpjkZkzMwK0GQ9fwS+O+Q4rvMxX3BqZh8bFE=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YTOPR0101MB2236.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:22::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 19:37:05 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 19:37:05 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 3/5] dt-bindings: usb: dwc3: add reference clock period fractional adjustment
Date:   Mon, 10 Jan 2022 13:36:39 -0600
Message-Id: <20220110193641.1368350-4-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220110193641.1368350-1-robert.hancock@calian.com>
References: <20220110193641.1368350-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR12CA0025.namprd12.prod.outlook.com
 (2603:10b6:301:2::11) To YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f15b8bb-f4b5-4413-5f30-08d9d47094e4
X-MS-TrafficTypeDiagnostic: YTOPR0101MB2236:EE_
X-Microsoft-Antispam-PRVS: <YTOPR0101MB223628BA9BF37E44F28AE074EC509@YTOPR0101MB2236.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wz+nEEm3sl9aBb/btpyGeaCQVf0nXaXmSNEH+aTD6Pn9OXV5oEEzGnfAoK40nLeoZRuKBZLy4s7gO87PwS84RCRwidhKhgHKYCmTrEI3h7nZ+NU0LhkWpMVJukTPKVDSNDrW7tIJdzgUw+QPOA9fpYLyuoAsk6bcUDjwSisCOIo0zokVk8pNPO17EnFNr3DxF7MkYyAikd7VPvgHoP5trDJ42PyXBVW8p7eOPqdB9K1aqnSev2B9E3ZIScM+PdmmnlI5w0sRNfh9qPb1BPsz9FVJ4hsTNKidJ/ZiO3gdGXbKAT9TqmQVaPOYcEK9YXi28Zvh0iKa3jf1yII2VOVWXlfyJX1CfuCzjDqV7zVb3lrFBO8Bi21fIF+l67ynWAQrSsJURj6u+rf5vMAVDS+71+kw2dWGAw2KNkZhcku6FyPyPgUCphVTx+MnpZNS55W2KpLIbNNGl6EvLp1GhMNBXVYe/48rmrg/3X/1o48xhrCV0NNpz2fNxK0wnNlgidSMgBkww1Nx+1OHePqVzz09qPGLeDozEchVy1VF0FvrymC8u3eGITx4nGstBXwssIbdr/uNbLHXxbsQkvGyG5kLwRiwrNPVKZ1Cad3acDPYitnKrUb93uBcBNO+mLxic20cyP9euF8mclvWbxjx5Oqe7VpLHCFkS5dq+KAPFpe8ujO66nr8rkVJBR8wvlehsbjYpxrn6BeEptsrLhQBnWkifQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6512007)(5660300002)(83380400001)(2616005)(44832011)(508600001)(8936002)(8676002)(6486002)(2906002)(38350700002)(38100700002)(36756003)(6916009)(316002)(66476007)(66556008)(26005)(66946007)(1076003)(4326008)(6506007)(52116002)(186003)(107886003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vcKHl/LXSy8WAOJaXXoNO+cuXxLrt53uKWaM1S7AV4ZZv85cqCgKBOg7s3/r?=
 =?us-ascii?Q?nDc5U6S0T4tLX9AhdH7EEHpjkXeWuk+KYFl5FBRpLLPl0tRZrr16F6CH4bRK?=
 =?us-ascii?Q?9k/sJ5IkBYj3VZkFJKjvIyp3NFAqihfdcaRUs9CMmXkHqmdy9yC5i6cpbaWf?=
 =?us-ascii?Q?/NFn6DfJ3hblhmgLaDQohQ2TgNF0nghGNHsufCu3fglSZg1aZx5nmVxX4wKa?=
 =?us-ascii?Q?miVbZRGFeEv9CoXYURBq3VrvucahLoNuWOCcr9rkeG/ghnUgTKZRcpS6+9lh?=
 =?us-ascii?Q?v8zJw3jYWzyftR02MMqdTWi/6JAUespxidkzT7vOIlcWJ0hBQBDvHR/EZLzN?=
 =?us-ascii?Q?hrNRIb5/ErXLT7dRur9A+aaR+0+gLBhxexJvrbLm4HExdxGFrwvM7UUnOuwA?=
 =?us-ascii?Q?OVtarj5Rz80V/bJY0zxIjhxEihqc0xC069HA162c1bp6KTOkfeEX1kPkvSCS?=
 =?us-ascii?Q?7d77Jv5WIMOAeDSm6LFsZdaDIUQV5AZqex8/HWVMMMIPiKqMmgKS0ZeXyQeH?=
 =?us-ascii?Q?oGo0ZBynUYvMqoIPAnTRTsB/NC4J/iWQgfC68gr0NrWTItx1msY9R2yFRfaP?=
 =?us-ascii?Q?HyAhipUn1+8gXQWSRzvDJXx6orWAtQ273ixQsA7N4kXtbmQETwZkZEYPkpvm?=
 =?us-ascii?Q?EQgg3K9OrEGkurFdKy0OfKuCIj/uiNXPp5hrKLw25djHqeFEwcps1PO+1rIN?=
 =?us-ascii?Q?PHkSRYhaJTwv9HXbeKfaQpYcfPomigwCxgIDnWq/QMp3Z9XSDr2Ek0RhOuD9?=
 =?us-ascii?Q?j6IhnxQqO5KD7iS8QCmYxzr//8EsOJucdbFpqkEl33n4+76Wzv04lHEjSe8D?=
 =?us-ascii?Q?Pc2InUu13CABsU1rrzTpDfki4b742jlw5rl387v2EymGzBpVwp2LWmfh9Cux?=
 =?us-ascii?Q?D4TQDuCwpaUqHYFecvxMi5vi/rhWRVHYUgKMztknE+LOozV51Vf+dOFEXk3X?=
 =?us-ascii?Q?+goZH3Bz0ECbfAjIPlm8VnxbxNPsxjVCHNIJKpP2TzAcTPpJCbatU5f3Hi+4?=
 =?us-ascii?Q?xUbFtrp5NcscqLvJzrpewRtKF/lfzae/eFiOkhy6u/5rpRqNap9fHP8yG2qw?=
 =?us-ascii?Q?AKA8GLPGSOd5O1uu3yi6AG6udPFKtHDTy4tPsZkja7rBnowMhMBI47OMNFe2?=
 =?us-ascii?Q?26WntCLs3AgAOOtTiSvFQ6zeSBdx/cQuYZAlfPPMoW292hs7fmEk7idm/l5n?=
 =?us-ascii?Q?7jSMJcJdQghHzV5fQvowTj1s7IhhOtYOFOzbJaZcq60VbweRCt4ASIOvuHEG?=
 =?us-ascii?Q?QRHTjKPFHpUuzX3qJjBDclJzUfVD7/thtPICy8FUsXclOCLHdS4R0fErCUSx?=
 =?us-ascii?Q?yanzv9KrYs/ns2R2mesgWnNb9T9l78iylil2LblSdqUFX38Ajt+11rkRbk8B?=
 =?us-ascii?Q?IlaTMBMxADD0QzOLOyNntxE0VNCQv38mN0dcVqTR6KYEgQKg1dGnCZFdtvK3?=
 =?us-ascii?Q?Y7N1EvjV/HaWwE/UGnXVW1oXlhKd/z+5eATyxFyK74SI2+kHuzjdnUibNzKG?=
 =?us-ascii?Q?tsFAReZwUS+VdpvmVJtm8xmjKelGUgQbY7KR6N6JPSla/QIJtdDkFELlIqb8?=
 =?us-ascii?Q?JpGgQyIxLHLqdzkc+41PY5vXUWfwMgepvV2lVTkGvjELhqP6A137hoHn4Ths?=
 =?us-ascii?Q?95+HihvutjdJQEnaO+9YBtNImG4PsNwpsC4eIqp8Cy89R/UxeDCaoKzUK9vq?=
 =?us-ascii?Q?HKSRZQ=3D=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f15b8bb-f4b5-4413-5f30-08d9d47094e4
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 19:37:05.1711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rE75mG8zKZw3YNaqzuqdlmKGAS9mEKWuCFVZxn8iOCBUUbg3Eo7vkEBH+BP46QYtn48Uo0RoZcpcUIE9AuOAbUnzax1qAOMsOQA/1ZQ0G8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTOPR0101MB2236
X-Proofpoint-GUID: roYKhUTecjz7hU4LzOMpzlt2j8f1lPu7
X-Proofpoint-ORIG-GUID: roYKhUTecjz7hU4LzOMpzlt2j8f1lPu7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_08,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=714 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100133
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Document the new snps,ref-clock-fladj property which can be used to set
the fractional portion of the reference clock period.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 25ac2c93dc6c..88d8d831e04a 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -260,6 +260,18 @@ properties:
     minimum: 1
     maximum: 0x3ff
 
+  snps,ref-clock-fladj:
+    description:
+      Value for GFLADJ_REFCLK_FLADJ field of GFLADJ register for the
+      fractional portion of the reference clock period in nanoseconds,
+      when the hardware set default does not match the actual
+      clock. Calculated via
+      ((125000/ref_clk_period_integer)-(125000/ref_clk_period)) * ref_clk_period
+      where ref_clk_period_integer is the period specified in GUCTL_REFCLKPER and
+      ref_clk_period is the period including fractional value.
+    minimum: 0
+    maximum: 124999
+
   snps,rx-thr-num-pkt-prd:
     description:
       Periodic ESS RX packet threshold count (host mode only). Set this and
-- 
2.31.1

