Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 483F949BFDB
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 01:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235109AbiAZAFU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jan 2022 19:05:20 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:21875 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235091AbiAZAFS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jan 2022 19:05:18 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20PMWGMM019211;
        Tue, 25 Jan 2022 19:05:11 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2056.outbound.protection.outlook.com [104.47.60.56])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dsyrhrssf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Jan 2022 19:05:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMfe1UvlR+ceCj8ghJMBvppuhcNWTeDS3scAcwtnV9FfJ2fofm1gCINkyrIA9J3+AyNXnq1MiRLPyE+TFbBsrJpGY3uYPN4alji8Lu9Taulxa6GB7pLj2v6xlv8Fqqc/kPbZb0j9mK0oG9wjJ8B/lOawK7V9gUSKbd+tnjZM3pRD8F883N+wREApcsz+1uQqn0Fp8g0pEI4CcwV7sZaY1nBGcC53DUyDLMA/8yYYCMXKCJnuY24umGMs/4Mq22KeVljYuLWuLSLPOgBmQTd7CGm2ivxo4uesTvy1PriKW4PNtQpTlgxHEIujUR8KlwLLiZ0zw+Ko09PJCYXjujeAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyqmgVTS+Q1XISfdplJOobbJ/Sgxm2afTInJ8V5gf1M=;
 b=da0Npzy5pWifrKeYyiCIdMJd3KjR3RAG05XyiS87OIvF4pth0QEw76383P417oSKrTonBh4Zo3eZGdTenX932ZNnngYvrB5BMSrMrNFYhtEKmNIHWam19tPu/pMI+tQLSSJu5yFHFn6DfEI0hV/XIznMLgV3692IdTiWI1VF10WjB4Y0fA30HVFiun19mBqvH8E+ATapb9k4crtW6tUlht4XV7t20+WSyBkgBBqS8hDvXEQBT3/D6m1LwRPuYF38HC1Ox3UV7p65MdGU1FQ+NHvjzrRq+SS6rUpN1xosa4WdEoqvVD7HNanWgzRE+40mzr8DV9GVYYkZl5SYMVnbkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyqmgVTS+Q1XISfdplJOobbJ/Sgxm2afTInJ8V5gf1M=;
 b=1iuav80QkYu5XaR2YfzuS77NxWaiNaXSvLEFt1yfo+Yq52qCRXZVtmYVHV5NubuC4f9vfK3XskDzzOhSLNNWxGsr7PYk11+q4vG+Dl6rYBMfzaN/6YA93kaRGye0bPgMfp2oUL08mwL33mpJ0AlWVTIIBW8Nuw3rK1r8wDZsmmE=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT1PR01MB4172.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:28::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Wed, 26 Jan
 2022 00:05:09 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.020; Wed, 26 Jan 2022
 00:05:09 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, piyush.mehta@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v7 0/4] Xilinx ZynqMP USB fixes
