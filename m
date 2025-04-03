Return-Path: <linux-usb+bounces-22505-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DB4A7A1A7
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 13:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82909175B55
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 11:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A48424E003;
	Thu,  3 Apr 2025 11:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqSdt+K1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362C724DFEA
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 11:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743678505; cv=none; b=EqTLjEO4xA5F9oWJAQhpen7Uh8pAdEeELyetbwzvkznCg9clDRBJPyrhaDiwusoWtAYIkC0RPnNxjezSmjuFbLdjAYvgU7KNvPcC76JBgGzru46MosWqoQQcgOAtFiuxy2x7MGDR8Tkj3m/z3AHLA9xh236nEZEHNiZO+G8W9+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743678505; c=relaxed/simple;
	bh=SAhT8oXXBABARfOtRCkhrfAzM6PBXMhEP4kkAlDH7as=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SkpMbXd36eSwObVcgeXxwWTcECYZP9tVhP6a4mKO/fOkBIhhuRXQqF7IWnLE0Gw9hQzLiRIJTcIAsLFQbAr7yEKnvbOexz7ZHUYpwEdeIVQDQuH5+Ps4aA8aBtNaAuKHRI4C8h9S/OBV921aNwXRWx0srYpUXREhpPR28kZmgKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqSdt+K1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339sJxO027906
	for <linux-usb@vger.kernel.org>; Thu, 3 Apr 2025 11:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Pc8x+bOJYD7
	a6Q3kzvOhZuB9UZxdxUbT0wfrdYVtQBU=; b=LqSdt+K1dg4C4CtLTqMPQYPv9mM
	iU+lEF9KhAgn6QGDvYIM/A2AtMkAniQhyki24jSqFjI99xcvAfPafYDe6Qo8zfVL
	0cv1FKJaRbV8O2VVZOJXIXvsPYo7lky2iAqeJhsqdFeXV4vjGfPcRx93/RFFKMe+
	/XbpbP2HSwtQdZO19b0C/awPR2aq1IdVTljiRNQkWNzvvX+fhCHqJocf3IzdhHvC
	jFds2nK7Cj+Lk9un0Xkq2dw3G5yE4rl2dMHwHn3Krs7lqFFlk5w75RaPNk0KY60U
	P8oGp2Hkf6sgvQTA2nDBS/wPPeTZ65VlbpxBH6IR8gPKjH8HlWGGW3A6O6g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sc2ysv0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 03 Apr 2025 11:08:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so751518a91.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Apr 2025 04:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743678501; x=1744283301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pc8x+bOJYD7a6Q3kzvOhZuB9UZxdxUbT0wfrdYVtQBU=;
        b=o3kuhgDJ3KoZNRu3+SL3sVCXadjZ25+JDFLp4eH9sHzd+Wnhtx6bn9VzKHJsYCTBv6
         MPy9v/gbrpxhdB4Mu1NmiEoS7lsmZ+NjcQR/C85kk4W3vAXtr9MthRlrN1KOkAyXF1Yl
         dTivHg+KlqHUkHFA9Henja2mf+JAkSUSQmZTqOJT/9Gz+0VAX6xfxxWX2U7XxTJfBxfV
         t+M3T39/xUhEHVMOhIqT764U9gaAzHspYkGFH2kzzjcJV3MD8Fz2+sd4Fn7tZTv7HpfQ
         oiyYfls1d/2C9bPDLg92s74WX23UKFyTd7IWfVXG90nKk4DO/P6SO2rz6HlRXn8hZs4J
         72dg==
X-Gm-Message-State: AOJu0YzCS/Vq4lvqHtLH0NYNKiBloGCmO1djJF+a2jyGqBSQKVxCCsY0
	0KOtKYcV1T18aw+DQCPW7TMTLFoa+t3x7y32maaWd7Hnr9khmxyHbSzdEivEraXg4B/AQHD7vZn
	edYcnzT65g+YScn5xHFpvmxB9ugZCGFKWUSM47Te2YQkLKPFLK5e8RIkl5Cc=
X-Gm-Gg: ASbGncv35LEcsXZTNt+ulANLvXzRShSab+y5Cm67eiy1TnsjDhADqZXH1l/eRqnqriE
	vbq/+1NAXUXEb910y4lrL6fmh2XktTMgLhvjNlipiplW7q+uGQKWDUdt9p+nSPMgtnlDEDCKdgE
	fe3wq2qZg9NkFM9vYednSegN/h3/0eom4rQhB9tCwpXj3wi8SLvRpCVmazT1/QLmvo2dKtEfoFl
	O1AW1t7qu9p76uPV2yyza/yTvfQjhbd4DHVXNQ5jZ1Q7pCADiWf7lyO/Cs/o8orbSSqbTmdz2Mu
	PlRGICk/OzAY58NIU6phFjEDLaKZe+j/uJF7SUV3+hL9
