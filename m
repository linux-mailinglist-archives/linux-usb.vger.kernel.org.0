Return-Path: <linux-usb+bounces-29367-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 01733BE197E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 07:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7C101351276
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 05:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A12248868;
	Thu, 16 Oct 2025 05:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZuhjznh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06501246770
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 05:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760594023; cv=none; b=XoTh8jY8ixWA9jnAyGjJrtcf0+bwtn/so3zCFuUkVlFGDSQILhk9JQJISFoqe6qFaF72vYdUCEVcLbU/a5EdAt5qh65C5rdo7eTvJgWhvaWFj1gALYTl4UZN8l5CBIcQUL1xcbpTaX2rEJqLw4nUnk33DW2e7RVIVIXhK9F8IRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760594023; c=relaxed/simple;
	bh=/ApD6um9GXk5g0j0a5CvZOlDL061SkgKNQn9jYyZvgM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rUUKtV114V7YUOPETEOsuPlH2zVyG1N85e8rcWhus7RKDPK7S40z0uldL35PO3/msA0utZ3gbwzEGfNW2gEyBMrIRPfwCG6baAf3v21U66epiUPsIGS2eTpZZPdAqbwcfEIaUQUBXFDQrFmI5wiDG3tN6eBTzYVrlQ/9AQT5bU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZuhjznh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so4229935ad.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 22:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760594020; x=1761198820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WAaGpTYCHTTBo2EbH+Tg3yUyz11i7OBlKY7RUtvkfvU=;
        b=BZuhjznhmfIu+X1KckHgTuHJXwIxxSnID27ya2x3XF7EdNGtHZx0PICskHgAY/RjwN
         dT8Q5SOGXFMDKXRtfxxeVyyGbakNuOFaG2o7bsSo+G1oG1gRruC4n+MctQA4qMdiUWA0
         ksjIKy8KDxo+9qepY7p/kIxSKqrga8VPktIw0+81IXkRuXbhEeZbeGz5DnnQQORWWL1D
         NzuR0sBcpu2jw0Mvekwxhs/MlYJPj/EaioHt265NY3I9Z5LwM5abwLLTHfH4GMKus0UM
         Ms9oU3W/69Q+4cAqQajWpkDLteSaeq9Qjhg1sf1MeMwNsgQvgcn/eoRYMUMX0qWI0Dp3
         gyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760594020; x=1761198820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAaGpTYCHTTBo2EbH+Tg3yUyz11i7OBlKY7RUtvkfvU=;
        b=mmtlHFNV3xU7F+N1wpeAOBeYMUEA4Nm2HFhKxSt2b32CJduU8fvwuZFvKFDk/KJSHX
         r5uhcLODaKECIIFS491+VpuLei8QPokFJD8U6buozuOi9l8yh1zwTRXtycnIc2hJNzhV
         pxhpRAayN/49YmpPtnjc6aMp4erqUt7IQJbSJ+WUFxU7vf5/ABfEBRa9CTx+j6/x1Q6G
         MG/IJjSA5Nc+/2R0tTWgUtXPAMSjZrz/GkqWbxNnthyBD/tTJ/oLRYPbLKvTq9OMS4jx
         KAxVwd1hP2N+/lhn3sSJdGDbt8v8xRbWus0fZIt+0p+y/7hUNiELdx6v0JQYxIzetZTg
         cBTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS8NPLHsM6aKzQaizAZcQAek4I4Y8Gf34aLfKuFkxvKvQU94Te0O3eRRAXIjXtYolOMMDdxr1xnCU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/DmKRHsrAJqxRrg5VYgCqTS1q7LsUsJS9g8OD1seOZtIVrq1Z
	8/eZjJ+ThsHtlAgxFO5wCqd9eVYhYm67P/HLHioW2fVuK7aByAg+nH+z
X-Gm-Gg: ASbGnctnu0qlf+564Nma+YTQWi5vVjTuEgzdKwm8gsCW8PTB2IQ2IgGuoOigpmR7HFo
	f58Iol67DBekjho0yvdZWB7pWoYy2b1Mgfd5oGx/asUMmk6FW8UP0lDzmiraq7FMxQySYOMnr6E
	8krjJVp1QaSgf2FzsVsxTwZKEODjMHiOBlGnfxjjh6TT+9PsPE4OzsyDoNrkWFqbAfhFveWt15S
	bjz3xEvwuolX2B+eFmGW9gEUw5gI/64vJnaQKkX8RdilsRAF8fiTPdWmnOkaoxAnzf5eCWnQKpa
	YU+hkei4Xl3rQSskR9KqgJvctyM+PfQs15yXHX0ClBOv7gtE1KoyPScrM82a6MARr0L9cpaFnjA
	DKJl1I1JFuZtBJnmMHsD4vjie1gFcRZnABEUilzn/nhg9bYiJFmLqbP/JxDQ=
