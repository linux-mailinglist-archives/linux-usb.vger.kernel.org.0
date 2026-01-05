Return-Path: <linux-usb+bounces-31912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 166F7CF3676
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 13:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 964703003FF5
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 12:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5021D33ADBA;
	Mon,  5 Jan 2026 11:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ba/0fILw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FdyrTDu7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A9633AD82
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 11:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767614055; cv=none; b=saMM9rrbKEKcJ8Ps3vB27jkOy+8X89QW5DFbRoj7VzCQeWvpIEbPwV66ITWTmfUsjQwhBfzVGN1EZrUeugl3XNpEPwB1sW02JGdGnOEE5rjFKSIgWGu7ZyrV7mhWuywVnCFJI3hhYMhfxB71FFpa2P5rGWKTIMB8PLdiOUdFAoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767614055; c=relaxed/simple;
	bh=bH4NndR+nnser6kONrTO7XEsyPWuHPtYA+c16YHEZrY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OkJsAR2GKvqFJ6kiZumdN74SgDuYwb1B7sAuw2BOGDUQXGoQmMZJMfgyyBxHvkoDQhqPvjdGeqhgPWjw0cA5s6mm+NTb9ZCQdAMEaoA2H/SZrfDwXIr9EgnPpM43Bd4B2BKR14AiBO9LzZqjfam3XkYYVkWdNCYVStg67aIqQWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ba/0fILw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FdyrTDu7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058KAbV3867998
	for <linux-usb@vger.kernel.org>; Mon, 5 Jan 2026 11:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B/zidXPlMlA
	AnS1IPyKXrjtjzZzCu1OIJeMUyjuLhiw=; b=Ba/0fILwnA9KGnXHD1GJEVDEXn/
	5WH7xr5f4rYaqtbIKG0bgskyk7RcIRIPjt9RuOkj+DcnEhHwRDbgULKzCOGS5qTX
	Jj4HY/5l0v5RcJlDl+vI0r5CnkGs62KXQQF8EESFxwhFm+DiQCpcTpWH5Cs0JQsq
	SH7rVU3zjR2ZAMipjRTCDvR9i267rlFo4LmTzTa1QlJAwlCVBnmdpDW5beD2uml7
	HP5G9ipf3jh5NMsp/GdIMg3dob2A4pFNd1rOXNTast4il5OQYoLwPVHsA1tOHuEs
	pbS6FcUTrxNpmYc+5XpUr2ZMvoGtpG3xM5J1NR0JtU5619Zu+UQnCW4ofMw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0huhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 11:54:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7fc82eff4adso314056b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 03:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767614050; x=1768218850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/zidXPlMlAAnS1IPyKXrjtjzZzCu1OIJeMUyjuLhiw=;
        b=FdyrTDu7XYBWexzILUgviZ57baHVRcwvbkM72L0kMmX1OrROUG/nzQq/WYwVtOpJC1
         hEwhseHp4fny/HLWr1Lh2UWJSM9AyUOP0XX8VS9oLGGcHZ0c/JEZw5bHLC1nNkzhnn97
         JibfvjXNmPVQIVfD9DmRR2p3JRjKwES6DlxvX/3MNrn4Ob1wslW/G4qDqcjrXB8sOMty
         YsiTLSTmaszpXrIyvciRoALUQk+xctaLX7PV4ltUBV5nKPtBo3zi6arISbG8z2crj9Ed
         rWWKUdcZUvQpnkSDSBdcv4y7KzGl9tOiqbexBA9qPHDzrho4UY66FY/KWr5ebjxRD/CB
         XYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614050; x=1768218850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B/zidXPlMlAAnS1IPyKXrjtjzZzCu1OIJeMUyjuLhiw=;
        b=ut0bfd8AMv6fd0O+XdjiiclGhfHmOOPh3WsYS3RIsGkuG4Z82PMOBdOYiFa/5A6D9P
         cBemXqHtwhrc3lIPeNQFbNX1SFUr+tgm7+B16hJpa7Z/B1pEbt4xJMZvy5/Yda235iqC
         IevI0TIuZGXQiE0tDglqa93Fa8MahuCdBpHid8NQn1sTH2s81H4x7iSNdEKGQcptF88I
         HAojHcha0UVywxD0aAa2LNnqeHsDxHMKK7Jewnm0ApBtLelyL/bMPaOXD9R+V/Lgmz0Z
         oSAon08+aI7RLya92HVugsg34rxhmBgyMnEhuhpVUWO0xn5dJ9kBVpitQneVc65Qi+aw
         wNwg==
X-Gm-Message-State: AOJu0YwBylW8waNdEXxzJB9h6VOXKX9LK80FH64uGPdQnbxKTagsilGW
	MTtCeagrJRPl03pXIu9rWRQiZaPHAxf3rp+aUp53fEZCnkOTqIs1WXLUTLQw/nW9nGVUAaAAiDa
	bec5lUwPc3n8k8821muvfDtjjTIB0GyGv7wmB+Yv+IL4nXzX+7yC7/maKzw7eaHLZ5fJEwq0=
X-Gm-Gg: AY/fxX6QeaAaZpo16EGNSnhDhmMcnQQoB0fOs2dezLcNAT1MYKw0/1xZxVvgZBC/0pn
	q4TNOHh8EoTxJImQGVIPaM7hhs9rusvQW6kK/qBOZMBCJh8LZQ0TdD3E/SMpspRw1akjbUaP1Xx
	A72xkMqhZBYXsuOCX6qHLaFoQzuQPsafDpcCFnNtoAaNd4/oa7BhVfe/em5A/6wocqR56JCZFin
	QlA3/Z/Cvjs6I6ggfoQMrapo6Y6Gi+qPhZQZXYfD94ay3l6sgKZm3mTQ8lyp+FnBf8CKiDO7JXF
	xKU3xUNZOGp6HGcwhXiTUyM8c64Ztd5K/tJwgWa3iaCx4SREGBxlZ9T8xRqUf7XzoIcr0r99nDF
	lHdUZvVIe3YcwB6ZpKolHQhtgtbPxGq3atIRmDQ==
X-Received: by 2002:a05:6a00:4e43:b0:77f:9ab:f5 with SMTP id d2e1a72fcca58-8148a344ebcmr5651812b3a.14.1767614049176;
        Mon, 05 Jan 2026 03:54:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7EM0u/hQ2KEeNYp8yXZKmwz0GJbGiQ5dU5BJWV+eiDuKgKt9Dp8rMIIPHWmKVFWlsU7loFw==
X-Received: by 2002:a05:6a00:4e43:b0:77f:9ab:f5 with SMTP id d2e1a72fcca58-8148a344ebcmr5651796b3a.14.1767614048406;
        Mon, 05 Jan 2026 03:54:08 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cd07sm48125744b3a.46.2026.01.05.03.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:54:07 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v2 2/3] usb: dwc3: Add dwc pointer to dwc3_readl/writel
Date: Mon,  5 Jan 2026 17:23:24 +0530
Message-Id: <20260105115325.1765176-3-prashanth.k@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695ba663 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1-JGb9IuH62Of12rmQMA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwNCBTYWx0ZWRfX1XBeMr/EbVH7
 6nW39eSdIc/hL6yTjFd4HJsCVr1ZweUcsIdROG+xxJZydmRRbMgMj2JQMTLAZuUhMVMQCEAD8py
 kQGYJV1wLW/HUZ/vOAx2HvitoLj8gKQOeS3nsd8rIaTG6ZskjHhC0Y/e2hoP6pU5bUI2GoY+GQW
 3lQgRfvHjqqpR9c/MDaSdAoUX3NEBYz3ymivM5NuXmcK74bY/suR7SII/XDfVmlLgquwdzaW6Xv
 7hMgh3Z61Vx/2B5zkPqzq+jJ2HWYBNykMpKYWvjhlcUmGnkBdS/yyJuYl+oesPbxSJEHcvfobXm
 ZMbv+O+BPsY6xgYrNrDcbr+Lf/mh/+t8tcrAS/7TWIp25kSvPKYFN9ENIJOuuMm9kIxsqRxumcn
 KLQXFza7wq0mCG6cMhPUdP6okxvmZ1uQ7SD45JirOEIAADGDhnO4GQ0qx1vc7El9iD1QIb4KN23
 CVj6KDBujYhPpX6pA5w==
X-Proofpoint-GUID: EkJPqBgkBAyIQtbkyhL43BkhK4oD3QCe
X-Proofpoint-ORIG-GUID: EkJPqBgkBAyIQtbkyhL43BkhK4oD3QCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050104

Use dwc pointer in dwc3_readl() dwc3_writel() instead of passing
the dwc->regs. This would help us access the dwc structure and
log the base address in traces. There's no functional changes in
this patch, just refactoring existing APIs.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c    | 194 ++++++++++++++++++-------------------
 drivers/usb/dwc3/debugfs.c |  32 +++---
 drivers/usb/dwc3/drd.c     |  76 +++++++--------
 drivers/usb/dwc3/ep0.c     |  20 ++--
 drivers/usb/dwc3/gadget.c  | 160 +++++++++++++++---------------
 drivers/usb/dwc3/gadget.h  |   4 +-
 drivers/usb/dwc3/io.h      |   7 +-
 drivers/usb/dwc3/ulpi.c    |  10 +-
 8 files changed, 253 insertions(+), 250 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index ec8407972b9d..670a9d4bfff2 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -114,23 +114,23 @@ void dwc3_enable_susphy(struct dwc3 *dwc, bool enable)
 	int i;
 
 	for (i = 0; i < dwc->num_usb3_ports; i++) {
-		reg = dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(i));
+		reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(i));
 		if (enable && !dwc->dis_u3_susphy_quirk)
 			reg |= DWC3_GUSB3PIPECTL_SUSPHY;
 		else
 			reg &= ~DWC3_GUSB3PIPECTL_SUSPHY;
 
-		dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(i), reg);
+		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(i), reg);
 	}
 
 	for (i = 0; i < dwc->num_usb2_ports; i++) {
-		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(i));
+		reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(i));
 		if (enable && !dwc->dis_u2_susphy_quirk)
 			reg |= DWC3_GUSB2PHYCFG_SUSPHY;
 		else
 			reg &= ~DWC3_GUSB2PHYCFG_SUSPHY;
 
-		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(i), reg);
+		dwc3_writel(dwc, DWC3_GUSB2PHYCFG(i), reg);
 	}
 }
 EXPORT_SYMBOL_GPL(dwc3_enable_susphy);
@@ -140,7 +140,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 	unsigned int hw_mode;
 	u32 reg;
 
-	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+	reg = dwc3_readl(dwc, DWC3_GCTL);
 
 	 /*
 	  * For DRD controllers, GUSB3PIPECTL.SUSPENDENABLE and
@@ -155,7 +155,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 
 	reg &= ~(DWC3_GCTL_PRTCAPDIR(DWC3_GCTL_PRTCAP_OTG));
 	reg |= DWC3_GCTL_PRTCAPDIR(mode);
-	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+	dwc3_writel(dwc, DWC3_GCTL, reg);
 
 	dwc->current_dr_role = mode;
 	trace_dwc3_set_prtcap(mode);
@@ -216,9 +216,9 @@ static void __dwc3_set_mode(struct work_struct *work)
 	if (dwc->current_dr_role && ((DWC3_IP_IS(DWC3) ||
 			DWC3_VER_IS_PRIOR(DWC31, 190A)) &&
 			desired_dr_role != DWC3_GCTL_PRTCAP_OTG)) {
-		reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+		reg = dwc3_readl(dwc, DWC3_GCTL);
 		reg |= DWC3_GCTL_CORESOFTRESET;
-		dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+		dwc3_writel(dwc, DWC3_GCTL, reg);
 
 		/*
 		 * Wait for internal clocks to synchronized. DWC_usb31 and
@@ -228,9 +228,9 @@ static void __dwc3_set_mode(struct work_struct *work)
 		 */
 		msleep(100);
 
