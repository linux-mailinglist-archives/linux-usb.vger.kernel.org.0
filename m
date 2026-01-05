Return-Path: <linux-usb+bounces-31910-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FC6CF36BB
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 13:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D491030DF711
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 12:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B6F33A9F5;
	Mon,  5 Jan 2026 11:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwYK/kUt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dvfhFd0f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6DC33A9D0
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767614051; cv=none; b=VMuv9lWZbqKQpb5DabO2mUHIpSVdIYq/0ZGg7CYxPlBgk35fyk5Ti8fdKDhaLZTNDgXCxgThkhvrYPRsdn/374p5ZNtYyPFlk958vbHV2CMXz1rk8h0GYRaDoxBQVA41jASkPx/Y80U0njjJDhJo7Kb3smo+hgULlYy0M6Ks8As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767614051; c=relaxed/simple;
	bh=WNqw5Ac3F3s/J3a5n+5xy2tIzRJKKAJzyLbdCLrncK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cB2xJ4E1ygpXOYQIC7Xtre4cwRiJE9ZX1piuNGzpfJFsWxOkXyXDDbs9B94dll/vhHdn3jN3YalAZ5umGzy38uO5brbe2F7kszKMa3UM4/ftZa8Cu7h2UQMnlXZSFNBqH5XQNnFGoutHsOlE5FHVpapgdCK7Nxz9YDRCny48fZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KwYK/kUt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dvfhFd0f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605AYTfl936749
	for <linux-usb@vger.kernel.org>; Mon, 5 Jan 2026 11:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RxooFxSiuU3
	HItntQVnIgqYMf/aW7jkhfyza8aXzZ6E=; b=KwYK/kUt7HvLTZcbEBcw3Yd2Kzn
	wiUCM2SEZt/2TiXacYeCbHCxwrhgZgESAbvHx4BgqFPFrVxFnAuK2ug+c/1nnwhS
	GejyFNehG//KFComHgkJlCUp9nAEkORae30FCfGx+/so/4441R4vRF3rzHPTM5mp
	UcZhMRGSaJ/HTjUGejx4S5ieFA0KgznTk41NWKGWTCj9Bas+TXd2hmSQjKaEEqa8
	zd1ChAIDvlqB69jJxGpR3V0EIxjiGw35eKlyUgZjqF9NfzDtHnuUpD1JmsvJ84PH
	9zvOZyvgAKtxKbdTgCMxFI3O8hHBmKBFbXfHO6Uyqr4n1J+F0MpGzkWibiQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgbnv86cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 11:54:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7aa148105a2so13143814b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 03:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767614046; x=1768218846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxooFxSiuU3HItntQVnIgqYMf/aW7jkhfyza8aXzZ6E=;
        b=dvfhFd0fhHpCSTmiJniC+vcFTPzKC9MWcFXO04hpTcFKovPXggS9qNn4Aml8XBxEKo
         OAFz4nU5FgsrnAHRRDkJboJ0HCJvI7Wu/vaXiYnk/mrYKcmVSY4u7+fVzrO+5E6O2QOu
         C92+ORWo+LI7EpvwAP16lcyCYgX+T/t+gjtEvA8tqJ4T3TfvsTod54OP0ABPJ4RH1Z7h
         uWh+o3ogT8mdwHWRzQe/+4wlC2Q25AVOTAwB1Kca28TAMit2HacAu7+OLG7abae37jho
         st2rFLGj2fGn9AHo7Wll/uPU21/zj1ZU918x2IYgf2VrtMrE/q4c9vU3LntUw9ACJR9K
         PXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614046; x=1768218846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RxooFxSiuU3HItntQVnIgqYMf/aW7jkhfyza8aXzZ6E=;
        b=WhDxBDXWeGEbYUkP5Bi54ukgcBnIabcC53N261pQz7ky4vbqWTnvZWfGsGS0wk4YGK
         DxYlT+9l4GFSPnSlZJTdeemsnXEIAN1fYzGadKPRZZK3Zy1WUvZJFBpX6kE6I9Dr8P0x
         MM8JAHk9sw9ZS1Jq6YFA0aH2pufxIG6z9DhuOe5325omAzvAYexkYbrF7CVlQrxnNqOe
         Vg8lHWS9tKbtPpUQAsbShJ/89fLzDtGx+bfMdlij9wmBZxo7rEC99m370ZNNLl3djKvF
         p5IZT21gHAW2twrWrDbTb0qez5S+Ohe6Iddl1yGwBnYtmm6koHRHFaUa2HSmIAkhkHpG
         tbqQ==
