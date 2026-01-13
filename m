Return-Path: <linux-usb+bounces-32243-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0645AD18148
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 11:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECDD4305F501
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 10:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94DE28466C;
	Tue, 13 Jan 2026 10:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4+N3upW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eE7zErjk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1F8279DC2
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 10:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300461; cv=none; b=LQwFPamEdh/orJVDNwFjRmLQaoM01kOYTt7PksN2gmlWYmPePKlazxjKXXVlKL7sKXUMDw+0qBhdOd3n5gJWp10tPsmxw88XDuNdY9s7Q09gum3XL6Mmw3Bzt+6f2eHa25QtQMlLvWRQtVqTjegkkh8gy8YSzHlgCIx7m0AMs9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300461; c=relaxed/simple;
	bh=N2VNzpk1OUWD/uqqxAkqSpmrQ8cyZK9ByiBM0cM/fa8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kWqB1pOFC6wxKWgOcH5W9DpeI2FXI9Xe+UT4S+g+HC5DuQOKndfVxlvlvIPFRKi6Ds4vATdQ0+BHHx2Wry38Y3vNxcGn6muhuHTt6eHK0Ga1XUreEYRfAYZpCCcUzKp7fpFppUQrT/WdWWH7TpyPXsNOT/2c0VH4SWo1vtgmaWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4+N3upW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eE7zErjk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7BCvQ176979
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 10:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UadwJzR+y3c
	uoUQZH5RX0jLPGRcNPra+nfG9fdJyCOU=; b=X4+N3upWgTXfCfsrlT94RoTQMc9
	KDuPZ4nnhsMXeJJsoPb/y4N91XAR5bG2HZzXr2o+YgGz9M9GOG1o6WRZmXd9raTr
	ij+lBNf7C+kakJMK/aF6fzZgieSIA7fVlc1bHQqlL+oHuOoKgff7cGCFxNI3PM4T
	CXc4hMrkynLJ1oqD8xTpszEl0j9dbM4B+9wUDJR684dsmHSIIxsJd3FvfGAutPUr
	h4MusFu3IECG3bJh1pCPQkd30yI8kEQqvzlVSQevdMiFRyyhkpQRIGZXl9xA6zHD
	bswJ8lfFnFrQPNCpltlhVDqo+Z1L+sKrf+IKPGSerqqtjpyAiElVB+HjNfw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f2ure-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 10:34:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso13950611a91.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 02:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300457; x=1768905257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UadwJzR+y3cuoUQZH5RX0jLPGRcNPra+nfG9fdJyCOU=;
        b=eE7zErjk6UszF2901/wukDnw6rmgsWHIsetvqpKEAIdTetRuUxe6gmvAIFKjRi/sqj
         89ENK0l8IgniSYFpEPOqL7uT2h2eMgENFbnatX3lGxHLbjCEigsmMwmJ8mYsRs/rFpNG
         z2tZQgkYa3zRG5z6FYpdOXKkAzJj+kaDiw9xM6aWk2O6vhFaNy/sVWRUdWqa5KSFkU9/
         ivsrgK54z7KFBn6iT5Y3BbijrIcdLBKXVnkO4q6hFXCmbnD8xA/QqLRMJatklNPMOne6
         SJLoZ4wpUMjP/45gMN0UG5Z5E1Ywf5ifGzPSimuOfCpD/stBLx+jByQPojgx+JYdrLLo
         biZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300457; x=1768905257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UadwJzR+y3cuoUQZH5RX0jLPGRcNPra+nfG9fdJyCOU=;
        b=Pac3JhD6MCJ8K1IMSE09dZ1BjVJ6XYGICj/+6yNZJcOZfmjbuO2HtcT43viaBrSpOn
         lWwwFwZVo/WiZEVp21Wj5YOocb3iNEjZgmtU6RRikOm4LuufIvSvVvU03XGCbH96KV0D
         WF18BxYYGfnxDqxzA14QNrclFuOhZYWQWajE38EPf8iX6h31+/4ToYdi/xVR7ghPEDRV
         hIkTmB75xqAAFvxZWVBq2yakckqInJgnif7IQsTpozSQEQJ0zH3ESjygWDISVj8uVH2E
         XRhYkAQeeZGgLCiWkTTmvZ9N1LM/XdXLY90lQ73ai/jD5i5jTE/4iC6uoIkhzSKNKxz+
         VV2Q==
