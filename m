Return-Path: <linux-usb+bounces-36891-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NOZCCuK+Gl+wQIAu9opvQ
	(envelope-from <linux-usb+bounces-36891-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 13:59:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 780DB4BCB19
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 13:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8CE2301A737
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 11:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9476D3C1412;
	Mon,  4 May 2026 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mS/MmyMX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5948034D4C9
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777895972; cv=none; b=tL4DYoMXtlGxPqEMoOwQxRwnNKYTb53r57NGsrylU/hAQuzY0CoT4AzYhY+29FjuRnPSAhoTRnCArthYWh6n+tDq5rIJRG1oizfzSDI7R9E7z85y5F0SsUiDQ9jLMhgZvR35fZ9m+YxFE4m8WTpaA8qn2p5H11Kvdea7XSeGn44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777895972; c=relaxed/simple;
	bh=irc9YZ7+81a3rXx6J9P6qbtuU11rOyYSSBmz/KZCGio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WeIrskyqZzwaQRZGCzc6TRp6FPHRSzLkcYKNaV/pSiyHQa1WC3kVD5Vc548nCWvtkPnrYpIxnTtbX0Xig8paPGqPuap4KNlTwCJOQksS1aii1Vx3+FD/1R7GuQj7Np8LqEiqEy5UkoLv9UR5jd7biUepwxYnZGlhkwDWccms0dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mS/MmyMX; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44c4cc7c1cfso1166487f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 04:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777895969; x=1778500769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=g4bwV6NRXTfTApg4UaVDgXOzIHhuxhJnOdnH4M+tthk=;
        b=mS/MmyMX20PfgwnN/50gLE3Fascp6+2b/9xXyGBxkjqUFBLKHkD8+olIMgoNmAh1te
         7+qkO/JDjkzPVQoR+oQeyGJcnDipTo8+OF3Ak5ITtzB0HFxW7pPPA8wKNnZdVPgMCNE1
         O9qgj+zTUmK5hVyb+qiYq+/luVJ88CbGnDklPB28qfVJkm0xKpYoMrnv67C4o/ednrL1
         gZPmT34G6mgeX8RrNE7Pn/pdImGrtq7fikot1j3vAcfs/FxwBKTh9m0uTKP2P3pP4Twc
         AHfeY7WKPAsO4+G27NQoXTa1ig/IZewhlqP2g/rArAz1LgeiJZGa4axRMtgyxUGAdOHl
         yG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777895969; x=1778500769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4bwV6NRXTfTApg4UaVDgXOzIHhuxhJnOdnH4M+tthk=;
        b=BWmQpwv0gnK2Xmuk5tWhFs5/vnPkCGuPZRwyDRV+VB3rahyH7YcIW8K6GHZp9R7t24
         BlVwlnMdf1O1sYtt3+p1VZBPkFoYl6Y8DHgyZthIEXbCwmV0F9i7g/XhkGD5MlvV9kUl
         IyWHvz7ng1U8EkUwEiIZTlUCizPl54+/+PWeoC1IadT9FxnkoyrM2DBEziNj2ACkxodh
         ZcQkGs6dDg3E669NFBEJLgPxrYiGO2R6AbEbxgD53Tt6pECVeG4GV8YjRFCeM8VRylSN
         lONZPKjAVx2pUPsUvDjftINJg79OvROK/QCAPEtndBJpk7b6z5Apo7BoBiw98axKfffX
         dmVg==
X-Gm-Message-State: AOJu0YxYie4+stcD6O9DzNMMaRf6HE5CKYKUQD+Js8Qjk7OFf7QPfuD6
	fY4gbdcyu4HEjurKU5foDzlcs/w3M6+ahDmhv60oVWEkBzQ2S/WXBU8A
X-Gm-Gg: AeBDiesyPuRATJAc683izXQgpaVppeliOl2uRipPJVamnmsGGG4dIKsD0Wke2zPKZmn
	goNq84nr3jCHbXKXA0Z0MVbSdvk2+w7efR6J+8AEiOBDmhmHlpsVLD8uKGltzOn4f1EQ76Obeok
	uMlehgcMao7fsIb4j68oSes5tApR7tLyCIcvNoimHCLNL0hha+V9e0bCml6AYtzTTI3NHE/7yWJ
	H8Z0ziNoi0XJBCHzIwp+DpVlC1HhESo1uWQVmt6K6M91n7LFKKGmgGV1s/eD4O3PhXpWDBCJpTY
	DGrrOb+HGSKxSDV49qjTUXNjD3nYoj2NXAQl1xClJWh4lkyj+tJbdcwDlasmlfEDqvi3EhtLnDb
	uUfJKYa+GQALZYXt85+LYQicdtFHwOQjg6kFV3Ui0HdKaLLOliSWBn3W3OaPcwHlcH6iJW+Mm7O
	VKkoSn1Xh7xW0b3s2DF5d1KAxDVRNU
X-Received: by 2002:a05:6000:4304:b0:43b:8858:1146 with SMTP id ffacd0b85a97d-44bb62073b9mr16637208f8f.41.1777895968553;
        Mon, 04 May 2026 04:59:28 -0700 (PDT)
Received: from localhost ([213.229.133.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b77c05sm25890227f8f.37.2026.05.04.04.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 04:59:27 -0700 (PDT)
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
Subject: [PATCH v5 1/3] usb: typec: ucsi: Detect and skip duplicate altmodes from buggy firmware
Date: Mon,  4 May 2026 19:59:24 +0800
Message-ID: <20260504115927.48925-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 780DB4BCB19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36891-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[]

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

  ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVID 0x8087 at offset 1, ignoring.
  ucsi_acpi USBC000:00: con2: VDO mismatch: 0x8087a043 vs 0x00000001

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
v5. 1. use ucsi_recipient_names[] lookup table instead of switch for
       recipient name string
    2. add ucsi_dump_duplicate_altmode() helper to consolidate warning
       prints
v4. rebase
v3. 1. move ucsi_altmode_is_duplicate() before ucsi_register_altmodes_nvidia()
       for later modification on ucsi_register_altmodes_nvidia()
    2. use struct typec_altmode **altmodes to simplify the logic
---
 drivers/usb/typec/ucsi/ucsi.c | 84 +++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5b7ad9e99cb94..9f75c7efd5497 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -498,6 +498,81 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 	return ret;
 }
 
+static const char * const ucsi_recipient_names[] = {
+	[UCSI_RECIPIENT_CON]    = "port",
+	[UCSI_RECIPIENT_SOP]    = "partner",
+	[UCSI_RECIPIENT_SOP_P]  = "plug",
+	[UCSI_RECIPIENT_SOP_PP] = "cable plug prime",
+};
+
+static void ucsi_dump_duplicate_altmode(struct ucsi_connector *con,
+					u8 recipient, u16 svid,
+					u32 existing_vdo, u32 new_vdo,
+					int offset)
+{
+	dev_warn(con->ucsi->dev,
+		 "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x at offset %d, ignoring.\n",
+		 con->num, ucsi_recipient_names[recipient], svid, offset);
+
+	if (existing_vdo != new_vdo)
+		dev_warn(con->ucsi->dev,
+			 "con%d: VDO mismatch: 0x%08x vs 0x%08x\n",
+			 con->num, existing_vdo, new_vdo);
+}
+
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
+	int k;
+
+	/* Check for duplicates within the current batch first */
+	for (k = 0; k < batch_idx; k++) {
+		if (alt_batch[k].svid == svid && alt_batch[k].mid == vdo) {
+			ucsi_dump_duplicate_altmode(con, recipient, svid,
+						    vdo, vdo, offset);
+			return true;
+		}
+	}
+
+	/* Check for duplicates in already registered altmodes */
+	switch (recipient) {
+	case UCSI_RECIPIENT_CON:
+		altmodes = con->port_altmode;
+		break;
+	case UCSI_RECIPIENT_SOP:
+		altmodes = con->partner_altmode;
+		break;
+	case UCSI_RECIPIENT_SOP_P:
+		altmodes = con->plug_altmode;
+		break;
+	default:
+		return false;
+	}
+
+	for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
+		if (!altmodes[k])
+			break;
+
+		if (altmodes[k]->svid != svid)
+			continue;
+		if (recipient != UCSI_RECIPIENT_SOP && altmodes[k]->vdo != vdo)
+			continue;
+
+		ucsi_dump_duplicate_altmode(con, recipient, svid,
+					    altmodes[k]->vdo, vdo, offset);
+		return true;
+	}
+
+	return false;
+}
+
 static int
 ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 {
@@ -622,6 +697,15 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
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


