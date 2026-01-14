Return-Path: <linux-usb+bounces-32325-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E93D1DDFB
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 11:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCC803039F85
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 10:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27ECA3933FE;
	Wed, 14 Jan 2026 10:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6aZDhaG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7PMpVxJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B52138A739
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385287; cv=none; b=Vg0WmqIpaGJbd+4nSOeltpBlQ6JVanmahYCqxJTh7MjXdDLQ8xA/Pzv63r4J5DcoyYAc7Ch1aBRjUSy/32wdd9x+tqvJs5+fNZU2bHWQkpht6pVKBL0M2TT+uTeXcz+NwgVK2zIryP73RsG9XFeP7BGIBKutnqbskcrqxkoGgyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385287; c=relaxed/simple;
	bh=DCXEvSUPfCjrotmSUir63Vcs6Jwns3pGCES9UK71IMk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DiX4IuwgAV+sYcrvFimLhOUgNzumljHQqCq3PjVg79v7r6B8Vrm86jMgVxyNCINKzW+ln+osFsxBryIHT90NkUpkpWHOkXX/Xw1+HuqwxUtiergnT9DZWLukLj+nEQrl1ngTWtSFKVLgBx+t3pSeM0adgT2YjOwnONSICmYlWjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6aZDhaG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7PMpVxJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7j67h3270958
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 10:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tgZmHHUg3P0
	CjUtuQ51R9XAhuVkxwDKnHl6ppMZ1C2E=; b=D6aZDhaG59/pEz1K5fut1Fb9gVu
	np2LeYbCPRlPIIInvnm4TG/Xfd5KGWCTSurKfPDJ2uPSbD444DuwEgLftUGhnrE0
	3TlJWSthguO0B3m8ESNKLVrJLe0VVYHYLtix3soXdIRQy1LqNZeYrmrk/NXLThCa
	cpDUEhEiYNl31IEzHY3sDjGCOJJigMvC8LLvgSJPqv+bgAbNt8TxTOTxu+2xSyHE
	6QQeI0bSgtNQTsX2x/Rv+S2ECWGDLPjSHrbmmD5XPoO+2M/Oi7efUtl6D16Zx48u
	jvl2RBQoL2V13UWfL5x5DEKwHl3d3hJENuafZEgqO4LJpiaS/bZMwUPrFWw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bns8v3b9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 10:08:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c43f8ef9bso772114a91.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 02:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768385284; x=1768990084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgZmHHUg3P0CjUtuQ51R9XAhuVkxwDKnHl6ppMZ1C2E=;
        b=M7PMpVxJLFSgoNtvkPOR3/C9Ee6cJZdBidueseY3EHuKqSSDhD6vRxZH4XUOE3RojZ
         HtzizPGEbtbTkqJCi31R7P9AKtABRjpuMViKosrqGOGPHsnHPeeU9UYHJVEE9a4ScwE7
         7qE9Bw/QA9Bf/2lRugf5i7eabYF1v4+8DCGEZbwnhx070PBN6qKaeEazHuRytvFwmnfZ
         kWUF+K/2+6JZhHS9hN2zUHLdf+q0qt4R7KYIEq9IEZAIjGltBY0o0ZSlIyW0Igrv/V0t
         SmIiNp/ytaIuK0CkTZ46pReQxC7DTtVCcsRKuX9AnBkEeW+7Wms0/736VxHoWmgNd69z
         2axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385284; x=1768990084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tgZmHHUg3P0CjUtuQ51R9XAhuVkxwDKnHl6ppMZ1C2E=;
        b=UZIUqMLFYGaLVCD11Clxnc/ws8/Tn2u7UaksRLP1IXRIMP2Ldm+3JbzBdPRTLxur18
         z9RPDTOprcV0jiUUgoR/sI2f22gkdynmKjfREgDXeTr0Y1WELqfjFTHOt/C84KgJk/j0
         +eygrMKJutsxmo23ph7VpRHAXLdAahrY0CUlmuZGhaqB0UuVz+PHWwQlqi+mDE2PXLBJ
         yvjjUynBTk/TGHkbTU8a9Mk2mkd6i4EGWyiiIK7VyRWpjPUidcn2IorymzZdOk92cKIS
         99sNvN0ON2MIsjfdaTpMDqv81io7c0FzAz2mGKnjuu6x+Nho5XP+VfHqwDhx0vpUY8fE
         4nWw==
X-Gm-Message-State: AOJu0YzRK14P/aBQ1j4hNhqxQc+IXThgYMJL7GPMmLpmfev4C+HkTwEW
	W2OFN7/NLer48PHQd4SGrfPcoG7O8U9HRJTdwlQq+WRpGA5Txf0WT4qe8xE9ddb2Q67guxzdNBM
	hu8RVS7fYFdKsVfJTBJW55azx8ran/MOx6wfPqBkdy0hsGENN3gUWlSXIqG8E+VA=