-		reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+		reg = dwc3_readl(dwc, DWC3_GCTL);
 		reg &= ~DWC3_GCTL_CORESOFTRESET;
-		dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+		dwc3_writel(dwc, DWC3_GCTL, reg);
 	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
@@ -254,9 +254,9 @@ static void __dwc3_set_mode(struct work_struct *work)
 				phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
 
 			if (dwc->dis_split_quirk) {
-				reg = dwc3_readl(dwc->regs, DWC3_GUCTL3);
+				reg = dwc3_readl(dwc, DWC3_GUCTL3);
 				reg |= DWC3_GUCTL3_SPLITDISABLE;
-				dwc3_writel(dwc->regs, DWC3_GUCTL3, reg);
+				dwc3_writel(dwc, DWC3_GUCTL3, reg);
 			}
 		}
 		break;
@@ -306,11 +306,11 @@ u32 dwc3_core_fifo_space(struct dwc3_ep *dep, u8 type)
 	struct dwc3		*dwc = dep->dwc;
 	u32			reg;
 
-	dwc3_writel(dwc->regs, DWC3_GDBGFIFOSPACE,
-			DWC3_GDBGFIFOSPACE_NUM(dep->number) |
-			DWC3_GDBGFIFOSPACE_TYPE(type));
+	dwc3_writel(dwc, DWC3_GDBGFIFOSPACE,
+		    DWC3_GDBGFIFOSPACE_NUM(dep->number) |
+		    DWC3_GDBGFIFOSPACE_TYPE(type));
 
-	reg = dwc3_readl(dwc->regs, DWC3_GDBGFIFOSPACE);
+	reg = dwc3_readl(dwc, DWC3_GDBGFIFOSPACE);
 
 	return DWC3_GDBGFIFOSPACE_SPACE_AVAILABLE(reg);
 }
@@ -332,7 +332,7 @@ int dwc3_core_soft_reset(struct dwc3 *dwc)
 	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST)
 		return 0;
 
-	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+	reg = dwc3_readl(dwc, DWC3_DCTL);
 	reg |= DWC3_DCTL_CSFTRST;
 	reg &= ~DWC3_DCTL_RUN_STOP;
 	dwc3_gadget_dctl_write_safe(dwc, reg);
@@ -347,7 +347,7 @@ int dwc3_core_soft_reset(struct dwc3 *dwc)
 		retries = 10;
 
 	do {
-		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+		reg = dwc3_readl(dwc, DWC3_DCTL);
 		if (!(reg & DWC3_DCTL_CSFTRST))
 			goto done;
 
@@ -387,12 +387,12 @@ static void dwc3_frame_length_adjustment(struct dwc3 *dwc)
 	if (dwc->fladj == 0)
 		return;
 
-	reg = dwc3_readl(dwc->regs, DWC3_GFLADJ);
+	reg = dwc3_readl(dwc, DWC3_GFLADJ);
 	dft = reg & DWC3_GFLADJ_30MHZ_MASK;
 	if (dft != dwc->fladj) {
 		reg &= ~DWC3_GFLADJ_30MHZ_MASK;
 		reg |= DWC3_GFLADJ_30MHZ_SDBND_SEL | dwc->fladj;
-		dwc3_writel(dwc->regs, DWC3_GFLADJ, reg);
+		dwc3_writel(dwc, DWC3_GFLADJ, reg);
 	}
 }
 
@@ -424,10 +424,10 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
 		return;
 	}
 
-	reg = dwc3_readl(dwc->regs, DWC3_GUCTL);
+	reg = dwc3_readl(dwc, DWC3_GUCTL);
 	reg &= ~DWC3_GUCTL_REFCLKPER_MASK;
 	reg |=  FIELD_PREP(DWC3_GUCTL_REFCLKPER_MASK, period);
-	dwc3_writel(dwc->regs, DWC3_GUCTL, reg);
+	dwc3_writel(dwc, DWC3_GUCTL, reg);
 
 	if (DWC3_VER_IS_PRIOR(DWC3, 250A))
 		return;
@@ -455,7 +455,7 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
 	 */
 	decr = 480000000 / rate;
 
-	reg = dwc3_readl(dwc->regs, DWC3_GFLADJ);
+	reg = dwc3_readl(dwc, DWC3_GFLADJ);
 	reg &= ~DWC3_GFLADJ_REFCLK_FLADJ_MASK
 	    &  ~DWC3_GFLADJ_240MHZDECR
 	    &  ~DWC3_GFLADJ_240MHZDECR_PLS1;
@@ -466,7 +466,7 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
 	if (dwc->gfladj_refclk_lpm_sel)
 		reg |=  DWC3_GFLADJ_REFCLK_LPM_SEL;
 
-	dwc3_writel(dwc->regs, DWC3_GFLADJ, reg);
+	dwc3_writel(dwc, DWC3_GFLADJ, reg);
 }
 
 /**
@@ -569,16 +569,16 @@ int dwc3_event_buffers_setup(struct dwc3 *dwc)
 
 	evt = dwc->ev_buf;
 	evt->lpos = 0;
-	dwc3_writel(dwc->regs, DWC3_GEVNTADRLO(0),
-			lower_32_bits(evt->dma));
-	dwc3_writel(dwc->regs, DWC3_GEVNTADRHI(0),
-			upper_32_bits(evt->dma));
-	dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
-			DWC3_GEVNTSIZ_SIZE(evt->length));
+	dwc3_writel(dwc, DWC3_GEVNTADRLO(0),
+		    lower_32_bits(evt->dma));
+	dwc3_writel(dwc, DWC3_GEVNTADRHI(0),
+		    upper_32_bits(evt->dma));
+	dwc3_writel(dwc, DWC3_GEVNTSIZ(0),
+		    DWC3_GEVNTSIZ_SIZE(evt->length));
 
 	/* Clear any stale event */
-	reg = dwc3_readl(dwc->regs, DWC3_GEVNTCOUNT(0));
-	dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), reg);
+	reg = dwc3_readl(dwc, DWC3_GEVNTCOUNT(0));
+	dwc3_writel(dwc, DWC3_GEVNTCOUNT(0), reg);
 	return 0;
 }
 
@@ -593,7 +593,7 @@ void dwc3_event_buffers_cleanup(struct dwc3 *dwc)
 	 * Exynos platforms may not be able to access event buffer if the
 	 * controller failed to halt on dwc3_core_exit().
 	 */
-	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
+	reg = dwc3_readl(dwc, DWC3_DSTS);
 	if (!(reg & DWC3_DSTS_DEVCTRLHLT))
 		return;
 
@@ -601,14 +601,14 @@ void dwc3_event_buffers_cleanup(struct dwc3 *dwc)
 
 	evt->lpos = 0;
 
-	dwc3_writel(dwc->regs, DWC3_GEVNTADRLO(0), 0);
-	dwc3_writel(dwc->regs, DWC3_GEVNTADRHI(0), 0);
-	dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0), DWC3_GEVNTSIZ_INTMASK
+	dwc3_writel(dwc, DWC3_GEVNTADRLO(0), 0);
+	dwc3_writel(dwc, DWC3_GEVNTADRHI(0), 0);
+	dwc3_writel(dwc, DWC3_GEVNTSIZ(0), DWC3_GEVNTSIZ_INTMASK
 			| DWC3_GEVNTSIZ_SIZE(0));
 
 	/* Clear any stale event */
-	reg = dwc3_readl(dwc->regs, DWC3_GEVNTCOUNT(0));
-	dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), reg);
+	reg = dwc3_readl(dwc, DWC3_GEVNTCOUNT(0));
+	dwc3_writel(dwc, DWC3_GEVNTCOUNT(0), reg);
 }
 
 static void dwc3_core_num_eps(struct dwc3 *dwc)
@@ -622,18 +622,18 @@ static void dwc3_cache_hwparams(struct dwc3 *dwc)
 {
 	struct dwc3_hwparams	*parms = &dwc->hwparams;
 
-	parms->hwparams0 = dwc3_readl(dwc->regs, DWC3_GHWPARAMS0);
-	parms->hwparams1 = dwc3_readl(dwc->regs, DWC3_GHWPARAMS1);
-	parms->hwparams2 = dwc3_readl(dwc->regs, DWC3_GHWPARAMS2);
-	parms->hwparams3 = dwc3_readl(dwc->regs, DWC3_GHWPARAMS3);
-	parms->hwparams4 = dwc3_readl(dwc->regs, DWC3_GHWPARAMS4);
-	parms->hwparams5 = dwc3_readl(dwc->regs, DWC3_GHWPARAMS5);
-	parms->hwparams6 = dwc3_readl(dwc->regs, DWC3_GHWPARAMS6);
-	parms->hwparams7 = dwc3_readl(dwc->regs, DWC3_GHWPARAMS7);
-	parms->hwparams8 = dwc3_readl(dwc->regs, DWC3_GHWPARAMS8);
+	parms->hwparams0 = dwc3_readl(dwc, DWC3_GHWPARAMS0);
+	parms->hwparams1 = dwc3_readl(dwc, DWC3_GHWPARAMS1);
+	parms->hwparams2 = dwc3_readl(dwc, DWC3_GHWPARAMS2);
+	parms->hwparams3 = dwc3_readl(dwc, DWC3_GHWPARAMS3);
+	parms->hwparams4 = dwc3_readl(dwc, DWC3_GHWPARAMS4);
+	parms->hwparams5 = dwc3_readl(dwc, DWC3_GHWPARAMS5);
+	parms->hwparams6 = dwc3_readl(dwc, DWC3_GHWPARAMS6);
+	parms->hwparams7 = dwc3_readl(dwc, DWC3_GHWPARAMS7);
+	parms->hwparams8 = dwc3_readl(dwc, DWC3_GHWPARAMS8);
 
 	if (DWC3_IP_IS(DWC32))
-		parms->hwparams9 = dwc3_readl(dwc->regs, DWC3_GHWPARAMS9);
+		parms->hwparams9 = dwc3_readl(dwc, DWC3_GHWPARAMS9);
 }
 
 static void dwc3_config_soc_bus(struct dwc3 *dwc)
@@ -641,10 +641,10 @@ static void dwc3_config_soc_bus(struct dwc3 *dwc)
 	if (dwc->gsbuscfg0_reqinfo != DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED) {
 		u32 reg;
 
-		reg = dwc3_readl(dwc->regs, DWC3_GSBUSCFG0);
+		reg = dwc3_readl(dwc, DWC3_GSBUSCFG0);
 		reg &= ~DWC3_GSBUSCFG0_REQINFO(~0);
 		reg |= DWC3_GSBUSCFG0_REQINFO(dwc->gsbuscfg0_reqinfo);
-		dwc3_writel(dwc->regs, DWC3_GSBUSCFG0, reg);
+		dwc3_writel(dwc, DWC3_GSBUSCFG0, reg);
 	}
 }
 
