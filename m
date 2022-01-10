Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2CC48A045
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 20:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243662AbiAJThP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 14:37:15 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:51947 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243488AbiAJThO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 14:37:14 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI5sER001635;
        Mon, 10 Jan 2022 14:37:09 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2052.outbound.protection.outlook.com [104.47.61.52])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgp68r76r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jan 2022 14:37:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJ31jnmwi0WwrNTr5z0mcaMTQa0SDdSUz7WEK7A6IqBxiW7g6afn0KqiMqZ+pKzgWTrIRpm79pjDzo5C3qcI/jnwntHpkTRwqrUj1MnHo6cHx6UHqdfJU4jXz3otkkH71Ow2NZt5WgwxaYNe3lESbaBvQwqPuNfpZMO34rFgjgonDeil/OciPoidowd1TjAOJXxm9e2LuG5JhL04/xEStPnYSeADfRmPl2PR+RTpGqm89CzenoNSQ8L9CuDNWrS7ru4guC2+7xDI0zgUa/G1MYCllq5boP5VQMHlHugnKI0FiSe62XKtHj7STuj6WFI7oxwz7w3Pko5M2jYpTJjMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLTgKFxQQFOOy+E7S9FTcPXGVQ3kkUJW5eSGLKqOVUw=;
 b=H3xG1VOzRjnezJVM21emLRkk57xHhZ8oAp9LrAyVX/S+CL+5UswSI59fvBudZkoV9bpaF8OKKD84sHhLmauSWLGpBRblmmFoXeSXoDTAz+EBHkxY1RasVDRuY8dvBK1K47u2G0diN7/LJv+DdCm9pMmQqtKXu3NAbKFArvdmgaBM2cJzHpBJMTu8M3a4BkDEvwBOiYvVjoN6f1cAu4olcpIU263KF18WbTharNu48GQhfHCfBEKNhOsmrcLDwnJMS1WuR6RTkUEWVc24NRVJoW5E5r87hQ85UQ3MKFWc9okth42vwsKlVJrtxMFGQFw9ZgB6CK+zVG7Q6keyHU8U4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLTgKFxQQFOOy+E7S9FTcPXGVQ3kkUJW5eSGLKqOVUw=;
 b=aF64wPco5Otxx0s7TtEOoxoFosp8YsMkNfqY/8pY64BUOj3U2sSmddTodJfeC2RJiafeM4mdhHiW6Vdd1Rj7WQvvp3bsKtKPMQs6tuZk7nbfW1ar7IRIbl2oQI1B+TUXfHD7wR45+BrHxqCcc9iGiNhMvoypA3vbKFVuxWKs/dg=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YTOPR0101MB2236.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:22::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 19:37:08 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 19:37:08 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 5/5] arm64: dts: zynqmp: Add DWC3 USB reference clock period configuration
