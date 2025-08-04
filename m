Return-Path: <linux-usb+bounces-26455-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2F5B19E2D
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 11:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F5B01797C9
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 09:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D31B242D99;
	Mon,  4 Aug 2025 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QWZVy0QX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1655F242D6F
	for <linux-usb@vger.kernel.org>; Mon,  4 Aug 2025 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298243; cv=none; b=VaXqAfvr/W67W+ogbHunWcOYvzBSU38e6mNSjagkYl1rA2v0TwUKX56pEOn29CPg2581Hi6BBWZXYRk51FyKTHuwDvOLxDFEV/bbz8kFbbcRoyfnkyShb+wfsKEBJfp2iDbdhMeeBPjM8cr0wkjl9dRVtOzBZy5unvmvDRHZfKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298243; c=relaxed/simple;
	bh=CdRSPzRZhrLXv9SkH2yFf0/+V2Tpe2TdwnPx5t3lia0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mqBFYDRUihsy8p+MUB0uV+oS9mLWI2ZW9B/FDVazGldhSzFwAM3woxTrgdA1bRVkHc0VSWFVC1JesVSBvs7M/F/Op+/CSs2p7FOvNdY4NMBJeHVUkg+BQnYaDqnfYERbYoqr6Nyf1LN2GzIYesjRS4W8CrFhLVmWRe6gfonKijU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QWZVy0QX; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-61589705b08so9041999a12.0
        for <linux-usb@vger.kernel.org>; Mon, 04 Aug 2025 02:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298240; x=1754903040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VgC/fq0UWX7rdpZAzk3F1oBkRyQKH7WIGoqghZqLQ0U=;
        b=QWZVy0QXf1r+VWGu1uhuVo0G8RtoRz52NqonTThBjTkrmCYAWxTIj055AzCH73yuPY
         pBpcQUgXT/XG4Dr9LzBIrP3TwnfM4LQBhDVTtrD9u/o/TVfvdv8ybUlJTlu5NaVTj0EG
         4zybFr96K/h82g4QL+iaZv8VyPuTJd/f8F71c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298240; x=1754903040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgC/fq0UWX7rdpZAzk3F1oBkRyQKH7WIGoqghZqLQ0U=;
        b=M3RLungm17FWRf1+K6p2chnoLQk6zYPWHhB9syxdHhSQ7OY0DBYxm/5MI3/REgiovW
         vzGvv3LF0WI0tkj+MJH0k8C8HqYByPJ3amu/gUYKu593LeR+KWritgNl9M5Zxtqit2Fm
         Gp3cj/EZ+cuDD0cV7d+m8ZN3wwaV2c6EorIASOAvxibDpM4mwD/t6oPvwOZTVmdeJWnh
         hdC2PWUGIP1kB+LN21rIoFVN7ED0hZtb9jmXcAE0AoE396BPhX2yCMtCG18Ew1TAir42
         9EY9SsJupIxuyRo1D2ZmM3fAZ/ofmb4BvUZ0hZCzoHQDtL5vBvxh/XkeaRXRaV693Vq5
         5HFA==
X-Forwarded-Encrypted: i=1; AJvYcCUwojy8RbAVVgz9rSG2Fk0pEi+Zoa+8NKoUJVYjUlDXmJpmxdLo5IDHuOt0XxpbN4vpuB17Rl/yiMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4/7rkG+oCVxZIMnstjx1zljmbNR7vQVzvHsXuIMyQVbi5LTJw
	MzgJKGDW4Nocon5pcFQvAIZf/8K/ksWJ+raWyMRTPdqH1bai5LGkgZzkfCKk1oFJKg==
X-Gm-Gg: ASbGncsoTiTGrV1wXLhpIQWvMjAsWhVnaTHU8AXF8azohRV4NWtDZfagZpiZRXl1QOc
	OW3a/MN85y9X3F8P1MS6hHVN/5lh0POINVPVelnfAfsCLfUORl7BgKSEWQwQx8oSlvNFBHL9v1X
	UPC3q+b9pBf14OVkW8JGaoWWU8xb3kPEx8V1YS3+7dX3MfGYad3gU7SAgfcyTYomGrZYiBfnJO1
	DoDr9WlYRyRcVLiiByeMLM6ZoGfUW7f0bIeT/qvu29qGwCF/nkkvt+24JztWK5GGtBBjisgg6Jf
	C6GviVDU9jKIxwhcpX5aRzcwhQQgg/6PEmnv9JVHpJTWBojvyabvov9vlgMA3L77KnsgbTXVatU
	aBEYxcE6H0acLpxHyCGfGSM37oEdEmMS/XcN1cuzfds7zc9kRKBlia10KQEq6JGpvVbDB2QivdT
	bkTQ7oNQsXnLmvR7UzYl/GZekIow==
