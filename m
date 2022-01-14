Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8AAC48E363
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jan 2022 05:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232102AbiANEni (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 23:43:38 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:13135 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231605AbiANEng (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 23:43:36 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20E4NEdc009827;
        Thu, 13 Jan 2022 23:43:32 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2054.outbound.protection.outlook.com [104.47.61.54])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dj2j2gvtf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jan 2022 23:43:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXY0+DyAjtIrJUcUWk6peY9l8sZiITT7wT/y1Pi2pTGdMAe3TQUz/m9EoJ0kSlP1rjbGwthWDyDEgJsfeLo2uliwTrILbnWOsyoRXTTmi1hNCsXHjFp8U50+f/qbpEWPLjBy4CnHSBJ1O7UxB4ueom1N4cc3TBrtd7bKfTonDVcvvCrw/VcAS4TijEMU070ETHlI4P0lXWR6YpdY6tMxcTBxIXek+Tf5iRzWtoID06C5YTQzDKaNqL4WaKKpxLL2/ERlWrWpVoKr3ubQQ/TFHUCnyDwo4p42brTT7eD0wfKYd0V/yQfPA3QC8KsMAI5okJGRLl3sc4cuxjitOqN6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLTgKFxQQFOOy+E7S9FTcPXGVQ3kkUJW5eSGLKqOVUw=;
 b=RZjm26kxg2qzcrpXSxJBslM3wbx+zbDoeA6n+GDcHoKKxXaGX/MN/2H6elrsnWIUipYNsENmRZPRd1pNfgs4p34c7FBSijaQmmhw8A1AX7b5TVRDltjPCsDPPG9SkM0c/DdlmYbBqr1RE0fShUk0gzf9Sdh9f7TjWn20eR1OfFt6lNEWy5wp/qGQLghsQiyVXO1YmiDCysQtvIAiSrND1S0bY6vFMFTjx2BLqdEYhqxBLkZrkW6CyfdDQWfJzA3luj610AjZ9c3fK4eHG3i1c34kkbS041BGCi86iRjPJNTwnd0mTvedx93KF899uWqFoPoFef8F5xYCsMfeJG0Y3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLTgKFxQQFOOy+E7S9FTcPXGVQ3kkUJW5eSGLKqOVUw=;
 b=GApRA0dC3XuySCSniGsWqKszli2qXcuwCQMq8V7pKY/mUfp0Sok7015RHcFFmtpysA8HlDA0N4OVP9Mv1M2egvewJe41sC/Rbq7PadnzSqlkGTfebaCqnu/uwJ8KxNGWf+a8jAKvkJMnq2QpzuUSQCdz9hC3R+1A0/lhGqagaC0=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YQBPR0101MB6341.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:38::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 14 Jan
 2022 04:43:30 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d51:8098:30cc:5bb6]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d51:8098:30cc:5bb6%3]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 04:43:30 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v4 5/5] arm64: dts: zynqmp: Add DWC3 USB reference clock period configuration
