Return-Path: <linux-usb+bounces-18920-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 338039FF057
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 16:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F33F77A1A4F
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 15:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B8D1ACEB3;
	Tue, 31 Dec 2024 15:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8Nic3qs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2D41A8F97;
	Tue, 31 Dec 2024 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735660067; cv=none; b=bEy5CyyFIQGoV0V9eMPAq8yfHbkb+3XhiIcG5azH6HPyCBUWNqpyXspkObNRTTADZeynv+n8j3hYcJYUD3mt2HbnR2YItd9gTCTDDHBOQSWS4B/c2kqKyjh2JQIyklEP8EJKft0BnwxzinjQVw24SIQ0jv328i59E01wPJONHtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735660067; c=relaxed/simple;
	bh=U83jqWbQ5jwI987svOWPZ5chqByAy3YmkdcUu46o5OY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VKjfpt805nzRwhkpfmvaT3WUOayP01ixo4Hr0Yx/fK1EKXOwWf8xony2uncy2PnOrrSzXwBk1WK5tHd036iQL3DWYGTTZTvu4kJmGV9FRGvfeIOe89yVbU5Nm7zPIhnjYZop6yZ38o4NnjgEFv3qQMuE6xvCHRMC9ZCDv10vmyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8Nic3qs; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53de3ba3d39so1834695e87.1;
        Tue, 31 Dec 2024 07:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735660064; x=1736264864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFFEubbksreAv93JMFTWcYywcrhWrDzoAG3F0NgiAnA=;
        b=m8Nic3qs5mSrsIKO8Dxs2tYcA4JXzI+qrJMfwY55C1A/P6QXfdO4oXIhZNWEUfdLPg
         BX09FQ1+9oAECqj+YWOxXjYRKWV7SK5JLzKPsY/nEKTHnXCdw/aW7BGnYRMMND91PNfK
         lXSo8OXnwPzuFdIrR2md4Mhf42JLqVwmGT7JunuPE01QSRxznTP8EGzZqfqe37fyk1cZ
         T/BsXJI7AUNFeXPCW3hQUzjODDdCp6qQ8xzZa9DtErJc/rJaCFNNdv7pHWjCBkepAQQ/
         IMqKdF7v2OYAOW/N7YMV8nHNMYxwf8hXzU6NF4bcECnHGvSnseYyz42uFDmHE2/6S2HO
         ffGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735660064; x=1736264864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFFEubbksreAv93JMFTWcYywcrhWrDzoAG3F0NgiAnA=;
        b=OCDqbVjwZPjCFc1FENZnDSUpb1yvmLKGUSFOo0uDU+S3AreHURbL7jI3ze5vDUxIuo
         FvkmgTyqw4nIZNreQu8ebwiBKFD4yABPx/JipLl4lGzeX9bcs0iy+Jq6CTWHp1c8/yFL
         QuAt+wWVwjhLxJkBdJd0c+reCb/GbNcxq32kwc29GbWM910X+JM/rukCiQj/gRNWPZVt
         TJn3DtY0D2M8saW3WahB6H7Pm5ZZk07jMyep6vhNnhmno8bYXxdmXKp/zB91I6JTOCDX
         RxCVHZuUnvsuqVIPsTAVkmEzaFt31M3ra5MyV6wi2kP6nF1GmFhoGGnd5sqw1aEam1J1
         3grA==
X-Forwarded-Encrypted: i=1; AJvYcCUQpiELlttnJkJ+Z1Trx8zbCSdNinBpz/Z5J82NkS3svpGdt3HUViH2pd06uqCz/ikw/8CCLYluy70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1dkvyKGlZ+YpiE26H9UomDs2GmnxT1cmVVdbzrM8Drn0h6gAG
	SteV8lRJoTbg9WPrQsa8l6vgz7C0DbzxCU9UvDnclTUi78FB2EHk
X-Gm-Gg: ASbGnctBNI6ZbqX8HuIufgzz1w7yAzIFdpUzzbP6wUhdW0krO8ZovgPOSxrah5FaMb3
	vgg8CRc6s3xxM9zprXjm5kQCSZkCBw2dwIZ/UHsDO5iKPQS8ozU9pciLHJAey1/FZcQqVIhhm6B
	uA25/29AisfkMlSXVSoV1t7vHPM3l/g0j3R8g8Gyxzrvqzi2Sc6zQwpnKow3bLK5RlEP8pN11jY
	Nh65kOPXwUksvE21Ojwy/htHQsYy61+HXkhHrpmow8cpeDmBmEa3VLOrJvIIQQoExzlLgpF0UTK
	U6c8MLNWKQ+u1/EPGxrCPE3qNi8=
X-Google-Smtp-Source: AGHT+IE7QyzDBcLbPoYsAaUzLct5E6w3hx0FXHBcwyuir/09pu68pomqZO542Ix6BIMYzfQ4dYPc4w==
X-Received: by 2002:a05:6512:2826:b0:540:2300:25d2 with SMTP id 2adb3069b0e04-542295821c5mr4599169e87.14.1735660063521;
        Tue, 31 Dec 2024 07:47:43 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235ffe48sm3448869e87.73.2024.12.31.07.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 07:47:42 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	oleg@makarenk.ooo,
	paul@spacefreak18.xyz,
	f.kardame@manjaro.org,
	jules.noirant@orange.fr
