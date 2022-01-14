Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1224148E35B
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jan 2022 05:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbiANEnc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 23:43:32 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:11031 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229813AbiANEna (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 23:43:30 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20E4hQMg005072;
        Thu, 13 Jan 2022 23:43:26 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2051.outbound.protection.outlook.com [104.47.61.51])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dj2j2gvta-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jan 2022 23:43:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8kUOsLKTGttpMGxNehPNsbpOVpsPSPn2VjzyYp17T4anUJt+GC9GkZEPiT18nVp5FtiuywKAuNPXMGYgIgBUNIJ3cSSTnG/5HJQ6TfDWtRJmLkOYM2uBE+ql3N4Om1tjDVVooZWs3uJE74dZyHlstDaJxzk/N1WNDHzXZyo+o0/FoRO9v8OdFnP25C/oRLx4OB7XvnOdeBd7QNye1CkK2/mYknc8DnJ42Wv3M7mZBf1nKpb7VZKsNt05onR5xiX4HmAvuAjoXVRNofTBX9WHKrIUsXJrpH7yTg3N4CX7iZ2qyVgS6kPHK6aKvPya44/U8G6JAslKiCHqflZLUTaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+D3fgwE77//+LJ/u59LDGJ6v9aP+LrJdh8IqVspVkwI=;
 b=cSR1dxeOR6UO8C+LqrM/A91mphGHAFeGQWGxA5AeTQF6a2zG1q0RQ6TYvXfI9IcRnedqKYGd3EkfIro7mVzCYWAA3XnVc+zdvfckCY/3j/hDRxivB5Wt3andE5NYUc3WUAwENWmLEDDtsPnJuyAbiyPSlI6hKtL38Ojfy0EmkpKobuMgYzxh90oHtNAuT7eX8sJKZzv5AliH/wjwMMnTQpB1xuKwxRpaPjLVeCB0WEzpr66c8XaQjdsQHQm4A7Vn/dFyV4CdqYeUHGkDeXYZVkK/HUjj0ev8yJf0yrOy+xa498iMstQThT6+vj5SkmsSVay80B8AcD8uABTE8/c+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+D3fgwE77//+LJ/u59LDGJ6v9aP+LrJdh8IqVspVkwI=;
 b=r2k0DaKbz8Aeu9Y566u+uMc40xqChA8TS/b2mY57boGq1rRXfGz+cPMf3/KZF01GolcuBNNR58Y3oe4ztusjeDh+Vuwh7g4jxRsPUmBiG7CkiiXohpSqsjneTu1s3+a55lqCMsEVn8VKtqeVQYQddteJiI2IAGPjnCP7AcI02xs=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YQBPR0101MB6341.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:38::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 14 Jan
 2022 04:43:24 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d51:8098:30cc:5bb6]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d51:8098:30cc:5bb6%3]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 04:43:24 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v4 1/5] usb: dwc3: xilinx: Fix PIPE clock selection for USB2.0 mode