X-Received: by 2002:a17:90b:4d0d:b0:2ee:bc7b:9237 with SMTP id 98e67ed59e1d1-3057de29f94mr2335835a91.27.1743678501400;
        Thu, 03 Apr 2025 04:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYuQzVGsN8qmYnUxRZW+dC/Lr+3CWx+mANZ7m41xHK3NDbhnKMtmEfFMwQF0WIN4EQNZcFoQ==
X-Received: by 2002:a17:90b:4d0d:b0:2ee:bc7b:9237 with SMTP id 98e67ed59e1d1-3057de29f94mr2335803a91.27.1743678500796;
        Thu, 03 Apr 2025 04:08:20 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a3c3a8sm1185414a91.28.2025.04.03.04.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:08:20 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@kernel.org
Subject: [PATCH v1 3/3] usb: dwc3: gadget: Make gadget_wakeup asynchronous
Date: Thu,  3 Apr 2025 16:38:05 +0530
Message-Id: <20250403110805.865311-4-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AMoviu7M c=1 sm=1 tr=0 ts=67ee6c26 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z2qHnLmh7nH1upWU5EYA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: O-gn8skwN0fzpi3u9PeDEGLF7tWy4S_H
X-Proofpoint-ORIG-GUID: O-gn8skwN0fzpi3u9PeDEGLF7tWy4S_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_04,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 clxscore=1015 spamscore=0 phishscore=0 mlxlogscore=928 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030043

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
add a new variable func_wakeup_pending which will indicate the
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
 drivers/usb/dwc3/gadget.c | 60 ++++++++++++++++-----------------------
 2 files changed, 28 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index aaa39e663f60..2cdbbd3236d7 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1164,6 +1164,9 @@ struct dwc3_scratchpad_array {
  * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
  *		       DATWRREQINFO, and DESWRREQINFO value passed from
  *		       glue driver.
+ * @func_wakeup_pending: Indicates whether any interface has requested for
+ *			 function wakeup. Also represents the interface_id
+ *			 using bitmap.
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1394,6 +1397,7 @@ struct dwc3 {
 	int			num_ep_resized;
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
+	u32			func_wakeup_pending;
 };
 
 #define INCRX_BURST_MODE 0
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 89a4dc8ebf94..3289e57471f4 100644
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
@@ -2351,10 +2349,8 @@ static int dwc3_gadget_get_frame(struct usb_gadget *g)
 	return __dwc3_gadget_get_frame(dwc);
 }
 
-static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
+static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
 {
-	int			retries;
-
 	int			ret;
 	u32			reg;
 
@@ -2382,8 +2378,7 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
 		return -EINVAL;
 	}
 
-	if (async)
-		dwc3_gadget_enable_linksts_evts(dwc, true);
+	dwc3_gadget_enable_linksts_evts(dwc, true);
 
 	ret = dwc3_gadget_set_link_state(dwc, DWC3_LINK_STATE_RECOV);
 	if (ret < 0) {
@@ -2404,25 +2399,6 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
 	 * Since link status change events are enabled we will receive
 	 * an U0 event when wakeup is successful. So bail out.
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
 
@@ -2443,7 +2419,7 @@ static int dwc3_gadget_wakeup(struct usb_gadget *g)
 		spin_unlock_irqrestore(&dwc->lock, flags);
 		return -EINVAL;
 	}
-	ret = __dwc3_gadget_wakeup(dwc, true);
+	ret = __dwc3_gadget_wakeup(dwc);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
@@ -2471,14 +2447,10 @@ static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
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
+		dwc->func_wakeup_pending |= BIT(intf_id);
+		ret = __dwc3_gadget_wakeup(dwc);
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		return ret;
 	}
 
 	ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
@@ -4300,6 +4272,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 {
 	enum dwc3_link_state	next = evtinfo & DWC3_LINK_STATE_MASK;
 	unsigned int		pwropt;
+	int			ret, intf_id = 0;
 
 	/*
 	 * WORKAROUND: DWC3 < 2.50a have an issue when configured without
@@ -4375,7 +4348,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 
 	switch (next) {
 	case DWC3_LINK_STATE_U0:
-		if (dwc->gadget->wakeup_armed) {
+		if (dwc->gadget->wakeup_armed || dwc->func_wakeup_pending) {
 			dwc3_gadget_enable_linksts_evts(dwc, false);
 			dwc3_resume_gadget(dwc);
 			dwc->suspended = false;
@@ -4398,6 +4371,21 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 	}
 
 	dwc->link_state = next;
+
+	/* Proceed with func wakeup if any interfaces that has requested */
+	while (dwc->func_wakeup_pending && (next == DWC3_LINK_STATE_U0)) {
+		if (dwc->func_wakeup_pending & BIT(0)) {
+			ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
+							       DWC3_DGCMDPAR_DN_FUNC_WAKE |
+							       DWC3_DGCMDPAR_INTF_SEL(intf_id));
+			if (ret)
+				dev_err(dwc->dev, "function remote wakeup failed for %d, ret:%d\n",
+					intf_id, ret);
+		}
+		dwc->func_wakeup_pending >>= 1;
+		intf_id++;
+	}
+
 }
 
 static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc,
-- 
2.25.1


