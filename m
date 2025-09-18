Return-Path: <linux-usb+bounces-26738-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAF1B21DCA
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 08:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A89C3B38BC
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 05:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1EE2C21F5;
	Tue, 12 Aug 2025 05:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USi1VOu9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F1F2E2DC0
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 05:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978161; cv=none; b=nk445sTewi2GYwx53MALmY0Vd9IHRPbERtK/VfSRQKMB6wyZySCcB+y1tjVGFk51N1SlK/GuiDiJHiEE2QxRMH6WyqH5CUSFnHPygzNQ/EcoR65Q/utZ6rRgJl3yExplYc1ECGVhXPKbPGpZvcf3imbRqd/S/1PoHKW3Ka1LYZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978161; c=relaxed/simple;
	bh=JQUvjX+esn3VOQ09k8xTcYDpFerXLwFI4n4YqQcY5fA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bOrd/U4Q8YChY0RZ33BlHog5DdSquPCcLVK0Frn4dr80TpoXiwJ7XoYN2mvLebtJHHQYK2ZhVWMlYyPQF/T7wXuccOSnGLshdgvHH3rFo258dl1g7pD0LZeNdvDnLYm9U0PAXlRoQCdFuvOR8fSwxUEOxzHUhn8HslWLEGFV9Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USi1VOu9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BK2gAL005519
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 05:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=G/gG+UHmxNe
	7LerAlOSE0aP8FVlAP6ai2if6JhILHH4=; b=USi1VOu9Ac3OnKiJjJMzv9rjObs
	c2llAkLBtc73gBgqnKvoalGa777xawZnnCNU1O+PfhfcpUxOLjnNvEwDUoBdjNMh
	LEhDmIAFGv+6ot5zuDKmgp/OJSZS8DOUPUzIaAFI/4AQo8zt6dl/A8BZXvoztGsG
	rq34IwN2U3Yp0ThonJyJTLpqsze/HQG9WGGNf6pS6Ek/oq7QcUSHWYlya4bGARn5
	UiGEXRqCcSdQhQfQSAyvQZNw9Wq5AUx6rXTFSrE8r8ie3rxKyy6pVdlWfwUSUeNN
	Ywds6G20TwcRZ8YCy5ihCqoBWYqaxplK/m7hLO0OQl+CYrbGJ9PueRscTMw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6jthv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 05:55:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2c36951518so2306808a12.2
        for <linux-usb@vger.kernel.org>; Mon, 11 Aug 2025 22:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754978158; x=1755582958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/gG+UHmxNe7LerAlOSE0aP8FVlAP6ai2if6JhILHH4=;
        b=Ad1YrVdUvwO4yVZbRWTiW7j5qXo2Luu6JLYoZl1kf9JFALf1pqMVXVE8go35GkYOeC
         xhUqf8s2rf58exjSiIZhUc67PS9rxZVZSOa83fj1yy7/iTizxi3R4ttuxvO6iX8yfLFs
         rZzPfIZk0D2hMi1uSrn+WDCt+RsoNJEgEhGNCe5fobwp4Gbdcx/mI7eHvgnZJrpQvd5f
         ghJngq95Ur8yvcidTEEaNgTwWWdAjGZU1mlybYz26Uyf+Pk67eeqEUEB6hYa03MAEdxM
         nZM0hHRrTgGYVCCvvvK3pIOpPavHDMJR/GUZ+mHsVRrhnSRCTugAOAEl4sOlBNyUyI3b
         IWJA==
X-Forwarded-Encrypted: i=1; AJvYcCWpQHYmHgC/370jXVMlNXv3K59l7QOdX2+sdsrvJqCfWBhk/29wuX3V2KIhtZeBknhC4lGD7eKAEGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV1+ysPyqxfbd4A109zM0hnqufyhrMX6Wf0lxEzbFe7cL3Tktl
	K8F6AGzAG+R0oJrpSiUSGzsvVP3tceoPA6ZQus9YaQwXmgb3wNtQV7bVZPzajJVwxINOMvtH5Hr
	pFX8bh8O/2JHxkZKTPVYY4VHNGwDKNXrIII6cWhjOpaboRMT2pHSMLOxCPBqVsWw=
