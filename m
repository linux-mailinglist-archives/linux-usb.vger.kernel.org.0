Return-Path: <linux-usb+bounces-31224-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75856CAAF9D
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 01:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B84F303C9B7
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 00:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B3D42050;
	Sun,  7 Dec 2025 00:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZR6mUgUK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2D61A58D
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 00:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765065658; cv=none; b=iSks3WgaLsiSlXIIEwTU/FA9dgrHl9SIUDsT9e66rm5iWdIJwcqgmp/AOqLhOw65obVXLQLwZthKjvc6rApNJjlRcbpemKW2YVWRBWtj8hhKjscI7eGAMbdG75aHyJJe3PHz4vwHVAu+PgVOoG3f2Pk9brQUJovvSPMVhMCYnL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765065658; c=relaxed/simple;
	bh=2rJP+u166nEdBI17kppveEJM9xYnKmb4URGURhavXbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=loaHimIQ7vs5uD7VcVkmb0IOV0myNFlnrfE3qJ/bOdtj33quVwBzsjgfB/BcFFcEb/aKHibQ+vm+5vVhXzl/mQ8gbxwDyPU5A/ktdVPh2dyUdkIc12BDjOMrVOfyYLK7yEgmEN2e4JLwQgtSsKUt0RZPs6zWF+yCWKqoxhzABhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZR6mUgUK; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b79b9113651so527652566b.3
        for <linux-usb@vger.kernel.org>; Sat, 06 Dec 2025 16:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765065655; x=1765670455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OgnMkNUZxURg1mBQW7pqPiIS3695RPeLzTUCpZwj7jM=;
        b=ZR6mUgUK5H+8vuWh0iFOFXiw9TlO4YAqIw6gE7PyfyhlQTjdrvPaIrnDH/6TZafmrk
         66idS0Lpexw1EXIaupAUBUJVlAhuKMxhd2ShSOAG9Qbk4+vhUX9ncnX1fnN2JrQrvxW4
         ZW58MKRgWdWK3C9CpenscVCilNY7aEkqe6JWFwp0eAvYItbgSOHWapG9EQkbHeYRWGzC
         qD2yzn1Y1lb4DAlgOxdBvoqTAO8bF8wpnFERaa+iDoTImjTJpJbfW7VNHV6OTozYIFHP
         dVMKc6OJq/efAno8MmeVXMyf6XcyKycAn9KIt+aoUtdtSsx3NnI15FQL8pxS4ApPIVha
         9DVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765065655; x=1765670455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgnMkNUZxURg1mBQW7pqPiIS3695RPeLzTUCpZwj7jM=;
        b=ms5dgWy1Kt+KNIyLhdx7oyzKa/yUR2kqyiE2tBlPlzNR9mm5qshELwyLgnuBhvaSUA
         WzdAND4ewJMC4lXSjfmyTA5GvLJv+4mSMLyQxpbdtj06goAysVYmdRVnAbcCrKeSJXA+
         mpHavZI5kTYTtGVHVqmBE9+1HYzfnXakydiSR3KrbKK0UzCsRR87Wy6VH5ZiWeMRpRKM
         O3REgqDWgo9sEJAZDM8CvHm9MaFoQcL+rz3hq9tXe1MF7PTsHC6sHCoz9+Es/BXfSq6q
         1ps1BslOqJAzAE/o1tfs3SDYsv/JwAYwe0v5iTJdUxwu4bMuTQwvBDzoIngXvtzQP/AD
         iq3A==
X-Gm-Message-State: AOJu0YwhLGxsh3H0TEcyJuTu5ZEVceoiKe0NhGOzN2jCetzxx4Rw9wIp
	7FnQ9adnf2FcQ2wjkQvsC+8Xru2qRSTq/A71Rh71ytmI5iMb+rLavXMwwBG7SmMD
X-Gm-Gg: ASbGncthn07UxHB7SPMSwfl5H7rtsu6dX9HsmHo8SVCCri97JvzucK7IktAl6DiLyI+
	xgzA2tP1/8bsz0uaU+Kcqn0ak8ZE9Kcuw+rxkoih1MAX3zoaqE2w9DEUEfB/tTVPmUNXPIBQxGA
	KsT/YNYj0ZUFOF7lq6zRC6VqhtaTmHcEQFZ5mFYppMrdvLYe3sQih6bNOlKSEz4FwHFk0vqiJiW
	xweD04i83UrZjxbSDezw4VltqHnWeyV7sCAbXNcLArFRliZe98mmEVGXaAz78m3sktiiUHEMWPT
	9rG1sYQO/iMBUHTIchgiabLOUaSMl+X8z6IC+6QPlbG9mBgZv4v2Vks1dQ+RCv4NqWITobgaEkJ
	l1FXABn/F1TQOwKTf9651AiQclesXRnUkov7k2cb1HL6XmGP1/vlCiD+TCeSVmxmM0YN61ukAgz
	LWvzACi7M+BCBAFunJ8nh1i/OQcuIikQWMlQlJxFYtmM95r1R8heN7gNPSnv3n4eKK06euAg+Y
X-Google-Smtp-Source: AGHT+IEW4v4BZvyB09SO2AEsWsfchsbw9oNGKykKpwN/paz2J9BL8p/93s7a117OavUSmeezGow/MA==
X-Received: by 2002:a17:907:3d8e:b0:b73:6534:5984 with SMTP id a640c23a62f3a-b7a2432452emr327793966b.16.1765065654374;
        Sat, 06 Dec 2025 16:00:54 -0800 (PST)
Received: from workstation (ip-176-198-166-064.um43.pools.vodafone-ip.de. [176.198.166.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49765f3sm712557866b.37.2025.12.06.16.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 16:00:53 -0800 (PST)
From: =?UTF-8?q?Johannes=20Br=C3=BCderl?= <johannes.bruederl@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	=?UTF-8?q?Johannes=20Br=C3=BCderl?= <johannes.bruederl@gmail.com>
Subject: [PATCH] usb: core: add USB_QUIRK_NO_BOS for devices that hang on BOS descriptor
Date: Sun,  7 Dec 2025 01:00:07 +0100
Message-ID: <20251207000007.11631-1-johannes.bruederl@gmail.com>
X-Mailer: git-send-email 2.52.0
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

 drivers/usb/core/config.c  | 5 +++++
 drivers/usb/core/quirks.c  | 3 +++
 include/linux/usb/quirks.h | 3 +++
 3 files changed, 11 insertions(+)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index baf5bc844b6f..8fa3a486d038 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -1040,6 +1040,11 @@ int usb_get_bos_descriptor(struct usb_device *dev)
 	__u8 cap_type;
 	int ret;

+	if (dev->quirks & USB_QUIRK_NO_BOS) {
+		dev_dbg(ddev, "skipping BOS descriptor\n");
+		return 0;
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


