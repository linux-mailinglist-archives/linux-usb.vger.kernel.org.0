Return-Path: <linux-usb+bounces-32242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7495BD18133
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 11:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB9BF3039860
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 10:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72EF2EA48F;
	Tue, 13 Jan 2026 10:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzqzJBrC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXH7IXeG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBED1EF36E
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 10:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300454; cv=none; b=f3S/Vd5qtz0I2LsoUsXAsRFOwpp5upZx+R4ZPzk8mRtnR/S+KXq5g2cG/zlaeidI3qgdBJaJNZw7yuZjcahqzhQOg2qKKXC3M+o+m3vqA8pBXrKx7mLTlTC0mjx29sNY4fg64M/bYUTF/0U0CaGH3Iw7sxrWEa0JuzpSi5nOcSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300454; c=relaxed/simple;
	bh=phMaZEdW+xwnGZ/4yeh8Mowv3dTqrpN1TGsy4KysEu8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U1J2dNJXve/O/8D6yKXFUQVa2YyHBqRcW3z4s3tMeGT0yG30pEJr4wO2VfhrWCBHb1SGVq4SpWw8lyDK/TF0xurerRlNp6wp8My/y16oAjS/Jg4dsQmRKEUPEjZQptqc8hwpFkJ9P0MzuttiN3cvVvKdhzj3Qtw5ljoRxrKXH0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzqzJBrC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXH7IXeG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5asw23636970
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 10:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cdPa96MAj6K
	cEAgrDqHeO2LCi+XsOMkFPiPYTvWqu9g=; b=bzqzJBrCoTv+38gfH7SYTdzEXNa
	dpu421uHFNyhL57BAto9x7HqbdPeClyfA4vCjiGxI5IISW+gotYqZJxMwKQvSFW/
	OH27yPdAotnsmHg4Gyqvyvwwm3cSeYeYZAWxjcSFm1kObkEDwcuJQ3769CwYl6cu
	N/Mfut4+PAxBVOL14QY+NCiJWnD4DPYlUfp1sUN4D6tTcdYHySozLoNnE7CvHTDO
	aM5/C7Y6303WLL9rAYi8yhxVxG2pLzQrt0R3+S9HUrOrvVp6649LQOq6HdSJo0RB
	7+ilnWggDgL13JQOhhaqYygmmS8juhONzvRfZeQyicWiRCDByyX7bm8nu9g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng2c0xju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 10:34:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c196fa94049so3675765a12.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 02:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300452; x=1768905252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdPa96MAj6KcEAgrDqHeO2LCi+XsOMkFPiPYTvWqu9g=;
        b=bXH7IXeGxEQqeCfjdhByQawUmwZqfiYeRkYYNj2d9FN7tgM65/qS1JP0HqO+Xk5tCT
         mEN8W+byMaSC+skuBiu3cKTH2BpUO9NWR8/JuDbwJSoJ8XBIBGkIWMlNappLxMFDW1WF
         7aavElMmhr0Xc085/XZoGV+uJ/TwG/YUYI8YTMwPvR2M7JKuIr4ZDvul5HpjjiT2COJf
         AKDcvz708I1JphDwxKUUJwMG2Sfz3rW3D7XibkcAKactWZRfjygZIb5y/4U24UnEH7WC
         PZQ3SlYZi8IAFrN3qj7K0bszvwzKF0UgSwwCH5ar2q1qL5X/cza69n4EeK1x/sP8zH5v
         BwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300452; x=1768905252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cdPa96MAj6KcEAgrDqHeO2LCi+XsOMkFPiPYTvWqu9g=;
        b=udedFvdWG8mK9aUMHNXO8pc2pnjnbs3k18U3G14EtdjwivmgpjKED5SDX6q1Pzh3Gd
         rksKQZloTxWYK8DllLjQlTuwCHYmQfashtHE3JIvizVLq51D65Nh9lHROgpRb3wSVIxZ
         TMeuFQbIizeF1vQwN8ooyT+G7fXNiQtUvmYZFxwyXng0kJbyBPgl3EuqPIiS52Kj1MZC
         HZvlRCqxXxz+4cXRWDS0ehX+2oVFh0+YZUPhtwCy3mVCZBZA9J5V2tFqElpErAExRnq2
         V0AbpPLUM6Ee5+/uKBa0zTz7LTHT4+Sa1uYVJ59/i7ClBQEyHxgBR7bog6oYvRSVGv4s
         D9nw==
X-Gm-Message-State: AOJu0YwKAsKM6IXnjHURA09p+8TU/d3lHS2+0lyTizgfREOBVDD6JkVP
	pEroB12BrHAiS2J4rnAWdjRgAGdxKiVjv0yLuvKw6PX7Qit0botx9Jlbi0sv46Ez96NWUXQOCxR
	/NaFl57mRQfEenHwsKlVqvjiQqUdlNFGlBA8zf5T2iL75pbXbbcHnwA36ZZG8IdY=
