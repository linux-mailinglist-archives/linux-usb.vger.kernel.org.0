Return-Path: <linux-usb+bounces-37136-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJsnBrj1/Wn5lAAAu9opvQ
	(envelope-from <linux-usb+bounces-37136-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 16:39:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5654B4F7E43
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 16:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0A8D3013304
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 14:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903713502A9;
	Fri,  8 May 2026 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISGHnfyp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBCB3ED5B3
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 14:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778251180; cv=none; b=ROt6aDS9UTzDu6N8ki7etZO/laOrx1DRlT+De8FCIb+2tK6j3oeL0uRGL35nBeOSkZXxnFV9/rmJgkbS4S+IVA+MlN3VuBQySMCzm57LYKBLkcpVWEL5N4/uKBJ1YK46GL5xILugTlL+zzJ/h5u1GmE3Cv92TeVrIooD2NrupNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778251180; c=relaxed/simple;
	bh=CRo+41M0qXiyDrMxBRd9ybpoOu9d/b6QhFbdrm5JsyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SlhI7ZAFyfSqiJpH8vt3t205GpkcqhooE0scMS1xbppQATi1jq35ISmRFAhXODKfVDJTP1SXg/Pow/u3oOP+XpBKDd241EFk1RaWF4L2x12qUBSXp2Kek4Oah8XW5003TgPQrHV9SUsvCVizCnjA2FisvAehRA02KM/tB4NfQ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISGHnfyp; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8025aecc40so975694a12.0
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 07:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778251178; x=1778855978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXdrkYkgPTA26PL0ikladf23kOngeqlDqPwT8C8tFUc=;
        b=ISGHnfypC8TkYLFtcBPjBgtTf/t1/VHlTkBaNu9CxUeh8/3DjOGCSNd0CxfBjBTWla
         FYVR62/Z8jthfzurSzCaxFjKex4hdTGk0U4jskO3EPnZUEleJHuYd55wJ42Rab/aeMgg
         AYZ1P9Wo41umOlANk0PV2BsGljOhHcvfNKf08HOMS7LB5ZrmRy4U+QKnVH7u6YNXNJoW
         1QPLizm83TJiIjhweZzrhEcmqsv7wjHK55U6xSokNskri5tyIKlKUKekUqFgRVYCZeiW
         uqRuly1BQciK35kurXe65+6o9VpIrckq2YUwK15rN0u/FrMw1UcKW2MGHAJcvMYldufO
         C/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251178; x=1778855978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXdrkYkgPTA26PL0ikladf23kOngeqlDqPwT8C8tFUc=;
        b=R8nP22APYWYMg139JjfCeHAFz3SR9UbfQyPGPHtvxPjDaweBvxbpp4dGAtwFH6X6JZ
         dElKKcVZIB7X7r7/71GHVhozNkVrq3A67oyNYFLM2OI4WsdqiNBgevljGA7LjMP74OQG
         8O9m0Twn8V7bVarazjzC14inE2+0rk5yFm+xPkRhQFzXjf3BhJIsupYnDE+Ovicuep9q
         sITDXgCUvlR73NFu98w/wfkato8Cp2ENhlO5QRFD4ScA5UCLBL3jWQIF3SRLKEXbJFPx
         fH9IzUGEL+MDF2vbroGm9elrWz6VlbvN5FP4fjc8c2DWHh7lgx12cP+c5bik3bNaOcS9
         M4tw==
X-Forwarded-Encrypted: i=1; AFNElJ8X/BU459n9tw6s+aeLhd0w8fHhg1s1lgIbgy8DBc9SFIVWygd/L8uY51O58e/eWNd0vk7f2437LOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YygyRCqFRYJtFrFh9jiufbK3uht6sWTCD10FkdYph7Iak/R8mNn
	ONGIzLoxch67JyIP98g4xxaIvwGUx4OegEH/PxcQLUNF/m1FiCa94Jta
X-Gm-Gg: AeBDietqxqPgfvboA3XXpf5poix1uZ30B8428+FRn9gkUXTAvZDIFGZdFGxbemnluJh
	VEkODri1ZDv7+Fs70mdp6BFcAjk5LJJgPJXqvVT01ON7pBLET0TwABzOcreiPU0+ubOPrfcFGNQ
	hM85hmrWCkBFh92SgVLIbvHAUgpjFc7HUYRQer4nEmqnP7FUCBrGnEl3H6Vwn2W/GpaDwen1Tto
	hoFr8H+U1AG7681pybvdT5RFkUDb9nYo17lodY59uQ017PvYyiRbS6ntid4J4dTKhWxFatcDbmn
	6B9V8L5VcyLqRKbjy8cfbOlW3PAkbfvg5nu0aufYRX/l9kIqIdIUAtLAEGwWe5HkrkMh+pzABqB
	lJ4Ch7MqjZXj4IuUJWYzKTlyKXyj5zlqqfQK5ifSUMGw1UOgbMDFflQ8AsJeWw5BvPXjKkmVmTT
	FQYX0y5JADFgUUns/l5xU=
X-Received: by 2002:a05:6a21:3393:b0:3a0:babd:b959 with SMTP id adf61e73a8af0-3aa8beb360amr7436988637.9.1778251177970;
        Fri, 08 May 2026 07:39:37 -0700 (PDT)
Received: from mincom1 ([115.4.79.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm12395499b3a.38.2026.05.08.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 07:39:37 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH v4 0/2] AMD Promontory 21 xHCI temperature sensor support
Date: Fri,  8 May 2026 23:39:08 +0900
Message-ID: <20260508143910.14673-1-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5654B4F7E43
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[roeck-us.net,lwn.net,linuxfoundation.org,amd.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37136-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hurryman2212@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This series adds temperature monitoring for AMD Promontory 21 (PROM21)
xHCI PCI functions.

Patch 1 adds a small PROM21-specific xHCI PCI glue driver. USB host
operation is delegated to common xhci-pci code; the PROM21 glue only owns
the PCI binding and publishes an auxiliary "hwmon" child device for
optional sensor support. The glue is built-in only when enabled, matching
built-in xhci-pci, so PROM21 controllers are not left unbound during early
boot if an optional module is absent.

Patch 2 adds the auxiliary hwmon driver. It exposes temp1_input as
prom21_xhci, does not wake the parent PCI device for sensor reads, and
documents the register access and empirical observation method used to
identify the register pair and conversion formula.

Changes in v4:
- Move PROM21 PCI handling into a PROM21-specific xHCI PCI glue driver.
- Make USB_XHCI_PCI_PROM21 built-in only when enabled.
- Rename the hwmon driver/config/name to prom21-xhci,
  SENSORS_PROM21_XHCI, and prom21_xhci.
- Return -ENODATA for suspended parent devices and invalid raw values.
- Remove temp1_label and the runtime PM module parameter.
- Simplify hwmon remove/read lifetime handling.
- Expand hwmon documentation with register access, runtime PM behavior,
  sysfs lookup, and observation details.

Jihong Min (2):
  usb: xhci-pci: add AMD Promontory 21 PCI glue
  hwmon: add AMD Promontory 21 xHCI temperature sensor support

 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/prom21-xhci.rst |  99 +++++++++++
 drivers/hwmon/Kconfig               |  10 ++
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/prom21-xhci.c         | 250 ++++++++++++++++++++++++++++
 drivers/usb/host/Kconfig            |  18 ++
 drivers/usb/host/Makefile           |   1 +
 drivers/usb/host/xhci-pci-prom21.c  | 111 ++++++++++++
 drivers/usb/host/xhci-pci.c         |  11 ++
 9 files changed, 502 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-xhci.rst
 create mode 100644 drivers/hwmon/prom21-xhci.c
 create mode 100644 drivers/usb/host/xhci-pci-prom21.c

-- 
2.53.0

