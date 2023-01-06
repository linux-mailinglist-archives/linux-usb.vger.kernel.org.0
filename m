Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7F565FDD2
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jan 2023 10:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjAFJZz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Jan 2023 04:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234252AbjAFJZZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Jan 2023 04:25:25 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18AD71886
        for <linux-usb@vger.kernel.org>; Fri,  6 Jan 2023 01:21:49 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3064oHT4013726;
        Fri, 6 Jan 2023 09:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=FPuXjeIFnCzvTBxJsuH1I1+/yUGznSZCbP5SF5HSrwM=;
 b=DIu/deR+BOk2oKJDoihrNmf5a0cpiiatyxpSBBquVeNn6oZAkeZ1kP3BBRoO7Sdyzx8V
 pSi2VxoK21dQBKWNW9Ea/udY1fHK3NcZhpBn8L609RaA2LP4GPZ7w4D6Jzy3c7uXmLcR
 E8U6CVMHlP2fp/JS9a9juIWQFkWHeRWAC+lHovLtJ0jtmDYrT8sCTqYsgNtmC7+UqYTn
 n5UoSTEZVdmFj7hioFWCQz5kUY+e4N6uinwzKYn0r4JECGWOx1npkCG4TacQkYMtsgiS
 mRY6VuyhcoUcGDl1WxgKtz4Df2Jvuny+BQlbndheGvvBBfjnoahk9InwEX6jdhsc3Yq3 Jg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwu4vtsyq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Jan 2023 09:21:42 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3069LfRQ014892
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 6 Jan 2023 09:21:41 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 6 Jan 2023 01:21:39 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 1/3] usb: dwc3: simplify operation in dwc3_readl() and dwc3_writel()
Date:   Fri, 6 Jan 2023 17:21:33 +0800
Message-ID: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0CSRnjEtRZ4UXRCUlWgEV-Kt0xw8agAg
X-Proofpoint-ORIG-GUID: 0CSRnjEtRZ4UXRCUlWgEV-Kt0xw8agAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_05,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=624 phishscore=0 suspectscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060073
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

when dwc3_readl() read register and dwc3_writel() write register,
it will run operation 'base + offset - DWC3_GLOBALS_REGS_START' to
calculate register address, seem the minus operation can avoid.

the original register definition is offset from XHCI base 0x0,
now change it to offset from DWC3_GLOBALS_REGS_START(0xc100).

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/dwc3/core.h    | 150 ++++++++++++++++++++++-----------------------
 drivers/usb/dwc3/debugfs.c |   2 +-
 drivers/usb/dwc3/io.h      |  12 ++--
 3 files changed, 82 insertions(+), 82 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 8f9959b..3af244e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -85,90 +85,90 @@
 #define DWC3_OTG_REGS_END		0xccff
 
 /* Global Registers */