@@ -668,7 +668,7 @@ static int dwc3_ss_phy_setup(struct dwc3 *dwc, int index)
 {
 	u32 reg;
 
-	reg = dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(index));
+	reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(index));
 
 	/*
 	 * Make sure UX_EXIT_PX is cleared as that causes issues with some
@@ -706,7 +706,7 @@ static int dwc3_ss_phy_setup(struct dwc3 *dwc, int index)
 	if (dwc->dis_del_phy_power_chg_quirk)
 		reg &= ~DWC3_GUSB3PIPECTL_DEPOCHANGE;
 
-	dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(index), reg);
+	dwc3_writel(dwc, DWC3_GUSB3PIPECTL(index), reg);
 
 	return 0;
 }
@@ -715,7 +715,7 @@ static int dwc3_hs_phy_setup(struct dwc3 *dwc, int index)
 {
 	u32 reg;
 
-	reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(index));
+	reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(index));
 
 	/* Select the HS PHY interface */
 	switch (DWC3_GHWPARAMS3_HSPHY_IFC(dwc->hwparams.hwparams3)) {
@@ -727,7 +727,7 @@ static int dwc3_hs_phy_setup(struct dwc3 *dwc, int index)
 		} else if (dwc->hsphy_interface &&
 				!strncmp(dwc->hsphy_interface, "ulpi", 4)) {
 			reg |= DWC3_GUSB2PHYCFG_ULPI_UTMI;
-			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(index), reg);
+			dwc3_writel(dwc, DWC3_GUSB2PHYCFG(index), reg);
 		} else {
 			/* Relying on default value. */
 			if (!(reg & DWC3_GUSB2PHYCFG_ULPI_UTMI))
@@ -777,7 +777,7 @@ static int dwc3_hs_phy_setup(struct dwc3 *dwc, int index)
 	if (dwc->ulpi_ext_vbus_drv)
 		reg |= DWC3_GUSB2PHYCFG_ULPIEXTVBUSDRV;
 
-	dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(index), reg);
+	dwc3_writel(dwc, DWC3_GUSB2PHYCFG(index), reg);
 
 	return 0;
 }
@@ -991,15 +991,15 @@ static bool dwc3_core_is_valid(struct dwc3 *dwc)
 {
 	u32 reg;
 
-	reg = dwc3_readl(dwc->regs, DWC3_GSNPSID);
+	reg = dwc3_readl(dwc, DWC3_GSNPSID);
 	dwc->ip = DWC3_GSNPS_ID(reg);
 
 	/* This should read as U3 followed by revision number */
 	if (DWC3_IP_IS(DWC3)) {
 		dwc->revision = reg;
 	} else if (DWC3_IP_IS(DWC31) || DWC3_IP_IS(DWC32)) {
-		dwc->revision = dwc3_readl(dwc->regs, DWC3_VER_NUMBER);
-		dwc->version_type = dwc3_readl(dwc->regs, DWC3_VER_TYPE);
+		dwc->revision = dwc3_readl(dwc, DWC3_VER_NUMBER);
+		dwc->version_type = dwc3_readl(dwc, DWC3_VER_TYPE);
 	} else {
 		return false;
 	}
@@ -1013,7 +1013,7 @@ static void dwc3_core_setup_global_control(struct dwc3 *dwc)
 	unsigned int hw_mode;
 	u32 reg;
 
-	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+	reg = dwc3_readl(dwc, DWC3_GCTL);
 	reg &= ~DWC3_GCTL_SCALEDOWN_MASK;
 	hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
 	power_opt = DWC3_GHWPARAMS1_EN_PWROPT(dwc->hwparams.hwparams1);
@@ -1091,7 +1091,7 @@ static void dwc3_core_setup_global_control(struct dwc3 *dwc)
 	if (DWC3_VER_IS_PRIOR(DWC3, 190A))
 		reg |= DWC3_GCTL_U2RSTECN;
 
-	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+	dwc3_writel(dwc, DWC3_GCTL, reg);
 }
 
 static int dwc3_core_get_phy(struct dwc3 *dwc);
@@ -1111,7 +1111,7 @@ static void dwc3_set_incr_burst_type(struct dwc3 *dwc)
 	int ret;
 	int i;
 
-	cfg = dwc3_readl(dwc->regs, DWC3_GSBUSCFG0);
+	cfg = dwc3_readl(dwc, DWC3_GSBUSCFG0);
 
 	/*
 	 * Handle property "snps,incr-burst-type-adjustment".
@@ -1186,7 +1186,7 @@ static void dwc3_set_incr_burst_type(struct dwc3 *dwc)
 		break;
 	}
 
-	dwc3_writel(dwc->regs, DWC3_GSBUSCFG0, cfg);
+	dwc3_writel(dwc, DWC3_GSBUSCFG0, cfg);
 }
 
 static void dwc3_set_power_down_clk_scale(struct dwc3 *dwc)
@@ -1211,12 +1211,12 @@ static void dwc3_set_power_down_clk_scale(struct dwc3 *dwc)
 	 * (3x or more) to be within the requirement.
 	 */
 	scale = DIV_ROUND_UP(clk_get_rate(dwc->susp_clk), 16000);
-	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+	reg = dwc3_readl(dwc, DWC3_GCTL);
 	if ((reg & DWC3_GCTL_PWRDNSCALE_MASK) < DWC3_GCTL_PWRDNSCALE(scale) ||
 	    (reg & DWC3_GCTL_PWRDNSCALE_MASK) > DWC3_GCTL_PWRDNSCALE(scale*3)) {
 		reg &= ~(DWC3_GCTL_PWRDNSCALE_MASK);
 		reg |= DWC3_GCTL_PWRDNSCALE(scale);
-		dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+		dwc3_writel(dwc, DWC3_GCTL, reg);
 	}
 }
 
@@ -1239,7 +1239,7 @@ static void dwc3_config_threshold(struct dwc3 *dwc)
 		tx_maxburst = dwc->tx_max_burst_prd;
 
 		if (rx_thr_num && rx_maxburst) {
-			reg = dwc3_readl(dwc->regs, DWC3_GRXTHRCFG);
+			reg = dwc3_readl(dwc, DWC3_GRXTHRCFG);
 			reg |= DWC31_RXTHRNUMPKTSEL_PRD;
 
 			reg &= ~DWC31_RXTHRNUMPKT_PRD(~0);
@@ -1248,11 +1248,11 @@ static void dwc3_config_threshold(struct dwc3 *dwc)
 			reg &= ~DWC31_MAXRXBURSTSIZE_PRD(~0);
 			reg |= DWC31_MAXRXBURSTSIZE_PRD(rx_maxburst);
 
-			dwc3_writel(dwc->regs, DWC3_GRXTHRCFG, reg);
+			dwc3_writel(dwc, DWC3_GRXTHRCFG, reg);
 		}
 
 		if (tx_thr_num && tx_maxburst) {
-			reg = dwc3_readl(dwc->regs, DWC3_GTXTHRCFG);
+			reg = dwc3_readl(dwc, DWC3_GTXTHRCFG);
 			reg |= DWC31_TXTHRNUMPKTSEL_PRD;
 
 			reg &= ~DWC31_TXTHRNUMPKT_PRD(~0);
@@ -1261,7 +1261,7 @@ static void dwc3_config_threshold(struct dwc3 *dwc)
 			reg &= ~DWC31_MAXTXBURSTSIZE_PRD(~0);
 			reg |= DWC31_MAXTXBURSTSIZE_PRD(tx_maxburst);
 
-			dwc3_writel(dwc->regs, DWC3_GTXTHRCFG, reg);
+			dwc3_writel(dwc, DWC3_GTXTHRCFG, reg);
 		}
 	}
 
@@ -1272,7 +1272,7 @@ static void dwc3_config_threshold(struct dwc3 *dwc)
 
 	if (DWC3_IP_IS(DWC3)) {
 		if (rx_thr_num && rx_maxburst) {
-			reg = dwc3_readl(dwc->regs, DWC3_GRXTHRCFG);
+			reg = dwc3_readl(dwc, DWC3_GRXTHRCFG);
 			reg |= DWC3_GRXTHRCFG_PKTCNTSEL;
 
 			reg &= ~DWC3_GRXTHRCFG_RXPKTCNT(~0);
@@ -1281,11 +1281,11 @@ static void dwc3_config_threshold(struct dwc3 *dwc)
 			reg &= ~DWC3_GRXTHRCFG_MAXRXBURSTSIZE(~0);
 			reg |= DWC3_GRXTHRCFG_MAXRXBURSTSIZE(rx_maxburst);
 
-			dwc3_writel(dwc->regs, DWC3_GRXTHRCFG, reg);
+			dwc3_writel(dwc, DWC3_GRXTHRCFG, reg);
 		}
 
 		if (tx_thr_num && tx_maxburst) {
-			reg = dwc3_readl(dwc->regs, DWC3_GTXTHRCFG);
+			reg = dwc3_readl(dwc, DWC3_GTXTHRCFG);
 			reg |= DWC3_GTXTHRCFG_PKTCNTSEL;
 
 			reg &= ~DWC3_GTXTHRCFG_TXPKTCNT(~0);
@@ -1294,11 +1294,11 @@ static void dwc3_config_threshold(struct dwc3 *dwc)
 			reg &= ~DWC3_GTXTHRCFG_MAXTXBURSTSIZE(~0);
 			reg |= DWC3_GTXTHRCFG_MAXTXBURSTSIZE(tx_maxburst);
 
-			dwc3_writel(dwc->regs, DWC3_GTXTHRCFG, reg);
+			dwc3_writel(dwc, DWC3_GTXTHRCFG, reg);
 		}
 	} else {
 		if (rx_thr_num && rx_maxburst) {
-			reg = dwc3_readl(dwc->regs, DWC3_GRXTHRCFG);
+			reg = dwc3_readl(dwc, DWC3_GRXTHRCFG);
 			reg |= DWC31_GRXTHRCFG_PKTCNTSEL;
 
 			reg &= ~DWC31_GRXTHRCFG_RXPKTCNT(~0);
@@ -1307,11 +1307,11 @@ static void dwc3_config_threshold(struct dwc3 *dwc)
 			reg &= ~DWC31_GRXTHRCFG_MAXRXBURSTSIZE(~0);
 			reg |= DWC31_GRXTHRCFG_MAXRXBURSTSIZE(rx_maxburst);
 
-			dwc3_writel(dwc->regs, DWC3_GRXTHRCFG, reg);
+			dwc3_writel(dwc, DWC3_GRXTHRCFG, reg);
 		}
 
 		if (tx_thr_num && tx_maxburst) {
-			reg = dwc3_readl(dwc->regs, DWC3_GTXTHRCFG);
+			reg = dwc3_readl(dwc, DWC3_GTXTHRCFG);
 			reg |= DWC31_GTXTHRCFG_PKTCNTSEL;
 
 			reg &= ~DWC31_GTXTHRCFG_TXPKTCNT(~0);
@@ -1320,7 +1320,7 @@ static void dwc3_config_threshold(struct dwc3 *dwc)
 			reg &= ~DWC31_GTXTHRCFG_MAXTXBURSTSIZE(~0);
 			reg |= DWC31_GTXTHRCFG_MAXTXBURSTSIZE(tx_maxburst);
 
-			dwc3_writel(dwc->regs, DWC3_GTXTHRCFG, reg);
+			dwc3_writel(dwc, DWC3_GTXTHRCFG, reg);
 		}
 	}
 }
@@ -1343,7 +1343,7 @@ int dwc3_core_init(struct dwc3 *dwc)
 	 * Write Linux Version Code to our GUID register so it's easy to figure
 	 * out which kernel version a bug was found.
 	 */
-	dwc3_writel(dwc->regs, DWC3_GUID, LINUX_VERSION_CODE);
+	dwc3_writel(dwc, DWC3_GUID, LINUX_VERSION_CODE);
 
 	ret = dwc3_phy_setup(dwc);
 	if (ret)
