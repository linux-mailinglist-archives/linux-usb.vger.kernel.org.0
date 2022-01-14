Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26EB848E359
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jan 2022 05:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbiANEnb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 23:43:31 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:37850 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229628AbiANEna (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 23:43:30 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20E4hPmi005058;
        Thu, 13 Jan 2022 23:43:25 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2054.outbound.protection.outlook.com [104.47.61.54])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dj2j2gvt9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jan 2022 23:43:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoY34ARyxor8lwltrHiSF6tzST8JA8P3OL5+n0uWK6SsKGXHVKefflT0qBDMGh04kCW+wvVhJ/nLpUmw/64A3L5X9vX9usGanYVEFdQK9ZMPtRJSMxgrHpPgwC0izpcFMxE0vku0z0bZrjxqjNu7Cw63dBDMu3+c2/EZfd5ACLtHWPseTM1GmHjiQitlbL5ns8O0ZfzEmhDDjKh2QRBsFPHKqOp6pNkZuSvny8bUf7/CLHzbj1myqx03kKQon6846hl7tekas71nlCcJU6n9YlJon4fskTURxia5Hcs3dQ4Hgthno9JnJspda+EQKLnb7FPJqrOq/fG+dJNst6R8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AM05AM7GvScz+0XPIRWAJy6fcIRZQ8Tb9KhzwxqKgw=;
 b=m36XqGjC3yLWo3d8xFIjbkxDTERKSrDLhTZlU6g0m+SZyCoPVJkpPWrPNJVbK/rCcAJ1KePd9RMToakIrHd2mazKzkLpG3LgK8hSwrT7ve3jczENFbhwID72KD+ird5+RMEZrk9VupMXlpjwweTqrB4SL8QL9j86ELc+z9UNBvDWTvSqlrQyq6Q1ZsBMwSSVw0rUhHrSl7/4ykrb5DYq4BiCXMlptmws0fa7sroa7a6bpb8OrHGwqmHZlM+9y/LGHK+Tgllq0/vg9WCAuTk5TskyM1dYsP9Q0gEX14hiU3EH/Bg1xM4SEoP7xCXCnKWZ85j7C/xTGHZ6OGaiY2/Sjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AM05AM7GvScz+0XPIRWAJy6fcIRZQ8Tb9KhzwxqKgw=;
 b=PD5E3+9/cdI9DYBXw2TlbqASTvdeiGexRYZGHD6m7CjCQX6ziD82jajLkQNyxN/kxMqoywWYcufpYFypPZ3C8/OSZbyYevPYqdgeGyvjnLuOQgoXbfFZWZi/pBH8nmfZ+E0lr10ZTK5VMF/i5l6+a6URNbKoG4mY+CKQE8gmOic=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YQBPR0101MB6341.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:38::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 14 Jan
 2022 04:43:23 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d51:8098:30cc:5bb6]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d51:8098:30cc:5bb6%3]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 04:43:23 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v4 0/5] Xilinx ZynqMP USB fixes
