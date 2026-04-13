Return-Path: <linux-usb+bounces-36175-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Jf2D9yd3Gn7UQkAu9opvQ
	(envelope-from <linux-usb+bounces-36175-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 09:40:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF8F3E85AF
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 09:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E53DD3029AE1
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 07:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AFC3939BD;
	Mon, 13 Apr 2026 07:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaVnNBrq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2461B6CE9
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 07:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065767; cv=none; b=ARRl7EomxRgV8+L0gsw0RtyBhG2tvpGTwRxLXE2k7jXU0qh2CEkiiIE2zOCgAFHOrq96pLTq5DdigF8HZmegsizuMjLLY79NKp3cidX0zszGrQ19zlmLQGhaihVF9La33mv3H04h4Dg/7zDYcfW6f0YHp1mKT2TiRGP6D2PtbkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065767; c=relaxed/simple;
	bh=frigX/rrrdLdew8IBysrN1tYa2Nu9Hgu8EKMA9XHv/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i0PyBpfqwmbkPjnm2zwyTgQ2/K8+wHbXM0zj4WVwI3RKnXIle0h5dS1shxzvxTdkalSzFAQw9QICdzlJNmHBUPnf/PSj+aO5nsn2NXudJKn3mioAWe9pDRqftpC3osq814S1Z65yUQXGYNvlr4sArZmInNhr/crTyqigAeKdEw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaVnNBrq; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso1618507a12.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 00:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065765; x=1776670565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SuxGqbnD8Bm0aetVSsz6cVcUYgqUguHy8sNssgYS12o=;
        b=MaVnNBrqSsb+erRJaYygSQobkqeQBNdJAbjHZlsDwXoxemzZvuukqSG+W86hfloqbe
         FPHnzSDhFp6qOm1J6OkRmjXp5mmXpn2cBD11FIcb+9nrRCXuen90/QcuYhvMEpn5ePgK
         xfP8EiVdTjd8pYE1fcoqM3p2KeGCOy7jvUAjFqiHfB2kK/xYVTBOsbBAn7aHiA9OrG4h
         RJC3nX5tCT6PjgPSAGBNe8mnZ9lQOEmZOwsMTRuQ/IX/Sle/jiGDhiPxd0vhNWtimwrB
         qOuZFJ5kYBIzBD48PrBe6FuPGEcS8dmQnUsTlLXu59HPIqc0QoIfdN9OIpMJcZ2nYGVP
         P9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065765; x=1776670565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuxGqbnD8Bm0aetVSsz6cVcUYgqUguHy8sNssgYS12o=;
        b=aIRLsvF85epxdvve7qN9SEKjuOGSiFFrsWKdHaEYR+IqMIgFMZ2mt/fdDD7YFmx+U0
         q6Z6lBN+lbLmt8WmozJ/xoxIXMUmzCzVvFPoZ6i5vqKqFMMH+AGAbSQtQ7yWuVSR6YAH
         UoGIlTo0dK1v8EBhjjC6WuviPpdGLDkdzCBHgo8oxBcP+oP7S5+hdIjkupeE42PGBvJD
         RMihxYdMK/B3ny5ePXGxDQzAzS3mu59M6KKEUamyFPot1jGJziAPBjifk9RoQpJWTpWo
         Gl/ReLxP1yDbBz9zeNtfLOtBfpYYJZS0RhvatkzBqRONCqF4tjta/ZskOM84C9tHpF96
         EIBw==
X-Gm-Message-State: AOJu0YyM0JxnHX1Q5yegAy6wku4aHAI2WLOk+uBt50+4YsAZH5uWH0sN
	JmdU/RbqRkVbIU+gQe+KP/2AjpH80gE3cf5xHhE2S5w48MDotBTNzCGc
X-Gm-Gg: AeBDievbn/eOAsDxvMwilKw5upyWXpMB8p9Cme8C2I040csQ5vO8BAyEP337bk91QqH
	VyfXSU3Wg5r1wgoyt+BhQK1hUkhtPVhoRp9rmBIMLUbVnscxNWjAxay95BPl0i+iIC6mUvXdquZ
	Rk/MBjV8pZWNHxWn5TeV9IXpSygd7H0sw73IJiB1AWg2WNJjuYeFZt8JaHbG7EdH+ZB9ul3YD68
	hlLYPPdzlxFL3gSRKwRarWdo0LwAJdDvvSYaU/4v2ttY3Im2VdpNgJYwGiSlH0U5sQXahbVBj58
	9HyC02lrKEfTTfkCJjQVZSCGHcTvCFHCfTJiCtzAzaG9gvxsHuobTvc6lYgU9CU1fwbKSAfeqiq
	0Vw3jMnLTeFNvwwxohWOG7Ix8Ta3SNqVKCYefaesoBE/KkYq5rEsXDSDjUAsUz04jGZJ3bHKpyl
	l2euC+7OVjfb5KS6qp
X-Received: by 2002:a17:902:f34d:b0:2b0:7026:24bf with SMTP id d9443c01a7336-2b2d59c7601mr83871435ad.14.1776065765376;
        Mon, 13 Apr 2026 00:36:05 -0700 (PDT)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dabe01sm105796255ad.1.2026.04.13.00.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:36:04 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jameson Thies <jthies@google.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] usb: typec: ucsi: Detect and skip duplicate altmodes from buggy firmware
Date: Mon, 13 Apr 2026 15:35:49 +0800
Message-ID: <20260413073552.894395-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.84 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36175-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,canonical.com:email,canonical.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Queue-Id: 8DF8F3E85AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
v4. rebase
v3. 1. move ucsi_altmode_is_duplicate() before ucsi_register_altmodes_nvidia()
       for later modification on ucsi_register_altmodes_nvidia()
    2. use struct typec_altmode **altmodes to simplify the logic
---
 drivers/usb/typec/ucsi/ucsi.c | 76 +++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index f181afca2bb28..eebbb80fae566 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -498,6 +498,73 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
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
@@ -622,6 +689,15 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
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
2.53.0


