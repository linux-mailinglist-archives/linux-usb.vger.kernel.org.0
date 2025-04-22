Return-Path: <linux-usb+bounces-23301-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A03A96607
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 12:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A39F3B7C52
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 10:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBE72144C4;
	Tue, 22 Apr 2025 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqbvQItV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A723A1DDA1B
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 10:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317972; cv=none; b=nungh3nEr1urUCU1qLFXUkFa6Dd0B69aynZSMVu897Ub+5nBRfBXrHqqdU5fFPEjfR//1YHd3eXa0QThCsg3BerRn4G5AaGk+J9dF5vc9fn//c9arKtz06cXJZ14TA4V0RXEBzlEyjNPNQXLNzoEsJSjzLDapApsqbzEG88GtJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317972; c=relaxed/simple;
	bh=qbhS7bsOrZKDOkbN12rXpfPUFYm+boS/N917aBAvtfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ns6x4h7ukwDsz67crbKlo4mBjzrMPBe9pmbIuQGh4CipaYQDcK3aJlj2H8Np1TGBWGEIA+gx4AgRbS/khNKCgZL0OsYIKlr1AIyZYT+Rp6iAYP8QsBWWIVHb92WROabbx9svjDvs6+QDVqLGQjOz2X9X9w8YEHdlr2dQre0ge6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BqbvQItV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4PGfT009297
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 10:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7QuJSuAaz6B
	LADYfrH5eY44lI3tsRy/GKAQrW+Z71q8=; b=BqbvQItV6KxsjuswZuO0srA93mb
	wONDHiFoVIa6DHo266Oma2jZPrPtyy9IPFim3nGg/Ak0U8BWuNqSXNYrMur95P4x
	RjOAjgWvnnhY39VyBoHcLFSOXg7ML3P3L8mvIP77GZJD3UaEeIhH42vIyt0P1N1N
	Yaoa3AFoIQmBxXMYjxAixjfJNCUd8cELa8bPm83xG8DWZy/HI80UbjRHoLycMOob
	XbTuVgCL4uuFabsnhpsLjAVfhirsDoyhTQ4S4AeSMpUp5T6EMlZbAye3byP5rVfx
	mlWhasPtUp/12r4XI59wX7YkjUpnOhe+ixNp5j4sVABlhU+BHS4vjjZ8aZA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643e1f48h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 10:32:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7377139d8b1so3533285b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 03:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317968; x=1745922768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QuJSuAaz6BLADYfrH5eY44lI3tsRy/GKAQrW+Z71q8=;
        b=orMw7FvJ8gmkVhWNSHxRX1uFMLKGlr7Nj/xc+MIUIPpOOkiwc+aZCzSa8Tjn5IVIfA
         bfxFYReI0jS9Tirlxut2eBe3qz5YSfV5n27Seey1lBpy0OdcIaDKlRRDBCqdsFOWvVCs
         08tJL1dniMwuu6oTnCSUfmQHNDxdjJ02yj15Tz8E3DJbmAuJHZBqncpsFENa4Lyut969
         UI1lXJwYdeotVd50uL2ALZaM0TcroEF55fLIoE0KFoofoT3N7bkb/uMyjvmJTasAGFMg
         KM9yIZ7lsN6wCOZ2587k7YJ6UACdz5i115slTQDHZ9gKEuEGBHtpxH0B+X+ITFXXhBhw
         Yo6g==
X-Gm-Message-State: AOJu0Yyty994QlG2x+HhUcAIqqXTam253rdkRCU3riozF9OsN8A0q8vO
	2m27zBEGD1/1YzB/ipYrme5oV2QX4+a9LObM2C1zlgMNF/c+P9aIyPVbgRnLCL9GnLTYVE7C+is
	/7DeD7YUiG0XfjeWLSgXVFjU3Otut5Y90deIlJzeQqv5J+7TxbLQM4Nud0go=
