Return-Path: <linux-usb+bounces-37477-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIpUA1zgBmp4ogIAu9opvQ
	(envelope-from <linux-usb+bounces-37477-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 10:59:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AB05454BDAA
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 10:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5CE5930354FF
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 08:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBF5426EBC;
	Fri, 15 May 2026 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwdJwuu3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FB4426D0B
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835485; cv=none; b=nJHREH6lCFub5/PYjAuRUYjecxdI24q9rEPqL6Xz0dLJbbVb6juUWADQn6B4EadGow6A/FfCHSyahvKBA0+cYIS93S3l+rabigh+6cHEj2HQTp4anka7V8o7812jSnkxMeyGu68BuNLz+GK0r7vWokNVJNj5rvQnADOcIdZrAn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835485; c=relaxed/simple;
	bh=dyP4n9uPfOXLtZxIOJmI/uU/nI5UYjP6DCnh6DbN2Hc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XC8qy5UeiehWCfCWFXdu3KDKEOzl5sUP0GvLxRI6IFuLoTXnJVZjosVY1ic+yjaAa2muGVGrMxMnVzefD2Vi7hI3uSbBUjHNDo6oQYw4lbxF1GymAcEn8tUORc+Drms1xUAY5RSNOjsE+MiKU6r99cyZkBc25jn2X8nRlLgVaTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwdJwuu3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bd2c147abaso20569815ad.3
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 01:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778835483; x=1779440283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JI5rbOuDA7OsqPK6rS6KZm2RpgqeyURJ5czLB7dxhv4=;
        b=IwdJwuu3fbspKY4M46qwfE07A8WvFOSz4mMgl34oOxhRdGNhwzqBAkAzgmDJONgcWO
         /rfrYcNtRiGEnyAdrmqYH84LLCQeREjdpE0zwj5994JUXOoj/DAkMppV2j5NZuXIPy/Z
         CAFd7/E9sd+mjo+k5Nh9NvOcNjYIuF/OZ+Fisj83doFwXoSObViUphY97xLhYncQSPUL
         VVtx2JdUsemqY9xKlxSj8mwZz7fPIlHoJFxZea9sY4qW5mhQiYPX7IhVOIB7DpFKo0sY
         igrikZblRT7S9fnn8mpMayBfG/pL35ZYWfBObHkmDZ5RJKXklCdxeH9Bg0OAftjaCVKH
         F+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835483; x=1779440283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JI5rbOuDA7OsqPK6rS6KZm2RpgqeyURJ5czLB7dxhv4=;
        b=WLOkxVg2vj8RXSEKrtaFEJ3gAh+9eFVwXPPbMKDfgA4GAsnWnyWliwfPHALvkDlpuX
         yarFC0MwatKLfQstf5rm6ji/Y462nJKi8wjkDPupbjlCDkl/T0GRuwtLTHvLqGpG3QmA
         iiDHqfri45+riTcG8DKvOp6dshZanFks7JHGYdX7QMHavkyZ6XrB/9nOvIGfNIVD3aTU
         LFARmFV1lFETWm0wlJ+Q6txFHaLVc0cyy0PcjHiL2Veg362PcchaiDRKZhQH5ujn3CR2
         Vx2p169Yvncq7wXgOgc/N3UIkbDE9AQHVtbt2YKYwfscwRZers8BxjZvxLo2uE+hUscl
         Tlog==
X-Forwarded-Encrypted: i=1; AFNElJ9/zaT3ajqWOUWNziS2NN2KiTrmxLYn/xi0BHnJHAEfjgkYI73/gjoFIx/9deyrNLdI1APEh3iNkyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUDtSt8rQ4+8+R5tT4yZq7PcOjzbvcjqjZ9WTbwFn3JgdkVcRG
	s0c8gv9WwWy8IA/i8ndvESP7hRUdKInakclROfYbcXeI0B3AnU68/V4s
X-Gm-Gg: Acq92OHeNl8Pa0aZzqwQWjCaeWhq6B+De+NrBQ/A7xiKwwE+moekAHBogKNbGKPc1Vx
	MjKrLbonbSBHJfaKHTAYrSerIZyNw4MkLI8GpTsZQJC+EUkJ9Td/fMmzSJVZwJRnUlTYcTucrPK
	GTiI5O5pxCYDIjFYvtGrPDCPqshXkjfslx520vz0G2xT78DT0M/mD8bqG87Pkmuf9gd//Qu7Y90
	85Ufnb3h8ZkB+Sp3BD/ocmYqt3G58Y8UTt823EQXdZAFZAdw1v7nfuXqzDRWxSCWVL7FEaWdlQG
	3Lk51ON2BDUsdjNHuXIhUIFxWM2W94uUlIvYtCAo0TR3/jvAelADvW4LZoLpU7hHeIzPWRgLHcL
	/CWEnoI95zgHUGRv5NrboHSWB5vgLmgbh3bWhXFBg2TlzvqsU+7bEmf5qaKBjvZPH+AoIuGgdQ+
	8VSfXHjpgLnel5wbtGTjULcePALkw/2lkfFsPA2DSelNAhWT0m6jttqPbsWNLRryuS5g==
X-Received: by 2002:a17:903:390b:b0:2bd:1903:6ced with SMTP id d9443c01a7336-2bd7e93cf74mr34268585ad.41.1778835482629;
        Fri, 15 May 2026 01:58:02 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe6512sm52249325ad.52.2026.05.15.01.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 01:58:02 -0700 (PDT)
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
Subject: [PATCH v4 0/1] mfd: nct6694: Refactor transport layer and add HIF (eSPI) support
Date: Fri, 15 May 2026 16:57:45 +0800
Message-Id: <20260515085746.114361-1-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AB05454BDAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37477-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0282524688@gmail.com,linux-usb@vger.kernel.org]
X-Rspamd-Action: no action

From: Ming Yu <a0282524688@gmail.com>

The Nuvoton NCT6694 is a peripheral expander that provides GPIO, I2C,
CAN-FD, Watchdog, HWMON, PWM, and RTC sub-devices. Currently, the
driver only supports USB as the host transport interface.

This series refactors the NCT6694 MFD core to support multiple transport
backends and adds a new Host Interface (HIF) transport driver that
communicates over eSPI using Super-I/O shared memory.

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

Ming Yu (1):
  mfd: Add Host Interface (HIF) support for Nuvoton NCT6694

 MAINTAINERS                         |   1 +
 drivers/gpio/gpio-nct6694.c         |   7 -
 drivers/hwmon/nct6694-hwmon.c       |  21 -
 drivers/i2c/busses/i2c-nct6694.c    |   7 -
 drivers/mfd/Kconfig                 |  47 +-
 drivers/mfd/Makefile                |   3 +-
 drivers/mfd/nct6694-hif.c           | 663 ++++++++++++++++++++++++++++
 drivers/mfd/nct6694.c               | 111 +++--
 drivers/net/can/usb/nct6694_canfd.c |   6 -
 drivers/rtc/rtc-nct6694.c           |   7 -
 drivers/watchdog/nct6694_wdt.c      |   7 -
 include/linux/mfd/nct6694.h         |  54 ++-
 12 files changed, 813 insertions(+), 121 deletions(-)
 create mode 100644 drivers/mfd/nct6694-hif.c

-- 
2.34.1


