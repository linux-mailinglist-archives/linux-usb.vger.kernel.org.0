Return-Path: <linux-usb+bounces-27692-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE77B47CC0
	for <lists+linux-usb@lfdr.de>; Sun,  7 Sep 2025 20:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2745E17DEE6
	for <lists+linux-usb@lfdr.de>; Sun,  7 Sep 2025 18:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1642329B799;
	Sun,  7 Sep 2025 18:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQqyvQc0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A3529AAFD
	for <linux-usb@vger.kernel.org>; Sun,  7 Sep 2025 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757268866; cv=none; b=Ah4uAlgDFOy+UBgwpzGxPATfIlfQ6XeJx5H9yRs5/VVFgIhfNTmzmkjojyOjhc/rORaFdZL/aLbJhrpfNx47EopElsiNWR938bt8fa8ZIo+FVBnlYBDLetH/OUjn8vvo9G38OgBk1TpGmJqbcvlwAfKEI/4q7seZd4C7EuLVvLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757268866; c=relaxed/simple;
	bh=FWBE8TbnpDoILTgny5SLZBpQh7y0VgQZiXP6ZqS4dy4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fOORcfHdaA8zJIb4w8oue78sIywbS1eaPDCchPbBZBx4y7thXmB9fl1OJjooPLZo1XHbgBA8H9YWyEyu136isct4/UfATuo0yT1oAOApRv2qp2nataIvx+v+LaWsJWrOBl5v1oUXSkDR4qQSUAPhyAAFQqNY7F0LKP2zk+6xw0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQqyvQc0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587FPbj8002796
	for <linux-usb@vger.kernel.org>; Sun, 7 Sep 2025 18:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zXbvHhAHt3e
	XLIh4fGNwnDZCLikwnim4WFNUvEbF34I=; b=aQqyvQc0HXfZCig0yNWtZPUzqtV
	XRX51ydJPaziJ4FujVFMTVQ7z7X+ZOEZhyKz1Rflhul7xtyzBNBPxoeIvfpLVij/
	/ktL6/Ey6vFSljnVqj+uAOhHa/BK+L2D1ddSLw2GrWq5oXd+C5/D7i96E/Tz/8Ck
	4MIUsq3ifXW1DWM2AWHvepeSV4oeWF3c8ZxnVw8CBZ8wVwsxvQdUo9yuRibLDtGk
	9Ks+bDko+jCpJDJQsKO8Iqpm1s44brak2bSY6pNKYaO3voDOQWTKc5SK053Tg3Nq
	kRftvkvhRcX4pyiOFRGuTQY6KzIuYCLx47HbGXPoMbPslFHG4sFlFs2ewMA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqftc4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 07 Sep 2025 18:14:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24456ebed7bso54755235ad.0
        for <linux-usb@vger.kernel.org>; Sun, 07 Sep 2025 11:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757268863; x=1757873663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXbvHhAHt3eXLIh4fGNwnDZCLikwnim4WFNUvEbF34I=;
        b=Z8FsAh/SKPaJtv8y1PMBXMNInIvty/IPjawzz6pXsDP8edVS1gQTqifT+DmqwHn+mf
         u5IzOesHTDfM0i2SNiLZhw4tWY+j/AgnnYFeTM3RrSBcIVUhuljSkIrio5HxjHlEO5Bk
         Ak8RIUHTuWsmvEGkfjxl2WMNtwLSFW/QrRWx94Qj7YUrxsJmrteCAv2ao/Z5TgHpYtF/
         rAu7KCJhUh2+0nYoIg/BWW7/WxpjIXrvmsUHTH5e6/GKNjJwIm98w/+AaP5MDYdoVckB
         m1xp3Phf+CKYlIBzh36b++DCK+SZtn3iyc69ZH4bO8ghXXGpeygnLHx4GUtBFBUzK22T
         e26Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCoJCcnk7coSaFvS9npOPENEutPSTZvw6xkOOmbnmZc4vvRP+/m7sdCV4LYQsLMCTRr+ykegTuJuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/v2CtCWbB6cAYykLAAxkvPbvvu/uEzfv/cnRa0nswHNc3wNJb
	OagT2tMLOe+DFXnnKXVG6Gbhu8y3gAPtFIiIix2/WM47AoCES8vIO1xWwMYJ98pm0dpuAvBQMOE
	41mxOJvpbBFzdmEY8PK5eBpTlO4nlBf5sJjZuDKMxafDyC0KSd80YGWgQ0YMRVUA=
