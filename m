Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33CB4952DF
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jan 2022 18:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377216AbiATRIn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 12:08:43 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:55697 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233179AbiATRIn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jan 2022 12:08:43 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20KBU4QY019111;
        Thu, 20 Jan 2022 12:08:37 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2059.outbound.protection.outlook.com [104.47.60.59])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dpmt68p0h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Jan 2022 12:08:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Atp3ecgAn93dl5LxFIxtr80earvhbfBIHChji0IsfftkrjB7C8InSXnDeA9LXor4f4F8SL9ERBUW5BNx6vLt4TLDsNpc8/uvPAYSKlpgbsmfXwsSTMJD0F5TD7GbEGBK0ZTY1dfaFI/kw3U6JiDVq4EzCuZDS1deZda2nzbLPu83XVqvJSzj0F6HkCNSq/VaiQg+RZX2ulvyRuSai/X/DYLE6qRG1xMQjF2VYeTYReculRjcysdYaC+UIjtqDSMsxQby32wT1+Tz96zzSGXaRUrCBx3qqEm0+6/qch4y8FDW4yI4qkFfPolMulkobmfSy07hSSxQ4mS5DiPgygibiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6g/oYZePvzJtwV5ryiDCZRf2ZWZFMGUc9xkU9CHGL68=;
 b=O5CiPAetAibwh7no/Mev7+43BvrAkbNZ97pOO8MK8GiMEXC6ZRuIUtytH+amqYT9rV0aKgjtW65Mb/YR/aHQr+joL+f7uXzuQez3bopRrL6pjPaeHJpZwHMoF0nYJezzBkbTx31rE6OZZICvTs7WeVbBbO0LWL3DXJ0hGH2Apb9bEIQyfiMfcP+Bm1pnkW36PBjyeN9tbMUvNDozee4edAvWf25j998xdQ38Y8KMNjyWqM1vVo9AqEUGX6aaPgHwYzf05zn09dfgqwP/Kr7R3SZGAvte0nf5YFw11ziEXmWGb6gLDB/altPE+vxoLSD9F04rtUL2U1s01fJSNZwt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6g/oYZePvzJtwV5ryiDCZRf2ZWZFMGUc9xkU9CHGL68=;
 b=QYZcgZ77aQaDqe2rhegYtzzH7oXSF1fkEu7FawE2NGxPg2RK69PYKZ/rQK9gJBMNgsQYWEm6vdLZhIdHW3azD+I6dpcrr74Ipamy4InTWWTvR0NnGzJamT8/YWQpy1j28uzRGM1N5V1f+gZxNraSus2wuU0oU6qZoqZGRKXNMwk=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB4463.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:3e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 20 Jan
 2022 17:08:35 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 17:08:35 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v5 0/2] Xilinx ZynqMP USB fixes
