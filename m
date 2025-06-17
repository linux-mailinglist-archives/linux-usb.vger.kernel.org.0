Return-Path: <linux-usb+bounces-24834-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CF1ADD037
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 16:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A5AA16BA40
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 14:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3677F2E2666;
	Tue, 17 Jun 2025 14:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YYMzb4YF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A823B25C706
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171356; cv=none; b=LfanIdsKfDtsVjqht8xhAyyv3+GguAvjE/l7oTbfsyj5NKpi3hYfLLzwHhtCXPyZZbuUBIpQCSRkKOQcllEbqveavkHS+zp+6V/brIwvWoIzp4PLo3abh0wK7d/LEWlg3BUHAEt1l9DmxD5GdObaUQUZwnQJk8LQUDM1pEqcwlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171356; c=relaxed/simple;
	bh=z9afmbfslk+OIL3RmqQEpk4yStHq/QO3InjB/6ZBCQs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jTeGWJHs6hQUWwOg6lkpusHoqMBPFQ0EUtwjck0pO8SvqNdRQ+gEHTJEHtNhQQ9l7o8vAZO1KzG29g1wGB0yXCiyTemZFmahtSLCZcRxlP5Y9hsqArm5NZ0maDJzLWLyzPnWonRX3JBVeYmh4AskkwUTRf8WbxPKLoX22d48wBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YYMzb4YF; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b6a349ccso3433571e87.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 07:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750171353; x=1750776153; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/YXd5BO13SOl3Wd39GbkaobYlJMrxTyr2XePxfsZP0=;
        b=YYMzb4YFDINse7/PlCSHx+l1y9ubnElFmL1qxaijzGP8+Ts4P4ObIGvV2KsYatrBlP
         fSz8/cKqRTJgInN20vsqwEemVm+ucyyvRR937hQMK5Tbrtr5VpyMfT+grqzM6yNE+VrI
         By8cJvu8nEaNzcqwMq6sHE3syIslnbS14Md44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171353; x=1750776153;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/YXd5BO13SOl3Wd39GbkaobYlJMrxTyr2XePxfsZP0=;
        b=tJ4HT3ZGMZKKc3JGe0ptODl0ipED+q3mcaaCi07VDTdeejJXv/y7tT+Dwh3xhtXWil
         1spwvLDCDEMKLqcijvBhpSQ6a2rpCedURGHhJuZD8ehQ4NeXcMnFwEN8TrDWIpobY0Vf
         vJQsslUrDXVDbvdc6AmmY4jWM4AAvjyIkXwp+6Bpm7EfQrbnEw+ukvHDOAPFSuHZ0CCS
         hyaGopyuu2zCNkEt7Jiye8ox96LlvCCY4vghMhD4PuCoYY7TD0GbIg8NC1EWuyiqsPcB
         4nWSlvfJlRM1BKRjquU4cSMs2i4a3YOPwNP9SdRTdU6mbxGBrMiX4OTf8wnxZoxJv6OP
         cPvA==
X-Forwarded-Encrypted: i=1; AJvYcCWkTOt/dQAKmL0B92+zY8THat5LmwoR5aG8lAAUw/mMqBTMjxu7FdX5GWibySbaYzSaR0izKbXBT+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQeYob29qqTFS8aax8vriP2vTFbs9hVp3y+2k3jTXLvUVF+wqo
	PWWaeskvyIwKdoZn3CGaAxYz7wkBgcXKBKnmc3F3K0zmrbgb92pC6/e3rovpIr9Y9A==
X-Gm-Gg: ASbGncujg6tu0hblLdS6Y3zrLgUW0W9Uz6wXwP5gP9DhmYrbRLmwrE80601kkJowsjd
	TEKpJab00TOVJTc1XhmvcyzOt3Bqcn4lCoG9/R8KJgWsOA/qcdzzHIZj2nxgjQCvYBFiSJEo0i6
	Syf/n2xecF9dZzeS7KefL+h9mb+gkVoEsMsvalapNWcXRgfuzWGQ4VHqrWsStnFg7sexAZupPkP
	qGtQegyJTG37bhVhVkdKdGPtocPZp3f2V0ugFRsGxSdAxI13xhAwgF9Zu0ZHLTr1399nrLXb9pM
	UiB1978p8RkEJYUKrpFdKFV0cf4L+c+zAQEGvsIEPAgw7CrJGdlGDIM8/fyTll7+pDWrvuIGz8n
	Ry8wKYSf2LVY91qJaUsXYFiciIfgb8wU6RdPhlQ1dExeqzLN07YMc
