Return-Path: <linux-usb+bounces-24779-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E61ADB205
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 15:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 164661688ED
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 13:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664B92877D2;
	Mon, 16 Jun 2025 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mFWB0+2n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1B12BF01A
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 13:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080792; cv=none; b=ADisGaDEhU50Rz5pDIgHIxtm++xmtjC1s27FjsIcuXbNn4p2oB2MbgIih7yZBU5ekfJjzOeXEudz5/26fD5ZgXpn4JTUitZwJnNBdStm5A3d4+tcALhZg1/S+qU2yyIqB5cWtXxFxD1GXVRrNECd5SH8MsfE9TRgfWyilrjrbUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080792; c=relaxed/simple;
	bh=YhWSDmrnOKoze3ApO91AUyBZ85d4Lcz4lg8oIS6fHeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nh+uWzpbH3yl/N8Q40o3FvHEnvTj9imSjiG2BfB4W3h24m72ZYEDDY2d7PIRvabSwbVK6vW8OCSw0Nxb2Q+KdrRh8SvD3MRPslVcBcUvK41RlWszl7KshW3llYncr+iX/KjfEvGzOsFOBoONQ39mvPZIqANxlHHL/+Teuyi2o1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mFWB0+2n; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso5486629a12.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 06:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080789; x=1750685589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5YN2QkU5k06/pOxdUgeF6W/BLj5Q3PBTEndQTl0KDk=;
        b=mFWB0+2nhYsa+12n3JVGtlWSVEHQ2NLyEHmiSbbgJUsIFvXfwNGjekDUnVLfQjiPFY
         XOxD9cFUYMqadHpd12oU9G9OB+2ZH/WvNAyjn3xUwWDKJrXjHsOlVzxibrXotd9GgQBv
         4SReJ+VxU+Hw3uLSkwWmhZn9ib2Jic+Lb52ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080789; x=1750685589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5YN2QkU5k06/pOxdUgeF6W/BLj5Q3PBTEndQTl0KDk=;
        b=NODgdWClk/ZiTA0CDMZ8WCZmEoEmmbaQd5U51VJRwmrJGx1GHXIusCtYHCH6IputaI
         8oV1sW+9LGSGiKcqYNwXdlZU7sj17bMNZ/xWHzbKU+Grnwknc7bKnEkOudtaA3TLr8Da
         B3V/CqUtbZlCKYlRCIrMwB+6T+DJsEJ83eaJesx04EvnQsJuUNkzR9ArHD6qMLsOcfOF
         xjICJd5BlZMmEqrPI5dEluYoPWhKk1u4IY7cig4LWb5p8s42q38Fc6zefeI7lkjWLElP
         Oingp9aD3BTq9VLqOEPkx2gZX6te3tts2AZKsP5QrYCUGAjdWGHrLPxz8vqzeDgM4sn0
         piTg==
X-Forwarded-Encrypted: i=1; AJvYcCXz017FXkrswHe2b8Zm9GDwcVnBYPnwbpJHKbXvs8GKL5nRCt0G6OZ1rtCDPjpI6aAKNH7opLejhro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznwh0gj9VAkVtFQd/2qKcd6LRqfTLZvcfrwYhvH0T3T4JFvTR+
	nszh0pGo4aY+Arw6CmSSW1EzLJN+qAnXo3KoherCcix7vRamw+kjpnhn/hyLYYgDUQ==
X-Gm-Gg: ASbGncsxhHrJpcngSvjIRJnnZ6RPoDyISko8vLJJKwKxzz/2DVBwlJcSVZRNo99u8IC
	HKbxPR/MiO3bM76lI2haiur8ZREzAVNI6L+LPuunITJBfe5uJyfIVsyR99Tgz9i68a9sAOn87at
	XbJMUZcoNLRCfyOedszFUK7zQVF6Bd7YhMwQHQP/ZfDLurKwsS8sBbiUoCd89LMHBJ//TZUNjYs
	XBrmNmfIJTOSbm0xCBqilNT97HZKwkmxEuvbWR0/WWqhlgSBftc6lHofgovfCgVrPN5sP3WV00W
	v/ELJk3TkLO+m3Ihv2o651P5jD9L9l+MULWqEiXwDrYY+gxpflYppCTLNUlp100DhKwKXIerE6e
	nTNPvpfiOjPhlUfhQ5oVXlKGD6ucyoLtEfnoqQ8Ci9DQowU4HIU1dy+oUGg==
