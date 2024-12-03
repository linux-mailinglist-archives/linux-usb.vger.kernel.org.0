Return-Path: <linux-usb+bounces-18050-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F13D9E1EFB
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2024 15:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FF382810BC
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2024 14:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508D81F6663;
	Tue,  3 Dec 2024 14:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HPbJMzJY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010E61DE2DE
	for <linux-usb@vger.kernel.org>; Tue,  3 Dec 2024 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733235835; cv=none; b=nafOM/TZ7f+9/Oxh/IPHybT5HFS9OrNLyfR8aA8L1NoY6nPeQqfzz9b2c/dnuwIVYnfFLWwdT/zNoTmF71DZKgGVurS04nBPQAXAmaXkGC1c5TTh0dF4wAKCWUUrmP0O39crgC2YpcYkN0q4/52z2AsRrNqfTkdIH6J56qPCoUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733235835; c=relaxed/simple;
	bh=LiwZqTaCwtPYbVUbQgJB4TamMAu7Ry1f9Ko8KBJxWS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DbEfNy3nDna5KN1x/b3w1QHBEa0ZZxBaI8NOkCuuXalH6S5pUr7QjLY7SSlnf1FJDVtgTIC28zTRV5COAEMfl05z4VN/z6njcs3SnsZUtUqv1RIw7GHTGU8lVnqfAT0prpQC/F0eSdR6TffpGZJCrJkVp/B20g3bM58/6E5NJNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HPbJMzJY; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa55171d73cso1172477366b.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Dec 2024 06:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733235832; x=1733840632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M2lWSxr19Z7HZJY/3NWn0r9Ksm2XuDvm2IGMEOHYfkE=;
        b=HPbJMzJYESDT1zHe2kdkx8qfYWnGfJ3oz2HVL/bFlwesIOcsK0r7jqGkFA71U/s9Dv
         TUyTpufVaserrDNUniPM4+W/tW2y2+lfh2sRWHtEtou3BfeAbWx+0Sd25Fw+tBpuWA1c
         HFXsC5834u7mxucgFsPUXKk1P6qtjpuMqWXyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733235832; x=1733840632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2lWSxr19Z7HZJY/3NWn0r9Ksm2XuDvm2IGMEOHYfkE=;
        b=tewnHlh5Qt4sDCNPpz6+SVXURegEFjb92VMbEbWx5fxMsVuOkVa3HErBl8/SXau55b
         U9J2BMCaqIekfypEiaQQx0P1ApBO6V738DFQ806n09SuERy0KKlmH2ZYTzNsEPIf/MSy
         Qb+QiVecIP5ZU/PRjvL8QMFcEilFk/ESv5IiPxMZifaLCleNyh6qTx6RuR9grEcZz4ZQ
         tI67B1q2j2yZETJSn2GlwPM1KA6T2BlVZbArsQi9b2xHZud/bQkJc9jeqKEkLolj9YkB
         rKjZV2cm0YrQ6tUbc6sxBnsSclKAUknsjkLAyXGLvPhFnZHYjSlNKPVZa+XdlY22xMQE
         CWsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlYr/wSDGk1PjyZzkj7LIq/KVOc2VKzlQhKjd5HhkpLxe5feWnjlVWG8iOcJ441KBcUCspKs1ou78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEb4wQT3Bl65wqg5G/p3K3ICEf+ddfY+/N4eSjqmK7Gnkqz0NJ
	0fJDMwcVYInRHFF+gj/QwTbdaIs9P8VDb4QloOdM9Zl97AcHDTqz0wZx8+wi
X-Gm-Gg: ASbGncvsFBxHEfErUKmQF1eb1XGnExEIkkN1tdRSVPslwvvolw4rXaYSdJr60+kc7yw
	ZXhPcodvCcH0apgTsN6QvX2Ar3zaa5rWVoC2sZk5EW1Z+wsuMSH9Y/H3nUP6pTQJVO1orzuz+Nl
	/gbuSa90qOBO3k1cTjuQydMkAz3TIPKQW0dQWXd33Gz1m4PRK1uQ3fy1kc3DF2gUvDFZkg5Heog
	ydTgJvkFYAn9pCLxIpkUf4k6ja/pqdNRDW7qlx4/LcXGppnMDhAWvC/0qwWBAetlwC0eTpQ/yJj
	iP4PXdfGUZBR9UYMo+4bGnJXyrL7CKNE2Vg=
X-Google-Smtp-Source: AGHT+IEceZ72opQVXCjcIbIhEScJB0UgFCekVOen2KPTUnFVSLZvTRkCNJqKeuGt+mmCYDf5q7M8Mg==
X-Received: by 2002:a17:906:311b:b0:aa5:27da:104a with SMTP id a640c23a62f3a-aa5f72cb6c3mr336661866b.15.1733235832185;
        Tue, 03 Dec 2024 06:23:52 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a64sm618272466b.96.2024.12.03.06.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 06:23:51 -0800 (PST)
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
Subject: [PATCH v9 0/2] usb: typec: Implement UCSI driver for ChromeOS
Date: Tue,  3 Dec 2024 14:23:12 +0000
Message-ID: <20241203142314.3892422-1-ukaszb@chromium.org>
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
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 335 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  28 +-
 5 files changed, 383 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c

-- 
2.47.0.338.g60cca15819-goog


