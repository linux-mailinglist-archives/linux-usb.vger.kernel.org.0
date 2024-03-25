Return-Path: <linux-usb+bounces-8337-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC2E88B57B
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 00:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DD1F1C38A27
	for <lists+linux-usb@lfdr.de>; Mon, 25 Mar 2024 23:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DC384D30;
	Mon, 25 Mar 2024 23:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YqVRToWf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC4083CA4
	for <linux-usb@vger.kernel.org>; Mon, 25 Mar 2024 23:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711410149; cv=none; b=UrfXWoEP3kWzSfNE7EyWSf1HqSx9AqfZFna+5DTv0fFqU3n1La8I9O9Y1FtuLWter3ciTOgzBGjOaaqmABLLt6rFEzJPRz9/xKvj1tpYbcZ0B5ziNWEXhsl0keJjXPX7zzZifgpYtbzSiJ/JppIGtLvNazsmXeU5Pfd+5Y+ywQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711410149; c=relaxed/simple;
	bh=1hd7YpQ7hQwnxXcI9b5Po9F83x/ePee1k7tMWUZlawY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cBYO6pu2l/SJ72WTOrnDGBCi++JHHjVQpQm+hjcWNmmIX8yQm2e2t/tDdv6mH2LOa/stkK3MUatroWRe/tigLd5X1K500x6QCmeA9ST6OnZkEoGAZxh0EoGXeKGSUWGmMXNLGwlIhqX7mONyIHIZZ5B8/Srx5Q+Oks8rp2LRSEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YqVRToWf; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6b5432439so3766696b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 25 Mar 2024 16:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711410146; x=1712014946; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mwaCyJsz17AgoLSOr3XyXPNKuRaqFxfz3ir5v+CFYwU=;
        b=YqVRToWfDwKdMtfFJfUJu2PD3qnoBNP0vxcDZ/ts3E4a58N+dUeMMLRwefrdKudZUh
         1AtJ5t3emRlORTioTnkZ9rMtd7HAy71A8DORKZnFynmOb0hDGFaN/Laba79QV6AWAV3I
         BWg+/kkAt6UTkMGijv/hWrISX+gBysNmEIGy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711410146; x=1712014946;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwaCyJsz17AgoLSOr3XyXPNKuRaqFxfz3ir5v+CFYwU=;
        b=K2522SP7JlAbUL5zhmq9aRDjG9Q4KkWRFDkM0rx6wpmrzMqDE8Uc+bDKfiRjoEjGV5
         lLGWESb6d1NvteJylGTP+GR5XHnPaU2UqA1gF73LGYY/z5QSXYAO940qgxbMV9h9VDyi
         eKNzasGUgWGeHVg53HFTPANZvc2UeqO5u0L6DMNuhvzRHls/E1TNzeOQ4lBQaF/8eUG7
         RRtk1RkOyx1EQmnOXH5W+onorPaFNFQH06lrj+8rRj5aCTG4VYyg6hr5aOc3PDh/K8QE
         9jptd9jezU5xX5v4xtktogNcvCL8dSrUhiKxVI4TlsNAYBChVx1cmYSBVsx7U/WsrSb1
         yprA==
X-Forwarded-Encrypted: i=1; AJvYcCXsNLOfer8qL8DgS+tsyWwwumFHLd6JJHm6ncWK8ukvhHeAv28tGZKAUXPHYs4wW4JlxTW1PXoLea9MwrdH3i+IFM9HeeEb6QdB
X-Gm-Message-State: AOJu0YyAoWJnpLDKQ0bCl88Im0LTG5cXeofq/NFEEblFb4WnuQymTSb7
	bFGMfQUynp6pdbFqRBx9JOE7g5Nx1kzL71n/Xg26b8c9a7UmdsPLlkMvX9Zh8s46kNAb/JjLl3A
	=
X-Google-Smtp-Source: AGHT+IHcXRhOkEXvObxQ0tQ+Vis8HUcWqaWZDTWLrnQuWAKccLbAZLusm/dPdM5IveoBuuJ72krrXw==
X-Received: by 2002:a05:6a00:986:b0:6e6:5396:ce43 with SMTP id u6-20020a056a00098600b006e65396ce43mr10909343pfg.7.1711410146625;
        Mon, 25 Mar 2024 16:42:26 -0700 (PDT)
Received: from pholla1.c.googlers.com (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with ESMTPSA id e12-20020aa7824c000000b006e5f754646csm4705250pfn.139.2024.03.25.16.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 16:42:26 -0700 (PDT)
From: Pavan Holla <pholla@chromium.org>
Subject: [PATCH v2 0/3] usb: typec: Implement UCSI driver for ChromeOS
Date: Mon, 25 Mar 2024 23:42:24 +0000
Message-Id: <20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOALAmYC/3XMQQ6CMBCF4auQWTumLSCNK+5hWOAw0kmEklYaD
 eHuVvYu/5e8b4PIQTjCtdggcJIofs5hTgWQ6+eRUYbcYJSpVGlqXNb7UwhXioIOSybmSqtLX1v
 InyXwQ96Hd+tyO4kvHz4Hn/Rv/ScljQobathaywOpviUX/CTrdPZhhG7f9y9pFmlVrQAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 chrome-platform@lists.linux.dev, Pavan Holla <pholla@chromium.org>
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
Changes in v2:
- No code or commit message changes.
- Added drivers/platform/chrome maintainers for review.
- Link to v1: https://lore.kernel.org/r/20240325-public-ucsi-h-v1-0-7c7e888edc0a@chromium.org

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