-#define DWC3_GSBUSCFG0		0xc100
-#define DWC3_GSBUSCFG1		0xc104
-#define DWC3_GTXTHRCFG		0xc108
-#define DWC3_GRXTHRCFG		0xc10c
-#define DWC3_GCTL		0xc110
-#define DWC3_GEVTEN		0xc114
-#define DWC3_GSTS		0xc118
-#define DWC3_GUCTL1		0xc11c
-#define DWC3_GSNPSID		0xc120
-#define DWC3_GGPIO		0xc124
-#define DWC3_GUID		0xc128
-#define DWC3_GUCTL		0xc12c
-#define DWC3_GBUSERRADDR0	0xc130
-#define DWC3_GBUSERRADDR1	0xc134
-#define DWC3_GPRTBIMAP0		0xc138
-#define DWC3_GPRTBIMAP1		0xc13c
-#define DWC3_GHWPARAMS0		0xc140
-#define DWC3_GHWPARAMS1		0xc144
-#define DWC3_GHWPARAMS2		0xc148
-#define DWC3_GHWPARAMS3		0xc14c
-#define DWC3_GHWPARAMS4		0xc150
-#define DWC3_GHWPARAMS5		0xc154
-#define DWC3_GHWPARAMS6		0xc158
-#define DWC3_GHWPARAMS7		0xc15c
-#define DWC3_GDBGFIFOSPACE	0xc160
-#define DWC3_GDBGLTSSM		0xc164
-#define DWC3_GDBGBMU		0xc16c
-#define DWC3_GDBGLSPMUX		0xc170
-#define DWC3_GDBGLSP		0xc174
-#define DWC3_GDBGEPINFO0	0xc178
-#define DWC3_GDBGEPINFO1	0xc17c
-#define DWC3_GPRTBIMAP_HS0	0xc180
-#define DWC3_GPRTBIMAP_HS1	0xc184
-#define DWC3_GPRTBIMAP_FS0	0xc188
-#define DWC3_GPRTBIMAP_FS1	0xc18c
-#define DWC3_GUCTL2		0xc19c
-
-#define DWC3_VER_NUMBER		0xc1a0
-#define DWC3_VER_TYPE		0xc1a4
-
-#define DWC3_GUSB2PHYCFG(n)	(0xc200 + ((n) * 0x04))
-#define DWC3_GUSB2I2CCTL(n)	(0xc240 + ((n) * 0x04))
-
-#define DWC3_GUSB2PHYACC(n)	(0xc280 + ((n) * 0x04))
-
-#define DWC3_GUSB3PIPECTL(n)	(0xc2c0 + ((n) * 0x04))
-
-#define DWC3_GTXFIFOSIZ(n)	(0xc300 + ((n) * 0x04))
-#define DWC3_GRXFIFOSIZ(n)	(0xc380 + ((n) * 0x04))
-
-#define DWC3_GEVNTADRLO(n)	(0xc400 + ((n) * 0x10))
-#define DWC3_GEVNTADRHI(n)	(0xc404 + ((n) * 0x10))
-#define DWC3_GEVNTSIZ(n)	(0xc408 + ((n) * 0x10))
-#define DWC3_GEVNTCOUNT(n)	(0xc40c + ((n) * 0x10))
-
-#define DWC3_GHWPARAMS8		0xc600
-#define DWC3_GUCTL3		0xc60c
-#define DWC3_GFLADJ		0xc630
-#define DWC3_GHWPARAMS9		0xc6e0
+#define DWC3_GSBUSCFG0		0x0000
+#define DWC3_GSBUSCFG1		0x0004
+#define DWC3_GTXTHRCFG		0x0008
+#define DWC3_GRXTHRCFG		0x000c
+#define DWC3_GCTL		0x0010
+#define DWC3_GEVTEN		0x0014
+#define DWC3_GSTS		0x0018
+#define DWC3_GUCTL1		0x001c
+#define DWC3_GSNPSID		0x0020
+#define DWC3_GGPIO		0x0024
+#define DWC3_GUID		0x0028
+#define DWC3_GUCTL		0x002c
+#define DWC3_GBUSERRADDR0	0x0030
+#define DWC3_GBUSERRADDR1	0x0034
+#define DWC3_GPRTBIMAP0		0x0038
+#define DWC3_GPRTBIMAP1		0x003c
+#define DWC3_GHWPARAMS0		0x0040
+#define DWC3_GHWPARAMS1		0x0044
+#define DWC3_GHWPARAMS2		0x0048
+#define DWC3_GHWPARAMS3		0x004c
+#define DWC3_GHWPARAMS4		0x0050
+#define DWC3_GHWPARAMS5		0x0054
+#define DWC3_GHWPARAMS6		0x0058
+#define DWC3_GHWPARAMS7		0x005c
+#define DWC3_GDBGFIFOSPACE	0x0060
+#define DWC3_GDBGLTSSM		0x0064
+#define DWC3_GDBGBMU		0x006c
+#define DWC3_GDBGLSPMUX		0x0070
+#define DWC3_GDBGLSP		0x0074
+#define DWC3_GDBGEPINFO0	0x0078
+#define DWC3_GDBGEPINFO1	0x007c
+#define DWC3_GPRTBIMAP_HS0	0x0080
+#define DWC3_GPRTBIMAP_HS1	0x0084
+#define DWC3_GPRTBIMAP_FS0	0x0088
+#define DWC3_GPRTBIMAP_FS1	0x008c
+#define DWC3_GUCTL2		0x009c
+
+#define DWC3_VER_NUMBER		0x00a0
+#define DWC3_VER_TYPE		0x00a4
+
+#define DWC3_GUSB2PHYCFG(n)	(0x0100 + ((n) * 0x04))
+#define DWC3_GUSB2I2CCTL(n)	(0x0140 + ((n) * 0x04))
+
+#define DWC3_GUSB2PHYACC(n)	(0x0180 + ((n) * 0x04))
+
+#define DWC3_GUSB3PIPECTL(n)	(0x01c0 + ((n) * 0x04))
+
+#define DWC3_GTXFIFOSIZ(n)	(0x0200 + ((n) * 0x04))
+#define DWC3_GRXFIFOSIZ(n)	(0x0280 + ((n) * 0x04))
+
+#define DWC3_GEVNTADRLO(n)	(0x0300 + ((n) * 0x10))
+#define DWC3_GEVNTADRHI(n)	(0x0304 + ((n) * 0x10))
+#define DWC3_GEVNTSIZ(n)	(0x0308 + ((n) * 0x10))
+#define DWC3_GEVNTCOUNT(n)	(0x030c + ((n) * 0x10))
+
+#define DWC3_GHWPARAMS8		0x0500
+#define DWC3_GUCTL3		0x050c
+#define DWC3_GFLADJ		0x0530
+#define DWC3_GHWPARAMS9		0x05e0
 
 /* Device Registers */