X-Gm-Message-State: AOJu0YzUquT8ZA9ajY8rsjE7Cxjk1jrN8tUMFEorohmh+O39gi6SvfmV
	2ga/s1GzS3ESrdHyXfia4OLWb7lDzK5bUf0xQlIbadnfK2k/3+unNjD9copOz4YTs8ZXxURbAav
	T66AUDkH6zUK1a+w/O+7M6G4ojEEHmS2Xl5WqyJnaQL/XHs21fvxrX9iqpyu7II4=
X-Gm-Gg: AY/fxX6ZRdHr2MPdnvKAeXvW0C6GH0IiZSz20patXafZxAKE+wQOn847e3Tqs+KnNAL
	mXMcViTUn31FJlxm6tczm5M6Zzs8+GKKyIkEp+6olUS8uq0fioH7N5e44LKH1KFwkO9ocpKTCNZ
	r8QKGdc9VSCzeY3vk/nXiemdek0M9k0CXX/TF/mD69VCb9nm9lQjGz7ByUKgZBq6xVLcjdoMdCB
	WXQjKQFeTSzVqMYASUgvR31mp2xKKxrwwTjNsyP4+mf5A03wBLafUoTkiUv5LsSw5GX8o6DNZFh
	KUa8fzG5zLQW+RgY1CYxdueOoILLayeD1aQRY4MnRUzqMVOMHBl2wDpKeHacisOuN6JFx/Dxr/v
	hADiuJ3S+xj9XtOzOF/eyANTlytr6uCV8fD4WEA==
X-Received: by 2002:a05:6a21:6d91:b0:366:14ac:e1d8 with SMTP id adf61e73a8af0-3898f9bcfd0mr19260591637.62.1768300456708;
        Tue, 13 Jan 2026 02:34:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcLvKMIuDz2EnZK3tVeoNEoRXZOEa3NbThsu5K5DEDyKTCSCJL3KC8t3gpci2vYKklSXTniA==
X-Received: by 2002:a05:6a21:6d91:b0:366:14ac:e1d8 with SMTP id adf61e73a8af0-3898f9bcfd0mr19260569637.62.1768300456180;
        Tue, 13 Jan 2026 02:34:16 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b2edsm19769911a12.32.2026.01.13.02.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:34:15 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v3 3/3] usb: dwc3: Log dwc3 instance name in traces
Date: Tue, 13 Jan 2026 16:04:00 +0530
Message-Id: <20260113103400.2347763-4-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113103400.2347763-1-prashanth.k@oss.qualcomm.com>
References: <20260113103400.2347763-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OSBTYWx0ZWRfX/nG5nxF6JBhl
 XoNLcm6KXcH/9uSI2XXCqNhttMFzwtd37WdwhF+gA+fU46HMjS0MMR6fQjly385hynyzkrxV3RZ
 uAPZSBRvpjrE04a+VmNqsRCmaQq0jz9sv3qYfceIuWfr5FE5Q5hWFrydQmOh3FHMLTJi0aL6Fvu
 pm11Qj2CAOdxZlxCLJQ51khBxlfuO6JkQlactu9HwvBsBZgZ3sd9AV4RHuARwF3sZxkPtxpU9Rf
 I7uIas8R1mZ2Cu+9LmzvARv8hKQ/31rVKP0QFPwoZKaxR7DTrFO664IgksHSrR3z6Ju40KMYn+e
 AUQPHULcuOOw+KwxpUds80IoKH6XZWDx3thQn6WRQtDLbxZdEwkt0Mn6fpbQN7W2LEmAlq8Y7VR
 yZ078RaSVeeRt1EcUQ7KSDHxjgZES0uKDvUGBgipeV8Xjuatr+aNEyWpLqohS3uXZbGWjyF6unu
 622CMCk9AlZVhjMosew==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=69661fa9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pFfNapkC30Hq8z2voUcA:9 a=ZJcsyrhuACFDsyty:21
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: BN561iZ3VAEfDsjxuef6fmbAifptcAQq
X-Proofpoint-ORIG-GUID: BN561iZ3VAEfDsjxuef6fmbAifptcAQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130089

When multiple DWC3 controllers are being used, trace events from
different instances get mixed up making debugging difficult as
there's no way to distinguish which instance generated the trace.

Use the register base address of dwc3 controller, which is obtained
from DT/ACPI, and append it to the trace events, so that the source
instance is clearly identifiable.

