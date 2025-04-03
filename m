Return-Path: <linux-usb+bounces-22531-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4E7A7AE4B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 22:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E3F6173AD4
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 20:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2D220102A;
	Thu,  3 Apr 2025 19:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ti7K4rIS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EBC1FFC52
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707788; cv=none; b=B2KdBtdqu9PJGEfeMN0yMkl4+uzltIj8HcwOGxfbYxYwuipQQDLDUGzMaWE+x/XVjLGQtSgbbd+ckNHkJ6I7mVD3eJBzwXD831YgQwLakMQtgFE7nLvqr0HP5P+LHM4Ch/twgu2WTx36fXnV9OPYnpCD04RRM2giIClRo7B9OMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707788; c=relaxed/simple;
	bh=OOu5uUVRp5bNrm10Y7Elq88mwpICvefQHhKqbDlAYuk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BndwEoD8exqthPeKmcJI12jUG8j+6MdplKFmCv0pLT0oenSPgV3nrbT3CtBywsYFij4S7rZMM9r5UNKvDg16WZdXHHPj0rd0kg1RnqT8wBP0WmuhnEh4TpgmG9gvL9I13agaUs09HJ25eXDBo/pclS+sTASJ9LRP0fhJQUNv38k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ti7K4rIS; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5497590ffbbso1354800e87.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Apr 2025 12:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707784; x=1744312584; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZyzJh3mfyCoTqN5jp6PExNK9PmJ9vF6+zZHPXer6SU=;
        b=Ti7K4rISjY6mhIQl+zP5GZy5YPbxtfCe6iavRQPGqdPKc5uzi2nZuciqu/iSLRBDVw
         ZbWFw4knoE4i5JOm5ULBMG5OYQKPwdFI91cnQQiA7V2Ww+A95w8FQGjAoKwU0FRTA800
         QPFS++f9v32o1JpsDpt71asE+Bf2Cfwd2RqMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707784; x=1744312584;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZyzJh3mfyCoTqN5jp6PExNK9PmJ9vF6+zZHPXer6SU=;
        b=kjhiN5yvzL7YjVNtyl46uWKFwmEgahYjDglBR9Y5LBUobg8rRMfkAQwJa1q+Kp38IK
         9wodvwYkK+yXIYeJuxqbECIgNKzmrQK2UqYO1ooE7GM4/awSBEr/S2uRCZL8S38ZO9Wx
         z3sdeuRbl1CTJJJ0s8sp5o3QzxbiPr+pXt7tBMVNkb9O8dQdyA6oJzTKVuaKFvEX2doD
         R8lksYpQJoLe5U6q5s/KyH+TMufsEUO1B3wPDhstFaugbwH3hCBF33lKaQ+OZ+vCP2RH
         Q73Vdt9lB8tg6wSurT9fwXvFRbX7fGI0AgT6i63Mgowk4VUi81Ik0KDXMDFCbRFOolxI
         cMsw==
X-Forwarded-Encrypted: i=1; AJvYcCUVTz+PEdrSiTWY6QlTyIkTANo1Y6BCiwONTy+7o50GkT15Bx/brwCtO3Z+jBmaxCBPJe+YBZXvnT0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy659pId5c7CgsPRIhP78CiV6mHTQrzKcDkAw4lyjYbGdUl2XYp
	dMQYcXV/n7x+SZ0T9t4HCA2M+H7DInRPvX2s8w3bMY0LEKvS8+Xs4bwNTrre1g==
X-Gm-Gg: ASbGnctCHtNK5vGCpR3APFbbIpvfYYuRp8juWLBfmkyDQ9jEvqFKYcwsAdCVwJzNemZ
	RFfmjJjKNyzptOqCjYxMiNaOgvDid6w00Owl9/kWAZQBEiDh689lcIQZkoGA+rqE2/ILKam/0QJ
	ubNGyOkfTKAZtQzXeTxca2rSdiOZWgIv/cU2tbmnH3Zna0vdUYHJ6GBXwvrzVc7msMCtDKHPwq0
	n0HdrqX7YyPHkIOmcTCiCfDJhu/6xRpVEXrWKAzj0WRx60QPVrV0su5dOiVRE1CvngRSzcGK47M
	B/o8ZNlvz3Y7vqJPgj0tmdoWcLoBE2g7QHGLRF7empL+qNkpU221pDALy0g8M2NWPReK1oMB4yf
	STgLWhipFUPdELHSRHmmxUQcX
X-Google-Smtp-Source: AGHT+IHifPA8y75Uvt8/h5dkWWov6ic9+zVOw/bPq0NuxszaJoiYbn+TCyRg03Rw66ZLpx8pcdWWfA==
X-Received: by 2002:a05:6512:1389:b0:54a:cc11:b55f with SMTP id 2adb3069b0e04-54c22785246mr117481e87.22.1743707783922;
        Thu, 03 Apr 2025 12:16:23 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:23 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/8] media: uvcvideo: Add support for
 V4L2_CID_CAMERA_SENSOR_ORIENTATION
Date: Thu, 03 Apr 2025 19:16:11 +0000
Message-Id: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHve7mcC/x2MQQqAIBAAvyJ7TjBLor4SHUzX2ouFmgTR31s6D
 szMAxkTYYZJPJCwUqYjMrSNALfbuKEkzwxaaaN61cmrOnlwEost7EoThtCO3hrrV+DqTBjo/o/
 z8r4fZe88mGEAAAA=
X-Change-ID: 20250403-uvc-orientation-5f7f19da5adb
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.2

The ACPI has ways to annotate the location of a USB device. Wire that
annotation to a v4l2 control.

To support all possible devices, add a way to annotate USB devices on DT
as well. The original binding discussion happened here:
https://lore.kernel.org/linux-devicetree/20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org/

This set includes a couple of patches that are "under review" but
conflict.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (8):
      media: uvcvideo: Fix deferred probing error
      media: uvcvideo: Use dev_err_probe for devm_gpiod_get_optional
      media: v4l: fwnode: Support acpi devices for v4l2_fwnode_device_parse
      media: ipu-bridge: Use v4l2_fwnode_device_parse helper
      dt-bindings: usb: usb-device: Add orientation
      media: uvcvideo: Factor out gpio functions to its own file
      media: uvcvideo: Add support for V4L2_CID_CAMERA_ORIENTATION
      media: uvcvideo: Do not create MC entities for virtual entities

 .../devicetree/bindings/usb/usb-device.yaml        |   5 +
 drivers/media/pci/intel/ipu-bridge.c               |  32 +----
 drivers/media/usb/uvc/Makefile                     |   3 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |  21 +++
 drivers/media/usb/uvc/uvc_driver.c                 | 159 +++++----------------
 drivers/media/usb/uvc/uvc_entity.c                 |  11 ++
 drivers/media/usb/uvc/uvc_fwnode.c                 |  73 ++++++++++
 drivers/media/usb/uvc/uvc_gpio.c                   | 123 ++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h                   |  21 +++
 drivers/media/v4l2-core/v4l2-fwnode.c              |  58 +++++++-
 include/linux/usb/uvc.h                            |   3 +
 11 files changed, 349 insertions(+), 160 deletions(-)
---
base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
change-id: 20250403-uvc-orientation-5f7f19da5adb

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


