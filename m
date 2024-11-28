Return-Path: <linux-usb+bounces-17948-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D8C9DBDE4
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2024 00:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 845A5161B07
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 23:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8451C7608;
	Thu, 28 Nov 2024 23:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SqArhvTn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1D6157A67
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 23:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732836045; cv=none; b=RaXQN4SimKy5tEby9gafPzvjorcAaJiCB2h70UFSNiUNJweXBb3Nd6pu0kGny5HYx6w7XY+y9Yfz1IM68IuHzXOrZhOyT/jvJ5YjyI4t/azfvvKhewFGW/uyDVK+f+vIanpUEI+ru99FG1egIWRfN3Zmi4c9gVxzIv2nnl7uKGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732836045; c=relaxed/simple;
	bh=lxiNofObI94urSiBhT/+wlkU5gUYx+xuzD98kQ6j0Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JWatqy5eqFzS1RmzQQY4uzt2P2OLUFLPymBl8M007py3lxGNCHgdgBLfiHjp5pL7DShtxcaV0moXcMwZ6J6L8CCzbLMkA2fWo5h5kj8OxyXabAXQ3Q68s0ek6QKWKtHnTmyUgJ4Jt9fAbzA51Hz5qTTNoLti7OrHyEEwcHpA/FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SqArhvTn; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9e44654ae3so142336466b.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 15:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732836041; x=1733440841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=auC2lo8gQfwTfS1ngJ+ijdDv/8XNP+DfySFICrPI5bM=;
        b=SqArhvTn41eoi8OPkMSLeU7DOp/9ZfJASyNk2c7gmGB2+cbqx0FO0xL1jhAySlRVky
         tk6UyvEZqsdzp7V6hR4j8bm4dsd7ZwgaukJn7zNX0F3xRyy1ouyxU+hWOCJYE6VxKd1I
         9Aqhb/Kp2DdP4diZL4irhx73F6GgIthVyvSM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732836041; x=1733440841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auC2lo8gQfwTfS1ngJ+ijdDv/8XNP+DfySFICrPI5bM=;
        b=D6CCy9dPW0Mrac/oF0C69POt2brY+Q+GIVF5gA7Qb4AV9sA5/D4Z1gGba1Bh5H8VnB
         rLVit79QHwAhMjf2rZIaqoj3nrfKYftspEQgB3WwbDIxizF3RwVqsry9U7t6ncknqgaW
         +llnV43lAyxQZXFQM3Eh8oCGS++nA79OAmg/qn1q6tU7XCvCUXb2B+PWWQ7mwW7HElkV
         4/i2s01T6XOdcHSApfOgY4f3pe1ZUO4y6xOuILt4zvW5ga4QcnmOjFc+9PvfR8B/wVj6
         DZIxqeHGTODRCJyKhyDJo2Z4+SIyTyhPcel0KDGXGTppU/TGvjZfLBeT1i+yAKLJIoBs
         AI2g==
X-Forwarded-Encrypted: i=1; AJvYcCXqlVz71UExr+FtLVLHK0tdBLufwbeAGIhfreWMCjkioKmYcsPqAlff0dwMeUSgqDTFCQYUHM1qsvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLo4SbI6QMqx1T8jglcqMHAM1GtbJtXDZsOzJ/E71w4lOdD38G
	Lp5gGMlHWDAw3HDSuSnoXOsPhV2nMGUwJp1ZaY/0E2pcjH3EDopYEPP7QGHH
X-Gm-Gg: ASbGncuhUUGL0Jr2FvWEv09WVJzLSIpYFI4Osnq/iCZKwTUjoSohtb8LdMpdv0vy3pH
	ydLau8pSx0Q3shIUN0nMPkOdvK8BidwqQD/5H06MDI9wvi4JRpDqU5RLtm33lIApNX3C6xNwKtk
	njEqdaqUYNtoo7cs1eRugMkTBfwd8rSe9SMaW1Yz0gSDav0VEFivHy2fEs2Zsdw8qEDQ6kH42I0
	k5YoAMtKogKRamk8RQtwzvMYYBC0uHMrctc4FDCHuX124KaJxfdNAvhfbUPYr6EPtcpIXoInQWS
	BDKLMghi5tOyn/zAycWBSB76uyFMvlLuazo=
X-Google-Smtp-Source: AGHT+IETAPwPQGd7rJ7UiDHsLonfFtUB8RwJ/kOjUq9mlLb3P9+j7DJzN58o+OQKZy18qdra2MKpuQ==
X-Received: by 2002:a17:907:7781:b0:aa4:a814:3f69 with SMTP id a640c23a62f3a-aa580ededf1mr704229466b.4.1732836040808;
        Thu, 28 Nov 2024 15:20:40 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d5672sm110757566b.77.2024.11.28.15.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 15:20:39 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v8 0/3] usb: typec: Implement UCSI driver for ChromeOS
Date: Thu, 28 Nov 2024 23:20:32 +0000
Message-ID: <20241128232035.1525978-1-ukaszb@chromium.org>
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
Changes in v8:
- Set .sync_control in cros_ucsi_ops struct to point
to ucsi_sync_control_common().
- Added explanation why complete() is used instead of resume()
in cros_ucsi_pm_ops struct.
- Updated s/miliseconds/milliseconds/.
- Link to v7: https://lore.kernel.org/linux-usb/20241115155234.1587589-1-ukaszb@chromium.org/ 

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
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 338 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  28 +-
 5 files changed, 386 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c

-- 
2.47.0.338.g60cca15819-goog


