Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F2148A044
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 20:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243573AbiAJThO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 14:37:14 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:15278 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241122AbiAJThN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 14:37:13 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI5rhq001632;
        Mon, 10 Jan 2022 14:37:08 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2053.outbound.protection.outlook.com [104.47.61.53])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgp68r76p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jan 2022 14:37:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfnyVoU1pNaRIQGoPovJgr2kGVlT7fq66X+lKYoSjPxseESP49ytp0EP6FrLn9u55ndwzFpUmImvyFZ5+N6A+CN6anb3URrl+MaXxxlh93cPlejlkq6S4chQI3OQUNGg/ySbURSDBQHTsAjfAqBdV0YxXdCGKiVV0noWDDxOocc2AlFLLkv+8uCKzEW3VVm5Dgwx13NvQULi8st7W6jrHgra+470dg8nzj4xq8A2+kXZMabqZnvhdX00rmIfixsnR2vmfd1iDquT2JipKPAoysSUK17rXr8C9DjDIpejQ5/JOSIAzgrIoOql+CYLFAAr8/UElWWDHM+cXxGahaHSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RBW+hPVvO8q9Ejiirck7NhkG6sa8pm4gQCWfU/eQu8=;
 b=mq1H0AkV1p+gkmDQHmuOcp4111+PrxZlDDPCFZHORyJ3I89h6DcXOtQib3w4lcUpHUM4Bb1UWGx01UtT+C5kBaeNZdSJwtXeCzjDqRMAO16uMMoKon8rvbmV/j3Xf7PTJZF0wk7vOuJxXcKqdf15AZr4bZUXTW4Kbqq10/3cIBQntEbamJ2HEtkChZOaa1w6/TMf9g40JeopRQ9o0tjk8rEJwQ18HX7g5ZvJxiY1SLpHZtjtpRZznrm7pRe0pv4zLaUpbsa0TwCDdU/iA6aoZH9A2HGCV9jTkCF0aw9FhumYDgClvS1b8bW/f/z4UWSiXQAYh3vVb5jXM25V4kOw1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RBW+hPVvO8q9Ejiirck7NhkG6sa8pm4gQCWfU/eQu8=;
 b=aIY9goEgvuhszRS7iIvHAHB9ffzyMrf21l9l7HP6Xb9biDtAm3CFzFHjVpRP8QLJpkBTMOhIdF7qioqED8zVR9zvhNbBpWzSfgUGtloph4glh4heALBdI8wckdrIzKMzZFq5c+s4Hz9AUG5TrGCIvSApY9xpehoXAi0ovWD2sTA=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YTOPR0101MB2236.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:22::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 19:37:06 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 19:37:06 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 4/5] usb: dwc3: add reference clock FLADJ configuration
Date:   Mon, 10 Jan 2022 13:36:40 -0600
Message-Id: <20220110193641.1368350-5-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220110193641.1368350-1-robert.hancock@calian.com>
References: <20220110193641.1368350-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR12CA0025.namprd12.prod.outlook.com
 (2603:10b6:301:2::11) To YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6d9e98d-97cb-430f-5b5a-08d9d47095d5
