Return-Path: <linux-usb+bounces-32579-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJr2HwWTcGlyYgAAu9opvQ
	(envelope-from <linux-usb+bounces-32579-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 09:49:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0196E53D8A
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 09:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0652468427E
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 08:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD76D47A0B8;
	Wed, 21 Jan 2026 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBkqBRUj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxqVE9IP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BF03A9620
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 08:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985180; cv=none; b=AiIIZM/Nz3h4XqW5EvqZ7VYPY0aAaKG6A0dXc923Gywt2+9o2iJ5/bwK9XvBkqaaXsFxqxaAeJShMJrZlmLG0FNqAxFW89nTFSVc8x7hhakRMJQ0iCuZ5DHga2uRDMaefiPw4t/SRLZFfexy32h4etWGbO6HxfH8UFYlaGHITxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985180; c=relaxed/simple;
	bh=2OIZm0PMjYge0nPiWdxM3kV0ny8y5eNZN9PE9wlImVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OU+jnFnOUOBOo/9G5NLanwgLvMt7hRvymzc9LOeLmx74Ip1927wKqB4fETTP0BL5GBjRjhZLjFUdXdeDgMP6CkKqCLxbS1J4PMB1orKSaVn3PLpdpECqG+xOBkz3aCYOmzH0chsLRN/yzpfjEfCVniJWtQ2KQaOlQMqlSCeeUKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBkqBRUj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxqVE9IP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L37C193991432
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 08:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/lpc9AD9P7xkhtVjA0m1gC59bOQf9xTISb3
	dqeqdi+k=; b=VBkqBRUjmqClqVvzf3x1F2WcRoct08hLuyKk5wwC3M10WPp70tn
	vvedOjmGHEJwo9HmBW2iYRePhN2wjq2QtVXObBI9TpVKB20O9O4HCQpLC+3s5DA0
	zMZ0nXz7baMJiqu2JOfXyvt/vcwXCsNILpOr3aP6EHZEmEV5w+CgF2ywiuBncYgZ
	kUxLlCExJECxGFmmYFhFVkQCk4TQPQ48K5FC2ugX8F+ZsL9ZISVWeAv1X6Y2PJ+S
	9PZXTkmV8i7FJ8ig5lL6Lk7CsCMZkXWZ5SYeEt1B2aJwbTe9/NwTKcu7/IlgBdC0
	ukr38ZB9AYcPDwJypUa7IkJVcT8muPOfe5Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btpm416x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 08:46:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7701b6328so25012055ad.2
        for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 00:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768985177; x=1769589977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/lpc9AD9P7xkhtVjA0m1gC59bOQf9xTISb3dqeqdi+k=;
        b=fxqVE9IPBhL+Gima1WSaurqpPENnKQpQE3Fe637ipnGhi0QcQu1dGQYbkx+agNUsox
         vyqJwYbSm2c3OS8RTp5evQc5CuCJEslAeA4Agrn1jtl3VbNDT0Dk6HNxUfg98+foh1tm
         HgPWaodo24GujoomZeiVf7PYuesP+E1OcGGJGjzo4MUXc0MPEByPEyrvrQVgdwJMkIVP
         mDOSYsIW91Dtz+8X40y2npeHBWnose07nuFCIkbK5bEraRcpYbpXZyD0fbKqZDe2G2Zo
         s0L/s2ISMOYXTVbX3tBtrZWD1QfWvRQZQ9vZOgNLhvG7EbtXecwvgV4s5xedhJ9/Dd+6
         BzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768985177; x=1769589977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lpc9AD9P7xkhtVjA0m1gC59bOQf9xTISb3dqeqdi+k=;
        b=blfYvfcxxnsNzmEaNgTVrkOzepreimawEb6hT3JpbRJk2osl2Om43Er4flXKOPTQZt
         L2So5/sV6oC2i6rUY6rT4Q+UateGxgX8RTF3aEwzpqn6xabRQoMr4tQJd0cR8a5fnTE+
         otwVJ2hKz7zQOrKCl1NE8F90r5qrUVdRzCRa4iKXckAyZVULWrXf7eRhrIZ0QGkuA5i2
         +1CFxNu6zfB25IhbqfjySAPmpX8npu7OWwvd0ifTVx6fqfODjAsRKjIOzMl3Byv73o6/
         4+whLOmgnHnZs6OtY+KJuhJjF+gxWDFl+yERtdz1N0hibwabPnlkxl4mUzNf24hj5M2m
         oQRA==
X-Gm-Message-State: AOJu0Yze3eOblVTAQYoFjMiNoqc0gnd5kWGcKA6sBgs+7u9wOOvvPLsA
	LaVOvbC1e2etqPglnG4JVbQ5PttD7nh5l7SZJkbQdEP5kZHMiYM2c+syoB/W1nyhY0HEn+dD7Zd
	mUOG4sIhCOBD5rNSgOwQyxrOTAk2I/CaXcsfXh6Zo8+UVaFBc29pk1Jp+NB2TnkM=
X-Gm-Gg: AZuq6aJ0OYAN3eymqMKJzuBkA4C8PcieXjQMDwYF70MqDcux9dSRC09ezyD5o9KAkNB
	Q/eEzlAo7PpkIDaZEhiLUWXLIFljQyKmN0WBTjMJGENmLYDn3dRCk9gCdfbfTJ4Xj68dlyLZwng
	ihHw8V5j54z7K+GpqPXwfWYyRKWExPNAoSBbvKjSg18JhbJt5vIpy/Hv2Z6XTbcmfC6kVTDdCf+
	KTycdGy6rrCnIBQ+oO+urI1lIZyH+yBYF3szoESP+xxf5RLvY7EUsJbgmnAOqo3Ig4Ip0rQlQq3
	kZ+VCokxUBqlfxKvP7fUulTDZcRg1rETTtu3hhfbRbI6B0R9+mf4Jdl8XuZBegwws65Q1tfacax
	CuPf5BNKDNmCAoWX9MWRlO1HePOijR2PRjln/1A==
X-Received: by 2002:a17:903:1b65:b0:2a0:de4f:c96 with SMTP id d9443c01a7336-2a768d74facmr43257545ad.18.1768985176549;
        Wed, 21 Jan 2026 00:46:16 -0800 (PST)
X-Received: by 2002:a17:903:1b65:b0:2a0:de4f:c96 with SMTP id d9443c01a7336-2a768d74facmr43257365ad.18.1768985175999;
        Wed, 21 Jan 2026 00:46:15 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a75889f594sm45068625ad.85.2026.01.21.00.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 00:46:15 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v5] usb: dwc3: Log dwc3 address in traces
