Return-Path: <linux-usb+bounces-18923-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B26C9FF05C
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 16:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B2F51882D40
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 15:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3483B1B3F30;
	Tue, 31 Dec 2024 15:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqU/uYsA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D610A1B0416;
	Tue, 31 Dec 2024 15:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735660071; cv=none; b=WbVT02DiEvr60WTOzgaIWP3yuhTVcEtq0yF1MwVnwylQzDQpEhoskv/NX601heeMFQRHikMrsbdZMPwcIKrQzQ0Jpu441/T/xPxqW1wakY3rnxoZsInevAdiyDAv5iHqs5f625dW63kP7zawcYU4ZvHDgD1sILENgERgirPj+m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735660071; c=relaxed/simple;
	bh=Oiuae5Cl2Hn9VDq8VlS/5r7/wNGQynu7R2EuPKE2sRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l2c7hjjJ+eGQyXGW+vptOsdkI5pJuixhZNSIqdkZQD1belTFFCdNLnEub/404jywHQGiwzCUJY2CEZsoihsvvCEFjg3qSwaAOtT2DguuBMRcWlo6uUNU1XC4O8eeYGqGh6S1fcoa2r19CBX6aYRfIs6jQJbtAuweEmoAkEBJZTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqU/uYsA; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e38838026so1363019e87.3;
        Tue, 31 Dec 2024 07:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735660068; x=1736264868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWk0zXmEn9co5az5Ci6nD0aZcMpWq63xhFJHEjDNB+g=;
        b=RqU/uYsA/CGqbKxiHGAckfnGtCo5T8WEXRT3XpFLMfO+kYng+il5McnUV/gu98WBmX
         JPe3dwixBoz+ykLepzH/JOqE6mLvTysTmOGTErQ7zRVa9jXDptVs/UW+8rVuWbYn7rrU
         lPtSG9oW93fY5YJe0YMUDczWmgAO+HBhH4enCx7yly6iOzZoQGaRpR895O4RoIzQvRsp
         g0WyBjZ+GmJ4vXiF0P0auV0UyUCn9xaEaD/LJvIyviSQ9ntaR227zvl/7VvOsgFRr40b
         6KQSfYAEEObcQLqnhr3xyel9UcGZUU2lh2hP5ABX6nh1F5xclLCUyymhJjvH7seG05hb
         2q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735660068; x=1736264868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWk0zXmEn9co5az5Ci6nD0aZcMpWq63xhFJHEjDNB+g=;
        b=tPIgMMcFRq2MRZQbCnY/SPyrDs0Us+k2CA4cIM+FfumijY9rf0tJe6wMPMXssKnAny
         A8UYyb0cqkV+vHcuR1NQxrO3kZyWc5XNWpCnWjT3Jg1v23v4eAEYuHht1quHQipubWoM
         LfhXhDjDcKYWBNqj9StUWA2q2mjoz9HPXNITegx7umE0lfK8ADcnnTcgqhAJtn7RmbFG
         qgSInfnMc5HH0aPhskm3+Ryp2+fCnDtGKwV38gVj11VQuGULED9jJsaGZHWWxj9ZYiaR
         vxrxVU8onfOlM+x2qC//e1Zuv0us6eq/qTzSlkfQ/EsHZCz7vgwDiefDxBHTmPRTpr8W
         9Hpg==
X-Forwarded-Encrypted: i=1; AJvYcCWp8rnlMCvxJpt7JdQHxv7ttD09beRekG8qDb33VbMHnZ/CPr2IdJkn7aYK5aXWrPi3o9uoXw1dBrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEt4ae1fVqprD0IlRoUzRfSMybcnAceaXPv/thHStDSoxezDzo
	6t7HQX3gvLLURL6+hOidXHJgg9po0krIIvc/o+KAly4CSFkPhUcs
X-Gm-Gg: ASbGncsOptdzKrV3wYXLsLmmv1VNeY9+JT3L3mDHLkCyRyoQuBKfSD+DEzJiertmJ4i
	0Kn8NofZwr77by7NiGBdk4E6lp+DWxwugIKlQqnJtCkodmRZ5+qYOJ8IWx/T3I0JoYwrnJu/U7P
	fINGcEbGTO0XQHC31N8jkaOVvRGeufI5TODyFePpZb4mPD260R/xFAfVdZYeRZjDSJzmDyFGARD
	ZIJdfjicZhdDqC/hK4xKIz9JlGUiZggEX3QkOEe0zBYVe58+Gv0WOZ/jjRi5D9t8GW1wdZXobu+
	vC1ICq6fi8pyrD3Fo4yqfC3QVbw=
X-Google-Smtp-Source: AGHT+IF/6yKv86lJJDGNYxw33DSdZelTr2xEdVyEqf/THGDhV6uCfI7umRFmcCE7J1vlMJ2/dZzvlw==
X-Received: by 2002:a05:6512:15a6:b0:53e:314e:6110 with SMTP id 2adb3069b0e04-54229568104mr4196874e87.11.1735660067851;
        Tue, 31 Dec 2024 07:47:47 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235ffe48sm3448869e87.73.2024.12.31.07.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 07:47:47 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	oleg@makarenk.ooo,
	paul@spacefreak18.xyz,
	f.kardame@manjaro.org,
	jules.noirant@orange.fr
Subject: [PATCH 08/10] HID: pidff: Add FIX_WHEEL_DIRECTION quirk
Date: Tue, 31 Dec 2024 16:47:29 +0100
Message-ID: <20241231154731.1719919-9-tomasz.pakula.oficjalny@gmail.com>
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

Most steering wheels simply ignore DIRECTION field, but some try to be
compliant with the PID standard and use it in force calculations. Games
often ignore setting this field properly and/or there can be issues with
dinput8 -> SDL -> Linux API translation, and this value can be incorrect.
This can lead to partial/complete loss of Force Feedback or even
unexpected force reversal.

Sadly, this quirk can't be detected automatically without sending out
effects that would move an axis.

This fixes FFB on Moza Racing devices and others where effect direction
is not simply ignored.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 12 +++++++++---
 include/linux/hid.h            |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index c919e2db8dc0..cc02c5d1bd04 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -136,6 +136,9 @@ static const u8 pidff_block_load_status[] = { 0x8c, 0x8d };
 #define PID_EFFECT_STOP		1
 static const u8 pidff_effect_operation_status[] = { 0x79, 0x7b };
 
+/* Polar direction 90 degrees (North) */
+#define PIDFF_FIXED_WHEEL_DIRECTION	0x4000
+
 struct pidff_usage {
 	struct hid_field *field;
 	s32 *value;
@@ -354,9 +357,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->set_effect[PID_GAIN].value[0] =
 		pidff->set_effect[PID_GAIN].field->logical_maximum;
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
-	pidff->effect_direction->value[0] =
-		pidff_rescale(effect->direction, 0xffff,
-				pidff->effect_direction);
+
+	// Use fixed direction if needed
+	pidff->effect_direction->value[0] = pidff_rescale(
+		pidff->quirks & HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION ?
+		PIDFF_FIXED_WHEEL_DIRECTION : effect->direction,
+		0xffff, pidff->effect_direction);
 
 	// Omit setting delay field if it's missing
 	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 93233c5b75a6..5237f9040950 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1233,6 +1233,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
 #define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
 #define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
 #define HID_PIDFF_QUIRK_MISSING_DEVICE_CONTROL	BIT(2)
+#define HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION	BIT(3)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.47.1


