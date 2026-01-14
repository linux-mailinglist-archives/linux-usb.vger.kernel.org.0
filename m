Return-Path: <linux-usb+bounces-32323-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5F5D1DDE9
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 11:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20E013007F1A
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 10:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6ED392C5C;
	Wed, 14 Jan 2026 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCnxFrLm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xyia5pM8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6951392C29
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 10:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385281; cv=none; b=rHRXbuMQc4aCjuJORIRsqQHggfbfNe1Ikg6M7cvFm9Zhm++mdP/BVULY7Sw0vCfKvtc7OFik2JVPg066OdZo433sj2nf0PJTy4UL0EHgQsPsgYFG1cz11JkaeUUkiELmJZzvme/PH4kEu+zZsMmYp52n0rDNs/irIoGnb4ADnSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385281; c=relaxed/simple;
	bh=phMaZEdW+xwnGZ/4yeh8Mowv3dTqrpN1TGsy4KysEu8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NyszISQG3lpK6BiTiyZpRtrkbZHl9kvNlunqGtq4KNRIKRrxOZ6HAcRIGNIDV7aPnuzSkHhbcMNQT8rDoga8EZe8GTiVa/tzGaUaBxjLOHlDm/gaSchg4L/922QYV5LfMQytGXWd+wtQvZU0ql8UAR5VlkYaM3pinx82MDa73es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCnxFrLm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xyia5pM8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7j3nD3270846
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 10:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cdPa96MAj6K
	cEAgrDqHeO2LCi+XsOMkFPiPYTvWqu9g=; b=GCnxFrLmQh/9UfLZODrAy8FyEM/
	22hGQehbourkAA9ZPt0SDl4oHpGQTg4G7v2C+dcaGAdbXtdPMVuR5H0IuPd8Tpcg
	A9ZdL62gjVnf/CTlqP1hDU6lEbL50kq1OuFQ/8RW/F/8jqIi1O5SjpvnSUb6LL33
	5nwqY9nU6nmDMObw1+WLIt7uJjsyyb5w2znL3hn5nku7vpz754AmWpU99YVJjFRw
	H2DUVx4sMTmCKu+XSm1BVuveRpLmXWAh4un4vxY1V8JpEE8iOq0gdOQDZlMiqOY7
	Bi3xQAk/tI4rd2i8nR//hmdq6WiPnd0uwFosx5xE6GMBpagN9SMLzGri+FA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bns8v3b9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 10:07:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a58c1c74a3so16256675ad.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 02:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768385278; x=1768990078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdPa96MAj6KcEAgrDqHeO2LCi+XsOMkFPiPYTvWqu9g=;
        b=Xyia5pM8W2TusvWG7OBQnsPXtHMbc8ygnKnIW81O+7TCsgTPgaMW3XqILDZQ/bOyti
         /RzLWL55AUECSigIJ52rcIcWgKKcnf+Yh2E9IBI8KI/9XEJ0HPe0jU4FnSiA/DbPQ2MZ
         W3tRK2V/nmTGkiihSdi8erPJDh08VVjTP2OqIhE0G+rfWO7yPawbaPhVWRIKT7A/QrS4
         IgFI0VxZeGC0Py0fznAvXqjFYgaWSt9s1ezBsF+PTnZ7STbALc5WQPmKD1laxeGj7GCp
         uo+eWs4exdbhhUFi2qoRhV5y8GiOWn5q9GPTZb1SGPuNSCpE73EirKFhKDV9F6fppPG0
         i5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385278; x=1768990078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cdPa96MAj6KcEAgrDqHeO2LCi+XsOMkFPiPYTvWqu9g=;
        b=DpX02xh4WKJQpYpvdxlzhvVvwerX2TCJHfjHX7NUuAuUfmlBYTcpxL1qKJYq9MbhUw
         RVO+NiYOzsu6kXQAPIun8ezZC0nogricPhxFySAAmvLBSKpoo5xbGo6qGYkffwtwZY1O
         WKda48VFFSEHoHKE203Fqbmc9JkNtU23dznolj+mlSUlcS+TOYSuS+JSFBq0Smwz+0Bt
         ZRUavWohboF2wFCfjyXVveV/QIsOzPfYPi+x1kyCOK51JoQI0l2ig4BmkDNiqCrE8ccL
         rmItErQnCWsq1haqhVCTL/pc6JeweiAKoRdL6urOINvqT9+cmKwtetaBGs+j0QWXjjlm
         dRSg==
