Return-Path: <linux-usb+bounces-26737-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC00FB21DBA
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 07:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D24417F4CC
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 05:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582032367DC;
	Tue, 12 Aug 2025 05:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2fpHsKr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539C52C21CE
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 05:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978156; cv=none; b=QG3GjLB/D6Ehs+KwkGoBc6lE3F9R4R9I8EfG75uXezl/zOutldWUR9iH0h3IZz2CDhruF53doMoa5GMS3l+DGIcmqf05TU+y4wj4oweAkXjnDtrPAwp7hTF2GSzxvE3VXBUhhKra0ABaoDXqLDKOZSfy57cJHHUjj4U5H2QwetM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978156; c=relaxed/simple;
	bh=dsi/nrKzVZMuL/4lw3VF7AO57QYerZ2w9zZyzFIubrU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NhhmEQYza/DBGP6+112ysUobIbiV2VVfVO+kHtruYXMfLbJmAE5MibYb1jGn2+RG8NviyPH4STUw90Umi0N7Rrlaavz81r6s+nhqq9GE4GpqE8Zy0ZCwSKgoJgZZ2N5n8qRVkdCbFv9nF3Zw7X6OjhU50p64LdhBvrLNl0cg6q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2fpHsKr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BKjFMM005708
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 05:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RDhofFk1RaL
	aCMXm/5C2/6Ncd5FVwO78HtMV84strHE=; b=F2fpHsKrZ+SpHFIvcehGFUDBw/8
	rO1OjG6DNB6SSEPJilxu8KIhEo7Vx4idZxs1Y3brj0m+p05PayVajvT5+bo2NhOw
	lKEpTyqUdo/IbA4jOoH2szaJ4w7lU3evZOYGiiYF2jx0nmsOIfYJgjAGymGMvPzM
	6jAlNmC8P6eEeWwdVJ6FhUEVtKxg2dqC7zbmg3GqL+OMl9ljRyF/Xd2BlJa1nI2W
	jrUdDtjG0HTf4vHu3iRDYeo9rWaOc1MdaqIu3LpzLgYk7vbezzkI2NTvEfjO5WI+
	O17vkyPANCTfe+DIwBA/8wYE164Hz5K4l+LsGEfX2IDlrl1gEnoExQbgj4A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6jthq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 05:55:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3f38d3cabeso4023844a12.3
        for <linux-usb@vger.kernel.org>; Mon, 11 Aug 2025 22:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754978153; x=1755582953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDhofFk1RaLaCMXm/5C2/6Ncd5FVwO78HtMV84strHE=;
        b=GXv0QYM45NCX4CMfOLtuhSQmnAay245W9tfgHLwEqT9ivIpqDYRPe5txGZUQ4l3icJ
         271bCvWS4hCPoSsZ4zo9Us2Bo8zrFfPQiNp8IAIDSJue3sGemRhE3tX32/jxZ2j2YA7U
         ANAAzXBTg3idGW9MJ+VyVuAjFe61fZktcMPQk/wchGHLl0Jz1ZXG4aClZsu8EcueIPCy
         kPOF/gdvwstWEejtOd5X+nZmBwqhLoZ2sag6ujBFDn6ywN4iWwjw9niaMEc++cR4uz2N
         1owMh2O0UNi+SFCevvyjYWqt6KljDgztcumFLgWukAjM8OM14ZJhnttrJVgSAr4NQOmj
         Ol1A==
X-Forwarded-Encrypted: i=1; AJvYcCUwm7p0uMsRihyCbdi9HExcJCUQUJMKsXsS2L8CFYHfJ4HbJ2EA4cl36aDMFvQ+PFyyV8j0DjN+kzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNAkNfN8dP37+ILehPAw7ifAelw+la6muTy8uTEIdKJsWazzLW
	SluTMHeHmW6IRtYr1Zo5+UYYYvWOhgjCzLzoHNQvcsCccF8bKrrtoFBlvuI9n4HhOhd9fBwW6QI
	b60vf4E4FV2DuidCER2mJLIZMhwR3/6/3SqtAfFngU723NatJSAnSYsxAm3OSE09aKRdFhoI=
