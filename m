Return-Path: <linux-usb+bounces-8876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 236328977CA
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 20:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D26A028966A
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 18:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71791552F4;
	Wed,  3 Apr 2024 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hzwxB1a3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB6415358C
	for <linux-usb@vger.kernel.org>; Wed,  3 Apr 2024 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712167527; cv=none; b=OBxkualzry4guiA6ie0mjSXoKraye3yNbBz2bOHhPTLWhV75gFr3mDWw4K/KsedMNWuBQXGJBsrVXTQNeuZ8D74lugIGUMGwf/EusLi5MHA1xCL4h1yogI9RgzCLOqzlR25pdWpm+xqY68jn52iIvK24/qnkO4U8QQNRx/sdKe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712167527; c=relaxed/simple;
	bh=KHbE4qgF9Pb8RzBagVrV0DIGGkTehwaPNOTTLF55LQM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pvzA2v+m2/Zvbk2tpgXkiDulbxICYaibZL+16H9GlJ8kjiWgTDzHDhqBUlfS8Btp+6focn5WMd2PaBQ18vq4tTJjfE7y+FYX2RwxSVKUVRYaoMoXHJaz245g/dnBwsEKxGxQiTN1z2td3yEgkb/YN+FBK18uJcsRo4RAj0zHREY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hzwxB1a3; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e8f765146fso86148b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 03 Apr 2024 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712167524; x=1712772324; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=73jxnSRwixN39ko5uxG2odEHWmCrsBBH9PbGB0SZNXo=;
        b=hzwxB1a3Q7HZeuSy3E+2kdl13TGReqWfwY5tM1HtYBUE4OzbofNbRL8/tkRkDcjqcx
         4bh9GLDh6sT8VKhRhJO4yR65+bF2NizAX9988NbY7aY0WOKIRSeJyAC8s0TPprTN5ClN
         UbrBZa3bcJ/ut6V7B4aSCuXe0kYu3M/AMutsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712167524; x=1712772324;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73jxnSRwixN39ko5uxG2odEHWmCrsBBH9PbGB0SZNXo=;
        b=n4dBFXS5WpnBowUOprN1eW8+qUOJawCNNSUxxoxeYwgD9uT4CQLHn4sGyGbiFHpjHX
         +z1vxVPrFDolbvdalYWkXmdTs4OM5ynEQRylHYOWSBGYIcsraFR3OKCBvu4u+R6XJUIT
         WgOzyVqWeWOqi1m2QShCWpG8ZhZ6m/VkHMgAZHtqekWXBnIreP4I0KQpu8Sqws/uKElp
         Dv0YaIF9ad5LtRqwXxB1tNfvQFOhY9dQsFXN3l7T7XoZcoEPMx7Dy5SpJT0PRu5eiiLR
         IvZF3QM/YnAVYVe8CqnpM9CIu4MjSRsPPzmRc23USRRJHFX9Pt7KFHtC+ELt3dCv7TPg
         26Rw==
X-Forwarded-Encrypted: i=1; AJvYcCW+m6lJ6dslQ+apv6ZpdVB/2c6pN2owc0esGx01Soa6Lv0at49iyzBEa6dMGuJ4xpWQ0PhH/NsHudtBPmukvfHl1qvgdyR2Pa78
X-Gm-Message-State: AOJu0YwsEEPvQPyVqmOJhhmtZy0K/DOffW75Fa8rh9D/2GbphlWVuo8Z
	eOgBOeLTxjf3AGJtsszD0lmcrKeCC539vt2hQMzg8ArO0UcTDMvaqN4sT989og==
X-Google-Smtp-Source: AGHT+IFhHOx2SSYuRWdbtlNPDL2p7UNMawQSaLN6WdK2MAd2O6Z8hzrzzTKXzbOLl8iJ9hjBhYqUcQ==
X-Received: by 2002:a05:6a00:1a93:b0:6ea:ab08:683c with SMTP id e19-20020a056a001a9300b006eaab08683cmr290050pfv.1.1712167524078;
        Wed, 03 Apr 2024 11:05:24 -0700 (PDT)
Received: from pholla1.c.googlers.com (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with ESMTPSA id n16-20020aa79850000000b006e64ddfa71asm12359162pfq.170.2024.04.03.11.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:05:23 -0700 (PDT)
From: Pavan Holla <pholla@chromium.org>
Subject: [PATCH v3 0/2] usb: typec: Implement UCSI driver for ChromeOS
Date: Wed, 03 Apr 2024 18:05:20 +0000
Message-Id: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGCaDWYC/33MQQ6CMBCF4auQrq1pC5TqynsYF2UY6SRCSSuNh
 nB3C0sTXf4ved/CIgbCyM7FwgImiuTHHOWhYODs2COnLjdTQlWiVDWf5vZBwGeIxB0vERArKbS
 tDcufKeCdXrt3veV2FJ8+vHc+yW39JSXJBW+gQWMMdiDsBVzwA83D0YeebVhSfwGVAau7RuqTN
 m0rv4B1XT9lsBgm7gAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 chrome-platform@lists.linux.dev, Pavan Holla <pholla@chromium.org>
X-Mailer: b4 0.12.4

This series implements a UCSI ChromeOS EC transport driver.
The ChromeOS EC is expected to implement a UCSI PPM.

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
Changes in v3:
- Moved driver from platform/chrome to usb/typec/ucsi.
- Used id_table instead of MODULE_ALIAS.
- Split EC header changes into seperate commit.
- Fixes from additional internal reviews and kernel bot warnings.
- Link to v2: https://lore.kernel.org/r/20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org

Changes in v2:
- No code or commit message changes.
- Added drivers/platform/chrome maintainers for review.
- Link to v1: https://lore.kernel.org/r/20240325-public-ucsi-h-v1-0-7c7e888edc0a@chromium.org

---
Pavan Holla (2):
      platform/chrome: Update ChromeOS EC header for UCSI
      usb: typec: ucsi: Implement ChromeOS UCSI driver

 drivers/usb/typec/ucsi/Kconfig                 |  13 ++
 drivers/usb/typec/ucsi/Makefile                |   1 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c          | 245 +++++++++++++++++++++++++
 include/linux/platform_data/cros_ec_commands.h |  20 ++
 4 files changed, 279 insertions(+)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240325-public-ucsi-h-3ecee4106a58

Best regards,
-- 
Pavan Holla <pholla@chromium.org>


