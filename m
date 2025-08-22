Return-Path: <linux-usb+bounces-27178-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6017BB312E2
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 11:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 398E97BEF92
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 09:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4F62E3706;
	Fri, 22 Aug 2025 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xpxs5VXL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB8728852E
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 09:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854658; cv=none; b=e/Nj/jowsq/zJV1HQaFn/QzTBV+6cri3TxUghHFZUU+i9umLz8Sf1VO40QLjYKL2ya+awArbGUCYba2pX7resOLZZ16DP0u9Y/eJwtnegGzrQtuaRtP9DcNqzEzJkt7n8BT24AmqpsDilVnMwO6s0PHRT1rpCalPAA//jBo0VWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854658; c=relaxed/simple;
	bh=QZ1yMwiRS/edAk9yh784lz6Yhaw2nWEa1VIzlMHI840=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DmO2G+/xuDyxFG+nvCDa591n82fhr34egsOjxUc9EjDNaMfUKolFTF4LdLBb0ptOliT22HEj2o/yi/Ex/lTwVrdNRIu5NYcUNciU7dAcKBHLeb/mWCTqjtQqWK+eg8IoIsudwl+3WqbhvrVEDsJWAJuLjvFn+kV5N00X7W6HwFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xpxs5VXL; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b49c1c40e12so350073a12.3
        for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 02:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755854655; x=1756459455; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VyilXqTlTSUumeHDAFKTKU4l+yIbGUl58kzVG3ScM4s=;
        b=xpxs5VXLk1T3mSKw48Z8zPeSmND+wwF/17996a0osPFMT6owKG0ABtqK5qkKxIMdav
         t2ftKDoOdhzqnKWv6SgN+kzpV7Xm9WOV5a1IWWyTN30ZeQHM0jKQJBnlkUMhhJkPAdYo
         YUh+TWBZ/U4vrPKTgTW3QhMa5gGvtbVLsTWa2xMpXvXS4mLMQ7qoS83SwF71viG29GXP
         voJRTjarV3xvRh5c49vwJah8yGTKDfb1dsJHj3VPq7P30eWOBs0XSU7Nh/XCzUusOq3B
         GvEafmZ3o7VKjUZ7vIbXTtaWjeTsJLHjZJl0qiy6hjh2ulb08q0wjYX2Tm6x2EgttloA
         IAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854655; x=1756459455;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VyilXqTlTSUumeHDAFKTKU4l+yIbGUl58kzVG3ScM4s=;
        b=A2da8D76WhvLV8NvbCrtKSjQMkizUcMVzdW7X0nbtYJMr7/jtQjCohUDnmm5/ip+fC
         eg7CczjW81QtpQE7f1leS1+5BXECsrtgzB9/g5JZ6ml49i1sTcVejBjqVjcrwBQNzukC
         GMAG06qKQsnmSVHVSdzECkJgpOaXWIogDBFBCMZZY+mnldnThkd4zty0HaP+PyXKLjyi
         oOYFYSOnzCxVWjvvoX0yJVe7C0q7g+gRaiQ12usjniEU2k7VvGGBlIxzilD/t0mqQxCy
         OaXBgCzckh4pr9KUR/sSOzbojIoCR6+mwsEt1HeS3mCZZKgWyYEnzUc0MywzJzggYFNa
         meoA==
X-Gm-Message-State: AOJu0Yw2N8PYmyPX41I35zUvGJGloGQflS+V/fYmBiwTH31lM1sIzkY8
	gkuPtHC9tTvnU7iO3QkCeF9DuTaUViPU9wfoSi0Nmwef7P1beiaWdULTb+inKiictBN2cdNyUaB
	TguLxBQ==
X-Google-Smtp-Source: AGHT+IFjuPEKgVHXW9Ji15b2ymMDqqhJVr4Gn2I/XEBmf7Wb1DPa881urd/0sgYFstDva6Z7VUAN8u5wjXc=
X-Received: from pgcv16.prod.google.com ([2002:a05:6a02:5310:b0:b1f:9534:4f55])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:8b0f:b0:243:78a:8299
 with SMTP id adf61e73a8af0-24340e068d0mr3373683637.50.1755854654776; Fri, 22
 Aug 2025 02:24:14 -0700 (PDT)
Date: Fri, 22 Aug 2025 17:23:45 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250822092411.173519-1-khtsai@google.com>
Subject: [PATCH v2 1/2] usb: dwc3: Add trace event for dwc3_set_prtcap
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
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
v1 -> v2: Updated the @mode description and added the Acked-by tag.

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
index 09d703852a92..6e1cdcdce7cc 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -13,6 +13,24 @@

 #include "core.h"

+/**
+ * dwc3_mode_string - returns mode name
+ * @mode: GCTL.PrtCapDir value
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
2.51.0.261.g7ce5a0a67e-goog


