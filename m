Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3205486EE2
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 01:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344211AbiAGAcx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jan 2022 19:32:53 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:65349 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343798AbiAGAcv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jan 2022 19:32:51 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 206HU9vm023113;
        Thu, 6 Jan 2022 19:14:05 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2054.outbound.protection.outlook.com [104.47.61.54])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vqg6jm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 Jan 2022 19:14:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaamzldCc07QPTC1Zc384jy+QkMGQpmtxy5V981l5w/SP8bCnP4h5x04WxeUU1m+n6jsBBHvNiZikVm8f2fdBfc2ddHJz9zKt2L6ivdxy2eVQIYIhr0Y9oRM8yPWCXX9Z8chWtaq/ueMTdjvKXGlOT6ulDqFDr4Dc75F1VxRUm4Fwn4Kiq6Q/LH1DwgIKDxr4ebTNtgHAWDhVjjxTyDktAHDZa6Vdr+BYgaWXx0euvBw+vY3Sar3syVB91860jWBk22oCn3f69AzhLmIzgHdI72dIasB68zFVuDuBoHr669zFwoXU8P5lQ01l9TgkrBzs9fm1LldsZf6oxA+Omd5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+D3fgwE77//+LJ/u59LDGJ6v9aP+LrJdh8IqVspVkwI=;
 b=fBW+byj6fdqSfGwLVrcG13Ym3jTKe2oKqu5F5KgIL3eDz1wFIcWOFby9lJhaAW8PLbSU5pEjlycTaRju6oEXbW31iYe+ilkyPd/2pjyz4IDtYYcKWTDvGzt2vAFDrZ6+vRRaBZIK0duyijnf8WcCzVxcArESL2fPvUrpLkTWO4uVgGfkwmc4JQ1duZ/c61TcfFJ98s+XzRgYOrp26CaIlsgtbQxQeUp3oDpxORkJorPQNYOHF1+p5rNXW6bEn15ZnafXAS+BJn49A65H9A30g8nlKhhSxXIZm3RB+LfBjmHOCPalHQ8kW98o5QD4tTAJNmGuRLUK97UEyP5zlIWVSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+D3fgwE77//+LJ/u59LDGJ6v9aP+LrJdh8IqVspVkwI=;
 b=m2H2MkDuxJD2ymTCPMACVBGCAoSFlglBFOwJpXoDTyK/v+jFRAp+tUorcJgn05nexVcvTfPxi9ySnkNDZnm4mS13mq7GTYcm8/0kR4esugugn1igtLXlCw2x3qxVkKZ5CcJaWt3iIVU8iJN/aDEIk3zil4740nYMXc+87CcdPoM=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB5488.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:53::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 00:14:03 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 00:14:03 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     michal.simek@xilinx.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, mounika.grace.akula@xilinx.com,
        manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 1/4] usb: dwc3: xilinx: Fix PIPE clock selection for USB2.0 mode
