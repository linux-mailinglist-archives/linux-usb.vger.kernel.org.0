Return-Path: <linux-usb+bounces-19820-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC53EA20ED6
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 17:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D246162884
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 16:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A711DE3D6;
	Tue, 28 Jan 2025 16:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nc6W5cuk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB87E1DE3A4;
	Tue, 28 Jan 2025 16:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738082585; cv=none; b=KtbjC3IKvAt9pPsp0OThWbb8Zjk0F5SgSflbAiRZfm3MF3h1/pfGzYHJGPlrUJsStzunx4VwpLXId30+AsR0EBEEdr9g9wt9G1kjwn3RuCMbSEUqt4pelZpo5JlEAFF3xlHaYbRSiH6NFaOTLfPnAez7m3Rg9gTmGQVkD2VLfnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738082585; c=relaxed/simple;
	bh=QfyTNN0QuRu5OhqcnxwpyHLKyNNbV/NcEXUbRq2E0e8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E6zeaautV4eLmB7koMu2BuNw0Adau15IBdrn8kXzFxSuezQr6+IEQ47taArxwBdFxYTSyxZ+WiNryK2X6HRrIQAW5ldQoE9gTIEXrB/DL9e6NEPJo8XfELINp+y6p5Et7NmBmZYy5iSSBh1kwtQvmJQSJ5Wqtr89DgRoWsf2Ew0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nc6W5cuk; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21636268e43so128631615ad.2;
        Tue, 28 Jan 2025 08:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738082583; x=1738687383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zocPwhRR8BFDI1YPyREBrJhQBXZT2j2XFP2dHOYuLUA=;
        b=Nc6W5cukLbJmxmHy18rlronwYwUILh+wx8L4IVsyqm07LfBCZ2mc/o82H2DLlXyLGL
         IstwngMiN7r09B8iWiT7/o2rJ5AmHztU3tHdzjn2eNg8HHJHz1de8XRvZ0e1/bqoISMr
         SaHOIExY2WMOYKm7edmZx9XKLyr9/GEH4ekLB6QiTcP1a3PnHxUhrzijLXq9r7jxZjZS
         5jAswqM4D+jow67xIslY64GDRLJkjUjbf+tu/uo4lyt4IxImjrW/hZgtVgK1hQ4kbuIv
         VQZzcH/mMX8Sj14I0HQ6jK4nmGd8HrJJFK65DjDD5lY3A+wbz4hYXLWB5jRhfeDEDrAe
         Qqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738082583; x=1738687383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zocPwhRR8BFDI1YPyREBrJhQBXZT2j2XFP2dHOYuLUA=;
        b=udgl4SIyjQ/dZdshT64+hLafKjVpT+rSCYfvFIU5lDvMgCv+4vkTDpHxAcCapza8Zm
         R+hOw1mFkUG3Yo6GvksNIXp5acgsuVX+HaSe93yikrwv4NZlgQXNSTjPw893adDvwAb7
         Farf7JF6FU4+Q2Gj87aYon+je945miGvN1sGFileyUT1QOuPbB4elZhhuenLHuvMXxHW
         rGB9dxiAFeDtkjE/FlWP1/CHtc3bhaHr9UtpIyrMsZGKkwi/fg91vOADKzqFdOMtfkSM
         tnqudGJpRziQAkEKDmYRB+vx607cbjCb5Wt51TROQaMOYFIQCaY1qeF1d1G99dJFwc+M
         5Avg==
X-Forwarded-Encrypted: i=1; AJvYcCV5DCUF9CfQJUjdCY4ahQLzqFSOMqMvtmapptZ/54YgiR4h0JiQbzhyedoCY/Vvt3ZUPIewBQoWoTyImtg=@vger.kernel.org, AJvYcCWo73o8YlSitwnUP+YBtJrhgrJC+d3wr+aoKoQl78xm46k6IBUuSm0UKXJ25wmF5FosK9u3vwaa8ejU@vger.kernel.org
X-Gm-Message-State: AOJu0YyZgshFEONtg8grmD98BQglC7tRD8ydk+Pvc47EtLW6OnT8h43E
	nNJDZUas/QyiilTM2+w2vTEtSdhFLdz5ksvRKDAUbRNq7OR8bdhD3qG1a7qK
