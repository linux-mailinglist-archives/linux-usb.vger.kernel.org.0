Return-Path: <linux-usb+bounces-38003-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JBZJqcHFGq6JAcAu9opvQ
	(envelope-from <linux-usb+bounces-38003-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 10:26:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0067B5C7B79
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 10:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB4243026300
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 08:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5836B3E1729;
	Mon, 25 May 2026 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbdoETWZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112FA3E16AC
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779697274; cv=none; b=a6LnbTEwI1MtcDkscuw5wKZ+jmgtptIyabkKT0kCJYyUgorVbhreQ9KI9pwISH4kbdLUmSaxHy2ibwLIDvX+bD1h9LCuj74S2LjCSfD6RVoOQqJEDeqoBoc+VePaUp3rXPpzUH/+YJwfsYLqiMMG95te3rRekgjb4TnEzaLPcBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779697274; c=relaxed/simple;
	bh=cnpeNyrRTMfn71Iw1My7ZiOgcb+W5DMHV+tEtk3Jprw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=guYqEKJNY/i3c1bc+JeNT1LRFCL0Tq1oT124J+9rgdPlPmg7KLIesPTff+KK1y7f6flb3nkdVdigm3SvUuQ+X29Xy+/PF6NSTyBE0buV0rCky+smXw0wAjnpg8lmTp6kDcfRXraiFuCnrFVKIgfF7s1KTBt76pvS4+yLZob8L4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbdoETWZ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c80167f56cdso4079508a12.3
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779697272; x=1780302072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h73HPPR4b8cE2zhlXM66PdYigBOxMozGSruLRQEyEiQ=;
        b=MbdoETWZnVu54cAdDYI+IcH7dP3KiMFUYIRxUXnG2Ab/xV7Ss0URUFR6Odm+pBRpqf
         PekTC9McdvzdVJcyapSELOrilu+qAdhIZMQkgfX3bzBJJlSpBT6lOJBe5RnBY06WK+t2
         XcXOt6hEq2rJaZMJP1daWYE41gC3xYCUUWXRW9vF3PdL7iu5fQyrjtJypt/BqxaRC2nl
         ltjyta0KdmPnzj7zUjF65Er4+TvQHtZi3QA19E1SbY1lC9pjbtnhxyP5GQQTFBDbLZcw
         D0wII5njH1rwFNM3iByK1cDPDckSOx6/yR5JW5IADz2NYgTq+koaLTdKR4mlCbSeRsuj
         1bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779697272; x=1780302072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h73HPPR4b8cE2zhlXM66PdYigBOxMozGSruLRQEyEiQ=;
        b=V9ouNaIzgXFyEDabK7q96kNATKUgW8lXSg3peokep/4AxW5mbgHbSoPrebCNE0CpOB
         V60HZ4GSbLNyrCiRe5sO8qKf/BpzwB3Q50WhUPfZ+r73ZrQPjQ2i8fCA6N98iFeLL8az
         k9uDzeycNszPtvsbibn41Skz1Lw7NpJEsxge7fEQWbqUvdvqPcoD3bHhqiQppgHTEUKb
         6DBYcDKIM5uX2DGxyR4odx3qZAfu5LFKNSRiKS1F4FFlsBi4TSQYkUpoyEbJVSkVZt9B
         InDXg5McFjh/zXMSt4ce03p9zkyn4t0c7uI+pDtGf5Szz8+7vXok07FmwbVCXjLG4WnL
         DE6w==
X-Forwarded-Encrypted: i=1; AFNElJ9SQBWiIUuXjBsr4HjZ6CTuyaEFEFyjXQxTsLeUuAPGdsLFuZxHua1E5JzJSH2cWOV7dZeDlyH11PE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlbpHX1u0u9oVQPjO9cslkI1XvDlhS76h5Wpm05fuYxsXj49XK
	s/l7TAy0Jaht7R7rxgVc1hGVLJPBgEyE0Xg1ausoIK0cm5vfdmrBxD19
X-Gm-Gg: Acq92OFgw0a7MbmLFU4QkG00jAlSNKy7Kdof0jstGaB9dFn/TLvAYzejrZ42hDVzq6t
	Zieywl2qUS5pj+irFQTTOvpwn16ZfUVjp7jO1rnOukpPOGCAUJXO140tURt6ZTk4ZoXY7jJScvK
	nE+k6HT08o4IR1GzrqYAfBoHovTCyk/i49mt0yNCFgclRLcocxrIqQHM1z7KQ3XTIl3Y2QGyjbJ
	GBc+nwBxb3MNEMUFKzoglqkRv8ie/tU1M05CnrkQI0Xo9b0V9XbBjmLFWKqC0YHyzAR9UTVPeq0
	WZkDE5O+IvNpD3r/10K0CtU4LtoRahDWVUAPjSSz4B1nJ8QCsymk7X0K4isjzWFyauagI1sGakQ
	c1ghaCO0SW8G8h3ShIXuGR8VX/TwIhB4QjHWV5JO43mgInmHOHwXfYvLVrAvRozwogjz+C9fbbe
	+WxtBcnuJmCVjUgO0fDFU5z6XVmIIPAIJmlNX8GVb2G52Di56gY/5LIgEvpbeE8PGoZg==
X-Received: by 2002:a17:902:e74b:b0:2bc:7d09:dcef with SMTP id d9443c01a7336-2beb06bc155mr153249445ad.29.1779697272248;
        Mon, 25 May 2026 01:21:12 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b3bb6sm88798165ad.47.2026.05.25.01.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:21:11 -0700 (PDT)
From: a0282524688@gmail.com
To: tmyu0@nuvoton.com,
	linusw@kernel.org,
	brgl@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	mkl@pengutronix.de,
	mailhol@kernel.org,
	alexandre.belloni@bootlin.com,
	wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v5 0/7] mfd: nct6694: Refactor transport layer and add HIF (eSPI) support
