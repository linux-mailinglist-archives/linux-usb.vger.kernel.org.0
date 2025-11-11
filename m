Return-Path: <linux-usb+bounces-30306-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB6EC4A4B4
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 02:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C65274F1D4C
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 01:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FBF2FFF94;
	Tue, 11 Nov 2025 01:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCpU5buU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7AF2E9EB1
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 01:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762823147; cv=none; b=hDSwQ9WrOULc3xou6xW8Tl87OQqPNZud0qHfDixc+HyTchQ6CWnosYgJMuCViBdSd7gVzXjjA+7R0vRkg4ltt/JQB/gVh5EV/FKGoA+1R/cDtkY+sLfpAjUhYRGUslACFkcSTa1FNNl/odoklAocAcVVCo491KhTmcFqVm8kaI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762823147; c=relaxed/simple;
	bh=k1WN0VQ5IB7RF+m8FLLCpsQUoZ3WaXANS/Hri6Ng0Sg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qdB6TZYP9KJw8q/LArD6x3aqGR4eLq8hXl/cnrtAcZuV5KwRLZOaRxp8PATxIq24nFW0X1yT2uvwd7SxAudpLqHrM37c1o4YBBSXI1kh/kWyFxmKv/iDB7M0CGAKZHvgVilHcmhO2NKovt0UD5FBlNqCZo0QjOiweMADXsAUL6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCpU5buU; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7a9fb6fccabso2945957b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 17:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762823145; x=1763427945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wjHCAYAigCRw3Fu5ml9IjPbO4bB0Xk9foj11MwyMqWs=;
        b=jCpU5buUhiv4PDm/LIVPEPURYAnUmNt1NM+YdCU1zlWLd3JCV9c61ggx7lVOdsapNu
         NUZlkIkKSkjQht3h0e0dgqmnjrDtT4VAjFOAHU06HcM3Z2k6Y6fBK68jCM7SW+XlISiQ
         7nBYMMQaX9xhmf5uN8qb+HXMIwtp2zHDDvzDuCLWbJdR1K1xHPLNrR6l1hRMAHBJqvSg
         x9lOnWCbcmVIkl6MB8h6JPFO7sS8hn/yXXMVwxHz8PcUbK0Sy3EmUBOf5DYe5UgeJpxy
         Cxkmy5HfqggbofO5xJTuA8qF/lD8BcpjcbxTF/vf5GfWAHoU2ZzFcAX0xD1S1Zsv5Vgw
         4FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762823145; x=1763427945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjHCAYAigCRw3Fu5ml9IjPbO4bB0Xk9foj11MwyMqWs=;
        b=LJ6q2vsmL5SlRMyzrR0Jh+y8OTniw514nPZ8cZfP1Neeb4XeJ4FJCi9we0+MP0YdKU
         BfeT5joVOcm4SYBxAluqwvXaeI1PAx3fN4qUwZZ1VB2WYfik1mtS7K4asj4PBj17SpAp
         ZN6grSQVcddEwsaZGZ4gQJi5DzBV1rBPtxWlYbftcWytCDt+wB702bxTqeMRkKvh4EfO
         IEj0U3W8wI4dGtXqs6U8CuZT+UKHdgFm+uQStbo9eSwQwJvLDMq5S5y1EzxNIQPVIzn3
         aDv16k1Jy+76uDabaqiBaWzPdsOY06Yv2t2eHyJZ0RuYMNfw5n/B9jEGqqO8Ty6xtFKd
         XK0g==
X-Forwarded-Encrypted: i=1; AJvYcCWiC6KxnP2+vd9dEgEW9XtvcQAP12yldxapxS5znWXW2J5xH7czkX5tYtYS0sMm9CsJh1GjfWadXDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVkcPEcP2YQPJyTsgDUADOoFLXPK6jYCUAfVGQ9mh5BxAs3/EH
	wUhpA3QTuGrcMYSafhIK6hBDW8TVjaX3r9CKWhS52sDnVeKoS9sdbEwTBEFkVXBr92I=
