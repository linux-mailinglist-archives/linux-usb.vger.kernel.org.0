Return-Path: <linux-usb+bounces-19625-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8711A191F5
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 14:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FC09188CB48
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 13:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3C91BD9C7;
	Wed, 22 Jan 2025 13:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsyXdtgi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E424C74;
	Wed, 22 Jan 2025 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737550867; cv=none; b=WvV3HQWYhT6sHC6ueVMwXL8ZXif7A6jkcGyDWZ3l5GNLXPeL8ZBpoGx6B/tG6qlECSGKPWy3HYxchZws1QEiqtUpkCQ3s968nhM7CH+SOtf1ndGBjVQHIOHYXuocwP+OU1dITRswviCZq+7o1jpD26G+jCyFggo6DYnk6kjgn1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737550867; c=relaxed/simple;
	bh=bweXlYlA4G/768S3UVUOkyA16M4FSmJet2KALg2BCIw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H60J051jLZEfJO1SC227uii7dZuI4VodFG1hc3sQvMOE1PBW37EtP/f3SoXIVaSGmVI17I0m5e2G40v22Qf3KchZHdKQDhSs7JIm8ilK1MPz3TLFPsCkD6NT9npzCI2hH64km0TX66cva1n4L5ChzANzWIz4V4OA/l4H8iYCi6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsyXdtgi; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so6025944f8f.0;
        Wed, 22 Jan 2025 05:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737550864; x=1738155664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5E0WUbELdmaJJ2l9mLWqLaWd4rD6WRHIG0+xSCyWuos=;
        b=IsyXdtgibpcjWr2EVFt+mU+1F2gOFV2+evPMPNUUjqgJrdywR2l37MMXJR2mWMAsLg
         p52JOBDhYXhzX1G83TCmnYhvSyKsBi6nAXqoZ/2J7vgdhqDcD+3BCZnfatEpfOx8wpcx
         TluLEpsW/itLQyW7CJIp/QHoGcZ2fEBoyxhFGOdlVOA9XhRqj67QfWFI2r6wnbk5ycCl
         OCrl7jlZ5rtXWoyhjNqufosUFda9Ew34I3WRHm/LfgUZELJrSZrorDKJcNZS4N1BF0OS
         7Cv4p3X1fwByx4gl4O6TtkKcrBy/C7lU8qoFWBnDEuvl9+0LdpKfHg+DILtw8h81k5oi
         3H7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737550864; x=1738155664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5E0WUbELdmaJJ2l9mLWqLaWd4rD6WRHIG0+xSCyWuos=;
        b=cU081LFllQCM+kkBG33UL14qlqFvuUNwyfT1fIkmqQ1iv0FiqnhNm+LRDYdcWbdO5o
         VNtvBU+MLkX4Rbmz0gb2kKTTH8acQEy3xz4TjGnsFT0Qm1GN36eLmrnMbkMQrla4dyXz
         CgmYdmOsDf4fjZ0kPUQEek7yU8B23TaAbX71jgYHj8M2REUT2OZwrlT+trG249CQZp1H
         grdlDhsOXMhxte+PXL9rUitXPTU6rLPWHUfX6xwzjRjD++2D+ufvIk/UoooyMh3GTZ67
         3PldLpEV0yenuUeiLmZtgUiAcDvKkn2OIVHW7xupLZOTSI7gsNUt7g/fMmeMB/sKFXzt
         d39Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyGzWYoj4XilXFMJF66bVgXzZyuFulXV/+iRnZLxKZmh7aSSTDWAFDqzq/sCkWCeYz5jw5+fYvUhXcNFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCs7Oe4z5/CpQmFKqxz5tpJvMVQNkfM3kgE7/OvsDHWV57TFqt
	h6so9hUGduMfmbmMtI7MwCklsuSU5xsRtos0KEnRPsco1wvbpTLL2/Ofhw==
X-Gm-Gg: ASbGncvgFFurcT56sV2oHH3SLcTkFYBuGy+y7Sc714WYgR+aLdVl6XY+rZCmf6DGtkO
	iyeoM7JsC+ON7eUivgC2RmrNLEuvS23gCdKg59z4hkWE3fU3ZD7tfpfsB0EeFmUAj/TRUzgQ/n5
	HVTknNAymuLcwJqYAIA1brOsrTeJhPjnolaYll2HoK9L4NAWCslWVvH521NoGqn7mJjj0XDSsxg
	8dPA2sErgFT7IMUfqkLYOOwQGIkskQ4jvjW7zeIZT4ypSCMhOzca1eUTIo8Pv0Sx5a1y7AjfEm/
	By3G
X-Google-Smtp-Source: AGHT+IGgSjH/qMmmjU+b3JEwiZixKzada1K2kTb0Z3YF0edXmmWK6KcIQNQzM6pbv74gG9nUyuI+wA==
X-Received: by 2002:a5d:47c9:0:b0:38a:88ac:ed0d with SMTP id ffacd0b85a97d-38bf566343bmr15461569f8f.12.1737550863472;
        Wed, 22 Jan 2025 05:01:03 -0800 (PST)
Received: from qasdev.Home ([2a02:c7c:6696:8300:60ee:6158:3505:672])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32151e6sm15936597f8f.20.2025.01.22.05.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 05:01:03 -0800 (PST)
From: Qasim Ijaz <qasdev00@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org,
	sergei.shtylyov@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
Subject: [PATCH v3] USB: usbip: fix null-ptr-deref in status_show_vhci()
Date: Wed, 22 Jan 2025 12:58:57 +0000
Message-Id: <20250122125857.25157-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If usb_add_hcd() fails in vhci_hcd_probe() (i.e., a probe failure),
the error path calls usb_remove_hcd() and also sets 
pdev->dev.driver_data to NULL.

Consequently, any subsequent call to platform_get_drvdata(pdev) 
(which returns pdev->dev.driver_data) may yield NULL, causing a 
crash if that pointer is dereferenced.

Fix this by adding a sanity check to ensure "hcd" is non-NULL
before proceeding with further operations.

Reported-by: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=83976e47ec1ef91e66f1
Tested-by: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
Fixes: 03cd00d538a6 ("usbip: vhci-hcd: Set the vhci structure up to work")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
v3:
- Added this section to comply with patch format requirements
- Removed the extra newline after `hcd = platform_get_drvdata(pdev);`

 drivers/usb/usbip/vhci_sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index d5865460e82d..d4a1aa6d06b2 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -76,6 +76,9 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
 	}
 
 	hcd = platform_get_drvdata(pdev);
+	if (!hcd)
+		return 0;
+
 	vhci_hcd = hcd_to_vhci_hcd(hcd);
 	vhci = vhci_hcd->vhci;
 
-- 
2.39.5