Date: Wed, 21 Jan 2026 14:15:50 +0530
Message-Id: <20260121084550.3112162-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=69709259 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=H16qPvunowpSdoYVP_oA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: XkaYqO8Zb54iJT4p1X5znYUgpu7Pz0H8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3MyBTYWx0ZWRfXyM3dvg2b8VIv
 b0EkPHGGaUGIqFQj/jc+WzsPYtKmZZO9wST+5gNnzuI8fjxwlckspcIQ8Vdr9xBHRY+lLHwT7fE
 unG9LOABSqZ6vcey9P5COqltc57u0e2frt9EqmukamzRRUIY/c5xcl1nYK6p3XICZMfO6IGCe4z
 8IY2Mqu8E2IGdy6SytLR2E3ZVcC/cdaRgsX7JQeEshYYFVkWs6aW2R9BuCi9RzcYw0dWRPfee8i
 rE/Hy8/JSae9B/cTWWNbIj+E3xgXxjCMUJV0r6g50jsgvz5Z1sayPhVMBIoyfDXpGd1Z+He3NDl
 Yi6ynyHPB/afjQjUsnbnx78TnTWb3eyh2HJgcwB1fm6iy+maqBJEDw8MXwiI97+P6kp0qQUaB+G
 P46WTQm4lBbsWg03X90kAHAmtr4hhwXbWu1g+YdNjedPAt5U2TWEkYmpg6d4blACR7Mf8oetVss
 kliyhW28NPlHwFkSRMw==
X-Proofpoint-ORIG-GUID: XkaYqO8Zb54iJT4p1X5znYUgpu7Pz0H8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210073
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32579-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prashanth.k@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0196E53D8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When multiple DWC3 controllers are being used, trace events from
different instances get mixed up, making debugging difficult as
there's no way to distinguish which instance generated the trace.

Use the register base address of dwc3 controller and append it to
trace events, so that the source instance is clearly identifiable.

Example trace output,
before ->  dwc3_event: event (00000101): Reset [U0]
after  ->  dwc3_event: a600000: event (00000101): Reset [U0]

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
Changes in v5:
- Removed the new variable 'address', and reused xhci_resources[0].start instead.
- Other patches in the series already got accepted into usb-next.
- Link to v4: https://lore.kernel.org/all/20260114100748.2950103-1-prashanth.k@oss.qualcomm.com/

 drivers/usb/dwc3/core.c   |  2 +-
 drivers/usb/dwc3/ep0.c    |  2 +-
 drivers/usb/dwc3/gadget.c |  2 +-
 drivers/usb/dwc3/io.h     |  4 +-
 drivers/usb/dwc3/trace.h  | 88 ++++++++++++++++++++++++---------------
 5 files changed, 60 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index f32b67bf73a4..c07ffe82c850 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -158,7 +158,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 	dwc3_writel(dwc, DWC3_GCTL, reg);
 
 	dwc->current_dr_role = mode;
