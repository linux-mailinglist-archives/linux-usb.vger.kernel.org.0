Return-Path: <linux-usb+bounces-18917-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A28E09FF050
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 16:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A6AB16201C
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 15:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99EC1A23A0;
	Tue, 31 Dec 2024 15:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIXn5Rye"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF0619A2A2;
	Tue, 31 Dec 2024 15:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735660063; cv=none; b=nmKr6NC8oHFseFLtxcKsvgNjbs3AXZ99gKJbDPKRKFxoUFc1Z3LdaZcIQTn+WZLug6jyue1bxBhjJ4r63JViIpyiXvMvIqkTteNmIIYl1bmG9sncoAXYopkRxpvSfJsWngV2lSKmSFHn+P+nrSVGT+t3yjvfTJHOL93kXvZq7Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735660063; c=relaxed/simple;
	bh=UhMsn0/DlrC/lvUhCcs9yzYL/IQYukYL1yWlt9x9Sb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kng7Mm9Ze+rfBZ4AYD5W4J+cLRDCs8DaQFznughC66AOTzYxwWtqRUTMDLcFmv5ebbkkKj3LBRaBnBKP/8QlIdWWfDVym03jF354xxTp7j9F0cuDMFDVBqgfQjHvzkH+7m9U/LTG1JH9tblN9MFEHBues26dBBvY7Bm9jG6XaSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIXn5Rye; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401ba1fc38so1489852e87.3;
        Tue, 31 Dec 2024 07:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735660059; x=1736264859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6tgFlyizCLz1LCfB8oi2179q+Dut3RfumOFQRmEEyI=;
        b=jIXn5RyeEj2N9/Fm7z3SYAJ2b5EvH1KM5p5IiE4dQDuCpQTorEWLhnWfNMSdhlfOR5
         gto2ka1CZEKIOw/NY+LNIbzM7cqcL5A2JQZ6X2+XTSf9SZnu3rFqULRgt5RHlY+rl9nA
         lHEgoTnrNdqJnN3x8yrKJVceWQwG8VDL1z3kLnWW/Vh8ZTGt4F4HFxPTKFV9IKNqmmz1
         KFrElRNllDJFfc4gHB86EvoU4oU3apL4mHlqgR7Ed1rZffq6Az+f0aBvTtB35G8CR+u5
         h91GggObE8+ZRvx2oSts+b8KF4NtoLC7byLYoCySMeAubXyNKwFrnp9akcSZFHvLSr5m
         lcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735660059; x=1736264859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6tgFlyizCLz1LCfB8oi2179q+Dut3RfumOFQRmEEyI=;
        b=l6ceFk39liHqSwIQidI8+/yNB8FNJMaC5T1zFca37kkd9PMK6rLAme9elvDKGOSS5v
         pWKDVqhUMixysG+es3eD0alRWbk1gQ2wpQUMRPDjI0gONs1o8iXl0viOB65U0UrEWW/b
         vpRsPSI4cIRY02NJjoxnzvkQWOvYkXsaa4FkbTWuP3/ZvJnQLu941dI5woc/jBLPDQrh
         J14rKOMw5A6wWBkyCAXNjiUcgbtCaBbUt9vuSLhOBFK7VsbZKw7wTMFkgPtHgEsZR3fV
         Otc+Ng/acHSQidTnKL0B8w7hIIqrLmvGKW91/0gC+pp1rH5FKZq5IpbXdAN5wwt2WOBE
         oj3A==
X-Forwarded-Encrypted: i=1; AJvYcCVFjYfm7xurzYLYhNnxI2fKlqzO3u+lM/hlx8II7n1/w7VyPMO+uowIxQWvUJJbPTFfVA6fTiAhyD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQLa9keAN/BKdtf7ilYDJeNS7kA+Y8xpQwj3esbOVN3YpdMqvX
	6ONr8NL14K0WbK7FZtpbVLZE6soMPR/8gH488ktaB0NFvrblG6JZ
