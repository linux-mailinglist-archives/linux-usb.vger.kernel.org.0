Return-Path: <linux-usb+bounces-31229-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 83847CAB030
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 02:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4827E3009138
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 01:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C741EFFB4;
	Sun,  7 Dec 2025 01:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkHQ8Nu0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8631B3923
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 01:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765070482; cv=none; b=E4+z4x8YIlF05ZAav4cJkdCHczTPqUmNRUmIqu6MuUT3XQ03k1/nudoZOJ0oeeF7fhHY4y30SWLhYRSZdcgB/y0/VJAi2vjWaFPZANsodWpUNVSjdjb4aNB+5Jtuw6LOMEez0h2w9t1PBCanwNU6bJ8ZleZaoh+xIHz151FL4dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765070482; c=relaxed/simple;
	bh=3tb6qTFeWKQyX9xBFbKatLGfhpA23zBaFsxeyuQgI3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=REa4PsRtfu8aleRZgK5XbzAeVYX+JgetXo4NgZ+B+gflk4FD1FyRgZ9JZi4mueAe/xvlU6f3pqxGEcCNuGgEgDy2yKwCmqnZz+WCwh4kpdGAkrEa+XSqOwkdv9+NksUvpl3pcQdljTRQjvW9+Qtk6z23mbzteZMdLYNH/+7V+TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkHQ8Nu0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so30648685e9.2
        for <linux-usb@vger.kernel.org>; Sat, 06 Dec 2025 17:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765070478; x=1765675278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/hsRTUO0dPerja0RN89NE+kYKpY7vP1Ws2hi9/Tkcw=;
        b=CkHQ8Nu0HdVt0ejj/JMc1zDE3KDd/q/FFJuZCp0slrCxEtpHBOxkPW0dKtoc/pZmpD
         779WN1CAfz3cpsaiRZ3d8mWb8oZHmVV+P0Q7ME8pRwVQgWvMqNgZlkizLrKPaCJijkRv
         rMEWfjCxKL+NAqBg0LI2UwXlS8iwmTXWVXnjLad+3B1ZNtgMpuwFV3IZec3k0YQzBlUt
         ZFFj6AexEG4QhGT6LKgq6T82n/Mv8wPzXq1qJpjKeJDQAkwXNQnWDSg6zMIX4vbm63mk
         VB7m9I2RKsMoiKgCUcNqG+ydA9sZ5+AqJrIlMkNgPU7KExG5pe3YteLWlCjdI1TRuThk
         96TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765070478; x=1765675278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M/hsRTUO0dPerja0RN89NE+kYKpY7vP1Ws2hi9/Tkcw=;
        b=LHSMacRVJFQTCkZ6oDeLMui36Kb3eienJ1E+ArqP192+WVDn4ge81xNiEkqiHWZ7vV
         S7uNMnx/3KJ8UDdq3BCnJRhCx6jJO/PdrxHAi39kSenYZvCr2EZTSKewaz+pR/GStSOC
         mm+OkDtNukOGCuLSrcHYqAVDHOjQNcvg8jg348E4+UlshbsQp9YtXukHtk9N85+/YR5F
         lVswKH8aktB1EfkE/ww7kKDm/G8QbDDuFtuX/6ZyH0oND/WeTe8WXcwh+KRvUenIn2zj
         dkzXMzEAdTNh8b0dGwzjJ0/KgIkK/esXINAmHMy4D8cWVNZyBFx7du3eWv50ln8kowdK
         NGhA==
X-Gm-Message-State: AOJu0YzS2cZg46yKH7OzO4xZPAd+Ml3l9HLlILBY723G2Y+S75hk8quu
	ge5BDzWrb0hpNZZOiSkWIWCV5DtNem0k0UHWsfkH3jMfx6Rb11LIE6XuRc2GcZF9
X-Gm-Gg: ASbGncuH1dDTlOYQkLgyZNRzXaENY9A8eZVsrytAorZ2UiCYIU7n5AQRpADXtq6BEge
	PJMjS7FWCV4GaZZeY4wLwKE+ppABlR+fiQiBIrC6X7Qgc/1X8bQIrudath+xGveCml/z+BdvtxN
	I3keIYbvysVxSWSglSYDE8HA3fG3y0plXh7b7k2EOuJYQuKaEvnfqTm/e/xvhAqJ/pT4padECy+
	LoWDh5R1gvDp2NSk+OlrCesTArB+9miyen6MZZas6V3rJjSx4u84QP+yQS6wX8m9aWIci/ddO7O
	mQKnA3CqZfoi/GSfdIJmAerto+UNoIOuyoD5+Icb9AZTJL7UkZX/srX2cEvF35Y/fosLtFqDJhB
	UMyorpG5ENVVx9mafo3BgNiip1NweGwXU4yOeh1+PHFvGdwNZ8dM/BZ2TRAANJMI2623ZdAunya
	XcNDOA4Hd3XSMpdIpWLxxnBYSD1JrWJb+pptV40c93g9azyx5B2TWfPwFcCUcGOLgZmuVFxZQF