@@ -1408,9 +1408,9 @@ int dwc3_core_init(struct dwc3 *dwc)
 	 * DWC_usb31 controller.
 	 */
 	if (DWC3_VER_IS_WITHIN(DWC3, 310A, ANY)) {
-		reg = dwc3_readl(dwc->regs, DWC3_GUCTL2);
+		reg = dwc3_readl(dwc, DWC3_GUCTL2);
 		reg |= DWC3_GUCTL2_RST_ACTBITLATER;
-		dwc3_writel(dwc->regs, DWC3_GUCTL2, reg);
+		dwc3_writel(dwc, DWC3_GUCTL2, reg);
 	}
 
 	/*
@@ -1423,9 +1423,9 @@ int dwc3_core_init(struct dwc3 *dwc)
 	 * setting GUCTL2[19] by default; instead, use GUCTL2[19] = 0.
 	 */
 	if (DWC3_VER_IS(DWC3, 320A)) {
-		reg = dwc3_readl(dwc->regs, DWC3_GUCTL2);
+		reg = dwc3_readl(dwc, DWC3_GUCTL2);
 		reg &= ~DWC3_GUCTL2_LC_TIMER;
-		dwc3_writel(dwc->regs, DWC3_GUCTL2, reg);
+		dwc3_writel(dwc, DWC3_GUCTL2, reg);
 	}
 
 	/*
@@ -1438,13 +1438,13 @@ int dwc3_core_init(struct dwc3 *dwc)
 	 * legacy ULPI PHYs.
 	 */
 	if (dwc->resume_hs_terminations) {
-		reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
+		reg = dwc3_readl(dwc, DWC3_GUCTL1);
 		reg |= DWC3_GUCTL1_RESUME_OPMODE_HS_HOST;
-		dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
+		dwc3_writel(dwc, DWC3_GUCTL1, reg);
 	}
 
 	if (!DWC3_VER_IS_PRIOR(DWC3, 250A)) {
-		reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
+		reg = dwc3_readl(dwc, DWC3_GUCTL1);
 
 		/*
 		 * Enable hardware control of sending remote wakeup
@@ -1479,7 +1479,7 @@ int dwc3_core_init(struct dwc3 *dwc)
 				reg &= ~DWC3_GUCTL1_DEV_FORCE_20_CLK_FOR_30_CLK;
 		}
 
-		dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
+		dwc3_writel(dwc, DWC3_GUCTL1, reg);
 	}
 
 	dwc3_config_threshold(dwc);
@@ -1490,9 +1490,9 @@ int dwc3_core_init(struct dwc3 *dwc)
 		int i;
 
 		for (i = 0; i < dwc->num_usb3_ports; i++) {
-			reg = dwc3_readl(dwc->regs, DWC3_LLUCTL(i));
+			reg = dwc3_readl(dwc, DWC3_LLUCTL(i));
 			reg |= DWC3_LLUCTL_FORCE_GEN1;
-			dwc3_writel(dwc->regs, DWC3_LLUCTL(i), reg);
+			dwc3_writel(dwc, DWC3_LLUCTL(i), reg);
 		}
 	}
 
@@ -1511,9 +1511,9 @@ int dwc3_core_init(struct dwc3 *dwc)
 	 * function is available only from version 1.70a.
 	 */
 	if (DWC3_VER_IS_WITHIN(DWC31, 170A, 180A)) {
-		reg = dwc3_readl(dwc->regs, DWC3_GUCTL3);
+		reg = dwc3_readl(dwc, DWC3_GUCTL3);
 		reg |= DWC3_GUCTL3_USB20_RETRY_DISABLE;
-		dwc3_writel(dwc->regs, DWC3_GUCTL3, reg);
+		dwc3_writel(dwc, DWC3_GUCTL3, reg);
 	}
 
 	return 0;
@@ -2437,9 +2437,9 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 	int ret;
 
 	if (!pm_runtime_suspended(dwc->dev) && !PMSG_IS_AUTO(msg)) {
-		dwc->susphy_state = (dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0)) &
+		dwc->susphy_state = (dwc3_readl(dwc, DWC3_GUSB2PHYCFG(0)) &
 				    DWC3_GUSB2PHYCFG_SUSPHY) ||
-				    (dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0)) &
+				    (dwc3_readl(dwc, DWC3_GUSB3PIPECTL(0)) &
 				    DWC3_GUSB3PIPECTL_SUSPHY);
 		/*
 		 * TI AM62 platform requires SUSPHY to be
@@ -2469,10 +2469,10 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		if (dwc->dis_u2_susphy_quirk ||
 		    dwc->dis_enblslpm_quirk) {
 			for (i = 0; i < dwc->num_usb2_ports; i++) {
-				reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(i));
+				reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(i));
 				reg |=  DWC3_GUSB2PHYCFG_ENBLSLPM |
 					DWC3_GUSB2PHYCFG_SUSPHY;
-				dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(i), reg);
+				dwc3_writel(dwc, DWC3_GUSB2PHYCFG(i), reg);
 			}
 
 			/* Give some time for USB2 PHY to suspend */
@@ -2532,14 +2532,14 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		}
 		/* Restore GUSB2PHYCFG bits that were modified in suspend */
 		for (i = 0; i < dwc->num_usb2_ports; i++) {
-			reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(i));
+			reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(i));
 			if (dwc->dis_u2_susphy_quirk)
 				reg &= ~DWC3_GUSB2PHYCFG_SUSPHY;
 
 			if (dwc->dis_enblslpm_quirk)
 				reg &= ~DWC3_GUSB2PHYCFG_ENBLSLPM;
 
-			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(i), reg);
+			dwc3_writel(dwc, DWC3_GUSB2PHYCFG(i), reg);
 		}
 
 		for (i = 0; i < dwc->num_usb2_ports; i++)
@@ -2721,9 +2721,9 @@ void dwc3_pm_complete(struct dwc3 *dwc)
 
 	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST &&
 			dwc->dis_split_quirk) {
-		reg = dwc3_readl(dwc->regs, DWC3_GUCTL3);
+		reg = dwc3_readl(dwc, DWC3_GUCTL3);
 		reg |= DWC3_GUCTL3_SPLITDISABLE;
-		dwc3_writel(dwc->regs, DWC3_GUCTL3, reg);
+		dwc3_writel(dwc, DWC3_GUCTL3, reg);
 	}
 }
 EXPORT_SYMBOL_GPL(dwc3_pm_complete);
diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 0b45ff16f575..ffb1101f55c7 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -296,14 +296,14 @@ static void dwc3_host_lsp(struct seq_file *s)
 
 	reg = DWC3_GDBGLSPMUX_HOSTSELECT(sel);
 
-	dwc3_writel(dwc->regs, DWC3_GDBGLSPMUX, reg);
-	val = dwc3_readl(dwc->regs, DWC3_GDBGLSP);
+	dwc3_writel(dwc, DWC3_GDBGLSPMUX, reg);
+	val = dwc3_readl(dwc, DWC3_GDBGLSP);
 	seq_printf(s, "GDBGLSP[%d] = 0x%08x\n", sel, val);
 
 	if (dbc_enabled && sel < 256) {
 		reg |= DWC3_GDBGLSPMUX_ENDBC;
-		dwc3_writel(dwc->regs, DWC3_GDBGLSPMUX, reg);
-		val = dwc3_readl(dwc->regs, DWC3_GDBGLSP);
+		dwc3_writel(dwc, DWC3_GDBGLSPMUX, reg);
+		val = dwc3_readl(dwc, DWC3_GDBGLSP);
 		seq_printf(s, "GDBGLSP_DBC[%d] = 0x%08x\n", sel, val);
 	}
 }
@@ -316,8 +316,8 @@ static void dwc3_gadget_lsp(struct seq_file *s)
 
 	for (i = 0; i < 16; i++) {
 		reg = DWC3_GDBGLSPMUX_DEVSELECT(i);
-		dwc3_writel(dwc->regs, DWC3_GDBGLSPMUX, reg);
-		reg = dwc3_readl(dwc->regs, DWC3_GDBGLSP);
+		dwc3_writel(dwc, DWC3_GDBGLSPMUX, reg);
+		reg = dwc3_readl(dwc, DWC3_GDBGLSP);
 		seq_printf(s, "GDBGLSP[%d] = 0x%08x\n", i, reg);
 	}
 }
@@ -335,7 +335,7 @@ static int dwc3_lsp_show(struct seq_file *s, void *unused)
 		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
+	reg = dwc3_readl(dwc, DWC3_GSTS);
 	current_mode = DWC3_GSTS_CURMOD(reg);
 
 	switch (current_mode) {
@@ -406,7 +406,7 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
 		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+	reg = dwc3_readl(dwc, DWC3_GCTL);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	mode = DWC3_GCTL_PRTCAP(reg);
@@ -478,7 +478,7 @@ static int dwc3_testmode_show(struct seq_file *s, void *unused)
 		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+	reg = dwc3_readl(dwc, DWC3_DCTL);
 	reg &= DWC3_DCTL_TSTCTRL_MASK;
 	reg >>= 1;
 	spin_unlock_irqrestore(&dwc->lock, flags);
@@ -577,7 +577,7 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
 		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
+	reg = dwc3_readl(dwc, DWC3_GSTS);
 	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
 		seq_puts(s, "Not available\n");
 		spin_unlock_irqrestore(&dwc->lock, flags);
@@ -585,7 +585,7 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
 		return 0;
 	}
 
-	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
+	reg = dwc3_readl(dwc, DWC3_DSTS);
 	state = DWC3_DSTS_USBLNKST(reg);
 	speed = reg & DWC3_DSTS_CONNECTSPD;
 
@@ -639,14 +639,14 @@ static ssize_t dwc3_link_state_write(struct file *file,
 		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
+	reg = dwc3_readl(dwc, DWC3_GSTS);
 	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
 		spin_unlock_irqrestore(&dwc->lock, flags);
 		pm_runtime_put_sync(dwc->dev);
 		return -EINVAL;
 	}
 
