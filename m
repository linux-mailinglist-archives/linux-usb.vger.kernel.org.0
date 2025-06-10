Return-Path: <linux-usb+bounces-24639-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE1FAD3186
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 11:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 498621730E0
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 09:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F02128C5B5;
	Tue, 10 Jun 2025 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYlS/g/d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0975928C000
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 09:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546853; cv=none; b=RBay4NUlxv12OWShKPIJdV2lEYhGwHByVfSnO0vcXwUWVAPVXWaEn20Jt/5GXOxkPfBDRk36bQ2RpGAAfYOtx++8oo5UhRoY5m/riB3rElHO5Pl8abbaIdDZNSUPLB1cX7u96NgplvlFHkjODbG/l3TFaaKgZzSrIkqVmMhlXoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546853; c=relaxed/simple;
	bh=LU0jOvl5YW/dqrJCbHPNKCEBE+8gLqoX0Lq/MwWLwEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o4tgn6k2SKRwVp7DfKFZvjumeugWHp/4BhRiAmhvGFoOOTg+unqC+Q+k+v2vbN6wdidt9tPqaU1+Qfgj9he76vI3p8YL4gy2AieOga744jIbpwwuYyrOqOGMS7WBvlprHhEE0fGnBgLI63XjgyTwyQAW4xuS8eWjKGVh1MjBx9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYlS/g/d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8d2Uq017798
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 09:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IW2IaMKIFv6
	KGfpt4IaYl1TH13UIgVTld4UW1lGpRAk=; b=KYlS/g/ddgQSq49iU6ixlGAJOnf
	xHww1879n5trB08f1UB2DI8vvUlxUikDaaAwWb4oxIPKcSE3biNxbilBrctVZcw+
	poKhzM9eze4HF6JB1LNAYyuooHRZVwizesH/EAPjCsilirv37TSvUg2VmQTvUDee
	Kh4RlnyV8ss+KoY9LEfsgYWCrDJU4NMkPQCksZ4cANNV5zynzUZYu8rrQhFfZCkk
	+pUw9kEQeeY9VpjECKaaZCDXCOsE959hz6o5I4YH7AtiZ0B8X/KZVh37pLHWxe1w
	5e7F9Nnytr+ukfHj4yEYZIUhB/NTZiF0Andrj1rw7efqwgF4aChv9B1z8Ww==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mchjfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 09:14:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3132e7266d3so5153946a91.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 02:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546848; x=1750151648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IW2IaMKIFv6KGfpt4IaYl1TH13UIgVTld4UW1lGpRAk=;
        b=ouvIAiAXTo//z2L+YxlEAIrCh00cX2Ft8K5tR5cBOkR3gGCz9WzJW+/B7yaRvpnc33
         FM9qUzFXEJ4Dt12Xgf23hJhHU/9LKTjQ3alUmL70hMHGOqz5WYcgv+WTEaQbVbCwj6qQ
         /0dUPBylGqq+HBtnc5ybWVjBB0h7ieGX7ajD9oOaUibQHW4vZC4PVGC54rkBURRoV8rN
         p20KRUgR/EgtGf/bLeTU7jnSFxcw8Dz1Qm/2RpwDLTwm3IGehxke7W/Xw20GNLMJS2gO
         qcSJRLnROGIS1pwJbM0F3Qdv8o1jxyGwZMAj/U0yFGNBPfW0ojJleysiGF2+bwUcUqfu
         czuw==
X-Forwarded-Encrypted: i=1; AJvYcCX7PGIj3FgrMMvQCqCf5Og4mWjk6Tdl3nymmXsPY/zn5CR/Kl4wwlDsfMf6upGUUokgN6yEprZkHw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUl5Y45/nu7Ru2ofAqi5O/PzD4fC1w3ZVITAAV/vyiCGjQmj9v
	7q9VSIvE9DY0/52UTqTFz2OZVZZeuuW/r41zkdV/dDHudQdYkDmwrReDHiMzgksiTzRr31yc09R
	zftngpZ/Vt0l1cU/dATDX/XhXjlnZFpzqUcQB5uuY2YlHsgrYTMgVanRAE2sJoWE=
X-Gm-Gg: ASbGncvBLgT0LXQp2wqPXD+/qvG+sK8to8TWgN0T1UHS98FI+Kq2z0giXhKom1gTZxc
	YGq22/B97tx6dURimQygpLkxDbDipRPNxfLbll3wRIE7qTQXzTG4VnPbIm2S3s7crhVRgFHRfCn
	OJh1BIYPlg+8nzq8+HdF4fL05q2JqpfECWGugMGANBBr8jHyxCSoNL0s8y/tC8cMQPAsgY7nyFQ
	0XQjiPNDaCAw86rTiTzFqSbG8Ir0a2aJXuuwk0+cZZo1H6fWpY0aafY7K8K91yAGSIP8+l0qKtj
	ON/156YV68atJXadatxyUMZsgfbHpUSOulmDk/QXgFyVzQUi2HprttroOvmj
