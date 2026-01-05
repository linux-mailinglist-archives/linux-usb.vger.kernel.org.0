Return-Path: <linux-usb+bounces-31911-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF87CF3724
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 13:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C18EF3013999
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 12:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBB433ADB2;
	Mon,  5 Jan 2026 11:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGw+LJuk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PE/0r/dl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90F633AD8D
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 11:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767614055; cv=none; b=lAss77IG0XUd7MOzaLs+0N6TJ512atjpFa31LnOcsgaFjNqj1BjYRyLg3xBzbk9j9L+BikWAVbxt4dpxYN7Wf1zuuXl9hxoFU0zC5ngJ+S3aNRxY+FPQMba8Ezwy/zF33hjOrkmRgbP4+IsQMOJL6tQ8iGVCE2A3oDiqT13ilD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767614055; c=relaxed/simple;
	bh=zPWmUX/9wlvt9l2svqW+tsN1/7HESw2Gjg6RVx5GKvk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rfc1lKfalREtoD/yxXyBFyN1ay3Oq/RC+EF6ud+3BnXNe44XITzbMs9nlDkZD1w2ptGqDiB6IlXxPuOAyeMXjXjrCfquMUqYlwJzAbvNcOep3ztshiBrTq/KyAXF9cQJUTlBQ6wz3Dbwq0CvEQENTWSh3vvDvFoDpvoqrJjKypY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGw+LJuk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PE/0r/dl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058JKU53838852
	for <linux-usb@vger.kernel.org>; Mon, 5 Jan 2026 11:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oQfDAsbMwC5
	rUHdOBKSZZOiHN4z3jQlM55vyLc3e48k=; b=aGw+LJukUGOlfhELiuyOK7dx8/m
	zz2BtXiYrku0y1p3ctA498IWundSehp/Ktdni/X/nIfHQNqrSxpQP/Yj+tHYawgU
	727RDcGcIi/qkkpwLMDqERbrnimfY4tk1wV3j8USFJ6PGnfTm7O9Sf5Ib+9n+3jL
	SR7K1BnZrnW7SHU3hCX6+Gw8jxHgzk5WlEDvJYNSpzsLxw9lfXl5KoAyuWYC/Hot
	a2D8wFdCR1RTPN/nrrndG3no0Aw0y32tV4KfiCfdj4Tk5WABV9ROmM3wWJm5GAQd
	ODbPoEl5brmhBZ3Ko4etKEKhwbuQiVUbFvzD5guzjbRWDGI98g7jkaAqYrg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0huhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 11:54:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7f89d880668so20575610b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 03:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767614052; x=1768218852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQfDAsbMwC5rUHdOBKSZZOiHN4z3jQlM55vyLc3e48k=;
        b=PE/0r/dlnxjSz/U4z8nPtReNUS6kUZ3bxni6IXQiAwRTMsB/xCiVEfIBqjQ9vuzooi
         qfGhzrnU35Pz+iH1tJKWfjOfizUJ3CAmE+1jAJ7xIaJKGSzU9FGNQyjH4x2c9pk0DMr5
         RvKBaeupPKJvmPOz7H5CqzNYqtomDN0OSZjz2qSALYa3rNL2ixNzsJKIrOE4pnjGO6jX
         e9jy8QGwDRnHP/yR6GM7JxoeqW2Z7uZp04IXOg3sHrx3FVVTZZFNC+u3NjjuhEJtNO+v
         /nhOWuGrQNwtNY6v7X/iWMP6nFrWIc9S8ttw4P8akHEcUR0PUH15ihRz/Ucrb58zTe5i
         71fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614052; x=1768218852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQfDAsbMwC5rUHdOBKSZZOiHN4z3jQlM55vyLc3e48k=;
        b=BpG0D/T9rqpAheSQ1yY4kAsuTK8rtrc5nT6HkR3pb96yH5BAD9LthRKEbuNHWtYVyl
         xvZwuAOhddy7rBfQMLKaXxcppzR4HYuVBn7pqOb6qPm0Z7bQzXet7ErwmPv5djQIpf33
         1dPqqRgPmJdapWZ0s3FQw0HEVZYb88PLehCZ9PXOr7QC5Ti5bHE2FhBcjIzkwOJiXgBY
         Rc8GggRwNgri2+/1e43RMO7GR7mhPN4w/SfD+eXmsfR7lIQYoXXwgWwTnO5bR3yd0U5l
         ijezCa12huJAzzlQZ9aqb+3vGPIzmcXs5564bqTYlZ/lfU2YJGH1no1KzCbYFcFQzQ1k
         7H9g==