Example trace output,
before ->  dwc3_event: event (00000101): Reset [U0]
after  ->  dwc3_event: 0a600000: event (00000101): Reset [U0]

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c   |  5 ++-
 drivers/usb/dwc3/core.h   |  3 ++
 drivers/usb/dwc3/ep0.c    |  2 +-
 drivers/usb/dwc3/gadget.c |  2 +-
 drivers/usb/dwc3/io.h     |  4 +-
 drivers/usb/dwc3/trace.h  | 88 ++++++++++++++++++++++++---------------
 6 files changed, 66 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 670a9d4bfff2..125616489e04 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -158,7 +158,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 	dwc3_writel(dwc, DWC3_GCTL, reg);
 
 	dwc->current_dr_role = mode;
-	trace_dwc3_set_prtcap(mode);
+	trace_dwc3_set_prtcap(dwc, mode);
 }
 EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
 
@@ -2193,6 +2193,9 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 	dwc_res = *res;
 	dwc_res.start += DWC3_GLOBALS_REGS_START;
 
+	/* Store the base register address for using it in traces later */
+	dwc->address = (u32)res->start;
+
 	if (dev->of_node) {
 		struct device_node *parent = of_get_parent(dev->of_node);
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 23188b910528..a8308087f786 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1178,6 +1178,8 @@ struct dwc3_glue_ops {
  * @wakeup_pending_funcs: Indicates whether any interface has requested for
  *			 function wakeup in bitmap format where bit position
  *			 represents interface_id.
+ * @address: The register base address of controller as specified in DT/ACPI.
+ *	     Stored as string & used for logging the controller instance in trace.
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1412,6 +1414,7 @@ struct dwc3 {
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
 	u32			wakeup_pending_funcs;
+	u32			address;
 };
 
 #define INCRX_BURST_MODE 0
diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index a8ff8db610d3..bfe616194dfa 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -833,7 +833,7 @@ static void dwc3_ep0_inspect_setup(struct dwc3 *dwc,
 	if (!dwc->gadget_driver || !dwc->softconnect || !dwc->connected)
 		goto out;
 
-	trace_dwc3_ctrl_req(ctrl);
+	trace_dwc3_ctrl_req(dwc, ctrl);
 
 	len = le16_to_cpu(ctrl->wLength);
 	if (!len) {
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 9355c952c140..384963151ece 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -278,7 +278,7 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
 		status = -ETIMEDOUT;
 	}
 
-	trace_dwc3_gadget_generic_cmd(cmd, param, status);
+	trace_dwc3_gadget_generic_cmd(dwc, cmd, param, status);
 
 	return ret;
 }
diff --git a/drivers/usb/dwc3/io.h b/drivers/usb/dwc3/io.h
index 7dd0c1e0cf74..cad9a2ae1547 100644
--- a/drivers/usb/dwc3/io.h
+++ b/drivers/usb/dwc3/io.h
@@ -33,7 +33,7 @@ static inline u32 dwc3_readl(struct dwc3 *dwc, u32 offset)
 	 * documentation, so we revert it back to the proper addresses, the
 	 * same way they are described on SNPS documentation
 	 */
-	trace_dwc3_readl(base - DWC3_GLOBALS_REGS_START, offset, value);
+	trace_dwc3_readl(dwc, base - DWC3_GLOBALS_REGS_START, offset, value);
 
 	return value;
 }
@@ -54,7 +54,7 @@ static inline void dwc3_writel(struct dwc3 *dwc, u32 offset, u32 value)
 	 * documentation, so we revert it back to the proper addresses, the
 	 * same way they are described on SNPS documentation
 	 */
-	trace_dwc3_writel(base - DWC3_GLOBALS_REGS_START, offset, value);
+	trace_dwc3_writel(dwc, base - DWC3_GLOBALS_REGS_START, offset, value);
 }
 
 #endif /* __DRIVERS_USB_DWC3_IO_H */
diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index b6ba984bafcd..6c2c4990917a 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -20,63 +20,70 @@
 #include "debug.h"
 
 DECLARE_EVENT_CLASS(dwc3_log_set_prtcap,
-	TP_PROTO(u32 mode),
-	TP_ARGS(mode),
+	TP_PROTO(struct dwc3 *dwc, u32 mode),
+	TP_ARGS(dwc, mode),
 	TP_STRUCT__entry(
+		__field(u32, address)
 		__field(u32, mode)
 	),
 	TP_fast_assign(
+		__entry->address = dwc->address;
 		__entry->mode = mode;
 	),
-	TP_printk("mode %s", dwc3_mode_string(__entry->mode))
+	TP_printk("%08x: mode %s", __entry->address, dwc3_mode_string(__entry->mode))
 );
 
 DEFINE_EVENT(dwc3_log_set_prtcap, dwc3_set_prtcap,
-	TP_PROTO(u32 mode),
-	TP_ARGS(mode)
+	TP_PROTO(struct dwc3 *dwc, u32 mode),
+	TP_ARGS(dwc, mode)
 );
 
 DECLARE_EVENT_CLASS(dwc3_log_io,
-	TP_PROTO(void *base, u32 offset, u32 value),
-	TP_ARGS(base, offset, value),
+	TP_PROTO(struct dwc3 *dwc, void *base, u32 offset, u32 value),
+	TP_ARGS(dwc, base, offset, value),
 	TP_STRUCT__entry(
+		__field(u32, address)
 		__field(void *, base)
 		__field(u32, offset)
 		__field(u32, value)
 	),
 	TP_fast_assign(
+		__entry->address = dwc->address;
 		__entry->base = base;
 		__entry->offset = offset;
 		__entry->value = value;
 	),
-	TP_printk("addr %p offset %04x value %08x",
+	TP_printk("%08x: addr %p offset %04x value %08x",
+		__entry->address,
 		__entry->base + __entry->offset,
 		__entry->offset,
 		__entry->value)
 );
 
 DEFINE_EVENT(dwc3_log_io, dwc3_readl,
-	TP_PROTO(void __iomem *base, u32 offset, u32 value),
-	TP_ARGS(base, offset, value)
+	TP_PROTO(struct dwc3 *dwc, void __iomem *base, u32 offset, u32 value),
+	TP_ARGS(dwc, base, offset, value)
 );
 
 DEFINE_EVENT(dwc3_log_io, dwc3_writel,
-	TP_PROTO(void __iomem *base, u32 offset, u32 value),
-	TP_ARGS(base, offset, value)
+	TP_PROTO(struct dwc3 *dwc, void __iomem *base, u32 offset, u32 value),
+	TP_ARGS(dwc, base, offset, value)
 );
 
 DECLARE_EVENT_CLASS(dwc3_log_event,
 	TP_PROTO(u32 event, struct dwc3 *dwc),
 	TP_ARGS(event, dwc),
 	TP_STRUCT__entry(
+		__field(u32, address)
 		__field(u32, event)
 		__field(u32, ep0state)
 	),
 	TP_fast_assign(
+		__entry->address = dwc->address;
 		__entry->event = event;
 		__entry->ep0state = dwc->ep0state;
 	),
-	TP_printk("event (%08x): %s", __entry->event,
+	TP_printk("%08x: event (%08x): %s", __entry->address, __entry->event,
 			dwc3_decode_event(__get_buf(DWC3_MSG_MAX), DWC3_MSG_MAX,
 					__entry->event, __entry->ep0state))
 );
@@ -87,9 +94,10 @@ DEFINE_EVENT(dwc3_log_event, dwc3_event,
 );
 
 DECLARE_EVENT_CLASS(dwc3_log_ctrl,
-	TP_PROTO(struct usb_ctrlrequest *ctrl),
-	TP_ARGS(ctrl),
+	TP_PROTO(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl),
+	TP_ARGS(dwc, ctrl),
 	TP_STRUCT__entry(
+		__field(u32, address)
 		__field(__u8, bRequestType)
 		__field(__u8, bRequest)
 		__field(__u16, wValue)
@@ -97,13 +105,15 @@ DECLARE_EVENT_CLASS(dwc3_log_ctrl,
 		__field(__u16, wLength)
 	),
 	TP_fast_assign(
+		__entry->address = dwc->address;
 		__entry->bRequestType = ctrl->bRequestType;
 		__entry->bRequest = ctrl->bRequest;
 		__entry->wValue = le16_to_cpu(ctrl->wValue);
 		__entry->wIndex = le16_to_cpu(ctrl->wIndex);
 		__entry->wLength = le16_to_cpu(ctrl->wLength);
 	),
-	TP_printk("%s", usb_decode_ctrl(__get_buf(DWC3_MSG_MAX), DWC3_MSG_MAX,
+	TP_printk("%08x: %s", __entry->address, usb_decode_ctrl(__get_buf(DWC3_MSG_MAX),
+					DWC3_MSG_MAX,
 					__entry->bRequestType,
 					__entry->bRequest, __entry->wValue,
 					__entry->wIndex, __entry->wLength)
@@ -111,14 +121,15 @@ DECLARE_EVENT_CLASS(dwc3_log_ctrl,
 );
 
 DEFINE_EVENT(dwc3_log_ctrl, dwc3_ctrl_req,
-	TP_PROTO(struct usb_ctrlrequest *ctrl),
-	TP_ARGS(ctrl)
+	TP_PROTO(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl),
+	TP_ARGS(dwc, ctrl)
 );
 
 DECLARE_EVENT_CLASS(dwc3_log_request,
 	TP_PROTO(struct dwc3_request *req),
 	TP_ARGS(req),
 	TP_STRUCT__entry(
+		__field(u32, address)
 		__string(name, req->dep->name)
 		__field(struct dwc3_request *, req)
 		__field(unsigned int, actual)
@@ -129,7 +140,7 @@ DECLARE_EVENT_CLASS(dwc3_log_request,
 		__field(int, no_interrupt)
 	),
 	TP_fast_assign(
-		__assign_str(name);
+		__entry->address = req->dep->dwc->address;
 		__entry->req = req;
 		__entry->actual = req->request.actual;
 		__entry->length = req->request.length;
@@ -138,8 +149,10 @@ DECLARE_EVENT_CLASS(dwc3_log_request,
 		__entry->short_not_ok = req->request.short_not_ok;
 		__entry->no_interrupt = req->request.no_interrupt;
 	),
-	TP_printk("%s: req %p length %u/%u %s%s%s ==> %d",
-		__get_str(name), __entry->req, __entry->actual, __entry->length,
+	TP_printk("%08x: %s: req %p length %u/%u %s%s%s ==> %d",
+		__entry->address,
+		__get_str(name), __entry->req,
+		__entry->actual, __entry->length,
 		__entry->zero ? "Z" : "z",
 		__entry->short_not_ok ? "S" : "s",
 		__entry->no_interrupt ? "i" : "I",
@@ -173,28 +186,30 @@ DEFINE_EVENT(dwc3_log_request, dwc3_gadget_giveback,
 );
 
 DECLARE_EVENT_CLASS(dwc3_log_generic_cmd,
-	TP_PROTO(unsigned int cmd, u32 param, int status),
-	TP_ARGS(cmd, param, status),
+	TP_PROTO(struct dwc3 *dwc, unsigned int cmd, u32 param, int status),
+	TP_ARGS(dwc, cmd, param, status),
 	TP_STRUCT__entry(
+		__field(u32, address)
 		__field(unsigned int, cmd)
 		__field(u32, param)
 		__field(int, status)
 	),
 	TP_fast_assign(
+		__entry->address = dwc->address;
 		__entry->cmd = cmd;
 		__entry->param = param;
 		__entry->status = status;
 	),
-	TP_printk("cmd '%s' [%x] param %08x --> status: %s",
-		dwc3_gadget_generic_cmd_string(__entry->cmd),
+	TP_printk("%08x: cmd '%s' [%x] param %08x --> status: %s",
+		__entry->address, dwc3_gadget_generic_cmd_string(__entry->cmd),
 		__entry->cmd, __entry->param,
 		dwc3_gadget_generic_cmd_status_string(__entry->status)
 	)
 );
 
 DEFINE_EVENT(dwc3_log_generic_cmd, dwc3_gadget_generic_cmd,
-	TP_PROTO(unsigned int cmd, u32 param, int status),
-	TP_ARGS(cmd, param, status)
+	TP_PROTO(struct dwc3 *dwc, unsigned int cmd, u32 param, int status),
+	TP_ARGS(dwc, cmd, param, status)
 );
 
 DECLARE_EVENT_CLASS(dwc3_log_gadget_ep_cmd,
@@ -202,6 +217,7 @@ DECLARE_EVENT_CLASS(dwc3_log_gadget_ep_cmd,
 		struct dwc3_gadget_ep_cmd_params *params, int cmd_status),
 	TP_ARGS(dep, cmd, params, cmd_status),
 	TP_STRUCT__entry(
+		__field(u32, address)
 		__string(name, dep->name)
 		__field(unsigned int, cmd)
 		__field(u32, param0)
@@ -210,6 +226,7 @@ DECLARE_EVENT_CLASS(dwc3_log_gadget_ep_cmd,
 		__field(int, cmd_status)
 	),
 	TP_fast_assign(
+		__entry->address = dep->dwc->address;
 		__assign_str(name);
 		__entry->cmd = cmd;
 		__entry->param0 = params->param0;
@@ -217,8 +234,9 @@ DECLARE_EVENT_CLASS(dwc3_log_gadget_ep_cmd,
 		__entry->param2 = params->param2;
 		__entry->cmd_status = cmd_status;
 	),
-	TP_printk("%s: cmd '%s' [%x] params %08x %08x %08x --> status: %s",
-		__get_str(name), dwc3_gadget_ep_cmd_string(__entry->cmd),
+	TP_printk("%08x: %s: cmd '%s' [%x] params %08x %08x %08x --> status: %s",
+		__entry->address, __get_str(name),
+		dwc3_gadget_ep_cmd_string(__entry->cmd),
 		__entry->cmd, __entry->param0,
 		__entry->param1, __entry->param2,
 		dwc3_ep_cmd_status_string(__entry->cmd_status)
@@ -235,6 +253,7 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 	TP_PROTO(struct dwc3_ep *dep, struct dwc3_trb *trb),
 	TP_ARGS(dep, trb),
 	TP_STRUCT__entry(
+		__field(u32, address)
 		__string(name, dep->name)
 		__field(struct dwc3_trb *, trb)
 		__field(u32, bpl)
@@ -246,6 +265,7 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__field(u32, dequeue)
 	),
 	TP_fast_assign(
+		__entry->address = dep->dwc->address;
 		__assign_str(name);
 		__entry->trb = trb;
 		__entry->bpl = trb->bpl;
@@ -256,8 +276,8 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__entry->enqueue = dep->trb_enqueue;
 		__entry->dequeue = dep->trb_dequeue;
 	),
-	TP_printk("%s: trb %p (E%d:D%d) buf %08x%08x size %s%d ctrl %08x sofn %08x (%c%c%c%c:%c%c:%s)",
-		__get_str(name), __entry->trb, __entry->enqueue,
+	TP_printk("%08x: %s: trb %p (E%d:D%d) buf %08x%08x size %s%d ctrl %08x sofn %08x (%c%c%c%c:%c%c:%s)",
+		__entry->address, __get_str(name), __entry->trb, __entry->enqueue,
 		__entry->dequeue, __entry->bph, __entry->bpl,
 		({char *s;
 		int pcm = ((__entry->size >> 24) & 3) + 1;
@@ -307,6 +327,7 @@ DECLARE_EVENT_CLASS(dwc3_log_ep,
 	TP_PROTO(struct dwc3_ep *dep),
 	TP_ARGS(dep),
 	TP_STRUCT__entry(
+		__field(u32, address)
 		__string(name, dep->name)
 		__field(unsigned int, maxpacket)
 		__field(unsigned int, maxpacket_limit)
@@ -318,6 +339,7 @@ DECLARE_EVENT_CLASS(dwc3_log_ep,
 		__field(u8, trb_dequeue)
 	),
 	TP_fast_assign(
+		__entry->address = dep->dwc->address;
 		__assign_str(name);
 		__entry->maxpacket = dep->endpoint.maxpacket;
 		__entry->maxpacket_limit = dep->endpoint.maxpacket_limit;
@@ -328,8 +350,8 @@ DECLARE_EVENT_CLASS(dwc3_log_ep,
 		__entry->trb_enqueue = dep->trb_enqueue;
 		__entry->trb_dequeue = dep->trb_dequeue;
 	),
-	TP_printk("%s: mps %d/%d streams %d burst %d ring %d/%d flags %c:%c%c%c%c:%c",
-		__get_str(name), __entry->maxpacket,
+	TP_printk("%08x: %s: mps %d/%d streams %d burst %d ring %d/%d flags %c:%c%c%c%c:%c",
+		__entry->address, __get_str(name), __entry->maxpacket,
 		__entry->maxpacket_limit, __entry->max_streams,
 		__entry->maxburst, __entry->trb_enqueue,
 		__entry->trb_dequeue,
-- 
2.34.1


