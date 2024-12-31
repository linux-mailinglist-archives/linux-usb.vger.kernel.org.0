Return-Path: <linux-usb+bounces-18911-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD369FEF86
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 14:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F7521623A1
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 13:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A2519D8A3;
	Tue, 31 Dec 2024 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BX1TS7Pb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9B219CCFC
	for <linux-usb@vger.kernel.org>; Tue, 31 Dec 2024 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735650669; cv=none; b=MJvFyZXGKBKhwZghezrdzL3gEpTdTSAseYXaohIMAa36cDM/J8OUpYi34TsQqe48CjmfqRRisr255Ft6Huw2QHGz1Y1QPtxIjx8SExKQULAp9WNsC6bWPEKyHND48Hh5PYENFoQkE1mDz8Foq+5B1cHFqhIaF2VDK2d257pDkRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735650669; c=relaxed/simple;
	bh=bf+GukcEVltXNkTKSCrQQDQcHFBuI6bD2HSUYKuGOIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jFiZ+xKZ8KwEmcEVKbPD/I/8DQXuyCXKZIVc6mO8tw1Ay6/4sERh8kVAIrxVUu6N9DIdq5jIjgn3GAnNB+U0pkZCHlLFe1HI0qArJMcTdsBPqc/WhftNh8xymj3XAodSp6nhLUzhjbo6N3rkBHxU9wls/glyl9xrpIJi7zBVgsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BX1TS7Pb; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso1983488a12.0
        for <linux-usb@vger.kernel.org>; Tue, 31 Dec 2024 05:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735650665; x=1736255465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n0k5mVd+fLDtIL8C5inwIWUNpfV6H43E4vdNm1qt9/0=;
        b=BX1TS7PbYPd5fIfy5EGRgUcD+PK7jfNG0jVgDplvRikUAKxjkjRdWE+rNaveN32RSP
         VFfKVaewZcW3dvTD+h+oQYFbd9kwHyMSyFc8CRRb62NR2Yz5hlFyhH+0XXdUaZm3urL9
         ow2nyweFqg+AYcSlHVhvw+aShR4jDXCcdD4yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735650665; x=1736255465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0k5mVd+fLDtIL8C5inwIWUNpfV6H43E4vdNm1qt9/0=;
        b=tRRfFRBnbn5KDoROTBHmGAygVoLzSO96TKCBoewbBir0x4wReuoIG5nAkXYzJKuHHU
         4ouOULu9NQKNzBeIXMkXVPcdeZOM6/SYn9k4UqOekkt4SXfTmquBM/Xg7VyrMJcTW0wC
         qTv8ZUwgcGfFD2x0RuJOmPMGcjbbZu3ef3QXeu3LvoPLH3kepaB/TsDsxNTCnXJwm7AI
         F6RtmXRlYhu/pM0PUm9oHZA4q6H8wYkELqnwn8dIS5sLcKqJDVm4oWwMISKJH1yTN0z4
         v3sPzpw0nMdLalTiFDkkYtGfMcsav60pJMJXtI2dFFK9aGS4kEOI/uZgsn4zWPWtA74c
         xHAA==
X-Forwarded-Encrypted: i=1; AJvYcCU1me1PmKidso2E8iEl6L4ztWs0cSthOuovNdSrM+8uN5c6Gwifq22zcUlNnf6mDLDUgyisATWxdR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwIXNEweHidUJwlrLaP3ZDmgdlMcNJKu26gD5YCkQSSqgXnkV6
	D2/yrBDPlcbmAS9wPuJTZW1s5NvRmxYjrEgWwLR9e09T03nM1IE0ssiw37qirl2pmg8XVLvCgXB
	w4ps=
X-Gm-Gg: ASbGnctN0VqDTCBhG2djRRlPQqTdPIux64Z61Lye5s3VQj9S8Q6bVq+VriwJ8e7AjZ+
	BRC/HIIcNC+EcIJRm2vQc8O+NVrBPOnhDWjupfD9lAEtzxiNZgHP/XHUmDhLxmBSqDw9Uve2GAS
	/+WFjuX0CNmsWNM7lh39eiaE3CjxBnrOKskiv/zDClWEnMEPQp5kMWqB5UPK0aA4k7K5xfAKz5r
	+mMZUGSH1mrQIbhtAzXSCH3a/9TbU3xbmkilNQ8/1vZ6e98yjBWL83/nfsKpb3M4MPcnqEUyc2g
	LJsedwvQcl8xo9aM1yTXfJ+r7mdkoNgHZTRO
X-Google-Smtp-Source: AGHT+IEe+9lDwjXm0earALoLdeE0p8a1dVvo9dnTrYmjVrHTtFQ+RTu1kPyyl+VbzeIPCTmVnxPETQ==
X-Received: by 2002:a05:6402:210b:b0:5d3:d19e:6d57 with SMTP id 4fb4d7f45d1cf-5d81de0669fmr30312163a12.34.1735650664906;
        Tue, 31 Dec 2024 05:11:04 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (60.27.91.34.bc.googleusercontent.com. [34.91.27.60])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679efc9sm15876651a12.47.2024.12.31.05.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:11:04 -0800 (PST)
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
Subject: [PATCH v12 0/2] usb: typec: Implement UCSI driver for ChromeOS
Date: Tue, 31 Dec 2024 13:10:45 +0000
Message-ID: <20241231131047.1757434-1-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
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
Changes in v12:
- Fixed passing of cmd argument (from '&cmd' to 'cmd) to cros_ucsi_async_control()
which caused compilation failure. Verified also that all compilation
failures reported by the 0-Day CI passed:
https://lore.kernel.org/linux-usb/202412240743.tzTftk4H-lkp@intel.com/
https://lore.kernel.org/linux-usb/202412240903.xAqTOQpa-lkp@intel.com/
https://lore.kernel.org/linux-usb/202412241137.ld79A9Iq-lkp@intel.com/
-Link to v11: https://lore.kernel.org/linux-usb/20241210144527.1657888-1-ukaszb@chromium.org/

Changes in v11:
- Updated cancel_delayed_work() to cancel_delayed_work_sync() in both
cros_ucsi_suspend() and cros_ucsi_destroy() in order to wait for delayed
work to finish if it is running.
- Link to v10: https://lore.kernel.org/linux-usb/20241204194900.371696-1-ukaszb@chromium.org/

Changes in v10:
- Added cancel_delayed_work() in the cros_ucsi_suspend() in order
to prevent premature wake up during suspend.
- Added cancel_delayed_work() in the cros_ucsi_destroy() as well.
- Link to v9: https://lore.kernel.org/linux-usb/20241203142314.3892422-1-ukaszb@chromium.org/

Changes in v9:
- Squash "usb: typec: cros_ec_ucsi: Recover from write timeouts" commit
into "usb: typec: ucsi: Implement ChromeOS UCSI driver".
- Replaced out label in cros_ucsi_sync_control() with switch statement.
- Link to v8: https://lore.kernel.org/linux-usb/20241128232035.1525978-1-ukaszb@chromium.org/ 

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

Pavan Holla (2):
  platform/chrome: Update ChromeOS EC header for UCSI
  usb: typec: ucsi: Implement ChromeOS UCSI driver

 MAINTAINERS                                   |   7 +
 drivers/usb/typec/ucsi/Kconfig                |  13 +
 drivers/usb/typec/ucsi/Makefile               |   1 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 337 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  28 +-
 5 files changed, 385 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c

-- 
2.47.1.613.gc27f4b7a9f-goog


