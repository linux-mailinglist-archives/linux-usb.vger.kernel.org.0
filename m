Return-Path: <linux-usb+bounces-31291-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E88CADF15
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 18:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57D98300EDDE
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 17:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B946F26CE32;
	Mon,  8 Dec 2025 17:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tnf5Hbs1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33B625CC6C
	for <linux-usb@vger.kernel.org>; Mon,  8 Dec 2025 17:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765216401; cv=none; b=fbXKouBaCJfQ0hbTktqJz1c5toFZc8TgdlHHP/Kr1ZhhPYSisK5R62i2o2n2qrClfBIF183FieIJeXq73yV3b0G6pk/cvKZQq76VUv6NjdiAfRdZ+Vw3gtrSTpDCm1lfevugHsZfAb792vzpYPLgiJEfdtovj9X+A7vRARCL/j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765216401; c=relaxed/simple;
	bh=6HXocaqFPwCDChHGBH4gzoZDeMN6an2hZV1HfduO/V0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M15bCXL5mnE4po7Ja3LSp0Iv/bebViLN/6clhkcI7aiwjlAHLsvs81jcTmWgW1/HARjP5hlZ5wqJkb/5ZqFMltj9t0Z+XvNpO3tjkmYzO9TBp5Yq7kGvQPh9hZrkVltMX0HtEXwXVTS6V1m7xq8R6U61U9Pe3DAf9ucuHtxk6mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tnf5Hbs1; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2981f9ce15cso64938165ad.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Dec 2025 09:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765216399; x=1765821199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tW5pItU4svWCt1M5wdhqb0PfxqTPpmGpoyx3h41byA4=;
        b=Tnf5Hbs1zjkbNuHQH7ZTpkStT7N1MLvW7YcBkw4KciJvvyIALUltDFZ5VDHYd5EQbK
         piA+Tm9+PT6vI3qg3R6fMQ6fVRLPEu6f7fnyF8WMGNpXM4AZolpxwT7g7aWhBnsv/S8u
         JyC7riJuR7smCPxJcIJKgeP9rYiecBFWMbxGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765216399; x=1765821199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tW5pItU4svWCt1M5wdhqb0PfxqTPpmGpoyx3h41byA4=;
        b=mhDl1af6rkhXDiR1ekAV4YGDjycUha/hCdnUHUmFdA1j0PwmpAPraUiSVAs0xLUUnm
         wNC3r/V/NnwIZk6vou+yvjhYXNJJAAhX+qW7i1EhhpbqDyRmbEagwm3wTWpJ2TLKKIv4
         BVRGz0uCt4W2NxaZ9NDWXcpQAf8C+q3e4SXU4AfmI7TSNzkn4eL1fS+4IfO74HzrgEfj
         UbsXMTkuL520VXLcqYhhnTbhTrhrfTG55EuOT3UBnsyIUyFs1l/stmTkzLCwRpMGVlBR
         eaps/OC9zQrnEFL1sqvHwBu5FUKAMPBVEUgFGP82qGXC4dABKVH0CGa1ILwdeX/ZXNd2
         7yYw==
X-Forwarded-Encrypted: i=1; AJvYcCW2EVuYObL/MoSMTZ3iarbo8UhqaYUrAXpz9O7zwZ58lbeQtYHv4HyAg9/iYJcb7R6ctbfxY/1ZmWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyooEAIEvFQKUIk3E9I3k5TvWs6l5+a3FSt+iQFYALkFkFTzHL5
	w8S3NMri+xe8UKyHea1LTDwwRHsk5FlLQFVuyI4geeUKsYrluZ5h5kbMLI6KKrmy1A==
X-Gm-Gg: ASbGncsx4GS6hqcdnhOdF9twBAkgFxOQhVT0MgF210l3DDz5EOQxZRkqnXk6Uy62nz+
	CnU6BsQTRjrifrLiiSEXSEJlUctaElCEZJIrVjNdTkEkkOmswOl6hhb5o4OQNcHgWyr4ucBOF0I
	xrGhYRKOiEHDRelAsfm9WTEk4LNJPGCCKgi8o7pcg4QBJ0S2CLUrAGOAGVi+VTuAndFrUp7GRPm
	F29kYMxJQmVghhkxJq532G4U7dr3DrDg0eX/UrxgIlrSq1Rx5oKHKC87uGdwJRqrP2EUiRCzxJV
	4VKr3fErS682K/W8NjqXMEDa6GRuCtiNyz9K893PiUrl7NEMP0nZdBBxHqS1T2bNxs7MkQ56O9d
	NIE8ZwEA0V+AIwiVDoElXgPB6Xbl72pmOxEL3XmXtHb3d9fI0sF985i29RLHD6jC4d3yKwHjuXR
	S5jvzYxFh4uAJfp0nbJ24Ydm7sZxNdHYx3RfdtTFNK5+iUnvCl76/YtsGmahpaEBgLku6XwvZFF
	Kwy
X-Google-Smtp-Source: AGHT+IFzrVt400U3f2GHLcMT0+O1P0Ob2hFQ7HmMj4TKsBtv4UNnVsBlVxH3dbFgYw+t2GKnP8jhUA==
X-Received: by 2002:a17:902:ce01:b0:29a:5ce:b467 with SMTP id d9443c01a7336-29df5dd4c29mr66419465ad.54.1765216399039;
        Mon, 08 Dec 2025 09:53:19 -0800 (PST)
