Return-Path: <linux-usb+bounces-34773-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBYlLLO6tGl7sQAAu9opvQ
	(envelope-from <linux-usb+bounces-34773-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 02:32:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DC428B435
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 02:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72E2030B849E
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 01:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94E22DCC01;
	Sat, 14 Mar 2026 01:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pf7Ujhb8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED79017C21C
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 01:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773451934; cv=none; b=mLl56sdlxMAzRYysZykI4wSgK9IY0h/EQ2pHOSwqYwd9vbOitgbjb/FfDMhgBsZN1KfEW09oz0/XmpLh1dkc1zRm2w0lhpZsiR2zfSfBBbxqrpzDwDuG/1cJzma4yfi07GHIwDooBHwhYesWgR8J5YwJ5WJF8SNq67EtDcHTEIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773451934; c=relaxed/simple;
	bh=mUxCPP/m7AMSSH1pxHzOmtIKNsUap3vsjNULA0fzP4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rSHsvNydBdw5ZpVbjJQqgr838Ts7XOGyRgqv39VrP1r/HmRqB6xcxzBudTpvFX7Di0Fwk/4a5g5M0ngMkb/UePqez5xf1wzrGKd7KVFCTyh+mf+gzPz0hFot4RbeDK5+QOASlUu3W5z0Mk7DexYcQ+0mtw33wD13nocrJUKl8mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pf7Ujhb8; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so3133212f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 18:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773451931; x=1774056731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iR0JNXye1PQ32tEpIdRTYUVyYik8LC1u1H+imbfX1oQ=;
        b=Pf7Ujhb8dtVkmMW1sYsmFyRiaTAg+CNq/Kje8X6lJgZTbaMtsSpsd/xOmfxnbOfpfd
         xRlwOCJDaZz+Btk8wQCnls32+3PTli+M2NwqaNOeeAnshzswbZFcablBSyQxjnUky86Q
         9xPCWjQ8GPb080Ab2bucOWYip66HCaVd0LYfNiEuMxzwb7hNYI4yZdzgxVukpCDd0pYk
         0wLajObpNsEup5MfL6bBHe2E+ch2DJkCph9hKhYheH1p2KONv2M1m2FgdBNPo/5oCSxk
         hRfExYrFYL1ymx/qmT/Eni/lKEuweArN1EPxIX7pb1+B87/09RD8F4M05Yp92UPlSjiW
         UJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773451931; x=1774056731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iR0JNXye1PQ32tEpIdRTYUVyYik8LC1u1H+imbfX1oQ=;
        b=szcYeivZqm9WjYMKyjB6pRJMCvVqtmIS3ei1RheGc8P/9WLiAyZG8dJUGiloF60euB
         20pwfKJpCyyRrQawNwINWK7XIiBt/O6Jc/33gNQT8SCpLzeWsWiIegAkwVPcz9JMOdO8
         aH8drMkQNhmHgAlF8pwaDqSGKBi4Xgze9MQRn+T3fPnrb4Pj0VRydPxcK+UmKTM3HVjg
         ZdrN5kD0LhJNdQNYpAo+k0ZdiAbYiEdp5bpzSBOOfsl919n7H+1sOdmjpMYA9fW6g+s9
         MOABAjAjxrD06867XxJnn8QX3NqaNDni6fzKVBe2djIXdVhU8ln3sJNYQJbf5NJS3Dpn
         3KRA==
X-Forwarded-Encrypted: i=1; AJvYcCXfKQSHWn+iNR6IusT/Wo4uvuJRIfnzivmcvsWIQPdarnOCLUHDVCWfAz+/UmkUELPPhZiPZWQ8FQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YynxvNcfdXPkkSS5yHgsmwhD6vWTKOVG4Rv71fApeN4G/Lb1PaY
	0YDKevJtpm3LqQK6B6qI6AspAcHv9oqbqlmMwD3hDpKMEj1bQ+zG/o4Y
X-Gm-Gg: ATEYQzxYs23yUckaLmI+M4gq+ptRucwN/LLQY6DqPzMFLHc8lF8FZSHmaN0U9yWAW8G
	qwn591oQx9sEXPMq3NbWYuVxQ06nsEwqvCqMuzn94t72T8EFE3TOpMn7ICVuUn1RTtorrx/i/j1
	3W8oH/Yk4dgjDt9GDN0L/f8cDKFJJ7IpPOuTjAo1ERbZe+cYsLOGlMKek+4b/GeMR6tDVtu8eDM
	YOcyg3ZaUfov4DouDljiG9MggofxYPdHDu6sSab8u8pakcJ3X4LEMUoJ+MofcKRfk9po6tNpSAm
	Kc83rmj2KcZGRLZWY69vWSqK3+4ErxxuOImi35mO6YhiNzXPLu8y+yz5sRukQO5hPnkoAt6OcwO
	1ABD6uj8oxEHczK7AQ3SRbxDDBk9w3kvHDvb5QSyi9v+Vks/3xU6+kFJ7wTYtOI2a9n6v/mL9Co
	pLqLPAjGtupoPV7Nem94s1PwsYjj3y2Hh6vz23iE0AeAFj4uej45Iaa1FuhbE9GC6odDLYEdCBw
	fbJCqWoMPaVE3qq88D6PCOSFGbRBbZlidTyGucEmVNqCr0/jde2AqEdJli6u98U3Vt8bQZRC+MB
	UKQWg9E3HKE=
X-Received: by 2002:a05:6000:2501:b0:439:ba4d:bf40 with SMTP id ffacd0b85a97d-43a04dc831fmr10711463f8f.43.1773451931220;
        Fri, 13 Mar 2026 18:32:11 -0700 (PDT)
Received: from scambox.localdomain (5-198-68-184.static.kc.net.uk. [5.198.68.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm21876575f8f.31.2026.03.13.18.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:32:10 -0700 (PDT)
From: Edward Blair <edward.blair@gmail.com>
To: linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	wsa+renesas@sang-engineering.com,
	westeri@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edward Blair <edward.blair@gmail.com>
Subject: [PATCH 1/2] i2c: acpi: skip generic I2C device when vendor-specific sibling exists
Date: Sat, 14 Mar 2026 01:31:55 +0000
Message-ID: <20260314013157.7181-2-edward.blair@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314013157.7181-1-edward.blair@gmail.com>
References: <20260314013157.7181-1-edward.blair@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34773-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,sang-engineering.com,kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwardblair@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 52DC428B435
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some BIOS implementations (notably ASUS Z690/Z790/X670E motherboards)
declare both a generic UCSI device (MSFT8000) and a vendor-specific
device (e.g., ITE8853) as ACPI children of the same I2C controller,
both referencing the same I2C slave address.

During ACPI I2C enumeration, whichever device is walked first claims
the address, causing the second to fail with -EBUSY. When the generic
MSFT8000 device registers first, the vendor-specific driver cannot
bind, losing access to device-specific features like GPIO interrupt
resources that are only declared on the vendor-specific ACPI device.

Fix this by checking, before registering a known generic I2C device,
whether a sibling ACPI device exists at the same address on the same
adapter. If so, skip the generic device to let the vendor-specific
one register instead.

Signed-off-by: Edward Blair <edward.blair@gmail.com>
---
 drivers/i2c/i2c-core-acpi.c | 88 +++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 2cbd31f77..87582eac7 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -137,6 +137,17 @@ static const struct acpi_device_id i2c_acpi_ignored_device_ids[] = {
 	{}
 };
 
+/*
+ * Generic I2C device IDs that may be duplicated by vendor-specific devices.
+ * When a vendor-specific sibling exists at the same address, the generic
+ * device is skipped to avoid -EBUSY address conflicts.
+ */
+static const struct acpi_device_id i2c_acpi_generic_device_ids[] = {
+	/* Microsoft UCSI - often paired with vendor-specific UCSI device */
+	{ "MSFT8000" },
+	{}
+};
+
 struct i2c_acpi_irq_context {
 	int irq;
 	bool wake_capable;
@@ -274,6 +285,76 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
 	return 0;
 }
 
+struct i2c_acpi_sibling_check {
+	struct acpi_device *self;
+	struct i2c_adapter *adapter;
+	unsigned short addr;
+	bool found;
+};
+
+static int i2c_acpi_check_sibling_addr(struct acpi_device *adev, void *data)
+{
+	struct i2c_acpi_sibling_check *check = data;
+	struct i2c_acpi_lookup lookup;
+	struct i2c_board_info info;
+
+	if (adev == check->self)
+		return 0;
+
+	/* Only yield to vendor-specific devices, not other generic ones */
+	if (!acpi_match_device_ids(adev, i2c_acpi_generic_device_ids))
+		return 0;
+
+	memset(&lookup, 0, sizeof(lookup));
+	lookup.info = &info;
+	lookup.index = -1;
+
+	if (i2c_acpi_do_lookup(adev, &lookup))
+		return 0;
+
+	if (!device_match_acpi_handle(&check->adapter->dev,
+				      lookup.adapter_handle))
+		return 0;
+
+	if (info.addr == check->addr) {
+		check->found = true;
+		return 1;
+	}
+
+	return 0;
+}
+
+/*
+ * Check whether this generic ACPI device has a vendor-specific sibling at the
+ * same I2C address. Some BIOS implementations (e.g., ASUS Z690/Z790/X670E)
+ * declare both a generic UCSI device (MSFT8000) and a vendor-specific device
+ * (e.g., ITE8853) at the same address. Skip the generic one so the vendor
+ * driver can bind with proper interrupt and device-specific resources.
+ */
+static bool i2c_acpi_has_vendor_sibling(struct acpi_device *adev,
+					struct i2c_adapter *adapter,
+					struct i2c_board_info *info)
+{
+	struct acpi_device *parent;
+	struct i2c_acpi_sibling_check check;
+
+	if (acpi_match_device_ids(adev, i2c_acpi_generic_device_ids))
+		return false;
+
+	parent = acpi_dev_parent(adev);
+	if (!parent)
+		return false;
+
+	check.self = adev;
+	check.adapter = adapter;
+	check.addr = info->addr;
+	check.found = false;
+
+	acpi_dev_for_each_child(parent, i2c_acpi_check_sibling_addr, &check);
+
+	return check.found;
+}
+
 static void i2c_acpi_register_device(struct i2c_adapter *adapter,
 				     struct acpi_device *adev,
 				     struct i2c_board_info *info)
@@ -302,6 +383,13 @@ static acpi_status i2c_acpi_add_device(acpi_handle handle, u32 level,
 	if (!adev || i2c_acpi_get_info(adev, &info, adapter, NULL))
 		return AE_OK;
 
+	if (i2c_acpi_has_vendor_sibling(adev, adapter, &info)) {
+		dev_info(&adapter->dev,
+			 "skipping %s in favor of vendor-specific device at 0x%02x\n",
+			 dev_name(&adev->dev), info.addr);
+		return AE_OK;
+	}
+
 	i2c_acpi_register_device(adapter, adev, &info);
 
 	return AE_OK;
-- 
2.53.0