Date:   Thu, 13 Jan 2022 22:42:25 -0600
Message-Id: <20220114044230.2677283-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:300:4b::26) To YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cdf6386-c168-494e-6f87-08d9d718656c
X-MS-TrafficTypeDiagnostic: YQBPR0101MB6341:EE_
X-Microsoft-Antispam-PRVS: <YQBPR0101MB6341A89098AE7D7E85F524A6EC549@YQBPR0101MB6341.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fNao8Ma88CFTdpWyXs3dzrk9S/9Il/Bjy0e64jK77y6lTg3BesuBRhyaauTLRROh6u4aAZWIK8Sp6302/UVmsbtWEGt98Uq76Yz53AkWoVFRmpcXy8qef6+ghn/McPWrz5FSael2VlhO+ooFO7SACVUGiibBbsUSmNvtOdBlbWEdoZLDu2hYKoGHoaFwOwi7B6nV8D/1QodT+ookEzFd3+mirgi+KEQdUirr9d/7ls5qqifOYLfaJ0IKVq/h84ZKkVMRxcoicMscYYpOHNc7NB74lREs8gZpSFg2vZ8C3PLUgNTUQHrga+uOx3fOi6qVOUWlse8HPtEkKf0fJUt7VvUJexF3xXbPUFU+FFc8p6UZkQ6Pc1+q/3b0QXBGC0LJnb8PAngOK4rs8mguQRL+ucYbKVO0hXrSJ/eawQlmMtyBMpw4RfpwOpHpLYojvPSiLq7zfQGugabgT/TrBCp7LAr9m3siMWsZvGptvIY9gs6FthXjuNb5Jm9U1XANEZ7xsPsUJkcl+JanxeeSeIlc3TpkPZ02y7TphjwL3ACnJMk+rEYSkqbcAA6Tqff1rZQYuCUx6G+A2NtstFzRGGc+DDp5DkO68eGskCBaibQDy3m9s/5neacl7s78K7uCvek+Kv58mHPHhiO9t559XxMWcTFsdEjozqVpKwINvrrJ9JTtIkD/txfnIj2ZkuNwW42pG5L117jJcDeBpNfFS2mHIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2906002)(6486002)(107886003)(8676002)(4326008)(2616005)(44832011)(5660300002)(1076003)(83380400001)(8936002)(86362001)(38350700002)(6916009)(36756003)(6506007)(6512007)(508600001)(66476007)(316002)(26005)(66556008)(52116002)(66946007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bPoPS54xWnvsQNavv4SB1IsmHMOc3FbE3DPyJuuUcVrzS1K1UtXiqrtFtMlk?=
 =?us-ascii?Q?ogOuRA2UknnstOEjzhL19ErQmXm1CRnwJyn6WasKhqjs2V2qYln6Gzy8ReSV?=
 =?us-ascii?Q?UcN3go5QcQrN8FfHvTCsSYH2XlV3locvookPFnRCc/kSoU6fWu7B4+UYoTly?=
 =?us-ascii?Q?hmposCuBSZMa1PQS7sGDbyT3tSVHv5biqNYzWqJ+VDLj4QdUAp8LVIkH5TYX?=
 =?us-ascii?Q?HqyIAOyQhmLssq1ALPoKeNMVgppc9prCDrDo/W8nMxPimiuuv3Kz0t6mXyYN?=
 =?us-ascii?Q?LDUR5hNDFX2ZIqcyvmtnd4qB+OhfXXTXZGkrm8Wf2LqODtmnLx7N0fAl7ZRQ?=
 =?us-ascii?Q?YbS0JQ2hi3mpX3KLoua/FduvMHbKHQgOhIs9cgOYHqkyefMJKS1yXGL/UE1G?=
 =?us-ascii?Q?koAwLq6gTkM2NAMckIC8blsdJC858JOShupcgzoa+6b1eMTYPKSXzcN4VNsz?=
 =?us-ascii?Q?nqXh0YIhIBdwnx9vVl8Ok1j4r4nD2JQ65aZbqklH9qtaglaMjbIKtDH840AV?=
 =?us-ascii?Q?CSWOoxE5dbuh3McxZhMVSjM3vjDhC7UZrcN5PNG4TQ1GRu2tU1GCEP6O0orb?=
 =?us-ascii?Q?xXdhflJvJwgqq2iOdKuu3PljNxOl35txgE4aM1M68//nlvSuYmqyn2byGvhg?=
 =?us-ascii?Q?kVw48kwoI3lF7tXYqTvAnzBAuXDv+V3DggDR/F7acxNhZiEZIIEOmmo+DAxa?=
 =?us-ascii?Q?mnbi4XO+KbBeKsQsM12ZZmiY8Lud3DdC4dK7ep39H9ywitXN+q0z3VigR7rZ?=
 =?us-ascii?Q?ifa5JG6Mw+vE/zsWhhGBGpVFyatDABYukloIIYmBcCu8DdxLa+fSGllyiOPG?=
 =?us-ascii?Q?2B2LWCRVfM2wXrZLQdpn/Wm5hEDoZdOUyb1YvIRC2JAY1InvqvIyqdbMLqPW?=
 =?us-ascii?Q?QN6r4mciu0wsGum+n1WfjqsY8iPqtnwUICgLG3gK9LtGmZxzwdzy7B1tVRfs?=
 =?us-ascii?Q?1xqmKUklL7E6o7PxTAb+D7kQNpDWsB7YX/FCbOl0Hfyx8DKq/nPdUQc15IXP?=
 =?us-ascii?Q?v0tbofwfZK2j4kJW04PpiOYBYUVOkUN6nEBX7mq2KnhU4A7/zJPW/gJ0fOpS?=
 =?us-ascii?Q?Y7BJwvt61DqcTfCjOF98COewpGvVQg4AL+X85fHgmkQvQr//cBE1NaqI1+q1?=
 =?us-ascii?Q?/5ssu5eu7TdAo0Vr8xBnkLLcIPv85limMadXjm0K/PJdY4Fv0qpti184cCYf?=
 =?us-ascii?Q?2UO/YUHVDB/XVlrNz/H38GAC4VlrAQZphYvYRzOoYTrQy6KMgLSB4mE8WV4m?=
 =?us-ascii?Q?fAY/kE9MdwQoqHYq+Yd3rJHqGs/9s0657M/0Ak+DwqjtwJ06OA9bLUN+a5qw?=
 =?us-ascii?Q?OszbMyITh1brw5Oqltc6dATrhgNDRRFW5Nm5/Zp+P78Hey5GYj4PHC54lqiC?=
 =?us-ascii?Q?UlW1BYPXYKmS5x+8nhAWOCrAw6kKxQsqxFCq1KkN1clxYrStXrGWQC/5DGt1?=
 =?us-ascii?Q?uDtKKKPqZhuBLqkopAZyi185O6Fiikvqsqokv5A2fdmitY+MOYdEOXMXwaMr?=
 =?us-ascii?Q?utzUHVEbgfdSfPBeTVnNoxRtWzy6xEjJ5svO/AatqCEVFtGpKrAOncwkMzRw?=
 =?us-ascii?Q?6/jUyBwlSLPYmHqdVCygM/O4Xic7HJaNL8RxVWNrVMtzoia+9Ub5ZQPa0Ol2?=
 =?us-ascii?Q?9vHW+IaF+6Z075fSQRKon0X9I6hfC3ejfzuYosOfwAby44YtkWEXRpXd7z8M?=
 =?us-ascii?Q?w87ho2OrWtFMG6FDUlk5CcCY6J8=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cdf6386-c168-494e-6f87-08d9d718656c
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 04:43:23.2302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFRf6XLo/Ew8W/HEz6/wu9Pr9SXGJP6caA4XSFhUWpJzV+hcjsfDFbS8zS/s4hUrE63epkWPrylWQoO1sPV/HU1KashUelWizLxmmvLVJLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB6341
X-Proofpoint-GUID: fPMZSsOL0YD-POHVBF59Urr7rDlgACbv
X-Proofpoint-ORIG-GUID: fPMZSsOL0YD-POHVBF59Urr7rDlgACbv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_01,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxlogscore=429
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140030
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some fixes related to the DWC3 USB driver and Xilinx ZynqMP DWC3
wrapper driver to allow ZynqMP USB to work properly when the hardware
is configured in USB 2.0-only mode.

Changes since v3:
-fixed DT schema dt-doc-validate error

Changes since v2:
-additional kerneldoc fixes

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

 .../devicetree/bindings/usb/snps,dwc3.yaml    | 13 +++++++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |  4 +++
 drivers/usb/dwc3/core.c                       | 35 +++++++++++++++++++
 drivers/usb/dwc3/core.h                       |  5 +++
 drivers/usb/dwc3/dwc3-xilinx.c                | 17 +++++----
 5 files changed, 67 insertions(+), 7 deletions(-)

-- 
2.31.1

