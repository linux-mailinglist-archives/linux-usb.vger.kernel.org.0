Return-Path: <linux-usb+bounces-28160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB6BB59B81
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 17:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CAB3581419
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 15:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741AF350D62;
	Tue, 16 Sep 2025 15:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+znDs0p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441E9307AF5
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034987; cv=none; b=USazRWOvqB35aYfnsgQHly2X9tnhlq1h7D4Mtw+QaJZmetwJZTEbV1OVpmU0Js0BTnStC9EfL1ohanrf3mlIv5GlyvNIY/Eo6d+Sc4X+DSk25ylpc48mNPlMkOVFbpGNYhZZ97l6iwbgwSAzokUqoTTF59BWR5fUJH9YUtibmSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034987; c=relaxed/simple;
	bh=JWAOPJVJwm9JYWeWUAD5rygvd8/WMZojAO7MBTDFeao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9vIuUwrEsafyyndKcddV5TsyN3Ccvrlb7QXIDWrBRQkrE2artQrL92HRGWcsaWVHbpHSIX6oT+uiFrg1tXlpnO9mC8l4sBb9y/4I39pWIsbfYtanPIwl2wabuDKJA3avSGt+AOSsiR1XBI7QOJ8N/dapfYemrFmhjTs8VcJXUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+znDs0p; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso41247415e9.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758034982; x=1758639782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uuy6+KxTBsC6SlUdB1lv3rItTmRywfPxKGtKtkwquJE=;
        b=e+znDs0pGGlz4NGNnRj7sJynRZQsghAUSe9ow1UgR9AfWB0fUUaQzEGHk8WzKs1LkX
         jzRA2B0oXpx3SYs+0XBGH50UPYY4MeI6KG4skV8Uzh6fAhredjNSAYt8/MTNB3YSYSBu
         W68nLQz0KM46e9hWETj6rR4tXlIYDhhBE+jIiH4Vkj37T2r///Mt879u3tN+fXiKNQ8N
         BDhfL/x4KTVJNfCoZ5EWOLtaaTw8EM6Wr6nyOoRnAn0mU4Ce1l4oQsx115h4ctQPPHPO
         E7c00ad+H2xnXHE7wUXxuzWr35dIdhAmddfhkBXJZpXrXhzJVsp8gkzgxoDsdH/aMqBk
         HhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034982; x=1758639782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uuy6+KxTBsC6SlUdB1lv3rItTmRywfPxKGtKtkwquJE=;
        b=iUup+VHNJbbZ+PFqwne02OY3T4N6y8t0m0Q12Zw3lz7MGQAgUU9S4gkR3cHDGDta5X
         RUek2C1T6Zve3y/A+Y2B3/g63t73xEKmadPMR6yvqnJLKfZanvAm8ogxoRIP7pNfID4/
         aK+cuCJgeDoP1sU3r4f/oNC5DfxSnJyp613n+MDPr3wNzAy6vm9zKLjcYfVu6vEU5sv/
         obDkoLgfm4VJbMyeJtCCcsbbM0afVf4m+Oji/BkwyJpaR0p5RQ2qKjcLXjyxRz6obg2h
         ysO5Yy0Wh9UQSxUrSCCKlVjyNbCqxUAy9AoCH4m3UiPh+a/4N3GCvQplSKOC2LrT0hpf
         R5wA==
X-Forwarded-Encrypted: i=1; AJvYcCUSeEsYp9OQxa6OtqlJ9F9JtgoI6lFHkrvJWJOLamHo3qd5Ck6OjwQP2Qo0rf3R46wNWswbUxAGssk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzquweDsbQcNhLA42C5nTUNYE7OvhNKSaN6c61Q47KAphwa8OiD
	NulKbxpdzYq0nhV8Ygix9LWcvybOR+MDryGSHEybVkhAUrmj22uENisc