-	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
+	reg = dwc3_readl(dwc, DWC3_DSTS);
 	speed = reg & DWC3_DSTS_CONNECTSPD;
 
 	if (speed < DWC3_DSTS_SUPERSPEED &&
@@ -942,10 +942,10 @@ static int dwc3_ep_info_register_show(struct seq_file *s, void *unused)
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = DWC3_GDBGLSPMUX_EPSELECT(dep->number);
-	dwc3_writel(dwc->regs, DWC3_GDBGLSPMUX, reg);
+	dwc3_writel(dwc, DWC3_GDBGLSPMUX, reg);
 
-	lower_32_bits = dwc3_readl(dwc->regs, DWC3_GDBGEPINFO0);
-	upper_32_bits = dwc3_readl(dwc->regs, DWC3_GDBGEPINFO1);
+	lower_32_bits = dwc3_readl(dwc, DWC3_GDBGEPINFO0);
+	upper_32_bits = dwc3_readl(dwc, DWC3_GDBGEPINFO1);
 
 	ep_info = ((u64)upper_32_bits << 32) | lower_32_bits;
 	seq_printf(s, "0x%016llx\n", ep_info);
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 589bbeb27454..9558862d63d8 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -18,25 +18,25 @@
 
 static void dwc3_otg_disable_events(struct dwc3 *dwc, u32 disable_mask)
 {
-	u32 reg = dwc3_readl(dwc->regs, DWC3_OEVTEN);
+	u32 reg = dwc3_readl(dwc, DWC3_OEVTEN);
 
 	reg &= ~(disable_mask);
-	dwc3_writel(dwc->regs, DWC3_OEVTEN, reg);
+	dwc3_writel(dwc, DWC3_OEVTEN, reg);
 }
 
 static void dwc3_otg_enable_events(struct dwc3 *dwc, u32 enable_mask)
 {
-	u32 reg = dwc3_readl(dwc->regs, DWC3_OEVTEN);
+	u32 reg = dwc3_readl(dwc, DWC3_OEVTEN);
 
 	reg |= (enable_mask);
-	dwc3_writel(dwc->regs, DWC3_OEVTEN, reg);
+	dwc3_writel(dwc, DWC3_OEVTEN, reg);
 }
 
 static void dwc3_otg_clear_events(struct dwc3 *dwc)
 {
-	u32 reg = dwc3_readl(dwc->regs, DWC3_OEVT);
+	u32 reg = dwc3_readl(dwc, DWC3_OEVT);
 
-	dwc3_writel(dwc->regs, DWC3_OEVTEN, reg);
+	dwc3_writel(dwc, DWC3_OEVTEN, reg);
 }
 
 #define DWC3_OTG_ALL_EVENTS	(DWC3_OEVTEN_XHCIRUNSTPSETEN | \
@@ -72,18 +72,18 @@ static irqreturn_t dwc3_otg_irq(int irq, void *_dwc)
 	struct dwc3 *dwc = _dwc;
 	irqreturn_t ret = IRQ_NONE;
 
-	reg = dwc3_readl(dwc->regs, DWC3_OEVT);
+	reg = dwc3_readl(dwc, DWC3_OEVT);
 	if (reg) {
 		/* ignore non OTG events, we can't disable them in OEVTEN */
 		if (!(reg & DWC3_OTG_ALL_EVENTS)) {
-			dwc3_writel(dwc->regs, DWC3_OEVT, reg);
+			dwc3_writel(dwc, DWC3_OEVT, reg);
 			return IRQ_NONE;
 		}
 
 		if (dwc->current_otg_role == DWC3_OTG_ROLE_HOST &&
 		    !(reg & DWC3_OEVT_DEVICEMODE))
 			dwc->otg_restart_host = true;
-		dwc3_writel(dwc->regs, DWC3_OEVT, reg);
+		dwc3_writel(dwc, DWC3_OEVT, reg);
 		ret = IRQ_WAKE_THREAD;
 	}
 
@@ -100,23 +100,23 @@ static void dwc3_otgregs_init(struct dwc3 *dwc)
 	 * the signal outputs sent to the PHY, the OTG FSM logic of the
 	 * core and also the resets to the VBUS filters inside the core.
 	 */
-	reg = dwc3_readl(dwc->regs, DWC3_OCFG);
+	reg = dwc3_readl(dwc, DWC3_OCFG);
 	reg |= DWC3_OCFG_SFTRSTMASK;
-	dwc3_writel(dwc->regs, DWC3_OCFG, reg);
+	dwc3_writel(dwc, DWC3_OCFG, reg);
 
 	/* Disable hibernation for simplicity */
-	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+	reg = dwc3_readl(dwc, DWC3_GCTL);
 	reg &= ~DWC3_GCTL_GBLHIBERNATIONEN;
-	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+	dwc3_writel(dwc, DWC3_GCTL, reg);
 
 	/*
 	 * Initialize OTG registers as per
 	 * Figure 11-4 OTG Driver Overall Programming Flow
 	 */
 	/* OCFG.SRPCap = 0, OCFG.HNPCap = 0 */
-	reg = dwc3_readl(dwc->regs, DWC3_OCFG);
+	reg = dwc3_readl(dwc, DWC3_OCFG);
 	reg &= ~(DWC3_OCFG_SRPCAP | DWC3_OCFG_HNPCAP);
-	dwc3_writel(dwc->regs, DWC3_OCFG, reg);
+	dwc3_writel(dwc, DWC3_OCFG, reg);
 	/* OEVT = FFFF */
 	dwc3_otg_clear_events(dwc);
 	/* OEVTEN = 0 */
@@ -127,11 +127,11 @@ static void dwc3_otgregs_init(struct dwc3 *dwc)
 	 * OCTL.PeriMode = 1, OCTL.DevSetHNPEn = 0, OCTL.HstSetHNPEn = 0,
 	 * OCTL.HNPReq = 0
 	 */
-	reg = dwc3_readl(dwc->regs, DWC3_OCTL);
+	reg = dwc3_readl(dwc, DWC3_OCTL);
 	reg |= DWC3_OCTL_PERIMODE;
 	reg &= ~(DWC3_OCTL_DEVSETHNPEN | DWC3_OCTL_HSTSETHNPEN |
 		 DWC3_OCTL_HNPREQ);
-	dwc3_writel(dwc->regs, DWC3_OCTL, reg);
+	dwc3_writel(dwc, DWC3_OCTL, reg);
 }
 
 static int dwc3_otg_get_irq(struct dwc3 *dwc)
@@ -175,9 +175,9 @@ void dwc3_otg_init(struct dwc3 *dwc)
 	/* GCTL.PrtCapDir=2'b11 */
 	dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_OTG, true);
 	/* GUSB2PHYCFG0.SusPHY=0 */
-	reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
+	reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(0));
 	reg &= ~DWC3_GUSB2PHYCFG_SUSPHY;
-	dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
+	dwc3_writel(dwc, DWC3_GUSB2PHYCFG(0), reg);
 
 	/* Initialize OTG registers */
 	dwc3_otgregs_init(dwc);
@@ -203,17 +203,17 @@ void dwc3_otg_host_init(struct dwc3 *dwc)
 	 * OCTL.PeriMode=0, OCTL.TermSelDLPulse = 0,
 	 * OCTL.DevSetHNPEn = 0, OCTL.HstSetHNPEn = 0
 	 */
-	reg = dwc3_readl(dwc->regs, DWC3_OCTL);
+	reg = dwc3_readl(dwc, DWC3_OCTL);
 	reg &= ~(DWC3_OCTL_PERIMODE | DWC3_OCTL_TERMSELIDPULSE |
 			DWC3_OCTL_DEVSETHNPEN | DWC3_OCTL_HSTSETHNPEN);
-	dwc3_writel(dwc->regs, DWC3_OCTL, reg);
+	dwc3_writel(dwc, DWC3_OCTL, reg);
 
 	/*
 	 * OCFG.DisPrtPwrCutoff = 0/1
 	 */
-	reg = dwc3_readl(dwc->regs, DWC3_OCFG);
+	reg = dwc3_readl(dwc, DWC3_OCFG);
 	reg &= ~DWC3_OCFG_DISPWRCUTTOFF;
-	dwc3_writel(dwc->regs, DWC3_OCFG, reg);
+	dwc3_writel(dwc, DWC3_OCFG, reg);
 
 	/*
 	 * OCFG.SRPCap = 1, OCFG.HNPCap = GHWPARAMS6.HNP_CAP
@@ -229,15 +229,15 @@ void dwc3_otg_host_init(struct dwc3 *dwc)
 
 	/* GUSB2PHYCFG.ULPIAutoRes = 1/0, GUSB2PHYCFG.SusPHY = 1 */
 	if (!dwc->dis_u2_susphy_quirk) {
-		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
+		reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(0));
 		reg |= DWC3_GUSB2PHYCFG_SUSPHY;
-		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
+		dwc3_writel(dwc, DWC3_GUSB2PHYCFG(0), reg);
 	}
 
 	/* Set Port Power to enable VBUS: OCTL.PrtPwrCtl = 1 */
-	reg = dwc3_readl(dwc->regs, DWC3_OCTL);
+	reg = dwc3_readl(dwc, DWC3_OCTL);
 	reg |= DWC3_OCTL_PRTPWRCTL;
-	dwc3_writel(dwc->regs, DWC3_OCTL, reg);
+	dwc3_writel(dwc, DWC3_OCTL, reg);
 }
 
 /* should be called after Host controller driver is stopped */
@@ -258,9 +258,9 @@ static void dwc3_otg_host_exit(struct dwc3 *dwc)
 	 */
 
 	/* OCTL.HstSetHNPEn = 0, OCTL.PrtPwrCtl=0 */
-	reg = dwc3_readl(dwc->regs, DWC3_OCTL);
+	reg = dwc3_readl(dwc, DWC3_OCTL);
 	reg &= ~(DWC3_OCTL_HSTSETHNPEN | DWC3_OCTL_PRTPWRCTL);
-	dwc3_writel(dwc->regs, DWC3_OCTL, reg);
+	dwc3_writel(dwc, DWC3_OCTL, reg);
 }
 
 /* should be called before the gadget controller driver is started */
@@ -274,27 +274,27 @@ static void dwc3_otg_device_init(struct dwc3 *dwc)
 	 * OCFG.HNPCap = GHWPARAMS6.HNP_CAP, OCFG.SRPCap = 1
 	 * but we keep them 0 for simple dual-role operation.
 	 */
-	reg = dwc3_readl(dwc->regs, DWC3_OCFG);
+	reg = dwc3_readl(dwc, DWC3_OCFG);
 	/* OCFG.OTGSftRstMsk = 0/1 */
 	reg |= DWC3_OCFG_SFTRSTMASK;
-	dwc3_writel(dwc->regs, DWC3_OCFG, reg);
+	dwc3_writel(dwc, DWC3_OCFG, reg);
 	/*
 	 * OCTL.PeriMode = 1
 	 * OCTL.TermSelDLPulse = 0/1, OCTL.HNPReq = 0
 	 * OCTL.DevSetHNPEn = 0, OCTL.HstSetHNPEn = 0
 	 */
-	reg = dwc3_readl(dwc->regs, DWC3_OCTL);
+	reg = dwc3_readl(dwc, DWC3_OCTL);
 	reg |= DWC3_OCTL_PERIMODE;
 	reg &= ~(DWC3_OCTL_TERMSELIDPULSE | DWC3_OCTL_HNPREQ |
 			DWC3_OCTL_DEVSETHNPEN | DWC3_OCTL_HSTSETHNPEN);
-	dwc3_writel(dwc->regs, DWC3_OCTL, reg);
+	dwc3_writel(dwc, DWC3_OCTL, reg);
 	/* OEVTEN.OTGBDevSesVldDetEvntEn = 1 */
 	dwc3_otg_enable_events(dwc, DWC3_OEVTEN_BDEVSESSVLDDETEN);
 	/* GUSB2PHYCFG.ULPIAutoRes = 0, GUSB2PHYCFG0.SusPHY = 1 */
 	if (!dwc->dis_u2_susphy_quirk) {
-		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
+		reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(0));
 		reg |= DWC3_GUSB2PHYCFG_SUSPHY;
-		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
+		dwc3_writel(dwc, DWC3_GUSB2PHYCFG(0), reg);
 	}
 	/* GCTL.GblHibernationEn = 0. Already 0. */
 }
@@ -319,10 +319,10 @@ static void dwc3_otg_device_exit(struct dwc3 *dwc)
 				DWC3_OEVTEN_BDEVBHOSTENDEN);
 
 	/* OCTL.DevSetHNPEn = 0, OCTL.HNPReq = 0, OCTL.PeriMode=1 */
-	reg = dwc3_readl(dwc->regs, DWC3_OCTL);
+	reg = dwc3_readl(dwc, DWC3_OCTL);
 	reg &= ~(DWC3_OCTL_DEVSETHNPEN | DWC3_OCTL_HNPREQ);
 	reg |= DWC3_OCTL_PERIMODE;