X-Received: by 2002:a17:90b:4ac4:b0:311:df4b:4b8a with SMTP id 98e67ed59e1d1-313472d6addmr21278034a91.3.1749546848236;
        Tue, 10 Jun 2025 02:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsG1LuXcHwnJ4beYC1YR8EHTHc+dLRuDKscJNuMFCK8a7ACZsEE7fua0rYmQ7NPTqLSZUWDg==
X-Received: by 2002:a17:90b:4ac4:b0:311:df4b:4b8a with SMTP id 98e67ed59e1d1-313472d6addmr21278005a91.3.1749546847840;
        Tue, 10 Jun 2025 02:14:07 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fc3e72sm6913550a91.31.2025.06.10.02.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:14:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 1/4] usb: dwc3: core: Introduce glue callbacks for flattened implementations
Date: Tue, 10 Jun 2025 14:43:54 +0530
Message-Id: <20250610091357.2983085-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6847f761 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=9UFxAfr_hboBSpCGZXUA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ZL4elc4kt17JbpaS4PCOaYXu4cZbGpqK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MCBTYWx0ZWRfXyxxSmSwxxp/p
 ZO7WLjVcs9zI3AhbmpxkKKGUcZ+I0wt+Hc6YTNq7WGvsU5372Klbuq7JEuqVmsu6cgscRHF3YdL
 ky2ah78gavPyYfMTCCGUqZnbAZGEj8+n47TDYZ2MxXa2Yl4cNdwu/+t8yxqJQ8KFrDB0nBJUuHR
 xGVYqUw4JEdaea36aSJdlnMPlVQjPnAnYibPxjG7HKmkZlRT3t3+pGl+GV1OnuvlZb8IkxLYY5c
 HcmlAP04geE/TVW9tXfsDbVArWI78mPaf/AXqJjpLWI6oLkglninvfn/IovZP68Tjoe69kEde36
 /631Cw4W2W7kj6o1YwAB9PyVOxsxhH4j+N49n5U3hPL1Ry6rWNAZgpxFISEJ/9B6zUTUkWQvg0n
 n3woTSGPDHvhLmU9SIZmOLNRoanqWkIrPCjjfIZul43/NXqtTiTihfM0zqfUMuee9nIyWJKa
X-Proofpoint-GUID: ZL4elc4kt17JbpaS4PCOaYXu4cZbGpqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100070

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
index 2bc775a747f2..c01b15e3710f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2351,6 +2351,7 @@ static int dwc3_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dwc->dev = &pdev->dev;
+	dwc->glue_ops = NULL;
 
 	probe_data.dwc = dwc;
 	probe_data.res = res;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index d5b985fa12f4..a803884be4ed 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -992,6 +992,17 @@ struct dwc3_scratchpad_array {
 	__le64	dma_adr[DWC3_MAX_HIBER_SCRATCHBUFS];
 };
 
+/*
+ * struct dwc3_glue_ops - The ops indicate the notifications that
+ *				need to be passed on to glue layer
+ * @notify_set_role: Notify glue of role switch notifications
+ * @notify_run_stop: Notify run stop enable/disable information to glue
+ */
+struct dwc3_glue_ops {
+	void	(*notify_set_role)(struct dwc3 *dwc, enum usb_role role);
+	void	(*notify_run_stop)(struct dwc3 *dwc, bool is_on);
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
@@ -1400,6 +1412,8 @@ struct dwc3 {
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
 	u32			wakeup_pending_funcs;
+
+	struct dwc3_glue_ops	*glue_ops;
 };
 
 #define INCRX_BURST_MODE 0
@@ -1614,6 +1628,18 @@ void dwc3_event_buffers_cleanup(struct dwc3 *dwc);
 int dwc3_core_soft_reset(struct dwc3 *dwc);
 void dwc3_enable_susphy(struct dwc3 *dwc, bool enable);
 
+static inline void dwc3_notify_set_role(struct dwc3 *dwc, enum usb_role role)
+{
+	if (dwc->glue_ops && dwc->glue_ops->notify_set_role)
+		dwc->glue_ops->notify_set_role(dwc, role);
+}
+
+static inline void dwc3_notify_run_stop(struct dwc3 *dwc, bool is_on)
+{
+	if (dwc->glue_ops && dwc->glue_ops->notify_run_stop)
+		dwc->glue_ops->notify_run_stop(dwc, is_on);
+}
+
 #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
 int dwc3_host_init(struct dwc3 *dwc);
 void dwc3_host_exit(struct dwc3 *dwc);
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 7977860932b1..408551768a95 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -464,6 +464,7 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
 		break;
 	}
 
+	dwc3_notify_set_role(dwc, role);
 	dwc3_set_mode(dwc, mode);
 	return 0;
 }
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 321361288935..73bed11bccaf 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2641,6 +2641,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on)
 	if (saved_config)
 		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
 
+	dwc3_notify_run_stop(dwc, is_on);
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 	if (is_on) {
 		if (DWC3_VER_IS_WITHIN(DWC3, ANY, 187A)) {
-- 
2.34.1


