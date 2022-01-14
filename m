Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E4748E361
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jan 2022 05:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbiANEnh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 23:43:37 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:47972 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231243AbiANEnf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 23:43:35 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20E4NEdb009827;
        Thu, 13 Jan 2022 23:43:30 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2051.outbound.protection.outlook.com [104.47.61.51])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dj2j2gvte-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jan 2022 23:43:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaEOI5/PXtNKPVG4fj/cZaume+yR/L6A0VPpBoDWQ8RAqkK2vcHus14JwAYARTtEaHt5uBgzg4aK3BVK1LhWFapXRUS16Yo41cEAgrGEsNF1flSOfto7g1yffT1SOllOXY3RRux+qnKBpXzr0dbnE5HUbuX7fmcztI1M3V33Zmz3hjiF92nWZGnyjHq/q+Mzxrdpl8oh3YR27j9xHimBzBO03rFpFhRYEjPXfPUkNTGw0lI7U6Pz7YvmQ0d4c2eRm9Ol1biA6k17/9l+PyFjWCXwMO8gwe1imroR2djNjOG1pg6aN2uRnm502ZdQX4acRd3Ia8KdMACfrIjbaeVIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2oSdv8ZwMs+Yx8qie9OGhqE7xAfK9vyzTGeqvD5adI=;
 b=LGMnU8bT4ZRzMEgUQqbHbbkXQOrl7nXWeH9fHWJBK980G17wIdl/DbZs+/6iiM2GVBiod8iTlUYkWmoErxlR4ccK27lkKS3u4kenlpwXyXp3/XQpfQBe9QWfv2OXh335xwVy73eUQ0ClQ7RdjG68SrBxYCeWfeQ3bDdfpzg6ujb99XY6SIlTe2ohRfy4a4XPH+EkRijuIsThg2jteqyKMJAFkRV0iShy6ppx4/q3c9QVzVRTmFQh0JdgsDD+gNLZ131w4LYGd1j3tsBy/NsAcfno3DFOXjDZzvgn4yX5aUouxjIvWhG1+VsqVK1VE47E/mJ49iJv/7GIgCjh6E7shQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2oSdv8ZwMs+Yx8qie9OGhqE7xAfK9vyzTGeqvD5adI=;
 b=gtx9SGOYWBkrt5zaGG4cGD13L+h0fOesfouVEnK3lf8xDUV+HMgYVxB0Ibl5BCjkOlvpKsQdrIrG8eg7EfmqT3IWiWyNB/Fj+lFZD2fWJo3+UisvP4La3lzBfLhLqwTFfp/LmmJioSGZISbBDLgXSTfvxBSjZKWop8TGQc9NzHk=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YQBPR0101MB6341.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:38::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 14 Jan
 2022 04:43:29 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d51:8098:30cc:5bb6]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d51:8098:30cc:5bb6%3]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 04:43:29 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v4 4/5] usb: dwc3: add reference clock FLADJ configuration
