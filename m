Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9108949D646
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 00:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiAZXkj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 18:40:39 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:21391 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229764AbiAZXki (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 18:40:38 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20QK9QK0001725;
        Wed, 26 Jan 2022 18:40:32 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2056.outbound.protection.outlook.com [104.47.61.56])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dud3cr38y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Jan 2022 18:40:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHzZRueCiklRO7PPY83cGUS6oWo/yJtiJdHOXt5kbtlZtyNx93JVjYjVtBNu+I7wma3sMV1ttDzh9lBEe3tGXbRq4NJH1tn8zShIjo9DeUSiIQfSXLHPkKBboQ+6tEumxr2IlEs3IB+Ud8/JSrjMB/6SRaJD2FR7Kk1u5Zn0LjxrDkUnxTp05m3C3ZpZ7RlHHSC9SrlDbY1/U9LhjA4vDSm1nL0JW6kEnWuYE7GPykxRjYI6JdNfgyfcX30bEZM7Zqrd2QLRLmwUTiMBuPzWHmJipeRdSWRFKDbksSg7K1TrOUczFs1eRX13ch51w4ViBDHvGMtqqalWRd11eDKeZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQHuXFEyWo0rikcxXXdqYDexgdZ7ptezb+cxpjcpvwA=;
 b=Q9E9y1xlEYF+b2Zb3hPG5hMNPuu69/PNw4M5TJ6tP6V6GMWZTujFb1q3Rff4wDTpb+wo1VWSPzGIhDUPeed4M0SmV4OlMMRThz1zXJK/jDEWtAfjScWAmv0ptI/sJw2TkWc4QcjPo2jFYEINOMf8rbgCF6696ShqAwyH91Yn+maJ2qCpAAYMvYkph9EYLLizMCmpdAJ7KYgB5lr/ztm5nwzXSjVPVu6KbJxWqeXnOKyNNr6O29s72iyF6DBGRpQDDYvZYGZry++Wl5NucgDSeceWC09kL6SuEDX1OrVwMJ1G6UxMpqpxH+Fq4fR95kK5+8815kB3dercYM+6245w6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQHuXFEyWo0rikcxXXdqYDexgdZ7ptezb+cxpjcpvwA=;
 b=vj8FvNa133MOjcWjYcYIK2x4lu0MFwymdMWIqwpttoKeypemqHQeM+2wqn9oSdWTHM/xuLSfRaXP6e4HjCR7AebDlhKzyWTXx69f+FkPrmi0j+TGH4o+DCTfc9+G/klyyR/mircWaUFs6d4J4XB3CfrDSPRrA2ExAtVi3nxRRn0=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YQXPR0101MB0853.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:24::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Wed, 26 Jan
 2022 23:40:30 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.020; Wed, 26 Jan 2022
 23:40:29 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, piyush.mehta@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v8 0/3] Xilinx ZynqMP USB fixes
Date:   Wed, 26 Jan 2022 17:40:14 -0600
Message-Id: <20220126234017.3619108-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR14CA0023.namprd14.prod.outlook.com
 (2603:10b6:610:60::33) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd0ae47a-a456-4191-dee9-08d9e1253c90
