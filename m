Return-Path: <linux-usb+bounces-37032-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBM/D1un+2lXewMAu9opvQ
	(envelope-from <linux-usb+bounces-37032-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 22:40:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F3A4E03E0
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 22:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97F5C301A53D
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2026 20:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8313AF65F;
	Wed,  6 May 2026 20:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIMjQzpe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EE136164B
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 20:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100053; cv=none; b=rbQMMJ+lpaO/xeBJxpBMoGk0g9lvvIwE4C7dlJXJhxJprunqEwj+hs0vJwHtImsR1Xw3GkT/uUsv/QIBuEZSC87UJ89R9QsOMOligjLkixfuVH9R+UDrFaxruoTzuJIyxVSRfDKmP6krYK3ZXQ2fegrnqd0Rg8KTOnAYgThuzs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100053; c=relaxed/simple;
	bh=N1utPvEcBUC2CgJY2X87EWrYwsuzry0dWKDcX8h66DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rH8Dg43ycFEPE17Ic75qAhDDcelJDW7pYMMtv3UbsGhcKUkAXwyog5ZXPIxxvbksGyOVsTdijevU6XOZQqP5+DNxVeR5O8nKs9QRbgSFjFZH3X6sRMkHOmtxlDKxLYh+bp0IiFPbnw4MNKKHisa0KKiyCnqIS0Y+G+ucv2SqeU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIMjQzpe; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82748257f5fso840111b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2026 13:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778100050; x=1778704850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ab/JEpZ7Fi0qyubDO84DlmrRRJltgbTbtMwqDlljXhg=;
        b=BIMjQzpeeyTopXwFqVsgfksLN2mbJuj1WTDU/RFyIVutzwgeTPvFdDxpkZC6COUobT
         Pva7KSrREIRVb5dPNEdZcuR+ZPGfAEj+TuQc+ssBZT4i1jzCxvhF9GKorY5ADvzXLo4H
         QNG4VH6NadZ2M3fbjI7+sqYdYjhfjGapfRKUSSgJ7hMaV54a9foMIggYjV9km/0hr+Hf
         cWpVabCDnYuqdjsXTgNWX6sUzYqz43gXD3mGX53BIxw4LbbEQxXXfbHBI0BKxHmDxeab
         ZWzPPZZH84U7SGlgv8lH6jwiHj237nFbrIo5mIqU5+iAO4c//z63PkM+Jw3prRWKYTKK
         yetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778100050; x=1778704850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ab/JEpZ7Fi0qyubDO84DlmrRRJltgbTbtMwqDlljXhg=;
        b=o+l2xvW5hYJAPVsgA2mwCv/B3csexCedGntI10FCMHyBoSZwO/8FFqsbwWTn6pwI0z
         WLfJL9EU8ImEd2Zrna5GbkdGU3aA7v8vCKundfAXyObmL2KndmpbOb0GbdwE0YQNNYJ6
         NkyuPuN4AzSwcuWp0QyeSnW+dCDfnbeBsklNjEp2D45H67a4dxbVlz5oFVcv40HDVnlU
         7e2H1FbrLeuisVqIakyTot3xajfdVOWk3V1QbXA09uHf+P20rERSh4EY6oeKvGNeBZGd
         JiBm9sj+/OzRtjsu9EaIsaNtllyW7ifXJOnJ0eo0yrRM6Y2mXb/7f6zGJXEYaENBdEHK
         q+Cg==
X-Forwarded-Encrypted: i=1; AFNElJ9wPoL4tgPLn/jknpIqJytTlTT/te8yD4Pn3wsAGV5w1zdaeBQCq1t1tKcNKLiwBGoFfU+6j0zZJZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKTLHTxZlI7zFhp52XONKQRHd0zp7Q+WC9kcJmocdQFDRoHxg+
	GexGH38zbt0Uyhz+pYUn/OSvbzD9pdA/7JuW1mjQhD9WEqRMFHM3GUpv
X-Gm-Gg: AeBDiesBRb+NoPcCBv9RTr1yAwoKZyCXiF1+NYlfrAiDI7Il6EboZnpJG8Eq12Sl+0C
	DfGNe1PyXi5hXBXkrfcphtgE9JjsuFaEhhPDKTHC3oV9y83/2qWWbsmry+MHjNqwhSY7JFjazqX
	xbLJgzjbm7L2NOK37oXv1Z1MBy8xDKtBRdg58NltAhR+Psfx1+Mkgc0YqYxOsWk9NH8jsvEO/ql
	RReOvbTVAgiaJcTtO2PwUC/ybnwKzwMakLiCjGoA3J4OjrjOP/ZfDyi+WaqO+ZTG06e+P/+mapK
	ILGjwSeR2LgoOJhdygQrLx3At8TGEPkr1JWy/avs6cT1GGg//MYIpSi1I9wPZCkDebWwt5JAqhV
	3OBJ1hc/aqXHUYQ8xiNgP0NuQGA0CewSEhGYiQ0Q+Art6yoc0ZDGs2boE+BEYkGZ/89F9viwjCR
	ZO8OTkTXTvalI2uFJ8Odq0B+SzYHWdst4=
X-Received: by 2002:a05:6a00:3989:b0:837:d331:8700 with SMTP id d2e1a72fcca58-83bb65f40b2mr96595b3a.1.1778100050268;
        Wed, 06 May 2026 13:40:50 -0700 (PDT)
Received: from mincom1 ([14.67.155.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm7952185b3a.3.2026.05.06.13.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 13:40:49 -0700 (PDT)
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
Subject: [PATCH v2 0/2] AMD PROM21 xHCI temperature hwmon support
Date: Thu,  7 May 2026 05:40:32 +0900
Message-ID: <cover.1778099627.git.hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506032939.92351-1-hurryman2212@gmail.com>
References: <20260506032939.92351-1-hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A6F3A4E03E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[roeck-us.net,lwn.net,linuxfoundation.org,amd.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37032-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi,

This series adds hwmon support for the temperature sensor exposed by AMD
PROM21 xHCI controllers. The temperature value is read through a
vendor-specific index/data register pair in the xHCI PCI MMIO BAR.

v1 implemented this directly under drivers/usb/host. Based on review
feedback, v2 splits the support into a generic xhci-pci auxiliary-device
interface and a standalone hwmon driver under drivers/hwmon. xhci-pci
creates the auxiliary child only for PCI IDs matched by its internal table,
currently only AMD 1022:43fd, and the hwmon driver binds to that child
through the auxiliary bus.

The PROM21 hwmon driver registers the hwmon device under the parent PCI
function so userspace reports it as a PCI adapter. The auxiliary driver
still owns the lifetime and unregisters the hwmon device before xhci-pci
tears down the HCD.

I tested register access while the parent xHCI PCI function was suspended.
The temperature register did not return a valid value without
runtime-resuming the device. v2 therefore keeps the default behavior of
allowing a temperature read to wake the xHCI PCI device, and adds
allow_pm_switch=N for users who prefer reads not to wake the device. In
that mode a read returns -EAGAIN while the device is suspended.

Changes in v2:
- split the original single patch into a two-patch series
- add a generic xhci-pci auxiliary-device interface
- move PROM21 hwmon support to drivers/hwmon as an auxiliary driver
- avoid linking hwmon-specific code into xhci-hcd
- add Documentation/hwmon/prom21-hwmon.rst
- document register offsets, conversion formula, sysfs attributes, and
  allow_pm_switch behavior

Sincerely,
Jihong Min

Jihong Min (2):
  usb: xhci-pci: add generic auxiliary device interface
  hwmon: add initial support for AMD PROM21 xHCI temperature sensor

 Documentation/hwmon/index.rst        |   1 +
 Documentation/hwmon/prom21-hwmon.rst |  84 ++++++++
 drivers/hwmon/Kconfig                |  11 +
 drivers/hwmon/Makefile               |   1 +
 drivers/hwmon/prom21-hwmon.c         | 300 +++++++++++++++++++++++++++
 drivers/usb/host/Kconfig             |  10 +
 drivers/usb/host/xhci-pci.c          | 114 ++++++++++
 7 files changed, 521 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-hwmon.rst
 create mode 100644 drivers/hwmon/prom21-hwmon.c

-- 
2.53.0

