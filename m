Return-Path: <linux-usb+bounces-34774-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIfNOqW6tGl7sQAAu9opvQ
	(envelope-from <linux-usb+bounces-34774-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 02:32:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B49628B417
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 02:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0DBB3059AC8
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 01:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA32D2E3AEA;
	Sat, 14 Mar 2026 01:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3y/RC0Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C80D18B0F
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 01:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773451935; cv=none; b=pFemjkZlv4D0EqGBa+Fut3c3zfiKnNcji6OdfKPSsQ6V2RGzMe50v69ODFl14UxtccPoxbSgUY1zgI7nMCDdTNnJ1/i7ZOwctuYzaPnrruNF9qqqRNaO0BkAPJzWHHp+sFrYaltmD5wrx8spnJ+zPkzQ74ujtd9ZVIm+dWngq7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773451935; c=relaxed/simple;
	bh=dNJvwOvtKkuRy5CJp7kfu5V0sbcA8LMVkK7KgeS0AaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mwycul841KboG9e/0t3YNFMlFIP5bZrYtWzyENNaOSCpaCMFkBMwPzFbaUZ5aNjhce+jKLAhZ1O3HEjYxgwhEYbhgNctBviDexSjcZEQ9U6+VEm28LT5nt0uolGCZiWzdiIqIAExetpqyz84BU80ByDlohlJROBpZRUb1XQoZbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3y/RC0Q; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4853aec185aso23123575e9.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 18:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773451931; x=1774056731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+3d+vA9WOD1aIXWABPX3fea+gZYGZsE6ZaKFwHPcp3I=;
        b=T3y/RC0QSiLCNAODcJPUDco8nXt0Ps2Hv4BoFX9ZvOp8xtZvax0GV6+eYvmfoKFylr
         M294aq0xTu9devijqN5tNUkq05k3ZIZRZj4cMvxq7cMlAZ18qOeua47x6c+77CKaNHVr
         VyNF3QzD82MxmP+wkM43h3bXJgSyYC2jfCurzCLpmQZUTjSHH3/ZRpc9EO+KEV04Gkt3
         MY+07o/3QJmlJcesemijSQB9SUqzyOt51XV9EnCyW8xU135nL6cHJWi3qq13AXceoljz
         xWzcJqI6N7GMdM7VkNxkg8a3xSB2ySJmwJR+zPXnRjF3L4y4o6rXXu7FGo5YG8lotakD
         4CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773451931; x=1774056731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3d+vA9WOD1aIXWABPX3fea+gZYGZsE6ZaKFwHPcp3I=;
        b=UxLHUsI89LFdbNSP803XdRFPWdaCxpMsb0JMwx0/yrJT9sV7z5WfVgNV7iGCgC+Pq0
         OhgX05BXraxaNzRk0amiWo13ARqapjThIAYIdW1eWtADNDj2HUVktNV1sgMtmP+0LFqi
         Efx7lEWPHsHM4KKNGiv9yJs90HpmB95XUCHJQlQo5n4qMWpX7h1oOH2e2lWiWaM/qsDG
         95CCCirkZib/Q565AbN+U46HHPMYwleVzVKIKj38+gR1q6QOCPldAo6EY0bNQhkAcInq
         k/GfxbYYp1wBu1Qoa+7dwRnHxNdHAyVSFdLONGxq7/QAZr2n/hsZK8GtJ8BUIR62UJkq
         gp6g==
X-Forwarded-Encrypted: i=1; AJvYcCUAwcXwf7eUTtFUJI/c8o58LXk9ggL5VuE6B/otfzh/zjixPBji/CWnmHXGVS51Cp2fldG5ENR00ww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/bT7RhmW5GDyxrGI6XPHPqFb4djPNiFU5iZWTXOGc0LcBvsnj
	kgOffEGDg5n+u4K5UiEIRIL36HqbgCFIlToFsw1nE5w6UN7SwX3pmOHh
X-Gm-Gg: ATEYQzx5+699odDLmrMUw/yvozJlmiTexPzAGBT8s3uU3cqIJlAN1tONKUbzTHjsDfU
	15LpLdfvY/eU7Zf4DIQZ97FrDwrayMOfAgXstt5he6by1V8KEbv9g+3PnbQuDe419GRNFeUNI1x
	xRtYHwFW7o1T1SkJIp/zacDnRgwxDeQm/Vli5CRwqta8lLbArZbJH9WmcfT3Fr+TzK9nnUAJwmO
	xU3m04eRlUQwLSleTLkciznaF0WMnAk08XgoajL1xUjjzr73J6tf6y/asiqilqUBMk5K/HRyx8E
	2AatLwvju62GjBQpgfbkPGzzCSjEKuldCTdzwaEBB0KX6klisG3G9LPRv16XB+mbwMxS+WTRUtD
	kL6/yKTzGUIuuwtaGnjZQUetOSaRQ/emGwrQ4h3bIUBp7JCPtS8nXq8tLgIjItw2NsA5KJXUEG2
	w/vQ1Bwaa5CynhgyB8zg32XF+49XWzKeJFq/UX9J4Z4CYWWG0xflbSynx6phOGBzu5M795OZhVd
	0V0Oxu4bu4Xz0kS/OJvUDADx09Kx42wXk6mSTPMtA4HThhsfYPu/mFdBp6WepDL5d25vv6lobJR
	KQRuCz32yDQ=
X-Received: by 2002:a05:600c:3b14:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-485566d5178mr83204885e9.10.1773451930625;
        Fri, 13 Mar 2026 18:32:10 -0700 (PDT)
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
Subject: [PATCH 0/2] Add UCSI I2C transport driver for ITE885x USB-C controllers
Date: Sat, 14 Mar 2026 01:31:54 +0000
Message-ID: <20260314013157.7181-1-edward.blair@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34774-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6B49628B417
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ASUS Z690/Z790/X670E motherboards use ITE8853 (and related ITE8800-ITE8805)
USB Type-C controllers that implement UCSI over I2C. These are currently
unsupported in Linux, causing a boot error:

  i2c i2c-1: Failed to register i2c client ITE8853:00 at 0x40 (-16)

The BIOS on these boards declares two ACPI devices for the same physical
hardware at the same I2C address: a generic UCSI device (MSFT8000) and a
vendor-specific device (ITE8853). The generic device registers first during
ACPI enumeration, blocking the vendor-specific one with -EBUSY. The ITE8853
ACPI device carries the GPIO interrupt resource needed for proper operation,
while MSFT8000 does not.

Patch 1 fixes the i2c ACPI enumeration to skip known generic devices when a
vendor-specific sibling exists at the same address. This is a general fix
that could benefit other platforms with the same BIOS pattern.

Patch 2 adds the ITE885x UCSI transport driver, modeled after ucsi_stm32g0.c.
The only device-specific quirk is that PPM_RESET is handled internally by the
ITE8853 and must not be sent over I2C.

Tested on ASUS ROG Strix Z790-E Gaming WiFi:
  - Boot error eliminated
  - /sys/class/typec/port0 registered successfully
  - UCSI commands complete within one polling cycle (~50ms)
  - USB-C device attach/detach detected with partner enumeration
  - USB Power Delivery negotiation functional
  - SuperSpeed Plus Gen 2x1 devices operational through UCSI-managed port

No MAINTAINERS entry is added as the driver falls under the existing
USB TYPEC UCSI section. Happy to add one if preferred.

Edward Blair (2):
  i2c: acpi: skip generic I2C device when vendor-specific sibling exists
  usb: typec: ucsi: add ITE885x I2C transport driver

 drivers/i2c/i2c-core-acpi.c       |  88 +++++++++
 drivers/usb/typec/ucsi/Kconfig    |  11 ++
 drivers/usb/typec/ucsi/Makefile   |   1 +
 drivers/usb/typec/ucsi/ucsi_ite.c | 285 ++++++++++++++++++++++++++++++
 4 files changed, 385 insertions(+)
 create mode 100644 drivers/usb/typec/ucsi/ucsi_ite.c

-- 
2.53.0