Date:   Thu,  6 Jan 2022 18:13:31 -0600
Message-Id: <20220107001334.991614-2-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: b1d230ca-efdb-4453-c0f7-08d9d1729c73
X-MS-TrafficTypeDiagnostic: YT2PR01MB5488:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB5488DE0DA08BFEEB025C980BEC4D9@YT2PR01MB5488.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gl0Hz2zStaMJ4hiDa8e4Q12QurTd7LExeyBG0hqywsmqIec46ptXAH5ItZeIBD2n1DABDYaTIpwCnYb1Qtf+iV0YZTCjsbc9TScj4GwS04wP8Wk2THovnPVCsTS79VCbJG3CTJmuMGlXd+q7RVpYlTY+lGYPQT3N+J0F+SKWzasb7jBSDT/aIojvLQ5E91ZqZaMH0y4yDigdHJMt4rQj+LimqBuZwLlPRXyK84Q91mEgfDS4DFwHF64YkNqkZKfynl9D6bWb20FFE/f5td/8J/A90EtjkQrWFYWfdcnYTXKZzG/wnMA1lIuEPt6Gm3icMfHB2vaUgMgTcqN0EgfnTwJgDjU91QxtoF9pHkmQvX/qIV2ewqtvlFHETjp2FoHRRRo6+OhKbfoGif0HLpbojpxpwILiYGf2dg3J7CsDsw2ZUfdIdSYWWO9op8WFtWhvmRNK15TIXqPV2aDltUYnODO/6bnXJ2kPqpouk+bPJ10scsB3kwCZ5BbxbHm5RUn0nF/AIRRRr0ZOk8VK/lY5qJ9qt5v8zcR1gBc+npN0DTQI1NirImMFlFznBeiSgpKYU48ocKEA12J8pCvCPDSIHW8gE74ki5xYS7EN8iVjP8p9qmvGyC52NwirxsPO45SJxLuI4e3albrJQm4qqLiyPm/Jhj5+ayib5Kd8sAvrvyOnRNS0XNshw47Ba6+e/JzSYWrZ/OoPTBQkRY6ecijbBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(6916009)(38100700002)(508600001)(2616005)(26005)(316002)(6506007)(107886003)(44832011)(66556008)(66476007)(66946007)(6666004)(186003)(86362001)(6486002)(6512007)(4326008)(8936002)(8676002)(36756003)(1076003)(2906002)(52116002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KCYHpNVIEHJ1MOfe0qznwSk96R00HTOQumD/likvPGGgegUqjrlnbXvTg4D5?=
 =?us-ascii?Q?pPB2/dSM7289AB+DhUk+ObyrqzxTjj7pobktFYJJr8c5p2RlOft6qunRZPwe?=
 =?us-ascii?Q?X+DZeKifLogMOhAsNhqlrBXuV8v737iLFlaAZrT72haI8dPpLlLDNhI5s1Aa?=
 =?us-ascii?Q?eNCLVzAUzT6XJYGv9CcbzBx2S9bGeL6squz2Ze/Ei63CrIVJy6BTnI+NRYL/?=
 =?us-ascii?Q?H+htvQIyPa079tR0TMqvGCj0jLtFs20za6PONJklnriKHOphTogeGQWoXaXG?=
 =?us-ascii?Q?/6pFi8dLDSXzCZ8vvqpJR9khscRR2Y46XvfU67/J37BhT0s3pwjDXA3YkLFb?=
 =?us-ascii?Q?NM744D3uRyLj0so3dMWTvs8ct2T0y9VO6D1ya0gQ1Ks+vX2eglEYXv6sEwwn?=
 =?us-ascii?Q?4saQo5YNgwvgBl1MuPdXqycuR9vBkNa7zEi3UOSLgUGOioOC8PvhlmClu/g4?=
 =?us-ascii?Q?t3cQs8a/v7gpz2aNnSR7w6NBm88vtr1w1bNvEzIGVTi7TB646AlBzlsYS3YQ?=
 =?us-ascii?Q?DTQ6lNlz2kwyqa0up3kkFWEX08m4lbqWyb0mmwIKoIeJbR0VRUJ2+jVJtW0M?=
 =?us-ascii?Q?WxfWGbyHPgislM4qDIeUfAXHN/9iWusekqlUcoQU0q/jzJrnMSvWoK3TroCR?=
 =?us-ascii?Q?/kkZ+kcK+eXbvZ70+KcSH3BDBOYKKFv0UXOSnJC5WkaM/Ki0YdRFkOv1l7Dc?=
 =?us-ascii?Q?lQeygO/jqrrQlVW4kf0Wo085/bqdmW0Qhob2AJ5/sTU1PX00dcXXmDJZOOMA?=
 =?us-ascii?Q?ntADOVdhyqF9vT31icaILfbVVEXoYqNooBYjtccm142DofaLQBXBED8hhhup?=
 =?us-ascii?Q?dCOLSPc5VvaLrDmnQfBsLFzNVQ/GH9ev/2DAVIMJaMHxaqrd2CqJvK6QleXn?=
 =?us-ascii?Q?I0TYo4empwi1N0nZMDx41vcZhwLyWY1kjw4X3U31N0/F4jn2O01ggX6ZvMZa?=
 =?us-ascii?Q?UarrLSVk6nrx4cUEE+sjsFP84hdIT1nEmENF2CddD8tURmaiN32SthWxv/wt?=
 =?us-ascii?Q?M+ysr7d2n/r4cQmEMjeldDb6lewTHgrYUyuRQADzdXBV6AVYrURZNbaYh1hS?=
 =?us-ascii?Q?cX2p6T7LsTu2o2cmjnEqpy5lhKscA5/4oILAiRrKNnq2d/CNJpitTwc9+zvn?=
 =?us-ascii?Q?VjgmY5qAMXJB8Ia+krb1Ep+lZYAW2++sfMALaG+1NgARdnip51/wMUo//Yh0?=
 =?us-ascii?Q?X1hF1DeexV/O22wb/HecI/pVOwXx9/iDayjxYVy4+Ge1u4HKlQ3uDKBo+ncB?=
 =?us-ascii?Q?ODEFDveMBDYHDnHDweSBKiTgcGvqQp2WxR7BhJVVCpDoLQEvWpgXEd7nW3dm?=
 =?us-ascii?Q?DJBj3AoFVzUhjiveRcP8UnPI2peGNIotPP5J5QfBqtA9WjN4mn0Ar4qhRu1H?=
 =?us-ascii?Q?1lMF1UPS83CbAXR+pz9vOaibPDSZV82FQXYEMewJYYsPhmm4Z3Wfv55gX/gS?=
 =?us-ascii?Q?Zi87v4Z3ZPwhk7DvTBesWnJyVsoxA9ckXCojRQKurFzXXZ7LxY32GCl0ktKa?=
 =?us-ascii?Q?JMxm6kcMuWqePNWlgz6rJw9JsFhcLTaRWM1uZ/P2JAN4ppn78g5CD/CKY085?=
 =?us-ascii?Q?Rli3DskX5IqBml7UV68SAjst/GqYPELhRehAo4C/qTQI1yM0JsmD/XP2MHY1?=
 =?us-ascii?Q?UYG2INpwsV1bFwNrjZd5f+R0fEpBK4Ifp9UP/oWk3h7YfhoQcQXlSOQB8bCv?=
 =?us-ascii?Q?/F//SA=3D=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d230ca-efdb-4453-c0f7-08d9d1729c73
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 00:14:03.2818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8PS4oyEf0LNdk9M6a9sXmpqCP3/7MvYIXoZ8kUD1VpG4kUj8SJETYCsAZGFw6TiMhn+H1odKE+L8bw6uSCy5wAjEWipXvWhVzvLbvINddQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB5488
X-Proofpoint-GUID: SaSNDWAxP540IjjOYxOUtK312jwgesKW
X-Proofpoint-ORIG-GUID: SaSNDWAxP540IjjOYxOUtK312jwgesKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_10,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=880 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070000
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

