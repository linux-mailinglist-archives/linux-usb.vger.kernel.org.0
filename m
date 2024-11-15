Return-Path: <linux-usb+bounces-17621-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B980A9CF1ED
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 17:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE8CEB430D2
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 15:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12CA1D54FA;
	Fri, 15 Nov 2024 15:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F4E+gs9O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0301D47D2
	for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2024 15:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731685963; cv=none; b=Gc9l3+yp9iFCWmm79aPa6yeGBLx14dw0uiHBvkkkh0QqzxC89ROphK4KMVxBmFjFv2DoUvsMYakfBNWmdUpkmA1LUV7+00NenuEQj6ocIeQAjKtP3oH7MYmL9GuNKhhdGrC7NcE7NWf63lP71xtq3ZlNTKHZnwRqROonXIoOzeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731685963; c=relaxed/simple;
	bh=H17BZuibZEbgHVwLv70jSQBoM/iJtikYd8BFY+32w1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pt5rSS1StlGTBVwlnI397OmZQd6RgGxUR1jKzHXDjT1waWDCWNQHrFEoz/AF4pko7GNYO+Gat9TCgGdmiathC+bRnt3mkpK6xohmKBrCF037PzU+S62YMDWM68SPPwZO/A76tpElEmVn6vNK3IjXna5C/NinU45xf6/Ft9kbEjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F4E+gs9O; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a4031f69fso301847166b.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2024 07:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731685960; x=1732290760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SM5VxVoDVFnDSYem6y5qbKOY3ILSrxsrmhZYEaBJqDY=;
        b=F4E+gs9OhrqMxys76hilmhXiOUUN3FANGORmmtBH9++jJKDm8Dzahn7cUX0i6M0JcK
         acgD257HsphemcPXVh/hTFsDEZKlZLa0U/TYsle2ecFGI3oFTe7rIvt/Z459LRz7G45h
         qSPsgt7FIbqPxNo4a70qMVI0zVxNLYum+R4wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731685960; x=1732290760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SM5VxVoDVFnDSYem6y5qbKOY3ILSrxsrmhZYEaBJqDY=;
        b=eYDA1gnGspSM8vNnX2g1fv6XX9ck7KyiVZAUgUkey0wndEgmbdMM0tkWnV9aeixFU+
         YjKHidi7pIaHAtoDoxLGCVdAxWIwodpy1UzgXXLWcYHAnFQ2x1CohM4h02QOlhlvE/gH
         80tYv/AtTriFkJgi5Ny/G+U4l7RVH1s149wKzWmGTkkFwDESs8AnQkeQ/Yc9zMlKF/sK
         DiGsIkn3Qi34JdTHyQ49QcgM5Xw1SkP5Kco0Lim4EMBJ+pGorqHka7DjuH508M6/DPrM
         ltaJbNnei+8bZEHoivA+T0LNQs6eWWemo8Cl3DrXmYJQAUoWz1xOZHSYJH8zWvnWg7xa
         7fvg==
X-Forwarded-Encrypted: i=1; AJvYcCUUYTASZ1MMjdh+aXaIeJ6HVuxGQrStUs9u5M0jxRAksbmA9f6TghZHGajAIAL59L0SvLXSJJ1IUNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YymOHSvLc2k2y865r+dsfmIjCtXWfCbNHTvunC9U5N1Aw8kz63r
	XL8S82Dsd37Ovk3X2ppSdpRFFsosdh+Lb4kRsXVhtSNvw/XunWnB5wqscomR
X-Google-Smtp-Source: AGHT+IGaBUhGHis6dz6P0L7QR+cy48R8R6NQqmzJu8uXBchhAvz0hMLhelT0qh5Cy5g9+a+848cLhw==
X-Received: by 2002:a17:906:eecb:b0:a99:ecaf:4543 with SMTP id a640c23a62f3a-aa483483e45mr286490066b.25.1731685960109;
        Fri, 15 Nov 2024 07:52:40 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e086244sm187758166b.177.2024.11.15.07.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 07:52:39 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v7 0/3] usb: typec: Implement UCSI driver for ChromeOS
Date: Fri, 15 Nov 2024 15:52:31 +0000
Message-ID: <20241115155234.1587589-1-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
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
Changes in v7:
- Dropped the following commits for now as I want to focus
on upstreaming cros_ec_ucsi driver first. Then I will get
back to the topic of trace events and netlink:
  "usb: typec: cros_ec_ucsi: Add trace events"
  "usb: typec: cros_ec_ucsi: Add netlink"
- Squashed "usb: typec: cros_ec_ucsi: Use complete instead of resume"
into "usb: typec: ucsi: Implement ChromeOS UCSI driver".
- Added "usb: typec: cros_ec_ucsi: Recover from write timeouts" commmit.
- Added usage of common functins ucsi_sync_control_common()
and ucsi_notify_common().
- Commits:
  "platform/chrome: Update EC feature flags"
  "mfd: cros_ec: Load cros_ec_ucsi on supported ECs"
  "mfd: cros_ec: Don't load charger with UCSI"
landed in the tree https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next    
- Link to v6: https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@chromium.org

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

Abhishek Pandit-Subedi (1):
  usb: typec: cros_ec_ucsi: Recover from write timeouts

Pavan Holla (2):
  platform/chrome: Update ChromeOS EC header for UCSI
  usb: typec: ucsi: Implement ChromeOS UCSI driver

 MAINTAINERS                                   |   7 +
 drivers/usb/typec/ucsi/Kconfig                |  13 +
 drivers/usb/typec/ucsi/Makefile               |   1 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 329 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  28 +-
 5 files changed, 377 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c

-- 
2.47.0.338.g60cca15819-goog


