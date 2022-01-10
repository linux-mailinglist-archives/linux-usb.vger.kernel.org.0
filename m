Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB1248A0E0
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 21:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343522AbiAJUUG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 15:20:06 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:41670 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343517AbiAJUUE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 15:20:04 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI5sIN001635;
        Mon, 10 Jan 2022 15:19:59 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2050.outbound.protection.outlook.com [104.47.61.50])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgp68r810-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jan 2022 15:19:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lelMBdoE3Y/zFiLREZVGMDcR6vEFapw32LtUg5OJV9lT018cAznQjzBFNfAJyoLa//AlrHV6P/MC5cHYEa3vboh7oWG6rgFK8FrV/vhzC0VL//PFkl6uujQmZkhE2Z73R3fIWVjuUuotGNPZCiiaiZunKayenZplDmaaJS4QOYKHeAKaQWXe61AF5zTjUPIP/RA/K+oe7F7lPtUxWKasSRWkMLbnsd6i+hJ0XMNK+H2eXVG3F0tU5Q0r8mKOxwI9ABNNxQ7Q0uXQCkcaXohH3IyCvir1HiwywtrdUzQpZUcnZfsbtJeSnj4IY5KCqelCB4DntK+BitmO8rK6u2SvjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLTgKFxQQFOOy+E7S9FTcPXGVQ3kkUJW5eSGLKqOVUw=;
 b=YeBBz2fvATIndQFk+v2PlPQDBkUs9Q2l+XAC9XXddPQmiwO9Hue667gkc/12GEyCRBkPp1EjDKfhyZICV6Iy6fUdt/0ygk+c0hqDhYAT4BgsHUzGWRY3Sa3WSCUy9fvrZmQi/Y2uA+gsnIY+72tcTYrbZPpuNxvfC+IAPDz4/OS4jkXEl0/BKjB/PoBS8CN2/SEckrsNurAjMubx1/17GeJR4CCSzkHbPsyGPvkwE3DAR+ZlOuuQ7LqsNq0cGnHwDY5BqgB1lU8B3MkojKrNO+XZny8dIYZCLHmnlL3VxmuI1pOFpFVEUq/SeZRrR+KM7qeF5RY/U2U/p4Ep0NfJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLTgKFxQQFOOy+E7S9FTcPXGVQ3kkUJW5eSGLKqOVUw=;
 b=Aqgmg7czzYheFQeH+MrCALAHPC3+VZdZcocQp26NVY9wGSUy+JpV0yGY7xQ0qtzr0ITGt7Y7KAG0gBGJ5qgqJO/sVMtCbCEXCOH2uSOXc+X2s8zCJO6/jKyLLPT6J7E8tZNUKRKi/PVaX8mVuBUp44Y6vsGBOATiwMJXULyLGoY=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YT1PR01MB8505.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 20:19:58 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 20:19:58 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 5/5] arm64: dts: zynqmp: Add DWC3 USB reference clock period configuration