X-Google-Smtp-Source: AGHT+IExI1WmkrxVe9zE/JbZig55DtGz8Y0L71WuTd6No5iWi9+KVXEZJTRNCO03hIbCfTQ5SWPVVQ==
X-Received: by 2002:a05:6402:440b:b0:601:6c34:5ed2 with SMTP id 4fb4d7f45d1cf-608d08346e4mr7846954a12.4.1750080788784;
        Mon, 16 Jun 2025 06:33:08 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:08 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 00/10] USB Type-C mode selection
Date: Mon, 16 Jun 2025 13:31:37 +0000
Message-ID: <20250616133147.1835939-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a flexible mechanism for USB Type-C mode
selection, enabling into USB4 mode, Thunderbolt alternate mode, or
DisplayPort alternate mode.
Two new sysfs attributes are exposed to provide user control over mode
selection:
`altmode_priorities`: Allows users to define their preferred order for
attempting mode entry.
`mode_selection`: Initiates an automatic mode entry process based on the
configured priorities and reports the outcome.
The mode selection logic attempts to enter prioritized modes sequentially.
A mode is considered successfully negotiated only when its alternate mode
driver explicitly reports a positive status. Alternate mode drivers are
required to report their mode entry status (either successful or failed).
If an alt-mode driver does not report its status within a defined timeout
period, the system automatically proceeds to attempt entry into the next
preferred mode.

This series was tested on a ChromeOS Brya device running kernel 6.6, and on
an Android OS device with kernel 6.12.

Andrei Kuchynski (10):
  usb: typec: Add alt_mode_override field to port property
  platform/chrome: cros_ec_typec: Set alt_mode_override flag
  usb: typec: ucsi: Set alt_mode_override flag
  usb: typec: Expose alternate mode priorities via sysfs
  usb: typec: Implement automated alternate mode selection
  Revert "usb: typec: displayport: Receive DP Status Update NAK request
    exit dp altmode"
  usb: typec: Report altmode entry status via callback
  usb: typec: ucsi: displayport: Propagate DP altmode entry result
  platform/chrome: cros_ec_typec: Propagate altmode entry result
  platform/chrome: cros_ec_typec: Report USB4 mode entry status via
    callback

 Documentation/ABI/testing/sysfs-class-typec  |  34 ++
 drivers/platform/chrome/cros_ec_typec.c      |  11 +
 drivers/platform/chrome/cros_typec_altmode.c |  32 +-
 drivers/platform/chrome/cros_typec_altmode.h |   6 +
 drivers/usb/typec/Makefile                   |   2 +-
 drivers/usb/typec/altmodes/displayport.c     |  17 +-
 drivers/usb/typec/altmodes/thunderbolt.c     |   6 +
 drivers/usb/typec/class.c                    |  95 +++-
 drivers/usb/typec/class.h                    |  16 +
 drivers/usb/typec/mode_selection.c           | 505 +++++++++++++++++++
 drivers/usb/typec/mode_selection.h           |  42 ++
 drivers/usb/typec/ucsi/displayport.c         |   4 +-
 drivers/usb/typec/ucsi/ucsi.c                |   2 +
 include/linux/usb/pd_vdo.h                   |   2 +
 include/linux/usb/typec.h                    |   1 +
 include/linux/usb/typec_altmode.h            |  12 +
 include/linux/usb/typec_dp.h                 |   2 +
 include/linux/usb/typec_tbt.h                |   3 +
 18 files changed, 775 insertions(+), 17 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

-- 
2.50.0.rc1.591.g9c95f17f64-goog