Date:   Thu, 20 Jan 2022 11:08:16 -0600
Message-Id: <20220120170818.1311306-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:610:e6::16) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32678e74-d534-477b-3e90-08d9dc377e37
X-MS-TrafficTypeDiagnostic: YT2PR01MB4463:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB4463B6DF031CFCDD6D86D019EC5A9@YT2PR01MB4463.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ud3pPYZk+UjXijq7nvOjGZAncmDavvvP0efPafTNqUuDJpxW00ZBLzlvhPb9WHYNLpfSb2gRmPS1RHlHtV7LL3umpm4MuW9ySs+owBAVDL34p1h+NxhssQgDZosxppLCP01XVdbZwiiLsXDvaidTsiD8Vse98cTRQhdDKKv1+QwilXYnpZohgNuL8qchoWwYJlzrpAyyP9JQHkvBaOYAMnU4spVlPCvgBcjv3RI+iFSTR9FfxV5a0uHNQJWFPf0IsWPCxOJXVtnRI9oGNcJkDkL9HV3ebe6GTpYnonxpS4bT5CV0W3YfreRMgtAVXxEBbvg3x+erGoTuMnq8zhCawjoSWOSzSdAYV/ETMSxVexTOOhpWHEU3TPn2AEaZ5MIvLdrDFT7HwTDq6gWI4ymIJIxYDRsyZXgs9lHyDf+qbmO193qIiLF3+KicX33RxL4+59NFNmabWpW+o10Wb/G3AwLOu7HfWRU7+epUW34G1s7BSDtbIJozAJs5CV/NQ0ONFGXDJ1niuauOQ7yJSGtyhnMhuXvjjno/2Te+mFTLP4yXNwnfgVwQSFPNVouXj0BZAFVodd/tL8zcrLBeQUPJV4vqnNa4BszQhMQ7Op4xAfcKCg7tf3V4kOx7QZjwreU7BXW3F4T3cODAfB/3HbVT+swMMhFwzihhTH34ERJNqX8SBZ0diTLyg3A9/YN1S0M19vXjqY5rATxRKLrS1QHuvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66476007)(4326008)(66946007)(6512007)(107886003)(508600001)(6486002)(6666004)(52116002)(2906002)(186003)(44832011)(8936002)(83380400001)(6506007)(5660300002)(4744005)(86362001)(6916009)(2616005)(26005)(8676002)(36756003)(316002)(38100700002)(1076003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xj39dt5errNPlAF51WJ5ezyj7gdAXWJKWHgiPU5YMbwRkpq9+cm5tSKIpTFx?=
 =?us-ascii?Q?XYk4daFk1wBkTTFqa8/YFxBqWSAZIlNpCbzsB4mz7/qMUjWmmmdkp4F9f/vu?=
 =?us-ascii?Q?1u2LEeLBYgNXGZjDBPXPfYWFhKCwS53eBBGKsBqL8SZG2p3ntQWAEGQjkozD?=
 =?us-ascii?Q?67jMoInPszBzjS+XTuDndOcG6FX1v1Fsu+s6T0wkjfz74vQ87ZdH2pFQ7GfT?=
 =?us-ascii?Q?Lbq5zB/FaIzR+SguSrXG3ERLTs7IjF9rMnDWo7wvaw12TGudrzbwLmpLlzMT?=
 =?us-ascii?Q?buFyK7psAh4B4T04y9skMmkH9JlclfdeZaCtpyUwYNBrY4NfJUdHqmEhD5/s?=
 =?us-ascii?Q?3EXJ5MBFAB8VrSKL2nAOxRUpmOwaKF6HpM7yw8AUmBWW8RnbnGT2YZgxIQRd?=
 =?us-ascii?Q?gLHQx9z0gRAHdCERK96Jn5IagljEVVp9PZkDGw4TzVHXNrBT/ggCeq4s5V7d?=
 =?us-ascii?Q?oDVddrHZhyY8XOOGl5bAcJM+ODzfVh3kmKdn3LwCK7Bh1s/F7hBKHLvfuGNy?=
 =?us-ascii?Q?BbU3RcRelv7unB/kJbfKhigW+csYi3sxkT0o4AM82r0NFPLNDDqEiLj4fitB?=
 =?us-ascii?Q?KhsHQ9y0JGJUIl5P7fTeMp8/f2bpjDm0tEkfhztJdgb05lLxUh2CNusmeHtP?=
 =?us-ascii?Q?YrVpUjgwVoCBDqtmgAu/b5d6Htr95xifk4ckqbOUbTLUE5RSGQtFyHx1NVmO?=
 =?us-ascii?Q?5iZ0twYzemx/Q3TuFRUQPpU66OCx2iaUzSo5RCMjaxBpuomWbkWkf5boF4ta?=
 =?us-ascii?Q?3dZr2PiUEiuuDt1Qb2N874+6Mq/RStG7U5ewCNEMJftx+rcDQK7ngDEZBu1i?=
 =?us-ascii?Q?oUrZQCXfhLQWed+Q3iQ+zqttVwFD3oRlaeE7nrWPXJqyzUSdd9NfZDNwx9QJ?=
 =?us-ascii?Q?APUvfIK+jjOnAXcxJjgv8zB5oTdp/ca3xm0uOUADpPZlwkMC/mEip/rvWiub?=
 =?us-ascii?Q?bnZ4imMRCWHbkuYsNyN7VZn3d/6ozlzqNJso5HoLDJtOlGmn1BjCfXY2QdRw?=
 =?us-ascii?Q?m2Upn8KFwZW+DRpkw4LAZuNdXujAY1v/AzPLZ/MYeEoI7HqusBd/+m9bQnwq?=
 =?us-ascii?Q?Drf1GW3GWjmL1AQ5q1GeDA/ZDhpz79iUDltT1cQP570ambQYVxPFOrNdL9KL?=
 =?us-ascii?Q?xZGMzec0L4jHoi2Qbu9mrLPAdKb0YPPAKf3N6anNM/2AMGjpFXdYA6oYrgrn?=
 =?us-ascii?Q?9tHi5KizKayxLiMtyxKBSB9IH4VPwHNy5VwUa/A9FpxbS0QRNPMoqkwYLU9q?=
 =?us-ascii?Q?0xk+ErWBUZ9xAR6FDR5IEE7Egd5IliXcRBXGJ4AxmCEJQ36lYEypbCnxsnTu?=
 =?us-ascii?Q?bzcRT0TVSHpIaV6InW3PgRYktqjBzicBBR5K+q/lmfEtGp2YtGTEMoBLSTZy?=
 =?us-ascii?Q?2VOz6km81qNx5VABA8mFT6Pncpwew1gB/4HpQIfZggDUz8k/Rri6K4ZTpIaT?=
 =?us-ascii?Q?FurwA617o/tz5wEXJ3V/1TN/OLBKTWNFt67AWCbPuwiERp0FwnXPVTWQwWIE?=
 =?us-ascii?Q?g1CcxoDY9/7ZKslRvxanst3h0YNcDhCb1PSWbkJ4yKZ/B6qKXn/8hh3yCZhB?=
 =?us-ascii?Q?qjZUK/hGvBVQ2BL3WEVeJUdKxpbnkHBSWB7usZ9ftIeeQkT6UATPjdxPsY98?=
 =?us-ascii?Q?F0HNiOqDiE0rtnUAGSiAJ/sa3TZxoFQfVmDFc+CqJX84Bc7O0B1nPLa1Mlwp?=
 =?us-ascii?Q?TX18beny9L+Mzx8G8YHtj/nM/wg=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32678e74-d534-477b-3e90-08d9dc377e37
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 17:08:35.1177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQh2fsObF10E8bp0AeIQo7Molq816SYx+8xUt07LCTFGO7C4wI2QQrdEgPCI79hb24DBPtA5NQlNlT1tDfT6cvJeRUF3L+rU40BZoqSYxJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB4463
X-Proofpoint-GUID: tvA33U-7Au3PcgyPKIM-tQdD8T18V1xC
X-Proofpoint-ORIG-GUID: tvA33U-7Au3PcgyPKIM-tQdD8T18V1xC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_06,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=414 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201200088
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some fixes related to the Xilinx ZynqMP DWC3 wrapper driver to allow
ZynqMP USB to work properly when the hardware is configured in USB
2.0-only mode.

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

Robert Hancock (2):
  usb: dwc3: xilinx: Fix PIPE clock selection for USB2.0 mode
  usb: dwc3: xilinx: Fix error handling when getting USB3 PHY

 drivers/usb/dwc3/dwc3-xilinx.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

-- 
2.31.1