X-Gm-Gg: AY/fxX68DXoW5JMVbkQ/aVoudPbxVoZgI0K+U++ii2LFjGe9yzee6iw/8b8+w1T9V46
	tvJm8B5CUz+Q+DUOVtoLRa7KpfTxfRWFRafX+aZhN1htw8+cTa8rHvg5fA8l3tVNRdCP7VcR41x
	HQvEXcOVeypY511v/ihj8WD6VnllsDN/XiCrUZpIMEcrDtsibdJ4b6p48TnDaJEqUR9TA8dPsDR
	oRS71iDTWRsQj6HNmGdZ18IBxVetAe22lJ/cEgtxqN87sONhit5tRKfiGwKiSYsO5lsBykYL/in
	ub4pby25KtCSy/rpOUaQjhxnso3wnh3tD/q1T9bMomWPXBC1Epwxt7b6sINDE0pCG2FghSJqm0j
	ejItqFbnn+jHYvleCvGPmMao8e01gkoCaJQEt3g==
X-Received: by 2002:a05:6a20:c909:b0:366:22a1:2a4e with SMTP id adf61e73a8af0-38bd9982ba8mr2533442637.9.1768300451518;
        Tue, 13 Jan 2026 02:34:11 -0800 (PST)
X-Received: by 2002:a05:6a20:c909:b0:366:22a1:2a4e with SMTP id adf61e73a8af0-38bd9982ba8mr2533417637.9.1768300450987;
        Tue, 13 Jan 2026 02:34:10 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b2edsm19769911a12.32.2026.01.13.02.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:34:10 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v3 1/3] usb: dwc3: Remove of dep->regs
Date: Tue, 13 Jan 2026 16:03:58 +0530
Message-Id: <20260113103400.2347763-2-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113103400.2347763-1-prashanth.k@oss.qualcomm.com>
References: <20260113103400.2347763-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OSBTYWx0ZWRfX9dA1VDqcv0bn
 KUlwD5uzwcBRUKtCKO8Jrbe3WSapTHHGeKfGaeshXytTjN9/qFFvYV6gcNjhYdc5lGPpQ/hQo+a
 RVdzQZRWKjrBNDabtU1JyT6dqrecQ0D8TRBO9iAoIntXrZ9M56c2USyUUPMEIUU+BFylR9cqqlf
 tbNKG5FmRSCKo54WHNZCGW+GWUgQPEsJqEWdnJPb+urICjxshDfVXUNr6cRF3fVLvevfcMjiy7p
 ArK3VuNr56HT2Tqxy6oGN4OpxKCLlYQ7fKAxC2zrs/gC8uUxppMmhCs8Qyunusn20dR/QRIKJbw
 g1kigvQh8MpbiCqw7h11xrwD5+eUjSCqsLyjH2VxRHQbGubiDLysr3LBEwuKbwCZwEg6lbivPOt
 0x1V90NSWM62vUh33STN/jBUYKrrxj2Cc4kYWSx1Wm9Gt6AsZ94dSs7P4ShXTQlxHtjOeQ0b1Qf
 OyF0CuCyFhRoeQYwJmg==
X-Authority-Analysis: v=2.4 cv=C5TkCAP+ c=1 sm=1 tr=0 ts=69661fa4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=M8qNcNEInNZZPuFPK7cA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: x0NoAT5d9SiZDZfqOTJW77UAymxH964o
X-Proofpoint-ORIG-GUID: x0NoAT5d9SiZDZfqOTJW77UAymxH964o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130089

Remove dep->regs from struct dwc3_ep and reuse dwc->regs instead.
Thus eliminating redundant iomem addresses and making register
access more consistent across the driver.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.h    | 10 ++++------
 drivers/usb/dwc3/debugfs.c | 12 ++++--------
 drivers/usb/dwc3/gadget.c  | 12 ++++++------
 drivers/usb/dwc3/gadget.h  |  2 +-
 4 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a5fc92c4ffa3..23188b910528 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -165,10 +165,10 @@
 #define DWC3_DCFG1		0xc740 /* DWC_usb32 only */
 
 #define DWC3_DEP_BASE(n)	(0xc800 + ((n) * 0x10))
-#define DWC3_DEPCMDPAR2		0x00
-#define DWC3_DEPCMDPAR1		0x04
-#define DWC3_DEPCMDPAR0		0x08
-#define DWC3_DEPCMD		0x0c
+#define DWC3_DEPCMDPAR2(n)	(DWC3_DEP_BASE(n) + 0x00)
+#define DWC3_DEPCMDPAR1(n)	(DWC3_DEP_BASE(n) + 0x04)
+#define DWC3_DEPCMDPAR0(n)	(DWC3_DEP_BASE(n) + 0x08)
+#define DWC3_DEPCMD(n)		(DWC3_DEP_BASE(n) + 0x0c)
 
 #define DWC3_DEV_IMOD(n)	(0xca00 + ((n) * 0x4))
 