-	dwc3_writel(dwc->regs, DWC3_OCTL, reg);
+	dwc3_writel(dwc, DWC3_OCTL, reg);
 }
 
 void dwc3_otg_update(struct dwc3 *dwc, bool ignore_idstatus)
@@ -341,7 +341,7 @@ void dwc3_otg_update(struct dwc3 *dwc, bool ignore_idstatus)
 		return;
 
 	if (!ignore_idstatus) {
-		reg = dwc3_readl(dwc->regs, DWC3_OSTS);
+		reg = dwc3_readl(dwc, DWC3_OSTS);
 		id = !!(reg & DWC3_OSTS_CONIDSTS);
 
 		dwc->desired_otg_role = id ? DWC3_OTG_ROLE_DEVICE :
diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index e0bad5708664..a8ff8db610d3 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -361,7 +361,7 @@ static int dwc3_ep0_handle_status(struct dwc3 *dwc,
 
 		if ((dwc->speed == DWC3_DSTS_SUPERSPEED) ||
 		    (dwc->speed == DWC3_DSTS_SUPERSPEED_PLUS)) {
-			reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+			reg = dwc3_readl(dwc, DWC3_DCTL);
 			if (reg & DWC3_DCTL_INITU1ENA)
 				usb_status |= 1 << USB_DEV_STAT_U1_ENABLED;
 			if (reg & DWC3_DCTL_INITU2ENA)
@@ -417,12 +417,12 @@ static int dwc3_ep0_handle_u1(struct dwc3 *dwc, enum usb_device_state state,
 	if (set && dwc->dis_u1_entry_quirk)
 		return -EINVAL;
 
-	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+	reg = dwc3_readl(dwc, DWC3_DCTL);
 	if (set)
 		reg |= DWC3_DCTL_INITU1ENA;
 	else
 		reg &= ~DWC3_DCTL_INITU1ENA;
-	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+	dwc3_writel(dwc, DWC3_DCTL, reg);
 
 	return 0;
 }
@@ -441,12 +441,12 @@ static int dwc3_ep0_handle_u2(struct dwc3 *dwc, enum usb_device_state state,
 	if (set && dwc->dis_u2_entry_quirk)
 		return -EINVAL;
 
-	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+	reg = dwc3_readl(dwc, DWC3_DCTL);
 	if (set)
 		reg |= DWC3_DCTL_INITU2ENA;
 	else
 		reg &= ~DWC3_DCTL_INITU2ENA;
-	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+	dwc3_writel(dwc, DWC3_DCTL, reg);
 
 	return 0;
 }
@@ -612,10 +612,10 @@ static int dwc3_ep0_set_address(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
 		return -EINVAL;
 	}
 
-	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+	reg = dwc3_readl(dwc, DWC3_DCFG);
 	reg &= ~(DWC3_DCFG_DEVADDR_MASK);
 	reg |= DWC3_DCFG_DEVADDR(addr);
-	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+	dwc3_writel(dwc, DWC3_DCFG, reg);
 
 	if (addr)
 		usb_gadget_set_state(dwc->gadget, USB_STATE_ADDRESS);
@@ -672,12 +672,12 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
 			 * Enable transition to U1/U2 state when
 			 * nothing is pending from application.
 			 */
-			reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+			reg = dwc3_readl(dwc, DWC3_DCTL);
 			if (!dwc->dis_u1_entry_quirk)
 				reg |= DWC3_DCTL_ACCEPTU1ENA;
 			if (!dwc->dis_u2_entry_quirk)
 				reg |= DWC3_DCTL_ACCEPTU2ENA;
-			dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+			dwc3_writel(dwc, DWC3_DCTL, reg);
 		}
 		break;
 
@@ -717,7 +717,7 @@ static void dwc3_ep0_set_sel_cmpl(struct usb_ep *ep, struct usb_request *req)
 	dwc->u2sel = le16_to_cpu(timing.u2sel);
 	dwc->u2pel = le16_to_cpu(timing.u2pel);
 
-	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+	reg = dwc3_readl(dwc, DWC3_DCTL);
 	if (reg & DWC3_DCTL_INITU2ENA)
 		param = dwc->u2pel;
 	if (reg & DWC3_DCTL_INITU1ENA)
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index f08560af1701..a85ba5ca7912 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -42,7 +42,7 @@ int dwc3_gadget_set_test_mode(struct dwc3 *dwc, int mode)
 {
 	u32		reg;
 
-	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+	reg = dwc3_readl(dwc, DWC3_DCTL);
 	reg &= ~DWC3_DCTL_TSTCTRL_MASK;
 
 	switch (mode) {
@@ -73,7 +73,7 @@ int dwc3_gadget_get_link_state(struct dwc3 *dwc)
 {
 	u32		reg;
 
-	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
+	reg = dwc3_readl(dwc, DWC3_DSTS);
 
 	return DWC3_DSTS_USBLNKST(reg);
 }
@@ -97,7 +97,7 @@ int dwc3_gadget_set_link_state(struct dwc3 *dwc, enum dwc3_link_state state)
 	 */
 	if (!DWC3_VER_IS_PRIOR(DWC3, 194A)) {
 		while (--retries) {
-			reg = dwc3_readl(dwc->regs, DWC3_DSTS);
+			reg = dwc3_readl(dwc, DWC3_DSTS);
 			if (reg & DWC3_DSTS_DCNRD)
 				udelay(5);
 			else
@@ -108,15 +108,15 @@ int dwc3_gadget_set_link_state(struct dwc3 *dwc, enum dwc3_link_state state)
 			return -ETIMEDOUT;
 	}
 
-	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+	reg = dwc3_readl(dwc, DWC3_DCTL);
 	reg &= ~DWC3_DCTL_ULSTCHNGREQ_MASK;
 
 	/* set no action before sending new link state change */
-	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+	dwc3_writel(dwc, DWC3_DCTL, reg);
 
 	/* set requested state */
 	reg |= DWC3_DCTL_ULSTCHNGREQ(state);
-	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+	dwc3_writel(dwc, DWC3_DCTL, reg);
 
 	/*
 	 * The following code is racy when called from dwc3_gadget_wakeup,
@@ -128,7 +128,7 @@ int dwc3_gadget_set_link_state(struct dwc3 *dwc, enum dwc3_link_state state)
 	/* wait for a change in DSTS */
 	retries = 10000;
 	while (--retries) {
-		reg = dwc3_readl(dwc->regs, DWC3_DSTS);
+		reg = dwc3_readl(dwc, DWC3_DSTS);
 
 		if (DWC3_DSTS_USBLNKST(reg) == state)
 			return 0;
@@ -260,11 +260,11 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
 	int		ret = 0;
 	u32		reg;
 
-	dwc3_writel(dwc->regs, DWC3_DGCMDPAR, param);
-	dwc3_writel(dwc->regs, DWC3_DGCMD, cmd | DWC3_DGCMD_CMDACT);
+	dwc3_writel(dwc, DWC3_DGCMDPAR, param);
+	dwc3_writel(dwc, DWC3_DGCMD, cmd | DWC3_DGCMD_CMDACT);
 
 	do {
-		reg = dwc3_readl(dwc->regs, DWC3_DGCMD);
+		reg = dwc3_readl(dwc, DWC3_DGCMD);
 		if (!(reg & DWC3_DGCMD_CMDACT)) {
 			status = DWC3_DGCMD_STATUS(reg);
 			if (status)
@@ -334,7 +334,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 	 */
 	if (dwc->gadget->speed <= USB_SPEED_HIGH ||
 	    DWC3_DEPCMD_CMD(cmd) == DWC3_DEPCMD_ENDTRANSFER) {
-		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
+		reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(0));
 		if (unlikely(reg & DWC3_GUSB2PHYCFG_SUSPHY)) {
 			saved_config |= DWC3_GUSB2PHYCFG_SUSPHY;
 			reg &= ~DWC3_GUSB2PHYCFG_SUSPHY;
@@ -346,7 +346,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 		}
 
 		if (saved_config)
-			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
+			dwc3_writel(dwc, DWC3_GUSB2PHYCFG(0), reg);
 	}
 
 	/*
@@ -356,9 +356,9 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 	 * improve performance.
 	 */
 	if (DWC3_DEPCMD_CMD(cmd) != DWC3_DEPCMD_UPDATETRANSFER) {
-		dwc3_writel(dwc->regs, DWC3_DEPCMDPAR0(epnum), params->param0);
-		dwc3_writel(dwc->regs, DWC3_DEPCMDPAR1(epnum), params->param1);
-		dwc3_writel(dwc->regs, DWC3_DEPCMDPAR2(epnum), params->param2);
+		dwc3_writel(dwc, DWC3_DEPCMDPAR0(epnum), params->param0);
+		dwc3_writel(dwc, DWC3_DEPCMDPAR1(epnum), params->param1);
+		dwc3_writel(dwc, DWC3_DEPCMDPAR2(epnum), params->param2);
 	}
 
 	/*
@@ -382,7 +382,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 	else
 		cmd |= DWC3_DEPCMD_CMDACT;
 
-	dwc3_writel(dwc->regs, DWC3_DEPCMD(epnum), cmd);
+	dwc3_writel(dwc, DWC3_DEPCMD(epnum), cmd);
 
 	if (!(cmd & DWC3_DEPCMD_CMDACT) ||
 		(DWC3_DEPCMD_CMD(cmd) == DWC3_DEPCMD_ENDTRANSFER &&
@@ -392,7 +392,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 	}
 
 	do {
-		reg = dwc3_readl(dwc->regs, DWC3_DEPCMD(epnum));
+		reg = dwc3_readl(dwc, DWC3_DEPCMD(epnum));
 		if (!(reg & DWC3_DEPCMD_CMDACT)) {
 			cmd_status = DWC3_DEPCMD_STATUS(reg);
 
@@ -448,9 +448,9 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 		mdelay(1);
 
 	if (saved_config) {
-		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
+		reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(0));
 		reg |= saved_config;
-		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
+		dwc3_writel(dwc, DWC3_GUSB2PHYCFG(0), reg);
 	}
 
 	return ret;
@@ -727,7 +727,7 @@ static int dwc3_gadget_calc_ram_depth(struct dwc3 *dwc)
 		u32 reg;
 
 		/* Check if TXFIFOs start at non-zero addr */
-		reg = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
+		reg = dwc3_readl(dwc, DWC3_GTXFIFOSIZ(0));
 		fifo_0_start = DWC3_GTXFIFOSIZ_TXFSTADDR(reg);
 
 		ram_depth -= (fifo_0_start >> 16);
@@ -755,7 +755,7 @@ void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
 
 	/* Read ep0IN related TXFIFO size */
 	dep = dwc->eps[1];
-	size = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
+	size = dwc3_readl(dwc, DWC3_GTXFIFOSIZ(0));
 	if (DWC3_IP_IS(DWC3))
 		fifo_depth = DWC3_GTXFIFOSIZ_TXFDEP(size);
 	else
@@ -770,10 +770,10 @@ void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
 
 		/* Don't change TXFRAMNUM on usb31 version */
 		size = DWC3_IP_IS(DWC3) ? 0 :
-			dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1)) &
+			dwc3_readl(dwc, DWC3_GTXFIFOSIZ(num >> 1)) &
 				   DWC31_GTXFIFOSIZ_TXFRAMNUM;
 
-		dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1), size);
+		dwc3_writel(dwc, DWC3_GTXFIFOSIZ(num >> 1), size);
 		dep->flags &= ~DWC3_EP_TXFIFO_RESIZED;
 	}
 	dwc->num_ep_resized = 0;
@@ -876,7 +876,7 @@ static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
 	fifo_size++;
 
 	/* Check if TXFIFOs start at non-zero addr */
-	tmp = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
+	tmp = dwc3_readl(dwc, DWC3_GTXFIFOSIZ(0));
 	fifo_0_start = DWC3_GTXFIFOSIZ_TXFSTADDR(tmp);
 
 	fifo_size |= (fifo_0_start + (dwc->last_fifo_depth << 16));
@@ -899,7 +899,7 @@ static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
 		return -ENOMEM;
 	}
 
-	dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1), fifo_size);
+	dwc3_writel(dwc, DWC3_GTXFIFOSIZ(dep->number >> 1), fifo_size);
 	dep->flags |= DWC3_EP_TXFIFO_RESIZED;
 	dwc->num_ep_resized++;
 