X-Gm-Gg: ASbGnctULsT6N5MeV70HP95q9pm38RyhekYch5WgPEvRiSNcyi1/H45BME7jJkNbac4
	7Z7bKVyJoKu6Nwg9IsRmZYUt9yLTHeNaJtE3YWn0pfxCqehrNfdhC/8SBZdCDicgBmC+qdYcbdD
	Nf5j7PUXUd1oTPJV9+5YVDkQKhsS4sCu5+fnjC6cjS9CgAg4nFWW86Awgea8t9PeL7JrLoUyX61
	p7xhViWoe5VokLNYm96UmRDrhCPOK88FwlGESDpMaA8/wUw6u9Lus5X15jWeTMMGnxCuvCraJy4
	wfxO3QLKqjz/b2OJZ6imbnHiFVYY+1SZ1BuKbZcGd8AfMXx58xP7wMgXYrRi/hWQkmAad4Pgl5B
	d0w==
X-Received: by 2002:a17:903:1905:b0:24b:1585:6350 with SMTP id d9443c01a7336-25175f6e65emr79397065ad.11.1757268863155;
        Sun, 07 Sep 2025 11:14:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfb9X7Y0iEuBI2GhrDyKdeAQMyHma5HcIN4lLPMF+QE9VYRSDXVNdwO2//mXVcLKZed3gAiw==
X-Received: by 2002:a17:903:1905:b0:24b:1585:6350 with SMTP id d9443c01a7336-25175f6e65emr79396855ad.11.1757268862650;
        Sun, 07 Sep 2025 11:14:22 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cde5b6484sm84074765ad.19.2025.09.07.11.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 11:14:22 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v5 1/2] usb: dwc3: core: Introduce glue callbacks for flattened implementations
Date: Sun,  7 Sep 2025 23:44:11 +0530
Message-Id: <20250907181412.2174616-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250907181412.2174616-1-krishna.kurapati@oss.qualcomm.com>
References: <20250907181412.2174616-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4BIW35Nv0iilRCCATooyL26jLn781dEL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX8PpQWjvb+qPg
 HGfesE+tCq9rLeIvAim3MqPXMRMpwET2hDgQFnfqd0/O6+LAGQ6cJ93h3r4XeeiXfD1Y5f9x04K
 SJixL8akib5tpMGfKhNmL1K0AMKWUBaLfLLntQM1+kgFjV4NkKT51OVorK7VBUcb4tXghYmdOpj
 0cxT+kj/27MGQ4wqxRVLmJRFdAq/dtyez/SSVdiqAEdEccYFJpEUAb9vdtqAV1+o0mTqH8pvl2U
 lk0Sq9tJQCxgL4Q2BZD+L8XwE03Igki127GhIeQCac511hNSg5ofE51gB21gBTbBwFYOUG7x13e
 5uNPSf6N00rcrdMxXzs/C4KE6eE3Us4Vu73iItAIAlLRZIRIV8NgXkE3Z4U7FR1yJ/xHTtex195
 ktXPQa9+
X-Proofpoint-GUID: 4BIW35Nv0iilRCCATooyL26jLn781dEL
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68bdcb80 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=9UFxAfr_hboBSpCGZXUA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

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

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c   |  1 +
 drivers/usb/dwc3/core.h   | 26 ++++++++++++++++++++++++++
 drivers/usb/dwc3/drd.c    |  1 +
 drivers/usb/dwc3/gadget.c |  1 +
 4 files changed, 29 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 370fc524a468..ae140c356295 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2352,6 +2352,7 @@ static int dwc3_probe(struct platform_device *pdev)
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
index 554f997eb8c4..6f18b4840a25 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2662,6 +2662,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on)
 		dwc->pullups_connected = false;
 	}
 
+	dwc3_pre_run_stop(dwc, is_on);
 	dwc3_gadget_dctl_write_safe(dwc, reg);
 
 	do {
-- 
2.34.1