X-Gm-Gg: ASbGncv1hGU9g+1pdxoYklzm6WJqWmB+QXqmYBRiQvmlWXNUAVsveq9i1hZWSOqLM4l
	iOsrQvqYV1IrFEaXNeDQ5XaOoMCNpZZRnZIYyz9J95xdXfTuYVyodFErPTfnHZIqOYMyP7bSBhy
	xQLlwx5Fczvbs+ETMLoJBTjzqNVoktDoLGhTxGWwNJ7SDrjpBFVuAC1ZNgu2vHT4fmm+w6GCb7s
	u/voP9wHSfS68RUehegylnySEFH5LUsrwlGDGto3b5ba025+qIEBsUc3LnXFjgepSiBS8Ay3lFV
	4CU3cSNbSaseiUN2/Ty0imi5dmKTg1uNhLOhufh57PuXToUuqYe0wmDmjR19L4+/ouP0gnY16LZ
	CoyPevqyT8K52yTM4s4birFj3cx4ZU/ejUSq8PCzUCUfHZKTY8KA+uavmeuL9XoJoqWhN4qJMJj
	iLIlR+aDCcCtEAHMLf+ha9rzHjbmbCUk/4DsF+j/Yf
X-Google-Smtp-Source: AGHT+IFE3txHegauGgH8pq+nQqk1fZAM90JCBrQtuWrGkUIMHuMAnlJJFcheYvVaxlZ8GMtWDRQjYg==
X-Received: by 2002:a05:6a20:158b:b0:344:97a7:8c60 with SMTP id adf61e73a8af0-353a17bc746mr14359006637.17.1762823144818;
        Mon, 10 Nov 2025 17:05:44 -0800 (PST)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9f01821sm13326961b3a.26.2025.11.10.17.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 17:05:44 -0800 (PST)
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
Subject: [PATCH v2 1/3] usb: typec: ucsi: Detect and skip duplicate altmodes from buggy firmware
Date: Tue, 11 Nov 2025 09:05:39 +0800
Message-ID: <20251111010541.145421-1-acelan.kao@canonical.com>
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
 drivers/usb/typec/ucsi/ucsi.c | 77 +++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3f568f790f39..7b79e7491094 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -556,6 +556,74 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 	return 0;
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
+	if (recipient == UCSI_RECIPIENT_SOP) {
+		for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
+			if (!con->partner_altmode[k])
+				break;
+			/*
+			 * Some buggy firmware returns the same SVID multiple times
+			 * with different VDOs. This causes duplicate device registration
+			 * and sysfs errors. Check SVID only for partner altmodes.
+			 */
+			if (con->partner_altmode[k]->svid == svid) {
+				dev_warn(con->ucsi->dev,
+					 "con%d: Firmware bug: duplicate partner altmode SVID 0x%04x (VDO 0x%08x vs 0x%08x) at offset %d, ignoring. Please update your system firmware.\n",
+					 con->num, svid, con->partner_altmode[k]->vdo,
+					 vdo, offset);
+				return true;
+			}
+		}
+	} else if (recipient == UCSI_RECIPIENT_CON) {
+		for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
+			if (!con->port_altmode[k])
+				break;
+			if (con->port_altmode[k]->svid == svid &&
+			    con->port_altmode[k]->vdo == vdo) {
+				dev_warn_once(con->ucsi->dev,
+					      "con%d: Firmware bug: duplicate port altmode SVID 0x%04x at offset %d, ignoring. Please update your system firmware.\n",
+					      con->num, svid, offset);
+				return true;
+			}
+		}
+	} else if (recipient == UCSI_RECIPIENT_SOP_P) {
+		for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
+			if (!con->plug_altmode[k])
+				break;
+			if (con->plug_altmode[k]->svid == svid &&
+			    con->plug_altmode[k]->vdo == vdo) {
+				dev_warn_once(con->ucsi->dev,
+					      "con%d: Firmware bug: duplicate plug altmode SVID 0x%04x at offset %d, ignoring. Please update your system firmware.\n",
+					      con->num, svid, offset);
+				return true;
+			}
+		}
+	}
+
+	return false;
+}
+
 static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 {
 	int max_altmodes = UCSI_MAX_ALTMODES;
@@ -605,6 +673,15 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
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