@@ -749,8 +749,6 @@ struct dwc3_ep {
 	struct list_head	pending_list;
 	struct list_head	started_list;
 
-	void __iomem		*regs;
-
 	struct dwc3_trb		*trb_pool;
 	dma_addr_t		trb_pool_dma;
 	struct dwc3		*dwc;
diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index d18bf5e32cc8..0b45ff16f575 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -36,23 +36,19 @@
 #define dump_ep_register_set(n)			\
 	{					\
 		.name = "DEPCMDPAR2("__stringify(n)")",	\
-		.offset = DWC3_DEP_BASE(n) +	\
-			DWC3_DEPCMDPAR2,	\
+		.offset = DWC3_DEPCMDPAR2(n),	\
 	},					\
 	{					\
 		.name = "DEPCMDPAR1("__stringify(n)")",	\
-		.offset = DWC3_DEP_BASE(n) +	\
-			DWC3_DEPCMDPAR1,	\
+		.offset = DWC3_DEPCMDPAR1(n),	\
 	},					\
 	{					\
 		.name = "DEPCMDPAR0("__stringify(n)")",	\
-		.offset = DWC3_DEP_BASE(n) +	\
-			DWC3_DEPCMDPAR0,	\
+		.offset = DWC3_DEPCMDPAR0(n),	\
 	},					\
 	{					\
 		.name = "DEPCMD("__stringify(n)")",	\
-		.offset = DWC3_DEP_BASE(n) +	\
-			DWC3_DEPCMD,		\
+		.offset = DWC3_DEPCMD(n),		\
 	}
 
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 8a35a6901db7..ce087cbc4a53 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -320,6 +320,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 
 	int			cmd_status = 0;
 	int			ret = -EINVAL;
+	u8			epnum = dep->number;
 
 	/*
 	 * When operating in USB 2.0 speeds (HS/FS), if GUSB2PHYCFG.ENBLSLPM or
@@ -355,9 +356,9 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 	 * improve performance.
 	 */
 	if (DWC3_DEPCMD_CMD(cmd) != DWC3_DEPCMD_UPDATETRANSFER) {
-		dwc3_writel(dep->regs, DWC3_DEPCMDPAR0, params->param0);
-		dwc3_writel(dep->regs, DWC3_DEPCMDPAR1, params->param1);
-		dwc3_writel(dep->regs, DWC3_DEPCMDPAR2, params->param2);
+		dwc3_writel(dwc->regs, DWC3_DEPCMDPAR0(epnum), params->param0);
+		dwc3_writel(dwc->regs, DWC3_DEPCMDPAR1(epnum), params->param1);
+		dwc3_writel(dwc->regs, DWC3_DEPCMDPAR2(epnum), params->param2);
 	}
 
 	/*
@@ -381,7 +382,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 	else
 		cmd |= DWC3_DEPCMD_CMDACT;
 
-	dwc3_writel(dep->regs, DWC3_DEPCMD, cmd);
+	dwc3_writel(dwc->regs, DWC3_DEPCMD(epnum), cmd);
 
 	if (!(cmd & DWC3_DEPCMD_CMDACT) ||
 		(DWC3_DEPCMD_CMD(cmd) == DWC3_DEPCMD_ENDTRANSFER &&
@@ -391,7 +392,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 	}
 
 	do {
-		reg = dwc3_readl(dep->regs, DWC3_DEPCMD);
+		reg = dwc3_readl(dwc->regs, DWC3_DEPCMD(epnum));
 		if (!(reg & DWC3_DEPCMD_CMDACT)) {
 			cmd_status = DWC3_DEPCMD_STATUS(reg);
 
@@ -3381,7 +3382,6 @@ static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum)
 	dep->dwc = dwc;
 	dep->number = epnum;
 	dep->direction = direction;
-	dep->regs = dwc->regs + DWC3_DEP_BASE(epnum);
 	dwc->eps[epnum] = dep;
 	dep->combo_num = 0;
 	dep->start_cmd_status = 0;
diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
index d73e735e4081..c3aa9638b7a5 100644
--- a/drivers/usb/dwc3/gadget.h
+++ b/drivers/usb/dwc3/gadget.h
@@ -132,7 +132,7 @@ static inline void dwc3_gadget_ep_get_transfer_index(struct dwc3_ep *dep)
 {
 	u32			res_id;
 
-	res_id = dwc3_readl(dep->regs, DWC3_DEPCMD);
+	res_id = dwc3_readl(dep->dwc->regs, DWC3_DEPCMD(dep->number));
 	dep->resource_index = DWC3_DEPCMD_GET_RSC_IDX(res_id);
 }
 
-- 
2.34.1