@@ -943,9 +943,9 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
 		dep->type = usb_endpoint_type(desc);
 		dep->flags |= DWC3_EP_ENABLED;
 
-		reg = dwc3_readl(dwc->regs, DWC3_DALEPENA);
+		reg = dwc3_readl(dwc, DWC3_DALEPENA);
 		reg |= DWC3_DALEPENA_EP(dep->number);
-		dwc3_writel(dwc->regs, DWC3_DALEPENA, reg);
+		dwc3_writel(dwc, DWC3_DALEPENA, reg);
 
 		dep->trb_dequeue = 0;
 		dep->trb_enqueue = 0;
@@ -1080,9 +1080,9 @@ static int __dwc3_gadget_ep_disable(struct dwc3_ep *dep)
 	if (dep->flags & DWC3_EP_STALL)
 		__dwc3_gadget_ep_set_halt(dep, 0, false);
 
-	reg = dwc3_readl(dwc->regs, DWC3_DALEPENA);
+	reg = dwc3_readl(dwc, DWC3_DALEPENA);
 	reg &= ~DWC3_DALEPENA_EP(dep->number);
-	dwc3_writel(dwc->regs, DWC3_DALEPENA, reg);
+	dwc3_writel(dwc, DWC3_DALEPENA, reg);
 
 	dwc3_remove_requests(dwc, dep, -ESHUTDOWN);
 
@@ -1743,7 +1743,7 @@ static int __dwc3_gadget_get_frame(struct dwc3 *dwc)
 {
 	u32			reg;
 
-	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
+	reg = dwc3_readl(dwc, DWC3_DSTS);
 	return DWC3_DSTS_SOFFN(reg);
 }
 
@@ -2351,13 +2351,13 @@ static void dwc3_gadget_enable_linksts_evts(struct dwc3 *dwc, bool set)
 	if (DWC3_VER_IS_PRIOR(DWC3, 250A))
 		return;
 
-	reg = dwc3_readl(dwc->regs, DWC3_DEVTEN);
+	reg = dwc3_readl(dwc, DWC3_DEVTEN);
 	if (set)
 		reg |= DWC3_DEVTEN_ULSTCNGEN;
 	else
 		reg &= ~DWC3_DEVTEN_ULSTCNGEN;
 
-	dwc3_writel(dwc->regs, DWC3_DEVTEN, reg);
+	dwc3_writel(dwc, DWC3_DEVTEN, reg);
 }
 
 static int dwc3_gadget_get_frame(struct usb_gadget *g)
@@ -2380,7 +2380,7 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
 	 *
 	 * We can check that via USB Link State bits in DSTS register.
 	 */
-	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
+	reg = dwc3_readl(dwc, DWC3_DSTS);
 
 	link_state = DWC3_DSTS_USBLNKST(reg);
 
@@ -2408,9 +2408,9 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
 	/* Recent versions do this automatically */
 	if (DWC3_VER_IS_PRIOR(DWC3, 194A)) {
 		/* write zeroes to Link Change Request */
-		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+		reg = dwc3_readl(dwc, DWC3_DCTL);
 		reg &= ~DWC3_DCTL_ULSTCHNGREQ_MASK;
-		dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+		dwc3_writel(dwc, DWC3_DCTL, reg);
 	}
 
 	/*
@@ -2530,7 +2530,7 @@ static void __dwc3_gadget_set_ssp_rate(struct dwc3 *dwc)
 	if (ssp_rate == USB_SSP_GEN_UNKNOWN)
 		ssp_rate = dwc->max_ssp_rate;
 
-	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+	reg = dwc3_readl(dwc, DWC3_DCFG);
 	reg &= ~DWC3_DCFG_SPEED_MASK;
 	reg &= ~DWC3_DCFG_NUMLANES(~0);
 
@@ -2543,7 +2543,7 @@ static void __dwc3_gadget_set_ssp_rate(struct dwc3 *dwc)
 	    dwc->max_ssp_rate != USB_SSP_GEN_2x1)
 		reg |= DWC3_DCFG_NUMLANES(1);
 
-	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+	dwc3_writel(dwc, DWC3_DCFG, reg);
 }
 
 static void __dwc3_gadget_set_speed(struct dwc3 *dwc)
@@ -2561,7 +2561,7 @@ static void __dwc3_gadget_set_speed(struct dwc3 *dwc)
 		return;
 	}
 
-	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+	reg = dwc3_readl(dwc, DWC3_DCFG);
 	reg &= ~(DWC3_DCFG_SPEED_MASK);
 
 	/*
@@ -2612,7 +2612,7 @@ static void __dwc3_gadget_set_speed(struct dwc3 *dwc)
 	    speed < USB_SPEED_SUPER_PLUS)
 		reg &= ~DWC3_DCFG_NUMLANES(~0);
 
-	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+	dwc3_writel(dwc, DWC3_DCFG, reg);
 }
 
 static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on)
@@ -2637,7 +2637,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on)
 	 * mentioned in the dwc3 programming guide. It has been tested on an
 	 * Exynos platforms.
 	 */
-	reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
+	reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(0));
 	if (reg & DWC3_GUSB2PHYCFG_SUSPHY) {
 		saved_config |= DWC3_GUSB2PHYCFG_SUSPHY;
 		reg &= ~DWC3_GUSB2PHYCFG_SUSPHY;
@@ -2649,9 +2649,9 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on)
 	}
 
 	if (saved_config)
-		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
+		dwc3_writel(dwc, DWC3_GUSB2PHYCFG(0), reg);
 
-	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+	reg = dwc3_readl(dwc, DWC3_DCTL);
 	if (is_on) {
 		if (DWC3_VER_IS_WITHIN(DWC3, ANY, 187A)) {
 			reg &= ~DWC3_DCTL_TRGTULST_MASK;
@@ -2675,14 +2675,14 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on)
 
 	do {
 		usleep_range(1000, 2000);
-		reg = dwc3_readl(dwc->regs, DWC3_DSTS);
+		reg = dwc3_readl(dwc, DWC3_DSTS);
 		reg &= DWC3_DSTS_DEVCTRLHLT;
 	} while (--timeout && !(!is_on ^ !reg));
 
 	if (saved_config) {
-		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
+		reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(0));
 		reg |= saved_config;
-		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
+		dwc3_writel(dwc, DWC3_GUSB2PHYCFG(0), reg);
 	}
 
 	if (!timeout)
@@ -2858,13 +2858,13 @@ static void dwc3_gadget_enable_irq(struct dwc3 *dwc)
 	if (!DWC3_VER_IS_PRIOR(DWC3, 230A))
 		reg |= DWC3_DEVTEN_U3L2L1SUSPEN;
 
-	dwc3_writel(dwc->regs, DWC3_DEVTEN, reg);
+	dwc3_writel(dwc, DWC3_DEVTEN, reg);
 }
 
 static void dwc3_gadget_disable_irq(struct dwc3 *dwc)
 {
 	/* mask all interrupts */
-	dwc3_writel(dwc->regs, DWC3_DEVTEN, 0x00);
+	dwc3_writel(dwc, DWC3_DEVTEN, 0x00);
 }
 
 static irqreturn_t dwc3_interrupt(int irq, void *_dwc);
@@ -2905,10 +2905,10 @@ static void dwc3_gadget_setup_nump(struct dwc3 *dwc)
 	nump = min_t(u32, nump, 16);
 
 	/* update NumP */
-	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+	reg = dwc3_readl(dwc, DWC3_DCFG);
 	reg &= ~DWC3_DCFG_NUMP_MASK;
 	reg |= nump << DWC3_DCFG_NUMP_SHIFT;
-	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+	dwc3_writel(dwc, DWC3_DCFG, reg);
 }
 
 static int __dwc3_gadget_start(struct dwc3 *dwc)
@@ -2922,10 +2922,10 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
 	 * the core supports IMOD, disable it.
 	 */
 	if (dwc->imod_interval) {
-		dwc3_writel(dwc->regs, DWC3_DEV_IMOD(0), dwc->imod_interval);
-		dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), DWC3_GEVNTCOUNT_EHB);
+		dwc3_writel(dwc, DWC3_DEV_IMOD(0), dwc->imod_interval);
+		dwc3_writel(dwc, DWC3_GEVNTCOUNT(0), DWC3_GEVNTCOUNT_EHB);
 	} else if (dwc3_has_imod(dwc)) {
-		dwc3_writel(dwc->regs, DWC3_DEV_IMOD(0), 0);
+		dwc3_writel(dwc, DWC3_DEV_IMOD(0), 0);
 	}
 
 	/*
@@ -2935,13 +2935,13 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
 	 * This way, we maximize the chances that we'll be able to get several
 	 * bursts of data without going through any sort of endpoint throttling.
 	 */
-	reg = dwc3_readl(dwc->regs, DWC3_GRXTHRCFG);
+	reg = dwc3_readl(dwc, DWC3_GRXTHRCFG);
 	if (DWC3_IP_IS(DWC3))
 		reg &= ~DWC3_GRXTHRCFG_PKTCNTSEL;
 	else
 		reg &= ~DWC31_GRXTHRCFG_PKTCNTSEL;
 
-	dwc3_writel(dwc->regs, DWC3_GRXTHRCFG, reg);
+	dwc3_writel(dwc, DWC3_GRXTHRCFG, reg);
 
 	dwc3_gadget_setup_nump(dwc);
 
@@ -2952,15 +2952,15 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
 	 * ACK with NumP=0 and PP=0 (for IN direction). This slightly improves
 	 * the stream performance.
 	 */
-	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+	reg = dwc3_readl(dwc, DWC3_DCFG);
 	reg |= DWC3_DCFG_IGNSTRMPP;
-	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+	dwc3_writel(dwc, DWC3_DCFG, reg);
 
 	/* Enable MST by default if the device is capable of MST */
 	if (DWC3_MST_CAPABLE(&dwc->hwparams)) {
-		reg = dwc3_readl(dwc->regs, DWC3_DCFG1);
+		reg = dwc3_readl(dwc, DWC3_DCFG1);
 		reg &= ~DWC3_DCFG1_DIS_MST_ENH;
-		dwc3_writel(dwc->regs, DWC3_DCFG1, reg);
+		dwc3_writel(dwc, DWC3_DCFG1, reg);
 	}
 
 	/* Start with SuperSpeed Default */
@@ -3240,7 +3240,7 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 	/* MDWIDTH is represented in bits, we need it in bytes */
 	mdwidth /= 8;
 
-	size = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1));
+	size = dwc3_readl(dwc, DWC3_GTXFIFOSIZ(dep->number >> 1));
 	if (DWC3_IP_IS(DWC3))
 		size = DWC3_GTXFIFOSIZ_TXFDEP(size);
 	else