X-Gm-Message-State: AOJu0YzAihsGwT7JLgeeI+YKRQRtY35yT0wo3/3h60SUZdYLPHbvP+mV
	e7rTutlrB4jSpVRl3sZ5iB/DPJGosDV0xAK9xA3quU0/JZZjDUiH8LcjgC9t2fqGrXBXm/Wr2Ak
	1HnDGGG1STCVp1V4efSCXhlmbdnk/2hiPRpa7tfuZEpoN986TcWJasLTtgzt0zd4=
X-Gm-Gg: AY/fxX6bIFTF0Ru3cALHP1sDXNNrx3NxWa5PN+iNTfg3dc1ZmgIIBaP8ziMr5Wf5FPG
	je8n+oLrU3saHhdguGQYnoLEP4ShPiNeFJUD/2b0XZZM3bisNAQFS0uhc0MuPMkgGNblMXgLhum
	vayFLbHtwtWsRAmC+BWjovAKOUMqXW6cD6ERX4RFc8fwr4m3Hs7Rz+IF4Ze6Mtphl4GwmkFVBNC
	m7eQU6JRvoNB/Kq72oCj1z91NELmo0deutD87IVUcATtlOKnBGDJynDK0EFF+GsJMVZMNkbalFX
	V2ZM3ra0MngYy+4xiAVKFqqKel5ESgvL0YOn2ioq35x7Eys90f2mz8VxNubOmZyeXaeUGrlYAQK
	/WtKlVarLGSWenKGTzXZ+zqwfH050MeX+F9aUkw==
X-Received: by 2002:aa7:9a85:0:b0:7e8:4398:b35f with SMTP id d2e1a72fcca58-7ff666730e0mr35140971b3a.50.1767614051467;
        Mon, 05 Jan 2026 03:54:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXnCxsuZ5TDgY/fLSBasAltvetSoO+yxHG/U0FTju18lFMQe4oEwp6fXrG6ZcuvVBRgMamGQ==
X-Received: by 2002:aa7:9a85:0:b0:7e8:4398:b35f with SMTP id d2e1a72fcca58-7ff666730e0mr35140959b3a.50.1767614050876;
        Mon, 05 Jan 2026 03:54:10 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cd07sm48125744b3a.46.2026.01.05.03.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:54:10 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v2 3/3] usb: dwc3: Log dwc3 instance name in traces
Date: Mon,  5 Jan 2026 17:23:25 +0530
Message-Id: <20260105115325.1765176-4-prashanth.k@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695ba664 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8wWpkcANu2y20-MfkgoA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwNCBTYWx0ZWRfXzfxpgH9/m57N
 sQ5ULEPFwpnoCdj+N9Fpwuhb70XY2hYnOsNTCwaU23LMwnCrDb0VQG4N1Qu9Nu1t2l0XRt65sws
 dBPv9y5cU+J4RlF2yWLW2znt/gzY+bZY/K2q0KcEuTAHPLAGGr3macrHLZ1/71FSpWnoPurC2v+
 5CFd6R6ASvrvsjZ7MPKZWFuSOTkrwBoVGShA0eDaQ4bbPtbcAkVZeOsUKu5j3nroRclvNC4pv6s
 WoljoI8jnqIeJJ4uUacS9VfGbqQlSGSJFudHbRFw+3Lv0AVs/Y2Hu2i0/5A8dPopj2RyjRaTWjr
 yxs9nZA6rmru9BNrj3VxM2Vng1HKhY4rqHw6DMmPitPLNCHfXL2So/QXL87a/XffT4kQgMAAZwP
 3HXXi/wuz8EFYBR315XG/G0GscqwQdCJV0EPbZLEDZeiq3NcgrCi4fkikoO0hHCSnCPRhV8pnR+
 NgbqLD9Lla116Z+a3jQ==
X-Proofpoint-GUID: U9gTg9TFo2_z6oBy6sWnJE1I989RO7EM
X-Proofpoint-ORIG-GUID: U9gTg9TFo2_z6oBy6sWnJE1I989RO7EM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050104

When multiple DWC3 controllers are being used, trace events from
different instances get mixed up making debugging difficult as
there's no way to distinguish which instance generated the trace.

Append the base address of dwc3 controller to trace events, so that
the source instance is clearly identifiable.

Example trace output,
before ->  dwc3_event: event (00000101): Reset [U0]
after  ->  dwc3_event: 0a600000: event (00000101): Reset [U0]

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c   |  6 ++-
 drivers/usb/dwc3/core.h   |  2 +
 drivers/usb/dwc3/ep0.c    |  2 +-
 drivers/usb/dwc3/gadget.c |  2 +-
 drivers/usb/dwc3/io.h     |  4 +-
 drivers/usb/dwc3/trace.h  | 88 ++++++++++++++++++++++++---------------
 6 files changed, 66 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 670a9d4bfff2..3aa85f5f1c47 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -158,7 +158,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 	dwc3_writel(dwc, DWC3_GCTL, reg);
 
 	dwc->current_dr_role = mode;