X-Google-Smtp-Source: AGHT+IHr7PhxVGJnuMKthmWF/Mg1Looptz4cOMLCSvwica9ESVLBExnQdDMxEUUBejM4ufXZds+8+Q==
X-Received: by 2002:a05:6512:3a95:b0:553:2c65:f1d1 with SMTP id 2adb3069b0e04-553b6e8be88mr3347203e87.13.1750171352743;
        Tue, 17 Jun 2025 07:42:32 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ae234437sm1814992e87.53.2025.06.17.07.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 0/5] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5 + other meta fixes
Date: Tue, 17 Jun 2025 14:42:21 +0000
Message-Id: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM1+UWgC/23MQQ6DIBCF4as0rEuDODDaVe/RdEEAlYXSgJI2x
 rsX3dQ2Lt9kvn8m0QZnI7meZhJsctH5IQ88n4ju1NBa6kzehDMuGLCSTknT3o6KWiEkYmkKriz
 J789gG/faUvdH3p2Low/vrZxgvR5EElBGK0SlJKCoUdx0F3zvpv7iQ0vWThJ7Czsrsm2wrhEaz
 Q1nB1Z+rfyxMlssoDBQ6ZJz/WeXZfkAHdmtNxsBAAA=
X-Change-ID: 20250403-uvc-meta-e556773d12ae
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hansg@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

This series introduces a new metadata format for UVC cameras and adds a
couple of improvements to the UVC metadata handling.

The new metadata format can be enabled in runtime with quirks.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v7:
- Add patch: Introduce dev->meta_formats
- Link to v6: https://lore.kernel.org/r/20250604-uvc-meta-v6-0-7141d48c322c@chromium.org

Changes in v6 (Thanks Laurent):
- Fix typo in metafmt-uvc.rst
- Improve metafmt-uvc-msxu-1-5.rst
- uvc_meta_v4l2_try_format() block MSXU format unless the quirk is
  active
- Refactor uvc_enable_msxu
- Document uvc_meta_detect_msxu
- Rebase series
- Add R-b
- Link to v5: https://lore.kernel.org/r/20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org

Changes in v5:
- Fix codestyle and kerneldoc warnings reported by media-ci
- Link to v4: https://lore.kernel.org/r/20250403-uvc-meta-v4-0-877aa6475975@chromium.org

Changes in v4:
- Rename format to V4L2_META_FMT_UVC_MSXU_1_5 (Thanks Mauro)
- Flag the new format with a quirk.
- Autodetect MSXU devices.
- Link to v3: https://lore.kernel.org/linux-media/20250313-uvc-metadata-v3-0-c467af869c60@chromium.org/

Changes in v3:
- Fix doc syntax errors.
- Link to v2: https://lore.kernel.org/r/20250306-uvc-metadata-v2-0-7e939857cad5@chromium.org

Changes in v2:
- Add metadata invalid fix
- Move doc note to a separate patch
- Introduce V4L2_META_FMT_UVC_CUSTOM (thanks HdG!).
- Link to v1: https://lore.kernel.org/r/20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org

---
Ricardo Ribalda (5):
      media: uvcvideo: Do not mark valid metadata as invalid
      media: Documentation: Add note about UVCH length field
      media: uvcvideo: Introduce dev->meta_formats
      media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
      media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META

 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 .../media/v4l/metafmt-uvc-msxu-1-5.rst             |  23 ++++
 .../userspace-api/media/v4l/metafmt-uvc.rst        |   4 +-
 MAINTAINERS                                        |   1 +
 drivers/media/usb/uvc/uvc_driver.c                 |   7 ++
 drivers/media/usb/uvc/uvc_metadata.c               | 133 +++++++++++++++++++--
 drivers/media/usb/uvc/uvc_video.c                  |  12 +-
 drivers/media/usb/uvc/uvcvideo.h                   |   3 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/linux/usb/uvc.h                            |   3 +
 include/uapi/linux/videodev2.h                     |   1 +
 11 files changed, 175 insertions(+), 14 deletions(-)
---
base-commit: c3021d6a80ff05034dfee494115ec71f1954e311
change-id: 20250403-uvc-meta-e556773d12ae

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


