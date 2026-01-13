Return-Path: <linux-usb+bounces-32258-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27918D19029
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 14:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BF8F3019BBC
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 13:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692E638FF09;
	Tue, 13 Jan 2026 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AG9CYmkz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9D038F94B
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309544; cv=none; b=FcQY5z0EDVcdXEFxnOv76KiLIUWEZamOitqRuvOMaWhK8ONumRwcpv6oNDptc6aPO546213VUzSGE08iwHInNE7Z6K+4a4cwCq2PJywA688I4rvhoRdqv4fYHzqVpc2UNt9wdq9fkk2uX4vAg7+BujfJt+zu2gnPtq7K16w8jj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309544; c=relaxed/simple;
	bh=fwUzfC2xTG6i2MQ2ip8x5FilPTF7hu2g+bnWM4R+rkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/vzpxxSwTOme7pT/dyo+Ef9j2FN4O9bicmb3jrtSu0tJb+m4i9FgV8MA8xv7lvhSHRhGTvKYxoBjQPb6NSDQT1LpC5MkkPY9/yHEThBlO0AffVOgaLh+HWtZKg9P78FSUBlWjrizxu/kJ6DTZW1vR0Nsi3vfPjUSGbhcKlMTKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AG9CYmkz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so12382169a12.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 05:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309542; x=1768914342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dlFZOR9bPvQSMDUQEj/b/JXXSikTf4KnUZzPY79O4dk=;
        b=AG9CYmkzU+wdqkYowj/oxjmQUI2uIokWqY3+V/KCV3WMqE+YtFxyGiHTy4ZlRJp5c7
         2BzTmejoGgCDmQ4zOKA5UYJsveTRueDewgsuxgr4hupjPFT95M6/Xo04CUGzpjcqaoAW
         78QA7NFeESlAjriRiKjbAPWG8YRRUy1viNnog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309542; x=1768914342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlFZOR9bPvQSMDUQEj/b/JXXSikTf4KnUZzPY79O4dk=;
        b=wXK1yF4jCtRzCYYAuesjtAkZ5TmL7l0a/siwRiK8JZASQDX/57zXad1yk6elxkuHYv
         IRSeyHr5VbYIx8ZxXeRUmNno+8CN0D8FQZcOmzZITpn0dPMSCwXdOyvR6lw8aitFf10V
         2AJZ3mldPePiAJhz29h1egwD4MH9Wb7PF5krC7FUy2iSwwwU3SXAJRRJgce4by6RgAKR
         ePHCvLFis1AFX+D7hGipXrCKu1LXfEcSgEXQR+MpEvZnXfpEj7ZMWOR6ucksx1AeqOQC
         CzpXgkUtyXcNf74uoGYW4lF0T33BD52H0qrOGz9aF7/j0pKxQvYh7DuVZ5etU4W9Y8xH
         tFWw==
X-Forwarded-Encrypted: i=1; AJvYcCVMhzI1CVZTS8XGWELoZwv4yhBHKw+pPwD36dipo0Z7cfXv9X/2LcqK17XpccACzhScXxioE/dDJd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgtORllkt3quYbb8RFKbnTIbCfO8BtAOHjWovZ96kKeLrQyzT6
	jhUmqQ5A3ut9sFTKpZIEdpVYxBY7genA1vIEJvyMPVTX/ophKJIL6npLOUVacXPLRQ==
X-Gm-Gg: AY/fxX6NxX31WXqTThGVyTLuX09uIbrZu7PjhRr7UHXv2mSjuutKioB+pLUMshjwDEt
	hLsFDIJmzNHGDVUmdih0R9SFrSjlzLXGwmLVlPS8bGZmiwMMCm8iqKhx5xrv5hihxZhScrcTZqi
	qR58fWpO0+tb5/B/oj3HxtTJ/RgCTiM0oEGjLx6n8BO3i+I4eC1mlWgC49OMe+IADpuc5JS0Id/
	43vp241mTEBqkBay1gbFGZnE4UdMCtd6dofxJq6tTk3PHSdjuiAB/A0fQGonwmKKtrf4J6ry4D3
	DHFfCs+Kr9qr8DYVUYuMfB1iXHiHElZGYJwQEGW4k6ZZbMa3l9isWIL6Bcm+6599kJNxandpJ4q
	C4HP+7uS3h8LQyJJ50BAn1n7AI29IjLe2atqgfvKuL86KWGN+LfFWShFKYEnzPAFqCgIAJTXDB6
	luOkUgbSe20q61kVtJy5KtztxcdPyJo3t2mudTvKRl9+I2susA5J/GPfHg1Dg8CPoQPGEjjALqE
	NoQMVn0
