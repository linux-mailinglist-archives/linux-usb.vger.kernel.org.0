Return-Path: <linux-usb+bounces-32623-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAxZJuMFcmmvZwAAu9opvQ
	(envelope-from <linux-usb+bounces-32623-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 12:11:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4569265C26
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 12:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A38883425E1
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 10:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE0943CECB;
	Thu, 22 Jan 2026 10:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jDa+9M5j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="doqiUBKV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71717436350
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 10:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079017; cv=none; b=hECecTC7Mad4waqAP9LagPsm1yhrxmIrgl5p+tFgUQ0736sUEiYAGNptvCDAszovJ9/tc6Joovs+UI0B0AdwItWXQ0N+Hl9w2Y6fhPhkES1Yq3q7WPXlgHGrZHPuJlk778OlZpVFKtjA1diAMGarnW/mopM5b2Xy4QgaUFycK0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079017; c=relaxed/simple;
	bh=ohaHva4Yjt/bndIj6kFv0glAODEiFg13DABxi4dD7YI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pk4vZYFCWEQ6caWPniA+qY7a4/g/RxcfBkjnhZamZajG7znwgRP0GYeV7LhG69KuM/hEw/ArCxZN+Kw4JzVzuo2nwdVmgywt/T2/F/AhA9NNt+JpQec4M97GB4YAw2+SOxSwnDS0cwap9AEiXBh8cNMLQ8o1ZG621jmxEBP255c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jDa+9M5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=doqiUBKV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M8cDut645951
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 10:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ExSV+5agkH8R/fH7U4KOfCkJIu6mBmlxud1
	gLZT+YkI=; b=jDa+9M5jFAaaTWcMuvQWddMz6vtpXqGgRb+04gjhyVF+1ExVKcH
	4RLrgCwV+iPmJJQACw8arqnJU1sdWMDF5dilIhtnaBubu2NBxgltUQ6iVrT3ykqq
	yCXEOAn6RaVm2+9w/MAC9DgmeQ+eXmr+9tCGrWEMK2UKpAKgSkXCJL/NRw7AbuuD
	VQJysq/bmgmrb1BgEFWfRBryLEA2On0RfgbsH7LFuArcpXA1cfV3DsClLUsLGeT/
	lrOC9DKD8LIkDAZpYWIxPkD2wneAKU0nTJmKZqL1McEkvaT/EGPPewTPNqrh1lcC
	w3i2GuDY7GbCwbT9/tge4wus/pH4dos8X9Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu8j9stmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 10:50:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f25e494c2so9767625ad.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 02:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769079010; x=1769683810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ExSV+5agkH8R/fH7U4KOfCkJIu6mBmlxud1gLZT+YkI=;
        b=doqiUBKV7Z+wiXW34rckuZWYkHljBDhqEhHjvFS9c1gEqFi3PgEbLFU7NhXqvSZAxg
         Y2L8QJExMt7ObsOOkcHDMYp7e51BGv87ZOV6AlvS57ej47RZc0lbW97F8OWtxBqEjLO3
         wM/vysfNj7AlW4GX9fAzqRLzz7Zlnc/fcRGr/gajtHaM0BC6cdUiOpwDa+pHwM9vSqG2
         +TUIxQZDwizPgMCL3MfWKhnDtq9fpyPpzQLgroDGvmK+4LyPKpNqXyD/vjsiaVaQOyDE
         6F6TXcY0pVdcEH1/88gKHXqQBEz/VX2mYBo0r0HjE9Ko5tsIkKmsq5UZ4do9NNEKztXp
         rrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079010; x=1769683810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExSV+5agkH8R/fH7U4KOfCkJIu6mBmlxud1gLZT+YkI=;
        b=mosEaz4wgeFKNuk+agmusIdGh0Fdn1WTBv2tO2xs97AS6T5EjXacD61YV+y26w/4Zd
         NMMHAyEtHDdsY5cAHY1cPtOlL/pTN5WERERkdLEGutsizgORqfhMs5n4MJMSOqTFQc1W
         z3NIVgWjVRiYWTmTirL10yE4wtiGSQH85/b6tbJJyg9UnMM2Z1YKUnVLaFAxnp7uyQUh
         wNi69e7IqXI8j0xlslp2GqstReLnD+KTnwwEu2Ey+W9TQUL3VLqD9hY5FzB6BcX1pfS8
         nh0qvX5t3TO0cjA7woMOW97Xv+P8+MRVEvKA7268Vp5S7L6afXgOVCqSx0Um0/YpJF+t
         CROQ==
X-Gm-Message-State: AOJu0YwWWC7lskywSEyy4+fkhwOiR7YCd81elH8gaR3YQxvd+Wt+3eyR
	YUlSNv17XAfIWPfdTrC+R+P/dTchFWxF6G0vVrnCklcdDQmE3jG/mW/bTJeRjy+GSbr35TR1nCa
	MKX8F73YUjF2hF6VxQuxLmmE5htpBDuePf7gFVFGfQpGgOK2NR6971tpA/aksTk4=
X-Gm-Gg: AZuq6aIVFIQsYJGBMFFLsCJh4uDYJ6zS3ZQuX3NrDx9Yl2zakNhQYArheixx9JKUGie
	QLWQnoBZAYJgDeGcQzKvaAFYl6IjjJAm2n6Z69EUc8ITAYX7/P8lcg39mpN+bNSVw5lqEg2Ugss
	p1aXv739lKLr/qpPHPwKbkFC3sm217H2r09qW++byQwpIFvbaCl/vGGPZUamq7gFeYJjAOnSfiT
	CHVPAvhZmqtqE21Wco4683lG4dyHyvQDoucZPzU4Uj38uBPSDchj1qQAin5wRQc3wJ3kWhF4fTl
	kHaqdc3s35ypW2Q3e+M9MhHA87ABfWV7hNCI0g7eGLYuMZCRj92tFI5sRmqeN7sfcddlvH9Xsb1
	zOirRQAaGv3jHabCFvDbaRafnx/MqHDUHDrcr3Q==
X-Received: by 2002:a17:902:dad0:b0:2a7:a1f3:f327 with SMTP id d9443c01a7336-2a7d2fa093emr24223375ad.20.1769079010392;
        Thu, 22 Jan 2026 02:50:10 -0800 (PST)
X-Received: by 2002:a17:902:dad0:b0:2a7:a1f3:f327 with SMTP id d9443c01a7336-2a7d2fa093emr24223245ad.20.1769079009790;
        Thu, 22 Jan 2026 02:50:09 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a784af4269sm60733835ad.77.2026.01.22.02.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:50:09 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v6] usb: dwc3: Log dwc3 address in traces