-	trace_dwc3_set_prtcap(mode);
+	trace_dwc3_set_prtcap(dwc, mode);
 }
 EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
 
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
index b6ba984bafcd..2eb5b445b4bf 100644
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
+		__field(phys_addr_t, base_address)
 		__field(u32, mode)
 	),
 	TP_fast_assign(
+		__entry->base_address = dwc->xhci_resources[0].start;
 		__entry->mode = mode;
 	),
-	TP_printk("mode %s", dwc3_mode_string(__entry->mode))
+	TP_printk("%pa: mode %s", __entry->base_address, dwc3_mode_string(__entry->mode))
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
+		__field(phys_addr_t, base_address)
 		__field(void *, base)
 		__field(u32, offset)
 		__field(u32, value)
 	),
 	TP_fast_assign(
+		__entry->base_address = dwc->xhci_resources[0].start;
 		__entry->base = base;
 		__entry->offset = offset;
 		__entry->value = value;
 	),
-	TP_printk("addr %p offset %04x value %08x",
+	TP_printk("%pa: addr %p offset %04x value %08x",
+		__entry->base_address,
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
+		__field(phys_addr_t, base_address)
 		__field(u32, event)
 		__field(u32, ep0state)
 	),
 	TP_fast_assign(
+		__entry->base_address = dwc->xhci_resources[0].start;
 		__entry->event = event;
 		__entry->ep0state = dwc->ep0state;
 	),
-	TP_printk("event (%08x): %s", __entry->event,
+	TP_printk("%pa: event (%08x): %s", __entry->base_address, __entry->event,
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
+		__field(phys_addr_t, base_address)
 		__field(__u8, bRequestType)
 		__field(__u8, bRequest)
 		__field(__u16, wValue)
@@ -97,13 +105,15 @@ DECLARE_EVENT_CLASS(dwc3_log_ctrl,
 		__field(__u16, wLength)
 	),
 	TP_fast_assign(
+		__entry->base_address = dwc->xhci_resources[0].start;
 		__entry->bRequestType = ctrl->bRequestType;
 		__entry->bRequest = ctrl->bRequest;
 		__entry->wValue = le16_to_cpu(ctrl->wValue);
 		__entry->wIndex = le16_to_cpu(ctrl->wIndex);
 		__entry->wLength = le16_to_cpu(ctrl->wLength);
 	),
-	TP_printk("%s", usb_decode_ctrl(__get_buf(DWC3_MSG_MAX), DWC3_MSG_MAX,
+	TP_printk("%pa: %s", __entry->base_address, usb_decode_ctrl(__get_buf(DWC3_MSG_MAX),
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
+		__field(phys_addr_t, base_address)
 		__string(name, req->dep->name)
 		__field(struct dwc3_request *, req)
 		__field(unsigned int, actual)
@@ -129,7 +140,7 @@ DECLARE_EVENT_CLASS(dwc3_log_request,
 		__field(int, no_interrupt)
 	),
 	TP_fast_assign(
-		__assign_str(name);
+		__entry->base_address = req->dep->dwc->xhci_resources[0].start;
 		__entry->req = req;
 		__entry->actual = req->request.actual;
 		__entry->length = req->request.length;
@@ -138,8 +149,10 @@ DECLARE_EVENT_CLASS(dwc3_log_request,
 		__entry->short_not_ok = req->request.short_not_ok;
 		__entry->no_interrupt = req->request.no_interrupt;
 	),
-	TP_printk("%s: req %p length %u/%u %s%s%s ==> %d",
-		__get_str(name), __entry->req, __entry->actual, __entry->length,
+	TP_printk("%pa: %s: req %p length %u/%u %s%s%s ==> %d",
+		__entry->base_address,
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
+		__field(phys_addr_t, base_address)
 		__field(unsigned int, cmd)
 		__field(u32, param)
 		__field(int, status)
 	),
 	TP_fast_assign(
+		__entry->base_address = dwc->xhci_resources[0].start;
 		__entry->cmd = cmd;
 		__entry->param = param;
 		__entry->status = status;
 	),
-	TP_printk("cmd '%s' [%x] param %08x --> status: %s",
-		dwc3_gadget_generic_cmd_string(__entry->cmd),
+	TP_printk("%pa: cmd '%s' [%x] param %08x --> status: %s",
+		__entry->base_address, dwc3_gadget_generic_cmd_string(__entry->cmd),
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
+		__field(phys_addr_t, base_address)
 		__string(name, dep->name)
 		__field(unsigned int, cmd)
 		__field(u32, param0)
@@ -210,6 +226,7 @@ DECLARE_EVENT_CLASS(dwc3_log_gadget_ep_cmd,
 		__field(int, cmd_status)
 	),
 	TP_fast_assign(
+		__entry->base_address = dep->dwc->xhci_resources[0].start;
 		__assign_str(name);
 		__entry->cmd = cmd;
 		__entry->param0 = params->param0;
@@ -217,8 +234,9 @@ DECLARE_EVENT_CLASS(dwc3_log_gadget_ep_cmd,
 		__entry->param2 = params->param2;
 		__entry->cmd_status = cmd_status;
 	),
-	TP_printk("%s: cmd '%s' [%x] params %08x %08x %08x --> status: %s",
-		__get_str(name), dwc3_gadget_ep_cmd_string(__entry->cmd),
+	TP_printk("%pa: %s: cmd '%s' [%x] params %08x %08x %08x --> status: %s",
+		__entry->base_address, __get_str(name),
+		dwc3_gadget_ep_cmd_string(__entry->cmd),
 		__entry->cmd, __entry->param0,
 		__entry->param1, __entry->param2,
 		dwc3_ep_cmd_status_string(__entry->cmd_status)
@@ -235,6 +253,7 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 	TP_PROTO(struct dwc3_ep *dep, struct dwc3_trb *trb),
 	TP_ARGS(dep, trb),
 	TP_STRUCT__entry(
+		__field(phys_addr_t, base_address)
 		__string(name, dep->name)
 		__field(struct dwc3_trb *, trb)
 		__field(u32, bpl)
@@ -246,6 +265,7 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__field(u32, dequeue)
 	),
 	TP_fast_assign(
+		__entry->base_address = dep->dwc->xhci_resources[0].start;
 		__assign_str(name);
 		__entry->trb = trb;
 		__entry->bpl = trb->bpl;
@@ -256,8 +276,8 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__entry->enqueue = dep->trb_enqueue;
 		__entry->dequeue = dep->trb_dequeue;
 	),
-	TP_printk("%s: trb %p (E%d:D%d) buf %08x%08x size %s%d ctrl %08x sofn %08x (%c%c%c%c:%c%c:%s)",
-		__get_str(name), __entry->trb, __entry->enqueue,
+	TP_printk("%pa: %s: trb %p (E%d:D%d) buf %08x%08x size %s%d ctrl %08x sofn %08x (%c%c%c%c:%c%c:%s)",
+		__entry->base_address, __get_str(name), __entry->trb, __entry->enqueue,
 		__entry->dequeue, __entry->bph, __entry->bpl,
 		({char *s;
 		int pcm = ((__entry->size >> 24) & 3) + 1;
@@ -307,6 +327,7 @@ DECLARE_EVENT_CLASS(dwc3_log_ep,
 	TP_PROTO(struct dwc3_ep *dep),
 	TP_ARGS(dep),
 	TP_STRUCT__entry(
+		__field(phys_addr_t, base_address)
 		__string(name, dep->name)
 		__field(unsigned int, maxpacket)
 		__field(unsigned int, maxpacket_limit)
@@ -318,6 +339,7 @@ DECLARE_EVENT_CLASS(dwc3_log_ep,
 		__field(u8, trb_dequeue)
 	),
 	TP_fast_assign(
+		__entry->base_address = dep->dwc->xhci_resources[0].start;
 		__assign_str(name);
 		__entry->maxpacket = dep->endpoint.maxpacket;
 		__entry->maxpacket_limit = dep->endpoint.maxpacket_limit;
@@ -328,8 +350,8 @@ DECLARE_EVENT_CLASS(dwc3_log_ep,
 		__entry->trb_enqueue = dep->trb_enqueue;
 		__entry->trb_dequeue = dep->trb_dequeue;
 	),
-	TP_printk("%s: mps %d/%d streams %d burst %d ring %d/%d flags %c:%c%c%c%c:%c",
-		__get_str(name), __entry->maxpacket,
+	TP_printk("%pa: %s: mps %d/%d streams %d burst %d ring %d/%d flags %c:%c%c%c%c:%c",
+		__entry->base_address, __get_str(name), __entry->maxpacket,
 		__entry->maxpacket_limit, __entry->max_streams,
 		__entry->maxburst, __entry->trb_enqueue,
 		__entry->trb_dequeue,
-- 
2.34.1