Date:   Thu, 13 Jan 2022 22:42:26 -0600
Message-Id: <20220114044230.2677283-2-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1534c7ae-095b-485e-74e2-08d9d7186651
X-MS-TrafficTypeDiagnostic: YQBPR0101MB6341:EE_
X-Microsoft-Antispam-PRVS: <YQBPR0101MB6341CBFE47B69D37EC448F49EC549@YQBPR0101MB6341.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uFy0x7eaJ0yGy0B7LAqU6Zh64QFhbYqMYtPtFn7+EE5VlnFpUxvx/U5HsUUMOmHq96kwJmnoP55hOEAXX7mQJ3LPcYPt0jZCYufrf0HztrGAMxa5geEAqN4nDFnpwPO2dQ5+1kvBmUyg75hMmgbXpqZZznPBcNHOaRaiQBDms4QZpOMdN8wvS0joJfhql8Eb6RVhekJQOcpr5HqRkfUFIVyoUNnR8GaaGWF6d6sCbrxcXbEs1E4ok1UXCVnIrxU0p+mnBGBMNsHIULynXtFU0k+8Cyo3s6xT5En/RMzQLyH4zrrCLHyNJpf9jyptKx2+4jWxLt6/AbUNOJ6ecJd3utzA78cIFOgHhnzEpG/CmbLDzNkTeBXEMUNhB+Ev43L044/G8etT6TS8Q0Q64++wHp8s8U2yv/DWHGUoWqBjkwMbgXWJcJIzo6yURHeiH2dY4S1MVL1IbN28NnxdWFkQEIQjuJXm5uvK9azSDxgCmP2T+y4pmHLdnpumVhkac/O++Bnt3FmN6ccmKJzVFBtsOdjy9gZyw2P+zN2jWnlfxmUYlJDIZIvYiGukTmtRKypf9w+bstgswdBR7xaspcCxli/+6oqIcEWPjBkaOtAI3WAh76khrmSEwNfaR1BwJlqEwvrzJ6velVbwadlvpQxGJfeiu3oMYXNuMXkCVObg0KeZ4Xfkk6j6emyelYmd3cl46/IXjDH7DoreJwcFUiB7IA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2906002)(6486002)(107886003)(8676002)(4326008)(2616005)(44832011)(5660300002)(1076003)(83380400001)(8936002)(86362001)(38350700002)(6916009)(36756003)(6506007)(6512007)(508600001)(66476007)(316002)(26005)(66556008)(52116002)(66946007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LxF6twY9UAKsahEk/h6f8rNikHxWK+TIlXOR98oEGlHQuf07fKTOR62DTJoG?=
 =?us-ascii?Q?Mid7QNAu4JiwkP8QbGQPk65LLDNzDn83Sgfh8e/Qz5sGr9DwlW6gUxhDNK7P?=
 =?us-ascii?Q?fsY0y+CCv1eHE6CSUOrFyJScPBzmE0dpM/uRz+aoIZoBGWV0IEcW+qna3qru?=
 =?us-ascii?Q?RETr9bkh88n+XtHKXF9cjBIn43QhxbSTdYDOlj9sSFjWXmqqbBGN9qOVdcMi?=
 =?us-ascii?Q?MlAOtsspVVBmI8ddy6rWlEOkwvm0ri62iTCiw69Di159p3Anm6EDNRyVRZaY?=
 =?us-ascii?Q?se5queuAXZ7/t/r5689l+168TCi7aXyBM6V1vJk6lriVycHoHBysMB6X7ez+?=
 =?us-ascii?Q?Fl5nTZUlIKhElaO8JxZ8GkbwajdmcHgQqFaBLVz3ZdvJAKpbRArzBu1GxVvc?=
 =?us-ascii?Q?P95LDxwcdTnyKpd94qCMyFEEZaiNZ6YIbCOvkWHaG+D9eWm780VAAG3aTjH1?=
 =?us-ascii?Q?7PdzLs1D5S3xYMc7TdUZFEfqVMeZMSCJQRCl0hmXyqRfUgoJHrCywxGfI6S9?=
 =?us-ascii?Q?GHLiowT1wf2XXFEkq5k+n11OBycpxie2MJOcTlSZzNfEcpWZrBOdbG3GtBz/?=
 =?us-ascii?Q?30SvJz+zMpVEEj4gRoxqkqAJQnBUIYtrJYoI2fNxTB9XBAf7DJ3PiB/ZcYtF?=
 =?us-ascii?Q?0NtKhgHjxIrpfw8Ae/TaOctdp4ohkOePH0HF0C3LuIoYEeYHClF82DikO7ho?=
 =?us-ascii?Q?dS0xCEypzJeGQ274pZF6j+4UhFzXAr0nm9I9wPHlfoP4Bn/o2IWHAh2V0kJ+?=
 =?us-ascii?Q?dCzU5JVMw2WTfksnZqOCVhCiyBk1t1kp5n2mD3T6tSLHmaG8TAp4Jjsjz2lH?=
 =?us-ascii?Q?eUsfufgPkj6jyJdrIdYXczenxsDMPasnerE1bNjt/FXU7IdiyGVbys0JeHMT?=
 =?us-ascii?Q?5oGtam1A/HHzZOVV6Vc5dYGLaZafSYiCNYlHIvYGEM5b2lQKEavxWDKaqAMP?=
 =?us-ascii?Q?oDR3EEcHXMMR+5SSPzSTxXueB3savBN08dcOmk17IH1q2agSC8VgU/tHHGDx?=
 =?us-ascii?Q?KAMZMekanBU3U9rURhi2dU2HQCKo24rIXPoMIaSRAAy2q9l5Qhcw2UcvSGEH?=
 =?us-ascii?Q?UKKJgwgEIgdUfaiL7zSl7+B3QzjKz1pMxwQTbGIoKxuzUr1tMpg59+GcusWS?=
 =?us-ascii?Q?krLr40i7BEHg4vRatBsXJ9lx7mosxapcTWkN5IV2QkFrPponhvbDFTsHsODR?=
 =?us-ascii?Q?ztFc0vXzc3kNwcKbrGQNIjpdc2GxGF3hq+GN+dnpLqpXchkNqP/4deIjxM6O?=
 =?us-ascii?Q?DaYsuLy1hWPtTGApY5DbCj1nc4PiTbnOXBQmCMvQ6OVR8F6NVPLWeWj4W9mx?=
 =?us-ascii?Q?ViwUdPRSSZ9FFjCVNbsjlhCNyv7gkm7Rnqgy4bnE9EqC9Nz7doYFm6tVmYhe?=
 =?us-ascii?Q?BYo+v36AN0T4mESzIsM/nqUNt8UCSk/9AZhhiOcj7ZSgCv0MIa4YGGeyVqBz?=
 =?us-ascii?Q?ihFxV90uGLbyyufntBXp8qGEptq3S3qt89wBizI4tszrwnG9zDxMI9n8zyK8?=
 =?us-ascii?Q?D6YYldiObh2tTd9YVmz0qtFQAMNl+rB4AS79T1/pfBr0JuTV+ijIHqcvvRkE?=
 =?us-ascii?Q?+PzFYTw/vGhZLDK0ghO0AQNVyG5X59URy3rJ1AQtW3UOc7KEar7WfHyP7saC?=
 =?us-ascii?Q?fA13oE2TUKUnhBfEIlpX+sQiCrueapRj/aRkM8CRqSlOSI0cyyM4pbyHEHL2?=
 =?us-ascii?Q?vzHW5MktajF7i7cglZw0qdvZ1So=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1534c7ae-095b-485e-74e2-08d9d7186651
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 04:43:24.7144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNyBAkxQruoQHGrbsE9fiQzlma0cG9Z1TudjyvX+3zSxGNxkNYoI/gu5VevfX5QSsX0YM5cH2T/NzJJZ+ZQK2aLzBpRd72ZtZACsjNIrfuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB6341
X-Proofpoint-GUID: Usf_hIoyBjwojmEJkT8-Zpf5h5uqgP9h
X-Proofpoint-ORIG-GUID: Usf_hIoyBjwojmEJkT8-Zpf5h5uqgP9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_01,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxlogscore=878
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140030
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

