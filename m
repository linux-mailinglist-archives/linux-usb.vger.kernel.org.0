Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9A0548A0D8
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 21:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245667AbiAJUT7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 15:19:59 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:5688 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241448AbiAJUT7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 15:19:59 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI5sIM001635;
        Mon, 10 Jan 2022 15:19:54 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2051.outbound.protection.outlook.com [104.47.60.51])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgp68r80v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jan 2022 15:19:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AICnmlErJ+TQF0W5CB2k6HuCqZ5PrJqatlhVFwlU5+vnbUp3mYdr19EQisAEA0zkVaKjH5DLTHZh4NgHw7lX+A5cZM+RLTABJzPYpIFVY3aVMe2+1R3015tUWqBRq+YPX4ry/z0eTLLrwzH8OEyIEjFwZVuwOsxmYS8qqHE4x0Ren8iwLLiC856RQwdv7qQGbQlpiEK4uYUttXk9u0ZE8q3+ZCo11mRcAVJnHLJd34nX/AcijPBkVp2muS/UzMgxticfm2N8iTfzDk5WWyS7dXZju9/lqEQqHs2aZEzlsXX1rm3AbvApMm0uWwvlXJxFtksNhM1JcGCCvgidPK9A0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+D3fgwE77//+LJ/u59LDGJ6v9aP+LrJdh8IqVspVkwI=;
 b=ZDDJ3pHsL/eyzygebmgi6dWrvTgFtNdTqJg+UEOVrn5CyeRAJQ/cSCtQ8viNUQUBjcsWBNnSMTp0KU/6ht31qzRhXKVXohW/glwW6SbNouf73hQgl4AkZPlWTVRnURrv2czpN1jnoWPqJIGVyKyBJxMQ/xzZD8aRpraeij/Pn0PN4ZWV8J3VJyEy8PXACzV1ZnD30+F82315U1u7TV6r8u8vece5LC2U2ONoLHRQ9Og6QJgGKBUoJlHYARo8oPYWaB3mp5dMsEbGItxIBIJITstgBisL9oRvIN4+l1nkM8Bc30Dd/5IVx/v7Bk9gsy8w9gW4y2SzzJh7s0DWIUR4Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+D3fgwE77//+LJ/u59LDGJ6v9aP+LrJdh8IqVspVkwI=;
 b=OTQ9WKOYClkzfXnyB2sPKKJ+p83bVP6NhcqU7njBQf4JTKIl2ZpccDb7E57JWP9vO7STW0VG4THhrL2H4D9Bs9c8tWClIcYuKZe5lO6TFhRf9Mdgwu6pjy9YLc2OO3NUIaiYawRf6mWqA/PZUe7m6XIh7INzYcfgcXrdG+wwi50=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YT3PR01MB6339.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:5c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 20:19:52 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 20:19:52 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 1/5] usb: dwc3: xilinx: Fix PIPE clock selection for USB2.0 mode