X-Gm-Gg: ASbGncvejjR6LWVAS+b1gvkje0bFxLLaAtiY0ePU5X9MxlJbFnANctrvrL0ELw905Ye
	xNVsnUmOzaEccCMCLUFwMu+bUY1/eexoBn9ebWcLVlonRv+XGbiScPBrTn4Szsyj7YRc6H/a9s8
	xFJs9VP/T8D3rBvTMWpWQL6wgrojp5DJ5Zl1moJDsPUcjNUlzr0PyRq0dhWW+GLqymB+L/5usE5
	0MlpHjzRPXUyfoOr/O/xK1zduHVOJ2iGmvTVg1qvd2Xq5rQdHDr3nkv1f0rZ4dm9goprJsg9yyj
	6taxPNqrX/KiAt1FDvJG3L9u7YEGJ0xxf3Abo+rUv/6JP2LTFMe9Gwgr5Vdssyaas4F6uwwbvtc
	IFw29moUsV+hrUZ05exa7ELdFvVm6NFYlt+TFJkYFv/CzkhNFl0eZh2R5v6g+9NMibrFUAi8XjW
	Q30w==
X-Google-Smtp-Source: AGHT+IGaK+iWpAtXwRiAraxvEqz36VioS/HwnWCyYlLR+y9IAHh0lXnlG9NgJ3OxFlqx32YU43DzKQ==
X-Received: by 2002:a05:6000:4023:b0:3eb:4e88:55e with SMTP id ffacd0b85a97d-3eb4e88099emr5348037f8f.41.1758034981581;
        Tue, 16 Sep 2025 08:03:01 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdc2deb20sm932154f8f.47.2025.09.16.08.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:03:01 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 4/9] usb: host: xhci-rcar: Move R-Car reg definitions
Date: Tue, 16 Sep 2025 16:02:40 +0100
Message-ID: <20250916150255.4231-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Move xhci-rcar reg definitions to a header file for the preparation of adding
support for RZ/G3E XHCI that has different register definitions.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/usb/host/xhci-rcar-regs.h | 49 +++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-rcar.c      | 45 +---------------------------
 2 files changed, 50 insertions(+), 44 deletions(-)
 create mode 100644 drivers/usb/host/xhci-rcar-regs.h

diff --git a/drivers/usb/host/xhci-rcar-regs.h b/drivers/usb/host/xhci-rcar-regs.h
new file mode 100644
index 000000000000..5ecbda858be0
--- /dev/null
+++ b/drivers/usb/host/xhci-rcar-regs.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __XHCI_RCAR_H
+#define __XHCI_RCAR_H
+
+/*** Register Offset ***/
+#define RCAR_USB3_AXH_STA	0x104	/* AXI Host Control Status */
+#define RCAR_USB3_INT_ENA	0x224	/* Interrupt Enable */
+#define RCAR_USB3_DL_CTRL	0x250	/* FW Download Control & Status */
+#define RCAR_USB3_FW_DATA0	0x258	/* FW Data0 */
+
+#define RCAR_USB3_LCLK		0xa44	/* LCLK Select */
+#define RCAR_USB3_CONF1		0xa48	/* USB3.0 Configuration1 */
+#define RCAR_USB3_CONF2		0xa5c	/* USB3.0 Configuration2 */
+#define RCAR_USB3_CONF3		0xaa8	/* USB3.0 Configuration3 */
+#define RCAR_USB3_RX_POL	0xab0	/* USB3.0 RX Polarity */
+#define RCAR_USB3_TX_POL	0xab8	/* USB3.0 TX Polarity */
+
+/*** Register Settings ***/
+/* AXI Host Control Status */
+#define RCAR_USB3_AXH_STA_B3_PLL_ACTIVE		0x00010000
+#define RCAR_USB3_AXH_STA_B2_PLL_ACTIVE		0x00000001
+#define RCAR_USB3_AXH_STA_PLL_ACTIVE_MASK (RCAR_USB3_AXH_STA_B3_PLL_ACTIVE | \
+					   RCAR_USB3_AXH_STA_B2_PLL_ACTIVE)
+
+/* Interrupt Enable */
+#define RCAR_USB3_INT_XHC_ENA	0x00000001
+#define RCAR_USB3_INT_PME_ENA	0x00000002
+#define RCAR_USB3_INT_HSE_ENA	0x00000004
+#define RCAR_USB3_INT_ENA_VAL	(RCAR_USB3_INT_XHC_ENA | \
+				RCAR_USB3_INT_PME_ENA | RCAR_USB3_INT_HSE_ENA)
+
+/* FW Download Control & Status */
+#define RCAR_USB3_DL_CTRL_ENABLE	0x00000001
+#define RCAR_USB3_DL_CTRL_FW_SUCCESS	0x00000010
+#define RCAR_USB3_DL_CTRL_FW_SET_DATA0	0x00000100
+
+/* LCLK Select */
+#define RCAR_USB3_LCLK_ENA_VAL	0x01030001
+
+/* USB3.0 Configuration */
+#define RCAR_USB3_CONF1_VAL	0x00030204
+#define RCAR_USB3_CONF2_VAL	0x00030300
+#define RCAR_USB3_CONF3_VAL	0x13802007
+
+/* USB3.0 Polarity */
+#define RCAR_USB3_RX_POL_VAL	BIT(21)
+#define RCAR_USB3_TX_POL_VAL	BIT(4)
+
+#endif /* __XHCI_RCAR_H */
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 1cc082a3b793..6d4662def87f 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -14,6 +14,7 @@
 
 #include "xhci.h"
 #include "xhci-plat.h"
