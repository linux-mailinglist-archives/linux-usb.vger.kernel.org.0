Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C682649BFD6
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 01:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235099AbiAZAFT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jan 2022 19:05:19 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:64713 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235042AbiAZAFS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jan 2022 19:05:18 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20PMWGMN019211;
        Tue, 25 Jan 2022 19:05:11 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2056.outbound.protection.outlook.com [104.47.60.56])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dsyrhrssf-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Jan 2022 19:05:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXqjo2Nq9Wj+Mwr5MEpmRD5vZJfcu3yA5FOeILCXjvc+iy3F4YCi550dTLru09VdajKVMgJAgRO43Qol8Vr7JhDXg016LZS/WGZeskiuhFZASdMn+DSPvrG0+aFmK3hXf0SUe3x4F6eyCjT3URDjYnUuJgB2O7HlraYYxyzDKantSfjQQecOC5ROPi3/5JpVX/POwzyc3PAd5Hn3cyEp2ghr1dwjcDHgU6EvjSK9uHzhzarNtFcwuK+IdBiV3QvBQWIoTUUlSzhapNFVc2+hKqx8QQ/6RAFKWL4H0rhoQzx4xwkuzasO8l2jL/y7if90hI0ulULvS8GfDfqNQOM6Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB8w4NHXrz4wo9AhwquxzScWDCoe/omfno4EycAboM8=;
 b=EIVRf3yytHQvglly+kuqO65ZtCyyHDLfoACmGDD8RCF4fBb3SadhXkMdGet3r4mlNsNOUGKf7SkE4mqZNdjmALV7Xv2hmI3c2CLRIntn1GXJ9MWhjRQ1/GQItC0HoODL4NbpPNpVZKCCjpaueAG1/cz0GSiJqT7jAL6lpR0zEwVyVsWjAa/KVlACYPfBD1S4mrTOhduyacLD85+CWdpanGp8dhdbmzAG+j3tfh3ay45aX37IODsVaW6GBnowNMDhkQsT+B5IC2w8XYA4heeJQfBYj7faZ11tcutSHUNV6yDgilWYCPb74/nYPNy05zVdEP8ifKaR1FEJr4MiJE+Bsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TB8w4NHXrz4wo9AhwquxzScWDCoe/omfno4EycAboM8=;
 b=hkQkq5DZp3j19iQ8bsocci1CvrbSh24z1FIcbgHhVfvHFA4BBeqW23bN4MYZT11cKDQaBQwSIQ6IpGtlMW5k2xsGO2nEhE7vLQUcRZoBRhrfUpIJ2E4Alh32Yxln0dXJmANV2IaDzv2w5/rvycu8mf73ojqQiu0S7j8LDnypdWo=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT1PR01MB4172.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:28::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Wed, 26 Jan
 2022 00:05:10 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.020; Wed, 26 Jan 2022
 00:05:10 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, piyush.mehta@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v7 1/4] usb: dwc3: xilinx: Skip resets and USB3 register settings for USB2.0 mode