X-MS-TrafficTypeDiagnostic: YTOPR0101MB2236:EE_
X-Microsoft-Antispam-PRVS: <YTOPR0101MB22363258D783115124DB1488EC509@YTOPR0101MB2236.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nj+POA95cuH0D1OIRScsaoDkdMXCVnAojNvad4VkCQdl0SjHLMieIJxwF9fy1z0GZVhmhnXzquW+/tj6F2K605MwHZ39Cl7jN5Be36VB1WcXwtgx00pagdPhq+GzO/8DMZ4sb4yytsb5698OdB4I5EgOjxSkAYaMrzaQFAlBztvXcNfYisYHSAk28cy8EwlSG29jbAx4bHWsVFEDhEOOiYbCfVQnonDkMgztdPK6F63o5JGIwVaZYMGl9p3r/er6hLpX2t10hCn8ch/CFfbl8YpV78hT1mqfh6yva5qYlKgjVLN5JYBKcK38QKkWY59zx5C4AmNbg30BQy7CisySLmMF0x/2uVGxFvrF6RcNaoyLOrTUvvisjOFFY10G9ohtLb5GLZKkgUMqvTP228Ne6dhhhdoLq15aQzfbn94vPa6ylH2TPHb0de7XXgzfteygwWp06u6wJTpf1bLThGcxkKO5eqB6ftrV4LcCFZYFMI7gCrr9fW2TG8YlD7rbJTP5rk2zHbz2E3jSzyrRFnndurLtPcOCi5B/QzZuBBrdJF0Ww7G2C4gVRHoO1sOPs2r/3w1AgF+ppt/xcDmgfrCfmKLu4FNmJIbCnLlOLm8p2frjkdH8gF2PtfbEBgINc7ULO5AvQ+jn+71mvnxZQvSMoRw81z1VIZeSA/M695Q0l4msnKBBuRSJyIydUao2WJ5t40bch/eIz4kMPwRQ2i42sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6512007)(5660300002)(83380400001)(2616005)(44832011)(508600001)(8936002)(8676002)(6486002)(2906002)(38350700002)(38100700002)(36756003)(6916009)(316002)(66476007)(66556008)(26005)(66946007)(1076003)(4326008)(6506007)(52116002)(186003)(107886003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WaBbE2EmTXX2/LvoBD+zGpotplhdAz3WuG0AK/eJ3v8L6n0qGEjbLeJBZXdE?=
 =?us-ascii?Q?TldIMshsEIk99ZDVHw1EB2UyEDKSZvGuHIv4OPOkiOiTrcu70qG773qs6vq+?=
 =?us-ascii?Q?CQJ4aCLPA/CI0qar0E/l9ddrKzQI+13R7fkHvgq4Q0+nBvZbjE466sGxKt2g?=
 =?us-ascii?Q?zQpWRE42qpYjclR6nct2SWhZs1VE8If64a0yeSjP8fW2PyNuO8Hrg9gAmlw4?=
 =?us-ascii?Q?mg7/vWQrfWD6GU/YRhbxSLJtDcWAvjJIcVUqj0NVIghxAQeB9E4wvmxcPU1q?=
 =?us-ascii?Q?TRhdtjGYeadGMI8nRHcs5oFIvzJgHcc8Tho+hly4inzVAqP7XGF2q5q9OoTC?=
 =?us-ascii?Q?gSyAaWMZyh4yovzNsfTrjYt8PxbQr9IZAQ3x6NV8K9GFKu/Mlc2xweBoe2S4?=
 =?us-ascii?Q?ZhIyoPkpHQLiwinj3IIgOYyfRnPEj+vb8B7E2k2DgwlXtvQ+DreuE4wZmrw1?=
 =?us-ascii?Q?z6CMzdb/T3A+eVmRGUDffr9Tkj8YIrDuyF4rAbXYadIUCJ7omk42mazkzBOY?=
 =?us-ascii?Q?h1s5GPp2vIdjdnKcbzNyuienD8mMJsbygFrLiyAaMqToKRWrQyYb9GM7Uq32?=
 =?us-ascii?Q?X1Shf8cKmQUcazMVtcXRL3ZNpxHkJIDsR/jbq9ebMKy7dqj+PsHvBfCFsmwk?=
 =?us-ascii?Q?NWlIQQn7hC6VqEtXCMlWQ1lUsHAovwHrBDivWBDo6tq0K3K6fmibHW7Jz1PZ?=
 =?us-ascii?Q?05m1i8bn3bR4SFMl5CH2Voeg9FwHgkJinFsDCPViWv5YngDaixKals5kUs+L?=
 =?us-ascii?Q?mhlaPDTFMPkx48VfyxVhK6SOYQfntAkGqID1MjQ1ki3OrJ0iXbBHGiZUf6rZ?=
 =?us-ascii?Q?Aw4bOl4EFev9mNLmfZaZlsP8MnSIh5REqsT3knuBlkJPewfF/9Yff5v4Aqlk?=
 =?us-ascii?Q?bYBtjc/1FJvXFd9DUykOU1ian6DKAP7WRK6Op7bBDN3t7vQ/h+DuWot8Nz42?=
 =?us-ascii?Q?9hlFxH1aLHGFaDBWqz+/rx8dM6Yxwony0TiPUgV7AScO6oTGki+B9PXnb6CG?=
 =?us-ascii?Q?DFrFiMbfO8+f2BvlEVxXNG1QHPR4Ak2Zox52hjJ+KM3xhSgBL6PD09Mox/gL?=
 =?us-ascii?Q?P/bqaHWrwFNII9MHvJRgbnpFI7eCDiNHeOnB4+v9lQDAp+PRqTUDMzomQHNA?=
 =?us-ascii?Q?gTUm1haFMgvL3MS1JBgBxc0WS58kwOzGwXrEMR8NSm9uXj+bFekQYWuMc+Wm?=
 =?us-ascii?Q?hwRf0wXV6oL+o9SDPJqizdvbttXLeEqoMkpuUGF4PetcIO3OXlmDvgr3T3SY?=
 =?us-ascii?Q?k+VU0H3Tk8bHpltybQJPteFw+EjISGUB+knmrMIkx1t2sDLO559zNEV4DmMV?=
 =?us-ascii?Q?bjrBGrcjgQr76Lc32WGZpN/8ZvCY5+FA79MFDtfBdqp1q3SbfwJluCrGy6GP?=
 =?us-ascii?Q?6Hy8mVqprCo6FKySbxMiJuDS8TRcC4s98XIWwiPAbuKPod9gYeH9HTG/mXlV?=
 =?us-ascii?Q?6dJFv+YPtPX4FtTX2tZrkZBXhg5XERqhb9k+bzX+e1JUW6UrhRO+6J0gnO6T?=
 =?us-ascii?Q?vFCNOPW94cWbRecmB3KUUbRvG7IfC3DjVAYqDyNHSKQf2eFgLSneXQs8uRiJ?=
 =?us-ascii?Q?1VlF78ZSTS8B72/1YgV+mJzA3WqbqW8H2mvSonY1yX6y/VB4/g3VRazYH4uA?=
 =?us-ascii?Q?fWi4qH2QY/pUIPexz69Wci7R93DfO01HqUSxpKV5lha9FQ3v4Cya/5sTLSWw?=
 =?us-ascii?Q?T57tnw=3D=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d9e98d-97cb-430f-5b5a-08d9d47095d5
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 19:37:06.6411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VLDic5cyZeaZE25lUMxPw+PZKy+3JWM35DztlsY5y3g508yMs/N+rDskSWkKr4SQ9BTlZKvDt5+ssvnxBEqKjKVosw+0rGp2XAX/TTyX04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTOPR0101MB2236
X-Proofpoint-GUID: SJxkwoMnXuy0hi6oz6OI92rtsH6x89O2
X-Proofpoint-ORIG-GUID: SJxkwoMnXuy0hi6oz6OI92rtsH6x89O2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_08,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100133
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Previously a device tree property was added to allow overriding the
reference clock period parameter if the default value used was incorrect.
However, there is another register field, GFLADJ_REFCLK_FLADJ, which
reflects the fractional nanosecond portion of the reference clock
period. Add a snps,ref-clock-fladj property to allow configuring this
as well.

On the Xilinx ZynqMP platform, the reference clock appears to always
be 20 MHz, giving a clock period of 50 ns. However, the default value
of GFLADJ_REFCLK_FLADJ was 1008 rather than 0 as it should have been,
which prevented many USB devices from functioning properly. The
psu_init code run by the Xilinx first-stage boot loader sets this
value to 0, however when the controller is reset by the dwc3-xilinx
layer, the incorrect default value is restored. This configuration
property allows ensuring that the correct value is always used.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/usb/dwc3/core.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index f4c09951b517..ea11fd1e3b42 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -359,6 +359,37 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
 }
 
 
