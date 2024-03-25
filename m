Return-Path: <linux-usb+bounces-8333-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AFA88B565
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 00:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17D922C5AAB
	for <lists+linux-usb@lfdr.de>; Mon, 25 Mar 2024 23:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954DB83CBC;
	Mon, 25 Mar 2024 23:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ERiG5aI9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B05839FC
	for <linux-usb@vger.kernel.org>; Mon, 25 Mar 2024 23:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711409853; cv=none; b=o7yebLLNxoURhHl8+ljGrIIvk+nKhUasNuf9g1Ni3G2MCLLxvUDHV5zOv8dNXQNzIojekRTMzmLo/NvUBRWAx4Y58c1RernG12aoWY+bw0h4segkgeGpQ8+wc10UTiuu9jf6bFUnm72sAa0v2wManZMJUa9EQ7AeylnWvQ5vSGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711409853; c=relaxed/simple;
	bh=6dujFpkqDKPBuiO2UpfalqIfg9Gg4/76KHGhMZb6TLY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C9nDOncjSS99wQzBgc17cmULiIm/cRtBBIZ2Re7SCUVS7o230OHaz3C7CqmmLTjeNMw9XB1Uz5jExLatZHsMald07AaKxFF1lXEkpgmpeVqlsx7P7wzvnmAMzmxwPIIxwPIwzhsoBlhr5CukbGz7i64l3muOMtuW5izFELmP5Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ERiG5aI9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dddbe47ac1so37234145ad.1
        for <linux-usb@vger.kernel.org>; Mon, 25 Mar 2024 16:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711409850; x=1712014650; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t++oNQEO7IJZ94laUh866kNX+AuB2HTUTSh3SaujONM=;
        b=ERiG5aI9zJCMQ7dU2SpQGjEOPkh8ggT5du8gao09wjHeSz7hRKOhYhQ93xCN0PcIGJ
         Np7LURSwwyrnzZyhOm7+gZI0NWDC5+yj0/S/B55b+Qyf9pscEYSrUG8uwZjhUqZCQ/3S
         VzdPX0EHzzsmPlYLb5qcDo6ePo7IOr9t3fgw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711409850; x=1712014650;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t++oNQEO7IJZ94laUh866kNX+AuB2HTUTSh3SaujONM=;
        b=GtTg+u3Zz6yDOISF/2lETIbKuOxl6pWPqSXC9xGVeTt5RgZqFZTmhZ/E7R5bjf/FHF
         sg3g2Tw6iIhDyRDEpR/Ps/6pnPjZ5n8yd5EN2PW4ygVd1olU/HfP/RyeWLpt58ieT8IV
         yQwO+Ouj81emT+ztx/W1UiAraxDaDj/mJ2Afcj3/mKbWGQQ7vbKHhJA6D29ycXuRgGsa
         Mkz9pSoi7yFFTozJ2f3ny3l1jk911jUSn6kwnbaRdxhFpeVNACMZ8UCFMiGd3oU4cNUf
         DxIbVO7GW3TreKMsE+ZodaMIVqRD96oELF1xJdgVXTRbIfyZOoSYIbIdNEkiCD857pPj
         QoRg==
X-Forwarded-Encrypted: i=1; AJvYcCWP3HT5n6yisOyos9ja+bZ4mTKKqawdJNwl4DWKtHo48O3NlCXsd5ANvSsk8p3UnxW6U2qAdmzr+ECdZvWqsz4AxO+G0DKl9EeZ
X-Gm-Message-State: AOJu0YyLOepXr6Gy34JrUafuT5cPc8Gd4xtWzjsRsMeifQov6AR/+jit
	w+UCSIpSPdYOKRXGxt6c2lyuZ5Tp5WilXbmHm+gi2jePDBEHYjKr+98cWq6Nsw==
X-Google-Smtp-Source: AGHT+IHcBEPkzWr0QfcSeXpZkg/3A5L6PkziF30F3effJxL0tfk7Lkx8vo47sJxq0qfXhXF98wJfPQ==
X-Received: by 2002:a17:902:bb84:b0:1e0:cd89:7539 with SMTP id m4-20020a170902bb8400b001e0cd897539mr2648395pls.13.1711409850342;
        Mon, 25 Mar 2024 16:37:30 -0700 (PDT)
Received: from pholla1.c.googlers.com (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with ESMTPSA id c14-20020a170903234e00b001e0e2fde71fsm526533plh.9.2024.03.25.16.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 16:37:30 -0700 (PDT)
From: Pavan Holla <pholla@chromium.org>
Subject: [PATCH 0/3] usb: typec: Implement UCSI driver for ChromeOS
Date: Mon, 25 Mar 2024 23:37:27 +0000
Message-Id: <20240325-public-ucsi-h-v1-0-7c7e888edc0a@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALcKAmYC/x3MMQqAMAxA0atIZgO1WhGvIg4aow1IlQZFkN7d4
 viG/19QjsIKffFC5FtUjpBRlQWQn8LGKEs2WGMbU1uH5zXvQniRCnqsmZibyrST6yA3Z+RVnv8
 3jCl99gMghV8AAAA=
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 Pavan Holla <pholla@chromium.org>
X-Mailer: b4 0.12.4

We are developing a UCSI ChromeOS EC transport driver. The ChromeOS EC
implements a UCSI PPM. This driver is being developed in
drivers/platform/chrome since

1) Most other drivers which depend on ChromeOS EC reside there.

2) Our architecture might undergo a few revisions rapidly, so
   platform/chrome seems like a good place while we finalize our
   design.

This patch series creates a public include/usb/ucsi.h that can be used
by transport drivers outside drivers/usb/typec/ucsi. Then, we use this
interface and ChromeOS EC host commands to send UCSI commands in
drivers/platform/chrome/cros_ec_ucsi.c.

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
Pavan Holla (3):
      usb: typec: ucsi: Provide interface for UCSI transport
      usb: typec: ucsi: Import interface for UCSI transport
      platform/chrome: cros_ec_ucsi: Implement UCSI PDC driver

 MAINTAINERS                                    |   1 +
 drivers/platform/chrome/Kconfig                |  14 ++
 drivers/platform/chrome/Makefile               |   1 +
 drivers/platform/chrome/cros_ec_ucsi.c         | 247 +++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h                  |  54 +-----
 include/linux/platform_data/cros_ec_commands.h |  19 ++
 include/linux/usb/ucsi.h                       |  66 +++++++
 7 files changed, 349 insertions(+), 53 deletions(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240325-public-ucsi-h-3ecee4106a58

Best regards,
-- 
Pavan Holla <pholla@chromium.org>