Date:   Tue, 25 Jan 2022 18:02:50 -0600
Message-Id: <20220126000253.1586760-2-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: 06e812a6-7cfb-431b-1d2e-08d9e05f84a2
X-MS-TrafficTypeDiagnostic: YT1PR01MB4172:EE_
X-Microsoft-Antispam-PRVS: <YT1PR01MB4172AE20D90C30ADC99AF168EC209@YT1PR01MB4172.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: By/DUoW1NPZ6qqWAntT0ZfkrL7WMvh8xNhcFDQl6vJ/jtfFqMbkbpQvgcIw2wGtmCm8AeS0qnQftFiGLEY9M2AN8C6PDBmgUJLiRMfofR4Y3Rfk8cGz3a/KTT1o46wAXCXMhtgsRWLYitYWcmpA3oW5YHwezG/V5Piv2CH1y37OSi9wrS6mtdykxzPkoK/XNpH7K7IaUPfkhXzHWgI6GX/rnqHiUJkRJkomhVcStNdnu4cScA5cFUVSHCFuhRQROicq95SpLuBkRiyRWgX4n7wrgEBT2Fc5AsxeTMGIJ8H/0Bj8lNNECPH2U/yrXp293RlYovBrAzEKfON07M8rDgC/fanaEG1qmSmENHZwPvOMAqaTbOt3BEKeyVKDmlMRdnDRPj2sxvpZeNnE082oorzMDZAPuNBZtjRO+EuH/BiM1OSwes4Vz9BpMde9CuOzslf37DrJok/pTnWW1tA+8kXjQ38+XdjoZdqD5SXQN5uby0MKzslx5C1MKAD/x/r7tQbzfhPDQtU+gPi2+MbmYg6t035CLAW85FiQvfkKQUN1AaxmBCy2Z0/Nnv+xwKHBBzsVn1akXhF14VD5zoZZoF7iIlaNCUEfL6XhdE3N29VpI2fGhKHCymrIGNouFLqBXc7CtEJv44gRCScgo705Pu0J3LfO7KHCDKdIrSXnUSgLGcdvH//9/vP0cNt/5T3lQqwpaZm99cKCSyJGGCYMIDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(316002)(8936002)(52116002)(36756003)(6916009)(66476007)(83380400001)(186003)(2616005)(508600001)(66556008)(66946007)(5660300002)(26005)(6506007)(1076003)(38100700002)(44832011)(2906002)(38350700002)(6666004)(4326008)(6486002)(107886003)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JTgIGkrw2MSXn9n7JGCMc0DxTAqHgkpaz4M+SnMXxsAE/y/lAXGPRszYlLng?=
 =?us-ascii?Q?rgAyVLfB1JanqOynVBiSRiMqb7z4MJ+bWaBtFiBl96VKQ99D37hMhTLjL/b2?=
 =?us-ascii?Q?OXBP5MHUnb/F4fqtlS3RbQOR3amRTWK0YUtE5eSI9vJRXrGSKseQG0/J6XVZ?=
 =?us-ascii?Q?cz4iW04ZxOnA5xG9xx/CPZt75sobo2PyxE4kW+WoUCHWSj7T6W0tZMFT9y8h?=
 =?us-ascii?Q?/iBBBPs7P8cfhVf2bX1e9FnEWVP04/LVnouzrfNtAuemvQ7tj3FREx0UzR24?=
 =?us-ascii?Q?yXhX0l6sEL7IW/MvrYJvIWmoS7sVhD3uodv7WMZPlbQg3WDUWR85K3NDbv63?=
 =?us-ascii?Q?jWlJ+50deTrDxgJI1E8kLUMjPeGGhTkG3dJSkAGCp17FKNnsfQV0ZVMQi302?=
 =?us-ascii?Q?WvFxa8k/LFdFfOLv3vk8OFUUEjB1tPOGTp0nOhts6Dn8N1JBNnpazRnYLKCM?=
 =?us-ascii?Q?lwh4m/9IXX9KK47H+TGXAuotFHmLRcb+HcIlJVV7R6D9IiQSD7dcDv3wEu4V?=
 =?us-ascii?Q?gHCQ4v6l/dLicnCJzOJzghByYyLgf+uAlhK95vva3qc6JXAQnWpRcm7aOfsB?=
 =?us-ascii?Q?Vcyxlmg8KWyAqG3oVJlLESOv2yvEyHyFDR5m63I1SYwmOUBaxCH0qJYiPnhE?=
 =?us-ascii?Q?rkjHPw+ZM0ACUCDLO6eg0ToSE9cOvrWpMiLjxUNl5klDPY8mkf9SCoDMVN1z?=
 =?us-ascii?Q?OuqTk0h6z1CbS/wuY7lS7Z9Pz3YaOChjNn1axpGDOwbi1b4x3PM3vG/89SVM?=
 =?us-ascii?Q?gKNgfz8B+rlxf/xucD3iDYKSjHCftVjkFZszsRTFJmgR/+0chSNOVI4a2NB6?=
 =?us-ascii?Q?pbBaJhktSLOS/pml7mJSkwWvjpls74/zOi7XlUjkUVgMJAJ76CoY4sdKF6GZ?=
 =?us-ascii?Q?vU8HxW2fA97jjywAt4SagRsPdM3R70d/RDTzhQaop9wmoU1S3Z2tZanWNPc7?=
 =?us-ascii?Q?fvdJ+WeavCwa9mR098TjnHsmCEng39cyLdloTkIg780jbwATMvGZ5ckqS2xJ?=
 =?us-ascii?Q?AknMYIAt/ZuET34xnxU0N1YWTbZGgLWJCygG79rr55/EV8V+8BbmwB6GqMj3?=
 =?us-ascii?Q?84Bf6Thhr4K4EFSEPj/cwoaHMXCN4j0TrZFoxZpZyfcoTCnljlPCA1/842Gy?=
 =?us-ascii?Q?4NaL0LUsCF6w3iJquYxLgdbGHRzQibPFQsIvA9Cncwt94C5rwNlg3IDnVR+R?=
 =?us-ascii?Q?1/YQNl8Usjjvxtb4CEEZz1hD45NZpyCgr1aIPZuzpnGO+rwg0p5zCmTQzIBt?=
 =?us-ascii?Q?lq6gUngkvw5yr2WUYVBDHU8+irRUvyf/BXHjBMXrzQx2LZOTktDVgLaZthbp?=
 =?us-ascii?Q?/19+FTdYi8BGTW845ojC0WjemKRFJZqglNcL6Nd3EOuODS0CNUfF2OD6Nlbw?=
 =?us-ascii?Q?/wl+mrafcf1ckd4ZQBQjv7mz46TfTxWiY17CVuIS1CmS7bpSRHAW9B1oagJM?=
 =?us-ascii?Q?xIHmkJxlSc88kIiFEUTRBXo3N99AMXtb03FPmBVOQQulkIFpY3JYEw3fjsM9?=
 =?us-ascii?Q?MXfR/97j9rlWBJ5wC0bcs23xUkn4SsPbl8kjrw7JLR+Z1yz15v9PxGMqpblN?=
 =?us-ascii?Q?hyabTCtgeidHpaU9w/3N6CNJ4GHcrGFiu26QJHp9ywKPZB4zeWL15n3keiB9?=
 =?us-ascii?Q?omaeOl3mxckEgvkpNMfrjXVFY2Gym4J2T00yyPTuKGkTYXdppxaCNkKbdfzH?=
 =?us-ascii?Q?AFylPzRGvnm//wV/fAzyZyEO5Ow=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e812a6-7cfb-431b-1d2e-08d9e05f84a2
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 00:05:10.2617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4lJsSkRxPy0T/+vILL9ZFNZt/rf+JhckyLgtjb1TbalcuQgHnyY3mVkHH6LmeWFDE0twTaKNKeqB4OExQUfFYDwQQG1KVI8Kc/ysxX7+74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4172
X-Proofpoint-ORIG-GUID: NfU3lfKYU1e-ArH8yqk3jIUPK6aTfVZb
X-Proofpoint-GUID: NfU3lfKYU1e-ArH8yqk3jIUPK6aTfVZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_06,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250145
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It appears that the PIPE clock should not be selected when only USB 2.0
is being used in the design and no USB 3.0 reference clock is used.
Also, the core resets are not required if a USB3 PHY is not in use, and
will break things if USB3 is actually used but the PHY entry is not
listed in the device tree.

Skip core resets and register settings that are only required for
USB3 mode when no USB3 PHY is specified in the device tree.

Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 9cc3ad701a29..06b591b14b09 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -110,6 +110,18 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 		usb3_phy = NULL;
 	}
 
+	/*
+	 * The following core resets are not required unless a USB3 PHY
+	 * is used, and the subsequent register settings are not required
+	 * unless a core reset is performed (they should be set properly
+	 * by the first-stage boot loader, but may be reverted by a core
+	 * reset). They may also break the configuration if USB3 is actually
+	 * in use but the usb3-phy entry is missing from the device tree.
+	 * Therefore, skip these operations in this case.
+	 */
+	if (!usb3_phy)
+		goto skip_usb3_phy;
+
 	crst = devm_reset_control_get_exclusive(dev, "usb_crst");
 	if (IS_ERR(crst)) {
 		ret = PTR_ERR(crst);
@@ -188,6 +200,7 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 		goto err;
 	}
 
+skip_usb3_phy:
 	/*
 	 * This routes the USB DMA traffic to go through FPD path instead
 	 * of reaching DDR directly. This traffic routing is needed to
-- 
2.31.1

