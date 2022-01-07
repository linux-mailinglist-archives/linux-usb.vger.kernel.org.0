Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4846D486EE3
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 01:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344230AbiAGAcz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jan 2022 19:32:55 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:40591 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343849AbiAGAcv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jan 2022 19:32:51 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 206NBNJa001170;
        Thu, 6 Jan 2022 19:14:09 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2057.outbound.protection.outlook.com [104.47.61.57])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vqg6jp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 Jan 2022 19:14:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYs0BzK3inKoacv5o4B52TP73cJzpzfbkAJLpa/iIidls9lly1O2SZrqB1wKUiZdH1/47wurFmmJ1Ov8E5JJLak8pbocap5NnUSwM03BsLbRlM0cDnzCdFEXmkFUDcvx0JeeMA0+GHPxHXVI2+9HlSTo1eECP1WicKKdSEQ35MsuBP7OFdj8kuHDvhu8LYYOCDL3ocWxgPiozUqOXWJrOVeMaq5/nZksNkwosTA9wYBLQ5sbKsWipjGo7B17CHwR/xvoR7dcktSLpDEdB4/nxZ7SriBVY4lRCzS4DAuyy+d7FsKOIIR8iMY7ErKEkM/o5Ekzc2xhDF0vyLbX3ITqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLTgKFxQQFOOy+E7S9FTcPXGVQ3kkUJW5eSGLKqOVUw=;
 b=gBlU6+riiUWkpjHCLIUxyb3vKTocOg2VY2HDD4O4Ktuo19y1xH7I7KlgZs56Ly+Dw/RgkdAhzQ25ls70IbexOadWuy5C5l3OzoH3B2o31MGY8+GL8HyqbmqqDQAA44WOhc/GKy4xnV199X0L7eScvNKzpf8fUKnmmSW+PKoHPZej0dzRWt2Mk6tQz/RhW/lwPmNuOcppH5WchYi4TJwxAlD/Da6lYHv9pdAQsE/7Yt4DjXxW1FIILxBEo4mQepOKi5zwSWO8VEO/e2yuor4S273ytqmdHSMyiveP0Cb9vZPhjIoUUzGUJkxTNjrwauxgJgw0gAKCphMjgYYv6wyYzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLTgKFxQQFOOy+E7S9FTcPXGVQ3kkUJW5eSGLKqOVUw=;
 b=kd1dpvycj4kI3+b16z7X+uDG4/nfx5lVGVwPzYovKKsdJgL2IIxFtta/j4n2jA/siozpSar4cpz1exvMhLmurAQhta8H9+hG/0f3aUbRvYXi8iSzj42fSHKOvQot+1mgUcYkhwZMKVMdbVsFIqbPwbG9I6OdsYN2CGmVP/0IhLo=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB5488.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:53::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 00:14:08 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 00:14:08 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     michal.simek@xilinx.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, mounika.grace.akula@xilinx.com,
        manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 4/4] arm64: dts: zynqmp: Add DWC3 USB reference clock period configuration
