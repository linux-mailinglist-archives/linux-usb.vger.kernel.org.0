Return-Path: <linux-usb+bounces-18652-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3B99F6AE7
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 17:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 874EB1882639
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 16:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8E01F76B3;
	Wed, 18 Dec 2024 16:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0GESqvU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30241F5421
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734538701; cv=none; b=H/WqesnEwZpxyS6tBZxIQjIfCwVeEDxBq3qBp7Q9+HXv1Si/tVk3XuTzq61ex/IYservnKE2xat7E2p2tZOIhjYYfpbPxv6aBdwLPg6PTnM7cw+dZrZAzQEqu5/wDGYGUlmU+GLdUccCNznEitOk4CYHViSvHlviZ6pGWb0FHmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734538701; c=relaxed/simple;
	bh=4VksiS7mXkSB7upNI6iRMFcbW968mMFDuO6RVMHkT08=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jL9e0ZesftkqkSAfSy8b8TCMCnl0ciFohPbYLWFyq/NPGbjpLYlB1oPdarNIw2caOqxaYQqWlQ+OxiIBWIwiuKvkUsD1wQNFZfxrNnmtRrQ+hMEQIil4mHDpiJhysVx/w8Z3e1aTWafPBfzdA3idSn/Khfi6lIZVI7YA32lQDXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0GESqvU; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso9076556d6.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 08:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734538699; x=1735143499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nqWxX5TN9CWIaaeHPzpt6gY7UajTHBMEJducnYZFe/c=;
        b=I0GESqvUvStL+gBp0JimLyf+92iXMwj45iOUYgk2mUOrtV3uzN4/voRMx6sHBtYiZs
         7GG1bP5OMyvn1KhC/DGaIE15FwBCW3Pqgl6arebwPjMYDfBPDIy1j6lMgo2ApKCSTDga
         8YpVBEXyW0jwvOZ/vcaVCgSRvNEozx0Jj1droypJMqcWuez8aMQYeyzKRka1rJy+9cgg
         +xlvy20yRqOULGxJ+Cf0t5ZzklPRacKqmayxaZj2YUuMGT+p71UmEpfwKgkbY/pWeods
         WMj4e4xn8xYjp5lQtH3IgsNocbkXM4tVdgLaocANtxDspldVzqG+jIoZ3BeoHu9q0ytv
         bWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734538699; x=1735143499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqWxX5TN9CWIaaeHPzpt6gY7UajTHBMEJducnYZFe/c=;
        b=He1sACS+A9EgTojvXZzqWIN58XJipuNTHPXKKGW0cTKVYi1zdFqbIVdzMbVoWi9y/O
         GARVcwEleHSXuYARo6MQKbE3+8f0rEXITNkCOlWU5tKokCex6kT6uX8T6dcEPlIoZqXn
         1F5s8+zLnZQSN0OiMB9oABQwmUXB+jICtA0RRFV5E65L6wPfhzGL1X2nv5mhvA8JtzkT
         tEJLN7PRRJgwhcSqbDHTKgRqW1XUnyltcesVKTYk3bWZUdbNk9QqS/OzexNYXXQHuu7q
         s80G5fRPAbGq+/EhWru2k6wjsMx4dIp1IK+XwTwaBIZW2EPMGOCPMut2WSUAB7q8AWcf
         7WtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSwGZfXs2Mvf+zvQaWgHsgem64KOx5XR8Pu9SEIgaaH1dqIfgxez1GlrTIDCjwReXSnFB8pvuwYbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUWmlRwuFkiMOdcEJtRBfHmICewH5S+D/0la0O5Kvvop8GAdLN
	b7GD9xpDqAgs2maFc1Mg+peF6r3XUtd4w0DkHFNrQ25k6QuRKZqA
X-Gm-Gg: ASbGncvu7uvLMjIW4z5vOVwc5GivBbbGx+qbor6uHvGZsK6CnyrfWSgesDGbqk5VOBM
	I0J/Mc+kxWV64Woc/AmlbNB1cDeNOxr0dnFGOzf3IYuXIlZnEZtHzq+pCzCaHI4xvxSPRkFalw0
	vCnEqKvhhQDCY1O+jF00F/7SRPoNs/hx/LVkfRp5UJ4T2GGeks+/2L4cTnFgIViditLaEmOlbiD
	KENMe32YShIiFkhXG8aPtjoo68NBGex4XJYgzlOSwkRVgOrFtlnuK2/oEb6/xNW+mmxwQ9Ufbjo
	ZXeMY9FqhzQ=
X-Google-Smtp-Source: AGHT+IEd6CUCSrRBzZ25y3oohMjwrolUydZ3YtI88xA+FqB4zXj3dukTFscaa5tGxwH/BiCs04PfAg==
X-Received: by 2002:a05:6214:e4f:b0:6d8:8d87:e5b4 with SMTP id 6a1803df08f44-6dd14bb22d3mr3212416d6.19.1734538698679;
        Wed, 18 Dec 2024 08:18:18 -0800 (PST)
Received: from IT2036.raleigh.signalscape.com ([209.194.233.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd38abd0sm51447326d6.123.2024.12.18.08.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 08:18:17 -0800 (PST)
From: Jason Long <jasonlongball@gmail.com>
To: shuah@kernel.org
Cc: valentina.manea.m@gmail.com,
	i@zenithal.me,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Jason Long <jasonlongball@gmail.com>
Subject: [PATCH] usbip: Accept arbitrarily long scatter-gather list
Date: Wed, 18 Dec 2024 11:13:44 -0500
Message-Id: <20241218161344.202637-1-jasonlongball@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes issue where memory will fail to be allocated for larger bulk
transfers, ~1 MB or more. This occurs because userland libraries, such
as libusb, send the entire USB data buffer when SG support is detected.
The assumption is that the driver knows how to properly split the data
up before sending it out.

By hardcoding a limit, bigger transfers that exceed the SG tablesize
limit of 32 will be unable to use SG. This results in an attempt to
allocate contiguous pages which, unsurprisingly, will fail too and
returns an ENOMEM. It looks like other drivers that support SG allow for
any length of SG lists. Accepting any SG size allows the driver to
properly handle large bulk transfer situations.

Tested bulk read and write operations using the following devices:

 - Logitech Webcam Pro 9000 - USB 2.0
 - SanDisk Ultra - USB 3.0
 - Logitech M500s Mouse

Signed-off-by: Jason Long <jasonlongball@gmail.com>
---
 drivers/usb/usbip/vhci_hcd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index b03e5021c..2f722849d 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -1161,12 +1161,8 @@ static int vhci_setup(struct usb_hcd *hcd)
 		hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
 	}
 
-	/*
-	 * Support SG.
-	 * sg_tablesize is an arbitrary value to alleviate memory pressure
-	 * on the host.
-	 */
-	hcd->self.sg_tablesize = 32;
+	/* accept arbitrarily long scatter-gather lists */
+	hcd->self.sg_tablesize = ~0;
 	hcd->self.no_sg_constraint = 1;
 
 	return 0;
-- 
2.34.1


