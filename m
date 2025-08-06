Return-Path: <linux-usb+bounces-26530-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A79B1C3EB
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 11:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBF5918C1750
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 09:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CD828AAE9;
	Wed,  6 Aug 2025 09:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wxi+Htik"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A8928A719
	for <linux-usb@vger.kernel.org>; Wed,  6 Aug 2025 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754474325; cv=none; b=ucoXt5LD/ueahpQDBv7+LqUQnglEJUr1fXc7u2vlAVtDbkOoE+2nslHCYO9H6iN8F41jyELN9jbDVMoTSCmpoCdl4aJgiurw3+jb/DN6DN2qmlAYY1Eu7rJwD3hcSe1FUwtLrkM/djIL9xGypAInrQ5ieyMA5gOyMd4y6o/sClY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754474325; c=relaxed/simple;
	bh=ju/IORgQMB5tw2a5Yi2XNxvS1dzi7whPBV6L6KZ0pV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qpIbyXhfxYQ/Gp0b4zc0nKnXVZXp5BL6RFmpl1d/lVwEOfwOev9nEEmrEUA78cSbOEo4TdttV/wxk7tZ6fiJLccbe3zksG0h2w72STbyz70PuNHKsAznbAWSQ6KEa1jjNdKM7wsBWozUQwklfvc11K9G273C6OlaQdA2j/LxSno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wxi+Htik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766PgB3022277
	for <linux-usb@vger.kernel.org>; Wed, 6 Aug 2025 09:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x7ELA2sx/Md
	WoybRTVV3B4u5eWgexiePTdCJcLkR0o0=; b=Wxi+HtiknpYF6cQ0xPD0k0Z/0mI
	tiUZI+pbXoa+NEbiDqS5fk7jNdPTaSViK5KVkk3ex4D6mrr66QUOfsFg6i0Oj9OH
	TuU5ofrI3XzGRYkKMIx4T+HuFrp/sjmg/Tw4rzUECwQjtWbPmk9qkos87AYVqGGU
	3hK3jLcbaLQZOizGvPVlcCkkvekQIBCV8CVFLuP0ADJ7JjOOjqGxw8wCFSVlIMym
	E0gb5pVtL911GdHFBoLQrdzm0LMzbwkZgkXqEfP+Yb/Pwb4/yzgp3B3qix5eAfwE
	yBhd354VTFfIK3pBqhvM35XQb8cgYVAJex+4Ht4jaVoIEPj0f7tWvXmhwxg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8a715-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 06 Aug 2025 09:58:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23fe26e5a33so82263635ad.3
        for <linux-usb@vger.kernel.org>; Wed, 06 Aug 2025 02:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754474322; x=1755079122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7ELA2sx/MdWoybRTVV3B4u5eWgexiePTdCJcLkR0o0=;
        b=GA8ovFlJkuPWOSM3IOveJHqiFm9yEBkyItXRQoo1vBQcvKW0msuRaxuThs4q3RhBAC
         3lbgTsIIEsz103HnU/PDdt5xolulGqqj0lfoM+xzF2yZoFGd4uOK421OE93K9uLAWsOT
         21izns8m/iATTFLaPLl8cuiXn/zdSCzbGjQmckWAuO2N3V303cJc8Wp2X38fIiXsQT9z
         +Kkz7PbnP4kMakF6Zza4/UWgspqAucUWdAG1SzHun3OpGMXWIdAUP6tfJ74/7llrnRu7
         QYnor2Ihcl8QZ7Zqv5UaO1W+zMZndxIlMMUC7mLCem/RUZRifv6dw22WLz1oQUVae7kP
         Xnfw==
X-Forwarded-Encrypted: i=1; AJvYcCXzBhXo3iOX2ERjG+XO2TNHZnKHAwILWEjg1wUQq3M/fkcZUMtpTVOw+t4p0OYWLljG9B5we/M1WUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPkD9WVc8J6ffNzcHI6pLNUtHPcEJ1ig06bG2SPTRUPgCHblyE
	F87FNalrf3/ILPOGc4km9kIMTLdXhpw86TPyQC/b7ixdecwmt90KN9JRt1hPbD5+dEfpuQhN6PS
	ZJ15PTfaVv0jZ3U1BgYFgftDhpBIJiQ79PnsZKrLnLDUSCD284jvSKX0GVDk5uNk=
X-Gm-Gg: ASbGncuhe6ss/X+fyCaNwjMQ2/qr4JBLDptnhH2R6p3BjftN+ePbLO6WCPh6wjehKKL
	gChfJ3XDvIylReAb0KhSviQ/VgWopRg6FZMrMsvBPF8mwPkLpAoa/GG4+bArP76WM+UL077aKmR
	WgLgetEEIc0dqKaHEmYNa6UVbQBHqvHQ1bZGVq65Cz5FsjNOYkStMPxzcNPjXEqX0R2+CzJpOsV
	eaPqpZ0PJja1s99U16A8pCWN/S87zJuIj4/fqpCM/x2mkdZ6AHl8Kzfwlv8vpQkWYSF4APolzgV
	COxWAHeueZmaVL2tLVJRglOaxn87YldIhkehOb5CWDBW197ZDQGL7oZVIlBPwTKwaRrIirEdbcd
	wSA==
X-Received: by 2002:a17:902:e748:b0:242:9bca:863d with SMTP id d9443c01a7336-2429f59ce44mr27650135ad.55.1754474321870;
        Wed, 06 Aug 2025 02:58:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuMxZalx+X0hAPVDbFCyTqiK4CqecAEXQQJUNlBXvwPtaAOHPwbvTXEoeeBROEhQvq+lkCKg==