Date:   Thu, 13 Jan 2022 22:42:30 -0600
Message-Id: <20220114044230.2677283-6-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220114044230.2677283-1-robert.hancock@calian.com>
References: <20220114044230.2677283-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:300:4b::26) To YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d020cdb3-9865-4e0b-eb05-08d9d71869ca
X-MS-TrafficTypeDiagnostic: YQBPR0101MB6341:EE_
X-Microsoft-Antispam-PRVS: <YQBPR0101MB634113926BC5C99FC2527F73EC549@YQBPR0101MB6341.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sr6l+Sb+j2jb4cC7aluNShog75CQ6HcI18t/WOHLP1C/wzwR42K9IJq6qDFAwgp7RdvXPK9/rn15jIgm8V9HceOEqK4Rl6AQJ3GGe2KKZX8knRMCIDX8NqwitYtN5wTypJPJ2nuH7HxWYFw8XryfXJN7WcyHO+P9ENt76mQFrcVlvUgYsX/GATCwkY/NkBDcbw5Mbb2qfxuoFDq92Q/a1nzKHKyWAeFnEfmF5IU1q9sH/jr7cCQul6PVTWJRzqHW4J90a/Am3pJdCg0vSeYsFdQFCTHJIj1b9MXgAN+z0WiTGnooXOviMbW0VqNfVci7T1FpEOGI45A2OX0vMkRn0magadCMEYG2urYHGZ6NMXKHmq37eFT6F+08+wy2S8/ULFS4G101eSFEA78gvSEGV8ZIbmMStTYE+vjXt5f5J085DXszEJvEXX+Pg8QiRSVe4EMPgS15SxKO35y1nZxwQi7wVDolbJBcfBIrZtGAimbW5sDSUAQfDVCSyp/ZoGmoQhjAK0T7MbkCapdcOKmIla6CNg2OlX5OXOlbL1aY24bSIvbR9t7Skymk4N2XHUfQoAcV5rAENogSr4oMXSONp/A8B271P7yWHhnSDg92SDW7l5+aTQV7UH2IIurzCXccxFJT71dd5ALcv/lHVrzeBeQoiavp4aaYK69CF20cbqcrp4Q3VP9wBdX1l3Ny7AnZdceZoQ1QCz7QwZDSk+gghg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2906002)(6486002)(107886003)(8676002)(4326008)(2616005)(44832011)(5660300002)(1076003)(83380400001)(8936002)(86362001)(38350700002)(6916009)(36756003)(6506007)(6512007)(4744005)(508600001)(66476007)(316002)(26005)(66556008)(52116002)(66946007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uWirOt3DlFyaruBEeVqN45sYj9kIDQAAkFlGA2KpSCrwHjuTcoC0u5L7U2rK?=
 =?us-ascii?Q?0murdXjcDe5YJ8Vm8lHGQPGvFcaAjrrE8Zm3IU5o1WqUr+9tWCQd/95TUZIt?=
 =?us-ascii?Q?lLu0r/fhCH8Q4xaVhCL3JnQPQg+cjBt8ZMI2N1fUdhTInqEca30zvEbGbTba?=
 =?us-ascii?Q?aYMrkE06Ej24RL7aJZmjilCWekodiT9ph2HL6t0LlaUXf7WJwyhME9hC80Sd?=
 =?us-ascii?Q?bOkssGvlAr02pVAme0AYG8GiJaDd5g59Aeas9fDl48Xi7+CRTYFxl0YX4wKi?=
 =?us-ascii?Q?VAVawvGNqlVAMZWyAAk1xdgSWukxGM4KdHPLPJVPROewo5C9tQhzR5bFHnyU?=
 =?us-ascii?Q?pMC2DqCx+p9f2pJt9m96I1jJJyE5huM8La7uL5xi8CpqsXDdlI9Zl0VFy3H1?=
 =?us-ascii?Q?RbLOzWNrciIIzbtDPn+5f+P1zVtaXU7qaKDsa8bjSRce0LmAAD9+395x+Sez?=
 =?us-ascii?Q?qahwzAl7CoYvERzCFPj9Bcvh4X+HYBBWgCvD7JPP5+1EH2cijTSqbCGJcc6u?=
 =?us-ascii?Q?KbshRBb1E74CQWCTJIVPX5Zpa9gwGcZ1xVGM2P7d5NyPfW/pvCzATzM7cZJD?=
 =?us-ascii?Q?fcI38E052WPaDx5UVlDloSZCMe9MMwDEWZPbgC6mmnLRHqzYsG3gTm8neaSP?=
 =?us-ascii?Q?CFLOsnpp4sLbqcpuVcC7yGWfhCdzSqBJ/RPfwlB+RmP3cj37i82GrL0q6hKT?=
 =?us-ascii?Q?R9VmEO3R+eOm+6JR1LzV8yblRzLzmb/C+p3kP7bS7AWW/P9uBkC2it8bAtSZ?=
 =?us-ascii?Q?PoX97XtLOdLPPXz+dnQrfkjhAeKvC4xKUFFqj3W7iEsJiFPhgYGzcCVd/WmP?=
 =?us-ascii?Q?mhNN+rpFRpQpqYrCGHkttxEh6vHrJ9XlArBtTsPrwJe1kOUzf9kj+U/xzpbc?=
 =?us-ascii?Q?I++WEeJzXc/mnbwDX5HBKPAzktUfJS1Dux9uwbpYV3U+42pXy4IwRx3ixQy7?=
 =?us-ascii?Q?ciQAKUnnwPIVWtQgMGV/FJ7LW8NoP5CMibJ3hnFkpSlLJxsMVYARmjoJ90Qk?=
 =?us-ascii?Q?wVWkZt/Ai0xesvmfgSkwKJibUuNYjyCyPnTyS1Vq3rqWTY7Zrf2r1tgvaebP?=
 =?us-ascii?Q?Qm+cgVdas9U90JmVkqhvM/0Qkqz6G/f5LWmU6kcFPSDqZth8JefYqoGlrHzc?=
 =?us-ascii?Q?lZ9kURgg+K8qcHtJ85TSxU41TApK0PCrDaeNyuK+ruklg9wsfsH0i6l7pBj7?=
 =?us-ascii?Q?wR7t2M1A7fhlNMfuruMuUben2gFPAdhePCTa7djU3R9d4TCG34QoQFlWfnNU?=
 =?us-ascii?Q?DRm8/THxIIVBsY37bvvme6/hpLmiH0cbR/5kf+dCWplvJi5kc7omV3B2xSlF?=
 =?us-ascii?Q?bbjt7v5uJ3gkyvekK+vil6uFJewF7v9tu1hbK5SlICvCryW5hQYrOt3JVVew?=
 =?us-ascii?Q?SIe3QWM/6Cacs0dUMs8dzefdiPONFdEU/inKPwLjedkQEDY3pNTeWTNXcBcx?=
 =?us-ascii?Q?slw9uvK7XY0xRHwLWKsG81W+y7z2U0WxnRi7Bo5xNTdvZq5Jadeo5DNWSJdJ?=
 =?us-ascii?Q?p9rZss041ciu+KhBavS8s3cXTCI7vlsXqBdaC8ZIXvnNrd3XaCyZ5G1q5NZT?=
 =?us-ascii?Q?Mz36UrrvIFVUge8b1kDWBcTiWZaD4/Fde3Rc3bDzz5ee2AjEO3te20Uh+ekF?=
 =?us-ascii?Q?AY0dhz8vpH4IiQbd8Y6wKJs6BD2WwjNPtior4v7ucKfsnm+rl7xE2ivVUoS/?=
 =?us-ascii?Q?LVp+O2PO7vVVKkBU93jKWIz/X10=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d020cdb3-9865-4e0b-eb05-08d9d71869ca
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 04:43:30.5459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6KPsnnvUxwLnV3iEpV73gxJCagWXPPc7F3VvG8oeJeCEPgX4aEY31/FSZQEXZJ8+iquw1U1/z0FBzgzeAOb5C5SUO5vKNYlDSdQeaFxrB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB6341
X-Proofpoint-GUID: I-Wp1CONEA85UCEwZvZsuWNb2YZT_OOJ
X-Proofpoint-ORIG-GUID: I-Wp1CONEA85UCEwZvZsuWNb2YZT_OOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_01,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxlogscore=510
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140030
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