+/**
+ * dwc3_ref_clk_fladj - Reference clock period adjustment configuration
+ * GFLADJ_REFCLK_FLADJ should be set based on the fractional portion of the
+ * reference clock period, where the integer portion is set in GUCTL_REFCLKPER.
+ * Calculated as: ((125000/ref_clk_period_integer)-(125000/ref_clk_period)) * ref_clk_period
+ * where ref_clk_period_integer is the period specified in GUCTL_REFCLKPER and
+ * ref_clk_period is the period including fractional value.
+ * This value can be specified in the device tree if the default value is incorrect.
+ * Note that 0 is a valid value.
+ *
+ * @dwc3: Pointer to our controller context structure
+ */
+static void dwc3_ref_clk_fladj(struct dwc3 *dwc)
+{
+	u32 reg;
+	u32 reg_new;
+
+	if (DWC3_VER_IS_PRIOR(DWC3, 250A))
+		return;
+
+	if (!dwc->ref_clk_fladj_set)
+		return;
+
+	reg = dwc3_readl(dwc->regs, DWC3_GFLADJ);
+	reg_new = reg & ~DWC3_GFLADJ_REFCLK_FLADJ_MASK;
+	reg_new |= FIELD_PREP(DWC3_GFLADJ_REFCLK_FLADJ_MASK, dwc->ref_clk_fladj);
+	if (reg_new != reg)
+		dwc3_writel(dwc->regs, DWC3_GFLADJ, reg_new);
+}
+
+
 /**
  * dwc3_free_one_event_buffer - Frees one event buffer
  * @dwc: Pointer to our controller context structure
@@ -1033,6 +1064,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
 
 	/* Adjust Reference Clock Period */
 	dwc3_ref_clk_period(dwc);
+	dwc3_ref_clk_fladj(dwc);
 
 	dwc3_set_incr_burst_type(dwc);
 
@@ -1418,6 +1450,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				 &dwc->fladj);
 	device_property_read_u32(dev, "snps,ref-clock-period-ns",
 				 &dwc->ref_clk_per);
+	if (!device_property_read_u32(dev, "snps,ref-clock-fladj",
+				      &dwc->ref_clk_fladj))
+		dwc->ref_clk_fladj_set = true;
 
 	dwc->dis_metastability_quirk = device_property_read_bool(dev,
 				"snps,dis_metastability_quirk");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e1cc3f7398fb..650d4c2e7a67 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -388,6 +388,7 @@
 /* Global Frame Length Adjustment Register */
 #define DWC3_GFLADJ_30MHZ_SDBND_SEL		BIT(7)
 #define DWC3_GFLADJ_30MHZ_MASK			0x3f
+#define DWC3_GFLADJ_REFCLK_FLADJ_MASK		0x3fff00
 
 /* Global User Control Register*/
 #define DWC3_GUCTL_REFCLKPER_MASK		0xffc00000
@@ -1166,6 +1167,8 @@ struct dwc3 {
 
 	u32			fladj;
 	u32			ref_clk_per;
+	bool			ref_clk_fladj_set;
+	u32			ref_clk_fladj;
 	u32			irq_gadget;
 	u32			otg_irq;
 	u32			current_otg_role;
-- 
2.31.1

