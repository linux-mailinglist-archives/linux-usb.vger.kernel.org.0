Return-Path: <linux-usb+bounces-14889-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4A97324A
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 12:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 551AA2899EB
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 10:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482D41917E2;
	Tue, 10 Sep 2024 10:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SeMikXsx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9E718FC9F
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963339; cv=none; b=J+b1jYNGWzdKDGQ3j5Np4UexS8zuMz8WFEEARQpRGnEQS1K5iLZiAVyLiPRWIGd4GXuDX0AXtNIOG9xtKRJiAZiYVnufmH08hMvtsg5Fs90NUSiD7MtGTfTRbI7wcmxQu/6zFz+79vMvUVgehc5mhIqpAoXr5Lye9bq5sTeNk/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963339; c=relaxed/simple;
	bh=FZ9ezYeJt5a6b+Z3I3vwss2oeGa/KPGnUnlACEjPjOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NhS2UWf8xsTm97nX0FeuOSiZm11+cMAxOWrQ52/DBE45Mrh/bVKd4axaMvIH8sx9Vbw+8PWMCgwGhgGIL/Jmx31Kw4X7PfaFcCNuuRP2gomihMN7cJYgfmQPw+PvNtoECw8QEMY17hMGna/gH8fPx2Eyk53YZ0vfkyoMdG30GW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SeMikXsx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c255e3c327so5789222a12.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725963336; x=1726568136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yLF6tmAB1/QRpEiLm9OO64ukpnVsCuBmOKFxt4qPONA=;
        b=SeMikXsx+huz8jPtgQG7aUU2izHSuIZL9P0yvOPPSLwldq0bSqZQ44Lpp9AAkYkRiI
         7M//FXLOSJ3WLsX0W7gkykF8y8i02FFTC814y7hwfe7Bhr0FQ8pVkjnJs+u0ss9mLp84
         oigXCqelbHfhmOm4ZM9XBft6vSQEruDpMBUUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725963336; x=1726568136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLF6tmAB1/QRpEiLm9OO64ukpnVsCuBmOKFxt4qPONA=;
        b=t+iNsvTYaz5MkRSXqay48EL3abgS4+teVrXR1Me0uHjSUyVJlCUs3QO/nCkGwrA/sy
         Mq3kJ59XzVRKEbQBk5ZyW1fNCPnChJaQhU3ae2wvmjuSIqnukTT9kUqJjZtQCSiB5StW
         PBaa0f3Sq+ncNyupzLlcR4L2hfUP3SFDeYYy8kqoQ9sd4Rl7ZtgoyodCRdkdSi01W0OS
         VSpLxe80WUb+zWTZVxK0Vsjm1Tu5x1YvY/U8FWKcEFbehmUmKtugPrXWjUpTgPBHodg/
         Xlp8EFc42AUCc+8Geyu+V80FRc/YwU+5861G+VnMcCrw+HSZBS75BlqHKDwXBFowQqU0
         qTyg==
X-Forwarded-Encrypted: i=1; AJvYcCW54MRlk4zeaQfeRCFLMIuCcRk7KA8MuXyekMjyYzJpEMm9zbPBmpnWdDXHuB39rEV2O7FCZnKwABU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI2Zx7VjYZ5iju2sqNgTKoq3Ut3jQOv4Td8ObVoAIcE8SRA2L0
	/D17Vbfs/4YpNTD9CtUF+pHV4lrhYCxvJoWXb5gGKpNMZfvFYRg3OBHy/12w6vVAfzbfgpFUblv
	z
X-Google-Smtp-Source: AGHT+IEQexjbD8PkgFBnUvDyJzo9P3yeHw4QzYeSgwrKgmsNx/g75FRl5ueIUndBV+gsleoeDxyzmw==
X-Received: by 2002:a05:6402:50d3:b0:5be:cfb1:ceb8 with SMTP id 4fb4d7f45d1cf-5c3dc78dce0mr8513973a12.13.1725963335526;
        Tue, 10 Sep 2024 03:15:35 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd424f0sm4075401a12.7.2024.09.10.03.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 03:15:35 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v6 0/8] usb: typec: Implement UCSI driver for ChromeOS
Date: Tue, 10 Sep 2024 10:15:19 +0000
Message-ID: <20240910101527.603452-1-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series implements a UCSI ChromeOS EC transport driver. 
The ChromeOS EC is expected to implement UCSI Platform Policy
Manager (PPM).

