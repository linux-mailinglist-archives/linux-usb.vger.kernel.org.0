Return-Path: <linux-usb+bounces-19531-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D55FA168FE
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 10:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57E0816867D
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 09:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD8019E833;
	Mon, 20 Jan 2025 09:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KrHiu/lC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5C2179BC
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364610; cv=none; b=nnlgu5QEkimGNe9bC9dMCr9efdLWcx9PN/liwVFLIS/aLoN+xmDmwIFcU5Ol/og1u50jwIa1LXHoRB61tOu5CR1ROxyjwPyEk/8d8dwnFwfissnz+LcfEQzBaNv5yNTmBn2UQWGhcZoWTQsQ7f8HcxwNVOh0BVWlb67g0vy28+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364610; c=relaxed/simple;
	bh=ls8SZUINCManUHZndVu8F2E7mshCWh4JB38M2H99A3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o/T6QzbO1cJbtMwmQl35XWAAg0W8UFfL1Sjgl7parOGFdq3bHpxVE2bix0w5gek2U79TudkL5coU3DdnCtB8WTw8ag2Kq9PzFg4oiy7eN+rBCVXDNEbvNA2kdleTmy+sFyh7bhZF8FePOMv7ST7hpPR88tM1sIjPsE4W3IOT47M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KrHiu/lC; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30034ad2ca3so33629491fa.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 01:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737364606; x=1737969406; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=akYyYtu9ug+s+ErfadY7ZCYyf6Bi1pgbW2VJ6MzYjW4=;
        b=KrHiu/lCL1YRt0ENl7CmwLipn2d3N4Fnbya8LCgcEoV6n1TQtlJ1PPm6E+3aKF6K13
         FVoZYaPgojMLLWsuHaB4YNzmleEFc2N1gN6px9ImRwSFaDD5snwQdl9nJK2Uv9pC/Nq2
         gcJp8iIrorf9aUwxohprCy+uW4uGgthIiwVtX4cfdvlb3k/HYuQr4F5nZGoqJhXVlxS2
         Ouxn/QN25IUCIiZ0lPkVyIm+VFZOuI4YPegTrjpiEvhN8FKCiTn1v8Qs/xc9b3XQfXud
         31FQIH00tZKfdsF/vneIHi7CmRe2jaIVDOfoW0FAxRDW50/veF2MjXomunCLM8HnOVaA
         3X6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364606; x=1737969406;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akYyYtu9ug+s+ErfadY7ZCYyf6Bi1pgbW2VJ6MzYjW4=;
        b=NSS3NnuOaKbrPDA+ThiuZ5NLQa4SOS+rCCzMuw/aT6TZO9OF9L2FzUJKGaSfaMjuEj
         r/8p/VIvUgye8n2haMQIZzQ2j+DIEdkih4ERFb4cYGAiAQtTb8KVkPF71cHtbBtUEL2e
         WyNE6nifkFlHe5L0uBN94SNcWXJCmubY6lVy1g+ryyRgkJ2Ty2eMTUQ/5BQOoxh+9SIn
         jFeIqqHfhgKSVLVqgBkAz9S/Xh/zcQjCH+Yl1svscCJQpYZHBtjupUw5mbaj+ZE6lr9p
         ua6PQlPowk8WGQEIWijlvuuoRvFf3Ni0ptGglLnvWfE25DpQWqujC15uUxsphGikjUvf
         SPQA==
X-Gm-Message-State: AOJu0Yw1wNBvRdvO6KHpgEND5L8gZM4pSkVcj0rTeNAZ4if75sk9Bh9k
	Ga7LI0GNNrqc7YN7E+RBdzw35tFAs5v9GQU8VTp6M3qbYFut2A8glbeUoLjc8DA=
X-Gm-Gg: ASbGnctGfW3HQ5iFnVjMzAJrpn0nru2aYMI050imSXLVq1EUJ1a3w+JSz4J9D0ZGcnx
	dswt+yqkWPgEX0C0YZy71CXWA3PH4plq+e01QrVLZT71x2POuFKpzLPPfrm1jFRFbvbf93KryUI
	dmu/1a8erZiEs+pSPwQW2qVSIZ63YEtD8k/mLmoGHb6VaLA8pN1VNPufwni0cgGahpcesaZTjEO
	B+TbiIOVDbNiCt8WTvb5WLNPQkivJRQk1WMSDzEZuxIqiXxZJD3G1FGz4g7uQQYi2y6rKEG9A9O
	uA==
