Return-Path: <linux-usb+bounces-32502-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE8FD3AA16
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 14:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8B2D307CEB6
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 13:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FA3368274;
	Mon, 19 Jan 2026 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WzNr7Ihm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7E4358D1B
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828722; cv=none; b=RGSt4vjyVwSTO2C9R72o84/mkPFfBaF7NUFPv9JV4pCirdrDfGuoii4eM7q0mqedkK2EAdPefd3Vsvi+Dl7jxWkSyMB4JMRjVhOAG0sqVtGtcjyldA5rvF2e7NzkhDsYzcgv96rA2qLoEaPhijAzXY2PaGkJEfAwEnfEdVPWDN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828722; c=relaxed/simple;
	bh=mMG+Hn8BawRbQWK4kLNveOLJbx1FyWTF834qhx1Dno0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LAVcNYQIccwAlXpLbIHkGX+a3csEs1ptgniPxDGPIy3zhhRVCdnR7wG+ftN/JUIjHYDp5eeoRM+5qbUF2HvBwlcXja+doldzM7z0+wb55NSSmXrWLhpvhITWBt2eJ4fivaOqMdIGf/ElRE92DJ2FVTLSk3aAWnFVYyZWa8vBLsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WzNr7Ihm; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b86f69bbe60so654580966b.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 05:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828719; x=1769433519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iRNnwiYKOAp913PL4zbruan81hvYhlt0XTNkvMtBRB0=;
        b=WzNr7IhmcQK5+McPG6RHnx/pdx7R06tY9VxXUo24DDix2KaYqVecSJ1RFTCu96nPTr
         9LuaqIR6pPaabX2MF1uJ1kDx3eWSYKIVRrpvfq01rv8WYoOWtOX1sU2GkIFC0WWnjFUL
         0+2ASMxd1IaRc1woO4tAOdjoy03sDtEpk9gpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828719; x=1769433519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRNnwiYKOAp913PL4zbruan81hvYhlt0XTNkvMtBRB0=;
        b=DmE8jpLyCgpspBGpStdUdwHZGS3ie/6eMw7AwCdmtA/BoRN0vztgWduSIWvKqxtjI0
         Hd6D7r66RA9zu4R+3QCJWWcL0Rt8Uw6AiqL2EN+r1N1I2jxG/L//wUD5gRmzrRN50x9l
         h+01SYGEnhexmtwHL3p4mp3Y7bgkkK9Sdt3IArb02ajMVQ51bdw8rp52EBTO0uiM2bUJ
         ehP0kKXSMkEI1AeAcS/lip3TzBHWL5HrhjwI24FGaVw1C9CuyndI8RJ75kDtG9KpEmS8
         T/3pL3ZE6Jw/Q2Vc0jt5OWLdPVZq52ChdDILvmqLHx7igqIrcJaXsYzX1BoKztF37Rw0
         Dbiw==
X-Forwarded-Encrypted: i=1; AJvYcCVeIv4n3dRnQXseeadhrMqhqaNA2Uz00x8Zd226Ia79nEdNp5YKcPulYwfuPRt5YTyo8ANckU/nxuw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuh0iggei6UIe2bJQ6vDJHerS3JNTqAo4C7XFrzo4bwvQXNgN5
	NB8fb7WxNPAzVXy8141XVUwKE2VS81cop83iYZDobUYcBoovFdFRDgqnzwkHcQrfVg==
X-Gm-Gg: AY/fxX6AZFkubj9tXBZYqi+WYd2VnlDzFD4cCRZHl9zOtc/NXJA7OK1GiCNjRk3zZuy
	5hTjO51/vdnj+CoiuS1Ad+uJi4X64isxLhzTJSJs2JbFx4wT9w20lglRz8lcXHkdGhDeJZy1pw/
	YYByCe5i1cBcWkeDkmQSOS5o9qwRErJstr9CAiyW6BpM+rq8upybRc1O7Ksdt+G/tSPVx3kSeVh
	/3Mq6VFIcGrFfKdlDPpRavdvdW8dGyzXeqZQkrlMo8z9p/MwEs0ru8oEX/xzszkaAoJTq3L5QUI
	mUeT2H+pj7GwvqHVmCHuYfY8wggf6vqdlIDQYtTVJRKJvk/dOvfOUE5b+49SWiJeil/6eihd/J8
	92OW075L4Qf2I2pw8OE8mV/vnA8dVeKIY6mnGBV+Yy0Wa6LUyVGQjcLkPbOJR1Zh++VaBfYnp4m
	tLhdtmrLnoeSR4vyFFALuJh77w4y0Xa6BDhKDz/i5kSsehMRRf8nrnNs4q7Qs7qYmcFZTbHMrfK
	THbzcmR
X-Received: by 2002:a17:906:f5a2:b0:b87:b87:cdbf with SMTP id a640c23a62f3a-b8796b85d1bmr942630166b.53.1768828719421;
        Mon, 19 Jan 2026 05:18:39 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:38 -0800 (PST)
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
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 0/7] USB Type-C mode selection
Date: Mon, 19 Jan 2026 13:18:17 +0000
Message-ID: <20260119131824.2529334-1-akuchynski@chromium.org>
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

This series was tested on an Android OS device with kernel 6.19.0-rc4,
PDC: TI TPS6699, Realtek RTS5453.

Changes in V5:
- Use the no_mode_control field instead of
  con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE
- Squash previous V4 patches 3/8 and 7/8 into a single patch
- Adopt guard(mutex)(&sel->lock) in mode_selection_work_fn()
- Use dev_err instead of dev_dbg, remove the error message when exiting
  the mode
- Update typec_altmode_state_update() to only reschedule the 
  mode_selection_work_fn task if it was successfully cancelled 
- Clean up code style and alignment issues

Andrei Kuchynski (7):
  usb: typec: Add mode_control field to port property
  platform/chrome: cros_ec_typec: Set no_mode_control flag
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
 drivers/usb/typec/mode_selection.c          | 283 ++++++++++++++++++++
 drivers/usb/typec/ucsi/cros_ec_ucsi.c       |  22 ++
 drivers/usb/typec/ucsi/ucsi.c               |  12 +
 drivers/usb/typec/ucsi/ucsi.h               |   4 +
 include/linux/usb/typec.h                   |   3 +
 include/linux/usb/typec_altmode.h           |  42 +++
 13 files changed, 483 insertions(+), 8 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c

-- 
2.52.0.457.g6b5491de43-goog