Date:   Thu,  6 Jan 2022 18:13:34 -0600
Message-Id: <20220107001334.991614-5-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: 19ae38c4-e464-41ae-9024-08d9d1729f38
X-MS-TrafficTypeDiagnostic: YT2PR01MB5488:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB5488A0E5ED427A1A4980F964EC4D9@YT2PR01MB5488.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8nrC77TqoB1XnFiBEr8Rrp1tQnlj/9kLMVHBO525nM4cXx+tXf88Mh1ZEDGgDOk1wQgglQII1evyhP/48dFqZxMdy9XtN1d5JeZ3yqXvOoQWQc7ePP5SWYAhVzu5eA87hW0dEg41AuFWELUWui42/OMA18DBsRsdWgv6/OyxzuCIPZXdLqulDda5RUzUwZy6aPhZG5HPpC5TtoPCBnF5ce8gjfD2MOOFImWMik5eyzQjEPjKVOS5OgmxcgE2+DztkH4cyHr47OJtx0qLtjFlThj9+xLccMBiZoDJMVp9DiE+DrdPenfUKsEwkWmbdy/kHYwUbU5uDMPz3oDpOTuJPCESbnyGjfZJnKVbO5nMT2pyHek3t/ECUzZce3MohKeWdG1LUp6dIijRYnxSQ1skdlBvu42VAEBU5y4G+5wzx8cXL8SBOZ5w1hKPStM7ECzRdq7juHLMT09eMix9nxL2J8a78OW2+BIMnDdEtnCcjUl68TALLqIVfCpJTVLMl/8/8KDfXOBTI33EzMOPZfSiVVI3InwoHOxKtgATBwoFzzuhqvPNBlv7zcmgkY/NPkVOEVB3X4rMrgKlD+RlXGfxZBc++MrlTNVhO93ogSy5ZtFeF6lsbAaIeDggCwg8l0LwtysAJ/vquFJf3RdRoAG9uUjEC7j9hVIj7HAAzIHGAGJy4ox1IWzN6JSKQVxFjcI6iSx21HrmT1LNPkAXNBX+og==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(6916009)(38100700002)(508600001)(2616005)(26005)(316002)(6506007)(107886003)(4744005)(44832011)(66556008)(66476007)(66946007)(6666004)(186003)(86362001)(6486002)(6512007)(4326008)(8936002)(8676002)(36756003)(1076003)(2906002)(52116002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e41Vg6yQOzGKlzOeFj+t3qWH4zol9S6lw2vcJ6s4LnYUAQ/AcKE6hsXCGUs3?=
 =?us-ascii?Q?HNM+WwHHZGetJPji68SDOvBpN8QNNLWTDS2ZXnMg5W5NKiQ8UeHU5qrheX6A?=
 =?us-ascii?Q?tFf31eb6zZqqH1GUV4H9Xj5HweEzqZVzHnnAnXR1tpZ2OxXkNEL+qSO+urc4?=
 =?us-ascii?Q?ewnAJoT/8tzHxwG7KvXmAiH2rO3+0cJm/mczu2QABKFVxXNhfdJBDiQq6Ved?=
 =?us-ascii?Q?BK2uzGymmW+12diS41phi7wd5GjDuwzriH3Z3Df2dMO5NbP6SDSgOkPgCHEe?=
 =?us-ascii?Q?lU1eT7TeerC6L5sQpXqjJrKNyJs2PYuQY8AfXswVye/M21YKBmt5tm3W/7GW?=
 =?us-ascii?Q?M9FIc0qlzZvialylTFt1lF1EK2dCgJQIO8f0XaqoUl+IFmGcdkuFDSTsy5e1?=
 =?us-ascii?Q?Dy4du2jD+DHyhgEsZFtDd0VUSDYsrRvREzdShZDnZeHJrxrw8z9pMzGRtivc?=
 =?us-ascii?Q?g7Bk3OFunPIh8HNJhFkh8T2f6IPdsWjmG8GYlrUEAM7sHyzJCCHxdw4d9JMD?=
 =?us-ascii?Q?sbgo0E6ZyPM3MKQQpgFydNAETcqwCaBajndu0KYJTDmrEv5v4aVfMTjrvnuT?=
 =?us-ascii?Q?PJwADyoyr0bJY2T8aL8Gs+03XA5e+No6BLneFZ8oVSZRvxmz+gX+dtxRnX/L?=
 =?us-ascii?Q?izPE4PCVODC9WvGoDKK+saL42FwSoVDJbvXM71+3DdbijPDaC4FJsnakVByB?=
 =?us-ascii?Q?9DqQsPnsH7BzgdMr9jNrgplQGV23yqkZ66liPnbFg526QzBZ/kdST+7M+cL5?=
 =?us-ascii?Q?rSA67EcHiSUUEXtu3WbENJsa/AmRKBszSfuV9iLxHswiC9SBNo+v4AfbxMQo?=
 =?us-ascii?Q?qQLBbF0yfmZdo+0ew1C5UallE182xiYY8iI3fPqTOpaVFixo1q9Enit/pzGQ?=
 =?us-ascii?Q?x/1XMGWdqPDOe7Ub16USllhyLeOjRigw3zr37Zt+vAT7dvVr0gc1+2ZzbhGk?=
 =?us-ascii?Q?GQL+MPg4MZTLMwMBXCKprMx29eMP8hen9XtrNFwCpnSU6LJCoEic4mg9Xsji?=
 =?us-ascii?Q?KN9DakzhvhvqL/RszYrAA9i6A9W1IFQw8c95yJGNgdFJUZvDM2T/2k3Y38Vx?=
 =?us-ascii?Q?uc7/r0D48G8lnnXFHlWGwusffDDZDdrhbiw6FOsMQ6zrCjITMLM/i99LLOuf?=
 =?us-ascii?Q?LXqztYC4nV52mqVlwEE4v45xQhd127Rkln6lHF0uCgzSzADodEsWPe7VLRzR?=
 =?us-ascii?Q?Cz2gnlL37ZzjG0HsjbmVjLrTN18QylBsL/+YFKH7BDYKs8k5glUIW2WtVr9X?=
 =?us-ascii?Q?8pIjb3m4zvqA0jcvvxkyWtgHQ2WfIUpMViww9WQnZRoIHNcWcN/SzCv99ZYd?=
 =?us-ascii?Q?ehny6NKE/GzxMPSFx+lyYh1IAVQgsieN0WRsJd5ABMv3yrAAyMcc6UYq0Vr6?=
 =?us-ascii?Q?fAGUySMy41pNkJZ1U77rv0pb6W0AXJY7oLnmLMcOvE3yatBnALWVdaV+imHU?=
 =?us-ascii?Q?EOkmouiNS4XVCOspGLJFPgqHw0gJezwo6n/7BdBukadN2UO7Zlgm60VDtp3q?=
 =?us-ascii?Q?aL/ylG03VX9tLUqOrdHgFP5fPoQl18NK9cVHHNWY705GbOGw6QD2fEkoGvda?=
 =?us-ascii?Q?y/rOd0bennJs5lQ2Rao5VMkZ1dISadZBN3oxCYQGlRGZlDjSF6Pr0pfyTGy0?=
 =?us-ascii?Q?f9KFEjVhN8HXOSmN8vDAGARY5f7Y6PbqNuCgxhopY0ZgEdvknx7bMx1+1jIh?=
 =?us-ascii?Q?BJZFfFo+b7umaiDsL7xWXYJG8nM=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ae38c4-e464-41ae-9024-08d9d1729f38
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 00:14:08.0365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +unrsYBU1/VACJplerFnSTTAQeCjHiSg9FZj1MZrruQbnZEBl+9V9N5cMVunPqziPqW8URsAktx3DbgtdT7nxpJ7i6oohepuiQjmeROlKMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB5488
X-Proofpoint-GUID: bdLR_smbKK_tzOLWYGYc0uNw8MyG6oAx
X-Proofpoint-ORIG-GUID: bdLR_smbKK_tzOLWYGYc0uNw8MyG6oAx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_10,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=494 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070000
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