X-Gm-Gg: ASbGncsjfcoHueJel/I/mBBSrwKfITVIXRXODxWnCtOW/vV5CgJx16qkpQoYKlODqB2
	Xc7mWJ0BZigwpLUviMFsqACmfX7rWmqbBwBfisDjw5/mdc52whHmyeJKIS252vfhFQFETCj8Zvw
	l+pIh7uAzilXf6t3aKiWJBe8JWKpi+XX3XIig63BMLhsvJ/Snw9MbpphIBbOWNvbCFmjaFdohCV
	Le/FLGER+ICYU0AWVxi9B0Dox64YKWhID3FUxe//IKKH7k8lO/VQFQExlNa26YMeb4UwbT9/1Sr
	7+QtQWMQ3JtrWlQ=
X-Google-Smtp-Source: AGHT+IEOrBDUe2neSSS4CE3ylDaP09wtRXk0aOQnDoY+p5H7uDmCWiu/WfuhvsvZMyUaa+sKT/Pr7A==
X-Received: by 2002:a17:903:41c3:b0:215:4f3b:cb20 with SMTP id d9443c01a7336-21c3554b37emr691124165ad.23.1738082582890;
        Tue, 28 Jan 2025 08:43:02 -0800 (PST)
Received: from ubuntu.. ([124.13.193.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da424eb96sm84295225ad.222.2025.01.28.08.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 08:43:02 -0800 (PST)
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Subject: [PATCH] thunderbolt: Disable Gen 4 Recovery on Asymmetric Transitions
Date: Tue, 28 Jan 2025 16:36:05 +0000
Message-ID: <20250128163605.19222-1-rahimi.mhmmd@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Updates the Connection Manager to disable the Gen 4 Link Recovery
flow before transitioning from a Symmetric Link to an Asymmetric
Link, as specified in recent changes to the USB4 v2 specification.

According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
published in September 2024, the rationale for this change is:

  "Since the default value of the Target Asymmetric Link might be
  different than Symmetric Link and Gen 4 Link Recovery flow checks
  this field to make sure it matched the actual Negotiated Link Width,
  we’re removing the condition for a Disconnect in the Gen 4 Link
  Recovery flow when Target Asymmetric Link doesn’t match the actual
  Link width and adding a Connection Manager note to Disable Gen 4 Link
  Recovery flow before doing Asymmetric Transitions."

Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
---
 drivers/thunderbolt/tb.c      |  23 ++++---
 drivers/thunderbolt/tb.h      |   3 +
 drivers/thunderbolt/tb_regs.h |   1 +
 drivers/thunderbolt/usb4.c    | 125 ++++++++++++++++++++++++++++++++++
 4 files changed, 142 insertions(+), 10 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index a7c6919fbf97..da53e4619eca 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1013,7 +1013,7 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 			     struct tb_port *dst_port, int requested_up,
 			     int requested_down)
 {
-	bool clx = false, clx_disabled = false, downstream;
+	bool clx_was_enable = false, lrf_was_enable = false, downstream;
 	struct tb_switch *sw;
 	struct tb_port *up;
 	int ret = 0;
@@ -1075,14 +1075,12 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 			continue;
 
 		/*
-		 * Disable CL states before doing any transitions. We
-		 * delayed it until now that we know there is a real
-		 * transition taking place.
+		 * Disable CL states and Link Recovery flow before doing any
+		 * transitions. We delayed it until now that we know there is
+		 * a real transition taking place.
 		 */
-		if (!clx_disabled) {
-			clx = tb_disable_clx(sw);
-			clx_disabled = true;
-		}
+		clx_was_enable = tb_disable_clx(sw);
+		lrf_was_enable = usb4_disable_lrf(sw);
 
 		tb_sw_dbg(up->sw, "configuring asymmetric link\n");
 
@@ -1097,9 +1095,14 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 		}
 	}
 
-	/* Re-enable CL states if they were previosly enabled */
-	if (clx)
+	/*
+	 * Re-enable CL states and Link Recovery flow if
+	 * they were previosly enabled
+	 */
+	if (clx_was_enable)
 		tb_enable_clx(sw);
+	if (lrf_was_enable)
+		usb4_enable_lrf(sw);
 
 	return ret;
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index ddbf0cd78377..3bec35f78d51 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1336,6 +1336,9 @@ bool usb4_port_asym_supported(struct tb_port *port);
 int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width);
 int usb4_port_asym_start(struct tb_port *port);
 
