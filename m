Return-Path: <linux-usb+bounces-26959-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF759B29967
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 08:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15A2117B338
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 06:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A584271473;
	Mon, 18 Aug 2025 06:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1IJqKaRc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404CD27145E
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 06:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755497284; cv=none; b=oBTzwqBCrLYTdfx9pc3MZVBr2AoR3tUn7ogx54tcjLmKowIgHKKR82IH3AdUxpgwoSNn4Ysc+lDCNbV1uTKP9I+j1YwQAhQWtCdGwOYy6rpNUo/kTtNznCiqUeyljV7pkABRPUeoN0Eej/fL4Z5Qu4pho9e5jNP7AAnh2V7E7XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755497284; c=relaxed/simple;
	bh=TrmMaGXfFM9Dy7FU7g83nMPOzp2/f9kGtkE2n5K/8eo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PaQjasgjuvfP1ruXVWF2Pqo+WM3bIYXiYlw/2uHEV2v5GSZKhHo/OfEeczF6XdVGl2iHg2++KXOvJht1IS+AdF/2NBPXy63mirdXVX0/kwIOBv5/fFP58orAWwS//MC/9o9unIQhebymMrqvBAMTrLDYWLVdJrCz7fBDlPWprhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1IJqKaRc; arc=none smtp.client-ip=209.85.208.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-lj1-f202.google.com with SMTP id 38308e7fff4ca-333f8f2c2bfso17371861fa.1
        for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 23:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755497280; x=1756102080; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0MrMTy9fob00ctraswujNwZhhAnI/gHEtPWec2OL8mk=;
        b=1IJqKaRctiDcV5eWwwZFm2A79S6TPsriLGIy6M5Ru7fkjga2ZToh8apiAfmYGndnDn
         VR3gzYN3wWSgbqnzX/72+LcKxbqQUqpwygnG4MSclvUvu4hoxMTSX2ueVaMpviCOG4QR
         GRZk/JkZeGbV5pQPhdrYFsrlqsfDnTtsNpNtB7Wf5MrIgTNpGFdkuxbJv4BK7oDEIVap
         PKVD8TLjwdlGSveEvMcMsM3BpielRTDaGYMfODwQbc9KBop/Pe7qJZgp3dY4hRvPdfak
         yDoO+GgB+p+jriX5hZIm4C/uRldeIT4fl1zlBxFF2gR8DkcPkyeuO13zyqj0Zxqzj0PH
         85tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755497280; x=1756102080;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0MrMTy9fob00ctraswujNwZhhAnI/gHEtPWec2OL8mk=;
        b=HsrljCTIbEu+sYv128LHpiD+1kgdVxYdoCbN7b5P4gM1TgmsXOiohz0nkDWYOfLUJh
         GECXX7fyKjQDVP8GdiHlrkOTbO1YZYj1YnPKcurpOSjp0vu354tgbgJdaUm9sb2jWLtG
         1uWHGHgtCoGnzPWSl+YckGNwOV8wGTomnI/CYqWAyC2UQA7N8O4INUXJMYxP8QO2ymuC
         p3FWKq4SXBf7WaruXC5UsMSSc+kXcuIz8yRRCW7Ovs1iuBimLYIGzGRvCAJWE/qVJSql
         iU3mzyO58e/UJp6OswNBqsjOpx0QZmj1Kg9z6AXepcLyirRcKzP9mvynN7IZ3GjMaTgj
         6hRQ==
X-Gm-Message-State: AOJu0YyHzM76MbN6DB9cwfNA+2zVzv/5GYo/0BayAlYPcGGuelwqTLp3
	s4t6TUi2wI3bKc24qnY68cCkcP3oXvOT6GkUK9ZZjM5lll9fYTpYR/J5ykRUEy5gfTTsMREwUI7
	2Nvx7+w==
X-Google-Smtp-Source: AGHT+IF4gJdgX2pLk1YRQu2B0FhAWRI52zKLOPKoWiCGPyd/eQ6IHsLbcAS3xRXg7QkEYVC9ctqqj7VP1jk=
X-Received: from ljbl6.prod.google.com ([2002:a2e:ae06:0:b0:333:f189:5431])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a2e:a98f:0:b0:335:2563:c0ec
 with SMTP id 38308e7fff4ca-3352563c479mr1899201fa.33.1755497280423; Sun, 17
 Aug 2025 23:08:00 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:07:34 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
Message-ID: <20250818060757.2519126-1-khtsai@google.com>
Subject: [PATCH 1/2] usb: dwc3: Add trace event for dwc3_set_prtcap
From: Kuen-Han Tsai <khtsai@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="UTF-8"

Changes to the port capability can be indirectly observed by tracing
register writes to DWC3_GCTL. However, this requires interpreting the
raw value, which is neither intuitive nor precise for debugging.
Monitoring these mode changes is essential for resolving issues related
to USB role switching and enumeration.

Introduce a dedicated trace event to provide a human-readable log when
the port capability is configured.

Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/dwc3/core.c  |  1 +
 drivers/usb/dwc3/debug.h | 18 ++++++++++++++++++
 drivers/usb/dwc3/trace.h | 17 +++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 8002c23a5a02..370fc524a468 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -156,6 +156,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
 
 	dwc->current_dr_role = mode;
+	trace_dwc3_set_prtcap(mode);
 }
 
 static void __dwc3_set_mode(struct work_struct *work)
diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
index 09d703852a92..70d90790f872 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -13,6 +13,24 @@
 
 #include "core.h"
 
+/**
+ * dwc3_mode_string - returns mode name
+ * @mode: mode code
+ */
+static inline const char *dwc3_mode_string(u32 mode)
+{
+	switch (mode) {
+	case DWC3_GCTL_PRTCAP_HOST:
+		return "host";
+	case DWC3_GCTL_PRTCAP_DEVICE:
+		return "device";
+	case DWC3_GCTL_PRTCAP_OTG:
+		return "otg";
+	default:
+		return "UNKNOWN";
+	}
+}
+
 /**
  * dwc3_gadget_ep_cmd_string - returns endpoint command string
  * @cmd: command code
diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index bdeb1aaf65d8..b6ba984bafcd 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -19,6 +19,23 @@
 #include "core.h"
 #include "debug.h"
 
+DECLARE_EVENT_CLASS(dwc3_log_set_prtcap,
+	TP_PROTO(u32 mode),
+	TP_ARGS(mode),
+	TP_STRUCT__entry(
+		__field(u32, mode)
+	),
+	TP_fast_assign(
+		__entry->mode = mode;
+	),
+	TP_printk("mode %s", dwc3_mode_string(__entry->mode))
+);
+
+DEFINE_EVENT(dwc3_log_set_prtcap, dwc3_set_prtcap,
+	TP_PROTO(u32 mode),
+	TP_ARGS(mode)
+);
+
 DECLARE_EVENT_CLASS(dwc3_log_io,
 	TP_PROTO(void *base, u32 offset, u32 value),
 	TP_ARGS(base, offset, value),
-- 
2.51.0.rc1.163.g2494970778-goog