-	trace_dwc3_set_prtcap(mode);
+	trace_dwc3_set_prtcap(dwc, mode);
 }
 EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
 
@@ -2193,6 +2193,10 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 	dwc_res = *res;
 	dwc_res.start += DWC3_GLOBALS_REGS_START;
 
+	/* Store the physical base address for logging in trace */
+	snprintf(dwc->base_addr, sizeof(dwc->base_addr), "%08llx",
+		 (unsigned long long)res->start);
+
 	if (dev->of_node) {
 		struct device_node *parent = of_get_parent(dev->of_node);
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 23188b910528..c16e47273ea0 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1178,6 +1178,7 @@ struct dwc3_glue_ops {
  * @wakeup_pending_funcs: Indicates whether any interface has requested for
  *			 function wakeup in bitmap format where bit position
  *			 represents interface_id.
+ * @base_addr: The HW base address of DWC3 controller.
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1412,6 +1413,7 @@ struct dwc3 {
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
 	u32			wakeup_pending_funcs;
+	char			base_addr[9];
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
index a85ba5ca7912..95c05e5de5b7 100644
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
index b6ba984bafcd..130c21f5dd1a 100644
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
+		__string(base_addr, dwc->base_addr)
 		__field(u32, mode)
 	),
 	TP_fast_assign(
+		__assign_str(base_addr);
 		__entry->mode = mode;
 	),
-	TP_printk("mode %s", dwc3_mode_string(__entry->mode))
+	TP_printk("%s: mode %s", __get_str(base_addr), dwc3_mode_string(__entry->mode))
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
+		__string(base_addr, dwc->base_addr)
 		__field(void *, base)
 		__field(u32, offset)
 		__field(u32, value)
 	),
 	TP_fast_assign(
+		__assign_str(base_addr);
 		__entry->base = base;
 		__entry->offset = offset;
 		__entry->value = value;
 	),
-	TP_printk("addr %p offset %04x value %08x",
+	TP_printk("%s: addr %p offset %04x value %08x",
+		__get_str(base_addr),
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
+		__string(base_addr, dwc->base_addr)
 		__field(u32, event)
 		__field(u32, ep0state)
 	),
 	TP_fast_assign(
+		__assign_str(base_addr);
 		__entry->event = event;
 		__entry->ep0state = dwc->ep0state;
 	),
-	TP_printk("event (%08x): %s", __entry->event,
+	TP_printk("%s: event (%08x): %s", __get_str(base_addr), __entry->event,
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
+		__string(base_addr, dwc->base_addr)
 		__field(__u8, bRequestType)
 		__field(__u8, bRequest)
 		__field(__u16, wValue)
@@ -97,13 +105,15 @@ DECLARE_EVENT_CLASS(dwc3_log_ctrl,
 		__field(__u16, wLength)
 	),
 	TP_fast_assign(
+		__assign_str(base_addr);
 		__entry->bRequestType = ctrl->bRequestType;
 		__entry->bRequest = ctrl->bRequest;
 		__entry->wValue = le16_to_cpu(ctrl->wValue);
 		__entry->wIndex = le16_to_cpu(ctrl->wIndex);
 		__entry->wLength = le16_to_cpu(ctrl->wLength);
 	),
-	TP_printk("%s", usb_decode_ctrl(__get_buf(DWC3_MSG_MAX), DWC3_MSG_MAX,
+	TP_printk("%s: %s", __get_str(base_addr), usb_decode_ctrl(__get_buf(DWC3_MSG_MAX),
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
+		__string(base_addr, req->dep->dwc->base_addr)
 		__string(name, req->dep->name)
 		__field(struct dwc3_request *, req)
 		__field(unsigned int, actual)
@@ -129,7 +140,7 @@ DECLARE_EVENT_CLASS(dwc3_log_request,
 		__field(int, no_interrupt)
 	),
 	TP_fast_assign(
-		__assign_str(name);
+		__assign_str(base_addr);
 		__entry->req = req;
 		__entry->actual = req->request.actual;
 		__entry->length = req->request.length;
@@ -138,8 +149,10 @@ DECLARE_EVENT_CLASS(dwc3_log_request,
 		__entry->short_not_ok = req->request.short_not_ok;
 		__entry->no_interrupt = req->request.no_interrupt;
 	),
-	TP_printk("%s: req %p length %u/%u %s%s%s ==> %d",
-		__get_str(name), __entry->req, __entry->actual, __entry->length,
+	TP_printk("%s: %s: req %p length %u/%u %s%s%s ==> %d",
+		__get_str(base_addr),
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
+		__string(base_addr, dwc->base_addr)
 		__field(unsigned int, cmd)
 		__field(u32, param)
 		__field(int, status)
 	),
 	TP_fast_assign(
+		__assign_str(base_addr);
 		__entry->cmd = cmd;
 		__entry->param = param;
 		__entry->status = status;
 	),
-	TP_printk("cmd '%s' [%x] param %08x --> status: %s",
-		dwc3_gadget_generic_cmd_string(__entry->cmd),
+	TP_printk("%s: cmd '%s' [%x] param %08x --> status: %s",
+		__get_str(base_addr), dwc3_gadget_generic_cmd_string(__entry->cmd),
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
+		__string(base_addr, dep->dwc->base_addr)
 		__string(name, dep->name)
 		__field(unsigned int, cmd)
 		__field(u32, param0)
@@ -210,6 +226,7 @@ DECLARE_EVENT_CLASS(dwc3_log_gadget_ep_cmd,
 		__field(int, cmd_status)
 	),
 	TP_fast_assign(
+		__assign_str(base_addr);
 		__assign_str(name);
 		__entry->cmd = cmd;
 		__entry->param0 = params->param0;
@@ -217,8 +234,9 @@ DECLARE_EVENT_CLASS(dwc3_log_gadget_ep_cmd,
 		__entry->param2 = params->param2;
 		__entry->cmd_status = cmd_status;
 	),
-	TP_printk("%s: cmd '%s' [%x] params %08x %08x %08x --> status: %s",
-		__get_str(name), dwc3_gadget_ep_cmd_string(__entry->cmd),
+	TP_printk("%s: %s: cmd '%s' [%x] params %08x %08x %08x --> status: %s",
+		__get_str(base_addr), __get_str(name),
+		dwc3_gadget_ep_cmd_string(__entry->cmd),
 		__entry->cmd, __entry->param0,
 		__entry->param1, __entry->param2,
 		dwc3_ep_cmd_status_string(__entry->cmd_status)
@@ -235,6 +253,7 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 	TP_PROTO(struct dwc3_ep *dep, struct dwc3_trb *trb),
 	TP_ARGS(dep, trb),
 	TP_STRUCT__entry(
+		__string(base_addr, dep->dwc->base_addr)
 		__string(name, dep->name)
 		__field(struct dwc3_trb *, trb)
 		__field(u32, bpl)
@@ -246,6 +265,7 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__field(u32, dequeue)
 	),
 	TP_fast_assign(
+		__assign_str(base_addr);
 		__assign_str(name);
 		__entry->trb = trb;
 		__entry->bpl = trb->bpl;
@@ -256,8 +276,8 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__entry->enqueue = dep->trb_enqueue;
 		__entry->dequeue = dep->trb_dequeue;
 	),
-	TP_printk("%s: trb %p (E%d:D%d) buf %08x%08x size %s%d ctrl %08x sofn %08x (%c%c%c%c:%c%c:%s)",
-		__get_str(name), __entry->trb, __entry->enqueue,
+	TP_printk("%s: %s: trb %p (E%d:D%d) buf %08x%08x size %s%d ctrl %08x sofn %08x (%c%c%c%c:%c%c:%s)",
+		__get_str(base_addr), __get_str(name), __entry->trb, __entry->enqueue,
 		__entry->dequeue, __entry->bph, __entry->bpl,
 		({char *s;
 		int pcm = ((__entry->size >> 24) & 3) + 1;
@@ -307,6 +327,7 @@ DECLARE_EVENT_CLASS(dwc3_log_ep,
 	TP_PROTO(struct dwc3_ep *dep),
 	TP_ARGS(dep),
 	TP_STRUCT__entry(
+		__string(base_addr, dep->dwc->base_addr)
 		__string(name, dep->name)
 		__field(unsigned int, maxpacket)
 		__field(unsigned int, maxpacket_limit)
@@ -318,6 +339,7 @@ DECLARE_EVENT_CLASS(dwc3_log_ep,
 		__field(u8, trb_dequeue)
 	),
 	TP_fast_assign(
+		__assign_str(base_addr);
 		__assign_str(name);
 		__entry->maxpacket = dep->endpoint.maxpacket;
 		__entry->maxpacket_limit = dep->endpoint.maxpacket_limit;
@@ -328,8 +350,8 @@ DECLARE_EVENT_CLASS(dwc3_log_ep,
 		__entry->trb_enqueue = dep->trb_enqueue;
 		__entry->trb_dequeue = dep->trb_dequeue;
 	),
-	TP_printk("%s: mps %d/%d streams %d burst %d ring %d/%d flags %c:%c%c%c%c:%c",
-		__get_str(name), __entry->maxpacket,
+	TP_printk("%s: %s: mps %d/%d streams %d burst %d ring %d/%d flags %c:%c%c%c%c:%c",
+		__get_str(base_addr), __get_str(name), __entry->maxpacket,
 		__entry->maxpacket_limit, __entry->max_streams,
 		__entry->maxburst, __entry->trb_enqueue,
 		__entry->trb_dequeue,
-- 
2.34.1