X-Received: by 2002:a17:902:e748:b0:242:9bca:863d with SMTP id d9443c01a7336-2429f59ce44mr27649955ad.55.1754474321497;
        Wed, 06 Aug 2025 02:58:41 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7bb0c0sm12908799a12.20.2025.08.06.02.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 02:58:41 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 1/3] usb: dwc3: core: Introduce glue callbacks for flattened implementations
Date: Wed,  6 Aug 2025 15:28:26 +0530
Message-Id: <20250806095828.1582917-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806095828.1582917-1-krishna.kurapati@oss.qualcomm.com>
References: <20250806095828.1582917-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -oLxi9561iw0a1G2hdP_cm_uSdgRz5ub
X-Proofpoint-ORIG-GUID: -oLxi9561iw0a1G2hdP_cm_uSdgRz5ub
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX8YkRJo4eZJfU
 jrE/a+XJm3CatrwgfjrrgfDJXxYEBRve0xCfosZfh+mc/Z8untrouyUjk2DOaaHqb3QigYUO6vo
 Vy+y4kIqJb300ZegoEWf/p6Sq3RjbgOXz5NJSdnphQjqPu647u9+qWkz96ELU0Ul2EGcFZuajFr
 pegAQwQiuSjkKWNOJ/3zNHpX5aO+fTm8lp8ckh62IKlOzdauJMJh1riHDHzOVjlPFUMJwfCCfvu
 yHeU3ORyd4sAy6yRIbeYMTK9aXTccOGdVBKKiXS/ltSl+8a/GmaQrEJxd40Im61TGVbRfppBUGD
 Cbxd+AEgg1aWKCxSY1/dUYLRSJ8U0/8UtzSNjmgUbBdxvkkbGIfCcToX7I53pVhkX3jwJlp27NL
 elWgSzMS
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=68932752 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9UFxAfr_hboBSpCGZXUA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

In certain situations like role switching, the glue layers need to be
informed of these events, so that they can take any necessary action.
But in non-flattened implementations, the glue drivers have no data on
when the core driver probe was successful post invoking of_platform_
populate. Now that the core driver supports flattened implementations
as well, introduce vendor callbacks that can be passed on from glue to
core before invoking dwc3_core_probe.

Introduce callbacks to notify glue layer of role_switch and run_stop
changes. These can be used by flattened implementation of Qualcomm
glue layer to generate connect/disconnect events in controller during
cable connect and run stop modifications by udc in device mode.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c   |  1 +
 drivers/usb/dwc3/core.h   | 26 ++++++++++++++++++++++++++
 drivers/usb/dwc3/drd.c    |  1 +
 drivers/usb/dwc3/gadget.c |  1 +
 4 files changed, 29 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 8002c23a5a02..392ba86c69f5 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2351,6 +2351,7 @@ static int dwc3_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dwc->dev = &pdev->dev;
+	dwc->glue_ops = NULL;
 
 	probe_data.dwc = dwc;
 	probe_data.res = res;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index d5b985fa12f4..095311e636c5 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -992,6 +992,17 @@ struct dwc3_scratchpad_array {
 	__le64	dma_adr[DWC3_MAX_HIBER_SCRATCHBUFS];
 };
 
+/**
+ * struct dwc3_glue_ops - The ops indicate the notifications that
+ *				need to be passed on to glue layer
+ * @notify_set_role: Notify glue of role switch notifications
+ * @notify_run_stop: Notify run stop enable/disable information to glue
+ */
+struct dwc3_glue_ops {
+	void	(*pre_set_role)(struct dwc3 *dwc, enum usb_role role);
+	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
+};
+
 /**
  * struct dwc3 - representation of our controller
  * @drd_work: workqueue used for role swapping
@@ -1168,6 +1179,7 @@ struct dwc3_scratchpad_array {
  * @wakeup_pending_funcs: Indicates whether any interface has requested for
  *			 function wakeup in bitmap format where bit position
  *			 represents interface_id.
+ * @glue_ops: Vendor callbacks for flattened device implementations.
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1197,6 +1209,8 @@ struct dwc3 {
 	struct usb_gadget	*gadget;
 	struct usb_gadget_driver *gadget_driver;
 
+	const struct dwc3_glue_ops	*glue_ops;
+
 	struct clk		*bus_clk;
 	struct clk		*ref_clk;
 	struct clk		*susp_clk;
@@ -1614,6 +1628,18 @@ void dwc3_event_buffers_cleanup(struct dwc3 *dwc);
 int dwc3_core_soft_reset(struct dwc3 *dwc);
 void dwc3_enable_susphy(struct dwc3 *dwc, bool enable);
 
+static inline void dwc3_pre_set_role(struct dwc3 *dwc, enum usb_role role)
+{
+	if (dwc->glue_ops && dwc->glue_ops->pre_set_role)
+		dwc->glue_ops->pre_set_role(dwc, role);
+}
+
+static inline void dwc3_pre_run_stop(struct dwc3 *dwc, bool is_on)
+{
+	if (dwc->glue_ops && dwc->glue_ops->pre_run_stop)
+		dwc->glue_ops->pre_run_stop(dwc, is_on);
+}
+
 #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
 int dwc3_host_init(struct dwc3 *dwc);
 void dwc3_host_exit(struct dwc3 *dwc);
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 7977860932b1..4c91240eb429 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -464,6 +464,7 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
 		break;
 	}
 
+	dwc3_pre_set_role(dwc, role);
 	dwc3_set_mode(dwc, mode);
 	return 0;
 }
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 25db36c63951..999b2e436622 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2658,6 +2658,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on)
 		dwc->pullups_connected = false;
 	}
 
+	dwc3_pre_run_stop(dwc, is_on);
 	dwc3_gadget_dctl_write_safe(dwc, reg);
 
 	do {
-- 
2.34.1