X-Gm-Gg: ASbGncsAYWSv+X70SgpCJhbP//QZWHhqjOTwL2NJk0rEPJO8Tk0BXVDWitJwx2Nk99e
	IwQiLxCi9AFV1W0xPSgE7vzSww1XCfLI/wvYeMzQ6MDuUILhNxJjESijgZ6Bem8G7MNIqxTrCrS
	QLFo+BLLgukD6ZkkMrKD3W9Mcx4FgU6kEQyLtkCLcU2N1DWnrVbyZdlnAZBKLri5aINXPSpE4Gm
	EQFH0Qu4D4HdE7+xGxhfazr8dmTVa2Yi7hdFTBwbh+WKfHCthP1pbEaEW9Hk9/R+oj3vd1hf2jr
	vFZLuz8+BP8ltYYCKBchHqNYdFs=
X-Google-Smtp-Source: AGHT+IGno+fa77AmTssdX4H67Hd63/OuJlqqzHcRWFRM16XBjfhRDi6DDMDapfZL7Ku1OBrm3gKDyg==
X-Received: by 2002:a05:6512:124e:b0:540:2339:376e with SMTP id 2adb3069b0e04-542295512dbmr4683488e87.8.1735660059339;
        Tue, 31 Dec 2024 07:47:39 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235ffe48sm3448869e87.73.2024.12.31.07.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 07:47:38 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	oleg@makarenk.ooo,
	paul@spacefreak18.xyz,
	f.kardame@manjaro.org,
	jules.noirant@orange.fr
Subject: [PATCH 02/10] HID: pidff: Do not send effect envelope if it's empty
Date: Tue, 31 Dec 2024 16:47:23 +0100
Message-ID: <20241231154731.1719919-3-tomasz.pakula.oficjalny@gmail.com>
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

Envelope struct is always initialized, but the envelope itself is
optional as described in USB PID Device class definition 1.0.

5.1.1.1 Type Specific Block Offsets
...
4) Effects that do not use Condition Blocks use 1 Parameter Block and
an *optional* Envelope Block.

Sending out "empty" envelope breaks force feedback on some devices with
games that use SINE effect + offset to emulate constant force effect, as
well as generally breaking Constant/Periodic effects. One of the affected
brands is Moza Racing.

This change prevents the envelope from being sent if it contains all
0 values while keeping the old behavior of only sending it, if it differs
from the old one.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 39 ++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 1b5d3db62c09..e78fd68edda3 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -261,10 +261,19 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
 static int pidff_needs_set_envelope(struct ff_envelope *envelope,
 				    struct ff_envelope *old)
 {
-	return envelope->attack_level != old->attack_level ||
-	       envelope->fade_level != old->fade_level ||
+	bool needs_new_envelope;
+	needs_new_envelope = envelope->attack_level  != 0 ||
+		             envelope->fade_level    != 0 ||
+		             envelope->attack_length != 0 ||
+		             envelope->fade_length   != 0;
+
+	if (!needs_new_envelope || !old)
+		return needs_new_envelope;
+
+	return envelope->attack_level  != old->attack_level  ||
+	       envelope->fade_level    != old->fade_level    ||
 	       envelope->attack_length != old->attack_length ||
-	       envelope->fade_length != old->fade_length;
+	       envelope->fade_length   != old->fade_length;
 }
 
 /*
@@ -579,11 +588,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_constant(effect, old))
 			pidff_set_constant_force_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.constant.envelope,
-					&old->u.constant.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.constant.envelope);
+		if (pidff_needs_set_envelope(&effect->u.constant.envelope,
+					     &old->u.constant.envelope))
+			pidff_set_envelope_report(pidff, &effect->u.constant.envelope);
 		break;
 
 	case FF_PERIODIC:
@@ -618,11 +625,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_periodic(effect, old))
 			pidff_set_periodic_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.periodic.envelope,
-					&old->u.periodic.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.periodic.envelope);
+		if (pidff_needs_set_envelope(&effect->u.periodic.envelope,
+					     &old->u.periodic.envelope))
+			pidff_set_envelope_report(pidff, &effect->u.periodic.envelope);
 		break;
 
 	case FF_RAMP:
@@ -636,11 +641,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_ramp(effect, old))
 			pidff_set_ramp_force_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.ramp.envelope,
-					&old->u.ramp.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.ramp.envelope);
+		if (pidff_needs_set_envelope(&effect->u.ramp.envelope,
+					     &old->u.ramp.envelope))
+			pidff_set_envelope_report(pidff, &effect->u.ramp.envelope);
 		break;
 
 	case FF_SPRING:
-- 
2.47.1


