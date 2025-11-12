Return-Path: <linux-usb+bounces-30436-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7313C50404
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 02:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB01C189B527
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 01:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A17289E13;
	Wed, 12 Nov 2025 01:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rct3LXnn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47D728A1D5
	for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 01:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762912463; cv=none; b=Fj/oYRsp6dHhTLB8+2phKzLbHVymOPbf3aNPzjLySMjGmknSNheLdZ0TkzIAmHvW6tKOYCJjbMcBIcwVJtfOiNoESRKBfwZp7r49OsUgSg5G3Zu1SU4khsFv/7o1ksr0oAgze5xOqAr5wYzBAxOLZ5ybC+QTonEIOKZTKNcRIGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762912463; c=relaxed/simple;
	bh=V+NLqMYPtbXGUxK8gaZ/4ZH91OoRNhD7Ixnn+V2Fgf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q4SN5NZqFbyk+re6xGOZ+ApzRzCAC5NOmIRZiHOiGTNksrhWCv/NQkdr1ZAxPEnGUIcdmM6aMpoRL/oZG+ga2jhVftD9MUSiE/FOHZnNJmang+nga3gr+cXHkLjSuZo41WSP4Nxn1FoNuuSLxa4jXMtmcDnMOw+ReVX3dC26D8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rct3LXnn; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29845b06dd2so2816555ad.2
        for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 17:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762912461; x=1763517261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAa0jaAUx7OJIZvkSAwlza4QkLZm6Uf91ra/ugzjRqY=;
        b=Rct3LXnnY0+be+blUrxiVerK8hJQWRuRzsIY98LmSKSHBPzOSQQDl9cdym54PGoe4H
         HwvzdUf5O0n0JQjxgZUPb6xIs3A0MSki0ceiZ3eIRa5yzslMSY3wDbDaVgyUBsdKKveQ
         wcMoAsISvn2ABmTAg32DE4UINqv5qnY4XvEZ2i5DFBzAjWAatlm5Jxi5OHY6w/EwI6G8
         PT25g+9+l0ameZp2qChUgD76bIzwKB06dZP+ACLta+GEFsjjtMBEGBpbCuIkPdQKMgdA
         VPOe/bUZJtMVfc5G1ZUn4e/HszyeNW8PFhJsthMeHgvQLbLEQJdutu+gKCVozL+A0YX8
         IMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762912461; x=1763517261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rAa0jaAUx7OJIZvkSAwlza4QkLZm6Uf91ra/ugzjRqY=;
        b=oqaCB/JLaOV09MDAqtmrVAuApeRE8aiq53HSVKzreys7cRBYSNI5VTcYpPivCrYJB1
         45vfIW9L9M9RA5uoqtmAUi2vErfUJoEPAZvcB55yPsgbdnYSMLZQFKUQagVINcfXdmBi
         CjMJ+u95tGdFoVCqq80aKJcmyaI8WzzVt8G8/KXRfTHwiHwbInFdjuQ8jPLOJggb3UPb
         XGUseCWTT/ybFHzcViHFalkda2+6fF4+mhs+d7zixlkxC2KRUBI2dpO75lh88LK0PMyn
         pSTjELPpGZ6etngMJMt5pUSqj8vGxCA8+X/wVO5NuLLFd7tZjmZd0vUCW9ANOjhEQ0eW
         ZzPA==
X-Forwarded-Encrypted: i=1; AJvYcCXbRlo4b4FYjHMm9mOqUtQB9IzsTf2f1H6woZ6chj4JQ4xRPKoGi6mFNo9IQnlqQC0AcGqvQ7Fgjvg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr+U8obtZMbIN70qL2TmNla3FKvYgbcDxg55nf4CNkRsBUW0Yb
	UCXb+t9UCp9SH+GAp0Krw+LHLvqZPYGWUM+EL1en/5hSdFhGZBudBGj0