Date:   Mon, 10 Jan 2022 14:19:36 -0600
Message-Id: <20220110201936.1371891-6-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220110201936.1371891-1-robert.hancock@calian.com>
References: <20220110201936.1371891-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:301:4a::12) To YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e34eda41-e83d-4594-2f6f-08d9d47692f7
X-MS-TrafficTypeDiagnostic: YT1PR01MB8505:EE_
X-Microsoft-Antispam-PRVS: <YT1PR01MB8505ABA2E9E79415DFB36830EC509@YT1PR01MB8505.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BliA4c/Zd4zpIXAJ+PMESd7gfzxSikYrJHIdmP3Eg81Nj9H+HfPEyi+rKMgi8/vPrs6zaEyBRUzI6pTkS8Rh5sLslAqL+0oax6lqsNTctXXty/0gaWrvCTXw9Ll+/6+sMTnn3Sv9phwHmbvgIbCjdbljAzEV5/vTpbVergUSaAh0NUQ6ayMqz1QGmbMs+NslOgtohnYTO19Jzv+gUUCYMJUGQaSOEkXiehCjWKiNExp/72tZC06vwUR3R45A+/UZi4SslnPjRljemI6u5LsSewRPDibuBzL2cbgCi0tdn3D5qLqa+g7HqeU+1TD5vGSc12+QTw6C9QSd2oNNzPxuLRBIg2PRROWgJ8ZUGMOhG+PweQgOfjWRyvxkNhA4gjNzIk5J+uXKRK2FflRJEPK/D2q9hzD4hN0iUWLBwIn3TiM3u2KW7pQZB4tyVrBHp8eA0z45b+NI8aLujWAR2bM/BPIsBvO+o10zUKHtzA5fZRE4TM/stNo6da7pYiV1MPw7Om5cEtX9jdYGhKHHrQFvbbzn0U6j0sud+sLbYG6MmWx/hzzw2shAYqJQ8wuqfwAR85Otg4VeBja8UmendL24p4BDk2062s2zlpHHwixeyMw/eLUJ5Za9rrZf8sdEy0L4++MSxvzklQaOSsfXzxSxwIotoUpB8GDlWeok6X3ysGIvpr2Io/t7uSR6XsicBKgvZBrVJTbKS0nEE2ynkqMngQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(4744005)(1076003)(5660300002)(6506007)(2906002)(6666004)(316002)(2616005)(4326008)(6916009)(86362001)(83380400001)(107886003)(186003)(52116002)(66556008)(66476007)(36756003)(66946007)(44832011)(6512007)(8936002)(6486002)(8676002)(38100700002)(38350700002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LmKGszLsKWOT3rrIQNmg2aogtCEVQUx8vT/Sw/UjP2jT+31+/NBdn7DBGG9P?=
 =?us-ascii?Q?M6Ls05RoiE47bSqw/DPlrsAIi3EsUPSH8GfB6HkOVZt3dMfTBg0Up6QQgntu?=
 =?us-ascii?Q?u15l9SmvYHfmHIbYq/vm2CHolBF2VMiIUo6CimV2qxmoiZmARPLFgMqHTYIe?=
 =?us-ascii?Q?z4EkgI8SzJVjbjjVcznbPCVwMjDYMD+T7hekHqVHB1jUhMNWFQEmZKrjGPjV?=
 =?us-ascii?Q?TOkyiqaPsHY4qLdvbm/wEjb5b7qn03QneU1dnE2wtZIutrBLkrf2ZL3YiNav?=
 =?us-ascii?Q?M1HYrtawQSVJLWIUJcCdKBvF0UtP+kauKVntjBDfb+041Z7H8UUDC1JMLJSf?=
 =?us-ascii?Q?/FrF6h7s4P9oVwP7oLQ2Pnrqw9czDbsvbLDZn/v5AstnrHV+tnc6CuIYa3fN?=
 =?us-ascii?Q?sPwcU6tZQhTMP7g6J1/G5yPyJXVmU++VGmJmb2zqzMkIFlogH9UFa9W2FxJ8?=
 =?us-ascii?Q?+oyjJoNBrBZldC4zIAdtnt+zzjN/0m0KSMkx6YOr4x1X6lawHu+zca+1so/o?=
 =?us-ascii?Q?FZ32NQP5iZz56yK8vl//4IWMaAcRyPcwjEHC8QzBZQr2rwcxYErdWC4cIjyE?=
 =?us-ascii?Q?G955Dk8Cy5KwKNIKZ2Nnsy0tliUlhtkjKgCZ05V9aXRtsKAUvQQBsH7WR/sh?=
 =?us-ascii?Q?99pgzbB3xlIPR+8JF5V4N3Okr7CRgsViz2Wpwb4LgyPnaRilwyebAN1QdcGl?=
 =?us-ascii?Q?beIhCBqftApE/LTSMhYwPTixB/EckI70wlt4M1lZEgcJtSzEHH7/9cSLXKFs?=
 =?us-ascii?Q?jO5uwnCPCBnRgUfR5kCQnIoi2l5jHIeusP3JXLMaVHxEeBykTz0MI6fztMFB?=
 =?us-ascii?Q?xSTOFixsErNtc7p5zGC6rvYqNLPR+p1uFW6e3TNuiQvwlgfUnsTXlQGOMqgY?=
 =?us-ascii?Q?3IPNVXZy1hXfVjshD7kF3hbiQzUT3oMtA8U0KsI/XKoDzdDuDjxIMjMVD+Mo?=
 =?us-ascii?Q?aGiOKTqnlO+/6W39gKRY5NdvGR64fW3MNx/Hi2znr0M4Deh5rNBPtraMSVF9?=
 =?us-ascii?Q?wMa1xZ6BKJlGHDiylY2fd1pL7FJVwC/wHpYGa9mbLdClL6xWx6cvhPHGD3dU?=
 =?us-ascii?Q?p9fFIjhaP7EPLPpBFo+cosBkfW8Aevmn9QsxCfZR8g8dVZkPcHIvebGznbc/?=
 =?us-ascii?Q?h4RbDD5TqQtO/F2TMFI7t2fnE9LHvFAGhKqJS+n1BI8qv09tDjnZQMGVg2ie?=
 =?us-ascii?Q?3pN1Q6/FBYZ0xmkA/gLqRU4aDB+6FDWXYry/KJBITlFUmNys5q9ybbuE7snw?=
 =?us-ascii?Q?stOYgQzSjPJw+3Gk73sgthaAduKDgK97oV0xt10P31G7NLGHUh10mfRXdgi4?=
 =?us-ascii?Q?ve2QYW4A0oVV00eurOgCvqECXGZq3CTGuG70U4ghL4svziRLF7QkrxqTOXw1?=
 =?us-ascii?Q?bNNx96c1KNTklyGoX4kgjMS3G05s0hPVgn32H5OKf5O+nJwrO0fdih41YZgi?=
 =?us-ascii?Q?Oyizy7ojwBvMC7TnR5Hr5/GdpRYJmrIU9w3aJBLkgKsV8v0PGym01uqn5vJ+?=
 =?us-ascii?Q?OQpSjuhXI8uDwe5esIGJ+KGFOFFPxaykYTGjBcjulELxo7wcEwkejUVf5K79?=
 =?us-ascii?Q?JEdQFzQCfdLC2ZwqTznx4sGL9pbxaKPLnVDjsKyscVhD7BsFQqyM7wr515Iu?=
 =?us-ascii?Q?RxR+Z4fSB+xVhoNMtTSaq2bp5yvFOh2ZGZfPqxChTB3TRnhJpX0cgArQM6vl?=
 =?us-ascii?Q?KOCBd1ivbHY3IsnCjGEkc7itdxQ=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e34eda41-e83d-4594-2f6f-08d9d47692f7
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 20:19:58.7475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iro8LEYB+wF+GWBGq41CYOV1Q5pJCGEIuePCa4u4TTJ6VxloBkLc3EjXpqH/H9YaAiZct5c7OVqHvzn5r+kS08wjSA0i9fRf36QAfsqVJbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB8505
X-Proofpoint-GUID: tWXtZd0hpRwuqTx6tzqGU_oQPxUzt0I_
X-Proofpoint-ORIG-GUID: tWXtZd0hpRwuqTx6tzqGU_oQPxUzt0I_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_09,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=495 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100138
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