X-Gm-Gg: AY/fxX5K+c2QMFMm4TFYAkfFWQpVilKHobue/auW82iIrZ2djbKiSncLDIU7COCxsh6
	Wvv9hIRtsMKdzcxc6zfuBjTepD/jtGQlBw91vl+F6v6ILvDKs/adCVy08ux8AJzRXtdKRRCfkP5
	uYCnuCjGSCkyqjbKIuT2InAoX8fV3HCmhrndL6ZRVCvvkz9KXczPHvj2B5X14rc9Sgcf1LppDLB
	1tQYENk69uvmpl0ffxT+XEx5AqKx17xZ9InMLH2QnzwwhfFGB6SFBM9w020YK/uILRbhUFKjjnl
	ojLK/KVzVB66dHtAQZv3cyc2OvE5v2pt/lfaOIt3aTafUDp0sEleCJ8hmVsbE3s0Zqulnlf2d6s
	GTVKL6HRnsROicQn45HTgTY1TxrOQ8syS807dQQ==
X-Received: by 2002:a17:903:41c3:b0:2a0:f0bf:197a with SMTP id d9443c01a7336-2a599dac241mr21023455ad.13.1768385283392;
        Wed, 14 Jan 2026 02:08:03 -0800 (PST)
X-Received: by 2002:a17:903:41c3:b0:2a0:f0bf:197a with SMTP id d9443c01a7336-2a599dac241mr21023225ad.13.1768385282835;
        Wed, 14 Jan 2026 02:08:02 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd3632sm226379975ad.95.2026.01.14.02.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:08:01 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Date: Wed, 14 Jan 2026 15:37:48 +0530
Message-Id: <20260114100748.2950103-4-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
References: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aY5sXBot c=1 sm=1 tr=0 ts=69676b04 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=canF8CTjMwtUwClMOGQA:9 a=sJs22xd4MC_LBXiP:21
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: dJYfOgGA-pB62IET8O3ojExBXX2b3tZH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4MiBTYWx0ZWRfXzP7MTyoachl1
 CSpebeaHqWQATfBBrXsne0DEfzqnTDa+jgvXc295u18W7AG9tuThb+GOGC3rqWnhHXSA+J0sfvz
 0kgEdzehgnsasC7bA+PPXOPP9/2cBY5WQmFMd4cY1DvAzoJj8rNnvKEggajiFZdIZDkl0kEe8Yf
 Y1Bj/Z2HD5uO/nZwzBZiDMFWMI6bWHm7JbSUajaniVUu7g6ViCvamWSXDYffJbvN6cIvIxOOBjD
 b8aKH1jDonhClYQL6uPWvuk/BCbOSLxTm8XrS/ROd15mFbUCREBIiLtlVB7j/1OENQz1C74KzfY
 IlWhKpRlI6zrPm8gwprQx/PAYl2Xv8n07o07PQXyQJUVTmpc3Z9HGFIad6TxF0wrftLgNARTwOu
 RnLVQIP9EdgIlihxW8J/Y01GMOsnuUh0NYyXD9asFX1+vtt1fEIXJa9K/EQRcZngz74RXQcypjG
 /hQ/QCQU2wjIpuKekzA==
X-Proofpoint-GUID: dJYfOgGA-pB62IET8O3ojExBXX2b3tZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140082

When multiple DWC3 controllers are being used, trace events from
different instances get mixed up making debugging difficult as
there's no way to distinguish which instance generated the trace.

Use the register base address of dwc3 controller and append it to
trace events, so that the source instance is clearly identifiable.

Example trace output,
before ->  dwc3_event: event (00000101): Reset [U0]
after  ->  dwc3_event: 0a600000: event (00000101): Reset [U0]

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c   |  5 ++-
 drivers/usb/dwc3/core.h   |  2 +
 drivers/usb/dwc3/ep0.c    |  2 +-
 drivers/usb/dwc3/gadget.c |  2 +-
 drivers/usb/dwc3/io.h     |  4 +-
 drivers/usb/dwc3/trace.h  | 88 ++++++++++++++++++++++++---------------
 6 files changed, 65 insertions(+), 38 deletions(-)

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
index 23188b910528..bc5ad3206d58 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1043,6 +1043,7 @@ struct dwc3_glue_ops {
  * @gadget_max_speed: maximum gadget speed requested
  * @gadget_ssp_rate: Gadget driver's maximum supported SuperSpeed Plus signaling
  *			rate and lane count.
+ * @address: Cached lower 32-bit base address to be used for logging.
  * @ip: controller's ID
  * @revision: controller's version of an IP
  * @version_type: VERSIONTYPE register contents, a sub release of a revision
@@ -1258,6 +1259,7 @@ struct dwc3 {
 	enum usb_ssp_rate	max_ssp_rate;
 	enum usb_ssp_rate	gadget_ssp_rate;
 
+	u32			address;
 	u32			ip;
 
 #define DWC3_IP			0x5533
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