X-Gm-Gg: ASbGncvp0ty/Qitc458cttjZ/v4sGagDr/rtcb8b/k7QkiuLPX6FDkP6RR1DskKfK0d
	fc3ORUM5azghnGEj0Y818tvVOtR/jXvUdJ6MpO4HQbBqNpaogY7rPFqeNx6q/YNsXWRu83TRWpv
	adO7IcSiLK6vkUuRdxG9T3sJ37za9mnYuZPa1iFHiSwX4V/q5eOBk9cGmRu8+8S0iau20v4ZhbM
	RSbPeuO9UuIdm7EskMRzo4MGHiar2KBYHyAuNj8Hrr1fArzGqU+dmRKEH7GQWZ96GRoT9p8TjD3
	LPgMBXGs4Lo2xiTXnNM9lLxT+hnzlPV4kxH/ff+NG6oz5SwafrOoWANzYf2tTqqwecYzFtlioOi
	O1A==
X-Received: by 2002:a17:903:947:b0:240:1ed3:fc1f with SMTP id d9443c01a7336-242fc211210mr34744745ad.12.1754978157491;
        Mon, 11 Aug 2025 22:55:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw/QanHb+zWPyHYRCRcDwEedFqKTwHXRZJYaieZ2tmPl7kYzOR60yl7cyzs+f7OW+mFxCsIQ==
X-Received: by 2002:a17:903:947:b0:240:1ed3:fc1f with SMTP id d9443c01a7336-242fc211210mr34744345ad.12.1754978156987;
        Mon, 11 Aug 2025 22:55:56 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e585sm288585985ad.40.2025.08.11.22.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 22:55:56 -0700 (PDT)
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
Subject: [PATCH v4 2/3] usb: dwc3: qcom: Implement glue callbacks to facilitate runtime suspend
Date: Tue, 12 Aug 2025 11:25:41 +0530
Message-Id: <20250812055542.1588528-3-krishna.kurapati@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX8OtET3fcHZWz
 D8SowgciFmWnOs87F56v6fGpxOLuysqoIKNdu6nsZU7zNex0yK/eFge/lA7so+CAbQGYO+Cff8H
 eKOmhIyPeMxQivGa9Iqjw4uQTV+lBMD7QrBlZLLZV7bFa5X+fw50mT4umXTw/Bb5SyozhQd9lqb
 a1/bh5+3PEsl8+dwBuvyiBm0PUcnDK6VsWRfPdouklSwt/VHaCh52FCAaZxegeOMCfcG4Q6JY6m
 DWEtjTyj8U2FWGTU9NN5ZR1zW2/krH4JEKE3Epyzmaetji9NpDs9xTnhhdQWMUQ2a2R0Zyu4x8A
 1MKWcUv571g2hPhIPwBy3Z4uD+L37HduJxCF5jn/WZl/5eCibQU6IxkQJJX0NyWzyIW+3qFQaI3
 RELIf+Ct
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689ad76e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ProRYBKZBCDr5nQBVQAA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 9CaoP2s7G_jbzCM4tdSXmQeeBP8ZznoI
X-Proofpoint-ORIG-GUID: 9CaoP2s7G_jbzCM4tdSXmQeeBP8ZznoI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

On Qualcomm DWC3 dual-role controllers, the conndone/disconnect events in
device mode are generated by controller when software writes to QSCRATCH
registers in Qualcomm Glue layer rather than the vbus line being routed to
dwc3 core IP for it to recognize and generate these events.

UTMI_OTG_VBUS_VALID  bit of QSCRATCH_HS_PHY_CTRL register needs to be set
to generate a connection done event and to be cleared for the controller to
generate a disconnect event during cable removal. When the disconnect is
not generated upon cable removal, the "connected" flag of dwc3 is left
marked as "true" and it blocks suspend routines and for that to happen upon
cable removal, the cable disconnect notification coming in via set_role
call need to be provided to the Qualcomm glue layer as well.