Date:   Mon, 10 Jan 2022 13:36:41 -0600
Message-Id: <20220110193641.1368350-6-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: e8515ec7-6793-450d-ac7f-08d9d47096b5
X-MS-TrafficTypeDiagnostic: YTOPR0101MB2236:EE_
X-Microsoft-Antispam-PRVS: <YTOPR0101MB223684E1084F47B13DF00C87EC509@YTOPR0101MB2236.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m6+Qq5vjLsEbDVDQkRo3Y4RuWoQpsjpoZ6F6Bt8nFGkVf4ouJn4GtjoAMsbHJC1hyRGKbLoDm5xT4xsspDtItF05hq/tkffi37KTqtxOHH0xd4L+LkBLjaokX+daEjpvyaTkREzdAyIEQEgDY0Hn8jtEUNjIyUsof1NY2X1gRAqgcVXZ6Eg/PCjE+d1Le8eaBT86KdgGkrgr1bVzHJddpAoQz9+MWC15u5wj3eGfPd/UkNIXUfYUyVq0uyx4mYDw5UhJsYp8QPWK3W40ZGNp9TTY7Ne7D2JZSTgKzykwsn5/W4n43ZvDURgB5kC7k6w2H0CxD8k0eG7YOoMki19kTo3GcPfS0Ll3ys2I9BxQnXTY1GxuxiW5iVRDb9fEGvY/cHuFUjlDmA8lKWzK0PxT9BrvcBNjLylSpUv8oDXBcjNfaOoVC56yYtZsmDW5Hi+H6kCuclaHq8fZoutHv0xXnRto2gCm+dvF/tkrVE1JM1pgSTxDW11HhqCSxBZ0H5dHArxG0GlJhXy01FQPrdt+BDaxbSfgNEWkxd0pgMRWTvYbHUOJ54VIonQ4GGkEzlSWE7APCpDWuwbryEa8QLxzTfDk2/uNXztYsXB8855O9tvjq7QN+z8VocEqYzvG9OxY6Rzi/Bzi5euhfYHYyadTRhaSEiub4n9WkgVVlP8V/3/Yh1iEnbeWY9H8k2ozxvcL2UIrnK5WN8Df7Z66MvkSyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6512007)(5660300002)(83380400001)(2616005)(44832011)(508600001)(8936002)(8676002)(6486002)(2906002)(38350700002)(38100700002)(36756003)(6916009)(316002)(66476007)(66556008)(26005)(66946007)(4744005)(1076003)(4326008)(6506007)(52116002)(186003)(107886003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FQu0qwmMpEgzNOUInWjdn2UvPQsrrpBMszLEIzrxfEfy4l6ZmzCvte/CC/Fg?=
 =?us-ascii?Q?LfeOU3/5KohCIgAYWW2Qr6W9WqjMy8n8sdqQ7AYsySgCb48RYlx2N61OqLJs?=
 =?us-ascii?Q?hrIZ7x2828YT3kzkSLW5YqkVltpkIh27hrXXRFLI3GrRsgrlgkSd8cYlmQ32?=
 =?us-ascii?Q?CtqCARhZZISarICfHAiCFXzyKKQ5WF1VfxMsJ7nEfKZrMPpwQCt08KMYb1tW?=
 =?us-ascii?Q?x+eNyrHdmGO6Va2xijtvdq3yezGxRvvB9egHU8szHPSzlPhyeR1eIiSFUaup?=
 =?us-ascii?Q?Y0asdUrK6IIVn896JXw9uzMrRs+EhJdvS6QGWbmlY9qAnlA4oeTBbfyMFVx3?=
 =?us-ascii?Q?Ef8YT84YZY9jKfN8JrOlZqqU+nMrGISQWZDvYdm3WHmnoNAmg1HlRFpiYnaz?=
 =?us-ascii?Q?q//FJaRvS4rMhWkfmZqJr0cuORJBULlbRb/5PmzlyeRjaHN7/wt4JTjvUPlC?=
 =?us-ascii?Q?6b1qe/+crZ9S85lUNKSSt+7Op+4Xh7hGCr/qjIaLUhUNb85QW6z3tshmssDq?=
 =?us-ascii?Q?nAlMLBcVjQaOQU4UAUIEqZd/wft72KAUMS0GebyY6wH8PBtvl5RU+3u8FPq6?=
 =?us-ascii?Q?o9GdR1IKcr9N9qpUU9PkixE5/2d/XTl7aivbC28QFCPJVIi122CwxdtJLLQ6?=
 =?us-ascii?Q?DkIKfqSaX8Wd9IE/MbkwK8x0I+VdmiOy0F0gW+c00dqGjJHuUCdtUTgTLy4p?=
 =?us-ascii?Q?fcJ/WPadz4R3TwQQNsZTEbIuQq9E9sECgT787IARPOmZYrHxow3AlPMJpiJq?=
 =?us-ascii?Q?JnmiRzaROIZ1L/hFoIB6Qf/D/Yo/Sc6YKnT4jg7bGhsQI8IdXGrFWaRd4LRz?=
 =?us-ascii?Q?WqKG6hvxcatD7e6eWRXy3ynAxr4ZkmxMsWkAUhiO+GspLZOgsqo9bwlbbuDy?=
 =?us-ascii?Q?yMHU4pypz91cEL/YAfgnbiZ08w/rF3QojuGAWDlGVVo9hdls5g9Al7mQ4evX?=
 =?us-ascii?Q?6Nt1GnvLSB2Wh9f/Eu4X1NcrD6DjRCeULAOmAuNHXBZziP3+B8KSWNGVOZ2c?=
 =?us-ascii?Q?EcGTEfMcR7BluMR/Rs0+mS2ufaucOu0lNGv9qFfWX/zrMLztPMM/zRPBExr/?=
 =?us-ascii?Q?zw+gy5Z0pRY2H0Eyox4n6z0Xsyb3hZ3AlOZZo++gkjOsZnIe8qrGvwHSerGT?=
 =?us-ascii?Q?h96v/giIUw+Ep7fuXtwRHf3jRucHqe1j9wjRvi9EHSTl/wigpFunxIgJVxfU?=
 =?us-ascii?Q?+B+/xHkrFk/g8ozxgywBFNDkfQmc8S8NcJl5QixYcgCPAmNBBjOcrx/tolUY?=
 =?us-ascii?Q?86WQmaNBJteuEfv9067kZ3Tl9KEW9peBALLw2g3+ZD6rYZtmrWMaJAmgbz16?=
 =?us-ascii?Q?fSVedf2BWc5ELxDOOyy+RGUsOna/HuTuFngXERkgVQQFL3GxO/giCWqa3G4H?=
 =?us-ascii?Q?OZc5k6PhY21QaVLS8BNP6KFfCh2fkFmXlQ4fl9g5ohSyhQh5sTiegj6Zy8J5?=
 =?us-ascii?Q?cXCYufajDrkm6kPr6ChbFUyT88HaV4Lqw8cH3J2xc/AhVKTEuOJQ8VDTNli7?=
 =?us-ascii?Q?QLQUbPNwV/XuH3fEBj7b2skVlWBdkioJ7LXhuPevKiZT17JmjJhhAG2xfRTV?=
 =?us-ascii?Q?7wF6Z6w4mYAZEIpgH/O7M64nlbe4UlZSmOR9sUyvXTcvvEb5BFNk2o7PgANV?=
 =?us-ascii?Q?AqLZotbyz7gWkK+h+3u2eqZjFopCJfIAPhoFns0cIbrVoSixBRKKYxVgrr4N?=
 =?us-ascii?Q?FXgFFQ=3D=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8515ec7-6793-450d-ac7f-08d9d47096b5
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 19:37:08.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/TR94714/vV7pfrVgXDg9HPQBW/VL+BmR7NOmTiPECKA3w0bInNMGA3UexC0n6QedpA6IIjEwfZRSy9rtdsEIfhUUyvxfLyjBE5SnOHok0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTOPR0101MB2236
X-Proofpoint-GUID: N4HZKf6KpMghklVHpjWC2hj884gFmWO0
X-Proofpoint-ORIG-GUID: N4HZKf6KpMghklVHpjWC2hj884gFmWO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_08,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=495 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100133
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Set the reference clock period and FLADJ fields in the DWC3 USB driver
to 50ns with no fractional portion to match the ZynqMP configuration.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 74e66443e4ce..2f531707d5d4 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -828,6 +828,8 @@ dwc3_0: usb@fe200000 {
 				#stream-id-cells = <1>;
 				iommus = <&smmu 0x860>;
 				snps,quirk-frame-length-adjustment = <0x20>;
+				snps,ref-clock-period-ns = <50>;
+				snps,ref-clock-fladj = <0>;
 				/* dma-coherent; */
 			};
 		};
@@ -855,6 +857,8 @@ dwc3_1: usb@fe300000 {
 				#stream-id-cells = <1>;
 				iommus = <&smmu 0x861>;
 				snps,quirk-frame-length-adjustment = <0x20>;
+				snps,ref-clock-period-ns = <50>;
+				snps,ref-clock-fladj = <0>;
 				/* dma-coherent; */
 			};
 		};
-- 
2.31.1

