Return-Path: <linux-usb+bounces-23073-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E56A2A8987D
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 11:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8582F189E929
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 09:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9F42918FE;
	Tue, 15 Apr 2025 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BZPcIG1T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79FF29117F
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710168; cv=none; b=QyCwCq3Tn907bu1nhO6V2Dd9Apdr62NBhlrNJozayRVLcjfVYrG37FViL8TWs+46N5VM816Sh+4zcWersWLs8FdbTGGZb4QaSmHvy+vJ0/7ywgYcbH+X17uMueTGeo0g//F0v6E1//ASLeoHFHemSmpUQ67TZOh60x3XmYtKlGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710168; c=relaxed/simple;
	bh=/nBMOP+mjkengzFCUOyb+JIzXxW87Mah/5W754BehRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oxxNtbwO4NYcGsQ1cSvW/AEVZWnMEueUhGViOeQlILf/usk/DkT6nSr5sxNlor69v3sp/VZSCPQYkzOg29JIS2H0Qg4K++PVJRIT5JPV9158aujgE1SvTWJVX3AN2uzM6vnBjwxTLtwh346g6kFpnAqbwFzqV1eYgC/TxKqrcfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BZPcIG1T; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227d6b530d8so51099645ad.3
        for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 02:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744710166; x=1745314966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpO334l3cl7LKBvhDLO3AWNd5+6mtKhWKdxedh3WdDQ=;
        b=BZPcIG1TceCevjooIdZP4m+okVUvdalurOrDFG+JSyMH+8fUQ8EoMXl5R0uZ9vF9t8
         fU6bn7dNMmkbJAE7xCIVZEml4jqiJhMQGJjzbWIhNLJzYv79+uKzknFsi5Rg7eORVSNV
         cHvCJH8QdTWVzLTs2qUsC76wG0V50QTEz9IJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710166; x=1745314966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpO334l3cl7LKBvhDLO3AWNd5+6mtKhWKdxedh3WdDQ=;
        b=exkRTtvbVNNn6Pr8tnuTwCBt1WJf3y4fCFmJytjMj5d/N90MsE3+u9g+lPh4xp07MO
         CF1Flzr+mYSMAM5IPv+f+0PyWAFy99nDvcCnObbIMq+heaqOnyeO2CRY7HuVGE8GdDCV
         L0H1/nTY9pMbdQRXBM0vFiUNooorJfy4L8vSUgKp+iWV3kL7pNcgiuiBFv1+AHlgIoPX
         stBEk3fmkpj93fyeXkl6ocWzjbBDD69BCOXLzYCQ8LrHyuBAJKXwo2DW3y/IXd9zePRx
         a6I0k5fTsJKgV6KsX9/Zw6cxp9ZmUrlWGRwu5LjCVH1mtyRjjDNuyAjEZgBg5UpYbL3a
         azSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWycKOgLoTMCbeTOMRa5//HhEfbfsJs0elU0Zs8BiCjExrJo3OmFKUfWWPHuLuRFyIhJWBmBjLvfqE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu3h0USa7eBoe0kIkX5dOtjnDXVsH3gp2SEuLFWsDbhOCrM+ky
	UFyj3nPdyKYIBQlUVKj1VX9TL4CtzLQOazHfv4SHxHJVJKrsGlbxBcRQMd9Bpw==
X-Gm-Gg: ASbGncsYvDzVBxr4sZgG0AyjHd/seqwk2RUIkz4n7sfNUkewO9CWFT5+SCDbQl+TEUq
	5sMAwSx7Lv+QWORjW68G4N7RfvaY0GFLikkCwQEyonSuJEHs7phfzLz7HqzKU19u8CFxh2v3gcu
	okQFTCgmnXB1n4pRTMgP2rUu5VwDszN92d6ho3uIUDVAgu6dznd6HA7/1L3Q8yFipzfzyTMoEEb
	4sK6bs9183Y83nG9GXVOfMHOwPLTGsXWmDR/JRqJajVTr31vjvis2A4EfPEsWAjsysfBQPg052M
	KDMfq1zPm9b1THowd5/GKfsV6osJLSfOkkbX7t5AEK7gWnaJ1MH/D7PkHgaJIs2W
X-Google-Smtp-Source: AGHT+IHBEMPrfPelV2330zwHPA4rKcksLCkHmzMsaQxLYWTxwvUzyGNeqz9IHoGnlcQAVmX7iP454w==
X-Received: by 2002:a17:903:2f82:b0:223:fb3a:8631 with SMTP id d9443c01a7336-22bea4bcce9mr224713015ad.24.1744710165999;
        Tue, 15 Apr 2025 02:42:45 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:7d0d:86ea:ee84:cd08])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca5asm113135215ad.254.2025.04.15.02.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:42:45 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 4/4] usb: misc: onboard_usb_dev: Add Parade PS5511 hub support
Date: Tue, 15 Apr 2025 17:42:01 +0800
Message-ID: <20250415094227.3629916-5-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
In-Reply-To: <20250415094227.3629916-1-treapking@chromium.org>
References: <20250415094227.3629916-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parade PS5511 is 4+1 port USB 3.2 gen 1 hub with a reset pin and two power
supplies (3V3 and 1V1).

Add the support for this hub for the reset pin control and power supply.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

(no changes since v1)

 drivers/usb/misc/onboard_usb_dev.c | 3 +++
 drivers/usb/misc/onboard_usb_dev.h | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 75ac3c6aa92d0d..91b49e58664d6b 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -490,6 +490,7 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_CYPRESS	0x04b4
 #define VENDOR_ID_GENESYS	0x05e3
 #define VENDOR_ID_MICROCHIP	0x0424
+#define VENDOR_ID_PARADE	0x1da0
 #define VENDOR_ID_REALTEK	0x0bda
 #define VENDOR_ID_TI		0x0451
 #define VENDOR_ID_VIA		0x2109
@@ -580,6 +581,8 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2744) }, /* USB5744 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x5744) }, /* USB5744 USB 3.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_PARADE, 0x5511) }, /* PS5511 USB 3.2 */
+	{ USB_DEVICE(VENDOR_ID_PARADE, 0x55a1) }, /* PS5511 USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 933797a7e0841c..2963689958fc2a 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -38,6 +38,13 @@ static const struct onboard_dev_pdata microchip_usb5744_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata parade_ps5511_data = {
+	.reset_us = 500,
+	.num_supplies = 2,
+	.supply_names = { "vddd11", "vdd33"},
+	.is_hub = true,
+};
+
 static const struct onboard_dev_pdata realtek_rts5411_data = {
 	.reset_us = 0,
 	.num_supplies = 1,
@@ -122,6 +129,8 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
+	{ .compatible = "usb1da0,5511", .data = &parade_ps5511_data, },
+	{ .compatible = "usb1da0,55a1", .data = &parade_ps5511_data, },
 	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
-- 
2.49.0.777.g153de2bbd5-goog