-#define DWC3_DCFG		0xc700
-#define DWC3_DCTL		0xc704
-#define DWC3_DEVTEN		0xc708
-#define DWC3_DSTS		0xc70c
-#define DWC3_DGCMDPAR		0xc710
-#define DWC3_DGCMD		0xc714
-#define DWC3_DALEPENA		0xc720
-#define DWC3_DCFG1		0xc740 /* DWC_usb32 only */
-
-#define DWC3_DEP_BASE(n)	(0xc800 + ((n) * 0x10))
+#define DWC3_DCFG		0x0600
+#define DWC3_DCTL		0x0604
+#define DWC3_DEVTEN		0x0608
+#define DWC3_DSTS		0x060c
+#define DWC3_DGCMDPAR		0x0610
+#define DWC3_DGCMD		0x0614
+#define DWC3_DALEPENA		0x0620
+#define DWC3_DCFG1		0x0640 /* DWC_usb32 only */
+
+#define DWC3_DEP_BASE(n)	(0x0700 + ((n) * 0x10))
 #define DWC3_DEPCMDPAR2		0x00
 #define DWC3_DEPCMDPAR1		0x04
 #define DWC3_DEPCMDPAR0		0x08
 #define DWC3_DEPCMD		0x0c
 
-#define DWC3_DEV_IMOD(n)	(0xca00 + ((n) * 0x4))
+#define DWC3_DEV_IMOD(n)	(0x0900 + ((n) * 0x4))
 
 /* OTG Registers */
-#define DWC3_OCFG		0xcc00
-#define DWC3_OCTL		0xcc04
-#define DWC3_OEVT		0xcc08
-#define DWC3_OEVTEN		0xcc0C
-#define DWC3_OSTS		0xcc10
+#define DWC3_OCFG		0x0b00
+#define DWC3_OCTL		0x0b04
+#define DWC3_OEVT		0x0b08
+#define DWC3_OEVTEN		0x0b0C
+#define DWC3_OSTS		0x0b10
 
 /* Bit fields */
 
diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index f2b7675..ea6c0e4 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -908,7 +908,7 @@ void dwc3_debugfs_init(struct dwc3 *dwc)
 
 	dwc->regset->regs = dwc3_regs;
 	dwc->regset->nregs = ARRAY_SIZE(dwc3_regs);
-	dwc->regset->base = dwc->regs - DWC3_GLOBALS_REGS_START;
+	dwc->regset->base = dwc->regs;
 
 	root = debugfs_create_dir(dev_name(dwc->dev), usb_debug_root);
 	debugfs_create_regset32("regdump", 0444, root, dwc->regset);
diff --git a/drivers/usb/dwc3/io.h b/drivers/usb/dwc3/io.h
index 1e96ea3..d9283f4 100644
--- a/drivers/usb/dwc3/io.h
+++ b/drivers/usb/dwc3/io.h
@@ -23,16 +23,16 @@ static inline u32 dwc3_readl(void __iomem *base, u32 offset)
 	/*
 	 * We requested the mem region starting from the Globals address
 	 * space, see dwc3_probe in core.c.
-	 * However, the offsets are given starting from xHCI address space.
+	 * The offsets are also given starting from Globals address space.
 	 */
-	value = readl(base + offset - DWC3_GLOBALS_REGS_START);
+	value = readl(base + offset);
 
 	/*
 	 * When tracing we want to make it easy to find the correct address on
 	 * documentation, so we revert it back to the proper addresses, the
 	 * same way they are described on SNPS documentation
 	 */
-	trace_dwc3_readl(base - DWC3_GLOBALS_REGS_START, offset, value);
+	trace_dwc3_readl(base, offset, value);
 
 	return value;
 }
@@ -42,16 +42,16 @@ static inline void dwc3_writel(void __iomem *base, u32 offset, u32 value)
 	/*
 	 * We requested the mem region starting from the Globals address
 	 * space, see dwc3_probe in core.c.
-	 * However, the offsets are given starting from xHCI address space.
+	 * The offsets are also given starting from Globals address space.
 	 */
-	writel(value, base + offset - DWC3_GLOBALS_REGS_START);
+	writel(value, base + offset);
 
 	/*
 	 * When tracing we want to make it easy to find the correct address on
 	 * documentation, so we revert it back to the proper addresses, the
 	 * same way they are described on SNPS documentation
 	 */
-	trace_dwc3_writel(base - DWC3_GLOBALS_REGS_START, offset, value);
+	trace_dwc3_writel(base, offset, value);
 }
 
 #endif /* __DRIVERS_USB_DWC3_IO_H */
-- 
2.7.4