Date:   Mon, 10 Jan 2022 14:19:32 -0600
Message-Id: <20220110201936.1371891-2-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: ea1bee66-d9fe-4145-6d9b-08d9d4768f04
X-MS-TrafficTypeDiagnostic: YT3PR01MB6339:EE_
X-Microsoft-Antispam-PRVS: <YT3PR01MB63396700C7E6C45724FC2B8BEC509@YT3PR01MB6339.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zAiSJlRJvTN/odM0IO7w4kguhgThPTJRXhpHvlmHF6oghWL7bONztL1vZyWW0/0TlGHeaA5BJ1Fyf6VmRKeIqwNDFN+1xPEi3q9nGNPa0jTSN0BPrbhZaZdpxM19/JR/HtBIBf0Bmu7ggAsbcgGjcYXpBDHa2XUB6qvQzIqFtyeNinaISiMc1YRQqpPmGwLSxc9OxrD5G/pjbrGAX16BQsPbgrZrPENLAFWhD6E32e8Ad9szzOCabpP3mxJ2BzsG2v1FzZCe0tBSa9jKmDq8Dml+/fIB6vRmypZk+D8ePSwixYdQZg+q8gW7yGOkKoGvNT11vZmcHF1JcvZDEsw5Qnx2Bt4OVww2sR/nqHpjBxXsI/Fu9W68LESipt4X31SEbqdm4uqdxDyyq1R4yuxEy2nnebneY9ZkFzw8EUFRFeUEv0vhAynU1KDrEfncvhGnNd5BXYZ+4/tKKarYKzGBQhNDyEoQV8EbvPqun4NSOpe/sQgbTUtYZdpyGTRdUWIfquFUKhcnezTdENUGJhqigesSHtSLTeA6pmRIbfPbclwz+1n8ACmwzxqCojf9zmN1uEyColl/WOrdrDIDxyaQDAkuFECC7KUZElTNOglrw4erPZBDmSS690LBjlECAZYsXIuocSnmLS4tGC9SJEliAbyQ1ab4QePQ8us7c2ldfT45oONOQ5s+FbRY0n3AM0dodnbW+kCyBbl2Ytf2tDqWVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(66476007)(83380400001)(86362001)(52116002)(2906002)(316002)(2616005)(107886003)(38350700002)(6666004)(8676002)(186003)(5660300002)(44832011)(38100700002)(6916009)(508600001)(36756003)(6506007)(66556008)(66946007)(6486002)(8936002)(6512007)(4326008)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1/14AQxPT+qwmZWdDlg3hSQhoYxPs7bW6ZLuQP+zhuCqzLSsb3YwvINaS27h?=
 =?us-ascii?Q?avmdKj53sM8RHS+OSyxH958ReazqQ4o6tUisIRUyAqvSW88DnleOnDSTMaVO?=
 =?us-ascii?Q?7JGFijI0DGhmVQsY4tYMsfYsl3H+xMI+FG6P05FN+hZE6VQTDxDEdAbVlQAP?=
 =?us-ascii?Q?oS52AePIZFkQy8QUvBX+ndX+4+9E7HGn22CA9AkzQ2sF51zJyXkXgWdOfIt0?=
 =?us-ascii?Q?gB0pQawcGkps3hq/m7iu78A9uPQzQ+DuzfzmpntLkKpu+QlNBT6yP+SJwHhR?=
 =?us-ascii?Q?Yv3xIdVwngwdIOb85xKyRy4EqrWYzr2mzMDhnQQiWCYELpRcQZ/22/nM0u3M?=
 =?us-ascii?Q?T4ziXBQBrPTZE+TJOG/cpL8Xts+qWHKNoFmxPCiDbnLYxFpfQhp8WrVcea16?=
 =?us-ascii?Q?FvlU4tzXukRkZpwuud6w7sN69eQS2SaiQp86wNWRlZr9bQyEXnzN9TUmwYCh?=
 =?us-ascii?Q?1UQYCa6KWt55tiqhWOB8a0P/FKkAap8oidckkyysbwqzB7c6tO4mFR7jgksx?=
 =?us-ascii?Q?KHbm9RPWuYkTi7yjXVlUsAZs/PALcbbO29qNaWYrqdjHEaOyLUfkUnupLdst?=
 =?us-ascii?Q?gow95lgHoUX8MPUKOZIXWtj90yqugI1p+HMuxuKuMbU3WwP9PDOSO9v7Oryo?=
 =?us-ascii?Q?Ns1EZ5QZcaOFSY49AD4TP73Eb+18dZvrlMKCZFdz2Dtu9lZid4KrIx756XgU?=
 =?us-ascii?Q?FVRoQ67a+SI8veRJ8lQKLylNqQRlP8oeCcC8+R3yuK9PLyGhs0owv8lEWovr?=
 =?us-ascii?Q?fzTX3JV/FtToWwmHdy+CbRTTvX4/GsmeJXEAOYWYihL28Fvf+bJXEve0QzEv?=
 =?us-ascii?Q?8fqYo6cvR39Fz+Dw7925ZhUgehM4xPRLEF8Jto3JDX8f/GD2hSd1/htllRGJ?=
 =?us-ascii?Q?dbMFQOczgqQ/4wiESA5vSALiYHjaC2MNCfXGZb0l0pYg3ABksFOlAgCmoNvb?=
 =?us-ascii?Q?H07QVzM9F9ZFkh/ibzraiRNy+A7QMZpECZZHK6lfrfAnt3Nh3+napZcCbvij?=
 =?us-ascii?Q?MI/Gj34JWon4sC/2YSTg9hBQv0pHIDhN6TXFMYD1KfpsEMV02dvSTtrfedmr?=
 =?us-ascii?Q?JjOiTJ6G+dk/Ldig6zJ03/yBY9yoat49u/HpbpA4YmFAWVcZymTHfwvm8jo0?=
 =?us-ascii?Q?3fhS8CKGfbV/HVbAgIoV2v6sW3ImmJ9NP/rO/XPQ78f3+QfQfAlvCVmjrWtu?=
 =?us-ascii?Q?zd/VDkq5R1fIQWqQScCmI/XBlyFnd7WQWl7aIG2hmJ/fK4bHe9cQEkbsm1+u?=
 =?us-ascii?Q?hEZsklhyBLMqA7bkSfZFhMo+fwMPTU/ZELo/VwaofK6iDCKvh/HsLvwxCu3k?=
 =?us-ascii?Q?ge6jBhF1/Is2mfv0sRHqPYYZn8ZxSnzSS/R4frf0q9mWzRXTqyuwuovU8XCz?=
 =?us-ascii?Q?wmA5ZKBAymulZlOfpTIm9ayXngnAph4OdGH4HQ0auT/xW4C4E7qzsntzj4q6?=
 =?us-ascii?Q?lmgGc6ROVqKIj2spCx3E96hyENuFDmDY+3Lhhkmj0YNn/Fuydmhwahgplgra?=
 =?us-ascii?Q?RoNyBU3/0PCC8D+H8GK3HkEUQ3Z2A1HEp8dnmqtBDlN5iCZ63pHFkTWggiCH?=
 =?us-ascii?Q?E4D8jJRpnwRa5QIvhE5Wu6B79zcwEFddTXLY/xhKpRJbVCmSvUjhYVHSeVjc?=
 =?us-ascii?Q?LYUNS8VTXaqDmo8t0j70P35Mek7A2OLJ57RYf3ubQPc10utwLy4VP9ZK76NP?=
 =?us-ascii?Q?lcQfiAtCLy/CupeIPfGkx/KBs3w=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1bee66-d9fe-4145-6d9b-08d9d4768f04
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 20:19:52.2953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrk+TSPOwu3+f0Fq7TgL2yCjd5DGxQTuUlhuLrRlvSDq5APTEhGapR8y2DgOmDVqRxJAG/mXVnPb6AU/Ihx6FYzsuvqoDzhWafilc50MfuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6339
X-Proofpoint-GUID: tdGkBpLUpnwBPpoucwsWnRixBc8CQyi6
X-Proofpoint-ORIG-GUID: tdGkBpLUpnwBPpoucwsWnRixBc8CQyi6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_09,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=876 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100138
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It appears that the PIPE clock should not be selected when only USB 2.0
is being used in the design and no USB 3.0 reference clock is used. Fix
to set the correct value depending on whether a USB3 PHY is present.

Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 9cc3ad701a29..3bc035376394 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -167,8 +167,11 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	/* Set PIPE Power Present signal in FPD Power Present Register*/
 	writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
 
-	/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
-	writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
+	/* Set the PIPE Clock Select bit in FPD PIPE Clock register if a USB3
+	 * PHY is in use, deselect otherwise
+	 */
+	writel(usb3_phy ? PIPE_CLK_SELECT : PIPE_CLK_DESELECT,
+	       priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
 
 	ret = reset_control_deassert(crst);
 	if (ret < 0) {
-- 
2.31.1