Date: Mon, 25 May 2026 16:20:49 +0800
Message-Id: <20260525082049.2906283-1-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-38003-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0282524688@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0067B5C7B79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ming Yu <a0282524688@gmail.com>

The Nuvoton NCT6694 is a peripheral expander that provides GPIO, I2C,
CAN-FD, Watchdog, HWMON, PWM, and RTC sub-devices. Currently, the
driver only supports USB as the host transport interface.

This series refactors the NCT6694 MFD core to support multiple transport
backends and adds a new Host Interface (HIF) transport driver that
communicates over eSPI using Super-I/O shared memory.

Changes since version 4:
- Split the monolithic refactoring and HIF support patch into a series of
  smaller, logical commits to improve reviewability and adhere to the
  single logical change principle.
- Decoupled USB-specific data into a dedicated 'nct6694_usb_data' 
  structure.
- Abstracted device I/O operations by introducing 'read_msg' and 
  'write_msg' function pointers in the core structure.
- Renamed the existing driver to 'nct6694-usb.c' to strictly identify its
  transport boundary, alongside Kconfig/Makefile updates.
- Extracted transport-agnostic device management (IRQ domain setup, IDA
  initialization, and MFD cell registration) into a standalone
  'nct6694-core.c' module.
- Added the 'nct6694-hif' eSPI transport driver clean on top of the new
  core abstraction.

Changes since version 3:
- Remove redundant module type macro definitions from sub-device drivers
  that are now provided by the shared header <linux/mfd/nct6694.h>,
  fixing -Wmacro-redefined warnings.

Changes since version 2:
- Restore per-device IDA and mfd_add_hotplug_devices()/PLATFORM_DEVID_AUTO
  to avoid child device ID conflicts with multiple NCT6694 chips.
- Validate irq_find_mapping() return value before dispatching IRQs.
- Check superio_enter() return value in nct6694_irq_init().

Changes since version 1:
- Reworked the Super-I/O access helpers.

Ming Yu (7):
  mfd: nct6694: Move module type macros to shared header
  mfd: nct6694: Refactor USB-specific data into nct6694_usb_data
  mfd: nct6694: Introduce transport abstraction with function pointers
  mfd: nct6694: Rename static I/O functions with _usb_ prefix
  mfd: nct6694: Rename driver to nct6694-usb and update Kconfig
  mfd: nct6694: Extract core device management into a separate module
  mfd: nct6694: Add Host Interface (HIF) eSPI transport driver

 MAINTAINERS                              |   2 +-
 drivers/gpio/gpio-nct6694.c              |   7 -
 drivers/hwmon/nct6694-hwmon.c            |  21 -
 drivers/i2c/busses/i2c-nct6694.c         |   7 -
 drivers/mfd/Kconfig                      |  38 +-
 drivers/mfd/Makefile                     |   4 +-
 drivers/mfd/nct6694-core.c               | 136 ++++++
 drivers/mfd/nct6694-hif.c                | 529 +++++++++++++++++++++++
 drivers/mfd/{nct6694.c => nct6694-usb.c} | 185 +++-----
 drivers/net/can/usb/nct6694_canfd.c      |   6 -
 drivers/rtc/rtc-nct6694.c                |   7 -
 drivers/watchdog/nct6694_wdt.c           |   7 -
 include/linux/mfd/nct6694.h              |  63 ++-
 13 files changed, 821 insertions(+), 191 deletions(-)
 create mode 100644 drivers/mfd/nct6694-core.c
 create mode 100644 drivers/mfd/nct6694-hif.c
 rename drivers/mfd/{nct6694.c => nct6694-usb.c} (62%)

-- 
2.34.1


