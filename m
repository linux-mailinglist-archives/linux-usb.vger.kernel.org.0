Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61D3548A041
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 20:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242544AbiAJThI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 14:37:08 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:10517 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231986AbiAJThH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 14:37:07 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI5tQD001644;
        Mon, 10 Jan 2022 14:37:02 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2054.outbound.protection.outlook.com [104.47.61.54])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgp68r76h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jan 2022 14:37:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrcg/5lEFKW92R44FAXyG6DhP3Zl31WGyJuIyzsjPKQHeV+CSKBKIJcPQ2QZsUapMhO8c+tZxbk5Kfq9qiiMukQherPIJR0EW2if58QobGvU/XeK2ulkxnWEAiJFWlnsdPAD55p9HT3ZVMQCb5YaS8Nv2KOp1EHl7Wtk5edS8ypvWLhXq7d1MdUSYFUxBPA3dGmg73saQKB+D5NB549o8Vd6eNOjYkVzGRJxOuJd2CMthVD/6z0cot7xYF+4f1Ref5z1BXmrv/Akq2+3q3TMAP9ijOPSFY8Wf3FrqCPc5h5tex9WcyOMxuftLK3MuK+M+bAb97UjLtXsBuailj8D5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaeT1AFtT9Jib1ZHeUv4lan/gwziGFC+4Fna8rTv9IU=;
 b=J2i7lGmONQgCjxtdC2MK+vdEI41QOCS8H/+XFZ9AGq3aBxBTGXd3QZ3XweY2nOmRqeGrffslU2wOiL3MwtPbAMzCjRqLFmXwVELsBZ/G8QRAWUT8JaZLCGs3z1sdCWlay44yF2xYm/GfDrm+KTLwOHMzeiVFibXXlKxS1LjZmsWg23p+iaXtKIKAiHOMuCGyoYSiuDp6se5GjDOmZ7wg6oseSVSxobF3lDIKluDonvYyMrFMjWIVSuONvWLr9A3Uej372fWkg+vfxoTyQuC1c1U3swI8IdJkJro/ETdjihYa1aitZVXhoQ0ND9LcGeX3odK4HBZW+7D+w8EP+aBGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaeT1AFtT9Jib1ZHeUv4lan/gwziGFC+4Fna8rTv9IU=;
 b=GREQDGhqk6jnOgRAUu+oKhf4adrohyu+ItEOw/8s4Opk4LJ8SXhjKUQRAYdOm52o5yicWaA7IZF0w72/IqLCQFdvIHNDKQ8ZCb+iuN8RcU2mgkn/X9msWXhru6ovY9K9bhvuIkr/eO/XPpd8P0ucSwESdH7JptWFcEKgxsR/9yY=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YTOPR0101MB2236.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:22::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 19:37:00 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 19:37:00 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 0/5] Xilinx ZynqMP USB fixes
Date:   Mon, 10 Jan 2022 13:36:36 -0600
Message-Id: <20220110193641.1368350-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR12CA0025.namprd12.prod.outlook.com
 (2603:10b6:301:2::11) To YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ce94472-5626-40ed-f257-08d9d4709213