X-Google-Smtp-Source: AGHT+IEgRfQ/ub0I6BUtJFyF+htmwCGpooYabvHnaqpojjjsHe4V3RB06dxjYZyCvzVU/Nb9w4xDAQ==
X-Received: by 2002:a17:903:350f:b0:275:1833:96e5 with SMTP id d9443c01a7336-2902739a633mr381582295ad.24.1760594020162;
        Wed, 15 Oct 2025 22:53:40 -0700 (PDT)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a90csm16384735ad.19.2025.10.15.22.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 22:53:39 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Fedor Pchelkin <boddah8794@gmail.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Detect and skip duplicate altmodes from buggy firmware
Date: Thu, 16 Oct 2025 13:53:32 +0800
Message-ID: <20251016055332.914106-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some firmware implementations incorrectly return the same altmode
multiple times at different offsets when queried via UCSI_GET_ALTERNATE_MODES.
This causes sysfs duplicate filename errors and kernel call traces when
the driver attempts to register the same altmode twice:

  sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0.0/partner'
  typec-thunderbolt port0-partner.1: failed to create symlinks
  typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt failed with error -17

Detect duplicate altmodes by comparing SVID and VDO before registration.
If a duplicate is detected, skip it and print a single clean warning
message instead of generating a kernel call trace:

  ucsi_acpi USBC000:00: con0: Firmware bug: duplicate partner altmode SVID 0x8087 at offset 1, ignoring. Please update your system firmware.

This makes the error handling more user-friendly while still alerting
users to the firmware bug.

The fix applies to all three recipient types: partner (SOP), port (CON),
and plug (SOP_P) altmodes.

Fixes: a79f16efcd00 ("usb: typec: ucsi: Add support for the partner USB Modes")
Cc: stable@vger.kernel.org
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 81 +++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3f568f790f39..ebe7e0a223d7 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -602,9 +602,90 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 		i += num;
 
 		for (j = 0; j < num; j++) {
+			bool duplicate = false;
+			int k;
+
 			if (!alt[j].svid)
 				return 0;
 
+			/*
+			 * Check if this altmode is already registered or is a duplicate
+			 * within the current batch.
+			 * Some firmware implementations incorrectly return the same
+			 * altmode multiple times, either:
+			 * 1. At different offsets in separate queries
+			 * 2. Within the same query response (in alt[] array)
+			 * Both cause sysfs duplicate errors during registration.
+			 *
+			 * We check for duplicates by comparing SVID and VDO (mid),
+			 * which uniquely identify an altmode. If we find a match,
+			 * skip registration to avoid kernel errors.
+			 */
+
+			/* Check for duplicates in current batch first */
+			for (k = 0; k < j; k++) {
+				if (alt[k].svid == alt[j].svid && alt[k].mid == alt[j].mid) {
+					dev_warn_once(con->ucsi->dev,
+						      "con%d: Firmware bug: duplicate altmode SVID 0x%04x in same response at offset %d, ignoring. Please update your system firmware.\n",
+						      con->num, alt[j].svid, i - num + j);
+					duplicate = true;
+					break;
+				}
+			}
+
+			if (duplicate)
+				continue;
+
+			/* Check for duplicates in already registered altmodes */
+			if (recipient == UCSI_RECIPIENT_SOP) {
+				for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
+					if (!con->partner_altmode[k])
+						break;
+					/*
+					 * Some buggy firmware returns the same SVID multiple times
+					 * with different VDOs. This causes duplicate device registration
+					 * and sysfs errors. Check SVID only for partner altmodes.
+					 */
+					if (con->partner_altmode[k]->svid == alt[j].svid) {
+						dev_warn(con->ucsi->dev,
+							 "con%d: Firmware bug: duplicate partner altmode SVID 0x%04x (VDO 0x%08x vs 0x%08x) at offset %d, ignoring. Please update your system firmware.\n",
+							 con->num, alt[j].svid, con->partner_altmode[k]->vdo,
+							 alt[j].mid, i - num + j);
+						duplicate = true;
+						break;
+					}
+				}
+			} else if (recipient == UCSI_RECIPIENT_CON) {
+				for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
+					if (!con->port_altmode[k])
+						break;
+					if (con->port_altmode[k]->svid == alt[j].svid &&
+					    con->port_altmode[k]->vdo == alt[j].mid) {
+						dev_warn_once(con->ucsi->dev,
+							      "con%d: Firmware bug: duplicate port altmode SVID 0x%04x at offset %d, ignoring. Please update your system firmware.\n",
+							      con->num, alt[j].svid, i - num + j);
+						duplicate = true;
+						break;
+					}
+				}
+			} else if (recipient == UCSI_RECIPIENT_SOP_P) {
+				for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
+					if (!con->plug_altmode[k])
+						break;
+					if (con->plug_altmode[k]->svid == alt[j].svid &&
+					    con->plug_altmode[k]->vdo == alt[j].mid) {
+						dev_warn_once(con->ucsi->dev,
+							      "con%d: Firmware bug: duplicate plug altmode SVID 0x%04x at offset %d, ignoring. Please update your system firmware.\n",
+							      con->num, alt[j].svid, i - num + j);
+						duplicate = true;
+						break;
+					}
+				}
+			}
+
+			if (duplicate)
+				continue;
+
 			memset(&desc, 0, sizeof(desc));
 			desc.vdo = alt[j].mid;
 			desc.svid = alt[j].svid;
-- 
2.43.0


