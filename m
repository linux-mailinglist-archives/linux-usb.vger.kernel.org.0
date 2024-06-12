Return-Path: <linux-usb+bounces-11224-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04096905A52
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 20:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A086B1F223B4
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 18:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE84C1822EC;
	Wed, 12 Jun 2024 18:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QCdTbmGh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3129181312
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 18:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718215497; cv=none; b=Dr8iMkSO8GpTm8D01CE++4zOTMVA/H4RD7e5PDKHqHKQrEX3fr4KxjbNsDrGEqyPsDuxWh5p0cvKlh0L6sKA9Uu1MD2gPOVHbgKPIF4+9k9GxiNuW+naITc0g6WmMp9HzsSkYBo5aTV2arxWfZtlo3QY8inHLilHy6uOww7/cEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718215497; c=relaxed/simple;
	bh=dFn5z5vyRgzrtdFYpRlXpNJabtvUhGHB6/rVF68SWB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iXhd/v7vMii+Ks6Ch+vH2yLiD7cqDTxROOy+bbVfiYm8DcvKYlUgldGpSIwVfaPfT+rQXJx11nt5BFoLqP8QhdmQfT+cie7u8Aej1RmDfuZt9Y/SDhuqB+0PCh4Ol3DxZr6Es3qhS/U1314T8ujd0uvL2Ku0gEMLNypZRCxoVAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QCdTbmGh; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-375d39a0714so815735ab.1
        for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 11:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718215495; x=1718820295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cGLk/OMcBRjBjppSq5kcqwVIND0/RXijKiorHpLiyN0=;
        b=QCdTbmGhOmAcvA/8/9ES99bUZ1FCtYvMmOk7oluayCuofCjHtAdaIRRhRP56mwuKln
         s3U1ttNl/hsBRcqIh/dycYaHFx9VLHDTV8Y5Vt+dSKRFj8TYRUOUmKc0qhItLha7hjm5
         CW/9FepdqizM0uGdI8L7SjhYkJt/1ZSxsRPFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718215495; x=1718820295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGLk/OMcBRjBjppSq5kcqwVIND0/RXijKiorHpLiyN0=;
        b=xHqn23v/ayGwM2uBAH+2DivVZLPxb91p8CDk1Ec0uNjfj5jk7MhE6rdjOgWqakCD4G
         UFoUbkYPbW1pOtmlYsMYrayzQRChf/agtAYoHEahQwXfHDkvochxgTmtChYdNGEHe5BH
         CR99+AIBpQamRXb34V4qShops9xaL7Kc2l0tcOSMJyOL8BKtuzYFPEw7LLNU8i4YpIN3
         /PpEJ3yV/niEg9Zk/urAtnezVoEkmTs6YxL6lYnkz8MNZvHkPkt36DYlX0mI56DUToVR
         sA7+taR06eS7K9AAKAjI8Kyuef5IC+wolJMJYEh6yXpgGiLmeR7o6cPLFUVNYEwnc3Aq
         bQog==
X-Forwarded-Encrypted: i=1; AJvYcCW9LpTs8Xm1QaqOud6FktosuTNRU4DjSIWvDgpdQlS94WzAVTO4cg8I2baQEvQ2+pIPyTHppJQr/xkL650XX5XnG2oYn8MTEhb0
X-Gm-Message-State: AOJu0Yytqryv2ApZdovxt0DRgX0J7KyVQoLY+CiPesLzjrZytiNC9U/f
	XkE7gDTWhaAnnVeokHzedczHdsE9qahhb/6ALYvs+5CYUrTfnTnQbnkNA9CHdg==
X-Google-Smtp-Source: AGHT+IHsB4v7LqoJ57mEJVyYDJIaRFk8bzEhFib1t5I1fEjH2G8m5We1R5lTyptZEifb4qZ89Cgsbw==
X-Received: by 2002:a05:6e02:1a86:b0:375:c394:4344 with SMTP id e9e14a558f8ab-375cd1e44famr26980645ab.21.1718215494896;
        Wed, 12 Jun 2024 11:04:54 -0700 (PDT)
Received: from localhost (113.176.132.34.bc.googleusercontent.com. [34.132.176.113])
        by smtp.gmail.com with UTF8SMTPSA id e9e14a558f8ab-375a8ac5419sm14516575ab.21.2024.06.12.11.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 11:04:54 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] usb: misc: onboard_usb_dev: Add match function
Date: Wed, 12 Jun 2024 18:04:48 +0000
Message-ID: <20240612180448.1.I805556c176c626872c15ce001f0e8198e1f95ae1@changeid>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a match function for the onboard_usb_dev driver. Primary
matching is still done through the VID:PID pair, as usual for
USB devices. The new match function checks in addition whether
the device has a device tree node, which is a needed for using
the onboard_usb_dev driver.

Remove the check for a device tree node from _probe(), the new
match functions prevents devices without DT node from probing.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 drivers/usb/misc/onboard_usb_dev.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index f2bcc1a8b95f..56710e6b1653 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -454,16 +454,18 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 	return onboard_dev;
 }
 
+static bool onboard_dev_usbdev_match(struct usb_device *udev)
+{
+	/* Onboard devices using this driver must have a device tree node */
+	return !!udev->dev.of_node;
+}
+
 static int onboard_dev_usbdev_probe(struct usb_device *udev)
 {
 	struct device *dev = &udev->dev;
 	struct onboard_dev *onboard_dev;
 	int err;
 
-	/* ignore supported devices without device tree node */
-	if (!dev->of_node)
-		return -ENODEV;
-
 	onboard_dev = _find_onboard_dev(dev);
 	if (IS_ERR(onboard_dev))
 		return PTR_ERR(onboard_dev);
@@ -513,6 +515,7 @@ MODULE_DEVICE_TABLE(usb, onboard_dev_id_table);
 
 static struct usb_device_driver onboard_dev_usbdev_driver = {
 	.name = "onboard-usb-dev",
+	.match = onboard_dev_usbdev_match,
 	.probe = onboard_dev_usbdev_probe,
 	.disconnect = onboard_dev_usbdev_disconnect,
 	.generic_subclass = 1,
-- 
2.45.2.627.g7a2c4fd464-goog


