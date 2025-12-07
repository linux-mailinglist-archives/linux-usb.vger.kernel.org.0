Return-Path: <linux-usb+bounces-31234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 158D0CAB2EC
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 10:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFBB530056CB
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 09:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED982D73A6;
	Sun,  7 Dec 2025 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dj/9W5/B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B202701B6
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 09:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765098267; cv=none; b=rsJnqRv08vVOgMWOj1WNGpltCjAtRxLJOU2knL8QwxBbAGhX3Bq4jQPnbrbAOHVQWUmUxRYlnlAFV8ncCT6cfg1dcm2JK+2QsKvMPBz3RQqM621Shl48aWvSLRkslPEDFel+BSwEanIFLo+Xuz5g2DQ8LaSww4Lr9hkyL9LbMuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765098267; c=relaxed/simple;
	bh=ZhjXU5ryGjMzVHDyTnMOHavrgCpNZrhuPmDwM+XImyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CNWbinWwDsdWwAnb0h7Ahh8inR4IgjDI/yFL2HyC618YJfu6jKquXQ8WHckuPiFS7ujjpUr5snRkELinHjCDi7Kat361WoPvPwGLdxI/z6BBO/4WcqjCUjZrTvhRkJI4zBRLfMxS8IB2SULs3UzmaGbuLxX+PisP9kW7CP/9IzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dj/9W5/B; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so31353805e9.1
        for <linux-usb@vger.kernel.org>; Sun, 07 Dec 2025 01:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765098264; x=1765703064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9s85LTeAJem+8/i2VjmBRnt8KjRvs9SPXgDJ7YGLXw=;
        b=Dj/9W5/BGtiVC0Uw1a6jYa8RlVjxqH5GFsKfnjmvswnTSotgZRAXTAKbchI2rF+vvF
         BEV9YzBV+NUDGcXvB+x46eY2RRY8JPmz/oHveTKDLRAQkAX7h75izHDlXREH9Adzgmqq
         oAEWI5DWkFeQBQBPmmiV1DseXl/H4b6LQdZoNjTElCvhcp23lV/MS5nescMlWPs3RpFz
         pXHiJFAJiNyr1PbNncq3lQMJBVIwhj61VwYAk6m5thLgWZTw4ySlx3AK/LGQ5KB0JqYx
         1cS+OJ28d1hY06drr8ysAB6ELCkfW912te/rJjGA96OMVDuG667gqSqWNUs5mF+F67QU
         bD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765098264; x=1765703064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+9s85LTeAJem+8/i2VjmBRnt8KjRvs9SPXgDJ7YGLXw=;
        b=vYVtKVbdng5ixMRPbSr5yLgSqaTyNnuFjP+6CgQYeiL6Pg3Jjw7Hzwldn//7j1FWXk
         MoJ60bFtpV4mP8Sg1Ena1FOSRKia7xDpPFmcwrXmxZc/HyJ2wbosdlEIReO7teHcmDxr
         GSndaP0Eeqj3QDyj4PyJId3IzjcrIjWLK/9FQxCHjsKbuPGykhnZby8dMqCklKSmQAna
         PWEVWQfboAxcKX48XZgXoog7quKkSgW6sY+JHqt5UymTY9I+4jLIiBnqdWu+ThhpEzdg
         wOqysPzfyUNh/tK6Iq1srgAU32JvuTSfKIJvR+P94ASbwsbMPWaWxKkndkJF/p0R3nro
         LFHQ==
X-Gm-Message-State: AOJu0YxigVIJ51YmyPQyusk/AZdmhsPHaZvsCneTKzwVHs7fP48kShTv
	UeApafdC4Bv1O9NOAvJBbecG7WdAzY4Wh0XRFpEtRR/8D2pSlS/dQ4ddbr8UUIhcIXo=
X-Gm-Gg: ASbGncsYrs9TvbilFU+XhRs0k6vS+fRRgJi8x/r+Dbap4pR0rmB5IVGvC8mFYDBMcNf
	FYE2hjglQPiAbff/CT70YkCSPEcTJKcEi4QvETCrq7OQMfHtpt16Rb1R5P5xs0nCi4c2sCwLlv/
	DKx2dnZOtEkJgBjM5jB88E9Tp97Aqje9c9KgDCUktGsdMh3pE82pSKFbEFXOgMSgXkVgxyQqRx0
	oo35fbH2kLH0Cuf9Lpbg/754+fbqAqnG1GwDjjc9jOJiJiDJHd2zcCRRQMF+LFT8D0EkFGHxdxM
	J4Qj1GFDoDC934gf8uDxjwP3knTYGUZJTQaLtP1/n/AX7CCXU9yfmdG1RDTtT1Dz98Zgo56Ds5W
	V2o+UqvdpD5uFDnOQy/k39GkKMn19gnKa+Juf/izXTKRZU5Wx5dJBBgBa+2VrOfC2ihGlUtWKl6
	9fdwGj2OVzKe2ROyUNARAKTkiM+xwPANQBeDEX63YV1Nd6oLXuSPJC8gGRbooHzoPTuQ4Wx6pv
X-Google-Smtp-Source: AGHT+IHFycVlm3j3IA133xM0FQQfOMMWANn3xMmOUfnOizYWzE863mvkTbkvqNq7eRJ2cxPJvpS8sQ==
X-Received: by 2002:a05:600c:1c89:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47939deca19mr50951355e9.6.1765098264093;
        Sun, 07 Dec 2025 01:04:24 -0800 (PST)
Received: from workstation (ip-176-198-166-064.um43.pools.vodafone-ip.de. [176.198.166.64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b04d4e6sm97216745e9.6.2025.12.07.01.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 01:04:22 -0800 (PST)
From: =?UTF-8?q?Johannes=20Br=C3=BCderl?= <johannes.bruederl@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	larsm17@gmail.com,
	=?UTF-8?q?Johannes=20Br=C3=BCderl?= <johannes.bruederl@gmail.com>
Subject: [PATCH v3 1/1] usb: core: add USB_QUIRK_NO_BOS for devices that hang on BOS descriptor
Date: Sun,  7 Dec 2025 10:02:20 +0100
Message-ID: <20251207090220.14807-1-johannes.bruederl@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <a9088e84-3800-4a87-a639-9a2a48036873@gmail.com>
References: <a9088e84-3800-4a87-a639-9a2a48036873@gmail.com>
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
Hi Lars,
you are right, good catch! This should be correctly sorted now.

v3: Move quirk entry to correct position in sorted VID:PID order.
v2: Return -ENOMSG instead of 0 to properly indicate no BOS data.

BR,
Johannes

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
index 47f589c4104a..c4d85089d19b 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -450,6 +450,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	{ USB_DEVICE(0x0c45, 0x7056), .driver_info =
 			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
 
+	/* Elgato 4K X - BOS descriptor fetch hangs at SuperSpeed Plus */
+	{ USB_DEVICE(0x0fd9, 0x009b), .driver_info = USB_QUIRK_NO_BOS },
+
 	/* Sony Xperia XZ1 Compact (lilac) smartphone in fastboot mode */
 	{ USB_DEVICE(0x0fce, 0x0dde), .driver_info = USB_QUIRK_NO_LPM },
 
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