X-Google-Smtp-Source: AGHT+IGQH8jQ17cy1t3hjY+WvUfQvP46WLig6PPqSjmjEfsUAAtIzQf1fKTqW0ZoILyzmiRb598PqA==
X-Received: by 2002:a05:6000:2283:b0:42f:7636:95cc with SMTP id ffacd0b85a97d-42f89f63229mr3831241f8f.33.1765070478023;
        Sat, 06 Dec 2025 17:21:18 -0800 (PST)
Received: from workstation (ip-176-198-166-064.um43.pools.vodafone-ip.de. [176.198.166.64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d2226d0sm17468392f8f.21.2025.12.06.17.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 17:21:16 -0800 (PST)
From: =?UTF-8?q?Johannes=20Br=C3=BCderl?= <johannes.bruederl@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	=?UTF-8?q?Johannes=20Br=C3=BCderl?= <johannes.bruederl@gmail.com>
Subject: [PATCH v2] usb: core: add USB_QUIRK_NO_BOS for devices that hang on BOS descriptor
Date: Sun,  7 Dec 2025 02:20:59 +0100
Message-ID: <20251207012059.7899-1-johannes.bruederl@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <2025120708-header-startling-ffaf@gregkh>
References: <2025120708-header-startling-ffaf@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add USB_QUIRK_NO_BOS quirk flag to skip requesting the BOS descriptor
for devices that cannot handle it.

Add Elgato 4K X (0fd9:009b) to the quirk table. This device hangs when
the BOS descriptor is requested at SuperSpeed Plus (10Gbps).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220027
Signed-off-by: Johannes Brüderl <johannes.bruederl@gmail.com>
---
v2: Return -ENOMSG instead of 0 to properly indicate no BOS data.

Tested unbind/rebind via /sys/bus/usb/drivers/usb/unbind - works correctly.
Userspace tools (lsusb) handle missing BOS gracefully (no BOS section shown).

Before (device hangs at SuperSpeed Plus, then re-enumerates at lower speed
with different product ID 009c):

[    3.284990] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number 2 using xhci_hcd
[    8.574542] usb 2-2: unable to get BOS descriptor or descriptor too short
[    8.600018] usb 2-2: unable to read config index 0 descriptor/start: -71
[    8.600027] usb 2-2: can't read configurations, error -71
[    8.998412] usb 2-2: Device not responding to setup address.
[    9.215157] usb 2-2: Device not responding to setup address.
[    9.422737] usb 2-2: device not accepting address 3, error -71
[   10.990897] usb 2-2: new SuperSpeed USB device number 5 using xhci_hcd
[   11.065869] usb 2-2: LPM exit latency is zeroed, disabling LPM.
[   11.152244] usb 2-2: New USB device found, idVendor=0fd9, idProduct=009c

After (device enumerates correctly at SuperSpeed Plus):

[    3.297159] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number 2 using xhci_hcd
[    3.354248] usb 2-2: skipping BOS descriptor
[    3.432917] usb 2-2: New USB device found, idVendor=0fd9, idProduct=009b
[    3.432927] usb 2-2: Product: Elgato 4K X

lsusb -t output:
/:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 10000M
    |__ Port 002: Dev 003, If 0, Class=Video, Driver=uvcvideo, 10000M

 drivers/usb/core/config.c  | 5 +++++
 drivers/usb/core/quirks.c  | 3 +++
 include/linux/usb/quirks.h | 3 +++
 3 files changed, 11 insertions(+)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index baf5bc844b6f..2bb1ceb9d621 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -1040,6 +1040,11 @@ int usb_get_bos_descriptor(struct usb_device *dev)
 	__u8 cap_type;
 	int ret;

+	if (dev->quirks & USB_QUIRK_NO_BOS) {
+		dev_dbg(ddev, "skipping BOS descriptor\n");
+		return -ENOMSG;
+	}
+
 	bos = kzalloc(sizeof(*bos), GFP_KERNEL);
 	if (!bos)
 		return -ENOMEM;
diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 47f589c4104a..69ec914e5f45 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -581,6 +581,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* INTEL VALUE SSD */
 	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },

+	/* Elgato 4K X - BOS descriptor fetch hangs at SuperSpeed Plus */
+	{ USB_DEVICE(0x0fd9, 0x009b), .driver_info = USB_QUIRK_NO_BOS },
+
 	{ }  /* terminating entry must be last */
 };

diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
index 59409c1fc3de..2f7bd2fdc616 100644
--- a/include/linux/usb/quirks.h
+++ b/include/linux/usb/quirks.h
@@ -75,4 +75,7 @@
 /* short SET_ADDRESS request timeout */
 #define USB_QUIRK_SHORT_SET_ADDRESS_REQ_TIMEOUT	BIT(16)

+/* skip BOS descriptor request */
+#define USB_QUIRK_NO_BOS			BIT(17)
+
 #endif /* __LINUX_USB_QUIRKS_H */
--
2.52.0