X-Gm-Gg: ASbGnctn3cXaJ3BU2QTMM/cy8hlh+O63A2MXw1j6GQZ2tODwAlkY9hezHETnpvTbkgf
	0RXH3Y4PNN2bIBEl7ySUJzfhyIiXddHwznLs6hZRQsZ5mV2GoGLgqJTNNuqR81U4Gyq73pEL/9x
	ByykOxMtzjCR+usHpzJNP4tRbQukx1ljIgGAXxfXKSMZqwksZfzRRCjgQxySEiTyLiLXNCnHVsB
	VcOxxAM8Aunv32A8f3wNUM2qKB96lEDm6cP/GxWK05144eAwMNsPjqxLS4BAEZiyIEQSxp9HaXv
	05+vUWbX6BscAFWw/4PfDNxPTpBGYqPh3SF58Xp1sjoME34e1lFdQjjxCiZxBESFtAFtCP88K+L
	I/A==
X-Received: by 2002:a17:903:2310:b0:234:c549:da0e with SMTP id d9443c01a7336-242fc38b17emr38062155ad.47.1754978153395;
        Mon, 11 Aug 2025 22:55:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUXSV4SfnNvn0a+id64qRvfkMtF5ROaM/1BIWLKAuVMiWM8QLsNDekNJyRX6dJDVpUjZY89w==
X-Received: by 2002:a17:903:2310:b0:234:c549:da0e with SMTP id d9443c01a7336-242fc38b17emr38061715ad.47.1754978152977;
        Mon, 11 Aug 2025 22:55:52 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e585sm288585985ad.40.2025.08.11.22.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 22:55:52 -0700 (PDT)
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
Subject: [PATCH v4 1/3] usb: dwc3: core: Introduce glue callbacks for flattened implementations
Date: Tue, 12 Aug 2025 11:25:40 +0530
Message-Id: <20250812055542.1588528-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfXwa1IWWof+Y9V
 a0g3gIOmWMucqc7xk80Rp/l5ahQgrUATOlSEK5Zo4zcEYtY7vx/HmlIUP4DmI4V/e4xpaWnHJsl
 wtjamxDiGTAWLX5x5W/23jzKrPfeeCe+KV6CBp4i+adGl5NKKSkZO6LInG4HsMD8PKnCUX+B4hW
 7egYT4YdtSoRIeK4/vgRa3JUF/WcWASFBTzXNRiWmPFWEWI0Yv9sSR6uX+xJF2FxaPdyg0J/kkY
 cVjSWMZ8BdJV6l7oJp7jCAlasKGBe2JFvaGHE75kIpOy8wvKgotgc4Nv3XG6pR8vj+EXSosBIH0
 vvGfpuPIY+FUJzSZL9Ym0Ut3lXj7wOSvI15TrvSDJfxSTSVB/Rcx1+JP1aBLpJKCOvTMBP9enoA
 Qu6EIRGG
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689ad76a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9UFxAfr_hboBSpCGZXUA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 2kvE3ipYQJUQ8gmL5SAIvaIkJNOxPkKB
X-Proofpoint-ORIG-GUID: 2kvE3ipYQJUQ8gmL5SAIvaIkJNOxPkKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

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
index d5b985fa12f4..a5fc92c4ffa3 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -992,6 +992,17 @@ struct dwc3_scratchpad_array {
 	__le64	dma_adr[DWC3_MAX_HIBER_SCRATCHBUFS];
 };
 
+/**
+ * struct dwc3_glue_ops - The ops indicate the notifications that
+ *				need to be passed on to glue layer
+ * @pre_set_role: Notify glue of role switch notifications
+ * @pre_run_stop: Notify run stop enable/disable information to glue
+ */
+struct dwc3_glue_ops {
+	void	(*pre_set_role)(struct dwc3 *dwc, enum usb_role role);
+	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
+};
+
 /**
  * struct dwc3 - representation of our controller
  * @drd_work: workqueue used for role swapping
@@ -1012,6 +1023,7 @@ struct dwc3_scratchpad_array {
  * @eps: endpoint array
  * @gadget: device side representation of the peripheral controller
  * @gadget_driver: pointer to the gadget driver
+ * @glue_ops: Vendor callbacks for flattened device implementations.
  * @bus_clk: clock for accessing the registers
  * @ref_clk: reference clock
  * @susp_clk: clock used when the SS phy is in low power (S3) state
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


