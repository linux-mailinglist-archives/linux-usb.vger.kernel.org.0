Return-Path: <linux-usb+bounces-18099-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A075D9E4544
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 21:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56253B372C4
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 19:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF821E2306;
	Wed,  4 Dec 2024 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X4ZtrXnR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0BA1A8F7D
	for <linux-usb@vger.kernel.org>; Wed,  4 Dec 2024 19:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733341752; cv=none; b=mg5NP5rKLcIdGkOx17Af+jTg6mXYBP0XsA6TMgTvtLX90aWJNCE6nQq/FiGJdG7EH36tBzMcLmJzikGnPD+6cVCYi6jbMn+hy3X1odd8iIeIPSCnZIgV0hfowutYl95liF7Msu3HqeH6ZwOMeKeedswiE4U9x1pxf8Tamv3dTSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733341752; c=relaxed/simple;
	bh=X5D9Z6XvpiGeN1N9oKVJTtb9pC6bQ3oFckwDPASPiWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EAHFxuk9/0bmHxda5uhb4EQ0tf7J6Ga+ejdh2Nk0LPdHuifyAbQjVKGI/c3d6eUSYoOuhylv+SQqKQgJ1syZPfROZ9y+u/57WbZGgSZaUGtU9sjFdfiwEFfdVkoo/RBlFuLwWrq0qiReQp2aIU7anaNCXLo73u6vMmb5M3JrZVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X4ZtrXnR; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa543c4db92so20249066b.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Dec 2024 11:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733341749; x=1733946549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/mngP4iptJPLYAmaFSpR8JCKdxNOCSzn3Y98pXoqTYA=;
        b=X4ZtrXnRghIU1IhbRmmOwkkBbCWfMCMq5o2xsHpo7Xx0BpQN9oENfXwnfEPzTFrbNX
         oVJMN61ZJPj27hP7tbBYR6FX6UBgnoBc5ThOIV+jKXGHhTMJpDuqZC3x4r4Em+G5pDIN
         5ynq74OSBkx9LE4OSs1gfBl1aNW/o2ae2k2/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733341749; x=1733946549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mngP4iptJPLYAmaFSpR8JCKdxNOCSzn3Y98pXoqTYA=;
        b=YwaaBJW45/NzNIMolhPiDUxIIJO650vUQMtfNy9bKXUQ7i9EAccUJH6rGFkEIXMWRy
         YNofKBN9Ot1Sm7pwx+mOshvVxAMDRHfaFHKWhzQv+2LrTZV1P2mzxSYdelilPJoCYDrS
         4GCiNZopT3Ztyg+Gf7rsiegGokubqqbhaHhtCyXMrM11HRK53se1ZiDR2A1ZUGl/Jcqx
         OVxLHj5895Zpa9+hs7thu94PzxO2ezO68x58vzvEpSmfh+rJL0D920BPDGFwTOVhO1CP
         d927sPGnBLF84m4pwSKq1JPcHkHMCUoCiriHDGaqyHhxAvMbI/uWLQlBeTz1X1jXP1DR
         SFRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ7KwKDHAphgOGTtvpa4KXCQrJrtdkTSJ5g3QyZVCH+PqO0BBSCITQKF7/a7eU+Qn3wpCfPCu/qgs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy93lYUVcgB06+Df2/Bx5gTrFV/+XknNEarIbEWnx1npilmycU6
	E23NgUaQlbwVtjnp56+xy3AWwvaWBFKckGiOLirZMjhIKrWOHdalmkk2j53P
X-Gm-Gg: ASbGncsRuEcXBJJs/9zKQBUTw5mNbIJBhieKdmM2SA+Z/i5DIz/pdZb/skN8g7XksIi
	zNeLM2XdJPBF/zPPIKK7G/t5z1kGUXBOymcbRaRPOWDi7EI5/0K88ZnLscJvw8q0wvGmWenMTfv
	JAhREDiO8DtgcujX6Ynkjl8zaPrxOZoOYZMTUZKcytcAuKa8G0qbxkepsXtr4fa5tD7TKMt1EEZ
	+0kWs1mtLj2lCz9GzFr1yghJDy9UIvWF7URbckNhGNUZzvpLeH7DNtWE/oCuu00RCqw5NJpZKVa
	4uxoZDldz761+1tgI1c0VmW605Nqg2+nRrE=
X-Google-Smtp-Source: AGHT+IFj9qAeVoF1+BsjtPFOFB0f/2B4gDimDvOScuftI2HUtisUhVOLvlmZIDXlzlRNfVJjRYEcAQ==
X-Received: by 2002:a17:906:30cf:b0:aa5:3e7b:c117 with SMTP id a640c23a62f3a-aa5f7dc3e85mr694609566b.28.1733341748877;
        Wed, 04 Dec 2024 11:49:08 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996df797sm775338166b.68.2024.12.04.11.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 11:49:08 -0800 (PST)
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
Subject: [PATCH v10 0/2] usb: typec: Implement UCSI driver for ChromeOS
Date: Wed,  4 Dec 2024 19:48:58 +0000
Message-ID: <20241204194900.371696-1-ukaszb@chromium.org>
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


