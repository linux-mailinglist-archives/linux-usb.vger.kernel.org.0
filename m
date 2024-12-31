Return-Path: <linux-usb+bounces-18919-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F619FF054
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 16:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 926051623D2
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 15:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2A91AA792;
	Tue, 31 Dec 2024 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Djzdbi0u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0C41A4E77;
	Tue, 31 Dec 2024 15:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735660066; cv=none; b=sSYGe+HcnNYfFDo/NFhOoulXlNyxFm1kN9cERTgokEu6gxmUqp+mj5nOJabW4YUPYSIlrtEeCpjGoWnwPBaIsc3UJr5x9WgWVKSUr+Qf+zWXqg94vyT+AgqwSALU6oXslITSnIdPW+EEjIwNpIuCtqH8UtyOxHKwCz5wXWc2yPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735660066; c=relaxed/simple;
	bh=FzXR5ZIt1k1mMoS3zkft3ak/ZnXq3cAww8udD0d88z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JgTotA6bbi1THoIEFRXNAUHWlddU45d3L09/JZ7zA4+ZOWtLlA51wc60WCzpROCc4Eeg/EGE8qDFVuqD4LV0vovcmD1/O7x6m9Ye3hUpHBBAQTnN+1VODRY9apcXB0dpfnhmxUahForDd9UFFwkEGs4cEMq3G1X9z7a4pnzPsa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Djzdbi0u; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e395932c6so1671967e87.2;
        Tue, 31 Dec 2024 07:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735660062; x=1736264862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CAKpJLWJjH/X69/jtfJ+1EDkQsYNvm4RceH3NbQhb8=;
        b=Djzdbi0uxySYNk1NLKwTAr/Jre2oir/Pg4LOYcvyQ3A5y/eMEnMGsoP9nV8rKpQIBp
         d05V668cIa8Gn5IRZV0tooMsieZ59walLqCPRv2taZZvib+yD+UUprn6ou+APez5Dp+i
         jFtAF45+jOfb1DL4BZSVyoqkSYiJVrzjuV18ZJXg+gzzVewrw4GjKFRPL92WCKMyectU
         i4xI0UUaq7Ta5wfKlW2Sgv8vTpQ7lVhNTyga2wnxvCuUIOtgQEz9SLKCC3JNMswOgE1s
         2MvFc4VPPk+lm+oGNDYGbpMstc/WRfQ8wsFGwwzqAUxVlPD5GAgLHIIkhjWspOsaD4qM
         Q0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735660062; x=1736264862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CAKpJLWJjH/X69/jtfJ+1EDkQsYNvm4RceH3NbQhb8=;
        b=bcX+cyT8b3gvzKoLzzcOnufB9xPlkR62z72eUCaZelQuQqoQGB6A8ratwKhX2iEoGo
         HxxFr9iMSmlZA8wxmcKlVq7QFbahxbUG06D8yqB8kqNIguTDX8hNXIf1HZ782r+Xcxf2
         QfmKAqWCY0LkU19//jyeeD6XpoQXobY8ei7/2fOjb7Gq0VUlIP+7aIBkSDABPzlrNXXD
         a3hPIiF/I+BAf8g6QwDxMBlvhLqVysCqn7XGWTpat5cTYr+S70FzLA6wFqLyKsqL/cIr
         DkK3EmmDHax2NfLkZuEqF8hqdZzmSBMK1hemBTviYcxzC2JXJgkIVi0g628UJGnbQh7X
         n50g==
X-Forwarded-Encrypted: i=1; AJvYcCWrrdv9lcJgAhta8N2wHNtTAd1NYaVVH/s2JyoZl38tcd05Nq1rsxNA/zuXs1hbN+mmpvRRBJrWcig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk/7jra9tmTU8Ucehyh5uK3YRZmLkRlW+lorS5v0y6K/qXDMXS
	zdnpqyAl9bhXvykpn+dxHJPGIXaOF5lc82rjNN0ydjNaq/D3A6xP/q+w5VnZ
X-Gm-Gg: ASbGncsEPgPW4OM70fjMv2AZQGOBsr6fpHCqgmcDBI3gKvFUOiu7FeAtYB3t8i0/MvL
	IO09tjqTMLCSPOSsV8OMJzUvbX55r0BNJZxH91nbZN0CyS5I/oYhFmRaze5l/Y4UCcwK+/pAwwJ
	ZrNThYvCbsGyLYN/baR4vD/iCIBFeNd+EWQxe1TbdgW+ExCVEeejgeexJIPlthan5bOAN3Glf6T
	BclpujE0GxcYiQFwuZeNKoufa41dHhULeQAyxYfQjIHWjDuY5WB56Sw/ihre09CPR/VdbeF2OM1
	+hgJKotyrt5XUaSkc+uMoi4yRTc=