X-MS-TrafficTypeDiagnostic: YQXPR0101MB0853:EE_
X-Microsoft-Antispam-PRVS: <YQXPR0101MB0853210B25A281B028838715EC209@YQXPR0101MB0853.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Dcr5MhDLi+xqQXqldNNUyku2QWJUO2T88MW/NAsb2YscOTNkDN0zvUneIVzKEZVlr029VnvmlPJ7ge1cqzKa7mEfSxbfdvHD8/RMAU4S29ZojRVwq3qjKiJiKCg6fYP6cDzU67gCoLsl7j+MnRjzXA0dQ4BRrm9kd73d4yV93aU8jnQe3Po+sO466H+Fh9FWsW17LACbQNIZ3OKbY4/9+bppZ87/zTbWzgE9yc2GjWSynoYvB155AaZgWQRg8/hR5mIOSrbrwMpHwgaCWAYiDkHla6iJJqODALbiHOa4ytitjJ7iDvJV7TGWnvVs6kNq0X236/QVcqwi3/TDYvFXtrwUGJvbSR4iJSMD+Xph3PWZhd4JL0iKg5LBkRbtPKkbWHlim8bg88Qq1V5nsCgYpiYZCfOgVBIw9502nlpBh68K9NENrKbng6XMGQfTVnloRE8sDszcPzN12Fn/OcI7Wf3aeEPUvQZCtmNftFnNXYty4bhMLmXnvxFlW+yPSwMOxkaUJT0c1UyydFzKc+yCTESn3yBiYCOfugi+fYhbi9V/oItJ1Tmy2CfNV03fLC6TzRU7wSsr08ORSdGFnnS8ztfgDeQfRwCd18Ebh6DcYv4xqhxNlLDDQ7B2WNW9UjPGExNdEbvufxd6QLHYKSXygBG0rklzutJbWtoA9Y8f8orKnIZgW7J941d1jPeD/78NFqHsplgawfIARTS0XwX4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6512007)(38100700002)(8936002)(44832011)(6506007)(36756003)(4326008)(5660300002)(1076003)(186003)(508600001)(8676002)(83380400001)(38350700002)(316002)(2906002)(6486002)(52116002)(26005)(66946007)(107886003)(66556008)(86362001)(6916009)(2616005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c82V77W63iza/bJ4zvCjM3vLlxBDt+hRA0QROcRQVKduzV71bP444F4kVwXO?=
 =?us-ascii?Q?5PV3S5nd6KnyjheCTuLBsY7wqzWrXxUwnWMU0u1nK8fanmaULyqy6/vRgGrZ?=
 =?us-ascii?Q?HOmx3I4LyZQtSlGZxi23G88BJGkCg/sPqaYiBZtSL0huXNjpviO0atOoUcuX?=
 =?us-ascii?Q?3VeyaYoUBM8F0mACSoW8e6p4K/h6Irj6XhSuwMSVaR2+gv//1NVXAlVsQ7HB?=
 =?us-ascii?Q?l25fQfsS+IIQsRFN6oddO3qF2KqgxA7WPjWvfeCWbAsYuTEp4w8Mne/vNhg6?=
 =?us-ascii?Q?7CEqRaMTqfM+QmWpkME/psaGZKytjgn5gQG9alRVWmPWGqcFlSqzF/p6wnvG?=
 =?us-ascii?Q?1mc/qd4Y44SGcCy6IJR0rVHWzMui8zdb8g9ZR2mdEUVBIsPtp2fB5yofKhWt?=
 =?us-ascii?Q?pdVC2YLqy2aARCZJgjfjFKcjIK3f5vgs6c6Riab38iOx1wFLWIOfMWwihdKr?=
 =?us-ascii?Q?w2BV+W8Q4Nars0vQvfWKiQzj2Gw8/Zk3Xi0RZUSQwgqlYb5EafgBon0BTmQ0?=
 =?us-ascii?Q?c+yVwGP3fxv4dYvLPcLM5FwhaLRZN/Z/MEOA18p0PWYUGm5wjSY84jIlHHH2?=
 =?us-ascii?Q?4hyAHwUzJVFsPZ7qC/+sqMYXDlSNUmLp89JXtG7Dh7U+mq5qzetC/0hHZYBz?=
 =?us-ascii?Q?7U2B5nTmaTxhp1Xty9YxcT05UmbLuZDqPauaJ3aJG14EEW+A522MsaG8TcpX?=
 =?us-ascii?Q?7QyJ2SeTNmoPzVmh3YOC4PpDBAHz//slaxQZOYw+NqWD5xRqTyJpH0rBk64g?=
 =?us-ascii?Q?8sgO99NPujw4HNbNxm8OJkNhYxJI+xjKqbQhUcyQ/7nblpFpqTgQvoWFE0fL?=
 =?us-ascii?Q?QGxK5pYm1giuF7SBb+D8HbDsDB4Bhw5+/39L3sqqW/HwowhUacoJTxactbrc?=
 =?us-ascii?Q?aWOoGWp0aAzqv/xVgvdj4j8F1t+jBmDjFXJoy/aAckqJ6IPdxHtFIvFUxsJm?=
 =?us-ascii?Q?Hmxc5lktUOSs8xNURJ2TQ0Bn7hBHeK8yvkzPfSbriITk2t4/jgw+ytN9H+x2?=
 =?us-ascii?Q?mkwP9yG1W19JdfTekZcmL6oFaGtbFzjNlQV/cEphC8X46JaEZeRr5a9RJ1Un?=
 =?us-ascii?Q?g7SNuV4MtlBIq+8FP6ePB33Gw4lOz7cpapNSuO6C9km4marzDxPEYlV86yYa?=
 =?us-ascii?Q?cpmDyCV5ajKuu4bs+gx9hB6M9Yvse50hD6JBSbHiwDuyAJx0+YImkNv2O7dx?=
 =?us-ascii?Q?MxhgvgrtqNdrYSKqwTC8T3S+UdXbR+JFc4L2uZ6quk3Ip4SqdoEZJPBdAsmu?=
 =?us-ascii?Q?k5GcJrLNzwmZiLQ8U00h7OgHCNYOrC9H3e8V76czxmRRSKwAGU1ta/Df/jzY?=
 =?us-ascii?Q?fKagt+WUBcgSo6ihAwy/2jnK80snK8o0Rm69aeKBZLk7bBjo6pc67v+gspT3?=
 =?us-ascii?Q?mK9xI5xQiCj1S5zqjHzKvizEjoAX8SVdatBIGMovM5PXYE1q6Nb6GkGbo87I?=
 =?us-ascii?Q?+M7qnbE8GZTJcpAxdqRbmrXykqIn3+vzAiCJNVIxZZQ4+/CJXcUe5TvBKgLA?=
 =?us-ascii?Q?DQI9vnSxy+/z33gifx57cAz2eRoGVP2SD6achY9OS9Dgc0qmy1XGmDNi0I9v?=
 =?us-ascii?Q?C+XTVzLywoLCfjwb9QR6jTt5wkoQ2V8XYEfLsw15QysPz30CzOpTonipG9W3?=
 =?us-ascii?Q?M5MSCJoDcVO4PlfbsWLgLljSYw23HT784Ru7jpdeezc4hviGNca2AU6sUqjf?=
 =?us-ascii?Q?qNzIabzVFK6izZ+EptN3dgqZ3iM=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0ae47a-a456-4191-dee9-08d9e1253c90
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 23:40:29.8302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z478mOH44bbmqa9f4pYVW9Dn4S85Z6eSwoBoyEkrsGV8fHojNnlD5k06t47we95EFoPydwioXALLAI/HufU7jbbEC23Z4J/EJu3UQLD9N1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR0101MB0853
X-Proofpoint-ORIG-GUID: g35usfvfHj3QKj6SR2AF4eXgL4FpWye0
X-Proofpoint-GUID: g35usfvfHj3QKj6SR2AF4eXgL4FpWye0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_09,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=731 spamscore=0 lowpriorityscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260133
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some fixes related to the Xilinx ZynqMP DWC3 wrapper driver.

Changes since v7:
-Drop patches already merged. Add a patch to fix a bug found in one
of those previous patches.
-Fixed error handling for reset GPIO

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

*** BLURB HERE ***

Robert Hancock (3):
  usb: dwc3: xilinx: fix uninitialized return value
  dt-bindings: usb: dwc3-xilinx: Added reset-gpios
  usb: dwc3: xilinx: Add ULPI PHY reset handling

 .../devicetree/bindings/usb/dwc3-xilinx.yaml  |  4 ++++
 drivers/usb/dwc3/dwc3-xilinx.c                | 21 ++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.31.1