+bool usb4_enable_lrf(struct tb_switch *sw);
+bool usb4_disable_lrf(struct tb_switch *sw);
+
 /**
  * enum tb_sb_target - Sideband transaction target
  * @USB4_SB_TARGET_ROUTER: Target is the router itself
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 4e43b47f9f11..085139e1a958 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -398,6 +398,7 @@ struct tb_regs_port_header {
 #define PORT_CS_19_WOD				BIT(17)
 #define PORT_CS_19_WOU4				BIT(18)
 #define PORT_CS_19_START_ASYM			BIT(24)
+#define PORT_CS_19_ELR				BIT(31)
 
 /* Display Port adapter registers */
 #define ADP_DP_CS_0				0x00
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index e51d01671d8e..49dd3d201617 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/ktime.h>
 #include <linux/units.h>
+#include <linux/string_helpers.h>
 
 #include "sb_regs.h"
 #include "tb.h"
@@ -1518,6 +1519,130 @@ bool usb4_port_clx_supported(struct tb_port *port)
 	return !!(val & PORT_CS_18_CPS);
 }
 
+static int __usb4_port_lrf_enable(struct tb_port *port,
+		       bool enable, bool *was_enable)
+{
+	int ret;
+	u32 val;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_usb4 + PORT_CS_19, 1);
+	if (ret)
+		return ret;
+
+	*was_enable |= !!(val & PORT_CS_19_ELR);
+
+	if (enable)
+		val |= PORT_CS_19_ELR;
+	else
+		val &= ~PORT_CS_19_ELR;
+
+	ret = tb_port_write(port, &val, TB_CFG_PORT,
+			    port->cap_usb4 + PORT_CS_19, 1);
+	if (ret)
+		return ret;
+
+	tb_port_dbg(port, "ELR %s\n", str_enabled_disabled(enable));
+	return 0;
+}
+
+static int usb4_switch_lrf_enable(struct tb_switch *sw)
+{
+	bool was_enable = false;
+	struct tb_port *up, *down;
+	int ret;
+
+	up = tb_upstream_port(sw);
+	down = tb_switch_downstream_port(sw);
+
+	ret = __usb4_port_lrf_enable(up, true, &was_enable);
+	if (ret)
+		return ret;
+
+	ret = __usb4_port_lrf_enable(down, true, &was_enable);
+	if (ret)
+		return ret;
+
+	tb_sw_dbg(sw, "ELR %s\n", str_enabled_disabled(true));
+
+	return 0;
+}
+
+static int usb4_switch_lrf_disable(struct tb_switch *sw)
+{
+	bool was_enable = false;
+	struct tb_port *up, *down;
+	int ret;
+
+	up = tb_upstream_port(sw);
+	down = tb_switch_downstream_port(sw);
+
+	ret = __usb4_port_lrf_enable(up, false, &was_enable);
+	if (ret)
+		return ret;
+
+	ret = __usb4_port_lrf_enable(down, false, &was_enable);
+	if (ret)
+		return ret;
+
+	tb_sw_dbg(sw, "ELR %s\n", str_enabled_disabled(false));
+
+	/* At least one ELR has been disabled */
+	return was_enable ? 1 : 0;
+}
+
+/**
+ * usb4_disable_lrf() - Enables Link Recovery flow up to host router
+ * @sw: Router to start
+ *
+ * Enables Link Recovery flow from @sw up to the host router.
+ * Returns true if every Link Recovery flow was successfully enabled.
+ */
+bool usb4_enable_lrf(struct tb_switch *sw)
+{
+	bool enabled = true;
+
+	do {
+		if (usb4_switch_lrf_enable(sw) < 0) {
+			tb_sw_warn(sw, "failed to enable Link Recovery flow\n");
+			enabled = false;
+		}
+
+		sw = tb_switch_parent(sw);
+	} while (sw);
+
+	return enabled;
+}
+
+/**
+ * usb4_disable_lrf() - Disable Link Recovery flow up to host router
+ * @sw: Router to start
+ *
+ * Disables Link Recovery flow from @sw up to the host router.
+ * Returns true if any Link Recovery flow was disabled. This
+ * can be used to figure out whether the link was setup by us
+ * or the boot firmware so we don't accidentally enable them if
+ * they were not enabled during discovery.
+ */
+bool usb4_disable_lrf(struct tb_switch *sw)
+{
+	bool disabled = false;
+
+	do {
+		int ret;
+
+		ret = usb4_switch_lrf_disable(sw);
+		if (ret > 0)
+			disabled = true;
+		else if (ret < 0)
+			tb_sw_warn(sw, "Link Recovery flow cannot be disabled\n");
+
+		sw = tb_switch_parent(sw);
+	} while (sw);
+
+	return disabled;
+}
+
 /**
  * usb4_port_asym_supported() - If the port supports asymmetric link
  * @port: USB4 port
-- 
2.45.2


