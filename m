Return-Path: <linux-usb+bounces-20401-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4D5A2EF09
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 14:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58CAE164CD9
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 13:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083702309AC;
	Mon, 10 Feb 2025 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oscium-com.20230601.gappssmtp.com header.i=@oscium-com.20230601.gappssmtp.com header.b="FkfVwRjt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FBD14B08C
	for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739195854; cv=none; b=mUV+xWNV1/WNUpRGI5QkmVazJePufVKyaW9PgZ6sY8cxs5xbxEGvh3JG0DxvL+0p1NkvyPdFobHy6fW0qs6nZjySuFG7pu9BP1zUFj/LZyhI3/F1mlUY6OC73HCBDfC75R3WdqEJs+l5UCIKYJNU74S2TMiz9jvQj03OvOP6F34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739195854; c=relaxed/simple;
	bh=QXT6KiT3RSQz0+6YG54MJV9iN8fA4nPM9LZD5tFJXJc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qIJd5T9W+FzciW/mdItm+X7n/BtThZ1I1vgieQpPYrWyFMSykeqWyzgsJW54doWfxD6OkO+5PMTXUxC9Ct+NpkWTpM73Fd5xL+doBFXAJ3tbVBspaMduQhc8keJy36y2pXL1vkBh4B7Dh3xRAmfHivAmXXddJnjAiPqgyzco1Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oscium.com; spf=pass smtp.mailfrom=oscium.com; dkim=pass (2048-bit key) header.d=oscium-com.20230601.gappssmtp.com header.i=@oscium-com.20230601.gappssmtp.com header.b=FkfVwRjt; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oscium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oscium.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5203c91d28bso423400e0c.2
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 05:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oscium-com.20230601.gappssmtp.com; s=20230601; t=1739195852; x=1739800652; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CWfwQCtKPeQHb06KKLpd2iYAmIJ6IMcQTyiX2qQjFpc=;
        b=FkfVwRjt4eUpbCWBv+rD9HWajVaxkdTPAxp+wBuhxSnyb4rHifslgewsZWOHTye8Kr
         p4liYL4c1oBke9j0rtmT2JTwRxYoNTDHjUQGPIHGRENHKSAxvHLE3NRMdPDYehoVYpxC
         sqvnXhXGkOaqCvwFC4AFdip4kU5uTY9oFYEgMIqlhyBUeS1J7p2Dnws/E4LUfbclOPIn
         mOz0eE9bGpdfk6bM2oY+/pDdUnco2w9F3MnZYvhlQ75uxXXfD8LF4SDIZjFIKEhOtzF9
         dUE+gd5Y9bSvZDqr0H466dcPHgrFiEwFKeXJl22W8ZiQ2KguCuMjwQFf09ogTyBun9hT
         1rnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739195852; x=1739800652;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CWfwQCtKPeQHb06KKLpd2iYAmIJ6IMcQTyiX2qQjFpc=;
        b=Nrsj6iRlFwbRQ4HvObVlNIezUY++cw3ngvZj7UtPULDQTFfpxmA55ItTgiDKCwFY96
         cqeCnXWBXNnGee4oAMOGJLE70JiSLdcWcNndg/yrROZxUxKQPu8v0K/U4MVFPYI3/C/c
         XdqZXoP82sv+GL3xAJkbJklpIpR93/eu7K5v+IgpbbrlfRYyDgJ/runDbflQ3IdSRFvh
         kMYznKYR811GGFPesbtG5RE8YKJiWXC8kzYi+ZtqrWLLddUlMGjzkFnShKENuoWtkwQn
         OKhLB7W/GewO/RmZZAX9hIQr9+x38gZbByCQ0mhWXsp2szbsMSzz2VWxzXWYM0lgbo52
         lF1Q==
X-Gm-Message-State: AOJu0Yy7QQC2Vl2xGWjNG1l/k7wiFdSluAjXKHJphCZb1i6Lg8du67pe
	ZWpnQZDfjd3HfVpgAFfsUpBctZtUr25O41xDYcjC3Y9fO0zIz4PPslv11LhtZXtbG+bZ/6X/wyM
	tKxGwv2HZieQY2I05LaUc82vTfI2VESmO0epa0A==
X-Gm-Gg: ASbGncuICTVLuoXXUfg3o1z5ydf78Gkrj+vi+heeBvtQaQWe9SOwBtRtori8sck5Vki
	0anNq48Pm9ZVqcuzGviMweJu6w6MMIUweCIkbvbY6akMD6U9nLJVHPT0nnFE261bV/JtaVAg=
X-Google-Smtp-Source: AGHT+IE3+6DXL9qr/D8Ep+e74MZr+lyWci6RpBT2nueXyECM+9f5xoo1RPSzXsvdqhmhCRpYxkIjjVFNLqSvRzrw6p8=
X-Received: by 2002:a05:6122:a26:b0:520:4ed1:62dc with SMTP id
 71dfb90a1353d-5204ed167b3mr758429e0c.5.1739195851567; Mon, 10 Feb 2025
 05:57:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Matt Lee <matt@oscium.com>
Date: Mon, 10 Feb 2025 07:57:20 -0600
X-Gm-Features: AWEUYZkmP71RpNlZFFGFKEerYiywl-1A7Z54ZTPuJkPeW_7kJZcDN9KrzE0mVes
Message-ID: <CABrMTjey9pZXh=fWevfv2saNOs+_2uV6feV5xbYbP_4nKcq8mw@mail.gmail.com>
Subject: [PATCH 1/2] USB: max3421: Improve retransmit handling for NAK responses
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, matt@oscium.com
Content-Type: text/plain; charset="UTF-8"

This reverts a previously submitted patch where the slow retransmit was removed.

Previously, the max3421 driver would immediately retry transmissions
indefinitely
upon receiving a NAK response, leading to potential stalls.

This patch re-introduces a limit (`NAK_MAX_FAST_RETRANSMITS`) on how
many times a
request is retransmitted immediately.  After reaching this limit, the driver
falls back to a slower retransmit strategy using `max3421_slow_retransmit()`.

This improves robustness when dealing with unresponsive USB devices.

Signed-off-by: Matt Lee <matt@oscium.com>
---
 drivers/usb/host/max3421-hcd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 1234567..abcdef0 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -72,6 +72,12 @@
 #define USB_MAX_FRAME_NUMBER   0x7ff
 #define USB_MAX_RETRIES        3 /* # of retries before error is reported */

+/*
+ * Max. # of times we're willing to retransmit a request immediately in
+ * response to a NAK.  Afterwards, we fall back on trying once a frame.
+ */
+#define NAK_MAX_FAST_RETRANSMITS       2
+
 #define POWER_BUDGET   500     /* in mA; use 8 for low-power port testing */

 /* Port-change mask: */
@@ -924,8 +930,11 @@ max3421_handle_error(struct usb_hcd *hcd
                 * Device wasn't ready for data or has no data
                 * available: retry the packet again.
                 */
+               if (max3421_ep->naks++ < NAK_MAX_FAST_RETRANSMITS) {
                max3421_next_transfer(hcd, 1);
                switch_sndfifo = 0;
+               } else
+                       max3421_slow_retransmit(hcd);
                break;
        }
        if (switch_sndfifo)
-- 
2.34.1