Received: from decatoncale.c.googlers.com.com (167.178.83.34.bc.googleusercontent.com. [34.83.178.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaab9f1sm130375675ad.72.2025.12.08.09.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 09:53:17 -0800 (PST)
From: Benson Leung <bleung@chromium.org>
To: heikki.krogerus@linux.intel.com,
	sebastian.reichel@collabora.com,
	gregkh@linuxfoundation.org,
	jthies@google.com
Cc: bleung@google.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH 2/2] usb: typec: ucsi: psy: Fix voltage and current max for non-Fixed PDOs
Date: Mon,  8 Dec 2025 17:48:48 +0000
Message-ID: <20251208174918.289394-3-bleung@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
In-Reply-To: <20251208174918.289394-1-bleung@chromium.org>
References: <20251208174918.289394-1-bleung@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ucsi_psy_get_voltage_max and ucsi_psy_get_current_max are calculated
using whichever pdo is in the last position of the src_pdos array, presuming
it to be a fixed pdo, so the pdo_fixed_voltage or pdo_max_current
helpers are used on that last pdo.

However, non-Fixed PDOs such as Battery PDOs, Augmented PDOs (used for AVS and
for PPS) may exist, and are always at the end of the array if they do.
In the event one of these more advanced chargers are attached the helpers for
fixed return mangled values.

Here's an example case of a Google Pixel Flex Dual Port 67W USB-C Fast Charger
with PPS support:
POWER_SUPPLY_NAME=ucsi-source-psy-cros_ec_ucsi.4.auto2
POWER_SUPPLY_TYPE=USB
POWER_SUPPLY_CHARGE_TYPE=Standard
POWER_SUPPLY_USB_TYPE=C [PD] PD_PPS PD_DRP
POWER_SUPPLY_ONLINE=1
POWER_SUPPLY_VOLTAGE_MIN=5000000
POWER_SUPPLY_VOLTAGE_MAX=13400000
POWER_SUPPLY_VOLTAGE_NOW=20000000
POWER_SUPPLY_CURRENT_MAX=5790000
POWER_SUPPLY_CURRENT_NOW=3250000

Voltage Max is reading as 13.4V, but that's an incorrect decode of the PPS
APDO in the last position. Same goes for CURRENT_MAX. 5.79A is incorrect.

Instead, enumerate through the src_pdos and filter just for Fixed PDOs for
now, and find the one with the highest voltage and current respectively.

After, from the same charger:
POWER_SUPPLY_NAME=ucsi-source-psy-cros_ec_ucsi.4.auto2
POWER_SUPPLY_TYPE=USB
POWER_SUPPLY_CHARGE_TYPE=Standard
POWER_SUPPLY_USB_TYPE=C [PD] PD_PPS PD_DRP
POWER_SUPPLY_ONLINE=1
POWER_SUPPLY_VOLTAGE_MIN=5000000
POWER_SUPPLY_VOLTAGE_MAX=20000000
POWER_SUPPLY_VOLTAGE_NOW=20000000
POWER_SUPPLY_CURRENT_MAX=4000000
POWER_SUPPLY_CURRENT_NOW=3250000

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 drivers/usb/typec/ucsi/psy.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
index b828719e33df..c8ebab8ba7e7 100644
--- a/drivers/usb/typec/ucsi/psy.c
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -112,15 +112,20 @@ static int ucsi_psy_get_voltage_max(struct ucsi_connector *con,
 				    union power_supply_propval *val)
 {
 	u32 pdo;
+	int max_voltage = 0;
 
 	switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
 	case UCSI_CONSTAT_PWR_OPMODE_PD:
-		if (con->num_pdos > 0) {
-			pdo = con->src_pdos[con->num_pdos - 1];
-			val->intval = pdo_fixed_voltage(pdo) * 1000;
-		} else {
-			val->intval = 0;
+		for (int i = 0; i < con->num_pdos; i++) {
+			int pdo_voltage = 0;
+
+			pdo = con->src_pdos[i];
+			if (pdo_type(pdo) == PDO_TYPE_FIXED)
+				pdo_voltage = pdo_fixed_voltage(pdo) * 1000;
+			max_voltage = (pdo_voltage > max_voltage) ? pdo_voltage
+								  : max_voltage;
 		}
+		val->intval = max_voltage;
 		break;
 	case UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0:
 	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
@@ -168,6 +173,7 @@ static int ucsi_psy_get_current_max(struct ucsi_connector *con,
 				    union power_supply_propval *val)
 {
 	u32 pdo;
+	int max_current = 0;
 
 	if (!UCSI_CONSTAT(con, CONNECTED)) {
 		val->intval = 0;
@@ -176,12 +182,16 @@ static int ucsi_psy_get_current_max(struct ucsi_connector *con,
 
 	switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
 	case UCSI_CONSTAT_PWR_OPMODE_PD:
-		if (con->num_pdos > 0) {
-			pdo = con->src_pdos[con->num_pdos - 1];
-			val->intval = pdo_max_current(pdo) * 1000;
-		} else {
-			val->intval = 0;
+		for (int i = 0; i < con->num_pdos; i++) {
+			int pdo_current = 0;
+
+			pdo = con->src_pdos[i];
+			if (pdo_type(pdo) == PDO_TYPE_FIXED)
+				pdo_current = pdo_max_current(pdo) * 1000;
+			max_current = (pdo_current > max_current) ? pdo_current
+								  : max_current;
 		}
+		val->intval = max_current;
 		break;
 	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
 		val->intval = UCSI_TYPEC_1_5_CURRENT * 1000;
-- 
2.52.0.223.gf5cc29aaa4-goog