Currently, the way DWC3 core and Qualcomm legacy glue driver are designed,
there is no mechanism through which the DWC3 core can notify the Qualcomm
glue layer of any role changes which it receives via role switch. To
register these glue callbacks at probe time, for enabling core to notify
glue layer, the legacy Qualcomm driver has no way to find out when the
child driver probe was successful since it does not check for the same
during of_platform_populate.

Hence implement the following glue callbacks for flattened Qualcomm glue
driver:

1. set_role: To pass role switching information from drd layer to glue.
This information is needed to identify NONE/DEVICE mode switch and modify
QSCRATCH to generate connect-done event on device mode entry and disconnect
event on cable removal in device mode.

2. run_stop: When booting up in device mode, if autouspend is enabled and
userspace doesn't write UDC on boot, controller enters autosuspend. After
this, if the userspace writes to UDC in the future, run_stop notifier is
required to enable UTMI_OTG_VBUS_VALID of QSCRATCH so that connect done
event is generated after run_stop(1) is done to finish enumeration.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 78 +++++++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index a7eaefaeec4d..d89fbb1d8994 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -83,6 +83,8 @@ struct dwc3_qcom {
 	bool			pm_suspended;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
+
+	enum usb_role		current_role;
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -111,10 +113,6 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
 	readl(base + offset);
 }
 
-/*
- * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
- * validate that the in-core extcon support is functional
- */
 static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 {
 	if (enable) {
@@ -560,6 +558,55 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
 	return 0;
 }
 
+static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
+{
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+
+	if (qcom->current_role == next_role)
+		return;
+
+	if (pm_runtime_resume_and_get(qcom->dev)) {
+		dev_dbg(qcom->dev, "Failed to resume device\n");
+		return;
+	}
+
+	if (qcom->current_role == USB_ROLE_DEVICE)
+		dwc3_qcom_vbus_override_enable(qcom, false);
+	else if (qcom->current_role != USB_ROLE_DEVICE)
+		dwc3_qcom_vbus_override_enable(qcom, true);
+
+	pm_runtime_mark_last_busy(qcom->dev);
+	pm_runtime_put_sync(qcom->dev);
+
+	/*
+	 * Current role changes via usb_role_switch_set_role callback protected
+	 * internally by mutex lock.
+	 */
+	qcom->current_role = next_role;
+}
+
+static void dwc3_qcom_run_stop_notifier(struct dwc3 *dwc, bool is_on)
+{
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+
+	/*
+	 * When autosuspend is enabled and controller goes to suspend
+	 * after removing UDC from userspace, the next UDC write needs
+	 * setting of QSCRATCH VBUS_VALID to "1" to generate a connect
+	 * done event.
+	 */
+	if (!is_on)
+		return;
+
+	dwc3_qcom_vbus_override_enable(qcom, true);
+	pm_runtime_mark_last_busy(qcom->dev);
+}
+
+struct dwc3_glue_ops dwc3_qcom_glue_ops = {
+	.pre_set_role	= dwc3_qcom_set_role_notifier,
+	.pre_run_stop	= dwc3_qcom_run_stop_notifier,
+};
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct dwc3_probe_data	probe_data = {};
@@ -636,6 +683,23 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
+	qcom->mode = usb_get_dr_mode(dev);
+
+	if (qcom->mode == USB_DR_MODE_HOST) {
+		qcom->current_role = USB_ROLE_HOST;
+	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
+		qcom->current_role = USB_ROLE_DEVICE;
+		dwc3_qcom_vbus_override_enable(qcom, true);
+	} else {
+		if ((device_property_read_bool(dev, "usb-role-switch")) &&
+		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
+			qcom->current_role = USB_ROLE_HOST;
+		else
+			qcom->current_role = USB_ROLE_DEVICE;
+	}
+
+	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
+
 	qcom->dwc.dev = dev;
 	probe_data.dwc = &qcom->dwc;
 	probe_data.res = &res;
@@ -650,12 +714,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_core;
 
-	qcom->mode = usb_get_dr_mode(dev);
-
-	/* enable vbus override for device mode */
-	if (qcom->mode != USB_DR_MODE_HOST)
-		dwc3_qcom_vbus_override_enable(qcom, true);
-
 	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
 	device_init_wakeup(&pdev->dev, wakeup_source);
 
-- 
2.34.1