X-Gm-Gg: ASbGncvK5bV80CoM9MkBBpB6j2UZujaYYtOOEcNYHrBiaGz2LpjkfF+ppQr3MvcKJic
	dKss2TYQBsZtQ6idNZGSLioUz7I8pYLUjuJ8QQ+gIP7BGo3xg7R/mpRoUUcdiGGXn07YEcp7f6G
	UTOXiaZqW9/jlCMde59+pDgmIkEcuHNVuhl7Y4JiTsqPro785nf08+LXKZQn5slqGtJ5eeEx8w3
	dTmrHGJtyxQe/2wSEZ0w+oftMCKS1e0d7MBqh8+s4enWGvOmrNHiIEqB78HH97j/k7NCyZrcf+G
	C+ed+312LNwsjnMKAkwFzOcV3+zvfzIaJjZCJKXc
X-Received: by 2002:a05:6a00:3cc2:b0:736:5f75:4a3b with SMTP id d2e1a72fcca58-73dc14a3296mr17035190b3a.7.1745317967624;
        Tue, 22 Apr 2025 03:32:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbq89ZKlhNrIC1F5xSOztoAMur+x71lgU4GC2F9m/6YrZPS7Y2uwXjRLzHWpnKEftkLD7DvA==
X-Received: by 2002:a05:6a00:3cc2:b0:736:5f75:4a3b with SMTP id d2e1a72fcca58-73dc14a3296mr17035150b3a.7.1745317967146;
        Tue, 22 Apr 2025 03:32:47 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90dc88sm8228059b3a.83.2025.04.22.03.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:32:46 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@kernel.org
Subject: [PATCH v2 3/3] usb: dwc3: gadget: Make gadget_wakeup asynchronous
Date: Tue, 22 Apr 2025 16:02:31 +0530
Message-Id: <20250422103231.1954387-4-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422103231.1954387-1-prashanth.k@oss.qualcomm.com>
References: <20250422103231.1954387-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZOrXmW7b c=1 sm=1 tr=0 ts=68077051 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j9-q7YbHbCxKn5U3djcA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: bp88MyIpB9dG37KedKkXkwx4folhUA5h
X-Proofpoint-ORIG-GUID: bp88MyIpB9dG37KedKkXkwx4folhUA5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=854 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220079

Currently gadget_wakeup() waits for U0 synchronously if it was
called from func_wakeup(), this is because we need to send the
function wakeup command soon after the link is active. And the
call is made synchronous by polling DSTS continuosly for 20000
times in __dwc3_gadget_wakeup(). But it observed that sometimes
the link is not active even after polling 20K times, leading to
remote wakeup failures. Adding a small delay between each poll
helps, but that won't guarantee resolution in future. Hence make
the gadget_wakeup completely asynchronous.

Since multiple interfaces can issue a function wakeup at once,
add a new variable wakeup_pending_funcs which will indicate the
functions that has issued func_wakup, this is represented in a
bitmap format. If the link is in U3, dwc3_gadget_func_wakeup()
will set the bit corresponding to interface_id and bail out.
Once link comes back to U0, linksts_change irq is triggered,
where the function wakeup command is sent based on bitmap.

Cc: stable@kernel.org
Fixes: 92c08a84b53e ("usb: dwc3: Add function suspend and function wakeup support")
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.h   |  4 +++
 drivers/usb/dwc3/gadget.c | 60 +++++++++++++++------------------------
 2 files changed, 27 insertions(+), 37 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index aaa39e663f60..27eae4cf223d 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1164,6 +1164,9 @@ struct dwc3_scratchpad_array {
  * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
  *		       DATWRREQINFO, and DESWRREQINFO value passed from
  *		       glue driver.
+ * @wakeup_pending_funcs: Indicates whether any interface has requested for
+ *			 function wakeup in bitmap format where bit position
+ *			 represents interface_id.
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1394,6 +1397,7 @@ struct dwc3 {
 	int			num_ep_resized;
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
+	u32			wakeup_pending_funcs;
 };
 
 #define INCRX_BURST_MODE 0
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 47e73c4ed62d..69ec9cf57663 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -276,8 +276,6 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
 	return ret;
 }
 