X-MS-TrafficTypeDiagnostic: YTOPR0101MB2236:EE_
X-Microsoft-Antispam-PRVS: <YTOPR0101MB223605BBAF8B4DFE5C621D3EEC509@YTOPR0101MB2236.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ONTglzMh/2JZvnIVw86u+5d7MZBRBc+OyxITHK94yQTOHifhkdpskNGg+mDu0X8OC+CmCf6Y35h7NSVjVb6S9FnY85nwkh6L4H2Quu/VmhehbFhmgjB6fwssGolxtEwceOUwoHqJzuYS1fpnhgTmR5T/s4Z1w/zgqXNPuqwWVBGN4TDQ+Zyk3c6ADiHY0sdDh30kKjdnCwSl4/V98ywm+dda1wrlIeuUe+GEJ2L4ZjJkjHQHcfhxMKIDyUWMpnyFeudorCqBT7InSLawKcB8Oxp80ikrlONTPibONywlTSkSE0yPXfOUWW3lpww9nDhXl/ey2k727o+wMNt4zRdvDdHtzuFT9wV3534k+5wu3fpbElDKf5nsA9yAyYcfoWn7yCEEafDB28dRY8FGGeKWPsSsudHQRA/XoXW2XWNCJXxHjoWezvikZMDgUPcJR2N+xBV7S4YbHvIwJvftzvJfGNe0NM3EcAoRYRudBLFvffcp6cgtuy5ZUwnBiP1tbgzp2MfcV0Is0B6N2pxz6fTPpk8KT74rqJhSqTI43MznbWe5cDn7kckahgf3qOtO3Gtz2ittydTy4yDjT9sL8XR4DoQJfITEPplmO4jhlGMAZSqTiHcPG/OE4Ib9xGGYsWZ7RmjMc4LLvCfQtXJXEzo2/DlizmIPaY+ZCUjdcAzcV98RQBO5KL83U6C1F/udwMr9E5GN67qQ8ZX4Eo1lV4iuMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6512007)(5660300002)(83380400001)(2616005)(44832011)(508600001)(8936002)(8676002)(6486002)(2906002)(38350700002)(38100700002)(36756003)(6916009)(316002)(66476007)(66556008)(26005)(66946007)(4744005)(1076003)(4326008)(6506007)(52116002)(186003)(107886003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RgoiV5r0s9FvKoGBaKKJTICE8p3MJI/H6DZKx6s+VZrj7Xe4AP/jch1UIuBH?=
 =?us-ascii?Q?K2K1gN8YGcYqenEAO29n2G7VKoHdgD4dWC3AXj9uSSSRNpiCjEVPMLBZTcpc?=
 =?us-ascii?Q?VHrFj6fNRlGA/YoT37BGEaAQjfUT9FdrEppmYirkL/n0OnL9Ao24jtAYeuyV?=
 =?us-ascii?Q?qFMtnOAxvjzhdK22ShSSAQICeMOBpH9/R7V5cWdoszvNkWiE+7/y4pSRHzUm?=
 =?us-ascii?Q?2bCCcisqxSdi3rRg04c1QF8tZT+Cv33bUvLWXJ6//FAanywOt0dn3+HvEHCt?=
 =?us-ascii?Q?Tg0+Kx4/sizx2/uBcyQzyPXpJ2hj4eIOwRupTpj3m2gHR68F6fKqznWApfR7?=
 =?us-ascii?Q?DWXjc9m6SetkQTxw9lqwctZ0AS9c/JwTP2UrI7SEzS87S3qXP1Yo2i7eQlvy?=
 =?us-ascii?Q?BhkuzKyk/3YV3NGinNI8VmjNzSTBDvob448wodGDUdYmAWoopjfEGWueQVpv?=
 =?us-ascii?Q?gK5V+FyfBn8wkv45z8h7SpZmXR6fcyUI6kLc63dcT+EpNA17gBDTvi1qEFGI?=
 =?us-ascii?Q?gYOUG9kR7cM/5rZnHqDLwfEZHOBz9Z6lQvXOIc1jvBS4McN6JuOe5yKMnt+c?=
 =?us-ascii?Q?TxZoRlDqyc53vpQOcLR84PuLnDW89RpgVF7zuY+JS0Aa0cTPYUHfVKZKtT3q?=
 =?us-ascii?Q?MtAWhszjFlzEwaSZm9CGqgak5L6gtwhh8pjUoxcOZfK+9Ekc4x3AbjHpxBQL?=
 =?us-ascii?Q?BdnuksYwyAj/mweIoGg3CZ8U8uXqgA/n5+jYnbmbli7ksFCAMcAdtAj1gNkJ?=
 =?us-ascii?Q?+R/qzLWthdqjit1mBgep9DUND+kEET/PJh3x12sgKrFkZ3ooBQ7ZtqzrBVKC?=
 =?us-ascii?Q?LmVHNFzkkn4iSBiIxA5gwN0UhP+uf13iD84XgN/e4dtGqth3syVjUgc5Qdks?=
 =?us-ascii?Q?sQ0/rh5ZF/rTjXJWSuTzlIXZE9kwdrBnl7obIeMQb/y3TpjhyMQbQJ+yygcW?=
 =?us-ascii?Q?gC7XWsEgqt1cZv9ADqRdGUwfinylzHeldlHj/hhKENAnD3Nvlie6W56H0Nk0?=
 =?us-ascii?Q?o+SqJgKOLLmVebKnndu0+WpACX20JSs8l0l4SFcbQSEYopfCvPUDtbY1PHLB?=
 =?us-ascii?Q?1UkMRm8v+XU6wz2OmCunxsEEhnXfR0K6AJ+rXJAeL7cWq12xnVwtEx1CRWij?=
 =?us-ascii?Q?Qvf8VPpWTV8b2SaCmm28ziX5uWtbJtVzpfTPQS4x3SLv0J90qcjf4u34swUI?=
 =?us-ascii?Q?1ZzNKkmksSHPBYNat1ryaUtObyYmAbC6Neyz2dWjfUWINKWnFWrdz+ptO+q2?=
 =?us-ascii?Q?wU3BqEeC1YJlmfm1oFfKudZt3OdOfeZU+kF3OM0Yl8Cr3r+aZ5pt++1Kz3YL?=
 =?us-ascii?Q?CkBbmvg1dkKLR8ermiLfgp7SKBTfcOhdgqHPfn8OUNRJcLSzli27FqFn1tGD?=
 =?us-ascii?Q?wFy2p2LDooO5Nv9XXOzwgoQAU+hfovJ6Z0xQIk8MgfKge6g9bW/WTavokzlj?=
 =?us-ascii?Q?8xDAwDllKF6gebLgbcUVApSzU3aljQV6LphmHqMsTgYDvWyWy+hVoyxCJQS7?=
 =?us-ascii?Q?7sKpWwHTeoPYdtiN+uLr7rl65KER9SZCramiNcsiczCKlV5lbWShSkg4rMMZ?=
 =?us-ascii?Q?0n+f3EeCWDIAoBlEP0AMwvNZSRTO/an1MW1vZJE0f55rc4UDXQMCUogLx+mU?=
 =?us-ascii?Q?7LqTwyvdpRpsfwKP//GLNvlizMwUTXVcM5+uWWR6yDHAQ55p7NzAQJPurwdI?=
 =?us-ascii?Q?myiUQw=3D=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce94472-5626-40ed-f257-08d9d4709213
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 19:37:00.5435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkcsk1NiA3XR3d9aVUAc/pfbROkhhf7dxPodhjloI9ltjvWfbbwWMGqJP2IMM+HWBy6XwHWzjoNZmePx5eVbBtblv3Iz5Q4wdA4UfhSuLD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTOPR0101MB2236
X-Proofpoint-GUID: Ml9gigmuELKjiTMSz2YdOGjXZfgbszoW
X-Proofpoint-ORIG-GUID: Ml9gigmuELKjiTMSz2YdOGjXZfgbszoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_08,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1011 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=452 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100133
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some fixes related to the DWC3 USB driver and Xilinx ZynqMP DWC3
wrapper driver to allow ZynqMP USB to work properly when the hardware
is configured in USB 2.0-only mode.

Changes since v1:
-added DT binding documentation for new attribute
-kerneldoc formatting and reworded comments

Robert Hancock (5):
  usb: dwc3: xilinx: Fix PIPE clock selection for USB2.0 mode
  usb: dwc3: xilinx: Fix error handling when getting USB3 PHY
  dt-bindings: usb: dwc3: add reference clock period fractional
    adjustment
  usb: dwc3: add reference clock FLADJ configuration
  arm64: dts: zynqmp: Add DWC3 USB reference clock period configuration

 .../devicetree/bindings/usb/snps,dwc3.yaml    | 12 +++++++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |  4 +++
 drivers/usb/dwc3/core.c                       | 35 +++++++++++++++++++
 drivers/usb/dwc3/core.h                       |  3 ++
 drivers/usb/dwc3/dwc3-xilinx.c                | 17 +++++----
 5 files changed, 64 insertions(+), 7 deletions(-)

-- 
2.31.1