Date: Thu, 22 Jan 2026 16:20:00 +0530
Message-Id: <20260122105000.4126769-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: M6WEQ7OpfNBYb31bkFh9oljxIQYCUsNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3OCBTYWx0ZWRfX/+sQSaYVdtaE
 rFh8WvHhQtWl9XnCejulA6Hd1ZFC2r9J6AZmH538eac9E3EvRORju902afdAiD41TDBkdGhVzFn
 3n+NYdIcalAb9AXbpBJOIEKRwcCjZ6pZdyC/l3KUs3CIblxCaJFas2gA/0Ds8ZUFcjn2UD4Hkh5
 TcS91nfKxj5U/7EGE/YvTYPOqnC721xDmgtCHNAzA6rIO7AltDeOrCFcLEVoD25DQUTPPOx56KA
 AsuFhIRPZwJ6A6x5oZmQQYL5UoFM7VyZ02oDiGT0MQOl7I9HhUVW0hpJVvy4i52ZTYd7+OjpWhv
 RnuLM5olezOjN83GwlJRSk3A5wXDP983EJoEsLkxYHfgyyNTBtHhzLzqb/Q000fCb0eMBpzO4xM
 ZgOsdlf9qfLAN4M6oZWQU9NZaO7hcOHR5QL+Ag60m9qupEk+ZNbmxrkg7AeHFhCI+rX2LMbbCKE
 v0JJ5+x1N0jUotIVMyg==
X-Authority-Analysis: v=2.4 cv=U4CfzOru c=1 sm=1 tr=0 ts=697200e3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=KdEjMbfuYSVD-50lO-oA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: M6WEQ7OpfNBYb31bkFh9oljxIQYCUsNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220078
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32623-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prashanth.k@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4569265C26
X-Rspamd-Action: no action

When multiple DWC3 controllers are being used, trace events from
different instances get mixed up making debugging difficult as
there's no way to distinguish which instance generated the trace.

Use the register base address of dwc3 controller and append it to
trace events, so that the source instance is clearly identifiable.

Example trace output,
before ->  dwc3_event: event (00000101): Reset [U0]
after  ->  dwc3_event: 0x000000000a600000: event (00000101): Reset [U0]

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
Changes in v6:
- Fixed warning from kernel test robot: https://lore.kernel.org/oe-kbuild-all/202601220002.cJKQOY2h-lkp@intel.com/
- Link to v5: https://lore.kernel.org/all/20260121084550.3112162-1-prashanth.k@oss.qualcomm.com/

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
index b6ba984bafcd..5253da23d8b0 100644
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
+	TP_printk("%pa: mode %s", &__entry->base_address, dwc3_mode_string(__entry->mode))
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
+		&__entry->base_address,
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
+	TP_printk("%pa: event (%08x): %s", &__entry->base_address, __entry->event,
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
+	TP_printk("%pa: %s", &__entry->base_address, usb_decode_ctrl(__get_buf(DWC3_MSG_MAX),
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
+		&__entry->base_address,
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
+		&__entry->base_address, dwc3_gadget_generic_cmd_string(__entry->cmd),
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
+		&__entry->base_address, __get_str(name),
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
+		&__entry->base_address, __get_str(name), __entry->trb, __entry->enqueue,
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
+		&__entry->base_address, __get_str(name), __entry->maxpacket,
 		__entry->maxpacket_limit, __entry->max_streams,
 		__entry->maxburst, __entry->trb_enqueue,
 		__entry->trb_dequeue,
-- 
2.34.1


