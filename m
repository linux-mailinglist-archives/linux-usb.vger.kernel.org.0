Return-Path: <linux-usb+bounces-18291-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5379EB3C6
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 15:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9715C164B60
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 14:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B7C19B5A9;
	Tue, 10 Dec 2024 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y605swgZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A25DB676
	for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2024 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841942; cv=none; b=MgEc0ETvPBACNjoa8lCe9gsG2O4bZsez86XWhiP6myyhIw9q2U1bcfFFs37JLLseD6sRic+oJp9suZ3RxOSOkpWhfW+htX9MYypW8vDfYi5nwXPBZVB5mOFrHQbvjwNjIC8vcLESvDSNucVfE28KEw5AaF7qKWvowM72ObVI6WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841942; c=relaxed/simple;
	bh=NPi/4AlaJkSIeLQGC+XiqTxGvGTwWJnpv5WQvkXTK8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FQoNcLA0fLxILcZBl1ZiNBq1nMaQXzHnGHXn7P3m0Y9dKO5MhgApIay8NsOTFPDinx/jEAIbWussxV/CdH8CdH2rv0wjbLzUEKwl2akZ6ycTGP4y1N26Mzyhq1eZkRO2amQSI7l6kWIkh1HmfroyNWX6JJyKm1aRsM9L2dvMF+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y605swgZ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa68b513abcso382622766b.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2024 06:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733841939; x=1734446739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+oW39J4O7Decd6iUb9vyPOtj+lmZctRYD0s4SZ/f2xo=;
        b=Y605swgZAhBdciPq3HfBou49HU5b5LzHNkh6hpDkk+R5snyIFaQGui3ynF0xBe5mf/
         IQP5SFN7FsjwRffIiqISlC3uGHsWy58Z2hrjTSTDEJHVvbr29ZSfK8kOy28LeuB2dLaC
         WgEY0R6yJOH6rvhjX48pxKB1EmzRYEBIYYbrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841939; x=1734446739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oW39J4O7Decd6iUb9vyPOtj+lmZctRYD0s4SZ/f2xo=;
        b=xIK7NM5cPtBrTxtx0YXqwkiKHhg8Dll8XjS4BeB556QFHRxeyQAr8A/arU9pLMrc05
         oyfL7ZLM1jz2DNKzWq7cfGzmGsuKCElyobGlpcNkRpj2LdmoQoVOc+yKJTraH6BS/pQL
         xoqMFrKyCFnvG2ZGoW47Q/nFqwFaYJ7WkRSbubmfM77rBH8JvUiLZA6hTngXQanBiFOO
         Ev7NPi4nEaXU2Agi7orAqp2a2bHu5FaVf06IJHL4ABntCfzWi1FmS6U3ev/lcqugyMIH
         6+AU+IiVCAmK9jPuqmXa3VCBEus3UFCSsvrDgjLxob3R5SQtodLPcXO0x/cNsHGhgpkc
         8qEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs/nqMdGDQ47VpDj89rlHiy4o7p51HlTu8oKLuagpLTVFA7LXSlXk0pSsPuvchpqCYla4MIrgQhbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnaTl05n1rpDaWtL+umfNC99FPlvfI6JFPU4Y/yn6Q3HQnRjs5
	tBJP4PG3wE27ZgkYhMNNxIAPiDyleNUtPk0ALkmSIU4f8uYen2Tyku10IaVz
X-Gm-Gg: ASbGncs6Td8s4EamuI8uGm575tqV0IsCzpj073nqf36wB0WSVCavp5ZQjA7Bzg9Q52H
	/Gba6gGFpoL1Dx17rQKJatTScSQKaPBTkoc1/ZvUOfl6w1XHJPZz+ia5aQwdoeI0o2kqju2WCON
	79HQgNL4Ctk3lMMQzM9jbwL7Bq4mOin+JvhdS2VBZxx3DnL187neb9uc0kBoYvCxLuOlt1r/PaP
	opn11Hp3vnmZ0LbrZuoUIDgpgodJLNkumo9/ilZ386kTif59vJF5LHgt3YK1gjLqod3u4ZTs1fm
	y1UROdziG1WgCHKZaHTAsLbVetnjeRU7hPq/PNg=
X-Google-Smtp-Source: AGHT+IHxk7OZwE67H6am9XucwO1VSzRK2+pKOkaNIsCW46Pf9x6hpvZYYK7Pv73tjpi9TGbJhjJM8A==
X-Received: by 2002:a17:907:9508:b0:aa6:87e8:1d0e with SMTP id a640c23a62f3a-aa687e822c2mr724240466b.34.1733841938618;
        Tue, 10 Dec 2024 06:45:38 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69dd81272sm168996966b.161.2024.12.10.06.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:45:38 -0800 (PST)
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
Subject: [PATCH v11 0/2] usb: typec: Implement UCSI driver for ChromeOS
Date: Tue, 10 Dec 2024 14:45:25 +0000
Message-ID: <20241210144527.1657888-1-ukaszb@chromium.org>
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
2.47.0.338.g60cca15819-goog