X-Gm-Message-State: AOJu0YwZ+OC26U3CDcbgK9DX4IhUc/VP9FGQS0pThtW0FO7YbxNIi9ur
	aNZJw++rWgDxn/7we5XOKWzCWDDG7vnex99MTvAYfpBtQozk2MEumLqAGIRvLmhdgwdUELIysMa
	//D52KyKRLY9bLV0VvKEUXIojU1So+Fd97cBznWU3DTzTZB+AJIlKwsiJd4VfH2M=
X-Gm-Gg: AY/fxX4O8DipdV9DckK8sDjqx6+JRdQ8gI4MvRYcCwq07NV/JxPW9JC2askzWvoPOD8
	OPRTAWWV4I6e9/HAmtEGBSocMXK+BVz3P0jYXeymlW/Ohg7LvmjayxnzWzmrC4iu8SXfiLXfjfL
	KPUZPYD1TW3zAhAfzxCxwfOXoZ5RzqWQPpEUYLcJzAAyQQ/VBMmFnzH1HFJ2cDbcAoj0kj8Bjw3
	Cz7aikJR42LrFnyCKNMsPvzTQiOtY1gZfiHL47ktRosJ5t/StIk7/ftpQq5gRL/fObyky9MhZJk
	mGwWjUvDih453ZTkTLHwTjq/Pf1kKq0I6U7hYeAcUB76wLVJjO4mKAUBP2xt0vwk3yFZWF42CIV
	YKgIsQfS6c2nG+h34RNycSw9BFRHQOdRjIFoCSg==
X-Received: by 2002:a05:6a00:3388:b0:7f7:6627:ee8f with SMTP id d2e1a72fcca58-7ff655b043fmr40727505b3a.26.1767614046415;
        Mon, 05 Jan 2026 03:54:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDVg9uXMr+42IVqVG6vz02g2tivIn1ijN6xrc+GOp0t7eBLAKyq68xl/o6TF/ZsFPHalji/Q==
X-Received: by 2002:a05:6a00:3388:b0:7f7:6627:ee8f with SMTP id d2e1a72fcca58-7ff655b043fmr40727492b3a.26.1767614045886;
        Mon, 05 Jan 2026 03:54:05 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cd07sm48125744b3a.46.2026.01.05.03.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:54:05 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v2 1/3] usb: dwc3: Remove of dep->regs
Date: Mon,  5 Jan 2026 17:23:23 +0530
Message-Id: <20260105115325.1765176-2-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=695ba65f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=M8qNcNEInNZZPuFPK7cA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: kmSh8HDzXVyRPKCxiXSwB-WDkGGyi8WK
X-Proofpoint-ORIG-GUID: kmSh8HDzXVyRPKCxiXSwB-WDkGGyi8WK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwNCBTYWx0ZWRfX4yJfhU10AHij
 VkSVP7IMg5MvDfE23vM0lCkI6ayctUlUMMbTBNfp5WxafsSfGxuMV5yOh8tccMPO4ERMrTNARfg
 +EJIIJhcSke94NJmRU37tNrD0OeU4QULJTH1ZqvA5hO3KEuuWSbB5AypBcnvWoILi5Cyd+pKC4k
 Stti8uwZXVBfcafQ9mVynCJonz9aP1D+B9Dcvkug6xaYpopjkjKJjRsbypDwF8zHGPUgN93u9aS
 IE1GiIdo8tPztGv/39cYFqzVosuBgZD0T12JLiS+beWxBqzSIzxeoN3abfF4TPEb7fqY20ljSaq
 1lyPQgry2ElaRtmZjMRu89aKNvTiUUxS4xuXbv+9YV1TGl+v7CSfOBSHYP/W6PgIyh7OmUhCaUu
 lafa0C9gma8Y6ueNr/IdDTteChg+UXDLrw7wRQaGLWvde4Klfenud3/tU27RosCjhd7vIvLn+h5
 Sxc3zaDa/Dpq6gdd76A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050104

Remove dep->regs from struct dwc3_ep and reuse dwc->regs instead.
Thus eliminating redundant iomem addresses and making register
access more consistent across the driver.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
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
index bc3fe31638b9..f08560af1701 100644
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