X-Google-Smtp-Source: AGHT+IEKKzMQP+mHt0EySxGeMfQJaWeMMRH+fzu/TYz7hDJ5FMr9zllRYPKaS1uubKTC0VV2kKkbJA==
X-Received: by 2002:a05:6512:2396:b0:542:2998:ac88 with SMTP id 2adb3069b0e04-5422998ad8cmr3747880e87.1.1735660062384;
        Tue, 31 Dec 2024 07:47:42 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235ffe48sm3448869e87.73.2024.12.31.07.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 07:47:41 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	oleg@makarenk.ooo,
	paul@spacefreak18.xyz,
	f.kardame@manjaro.org,
	jules.noirant@orange.fr
Subject: [PATCH 04/10] HID: pidff: Add MISSING_DELAY quirk and its detection
Date: Tue, 31 Dec 2024 16:47:25 +0100
Message-ID: <20241231154731.1719919-5-tomasz.pakula.oficjalny@gmail.com>
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

A lot of devices do not include this field, and it's seldom used in force
feedback implementations. I tested about three dozen applications and
none of them make use of the delay.

This fixes initialization of a lot of PID wheels like Cammus, VRS, FFBeast

This change has no effect on fully compliant devices

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 33 ++++++++++++++++++++++++++++-----
 include/linux/hid.h            |  3 +++
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 76e934649ee8..4c0aa2d9ed7a 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -184,6 +184,8 @@ struct pidff_device {
 	int operation_id[sizeof(pidff_effect_operation_status)];
 
 	int pid_id[PID_EFFECTS_MAX];
+
+	u32 quirks;
 };
 
 /*
@@ -355,7 +357,10 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->effect_direction->value[0] =
 		pidff_rescale(effect->direction, 0xffff,
 				pidff->effect_direction);
-	pidff->set_effect[PID_START_DELAY].value[0] = effect->replay.delay;
+
+	// Omit setting delay field if it's missing
+	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
+		pidff->set_effect[PID_START_DELAY].value[0] = effect->replay.delay;
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_EFFECT],
 			HID_REQ_SET_REPORT);
@@ -778,7 +783,10 @@ static void pidff_autocenter(struct pidff_device *pidff, u16 magnitude)
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] = 0;
 	pidff_set(&pidff->set_effect[PID_GAIN], magnitude);
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
-	pidff->set_effect[PID_START_DELAY].value[0] = 0;
+
+	// Omit setting delay field if it's missing
+	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
+		pidff->set_effect[PID_START_DELAY].value[0] = 0;
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_EFFECT],
 			HID_REQ_SET_REPORT);
@@ -801,6 +809,7 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			     struct hid_report *report, int count, int strict)
 {
 	int i, j, k, found;
+	int return_value = 0;
 
 	for (k = 0; k < count; k++) {
 		found = 0;
@@ -825,12 +834,17 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			if (found)
 				break;
 		}
-		if (!found && strict) {
+		if (!found && table[k] == pidff_set_effect[PID_START_DELAY]) {
+			pr_debug("Delay field not found, but that's OK\n");
+			pr_debug("Setting MISSING_DELAY quirk\n");
+			return_value |= HID_PIDFF_QUIRK_MISSING_DELAY;
+		}
+		else if (!found && strict) {
 			pr_debug("failed to locate %d\n", k);
 			return -1;
 		}
 	}
-	return 0;
+	return return_value;
 }
 
 /*
@@ -1105,11 +1119,19 @@ static int pidff_find_effects(struct pidff_device *pidff,
 static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 {
 	int envelope_ok = 0;
+	int status = 0;
 
-	if (PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1)) {
+	// Save info about the device not having the DELAY ffb field.
+	status = PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1);
+	if (status == -1) {
 		hid_err(pidff->hid, "unknown set_effect report layout\n");
 		return -ENODEV;
 	}
+	pidff->quirks |= status;
+
+	if (status & HID_PIDFF_QUIRK_MISSING_DELAY)
+		hid_dbg(pidff->hid, "Adding MISSING_DELAY quirk\n");
+
 
 	PIDFF_FIND_FIELDS(block_load, PID_BLOCK_LOAD, 0);
 	if (!pidff->block_load[PID_EFFECT_BLOCK_INDEX].value) {
@@ -1353,6 +1375,7 @@ int hid_pidff_init(struct hid_device *hid)
 	ff->playback = pidff_playback;
 
 	hid_info(dev, "Force feedback for USB HID PID devices by Anssi Hannula <anssi.hannula@gmail.com>\n");
+	hid_dbg(dev, "Active quirks mask: %x", pidff->quirks);
 
 	hid_device_io_stop(hid);
 
diff --git a/include/linux/hid.h b/include/linux/hid.h
index d11e9c9a5f15..94ad5a510639 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1227,6 +1227,9 @@ int hid_pidff_init(struct hid_device *hid);
 #define hid_pidff_init NULL
 #endif
 
+/* HID PIDFF quirks */
+#define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
+
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
 #define hid_err(hid, fmt, ...)				\
-- 
2.47.1


