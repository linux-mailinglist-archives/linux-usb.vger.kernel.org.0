Return-Path: <linux-usb+bounces-31739-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F9DCDB8D0
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 08:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A18E302F1AA
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 07:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64422D46B6;
	Wed, 24 Dec 2025 07:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBp36Qle"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D848258CDC
	for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 07:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766559633; cv=none; b=uAtki4TwXsS2GsJcNd0OosmfVZ5uIGEQTXGNs3csDph+Oz/p/Js6dM7ezOaxiNNZCWIKwe1gfbeYYHN45dyUAKJvcLSBYdaWcfFtMGQhyjUHZbJGElV4gP/Sek7cs43LUMcnMARzEtB1Z9mC1M/y+SzQ4RZvcxHV3mcJusI0BFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766559633; c=relaxed/simple;
	bh=wVhZHC006jqWNNOeLcPUfH+a+2jtTevJEhgD3p1yZf0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Kyb8RqOLRFgFC/gPXhuRGPjfafWJzkPzXn1EXDnvU2WbBw3giwSz9lfs7bRuxanjzAAEp4DjpsE9hCDini81alSBt2b8Su886eluMhygrgD4Cea0hIzL3hVkRujTaes64R4W23pqp/IiDVJBYQXdtyvZpnETDyxkuWpe2eBEbJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBp36Qle; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so6513157b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 23:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766559630; x=1767164430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SMTCsgh6JYOlhQfaow1g1fw0qYa2mAXHCMrv5bEPizM=;
        b=KBp36Qle+njM6TyjHPBXLmUiI6xeFiZv0728JLralgSOi0CkEydj/FhiiPz+N5vneY
         ZsJNsBE3+0j2yQQW0GyIRZ4ogtWCb/twItAwkCN81LFo8j8sUyR36fp9yHTlzoUoegUJ
         uVsJcjZDlbnrXz2CUldynIGk4RzDQU/PwmkZW4l0AYNtxQsLbYlW8DUkDuLm/9J0+hax
         diF3cDOM3U5/fsMaKCvqzI9a/ruPyciPFKirze2CpzOO6gGX1TaZF4tMzY0+RVRhjq08
         3MNjYPg5Iy8/MTpRMaB1FsrsZfWGEaTpi00XuxUZZ3+4kWNjKiybqdxqeH3FL9xSxUTe
         Hncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766559630; x=1767164430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMTCsgh6JYOlhQfaow1g1fw0qYa2mAXHCMrv5bEPizM=;
        b=GFSM9Y5rhH7z7wHyF0UR3XNGHwfpzzkSur00zwMzxnUbZrxZ+2pi5FgHI+1xq3383T
         aGG2ZX5vK69uHmyDRB7U32RP9T0RMCmeIS2lckGHHXvWGd3hmToH+e4yE1NyQ1c2FL3m
         Ledob+AHPxWZgts7Di1VitqiWJq4LyBGIV0miKuPc2POPjZNuY5EdAcwtNrpLC8Sruw/
         DEvgvyq8alcYoM46ovX4gHBpMTAhzacRElO3PLSJWLwzqgnffNI9Huru6cya6+oSkFRA
         s7V5v6URwyy5ugQr4gDUc/rbEJfQMWsfocyvjwFv35hiGHqueAbZQjvOarbdiEmQAkXN
         5rvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdbwlMYSoEC+InrEhyl3+iJJlGAF0PanNdVX6bG5kxXUfQjKiolhVn4bK2FZeoe0S5ouUZnt0iMBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLDQuqhufoEamH+iaLOZe+P6Xzq8lDbqbheCvT8J0g/twR57Pa
	Hkc78Fk/VFvBmonKiRKWDPOxGTy45pvFMUDDix2idJlK2LgpE7xSYyEO
X-Gm-Gg: AY/fxX7k5sacxKgizO3lZuY+hOcGN1cXkzSHwnOGYAx7SiAE8fG0XWY70+jd4JFTM5m
	wWZjkWfiJ9yZ8Om8TCV9sdwujUi2veyQ4S6AL0TkjptcCgo8sjwwPtMAloFzpEkamY5kqY8xCyK
	BcVOjPhFfbZJnAmk3vcfWvHgrYTvUfP5oYIcTA5jKUCJcXiNrF16h/AgEAwiHJ3k6+Xr+sOnc05
	6HFQ/hJcY6q4VXPSSmC0HiP68bgxuPF6Q9G7Pp2dKJ82iZ3w5n/0xAkqIET2aWV9P2NiPiqAn34
	HlYNV9uwgtw67I3HDXWY4TFqMhoY8aK/Jt3j7NMcV8IVJP5eLvKs1WqeRioF10sqIVDBXFP8wX3
	bfAwfzbn9IVD6uzdoZ6icwNm80Y2HSiaRbauZhWvnefUIH9o/KeHvCKExgNDNt+V4hhnCBA==