X-Google-Smtp-Source: AGHT+IEIPac2D7jw7UzzKanZZDy5eKrPYwIrYNbWK/3d+EJb5mgyyAguCCFRO5zeoxDyhnvP0G2Flw==
X-Received: by 2002:ac2:4570:0:b0:540:2542:d89a with SMTP id 2adb3069b0e04-5439c288152mr3515416e87.52.1737364605702;
        Mon, 20 Jan 2025 01:16:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af729ccsm1223639e87.188.2025.01.20.01.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:16:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] usb: typec: ucsi: continue rework of command
 interface
Date: Mon, 20 Jan 2025 11:16:42 +0200
Message-Id: <20250120-ucsi-merge-commands-v2-0-462a1ec22ecc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHoUjmcC/22NwQrCMBBEf6Xs2UgSbaSe/A/poaSbdsEmstGgl
 Py7a8GbxzfDvFkhIxNmODcrMBbKlKKA3TXg5yFOqGgUBqttq41x6ukzqQVZGp+WZYhjVsEGF1r
 fHY7OgSzvjIFem/XaC8+UH4nf20kx3/TnO/31FaO0Qqu96cQ5tt3lRnHgtE88QV9r/QCZH90ot
 wAAAA==
X-Change-ID: 20250116-ucsi-merge-commands-f2f6f5c93466
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 =?utf-8?q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1780;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ls8SZUINCManUHZndVu8F2E7mshCWh4JB38M2H99A3M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnjhR7px+MnOLytv76/PU8Ok5cns2W3dcXvmzdV
 EXE9P27+ceJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ44UewAKCRCLPIo+Aiko
 1TN5CACTJGqEdbl9jzTjuuT6nQW9Y++fRQRzkKsSFCra9Tlk7iezm790SYqFGW0xFYyslpy6Rxb
 0E6OVkoCTdVvuSeDxfuR4LmeLACB/+D0p00Q4Y1gVIm1twFYem3+3FIsIdQXJh5P8zsi/cCLfpm
 XNb6E+g/Ym6BlJND/216VllabgzpquP1MkIDvTtEIdnwHI4XxM7NlvThsmzJezggivVGNXZSNuA
 A15GSh++JoRjKpm2BwBunFrF+Jp6v3kYFJf6inQ9f7xHO6pIi6zjSOKUi5XHi4cMhVzd/gCbbPJ
 FgUmNJKezoiS8CeRwY46wvITuPT9IEoGgo3S+9dKyKPN3RG3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There are cases when UCSI drivers either want to mangle UCSI commands or
its response or to completely emulate some of the commands in software.
Currently code to handle such situations is split between sync_control(),
read_cci() and read_message_in() callbacks.

Make sync_control() also return CCI and MESSAGE_IN data, simplifying
this kind of handling. This series reworks CCG driver and LG Gram
quirks. If the approach is considered to be acceptable, it will be used
to emulate AltMode support in the GLINK and Yoga C630 drivers: on these
platforms DisplayPort AltMode is handled via the non-UCSI messages,
however in the past reviewers suggested reusing UCSI displayport driver
and just emulate necessary commands (mostly GET_CURRENT_CAM).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed build error in CrOS UCSI driver.
- Link to v1: https://lore.kernel.org/r/20250117-ucsi-merge-commands-v1-0-e20c19934d59@linaro.org

---
Dmitry Baryshkov (3):
      usb: typec: ucsi: return CCI and message from sync_control callback
      usb: typec: ucsi: ccg: move command quirks to ucsi_ccg_sync_control()
      usb: typec: ucsi: acpi: move LG Gram quirk to ucsi_gram_sync_control()

 drivers/usb/typec/ucsi/cros_ec_ucsi.c |  5 +--
 drivers/usb/typec/ucsi/ucsi.c         | 19 +++++-----
 drivers/usb/typec/ucsi/ucsi.h         |  6 ++--
 drivers/usb/typec/ucsi/ucsi_acpi.c    | 29 +++++----------
 drivers/usb/typec/ucsi/ucsi_ccg.c     | 67 +++++++++++++++++------------------
 5 files changed, 59 insertions(+), 67 deletions(-)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250116-ucsi-merge-commands-f2f6f5c93466

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