Date:   Tue, 25 Jan 2022 18:02:49 -0600
Message-Id: <20220126000253.1586760-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:610:32::21) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04ee9eec-35cf-43af-f332-08d9e05f840d
X-MS-TrafficTypeDiagnostic: YT1PR01MB4172:EE_
X-Microsoft-Antispam-PRVS: <YT1PR01MB41727F679C0FCBDF576ED499EC209@YT1PR01MB4172.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rp/nlKzF8Ti2t0CTiFhHzKy3PQNic9zVBGz7jR0VRQcC9F0ymiNGF8W0qBs6C7rGWip1qxifwRTKyqBFG4YRgoG6xTl8O88J7Jy7yr409aYUCrGNDl3BNTcQa8am+JuC0xCj+fXji7Df8UD2EyPmHs1egY3emZklpUCEBs1V4UnW5bLIHSNKUoNUXNadXVYzel72rRQAnSLrDCrOBtloOi5bPjj6WHiTrzRcO/powBHHOZkC5dbhwmhojSwREJaoK75pYLeJv/itUSO86viCNfMtKNsAEI/AkHFIpiRoP6Kzgdadwr7S/FbxrA6C87Au1rqFi5/CsQUw2WeNxV182LROPSzp3mfG1TPHf69zFtJ9lmRjoa/uqlagsRFbDYdbRWTbVyb2jzz/nV3NClPSOGCFec1GYse/nw+gHtACqVHMh18/DRSHZBWwy9e2w3iC7A3soXaEIZHUDrWvzAUv04qOtGEAHsSWioHzX6nOazWpaBAe61Mw7roasmoSlWtfr9pdWCuox48bPH4yy2XaDDdrrpidL5zxd7GnhnJwnuMtDuslKTfI5S/vXr9IbWHIqyApvW93zKLnAkpz+OhbAYwywJUhsk6ag+WCMBz0W9Ok+YDGYyEtyEmkYpDdb26tzidFw3EGyLYNrf8aYRledUZeqCw4dXzR4GHqg/10OKaX/XqoMpjK2eX+zGZkp+ZyFIxL4+DqNpU7ndu3/g3d/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(316002)(8936002)(52116002)(36756003)(6916009)(66476007)(83380400001)(186003)(2616005)(508600001)(66556008)(66946007)(5660300002)(26005)(6506007)(1076003)(38100700002)(44832011)(2906002)(38350700002)(6666004)(4326008)(6486002)(107886003)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HwkvKPE6VZfl1ONyTJExxRfbgoLs1Gh97/mAVXdws5GnxSKtmoNAFgF21uzf?=
 =?us-ascii?Q?Wr/H8aoPC9qaGkih/WJyApgCdj9xpj33rvSH8b7hzo0T0e8svRLj2iRVLVLv?=
 =?us-ascii?Q?PF82aKE9LbsecPV4GAJQsWybwK3Xk0x6Fpd1m8Enot+3UDxDD3upKdMWzhFf?=
 =?us-ascii?Q?bK/6Vd9pEvB+7c9C1+o64OUmG5TsxBkeXBY/ozK5kn6CM0Uz9RQnDEhYPCMJ?=
 =?us-ascii?Q?CbXS3CuFEsxEU8+CYPyScqKssxZTREUbkMWbsnN6LZuDdlyil6lQfuT4Q/8y?=
 =?us-ascii?Q?zNr3SWSXTSV+6AqILY+3F1X8hVaM7rkt4Or/EMAigm3aFTKfFY1rNbuGCSZA?=
 =?us-ascii?Q?Nmxx0MGHdTV++MkOLhlvz4igkei/6gtuImtKBv6s2DQMhqZpeYsvJHP9HZeK?=
 =?us-ascii?Q?/4LM8ycnlLIhJ7ILYU6c4MXcM2jhKthqRoclSdft7xCZYPjwc64vzSRkesI0?=
 =?us-ascii?Q?EJGMFicg6UbOv0Dug4mnhvm9kY02MoZzY7Rkw+wV3o3tE02BmunGnsEhKxSC?=
 =?us-ascii?Q?i5gl2iX04WUJZDKWNFeBiA76+AqyY1uVmf4fzDi7/VdKucvvPjOjzN8taCN7?=
 =?us-ascii?Q?yHsa1dl7wBHiFSVkPcScAlENSt4lyTFKB1u1p6RUzbKkbAUzrrOJ30KIPBJs?=
 =?us-ascii?Q?tlWr93nJp5Avf5I3BPFJEvQCafTdtteTBlTrI6dwAuhXEyE32hCV+jNy1L9R?=
 =?us-ascii?Q?F/PmLA8O2Jom7XDVvVxxigP8I1TCwfGaV66DoD/UtTK95EfYEw31c+bMTVK1?=
 =?us-ascii?Q?nh+7+nrylA5fXj0LC++ASQVMik4Vo5nkM9fd/8H+2sdVWpr2aw3VwTHzK/Wc?=
 =?us-ascii?Q?TNn1U36b+hUtLkNtBVzAlV4NOGnLdQ+YQPJ0Th0I68DIWZY0Ll47xrioAWFp?=
 =?us-ascii?Q?bAVBlTEBY6YQbLovyq75lG3U32DYBxYYY3XSVctOnx6zEndZuOCSe5468zm3?=
 =?us-ascii?Q?XQcfB22aFhM6E9pOAxP7NT7Y5mkJzBhf+jmiY+ytSAoGRyEDykkcUZbisKWb?=
 =?us-ascii?Q?Z10CkyV8b1Hc5J/oXsUoc4kVc71lQQLi36d20qGIXvQBI/5BdcvW5Jxf86Ct?=
 =?us-ascii?Q?iibEPW/a6GL0d9B/w2fQE7J3fhpizJhXRoSA9aGZfXIJv532JvS67A1o1m+V?=
 =?us-ascii?Q?72aS4Q9qQLu1zX/XuxNhZ2w68VZcYd4sdVpXNgMdb/EOO8Pg012qoLtvBVlE?=
 =?us-ascii?Q?F9MQsYhGQNh+dwG0+dcXJZjOoZQEDw9lU3jPl4JbFlGXudqqBWaMLjXe/nAE?=
 =?us-ascii?Q?BIeoXmI8eLPSNtNOFEa9gVG+Cnd9psbDZjC4qzlvoRxN3f3z8n/9U3aLzMiR?=
 =?us-ascii?Q?jtUygz3WGZfGZHTLtCPo770HJXcZaal1VS5thoupSBCce5NUGQ7Ze2MalgF3?=
 =?us-ascii?Q?FVadDaFCds7v8mr0Z1wP/JXiE1klMP3AVtMZ6n+wjffTaYKSQ4w6GmZ2sRtd?=
 =?us-ascii?Q?uthxmnjSGSW9uTOGj9CmISQC7t/ro9cXYoL1qGYxTbEtiwBk/ig/gXczXwJ0?=
 =?us-ascii?Q?VHm0xrgaDE/bFFx8vz1KsBwI4iavellfnO4MNbPRatileMx0Y9bciQQ6Sbtu?=
 =?us-ascii?Q?dGOgXwtsyB1h3kkVAQwsoCk7oUmYOmlXq2V+mqNkTk6AoVxrvfOz0Vcp7nan?=
 =?us-ascii?Q?WY5mfCkq/Ph4tJ4PHFKHrxY8BElK+Vd1WsnVR0nftUV+acOaXP805kkSYpPj?=
 =?us-ascii?Q?YMYiLboikp8KcvB77rTS+gVwZe4=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ee9eec-35cf-43af-f332-08d9e05f840d
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 00:05:09.3063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4ESAmjUS/+EdGoul449cwlof/m1TldFc/d/DlsYdVlSSRTqL2+62nTQUSeMIeLqpUolLJPjOncgBWOZiN8KanyxeGspM9yuyugWxwoPdIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4172
X-Proofpoint-ORIG-GUID: jGlZdrLA5RKGrq5TnONX2hpYCFbEGEXI
X-Proofpoint-GUID: jGlZdrLA5RKGrq5TnONX2hpYCFbEGEXI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_06,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=761 clxscore=1015
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250145
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some fixes related to the Xilinx ZynqMP DWC3 wrapper driver to allow
ZynqMP USB to work properly when the hardware is configured in USB
2.0-only mode.

Changes since v6:
-skip USB core resets and register settings which are not necessary
when USB3 PHY is not specified
-added patches to implement ULPI PHY reset in driver

Changes since v5:
-code formatting fixes, no functional change

Changes since v4:
-dropped DWC3 core patches as they are superseded by Sean Anderson's
patchset "usb: dwc3: Calculate REFCLKPER et. al. from reference clock",
ZynqMP-specific patches unchanged

Changes since v3:
-fixed DT schema dt-doc-validate error

Changes since v2:
-additional kerneldoc fixes

Changes since v1:
-added DT binding documentation for new attribute
-kerneldoc formatting and reworded comments

Robert Hancock (4):
  usb: dwc3: xilinx: Skip resets and USB3 register settings for USB2.0
    mode
  usb: dwc3: xilinx: Fix error handling when getting USB3 PHY
  dt-bindings: usb: dwc3-xilinx: Added reset-gpios
  usb: dwc3: xilinx: Add ULPI PHY reset handling

 .../devicetree/bindings/usb/dwc3-xilinx.yaml  |  4 ++
 drivers/usb/dwc3/dwc3-xilinx.c                | 41 ++++++++++++++++---
 2 files changed, 40 insertions(+), 5 deletions(-)

-- 
2.31.1