X-Google-Smtp-Source: AGHT+IEWZlH6viZQ6slELtEy7DIQ1R5yHsUK/PokBkKf2bvVo1I7/RrcEV59t0yajt4CFWb2bWNEBw==
X-Received: by 2002:a05:6402:1ec8:b0:617:4a59:c5da with SMTP id 4fb4d7f45d1cf-6174a59c6bbmr3476589a12.23.1754298240446;
        Mon, 04 Aug 2025 02:04:00 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:03:59 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 00/10] USB Type-C mode selection
Date: Mon,  4 Aug 2025 09:03:29 +0000
Message-ID: <20250804090340.3062182-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
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

New sysfs attributes are exposed to provide user control over mode
selection:
`priority`, `usb4_priority`: Allows users to define their preferred order
for attempting mode entry.
`mode_priorities`: Lists the modes supported by the port, ordered by
priority.
`mode_selection`: Lists modes supported by the partner and triggers an
automatic mode negotiation.
`entry_result`, `usb4_entry_result`: Reports the status of the last mode
selection attempt.

The mode selection logic attempts to enter prioritized modes sequentially.
A mode is considered successfully negotiated only when its alternate mode
driver explicitly reports a positive status. Alternate mode drivers are
required to report their mode entry status (either successful or failed).
If the driver does not report its status within a defined timeout period,
the system automatically proceeds to attempt entry into the next preferred
mode.

This series was tested on a ChromeOS Brya device running kernel 6.6, and on
an Android OS device with kernel 6.16.

Changes in v3:
- The mode_priorities sysfs attribute has been made read-only.
- The mode_selection attribute now exclusively lists partner-supported
modes, with mode entry results reported via separate attributes.
- The driver returns mode entry results instead of error codes.
- Constant values are used in place of module parameters.

Andrei Kuchynski (10):
  usb: typec: Add alt_mode_override field to port property
  platform/chrome: cros_ec_typec: Set alt_mode_override flag
  usb: typec: ucsi: Set alt_mode_override flag
  usb: typec: Expose mode priorities via sysfs
  usb: typec: Implement automated mode selection
  usb: typec: Report altmode entry status via callback
  usb: typec: ucsi: displayport: Propagate DP altmode entry result
  platform/chrome: cros_ec_typec: Propagate altmode entry result
  platform/chrome: cros_ec_typec: Report USB4 entry status via callback
  platform/chrome: cros_ec_typec: Add default_usb_mode_set support

 Documentation/ABI/testing/sysfs-class-typec  |  72 +++
 drivers/platform/chrome/cros_ec_typec.c      |  17 +
 drivers/platform/chrome/cros_typec_altmode.c |  32 +-
 drivers/platform/chrome/cros_typec_altmode.h |   6 +
 drivers/usb/typec/Makefile                   |   2 +-
 drivers/usb/typec/altmodes/displayport.c     |  17 +-
 drivers/usb/typec/altmodes/thunderbolt.c     |   8 +
 drivers/usb/typec/class.c                    | 212 ++++++-
 drivers/usb/typec/class.h                    |  15 +
 drivers/usb/typec/mode_selection.c           | 575 +++++++++++++++++++
 drivers/usb/typec/mode_selection.h           |  54 ++
 drivers/usb/typec/ucsi/displayport.c         |  10 +-
 drivers/usb/typec/ucsi/ucsi.c                |   2 +
 include/linux/usb/pd_vdo.h                   |   2 +
 include/linux/usb/typec.h                    |   1 +
 include/linux/usb/typec_altmode.h            |  12 +
 include/linux/usb/typec_dp.h                 |   2 +
 include/linux/usb/typec_tbt.h                |   3 +
 18 files changed, 1024 insertions(+), 18 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

-- 
2.50.1.565.gc32cd1483b-goog