Subject: [PATCH 05/10] HID: pidff: Add MISSING_PBO quirk and its detection
Date: Tue, 31 Dec 2024 16:47:26 +0100
Message-ID: <20241231154731.1719919-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some devices with only one axis are missing PARAMETER_BLOCK_OFFSET field
for conditional effects. They can only have one axis, so we're limiting
the max_axis when setting the report for those effects.

Automatic detection ensures compatibility even if such device won't be
explicitly defined in the kernel.

Fixes initialization of VRS DirectForce PRO and possibly other devices.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 46 +++++++++++++++++++++-------------
 include/linux/hid.h            |  1 +
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 4c0aa2d9ed7a..0bc093ae1bb3 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -421,12 +421,19 @@ static int pidff_needs_set_periodic(struct ff_effect *effect,
 static void pidff_set_condition_report(struct pidff_device *pidff,
 				       struct ff_effect *effect)
 {
-	int i;
+	unsigned char i;
+
+	// Devices missing Parameter Block Offset can only have one axis
+	unsigned char max_axis = pidff->quirks & HID_PIDFF_QUIRK_MISSING_PBO ? 1 : 2;
 
 	pidff->set_condition[PID_EFFECT_BLOCK_INDEX].value[0] =
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < max_axis; i++) {
+		// Omit Parameter Block Offset if missing
+		if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_PBO))
+			pidff->set_condition[PID_PARAM_BLOCK_OFFSET].value[0] = i;
+
 		pidff->set_condition[PID_PARAM_BLOCK_OFFSET].value[0] = i;
 		pidff_set_signed(&pidff->set_condition[PID_CP_OFFSET],
 				 effect->u.condition[i].center);
@@ -839,6 +846,11 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			pr_debug("Setting MISSING_DELAY quirk\n");
 			return_value |= HID_PIDFF_QUIRK_MISSING_DELAY;
 		}
+		else if (!found && table[k] == pidff_set_condition[PID_PARAM_BLOCK_OFFSET]) {
+			pr_debug("PBO field not found, but that's OK\n");
+			pr_debug("Setting MISSING_PBO quirk\n");
+			return_value |= HID_PIDFF_QUIRK_MISSING_PBO;
+		}
 		else if (!found && strict) {
 			pr_debug("failed to locate %d\n", k);
 			return -1;
@@ -1118,7 +1130,6 @@ static int pidff_find_effects(struct pidff_device *pidff,
  */
 static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 {
-	int envelope_ok = 0;
 	int status = 0;
 
 	// Save info about the device not having the DELAY ffb field.
@@ -1149,13 +1160,10 @@ static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 		return -ENODEV;
 	}
 
-	if (!PIDFF_FIND_FIELDS(set_envelope, PID_SET_ENVELOPE, 1))
-		envelope_ok = 1;
-
 	if (pidff_find_special_fields(pidff) || pidff_find_effects(pidff, dev))
 		return -ENODEV;
 
-	if (!envelope_ok) {
+	if (PIDFF_FIND_FIELDS(set_envelope, PID_SET_ENVELOPE, 1)) {
 		if (test_and_clear_bit(FF_CONSTANT, dev->ffbit))
 			hid_warn(pidff->hid,
 				 "has constant effect but no envelope\n");
@@ -1180,16 +1188,20 @@ static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 		clear_bit(FF_RAMP, dev->ffbit);
 	}
 
-	if ((test_bit(FF_SPRING, dev->ffbit) ||
-	     test_bit(FF_DAMPER, dev->ffbit) ||
-	     test_bit(FF_FRICTION, dev->ffbit) ||
-	     test_bit(FF_INERTIA, dev->ffbit)) &&
-	    PIDFF_FIND_FIELDS(set_condition, PID_SET_CONDITION, 1)) {
-		hid_warn(pidff->hid, "unknown condition effect layout\n");
-		clear_bit(FF_SPRING, dev->ffbit);
-		clear_bit(FF_DAMPER, dev->ffbit);
-		clear_bit(FF_FRICTION, dev->ffbit);
-		clear_bit(FF_INERTIA, dev->ffbit);
+	if (test_bit(FF_SPRING, dev->ffbit) ||
+	    test_bit(FF_DAMPER, dev->ffbit) ||
+	    test_bit(FF_FRICTION, dev->ffbit) ||
+	    test_bit(FF_INERTIA, dev->ffbit)) {
+		status = PIDFF_FIND_FIELDS(set_condition, PID_SET_CONDITION, 1);
+
+		if (status < 0) {
+			hid_warn(pidff->hid, "unknown condition effect layout\n");
+			clear_bit(FF_SPRING, dev->ffbit);
+			clear_bit(FF_DAMPER, dev->ffbit);
+			clear_bit(FF_FRICTION, dev->ffbit);
+			clear_bit(FF_INERTIA, dev->ffbit);
+		}
+		pidff->quirks |= status;
 	}
 
 	if (test_bit(FF_PERIODIC, dev->ffbit) &&
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 94ad5a510639..29f0a91f505f 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1229,6 +1229,7 @@ int hid_pidff_init(struct hid_device *hid);
 
 /* HID PIDFF quirks */
 #define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
+#define HID_PIDFF_QUIRK_MISSING_PBO	BIT(1)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.47.1