Date:   Thu, 13 Jan 2022 22:42:29 -0600
Message-Id: <20220114044230.2677283-5-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: 395af504-f966-46c0-304b-08d9d71868f2
X-MS-TrafficTypeDiagnostic: YQBPR0101MB6341:EE_
X-Microsoft-Antispam-PRVS: <YQBPR0101MB6341AADE5812070DC13C901EEC549@YQBPR0101MB6341.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N6ig3OdG8XmVSPCwWE7O+UvS75CUdJTO18lmvA/1u7wpozenKVkOHn/AvKJ5lor4/WoHWAOC5hY2uN6hqvCuxCB+kSAUXMQJ9oCAi6d98+wWzIvJNOfWGm0Ui1RTm9yTo55yQlgM9TJAgtv2qyONL8NUELK9677LZjXf8Bq8+llAfb/d9CS6CFNTQ8mb8lnI76n7qtC4GUN4vHBHpAyVfmkX3Qzkj1UTEl564xD7werz7x7DzFKzO02tMupOgdfZ3dJV0jdsgndLg1oantDQR989uRfeqzyQOc+1sTTYD43RDYOOW08ZjnMDWlSCUcpTg7v23QKnxaX4vVVzGQh11RHNCdl/xos+wuKcorcC1vITCOydZvmE+/7wZJ3ehvenRpYjCjXDyq2iu/HHxgB+Nh6Fs5YpWLch9GO28xAvEpiL69TItN3t5ZC/wVjcimkKoW/KVG4fuBSoV6ELt8lz010y6oYo/Q7JvwY60F2V5jPXdF0PRpqrBdxeL9ON2R8g+1JmxwOUiT2g5LP43AXaSpLSZBJwjaY2jScXE5GWFCMa+M9Tuodn6Wu+UtONcT1BjPPnre093COIFMECRYdmTdZ/FqFF8l9Kh/YIYN8vccR+gpwdf9+TvF0haEI3dytZr0z7p3eRe8ppl1ShMCsgCsuGVOlETW8fOlrVUnyLAW8jWrJYCl3k9VZKflE9ydAMqopdXYgtgkpoCnZOxMVweQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2906002)(6486002)(107886003)(8676002)(4326008)(2616005)(44832011)(5660300002)(1076003)(83380400001)(8936002)(86362001)(38350700002)(6916009)(36756003)(6506007)(6512007)(508600001)(66476007)(316002)(26005)(66556008)(52116002)(66946007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P6vxLkVZLlhdAZf1DgN7zirPL4JbGJa7a10sykiuOComUzZwDX8tjtoPGxiQ?=
 =?us-ascii?Q?4UmToXrobZw52qEhw/6Ob+8kdRdYpmCfHTKvoyzkoZP50dcX7pZkiF3cbiCW?=
 =?us-ascii?Q?5Grq2Kl5KwJASSAMOZoOs/1Xw8fU/b0ZjO21BHyPAdIqu2ox3SoF+l4L8keo?=
 =?us-ascii?Q?y8BEDFiisI9WQNKDmRTxia6V0A1YjOf7y82Ad/Nrx6H2z4O1oT3zPojLCgWb?=
 =?us-ascii?Q?6TU8y3A0mLlvyqZjKqbqxdYT0CfvHl1FZiskcrRaUMYVGx5L87B2x3B1oA7y?=
 =?us-ascii?Q?IzMMs3GwE7nS1Q3Dbnuh7ONVzS37x1PlAL8gAFt4Qf2IyFLPNU0qbxlW5sP1?=
 =?us-ascii?Q?UoqfPaBocoMElOKC3gUf18AnzWIKyTI9LLUa1YwXr+y7spLzweu6OcZXwLKr?=
 =?us-ascii?Q?HTV0aiaMfCTUdans1PSqbcluqMpsc2Kqym7uVCSzciItefx759d5jEXb6obL?=
 =?us-ascii?Q?1CI5Z2o3L/34xK2JmZzeZKHe+UBvDgJ2DgukJgq/3KtFvr2xdLToFWx4ya+q?=
 =?us-ascii?Q?/8ZBiSHch8px9Bj6lMmg0ykXf8vj6dvTQ0hxOqmlEznGvspc8e90wYpkCfba?=
 =?us-ascii?Q?EOt6136+mPgjLYelJB+At+/Shs9lAJ0kpHCT5ukbeQYxhc3CXPB7sgRCVhxv?=
 =?us-ascii?Q?UdVFwBS3NxWUPOsmByD/RF+zvSy17RF+FsHi0TN4y1Uiow/SnH+3i/eU8yHE?=
 =?us-ascii?Q?zrHCcdnTtyZOj+DPcLUal+saemhhWTE5qWK6iLUQ5zGhrWovk48+NiODbkgL?=
 =?us-ascii?Q?Mmi/HecWYzb4asDo0s9syY3jiWywz7oNsoKydVfGuhkA34aJqj0ovGfonApI?=
 =?us-ascii?Q?/Fk5TP1aPbGryUKOM+LAnBrlzvVCXwlclEiSM+/JiIinnl4W4vOThFYNaW4F?=
 =?us-ascii?Q?laO0RwOG2WLcLFR/RDBm76CJLKy53v9yI0EDtfPLCw74ELEK3oWlqZRSZhV4?=
 =?us-ascii?Q?cvBI/k0Lzmxr1K1rKtGjCCeKhiZNm69vl3iyQdAZPjpsOZbBAg3cXNMuQr+t?=
 =?us-ascii?Q?WYJNDU2UWKyJ945yzzwNpu+eQixZ+t83OqmOKDDzh7QyqqKTjg1hwDK7WjKe?=
 =?us-ascii?Q?zx2o0hq0pSX1VE8zztEU+UXtD4mk+ipi3ydhvv1zSaPJe2+vflT114eBcWoY?=
 =?us-ascii?Q?t9oA2F1/AwhlQBSRaPK6oxPx2ufWts3fSticGgZS1tm8rD/PJBsiNVy3upus?=
 =?us-ascii?Q?TqR11FfEItkDUqK78DE9Xtlcuba8G2rB9anKw57QauDrPUXSU41EeHw0Rtnp?=
 =?us-ascii?Q?WHQ954DlXxGHS6RRLO6ayMd9XpekRD+PrHO4SocJlxOWVbAwFX0YpoHt6RM9?=
 =?us-ascii?Q?cT67DcEXwBl7/dqjepoZtZCmRGO0hTLf0oFeVAsY82KZYOrG3XgHwCc4Oq11?=
 =?us-ascii?Q?vH1NE2+ahaJ7MnT9kWTubBE5ehxUg+dxcuMrkTJzziJKYfwKXfVvYVA61ysq?=
 =?us-ascii?Q?Q9Z/jGWCdrLhT3732MEEvVKG+g5TLptIqLA56gCfG8Qj61alhuImN9fREWkL?=
 =?us-ascii?Q?TGJ8k3vWB9Ih7Ur0BBkbXeEQBPB1lvR2n/KHtT9eM1BumH1a7ruFCOMkWcrM?=
 =?us-ascii?Q?RqJQURYS4FMgByFam0sAVlETNeMqcu9dDv6YhhSeZNHxZ67M0r0IX3X6H+6G?=
 =?us-ascii?Q?yrM5UzC+e8kBTa1Juxj0t1rGQ8XZKBbOn3JHP6e4uo5qACedEqQI8+cnDdbI?=
 =?us-ascii?Q?E8wjKRyGOytrcHI0m9Ssq4RAJn0=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395af504-f966-46c0-304b-08d9d71868f2
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 04:43:29.0462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buTR2T6oohaRlWnMos+tybV4KnKz02+oeWgXJqbdtBfF4MbaTbaEwmJmmOtPwmnnkuFur3MBIxLj/NkxofIl1C28MXkjKemjIly/CrrW+xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB6341
X-Proofpoint-GUID: KAuR9_0nM3_F5p5gLRNF1pV7qhcyY2cH
X-Proofpoint-ORIG-GUID: KAuR9_0nM3_F5p5gLRNF1pV7qhcyY2cH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_01,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140030
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

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/usb/dwc3/core.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  5 +++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index f4c09951b517..ad224fb8088e 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -359,6 +359,37 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
 }
 
 