---
Changes in v6:
- Reverted to type names uint*_t in cros_ec_commands.h in order 
to be consistent with type names used in other parts of the file.
- Updated comments in cros_ec_commands.h related to UCSI.
- Added missing sign-offs.
- Fixed memory leak in cros_ucsi_async_control() by moving
ec_params_ucsi_ppm_set request buffer to stack.
- Replaced cros_ucsi_read with cros_ucsi_read_cci in cros_ucsi_work().
- Updated changes in v5, it was missing information related to
commits addition:
  platform/chrome: Update EC feature flags
  usb: typec: cros_ec_ucsi: Use complete instead of resume
  mfd: cros_ec: Load cros_ec_ucsi on supported ECs
  mfd: cros_ec: Don't load charger with UCSI
- Link to v5: https://lore.kernel.org/r/all/20240903163033.3170815-1-ukaszb@chromium.org/

Changes in v5:
- Increased WRITE_TMO_MS to 5000.
- Replaced DRV_NAME with KBUILD_MODNAME.
- Added comments for WRITE_TMO_MS and MAX_EC_DATA_SIZE defines.
- Refactored cros_ucsi_async_control() to dynamically allocate memory
for a message to EC instead of allocating the message on stack.
- Replaced type names uint*_t with u*.
- Removed ret variable in cros_ucsi_work().
- Updated ucsi_operations interface to align with changes introduced in
  v6.11.
- Replaced test_bit() with test_and_clear_bit() in cros_ucsi_work().
- Updated EC feature flags in commit "platform/chrome: Update EC feature
  flags".
- Added new commit "usb: typec: cros_ec_ucsi: Use complete instead
of resume".
- Added trace events in commit "usb: typec: cros_ec_ucsi: Add trace
  events".
- Added netlink in commit "usb: typec: cros_ec_ucsi: Add netlink"
for debugging and testing puropses.
- Added new commit "mfd: cros_ec: Load cros_ec_ucsi on supported ECs".
- Added new commit "mfd: cros_ec: Don't load charger with UCSI".
- Link to v4: https://lore.kernel.org/all/CAB2FV=6We88NrvN8NZYt8NkMFH9N_ZBGyUWVUpGwPdja2X_+NA@mail.gmail.com/T/

Changes in v4:
- Setup notifications before calling ucsi_register.
- Cancel work before destroying driver data.
- Link to v3: https://lore.kernel.org/r/20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org

Changes in v3:
- Moved driver from platform/chrome to usb/typec/ucsi.
- Used id_table instead of MODULE_ALIAS.
- Split EC header changes into seperate commit.
- Fixes from additional internal reviews and kernel bot warnings.
- Link to v2: https://lore.kernel.org/r/20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org

Changes in v2:
- No code or commit message changes.
- Added drivers/platform/chrome maintainers for review.
- Link to v1: https://lore.kernel.org/r/20240325-public-ucsi-h-v1-0-7c7e888edc0a@chromium.org


Abhishek Pandit-Subedi (2):
  usb: typec: cros_ec_ucsi: Use complete instead of resume
  mfd: cros_ec: Don't load charger with UCSI

Pavan Holla (4):
  platform/chrome: Update ChromeOS EC header for UCSI
  platform/chrome: Update EC feature flags
  usb: typec: ucsi: Implement ChromeOS UCSI driver
  mfd: cros_ec: Load cros_ec_ucsi on supported ECs

Łukasz Bartosik (2):
  usb: typec: cros_ec_ucsi: Add trace events
  usb: typec: cros_ec_ucsi: Add netlink

 MAINTAINERS                                   |  10 +
 drivers/mfd/cros_ec_dev.c                     |  25 +-
 drivers/usb/typec/ucsi/Kconfig                |  13 +
 drivers/usb/typec/ucsi/Makefile               |   3 +
 drivers/usb/typec/ucsi/cros_ec_ucsi_main.c    | 346 ++++++++++++++++++
 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c      |  87 +++++
 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h      |  52 +++
 drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h   |  92 +++++
 .../linux/platform_data/cros_ec_commands.h    |  60 ++-
 9 files changed, 684 insertions(+), 4 deletions(-)
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_main.c
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h

-- 
2.46.0.598.g6f2099f65c-goog


