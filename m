Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5334964E7
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 19:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382059AbiAUSTG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 13:19:06 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:5427 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1381913AbiAUSTF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jan 2022 13:19:05 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20LCs50L028142;
        Fri, 21 Jan 2022 13:18:58 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2059.outbound.protection.outlook.com [104.47.60.59])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dqjeurge2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jan 2022 13:18:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuwYQ1kGTiY6L3BylKlLHFdX/SZYwVgL5XnbKEUZ6P0myYNBgZr09GcjCSymYFuzEMTKqOAYTW9FSkIyBZAqBpgCgoeB8TRhdSPZC14Iyuw4A+AQK+AyTBkmll2khmyTd7zz+MeV3xvwpJcu2FKnJ3bNwqFnnvT9AKWKeAzk5HnlXkWRfvAPw9B6bpuAWQMz4/fD06gbU21Ls9f9k0KF28jjh3a+Ow+10Fgr2OCigfoaTJu9rW0tW+ji6jLTlgU65foPdNRvk0mVmD9B/zZU3fPd+bfN8XCuotNcq/LApjrLrBqLoZv2AZGIERhM28QYzaTz1FYToF9r/LttDU3Xzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dca7IpRU3J8GP90d1jN+eA2VdJG4dJ1eOJRWMbSqln4=;
 b=nS/x3XRtBlMAVYQSbh7WVwcxsynVVINt7dtaxUB4VNR+ekhwjni1yvVxqB2czpa325JLajTes6GAwIVJ7Er7WDvV+PllCIqkRvbxEjP6XrCnB+r9yycqVaQ/+9/dPgjSVBTbQm0iXCt22QaP+M6dgBFrO8ffUNgBA1EScEVrnumeYJIdNygWWTJ2rJ+OsZF1iVtf8nUikcPGpLD3/TtQW7/FPd0EdyB50vI7ks2Is3gORc4E3heLkc/XMT6+evdLwKc4iyLmIugxnB7FyoTSPGakdX6M5ZyUx+5dxl12AnpzhgLglepEuMLVlzHANlAXMtZaiqRKU5VgmOqzlVeIJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dca7IpRU3J8GP90d1jN+eA2VdJG4dJ1eOJRWMbSqln4=;
 b=I/RpqehWcA/Swa4+OBr1wd8yvRvib/bmjhnV9Ntqvfn0fGpSJtjXBKyu5RL/vi4YCE+w/jX8iukkpxOYlbIZFpJO1nbBx+Xkkab75lGzrkxjH7+La4GRbqH3Ew1OTXnmAU1tT/w59bfrK1clbFOby5iBMFhdhAWT0mk5zNwojTk=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB6612.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 18:18:56 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Fri, 21 Jan 2022
 18:18:56 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v6 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for USB2.0 mode
Date:   Fri, 21 Jan 2022 12:18:40 -0600
Message-Id: <20220121181841.2331225-2-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121181841.2331225-1-robert.hancock@calian.com>
References: <20220121181841.2331225-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0067.namprd04.prod.outlook.com
 (2603:10b6:303:6b::12) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb8efa3b-39d0-49a4-9cc0-08d9dd0a7cc6