+/**
+ * dwc3_ref_clk_fladj - Reference clock period adjustment configuration
+ * @dwc: Pointer to our controller context structure
+ *
+ * GFLADJ_REFCLK_FLADJ should be set based on the fractional portion of the
+ * reference clock period, where the integer portion is set in GUCTL_REFCLKPER.
+ * Calculated as: ((125000/ref_clk_period_integer)-(125000/ref_clk_period)) * ref_clk_period
+ * where ref_clk_period_integer is the period specified in GUCTL_REFCLKPER and
+ * ref_clk_period is the period including fractional value.
+ * This value can be specified in the device tree if the default value is incorrect.
+ * Note that 0 is a valid value.
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
index e1cc3f7398fb..5011296786de 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -388,6 +388,7 @@
 /* Global Frame Length Adjustment Register */
 #define DWC3_GFLADJ_30MHZ_SDBND_SEL		BIT(7)
 #define DWC3_GFLADJ_30MHZ_MASK			0x3f
+#define DWC3_GFLADJ_REFCLK_FLADJ_MASK		0x3fff00
 
 /* Global User Control Register*/
 #define DWC3_GUCTL_REFCLKPER_MASK		0xffc00000
@@ -985,6 +986,8 @@ struct dwc3_scratchpad_array {
  * @regs_size: address space size
  * @fladj: frame length adjustment
  * @ref_clk_per: reference clock period configuration
+ * @ref_clk_fladj_set: whether ref_clk_fladj value is set/valid
+ * @ref_clk_fladj: reference clock period fractional adjustment
  * @irq_gadget: peripheral controller's IRQ number
  * @otg_irq: IRQ number for OTG IRQs
  * @current_otg_role: current role of operation while using the OTG block
@@ -1166,6 +1169,8 @@ struct dwc3 {
 
 	u32			fladj;
 	u32			ref_clk_per;
+	bool			ref_clk_fladj_set;
+	u32			ref_clk_fladj;
 	u32			irq_gadget;
 	u32			otg_irq;
 	u32			current_otg_role;
-- 
2.31.1