X-Google-Smtp-Source: AGHT+IH1IloN1W3pKJ5DD+so7COtqqiVPdP45v24vrlI8zF/WrVlzczzUy2Pi7xHaFUVnLdum9n8YQ==
X-Received: by 2002:a05:6a00:1d87:b0:7f6:4922:89d5 with SMTP id d2e1a72fcca58-7ff648ee136mr15342309b3a.19.1766559630072;
        Tue, 23 Dec 2025 23:00:30 -0800 (PST)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a843396sm15817636b3a.1.2025.12.23.23.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 23:00:29 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Pei Xiao <xiaopei01@kylinos.cn>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] usb: typec: ucsi: Detect and skip duplicate altmodes from buggy firmware
Date: Wed, 24 Dec 2025 15:00:20 +0800
Message-ID: <20251224070022.4082182-1-acelan.kao@canonical.com>
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

  ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVID 0x8087 (VDO 0x8087a043 vs 0x00000001) at offset 1, ignoring. Please update your system firmware.

This makes the error handling more user-friendly while still alerting
users to the firmware bug.

The duplicate detection logic is implemented in a reusable helper
function ucsi_altmode_is_duplicate() and used in ucsi_register_altmodes().
The fix applies to all three recipient types: partner (SOP), port (CON),
and plug (SOP_P) altmodes.

Fixes: a79f16efcd00 ("usb: typec: ucsi: Add support for the partner USB Modes")
Cc: stable@vger.kernel.org
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
v3. 1. move ucsi_altmode_is_duplicate() before ucsi_register_altmodes_nvidia()
       for later modification on ucsi_register_altmodes_nvidia()
    2. use struct typec_altmode **altmodes to simplify the logic
---
 drivers/usb/typec/ucsi/ucsi.c | 76 +++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9b3df776137a1..b99c86e9f31cb 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -501,6 +501,73 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 	return ret;
 }
 
+/*
+ * Check if an altmode is a duplicate. Some firmware implementations
+ * incorrectly return the same altmode multiple times, causing sysfs errors.
+ * Returns true if the altmode should be skipped.
+ */
+static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
+				      const struct ucsi_altmode *alt_batch, int batch_idx,
+				      u16 svid, u32 vdo, int offset)
+{
+	struct typec_altmode **altmodes;
+	const char *recipient_name;
+	int k;
+
+	/* Check for duplicates within the current batch first */
+	for (k = 0; k < batch_idx; k++) {
+		if (alt_batch[k].svid == svid && alt_batch[k].mid == vdo) {
+			dev_warn_once(con->ucsi->dev,
+				      "con%d: Firmware bug: duplicate altmode SVID 0x%04x in same response at offset %d, ignoring. Please update your system firmware.\n",
+				      con->num, svid, offset);
+			return true;
+		}
+	}
+
+	/* Check for duplicates in already registered altmodes */
+
+	switch (recipient) {
+	case UCSI_RECIPIENT_CON:
+		altmodes = con->port_altmode;
+		recipient_name = "port";
+		break;
+	case UCSI_RECIPIENT_SOP:
+		altmodes = con->partner_altmode;
+		recipient_name = "partner";
+		break;
+	case UCSI_RECIPIENT_SOP_P:
+		altmodes = con->plug_altmode;
+		recipient_name = "plug";
+		break;
+	default:
+		return false;
+	}
+
+	for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
+		if (!altmodes[k])
+			break;
+
+		/* Check SVID for all, VDO only for non-SOP */
+		if (altmodes[k]->svid != svid)
+			continue;
+		if (recipient != UCSI_RECIPIENT_SOP && altmodes[k]->vdo != vdo)
+			continue;
+
+		if (recipient == UCSI_RECIPIENT_SOP) {
+			dev_warn(con->ucsi->dev,
+				 "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x (VDO 0x%08x vs 0x%08x) at offset %d, ignoring. Please update your system firmware.\n",
+				 con->num, recipient_name, svid, altmodes[k]->vdo, vdo, offset);
+		} else {
+			dev_warn_once(con->ucsi->dev,
+				      "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x at offset %d, ignoring. Please update your system firmware.\n",
+				      con->num, recipient_name, svid, offset);
+		}
+		return true;
+	}
+
+	return false;
+}
+
 static int
 ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 {
@@ -631,6 +698,15 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 			if (!alt[j].svid)
 				return 0;
 
+			/*
+			 * Check for duplicates in current batch and already
+			 * registered altmodes. Skip if duplicate found.
+			 */
+			if (ucsi_altmode_is_duplicate(con, recipient, alt, j,
+						      alt[j].svid, alt[j].mid,
+						      i - num + j))
+				continue;
+
 			memset(&desc, 0, sizeof(desc));
 			desc.vdo = alt[j].mid;
 			desc.svid = alt[j].svid;
-- 
2.43.0