-static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async);
-
 /**
  * dwc3_send_gadget_ep_cmd - issue an endpoint command
  * @dep: the endpoint to which the command is going to be issued
@@ -2359,10 +2357,8 @@ static int dwc3_gadget_get_frame(struct usb_gadget *g)
 	return __dwc3_gadget_get_frame(dwc);
 }
 
-static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
+static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
 {
-	int			retries;
-
 	int			ret;
 	u32			reg;
 
@@ -2390,8 +2386,7 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
 		return -EINVAL;
 	}
 
-	if (async)
-		dwc3_gadget_enable_linksts_evts(dwc, true);
+	dwc3_gadget_enable_linksts_evts(dwc, true);
 
 	ret = dwc3_gadget_set_link_state(dwc, DWC3_LINK_STATE_RECOV);
 	if (ret < 0) {
@@ -2410,27 +2405,8 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
 
 	/*
 	 * Since link status change events are enabled we will receive
-	 * an U0 event when wakeup is successful. So bail out.
+	 * an U0 event when wakeup is successful.
 	 */
-	if (async)
-		return 0;
-
-	/* poll until Link State changes to ON */
-	retries = 20000;
-
-	while (retries--) {
-		reg = dwc3_readl(dwc->regs, DWC3_DSTS);
-
-		/* in HS, means ON */
-		if (DWC3_DSTS_USBLNKST(reg) == DWC3_LINK_STATE_U0)
-			break;
-	}
-
-	if (DWC3_DSTS_USBLNKST(reg) != DWC3_LINK_STATE_U0) {
-		dev_err(dwc->dev, "failed to send remote wakeup\n");
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
@@ -2451,7 +2427,7 @@ static int dwc3_gadget_wakeup(struct usb_gadget *g)
 		spin_unlock_irqrestore(&dwc->lock, flags);
 		return -EINVAL;
 	}
-	ret = __dwc3_gadget_wakeup(dwc, true);
+	ret = __dwc3_gadget_wakeup(dwc);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
@@ -2479,14 +2455,10 @@ static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
 	 */
 	link_state = dwc3_gadget_get_link_state(dwc);
 	if (link_state == DWC3_LINK_STATE_U3) {
-		ret = __dwc3_gadget_wakeup(dwc, false);
-		if (ret) {
-			spin_unlock_irqrestore(&dwc->lock, flags);
-			return -EINVAL;
-		}
-		dwc3_resume_gadget(dwc);
-		dwc->suspended = false;
-		dwc->link_state = DWC3_LINK_STATE_U0;
+		dwc->wakeup_pending_funcs |= BIT(intf_id);
+		ret = __dwc3_gadget_wakeup(dwc);
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		return ret;
 	}
 
 	ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
@@ -4353,6 +4325,8 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 {
 	enum dwc3_link_state	next = evtinfo & DWC3_LINK_STATE_MASK;
 	unsigned int		pwropt;
+	int			ret;
+	int			intf_id;
 
 	/*
 	 * WORKAROUND: DWC3 < 2.50a have an issue when configured without
@@ -4428,7 +4402,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 
 	switch (next) {
 	case DWC3_LINK_STATE_U0:
-		if (dwc->gadget->wakeup_armed) {
+		if (dwc->gadget->wakeup_armed || dwc->wakeup_pending_funcs) {
 			dwc3_gadget_enable_linksts_evts(dwc, false);
 			dwc3_resume_gadget(dwc);
 			dwc->suspended = false;
@@ -4451,6 +4425,18 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 	}
 
 	dwc->link_state = next;
+
+	/* Proceed with func wakeup if any interfaces that has requested */
+	while (dwc->wakeup_pending_funcs && (next == DWC3_LINK_STATE_U0)) {
+		intf_id = ffs(dwc->wakeup_pending_funcs) - 1;
+		ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
+						       DWC3_DGCMDPAR_DN_FUNC_WAKE |
+						       DWC3_DGCMDPAR_INTF_SEL(intf_id));
+		if (ret)
+			dev_err(dwc->dev, "Failed to send DN wake for intf %d\n", intf_id);
+
+		dwc->wakeup_pending_funcs &= ~BIT(intf_id);
+	}
 }
 
 static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc,
-- 
2.25.1