@@ -3289,7 +3289,7 @@ static int dwc3_gadget_init_out_endpoint(struct dwc3_ep *dep)
 	mdwidth /= 8;
 
 	/* All OUT endpoints share a single RxFIFO space */
-	size = dwc3_readl(dwc->regs, DWC3_GRXFIFOSIZ(0));
+	size = dwc3_readl(dwc, DWC3_GRXFIFOSIZ(0));
 	if (DWC3_IP_IS(DWC3))
 		size = DWC3_GRXFIFOSIZ_RXFDEP(size);
 	else
@@ -3742,9 +3742,9 @@ static bool dwc3_gadget_endpoint_trbs_complete(struct dwc3_ep *dep,
 				return no_started_trb;
 		}
 
-		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+		reg = dwc3_readl(dwc, DWC3_DCTL);
 		reg |= dwc->u1u2;
-		dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+		dwc3_writel(dwc, DWC3_DCTL, reg);
 
 		dwc->u1u2 = 0;
 	}
@@ -4074,7 +4074,7 @@ static void dwc3_gadget_disconnect_interrupt(struct dwc3 *dwc)
 
 	dwc3_gadget_set_link_state(dwc, DWC3_LINK_STATE_RX_DET);
 
-	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+	reg = dwc3_readl(dwc, DWC3_DCTL);
 	reg &= ~DWC3_DCTL_INITU1ENA;
 	reg &= ~DWC3_DCTL_INITU2ENA;
 	dwc3_gadget_dctl_write_safe(dwc, reg);
@@ -4163,7 +4163,7 @@ static void dwc3_gadget_reset_interrupt(struct dwc3 *dwc)
 	dwc3_stop_active_transfers(dwc);
 	dwc->connected = true;
 
-	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+	reg = dwc3_readl(dwc, DWC3_DCTL);
 	reg &= ~DWC3_DCTL_TSTCTRL_MASK;
 	dwc3_gadget_dctl_write_safe(dwc, reg);
 	dwc->test_mode = false;
@@ -4172,9 +4172,9 @@ static void dwc3_gadget_reset_interrupt(struct dwc3 *dwc)
 	dwc3_clear_stall_all_ep(dwc);
 
 	/* Reset device address to zero */
-	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+	reg = dwc3_readl(dwc, DWC3_DCFG);
 	reg &= ~(DWC3_DCFG_DEVADDR_MASK);
-	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+	dwc3_writel(dwc, DWC3_DCFG, reg);
 }
 
 static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
@@ -4188,7 +4188,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 	if (!dwc->softconnect)
 		return;
 
-	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
+	reg = dwc3_readl(dwc, DWC3_DSTS);
 	speed = reg & DWC3_DSTS_CONNECTSPD;
 	dwc->speed = speed;
 
@@ -4263,11 +4263,11 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 	    !dwc->usb2_gadget_lpm_disable &&
 	    (speed != DWC3_DSTS_SUPERSPEED) &&
 	    (speed != DWC3_DSTS_SUPERSPEED_PLUS)) {
-		reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+		reg = dwc3_readl(dwc, DWC3_DCFG);
 		reg |= DWC3_DCFG_LPM_CAP;
-		dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+		dwc3_writel(dwc, DWC3_DCFG, reg);
 
-		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+		reg = dwc3_readl(dwc, DWC3_DCTL);
 		reg &= ~(DWC3_DCTL_HIRD_THRES_MASK | DWC3_DCTL_L1_HIBER_EN);
 
 		reg |= DWC3_DCTL_HIRD_THRES(dwc->hird_threshold |
@@ -4290,12 +4290,12 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		dwc3_gadget_dctl_write_safe(dwc, reg);
 	} else {
 		if (dwc->usb2_gadget_lpm_disable) {
-			reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+			reg = dwc3_readl(dwc, DWC3_DCFG);
 			reg &= ~DWC3_DCFG_LPM_CAP;
-			dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+			dwc3_writel(dwc, DWC3_DCFG, reg);
 		}
 
-		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+		reg = dwc3_readl(dwc, DWC3_DCTL);
 		reg &= ~DWC3_DCTL_HIRD_THRES_MASK;
 		dwc3_gadget_dctl_write_safe(dwc, reg);
 	}
@@ -4401,7 +4401,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 			switch (dwc->link_state) {
 			case DWC3_LINK_STATE_U1:
 			case DWC3_LINK_STATE_U2:
-				reg = dwc3_readl(dwc->regs, DWC3_DCTL);
+				reg = dwc3_readl(dwc, DWC3_DCTL);
 				u1u2 = reg & (DWC3_DCTL_INITU2ENA
 						| DWC3_DCTL_ACCEPTU2ENA
 						| DWC3_DCTL_INITU1ENA
@@ -4558,7 +4558,7 @@ static irqreturn_t dwc3_process_event_buf(struct dwc3_event_buffer *evt)
 	ret = IRQ_HANDLED;
 
 	/* Unmask interrupt */
-	dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
+	dwc3_writel(dwc, DWC3_GEVNTSIZ(0),
 		    DWC3_GEVNTSIZ_SIZE(evt->length));
 
 	evt->flags &= ~DWC3_EVENT_PENDING;
@@ -4569,8 +4569,8 @@ static irqreturn_t dwc3_process_event_buf(struct dwc3_event_buffer *evt)
 	wmb();
 
 	if (dwc->imod_interval) {
-		dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), DWC3_GEVNTCOUNT_EHB);
-		dwc3_writel(dwc->regs, DWC3_DEV_IMOD(0), dwc->imod_interval);
+		dwc3_writel(dwc, DWC3_GEVNTCOUNT(0), DWC3_GEVNTCOUNT_EHB);
+		dwc3_writel(dwc, DWC3_DEV_IMOD(0), dwc->imod_interval);
 	}
 
 	return ret;
@@ -4619,7 +4619,7 @@ static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer *evt)
 	if (evt->flags & DWC3_EVENT_PENDING)
 		return IRQ_HANDLED;
 
-	count = dwc3_readl(dwc->regs, DWC3_GEVNTCOUNT(0));
+	count = dwc3_readl(dwc, DWC3_GEVNTCOUNT(0));
 	count &= DWC3_GEVNTCOUNT_MASK;
 	if (!count)
 		return IRQ_NONE;
@@ -4634,7 +4634,7 @@ static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer *evt)
 	evt->flags |= DWC3_EVENT_PENDING;
 
 	/* Mask interrupt */
-	dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
+	dwc3_writel(dwc, DWC3_GEVNTSIZ(0),
 		    DWC3_GEVNTSIZ_INTMASK | DWC3_GEVNTSIZ_SIZE(evt->length));
 
 	amount = min(count, evt->length - evt->lpos);
@@ -4643,7 +4643,7 @@ static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer *evt)
 	if (amount < count)
 		memcpy(evt->cache, evt->buf, count - amount);
 
-	dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), count);
+	dwc3_writel(dwc, DWC3_GEVNTCOUNT(0), count);
 
 	return IRQ_WAKE_THREAD;
 }
diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
index c3aa9638b7a5..45f113b3c146 100644
--- a/drivers/usb/dwc3/gadget.h
+++ b/drivers/usb/dwc3/gadget.h
@@ -132,7 +132,7 @@ static inline void dwc3_gadget_ep_get_transfer_index(struct dwc3_ep *dep)
 {
 	u32			res_id;
 
-	res_id = dwc3_readl(dep->dwc->regs, DWC3_DEPCMD(dep->number));
+	res_id = dwc3_readl(dep->dwc, DWC3_DEPCMD(dep->number));
 	dep->resource_index = DWC3_DEPCMD_GET_RSC_IDX(res_id);
 }
 
@@ -147,7 +147,7 @@ static inline void dwc3_gadget_ep_get_transfer_index(struct dwc3_ep *dep)
 static inline void dwc3_gadget_dctl_write_safe(struct dwc3 *dwc, u32 value)
 {
 	value &= ~DWC3_DCTL_ULSTCHNGREQ_MASK;
-	dwc3_writel(dwc->regs, DWC3_DCTL, value);
+	dwc3_writel(dwc, DWC3_DCTL, value);
 }
 
 #endif /* __DRIVERS_USB_DWC3_GADGET_H */
diff --git a/drivers/usb/dwc3/io.h b/drivers/usb/dwc3/io.h
index 1e96ea339d48..7dd0c1e0cf74 100644
--- a/drivers/usb/dwc3/io.h
+++ b/drivers/usb/dwc3/io.h
@@ -16,9 +16,10 @@
 #include "debug.h"
 #include "core.h"
 
-static inline u32 dwc3_readl(void __iomem *base, u32 offset)
+static inline u32 dwc3_readl(struct dwc3 *dwc, u32 offset)
 {
 	u32 value;
+	void __iomem *base = dwc->regs;
 
 	/*
 	 * We requested the mem region starting from the Globals address
@@ -37,8 +38,10 @@ static inline u32 dwc3_readl(void __iomem *base, u32 offset)
 	return value;
 }
 
-static inline void dwc3_writel(void __iomem *base, u32 offset, u32 value)
+static inline void dwc3_writel(struct dwc3 *dwc, u32 offset, u32 value)
 {
+	void __iomem *base = dwc->regs;
+
 	/*
 	 * We requested the mem region starting from the Globals address
 	 * space, see dwc3_probe in core.c.
diff --git a/drivers/usb/dwc3/ulpi.c b/drivers/usb/dwc3/ulpi.c
index f23f4c9a557e..57daad15f502 100644
--- a/drivers/usb/dwc3/ulpi.c
+++ b/drivers/usb/dwc3/ulpi.c
@@ -33,13 +33,13 @@ static int dwc3_ulpi_busyloop(struct dwc3 *dwc, u8 addr, bool read)
 	if (read)
 		ns += DWC3_ULPI_BASE_DELAY;
 
-	reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
+	reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(0));
 	if (reg & DWC3_GUSB2PHYCFG_SUSPHY)
 		usleep_range(1000, 1200);
 
 	while (count--) {
 		ndelay(ns);
-		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYACC(0));
+		reg = dwc3_readl(dwc, DWC3_GUSB2PHYACC(0));
 		if (reg & DWC3_GUSB2PHYACC_DONE)
 			return 0;
 		cpu_relax();
@@ -55,13 +55,13 @@ static int dwc3_ulpi_read(struct device *dev, u8 addr)
 	int ret;
 
 	reg = DWC3_GUSB2PHYACC_NEWREGREQ | DWC3_ULPI_ADDR(addr);
-	dwc3_writel(dwc->regs, DWC3_GUSB2PHYACC(0), reg);
+	dwc3_writel(dwc, DWC3_GUSB2PHYACC(0), reg);
 
 	ret = dwc3_ulpi_busyloop(dwc, addr, true);
 	if (ret)
 		return ret;
 
-	reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYACC(0));
+	reg = dwc3_readl(dwc, DWC3_GUSB2PHYACC(0));
 
 	return DWC3_GUSB2PHYACC_DATA(reg);
 }
@@ -73,7 +73,7 @@ static int dwc3_ulpi_write(struct device *dev, u8 addr, u8 val)
 
 	reg = DWC3_GUSB2PHYACC_NEWREGREQ | DWC3_ULPI_ADDR(addr);
 	reg |= DWC3_GUSB2PHYACC_WRITE | val;
-	dwc3_writel(dwc->regs, DWC3_GUSB2PHYACC(0), reg);
+	dwc3_writel(dwc, DWC3_GUSB2PHYACC(0), reg);
 
 	return dwc3_ulpi_busyloop(dwc, addr, false);
 }
-- 
2.34.1