+#include "xhci-rcar-regs.h"
 #include "xhci-rzv2m.h"
 
 #define XHCI_RCAR_FIRMWARE_NAME_V1	"r8a779x_usb3_v1.dlmem"
@@ -29,50 +30,6 @@
 MODULE_FIRMWARE(XHCI_RCAR_FIRMWARE_NAME_V1);
 MODULE_FIRMWARE(XHCI_RCAR_FIRMWARE_NAME_V3);
 
-/*** Register Offset ***/
-#define RCAR_USB3_AXH_STA	0x104	/* AXI Host Control Status */
-#define RCAR_USB3_INT_ENA	0x224	/* Interrupt Enable */
-#define RCAR_USB3_DL_CTRL	0x250	/* FW Download Control & Status */
-#define RCAR_USB3_FW_DATA0	0x258	/* FW Data0 */
-
-#define RCAR_USB3_LCLK		0xa44	/* LCLK Select */
-#define RCAR_USB3_CONF1		0xa48	/* USB3.0 Configuration1 */
-#define RCAR_USB3_CONF2		0xa5c	/* USB3.0 Configuration2 */
-#define RCAR_USB3_CONF3		0xaa8	/* USB3.0 Configuration3 */
-#define RCAR_USB3_RX_POL	0xab0	/* USB3.0 RX Polarity */
-#define RCAR_USB3_TX_POL	0xab8	/* USB3.0 TX Polarity */
-
-/*** Register Settings ***/
-/* AXI Host Control Status */
-#define RCAR_USB3_AXH_STA_B3_PLL_ACTIVE		0x00010000
-#define RCAR_USB3_AXH_STA_B2_PLL_ACTIVE		0x00000001
-#define RCAR_USB3_AXH_STA_PLL_ACTIVE_MASK (RCAR_USB3_AXH_STA_B3_PLL_ACTIVE | \
-					   RCAR_USB3_AXH_STA_B2_PLL_ACTIVE)
-
-/* Interrupt Enable */
-#define RCAR_USB3_INT_XHC_ENA	0x00000001
-#define RCAR_USB3_INT_PME_ENA	0x00000002
-#define RCAR_USB3_INT_HSE_ENA	0x00000004
-#define RCAR_USB3_INT_ENA_VAL	(RCAR_USB3_INT_XHC_ENA | \
-				RCAR_USB3_INT_PME_ENA | RCAR_USB3_INT_HSE_ENA)
-
-/* FW Download Control & Status */
-#define RCAR_USB3_DL_CTRL_ENABLE	0x00000001
-#define RCAR_USB3_DL_CTRL_FW_SUCCESS	0x00000010
-#define RCAR_USB3_DL_CTRL_FW_SET_DATA0	0x00000100
-
-/* LCLK Select */
-#define RCAR_USB3_LCLK_ENA_VAL	0x01030001
-
-/* USB3.0 Configuration */
-#define RCAR_USB3_CONF1_VAL	0x00030204
-#define RCAR_USB3_CONF2_VAL	0x00030300
-#define RCAR_USB3_CONF3_VAL	0x13802007
-
-/* USB3.0 Polarity */
-#define RCAR_USB3_RX_POL_VAL	BIT(21)
-#define RCAR_USB3_TX_POL_VAL	BIT(4)
-
 static void xhci_rcar_start_gen2(struct usb_hcd *hcd)
 {
 	/* LCLK Select */
-- 
2.43.0