X-Google-Smtp-Source: AGHT+IGRI9YhixtELVuz80DZdKhv617FozvgQfzvl6i67vy1UXB7yEw95GJgE2A7sinO3f5EEbChAQ==
X-Received: by 2002:a17:907:9727:b0:b87:6ce:1267 with SMTP id a640c23a62f3a-b8706ce1943mr751779966b.64.1768309541641;
        Tue, 13 Jan 2026 05:05:41 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:40 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 0/8] USB Type-C mode selection
Date: Tue, 13 Jan 2026 13:05:28 +0000
Message-ID: <20260113130536.3068311-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces functionality to the USB Type-C Alternate Mode
negotiation process by implementing a priority-based selection mechanism.

Currently, DisplayPort and Thunderbolt drivers initiate a mode entry
separately within their respective probe functions. The Power Delivery
Controller (PDC) retains the ability to activate either USB4 mode or
Alternate Modes based on its internal policy.
The mode selection mechanism disables Alternate Modes to be entered by
their respective drivers and the PDC. Instead, a priority-ordered approach
is used to activate the most desirable mode.

A new `priority` field is added to the `typec_altmode` structure to store
a numerical priority value, with all priorities being unique.
If the port driver supports the mode selection feature, it must set the
`mode_selection` boolean field within the `typec_altmode` structure. This
indicates to the alternate mode drivers that they are not to activate the
altmode separately.

The mode selection process is managed by three API functions:
- `typec_mode_selection_start`
- `typec_altmode_state_update`
- `typec_mode_selection_delete`

When a partner device is connected, the `typec_mode_selection_start`
function executes the following steps:
- It compiles a priority-ordered list of Alternate Modes that are mutually
supported by both the port and the partner.
- A dedicated mode selection task is subsequently initiated on the Work
Queue.
- This task attempts to activate a mode by starting with the
highest-priority altmode on the list. Alternate modes are identified with
their SVIDs. Activation/Deactivation performed via `activate` typec_altmode
operation. The process stops as soon as a mode is successfully entered.
Otherwise, after a timeout or if an error occurs, the next alternative mode
will be activated.

The `typec_altmode_state_update` function is invoked by the port driver to
communicate the current mode of the Type-C connector.

The `typec_mode_selection_delete` function is responsible for stopping the
currently running mode selection process and releasing all associated
system resources.

Mode selection is initiated only once during partner registration, and only
if the port driver provides support for this feature. Subsequent
mode-switching activities can be managed via existing sysfs entries. Any
modifications to altmode priorities are relevant only to future
connections.

This series is based on the RFC discussed here -
https://lore.kernel.org/all/20251201122604.1268071-1-akuchynski@chromium.org/
It incorporates the 'v5 USB Type-C alternate mode priorities' patches,
reflecting the change of the is_typec_altmode macro to
is_typec_port_altmode -
https://lore.kernel.org/all/20251124124639.1101335-1-akuchynski@chromium.org/

This series was tested on an Android OS device with kernel 6.19.0-rc4,
PDC: TI TPS6699, Realtek RTS5453.

Andrei Kuchynski (8):
  usb: typec: Add mode_control field to port property
  platform/chrome: cros_ec_typec: Set no_mode_control flag
  usb: typec: ucsi: Set no_mode_control flag
  usb: typec: Expose alternate mode priority via sysfs
  usb: typec: Implement mode selection
  usb: typec: Introduce mode_selection bit
  usb: typec: ucsi: Support mode selection to activate altmodes
  usb: typec: ucsi: Enforce mode selection for cros_ec_ucsi

 Documentation/ABI/testing/sysfs-class-typec |  11 +
 drivers/platform/chrome/cros_ec_typec.c     |   1 +
 drivers/usb/typec/Makefile                  |   2 +-
 drivers/usb/typec/altmodes/displayport.c    |   6 +-
 drivers/usb/typec/altmodes/thunderbolt.c    |   2 +-
 drivers/usb/typec/class.c                   | 100 ++++++-
 drivers/usb/typec/class.h                   |   3 +
 drivers/usb/typec/mode_selection.c          | 288 ++++++++++++++++++++
 drivers/usb/typec/ucsi/cros_ec_ucsi.c       |  21 ++
 drivers/usb/typec/ucsi/ucsi.c               |  12 +
 drivers/usb/typec/ucsi/ucsi.h               |   4 +
 include/linux/usb/typec.h                   |   3 +
 include/linux/usb/typec_altmode.h           |  42 +++
 13 files changed, 487 insertions(+), 8 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c

-- 
2.52.0.457.g6b5491de43-goog