X-MS-TrafficTypeDiagnostic: YT2PR01MB6612:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB66122B5DCAA9E0FC11B6F21FEC5B9@YT2PR01MB6612.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6WQPhS9p5YlHu0vmc4lQvBcnVbCvzL6n4Nwt8XVdtG8TbpgGWRp/4KJvpScwj2mtMlt1723IPy3eg0O8zpnFLjGw+WJdpPB0oLF9jb38MbUSKe5nUvkpGMPxnZyyLDuoeY+m5PScCzTmibI1LoYYEdLJ41TUHsa6lyv4kW6saksv1/NAB1TrRfJUgQJBKo/RPCWr4iRocEOLB0DlpPizEr4re5LBQ9RYomW7qNLfK4ZBvuAuZ5dmtTvY1yg8w72Iyfr3TzaUZMBs8LvdKsaoo9nZxnd8rSFAiTSmvyJUQTAbZuZ7UckY9t6mbmYcIxaCs974/w3Rckllhm3WXeh7TRDpqHgCYwY0Udyzw7UemYn1CV1nvOlMmmp+P2xLBf2Li1gJQEIOmgZQtvR7NmAcnlexlmJLK1ih5+3VsB7gDtvxID6EZ66nwz6JCYNN6DNGrU66SMKq7VnexwQrwBX9oQk9iK6N3EorLdve4cWCyqrw3Co9fTwt4cKbyQwgIAsIEiqQ4LdcG3IuVLfXgUyAopsOYtA2T0BThVdRLKTr0r6zcEjEAMI4jizD6PtxhWXxoFn15VlXeU+fgw54nf9bfbbAiAR0Db4EWyYjU09lNxpDAZ899Jt3d1gTZYuWmPGFxrFROJQEezNAvLwdJozxCdsHi9A0SfXaCEXpb20pwZaMgGiODKFh5te5U2ET39uYQy2cTAFS8gusSoJ4/QXxfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(83380400001)(44832011)(8936002)(508600001)(36756003)(26005)(186003)(6916009)(6512007)(1076003)(316002)(107886003)(6666004)(38100700002)(38350700002)(4326008)(5660300002)(52116002)(2616005)(66476007)(66556008)(66946007)(8676002)(86362001)(6506007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JPHLZoi8IcU7Uo3GorZKr+N/QzEHllFNYAUZz71o/k8c9qHVYTIVmgJdW1KU?=
 =?us-ascii?Q?FdAWP7HlhMIvGdOV13Tk6L6C4lBR+cUZOzbpqZkCLJcoN8lHBQhPNJqCW3X3?=
 =?us-ascii?Q?xxnazDMweHJMrsuqEC/QEFfUKhMaEiyRFldpJsRsWtziG3Aq/psSIsaym20o?=
 =?us-ascii?Q?xnKthAA+tc/Jglklc2cP09aIckUxEmZkdMrsSXcrmNcczcmtjoa/PTc2HV/S?=
 =?us-ascii?Q?UJLWXGGFfjYvhDrO4a5DXet5Hp7D4vH9ejQr/FHZVyTTSmxEoeYzHxpj2gIj?=
 =?us-ascii?Q?w/0xeaLTAmV3Sf0V+zaUJLKk5XmDai6z0vvEasZ+necTwAMGZohTHE1yHwNE?=
 =?us-ascii?Q?V5E8amEG9+Je/TjZXDMMkIvVEdOspyqOJpIx1saCEa0Gcm3CwVqSFCqKNE2s?=
 =?us-ascii?Q?YF2X4sjau74+Neec0sl4jKaUDKmysqROIhyCBNrVSvZ/zfK555dHdp6LR/IY?=
 =?us-ascii?Q?KJIueeukwfgW3lzMvv6sjx2vm669mSyCpaa4mk55U20V2MGFnwbhSHDp77CI?=
 =?us-ascii?Q?gT/aNrMJif5Sz8FFQ2Gl5XnjAToK2vuuPdGFgb0+dUGZM2RyhwKvMMXEyJXe?=
 =?us-ascii?Q?QX7gm5paYmnvXTmkbDvhRBMlqu/keUJy9ojaczywdmPzqDprqK3UydLYkHfu?=
 =?us-ascii?Q?pG2jHBXoNvB6JOgA5fhSgqJG5cxn61YLJyIEhSgE4Qow9vBw4fVc/ocL0Fxq?=
 =?us-ascii?Q?lP8rnytHOrOvRD+RSumEmzzsyPH0xGG11mKD2OB2fRn12ixpA9Hllgjw0Ftl?=
 =?us-ascii?Q?f/rw67uTzCeC+XmMHkqf2Dd9QVry81VJ4hZ4FE5rHtrKarrw4YnUPxxe6wXG?=
 =?us-ascii?Q?C+0xQSVzTQ8dudE20NYln1eD/br/jjPaDdtrjjNXU+2dxItd5vDn24iL/Q24?=
 =?us-ascii?Q?N6ZMPxAYXzkOX7AVKFU2khhijVmVllnxweXe0OiWo729Yj6JnM4Zo6XDL9TM?=
 =?us-ascii?Q?wa9HvWw8ITG51mSTpDweplmnt7YpAzYEMOSRN6cy08ZHsTmLlSJ5q3aubet9?=
 =?us-ascii?Q?mXrAC+Q0xT9roIj70BSeCpV0Uf91DBJx1pdrQ7xdTKuFdwNVfIlfaXF98Thq?=
 =?us-ascii?Q?+qRjtkh0f5lkF3BQc40ehtruZJXTZvCZC032jyUD8+VMt9tLKf5kw6cYZIU8?=
 =?us-ascii?Q?cXi7tntbYJAm4Jj2zzFq6iVsks/ZZIQSNZZUdi4J18d3+VgGldHcjvkvele9?=
 =?us-ascii?Q?8w4DyjftzBMreflJkPex+HPexl0piVi8LKMSPPf8vKvK1FB9jS5tHEZ54qpo?=
 =?us-ascii?Q?biA8imtTCAdaMrLLK44XNmlfJmUh6FoHMR/JohXauowW6rJeeFc8VDJEJQ/M?=
 =?us-ascii?Q?RwNltdi0OxIDjlFPYNnZztfzC8hI/lOnPenqhjwlKkM0lNePeJQBDXDHJTRl?=
 =?us-ascii?Q?EWqo5TXzuHkFIT0hr20SjixrTMo+0FiGC33GCBlnyvQbXhYi/Wy0zkndkdVP?=
 =?us-ascii?Q?MNVb6GcoDIvjqSssQu9KOgwMXv1/w2qIMAu1T0+JSfEBtZzPcpdRizpDsM+p?=
 =?us-ascii?Q?Y1kN3AxvzwOuKhCWX7n5O5UAe+yIBYK/1w8K2SrN5GvnvHvSXM760kjMQckE?=
 =?us-ascii?Q?pGKeX+WcwltyhyBdAR8D85/NKoVNlxOI4Ia/V4BkzcmsnMcGTjLsFmyqGQJk?=
 =?us-ascii?Q?omLpiCg9PQXD23zL0BelrCn36Cv1pWjRTgbsY/qvqFy225rpP6Sg0kAHxNz1?=
 =?us-ascii?Q?7et1CbbEQ29DhQyvFuPF7pMVIeA=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8efa3b-39d0-49a4-9cc0-08d9dd0a7cc6
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 18:18:56.4625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDWw8Qs/JCVB2LzURxAo1TB4vuwWFdF4G1hrTZZKcmbOJ0oyS2DHTVTu08mPdcOcOi5Kn/jkDbq6pu8QLeNBe21wxZI/RPtZHIS6NYOgyy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB6612
X-Proofpoint-GUID: 7o3_vg9C7Rs9zw6xz_UyeyjsI9_LLAEM
X-Proofpoint-ORIG-GUID: 7o3_vg9C7Rs9zw6xz_UyeyjsI9_LLAEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=969 malwarescore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210120
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It appears that the PIPE clock should not be selected when only USB 2.0
is being used in the design and no USB 3.0 reference clock is used. Fix
to set the correct value depending on whether a USB3 PHY is present.

Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 9cc3ad701a29..dd6218d05159 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -167,8 +167,12 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	/* Set PIPE Power Present signal in FPD Power Present Register*/
 	writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
 
-	/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
-	writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
+	/*
+	 * Set the PIPE Clock Select bit in FPD PIPE Clock register if a USB3
+	 * PHY is in use, deselect otherwise
+	 */
+	writel(usb3_phy ? PIPE_CLK_SELECT : PIPE_CLK_DESELECT,
+	       priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
 
 	ret = reset_control_deassert(crst);
 	if (ret < 0) {
-- 
2.31.1