X-Gm-Message-State: AOJu0YzbR4sbyZNnfI3a2hdJn5NTI6Yg2GZ6/lLAz4FH37NczDV+nrb5
	paEm4TfqUMK9Qnsn2dl7pRn1jUE81T94pEnc9y6dnxSale0hfd9FcxlowhJ2x3t0+4g+xHdy5N8
	u6ZZMgoXepp6u5LxEj+dvJvBpNFNtvVtNF3Eu3AnXwmkrKkx1oV8GKtVhh9Kb5mU=
X-Gm-Gg: AY/fxX7NXpfrRi5hr8CSE+nxqmwkCHcXhw6LQSBHVjevyNJyUD3p9B4Zh8PRPQb2HOp
	ijBR3+GNQxWy8OSn5RBVze5n5YnVYWVjlYQP2PMUspSLYDpRwmzhiFG40BFFGSbiJRixFBHxscg
	FVeSZ86VY4+KLCKyRHwcsvIR4VTGU310onFaOnYsnrrtKZmb/rOavui7XN4lltU2E2EZlJ/kKst
	VL+6uUAw4P+KQeMTVAstjgvscdtFTUJ9YFUHSDRVND8m37RevtaH3yZL2HQWLoxKRWX2g/9piTS
	E+Gn57kqRhabvRt7zBaAyRfd7cc11p3UJje02WnR29s7JO6lQ8I040cTaWxQGLXOJGm+HMktyiq
	lmOcOHJDu0aJpfgPi1eUnEeJn1ptSIJ595eRoHQ==
X-Received: by 2002:a17:902:d4cd:b0:2a1:1f28:d7ee with SMTP id d9443c01a7336-2a599e5b9fcmr19238955ad.57.1768385277713;
        Wed, 14 Jan 2026 02:07:57 -0800 (PST)
X-Received: by 2002:a17:902:d4cd:b0:2a1:1f28:d7ee with SMTP id d9443c01a7336-2a599e5b9fcmr19238675ad.57.1768385277253;
        Wed, 14 Jan 2026 02:07:57 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd3632sm226379975ad.95.2026.01.14.02.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:07:56 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v4 1/3] usb: dwc3: Remove of dep->regs
Date: Wed, 14 Jan 2026 15:37:46 +0530
Message-Id: <20260114100748.2950103-2-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
References: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aY5sXBot c=1 sm=1 tr=0 ts=69676afe cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=M8qNcNEInNZZPuFPK7cA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 7fuUTObU_BKCBLQyBTAGEhSgRscNPzSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4MiBTYWx0ZWRfXwSs5Vg0IhNg8
 FGD5rcTHn2/QF6lOBd2j7NTJVehk/l9pWLV4oQnImJzZu6/7QifmYP1oPnTHQPmmgA0Eatzb4uo
 5wbQYFPmW4fnG9oevT4GUV54ohzQLvxjKL0h2wtpmD4onYx5/IkZerNA5UMqkhUxmHlxKH5OKa8
 t8HnVPr2bsUXuAxPu9ba4cLNGnXwFODRXVVapOvHyARexXsTJ/GtT65kCCuNHxSkgHJLedpc4A+
 aUeUAo+A+l9+sf0X7BioyKU2/29rRzAxlJTBkUzE3TlIKfAWvzBhqdod/3HuyC/B1t3kNz4805b
 LTRHcwWbWIZwSiy3g8olMhVvwITn3Dfuvi3tSsdWD9/+/u8Sdot8P0DqleNRfjqojw0QOeC+x+z
 dPVGWdpxgFhI+U95gLEWu9Mwu8LY+IECvNWvirfI1VzpEtVKbwmDRk5+M7AU1f0+HY2dZdRRCjQ
 0hJSdb5czjqez+qd92A==
X-Proofpoint-GUID: 7fuUTObU_BKCBLQyBTAGEhSgRscNPzSX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140082

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


