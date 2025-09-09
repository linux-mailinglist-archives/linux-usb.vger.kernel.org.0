Return-Path: <linux-usb+bounces-27795-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF10B4FADB
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 14:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DF194E15F4
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 12:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7743218B0;
	Tue,  9 Sep 2025 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S6knxmHL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3811E19CC27
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 12:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421041; cv=none; b=WexUURF+Ybfy7IUu+FcIpZF0g5JKlkK6/SchuxwWYBmiS8IRfyFOxQWUQrSaWE88vHLWfm7lIX3AetN8QYZYW/VONz6WjeM2TEh97UqQJ5FS8QQmIkFRAHD/rU/0bmkFRfZnkp+d0sSeYP4JSIwz0UFYUVfwgVudLKDkc2ryFm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421041; c=relaxed/simple;
	bh=TfgD91280mBYMbtyc2gQAhw5K8G243a5cAzgwqvOrWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GZMBx8Ye+iYiRF/OR9dELIlaFcNGLA95+hCrQJH8UNqo74wcS2S66ByQ+9P1UXxgmwxASh9lNhtkcfFD3wspY6iXM8AmyovM7tmj1DKSAds+JWRFyiobqpKsJqo4i1UuzwJvQQLRQ5ukPEr06siHBuiyiZuBOuyHQGKXyUrmX50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S6knxmHL; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b04271cfc3eso756009066b.3
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 05:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757421037; x=1758025837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGGblSmY23n3+zeJrFP+XTBfpalkEjJ+yTGcmc0kj3M=;
        b=S6knxmHLDTOOkGkG+JM6Tl0al/mGsZwySLZ5FT/NOZINOuXTSAx3h9kkiaIge2Fhw3
         HSHTRbHSZgSccsG26mfcItetDTkQdwYs0IpayX5cagSjgXLy+YW8A86/SJ1wvkqiFthn
         oPdGwY3himbP0thsAgx5edWaOLVpD8u2iH6xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421037; x=1758025837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGGblSmY23n3+zeJrFP+XTBfpalkEjJ+yTGcmc0kj3M=;
        b=VUXk+H5RIIXXJX6AXWrBGH4+laAPm5zvNqLMn8CZyx4Z8h/WVh17LJLSrJfMQd8YTn
         wetMlRwLyDvDDDBj/AWAUu7ySgIRihjakg1VICA1zX6bVU5PpvGsNYMH7R/8J5C/KtoL
         L/vlfkFBu4hlELkxPwKm7RzkZZCNCp0dVX6ZX8uK5scHW222PVD4xKtKU+E5EMmzZKzp
         8IOYBahLo0w0oVLvaxRSThSlBT5hxguk07bKdL942T/H8HM3t66WIuG1djKW+86wFcid
         rqB0SB4UR66ao2h99Zb2BTfYCHCNrLfABYgtkdtZJTF91kjE2+ib0yNBcgHCyB5EMdyO
         G6fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyA6/+XshfXsKZax5woI06lYJUoPNf+X7a6IiRulfrRSxnVixRwxA18v2Pu+EKgaoLFrjjEc1LvHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoP3lkuXydgKsTV1Iys+PItxPv+TRbcEN4Om985BA6rRocyn8q
	FHFvE48eOvmTUrnb5Y/jCF/FQzHBV+W6ebBkhSRSiFcxWdTrzpWvjsf80sPsHwSCMw==
X-Gm-Gg: ASbGncs0kova/v1EFmvCTM+85zuJyTb+2LDQFG9qdG3f8oA4rQOC9Q0f0dGgu3yoRJs
	M1ck5wwW0/p/OKyjCA3O8ri/wAU5MJR9U5TbNi1Ky7qa1o1trFCnxtQC9T+PzbyzByTNoyWG+3v
	E+Lk4R3h/dB+fv6oBkKwXXwTQ70KlMnhJa2cRWSsnUFxTvVceyKMmWjFGPyOpauPj6Eka61XCqC
	Sp9H3FY8zwrZtieGIjHIPDQdXAGwMKsbem5IENzKUNxR9xftIc4qKPnrzshghIpaeY8LDnDRgEW
	2bri1LphiH51LwNidGsg3I6DZjDQAQRiM+J9omNVikXHv42cRNYptaIvI4EN+h5KyxN9gWfdfia
	g41pbwodG6fyUslHYoClr5jsJHvlrD06eLXjw6kKY0wzFAiTiBrNsFYHT7YC/Q6ZcsOHucsxszu
	a38qkOenFyzwI0dbw=
X-Google-Smtp-Source: AGHT+IEP5lq99tnWBWbz1GGVF0Gt4go+YIyrowIZeG7BiR/j4Mlu3jscXCr+tcpjkuM3py/ouJ5XJQ==
X-Received: by 2002:a17:907:9342:b0:afe:e745:c3b with SMTP id a640c23a62f3a-b04b13d20dfmr1011225366b.12.1757421037456;
        Tue, 09 Sep 2025 05:30:37 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm2409702166b.12.2025.09.09.05.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:30:36 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 0/5] USB Type-C alternate mode selection
Date: Tue,  9 Sep 2025 12:30:23 +0000
Message-ID: <20250909123028.2127449-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
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

New sysfs `mode_selection` attribute is exposed to provide user control
over mode selection. It triggers an alternate mode negotiation.
The mode selection logic attempts to enter prioritized modes sequentially.
A mode is considered successfully negotiated only when its alternate mode
driver explicitly reports a positive status. Alternate mode drivers are
required to report their mode entry status (either successful or failed).
If the driver does not report its status within a defined timeout period,
the system automatically proceeds to attempt entry into the next preferred
mode.

This series was tested on an Android OS device with kernel 6.16.
This series depends on the 'USB Type-C alternate mode priorities' series:
https://lore.kernel.org/all/20250905142206.4105351-1-akuchynski@chromium.org/ 

Andrei Kuchynski (5):
  usb: typec: Implement mode selection
  usb: typec: Expose mode_selection attribute via sysfs
  usb: typec: Report altmode entry status via callback
  usb: typec: ucsi: displayport: Propagate DP altmode entry result
  platform/chrome: cros_ec_typec: Propagate altmode entry result

 Documentation/ABI/testing/sysfs-class-typec  |  11 +
 drivers/platform/chrome/cros_ec_typec.c      |   9 +
 drivers/platform/chrome/cros_typec_altmode.c |  32 +-
 drivers/platform/chrome/cros_typec_altmode.h |   6 +
 drivers/usb/typec/altmodes/displayport.c     |  19 +-
 drivers/usb/typec/altmodes/thunderbolt.c     |  10 +
 drivers/usb/typec/class.c                    |  37 ++
 drivers/usb/typec/class.h                    |   4 +
 drivers/usb/typec/mode_selection.c           | 345 +++++++++++++++++++
 drivers/usb/typec/mode_selection.h           |  25 ++
 drivers/usb/typec/ucsi/displayport.c         |  10 +-
 include/linux/usb/typec_altmode.h            |  11 +
 include/linux/usb/typec_dp.h                 |   2 +
 include/linux/usb/typec_tbt.h                |   3 +
 14 files changed, 516 insertions(+), 8 deletions(-)

-- 
2.51.0.384.g4c02a37b29-goog


