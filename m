Return-Path: <linux-usb+bounces-23292-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBF1A96266
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 10:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3500716F705
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 08:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C472980D0;
	Tue, 22 Apr 2025 08:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q0U0vOb3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8802A2980CC
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310621; cv=none; b=NZVA1k3lMnJhdPj4R/+ZOKoGKtCE+FU9XvhtKDNyg11tFGrC98ArHgGXIHnqHDhGL7Wdb9tlf1GHnFV7cZHj9HAuRJuv6PCit6D0w3BCuiWGQUkDXNdhH3OoUZfqXyQvxKtM1lH4c+c5HHDSUOES6m5bHeOeSLpEcwBJETWd2nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310621; c=relaxed/simple;
	bh=gBnvR1I1ZnFzb4vg65PBtlZBg4X6LVpbCReLzWaUhJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJf6AnOiIPRKRVfN+NCrv7ITP+IRLXfVLizclA9JvzANkWLIlESHLUr4LrZ+bovqs/Sr0XaauYFQ2DF7WfW9eEiZ/b1aForBNROX8GJSJXFifPOlA0XIa8GkucLriwzmCAyH1vdhuggWBJChNb+3GScmdvR2D6AYrRYZt2/CWZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q0U0vOb3; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso6345709b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745310619; x=1745915419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhnP5fHmR2Q8bheAgrl4QJ3VtrLDUwvDbOgI8e/2CDY=;
        b=Q0U0vOb32HFqTuyURLC878BQfNxM7IzgvSOIjD55i/oMdzYfGjga3m1eSUNcB5u2lO
         hL5rBDkkuUAeUZaq6ciCdsZI1o2unSZFGms1rfJhAegNcQVyFcYsEYAT5BbESQszm77s
         VSwIox65hVUfBDa46fAzqtcxOsRZnOfzF4q/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310619; x=1745915419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhnP5fHmR2Q8bheAgrl4QJ3VtrLDUwvDbOgI8e/2CDY=;
        b=u7Yme1hoCvLnib5uREs2G1idUfVMy6kNMWEsooNrc1KxFaYy3c9IGgacYB3ZJ/doaT
         C9L2sUGyBjBgVsKU4Lun89mf+XSeU+bHJ+POEzAdGQYX37SR4NDyblNXGNC+ZyhrLZGy
         nzqGUFPRYCDlWZHcBLpJJWZ23T66ihtL5AKwQOiTOZJfth4UT3RCsgQPZykDhaXAMpyQ
         7jKHAuQGGKERPmrwJ+iynUiLsArvHK9epFAnAaJupR7WYN55pz4hDm/30lscxAC1c+8j
         GxLyMSqZ9BLTvHJs+BkigOh8akpqrZGAPSRrrtMHr3DkXWxhy7lrzCjnW+SmwpKKrHxS
         NeHg==
X-Forwarded-Encrypted: i=1; AJvYcCVewp6szYgNYvkrmrKf4RsJefopwareLc3e0XL11PQa091t/40ktClfwPkEKzJk6TkTNInwDhea58Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRm2Ck4i9mGdxF+RjnU9UF2A8EKoH5U8H0KNCuME7lvLQXLOpi
	Mzu0HD+4DbHACzq23HeYzCBJi/6Yswzku0ztC7O6NDsa37AQdGMFGm2THf+O2A==
X-Gm-Gg: ASbGncs5cLDJCTE6kwpWZXy2aXqDbDbRmcJDTby8DlLaf2eg5KugbftRDeM8KDFGbd6
	z4WTqAMOa8Q83tAjHeFx2p3KubUGbtRlX8R3CpCy3JrlfFJrXkXkKzb1EoLinYkZH6zt2c/ZuJF
	siUKxAn+8LP7vk8gUNf24sJOJvZNOWiidqKSwuWRUSug/b4E1zLP6wI+QV7wh3ZiqUyFMVc7g2q
	26j6ZAlxAJtvcipWjccm6X7xW/ge0WpRfBSDkp0PpuM/oZ/vxxTgwlqd1ZHazvuHrhLB1QT5ARC
	MWlmBJnbT9lxSiAI3EQHuyVLpXrDASyeKt77761gJsFZgyORnrDEp7yPEl2rJ4AM
X-Google-Smtp-Source: AGHT+IHvMg/U3wawJMIjtv8NdwlNXjSugJsH0Z0eeETts37HBEVjcFftSg9+DA7CLUjYcHqi3e59Dg==
X-Received: by 2002:a05:6300:42:b0:1f5:8a69:f41b with SMTP id adf61e73a8af0-203cbd41774mr23233480637.37.1745310618738;
        Tue, 22 Apr 2025 01:30:18 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:90d6:56e4:9d90:9df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e0be0sm7993576b3a.49.2025.04.22.01.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:30:18 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 4/4] usb: misc: onboard_usb_dev: Add Parade PS5511 hub support
Date: Tue, 22 Apr 2025 16:28:30 +0800
Message-ID: <20250422082957.2058229-5-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250422082957.2058229-1-treapking@chromium.org>
References: <20250422082957.2058229-1-treapking@chromium.org>
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
2.49.0.805.g082f7c87e0-goog


