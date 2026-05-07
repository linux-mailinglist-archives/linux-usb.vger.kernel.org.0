Return-Path: <linux-usb+bounces-37052-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGW2DOYH/GlkKAAAu9opvQ
	(envelope-from <linux-usb+bounces-37052-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 05:32:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF5D4E2A23
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 05:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3885A3028B27
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 03:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333B18460;
	Thu,  7 May 2026 03:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luqXzygQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2375B2D876F
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 03:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778124743; cv=none; b=fyaPYqFBlRM9O1/eujBWAlabBNxmy9ULuMbVxBf1Vrrmwki3k582hWsyecj8ybCWca9Eb7dxDO1RjfNemLphmnMlqLdWVfXsYGP3ZyOUeSNVKPfSiqJT1OTrZ9JB5ejGUK2JYmA8Bn/ol0tUMg7LsqaXFS7+B8Puzfei/jJxyv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778124743; c=relaxed/simple;
	bh=GXflDZZtOj++0sRst0xKUH830AVIhbrLZYn/7oCG1YI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJxdZaKvpgqMBvBWtmyl1mPH8aXZz7xt6dhPDSIncuJtB6hu8BOYi3lpd1np25tfVpJl76SHsnXQvFvkrpB8MSrPaRe7OHwub6rQMdWP/ke3QTSLv3GGxSciIAXtJBFZxx6+Ei2Y/ooggKIb0zqVYxdYQs8O74TnrrqF9R2F45w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luqXzygQ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-837b39eb078so200942b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2026 20:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778124741; x=1778729541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VhP1DpEaR3JO7WzlQe2Tdq2/A5+ePt/o60+NrBJM7o=;
        b=luqXzygQvDDqQO6JKgJeh8+erGDIEh/0uGuXD79oS+mm46+HPKEtLo/P0w8IkuSmY7
         5lvj1MAcNM8vKTH+km062J07QoupRDeHMcKE/U/yzoX7a0/6PuNlxpDV5j4bwNYiG+XE
         8ywAqTbAqDAffoI1K3ONp1PNHVzcIq7iIB9Jz8no2uRt0u+dzqcNiJx/4MN1SbJDxDFv
         7wiKoGphgQXlLh53TEdOAMnYmmRzFLB2ivVIJVHZB6FKAS3EYTb5JS32U/pc92kZrrxK
         Gmh2WVhf8sUuEOWEJ1bF98JLq8E3j9PhXlCRu025wU4WzQZpemAoX0SbI+FJks/dCUqf
         TJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778124741; x=1778729541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VhP1DpEaR3JO7WzlQe2Tdq2/A5+ePt/o60+NrBJM7o=;
        b=cvPMVKwoiL8H1t1dsyMMHRkD/izeHQT30U1c4V1v6f8fxNww7o7nnSvrvpavJuX0V1
         vR4M1B6nSPDcWxhiH11dnCwTeBEGeQG09s/F6HdnqsuTwAOBvsM3ay+PaXz4IvL2FS05
         oGgNNK9SJJstrfPnkukiqiuV2vbcp32a1/XpzfULYCIK1zRTI9I2G5lU+oXRPJJQohwn
         yV4+UcEVbDptyT99IpAFzgaVUVsv2FliP6j0eIV7HP5eul+66OhF/Z6sShVFPKmvYUYG
         zKUPYti+BfU/vinMhefs1h2Cl7O0ythLCunEW55GGktq1fONIiai2l0GxxtKnLViQXJC
         o3Lw==
X-Forwarded-Encrypted: i=1; AFNElJ8yr4bfHrosaheDz9zym1DbvYyzpGow7/3U41//+dfuXivX7rk3aMn43CZrWO2+tiTJdz4sYnojxq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSrBBMlSUMAKAbmNJpcC4S4qyyc1FzaG1/eIgRfyc6SVHY4e7z
	w+y6Hz3V+TUat22bfiPP1zA5IKuqz8nXprQoX7LYoXTJxy8Q4JZeOLPr
X-Gm-Gg: AeBDievxu3GGa7FLSYh30ltcxclvI0ZQ7sUYqwxNFdhN2Wp0gMC+eni/3442dgTFzwa
	FyNv96mIe0Vio73kCdJYjIZkWP/hLikoPfwiGKoRC+ZXp7iQnGaKiOcx9OPTHvfx2aamx8MW94E
	6gwERTHbzfHDyeUIkgvAyW5ehqPT0dVtaMm7j8P7Aqvgjds7oLohDYlsZ28XT5iKp8myMzLJKke
	adzyLOl4uvlpcbvvcGM4t3X9kR013tLsOSFtO7yyyVG78XKd1VUQGX3Hxy03uvd85D7hPu3jYJU
	xeOTfHeZBDQvf+bQJ1eYt/aBMQK77FvPGjuuSPA9jxgDQwstJHJ1EfsWLOwbzJ9L/Qd2Al/EqL4
	VV43ObpPBPa/Ac2SvJlKiOyJsTW2Mbb6qKrLrcgOej3vW2EYm9IJkWPvjrLl/v+YPXxBUH8sOYG
	7qhiRCAhdseLom4YtEotokk6lAPibT2CM=
X-Received: by 2002:a05:6a00:198c:b0:82c:b808:4c59 with SMTP id d2e1a72fcca58-83a5ea3fe9bmr5893529b3a.46.1778124741306;
        Wed, 06 May 2026 20:32:21 -0700 (PDT)
Received: from mincom1 ([14.67.155.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a103esm9171580b3a.51.2026.05.06.20.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 20:32:20 -0700 (PDT)
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
Subject: [PATCH v3 0/2] AMD Promontory 21 xHCI temperature hwmon support
Date: Thu,  7 May 2026 12:31:57 +0900
Message-ID: <cover.1778123510.git.hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BDF5D4E2A23
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[roeck-us.net,lwn.net,linuxfoundation.org,amd.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37052-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi,

This series adds hwmon support for the temperature sensor exposed by AMD
Promontory 21 (PROM21) xHCI controllers.

Patch 1 adds a small generic auxiliary-device registration path to xhci-pci
for selected xHCI PCI controllers.

Patch 2 adds the PROM21 hwmon driver. The driver binds through the
auxiliary bus, reads the PROM21 xHCI temperature value through the
controller MMIO BAR, and exposes it through hwmon.

Changes in v3:
- Use pci_match_id() with a plain struct pci_device_id table and
  PCI_DEVICE_DATA() for the auxiliary device name.
- Remove conditional compilation blocks from xhci-pci.c and guard the
  auxiliary add/remove call sites with IS_ENABLED().
- Use the full AMD Promontory 21 name in commit messages, Kconfig help
  text, and documentation.
- Document the PROM21 chipset IP relationship to AMD 6xx/8xx series
  chipsets.
- Change the default hwmon read behavior to not wake the xHCI PCI device.
  Return -EPERM when the device is suspended, matching the amdgpu
  precedent, and keep pm as an opt-in module parameter for runtime PM
  state changes during device memory access.
- Keep Documentation/hwmon/index.rst sorted.
- Small refactoring: remove the duplicate PROM21 PCI ID check from the
  hwmon driver and use the hwmon device name as the auxiliary device
  suffix.

v2:
https://lore.kernel.org/r/cover.1778099627.git.hurryman2212@gmail.com

v1:
https://lore.kernel.org/r/20260506032939.92351-1-hurryman2212@gmail.com

Jihong Min (2):
  usb: xhci-pci: add generic auxiliary device interface
  hwmon: add AMD Promontory 21 xHCI temperature sensor support

 Documentation/hwmon/index.rst        |   1 +
 Documentation/hwmon/prom21-hwmon.rst |  86 ++++++++
 drivers/hwmon/Kconfig                |  11 +
 drivers/hwmon/Makefile               |   1 +
 drivers/hwmon/prom21-hwmon.c         | 293 +++++++++++++++++++++++++++
 drivers/usb/host/Kconfig             |  10 +
 drivers/usb/host/xhci-pci.c          |  83 ++++++++
 7 files changed, 485 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-hwmon.rst
 create mode 100644 drivers/hwmon/prom21-hwmon.c

-- 
2.53.0