X-Gm-Gg: ASbGnctnVKqsdbey/QT7dcPqsCSkffgcPyImACIduiMHSmy4QeyGPUmwRAjoLaeZvZ8
	JQ61Bqh/XWlbmI4H+kthKi8WPAswCluEqMA9yL9JG7NFLse06KxnK2uBBOFj9T0Hll9xFNeuYc7
	RP++3D1nVRInBwfL3/fhdqTuhObouPEINIpAuT9/GqsY9yIUK1pwsgWTuzkzq8pbCwTJVA/iRYP
	xquDM0SBWsd2fQwpTQ+LJTrigFg4nJac7alBL+F5K8cw4+AK1DNYWlOAzV0qQffz81KLqYElOKP
	p3cSN/EOTt/mmKsUaJ4lfKc5IR8v5/aTfiRC1fZS7QEcl5Y0LkB+SYXVrOyS7qvlEwJVhfFmgCT
	hmfcyu/lSkWoDL0ZQ/QPTWCcnjVr4ROgxg9PwkhHnCgWBv6ZdfukFU9RKSOQKo+KhrFgBlrlb1I
	yTjN9NDW6BAIZjS7MODtil8XUUzFH4QeW3T6SlJWgqRGc=
X-Google-Smtp-Source: AGHT+IFZt9kcYAzpd3HLic3Y5F+9yHyu+euFnDG9WwszKanIAdJLYfUAuWLotX0l9/nM4ymC5UH6MQ==
X-Received: by 2002:a17:902:e546:b0:295:1277:7920 with SMTP id d9443c01a7336-2984edac559mr16453895ad.28.1762912460905;
        Tue, 11 Nov 2025 17:54:20 -0800 (PST)
Received: from lugathe ([2804:13c:46ac:1000:f491:d00a:e2fb:e67c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dc9f8f1sm10886435ad.54.2025.11.11.17.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 17:54:20 -0800 (PST)
From: =?UTF-8?q?Rodrigo=20Lugathe=20da=20Concei=C3=A7=C3=A3o=20Alves?= <lugathe2@gmail.com>
To: michal.pecio@gmail.com
Cc: bentiss@kernel.org,
	dmitry.torokhov@gmail.com,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linuxhid@cosmicgizmosystems.com,
	linuxsound@cosmicgizmosystems.com,
	lugathe2@gmail.com,
	stern@rowland.harvard.edu
Subject: [PATCH v2] Apply the quirk HID_QUIRK_ALWAYS_POLL to the Edifier QR30 (2d99:a101).
Date: Tue, 11 Nov 2025 22:53:56 -0300
Message-ID: <20251112015356.1919586-1-lugathe2@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111203350.3c9a669e.michal.pecio@gmail.com>
References: <20251111203350.3c9a669e.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The USB speaker has a bug that causes it to reboot when changing the
brightness using the physical knob.

Add a new vendor and product ID entry in hid-ids.h, and register
the corresponding device in hid-quirks.c with the required quirk.

---
v2:
 - Fixed title
 - Simplified commit message

Signed-off-by: Rodrigo Lugathe da Conceição Alves <lugathe2@gmail.com>
---
 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0723b4b1c9ec..ece1bea0faa5 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -734,6 +734,9 @@
 #define USB_VENDOR_ID_JESS2		0x0f30
 #define USB_DEVICE_ID_JESS2_COLOR_RUMBLE_PAD 0x0111
 
+#define USB_VENDOR_ID_JIELI_TECHNOLOGY		0x2d99
+#define USB_DEVICE_ID_EDIFIER_QR30	0xa101	/* EDIFIER Hal0 2.0 SE */
+
 #define USB_VENDOR_ID_KBGEAR		0x084e
 #define USB_DEVICE_ID_KBGEAR_JAMSTUDIO	0x1001
 
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index bcd4bccf1a7c..d104f4829d93 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -110,6 +110,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_1f4a), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_IDEACOM, USB_DEVICE_ID_IDEACOM_IDC6680), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_INNOMEDIA, USB_DEVICE_ID_INNEX_GENESIS_ATARI), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_JIELI_TECHNOLOGY, USB_DEVICE_ID_EDIFIER_QR30), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTICAL_MOUSE_ID2), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M506), HID_QUIRK_MULTI_INPUT },
-- 
2.51.2


