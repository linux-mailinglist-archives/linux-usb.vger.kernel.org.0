Return-Path: <linux-usb+bounces-36307-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GqIO+Hz4mmRAgEAu9opvQ
	(envelope-from <linux-usb+bounces-36307-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 05:00:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A32941FD08
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 05:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAE74305E10D
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 02:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F4B330328;
	Sat, 18 Apr 2026 02:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exponent-digital.20251104.gappssmtp.com header.i=@exponent-digital.20251104.gappssmtp.com header.b="aMQq/Jz8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D794628466C
	for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2026 02:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776481117; cv=none; b=W5DytpXydszlRfFp8Ru7nEMG2HAM8C4Ru4HIDawqRcOmiDkDfYXx0zcDcCYAf+8iTv7JOfR7NnNAdgI0HN2sIbkjXyZIYic5VahGpLT8LJLd+HrKnVFHOx7CeWvEv5D43BJ8TYKWyIxjIFimI8AYkBTO32aAixQ/hUxu0rRq3Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776481117; c=relaxed/simple;
	bh=Os3Qd2/rEF3RFRrAtbvsX0CsqiUOJRcpfnFRti8hRTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBF//WhzrWBPRU0Qw5JvQFamVehQg/fNiYpbrQOBUIhxjk24UzZm/z1sFexGoZ+rvoDoGwNhaapTzr/j7Q+43eWZi6yaHSqzfPXKSkwTTJIywNMHmGYRlrzYAGGFZZp4A357/gjZwhfeEqznhF2z7c+6R3dbOF4qziSar70SPvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exponent.digital; spf=pass smtp.mailfrom=exponent.digital; dkim=pass (2048-bit key) header.d=exponent-digital.20251104.gappssmtp.com header.i=@exponent-digital.20251104.gappssmtp.com header.b=aMQq/Jz8; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exponent.digital
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exponent.digital
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f37c09352so1591548b3a.0
        for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 19:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exponent-digital.20251104.gappssmtp.com; s=20251104; t=1776481114; x=1777085914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wimO4t98B94X++UZm1VpEFfwrjNwlS6cYzn0ZUHBaAs=;
        b=aMQq/Jz8zocx4LSV0PkiQKMh2LR10TOFmWSu6Uh5tjahwZiv408BLMhKPvUmEjEGsE
         AyN+8mxnK8xmQLXelSD1CYfvuPj1DJ/xLWlO++TFujCPjhjVrFmGXLzrVrdpeo8HICSl
         qnDaeZh9PQFHSRUSxSeM55mMY0ppjlefeDwVqjBWPhLlrnZX8G22h91uBiDWy19wsF1f
         Vlz1hwLPXQtxbU/V6wMem+D/Tgrxm1/SMSgdeIfGDn8abgLRHUTsOfydjqHndBiDs/Mi
         bAcOvlPUDrb3JxSL3FOzLEz8rbQGbaq/PQtYQP7N6sI9Xl0m8RkARmMXaNm2vIRB37lx
         duPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776481114; x=1777085914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wimO4t98B94X++UZm1VpEFfwrjNwlS6cYzn0ZUHBaAs=;
        b=RB0DAF4a3GV1a3xdqmm/tXeXceTuyoZ7CL4ZHCKG1CSJRaCM3HDnjuIegp61aC8nkF
         alawxIDusO9eBhcrrngy86ZYqqkyJq4Y5JdQWVXtOUyayuKFAdno+KWXUxutJRwStZsf
         8OdOd8l6zgPzEVNhtwoh4ZBLxQldxvK/5i03oXLRzG+v9Zj3KYFvfsNzoOGDtj95V0yC
         eiga1e83ij23dXVQjvNRpm1tUoGCIOCsqLCakjbBz2Ut3fZeWo9Mig0d/6EtIykN5S4q
         I+5l9MKhBR/8W/V6w+VcWvPXIShrlqw6oowLGv1jEf3tFC01wbjReI2kCZmDFjUbrnXL
         Gkmw==
X-Gm-Message-State: AOJu0Yy8xxNyNWibpYL2PE7Au6xP2namceNk/GKAEoEwQSIh+2fxT2PM
	bxOKiXidAqHniAN5bdPd54vKakIQjUgHVUOtMndfoos3o/mkzn8l/wRHIcf6KdngjeM=
X-Gm-Gg: AeBDiesQQI6i9nquF9a50Ruj475doXKZp1D3dBeCuP6nWGDId0O6xPIw77ucmCb0xD0
	Dd93j4xeVGuWU39UOodIhUowNH9/ZPzgXtGQXEKTaCh/D6UQ/ZIFCP648zHwz+OsPHYsUHYm39D
	7GZFQ+6qBG4PQSEC5Srv9kvoeGa6tz3FcmZ66ebwomCDSSa5k09RM+pvJ+9uAUD18HesTzM6DCJ
	NLjFerMfKZSAdryTFnDRfA/GU+n9aQsBdE+Y7GjSazAAtPelSAnLuqZPdDyPaMZB0m0WCP5RzHC
	oKhIDhERhd8MXQPNHRvEcoYDozEpJb7fwANqwuqOkPiA8r/tzg9NvncnTTjg6jJJfJClGOD4LfC
	1Q/l+05az39Um9/u2Wi6X4v8WA6rUkYGhKFU+/nlVKVug5k69dUaJj3Elf0NLxnRYh0YN1v2EtB
	oYuoV+GDiiP5USEUI15teKFnFFOQXogE3Tc7Cw7hE3AuFnNQqfCKx+UUTRrYw=
X-Received: by 2002:a05:6a00:27ab:b0:82f:4725:f6d0 with SMTP id d2e1a72fcca58-82f8b5476bdmr4184949b3a.29.1776481114219;
        Fri, 17 Apr 2026 19:58:34 -0700 (PDT)
Received: from yohji.localdomain ([101.100.136.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819e5sm3524552b3a.2.2026.04.17.19.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 19:58:33 -0700 (PDT)
From: Taylor Hewetson <taylor@exponent.digital>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taylor Hewetson <taylor@exponent.digital>
Subject: [PATCH] HID: usbhid: sanitize hid->uniq against non-printable bytes
Date: Sat, 18 Apr 2026 14:58:23 +1200
Message-ID: <20260418025823.21767-1-taylor@exponent.digital>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[exponent-digital.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[exponent.digital];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36307-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taylor@exponent.digital,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[exponent-digital.20251104.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[exponent.digital:mid,exponent.digital:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,exponent-digital.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 3A32941FD08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some USB HID devices (observed on ASUS ROG Azoth via its 2.4GHz
dongle, USB ID 0b05:1a85) report an iSerialNumber string whose
USB string descriptor declares a longer length than the actual
serial, leaving uninitialized firmware memory - including control
characters such as 0x18 - appended to the returned string.

These non-printable bytes propagate into hid->uniq, which in turn
populates /sys/class/input/inputN/uniq. Downstream userspace
components (systemd sd-device property_is_valid(), and by extension
mutter input enumeration on GNOME Wayland sessions) reject devices
with control characters in their uniq, rendering otherwise-
functional input devices unusable in graphical sessions despite
the kernel input layer correctly translating keypresses.

Truncate hid->uniq at the first byte outside the printable ASCII
range (0x20..0x7e) after the serial is read.

Signed-off-by: Taylor Hewetson <taylor@exponent.digital>
---
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1427,8 +1427,17 @@
 		snprintf(hid->phys + len, sizeof(hid->phys) - len,
 			 "%d", intf->altsetting[0].desc.bInterfaceNumber);
 
-	if (usb_string(dev, dev->descriptor.iSerialNumber, hid->uniq, 64) <= 0)
+	if (usb_string(dev, dev->descriptor.iSerialNumber, hid->uniq, 64) <= 0) {
 		hid->uniq[0] = 0;
+	} else {
+		size_t i;
+		for (i = 0; i < sizeof(hid->uniq) && hid->uniq[i]; i++) {
+			if (hid->uniq[i] < 0x20 || hid->uniq[i] > 0x7e) {
+				hid->uniq[i] = 0;
+				break;
+			}
+		}
+	}
 
 	usbhid = kzalloc(sizeof(*usbhid), GFP_KERNEL);
 	if (usbhid == NULL) {

