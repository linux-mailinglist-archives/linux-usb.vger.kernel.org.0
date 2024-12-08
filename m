Return-Path: <linux-usb+bounces-18224-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B63DC9E8430
	for <lists+linux-usb@lfdr.de>; Sun,  8 Dec 2024 09:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A7311884989
	for <lists+linux-usb@lfdr.de>; Sun,  8 Dec 2024 08:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FCE137776;
	Sun,  8 Dec 2024 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McGBB+BP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E301B960
	for <linux-usb@vger.kernel.org>; Sun,  8 Dec 2024 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733645491; cv=none; b=Hf3zR8JDoKWVO9Bt1ZQlNo1E/I/cOcbPifIQpfGB2gnYTeGwUJoHQF8QLFGbbVk5crwxK2jD+h9Ve0YXJ0SZS3E2UZXC1m8EMkrm7/Dw09HEaRLQTV1K1JyFbWyWY+z5g99ltCLqelNprZ2xP6v9mTWUb9R/saQlsohGxny3rXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733645491; c=relaxed/simple;
	bh=j/iX9Zr/V0U3Xoh3zsC8S3fjp6s/yYmIYh/OBSS4iGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hIFkcz2xfryg/lq6Jf2ZH3Y+ROdoxQU8wfc1frFrftc1/TxJ9gUPNyKW07SOZUb1P1iI0sujqLqa796CiWujy+myb9yInwXh3sbUco5i4dY7Hi3d2s1SJZVgvg8C1533J7dalmVdfbLfnmFN8FJCCmN+KsrC9ltfdY5y7yMrPCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McGBB+BP; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5f2b80b8e53so14073eaf.3
        for <linux-usb@vger.kernel.org>; Sun, 08 Dec 2024 00:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733645489; x=1734250289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7jBptzeD+3rO9BG6W7pOTVHxt2UZZz53DqQuzWKpM0Y=;
        b=McGBB+BP8LtzMW0EeNstvARgN936yUltHdAhWy/BQpOzJf/9GEUcrA8w1DlQEk00ey
         hSIPr8UJgYjgZ8g6bwvD1GpZx//jr7qfcKUAiMNcDhBD7JrFSqEclMPBd21uWJsuJIbt
         tdWRad7oVFaouJWNwEgApH03Oiay7tXAhBjRsAwAC3Ek4A+fDvTtfq4QirOu1Wl8C332
         2NUpc/lDOCSWsQcVdcazRAqV/abnpeXwbIkmmDT67iAyDSSjn+FlbOXFwnVMAE3J204R
         yRjxJuPVndiwEyjNZuTko0AmmooRCBP8jCkg+jGj5IEg4vT4PFc9EgDBUFm99/8s9qeK
         x3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733645489; x=1734250289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jBptzeD+3rO9BG6W7pOTVHxt2UZZz53DqQuzWKpM0Y=;
        b=k2A4wxzfrqlaLVSIfXJg1NBmca7Ail/hRzGBsrZqdqtxfE8JyN3Y9wPbDYlpqdc95m
         w1j69iE2JpSVXrb+TtUBes15Shmxwhj36DPTnEurHFFnwBPoUWnRPjuM+vRYejaLE+k1
         UtMzUwvURXOt+k9idrIER3O+k9aLFczkwaJugGVOVUSI/VNSTctuDLdgCosg7+fVLalT
         aB7DXz9PwrsMSra171P/CAQkrFN9ny4U5m1tUlSpj1gMtHz74AharG3OHzkitCQaM4xC
         NOLjNgwrH2YSKyCjqZbX0ogH0gVo0iIyveaaQR02jXwSRzJOsy54XTgtifOSw3HJRSzg
         bAvA==
X-Forwarded-Encrypted: i=1; AJvYcCUp3Ri3BZBn6ZFUJMrRHE9ChKH04tZoZ+UIn5kSLeUOAd3KAMSmohgbgX6/QvRLWR5P6FicUHurpmA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6GR2mFIowUkSojGsZ/GlIiNTnqTF3kvAeT+GDkmeabQKiNqGn
	6luNvLMrCcWtmYrN0LhYASegzSKiQ4i6tDRdSdhETkeHpgFeaS7n
X-Gm-Gg: ASbGnctNy0k0wqCiJFZaa07fBg8kVwo04/QIfNcAlKQUSgxblzbjKVhduxVef3RU6nc
	hsggtvxInxLGQ0VWMjpMZJ/GvXi6ohHKji2jz70OOG6jfvu5+r3ElCbhaiQZAKUeDDx65UokNTf
	3UQV5sMhmajFNUoWR13XmUoPnZ24ZsGblwMwm4+q55pLrXusEG7eCeXpVo1cK+oOCq+R7EEBJPr
	jEeiCzwyOGRT1lRapaa+RWk/Vhzwz8gDFlwrDkocFOj515q5pUq3S8rUOw=
X-Google-Smtp-Source: AGHT+IFHV+HsHTCX9BmS3agQjlTw41s3Alw4UWeQqBtWs0qTdRr3EnpeE3wNEzYs8S90xYj9G+2+jA==
X-Received: by 2002:a05:6870:9e43:b0:29e:48c4:aa0c with SMTP id 586e51a60fabf-29f732d86f5mr5331841fac.10.1733645489230;
        Sun, 08 Dec 2024 00:11:29 -0800 (PST)
Received: from office.local ([107.128.30.202])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-29f569a698dsm1964925fac.49.2024.12.08.00.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 00:11:28 -0800 (PST)
From: Blake LaFleur <blake.k.lafleur@gmail.com>
To: johan@kernel.org,
	blake.k.lafleur@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] USB: serial: ch341: Add product ID for CH9102
Date: Sun,  8 Dec 2024 02:11:15 -0600
Message-ID: <20241208081115.4036852-1-blake.k.lafleur@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a PID for the CH9102 chipset that can be found in some cheap ESP
development boards.

Example: LILYGO T-Display (and its S3 variant)
https://lilygo.cc/products/lilygo%C2%AE-ttgo-t-display-1-14-inch-lcd-esp32-control-board

After patching the driver to include idProduct=0x55d4 the devices work
as expected.

Signed-off-by: Blake LaFleur <blake.k.lafleur@gmail.com>
---
 drivers/usb/serial/ch341.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index d10e4c4848a0..302d8d8547cb 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -81,6 +81,7 @@
 #define CH341_QUIRK_SIMULATE_BREAK	BIT(1)
 
 static const struct usb_device_id id_table[] = {
+	{ USB_DEVICE(0x1a86, 0x55d4) },
 	{ USB_DEVICE(0x1a86, 0x5523) },
 	{ USB_DEVICE(0x1a86, 0x7522) },
 	{ USB_DEVICE(0x1a86, 0x7523) },
-- 
2.45.2


