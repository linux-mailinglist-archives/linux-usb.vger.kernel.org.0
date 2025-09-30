Return-Path: <linux-usb+bounces-28815-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27848BAC211
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 10:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C16471679E2
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 08:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E112F39D0;
	Tue, 30 Sep 2025 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRyzqPCL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E308224B01
	for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759222153; cv=none; b=H6wpNEZnCQyJRnQcVMevewFG18Ulg3VaSao7e89Dm763coMBBZcqCbVKKAnPpjndrkm41gSysrpa/JH9Z3Zs0Z23nyc6n3Qy+twRmpRVv2olY7trvGhLZfKQ0XqC/lG3AfTGRLexGfrBfw66GpAHUx/HB4+9U49uePK1giKDQ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759222153; c=relaxed/simple;
	bh=FaBjq+b096JR3LdKULnMiCshllEkboYo4jX4SHLBShU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m74e/ZvM9zLUeCkEqROka1IyBEqH08vOPTGL9FtPW5SsKjZ6Tyk/v/s+NFI+0dzENEJDbD0Uk803uRoXGXKpJYhW9790S6XWWhDkMTtvBtv90ckNdrdjTqPHID95nPjD7YFTQdWQ3KPaR/+xVqno4qYXtS9fMmxNCI5LAJySs1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRyzqPCL; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77f5d497692so7887845b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 01:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759222152; x=1759826952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mNx5UNuWQA/zkctg0q6HtsfqKmsRWnVIXyFIJxaX1Ro=;
        b=SRyzqPCLlVX2tnaEhDXJj8j0zBSe8aj4cQBz/RiyhFhgQTZmSnAeYkAIN5YQdXgJCd
         tONuV7VDGke9GRE16Dy1WGhEs3q470nEG14QDtoQJhQU0WDue6K0INWT/31Ec98CA0ki
         1MV1rKSAUpqCMgW45ftOG6uyzPIWUatN3STKG7GAxOdRMkjsaXfkov+U4xNYEUPM0jeC
         GSodKLX+FOOOGnHOEfMyVPMxMrXvmYBRN9jndQzqmP6ZJEWVX9CeoM+u2+v/ITNeoYxW
         +FrrTJe4O6gEdZd3xh+y4e/pNjdf+G4J1JAoQmsCjRLXJFEk52prSiKfw8+VmiUnHi/3
         V/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759222152; x=1759826952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNx5UNuWQA/zkctg0q6HtsfqKmsRWnVIXyFIJxaX1Ro=;
        b=aMKTJXUA2JPuD8uTHARRbSNAiON20vQUdujxV7SnqNWKvnMDtG0HeUwqX6/SnkXy2z
         ps+KKe7T0CZNl36gKejOIDYENBvvYeL0yvfltErj0mrjb3hUfMb4OlmgMNhYgqsHqLeo
         EPrI+7P4SUOesN5o/BLW2zuGqWBEzti3rhijWIX5V3Ul7MQSxc8w90qLCHgWHexxR5Bt
         ThSmaoRX8reGOFg/lZz6OihEJ+4mKPUexoVLsPrhGDkFwosSMUn4gRL/Pwc0OcyuS45V
         Gn807dL0wh2GACwuBsVG3zxq+5IO1g7SWRBAALKvBMKgHNGj+jkjhyQ4cfY3nkDJsDVU
         cPhA==
X-Forwarded-Encrypted: i=1; AJvYcCVt2NvSeDQuUjXXd74I5LYSb7FbFWPGASO32NMS+bZlhBPtvcPUulb30Wda2zm2M97Yr4HGJWK6hGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcKZ5rIh2WLcOBiTKfTu9JR4ylJzZsIuzDri8zz5JjgNEWRz6u
	M93h2c++ZmdVCumKxxpyUeHz1jjzOhWCfMySiLZx1SeVZ3vdSSzvH0i8
X-Gm-Gg: ASbGncsPgRgjZx0ZrUWe6HT1CXhOE/PkslPp5B+t4GyvSMLs1Hu1BRreGpxIveOpJx4
	hI87L8Kxm7zlECWZfvGFVGKJNapWs0ojJyErwpmOs7N/V1Rm5uDHj8xlVM8sZK06eYckDV6Bimc
	t3N+eMAFdPJxtR1zL2/v+0oNQ6ecFFpiTFESEjt9hqLsOc/oUmDGh1ll4eYUioJjGv/sqJigQvb
	3tqOzR9KJtnM7aPQVixdFlBG0CJaMaZelrNujtrrBhpNfIUHWZK//LyU1SjiFgj4HHdGcTiVbXV
	SsNveD6lXgiNLFmiJ99++dgzXcwW9ZRIlkcU7wPM5Jd2WPC8l9xP3+5vNFJSHvz//F9fQ5HyWo8
	4usZPKmRw3eyXzrQab9QbjQW2tcQN81PmsKhgjFHoOIOzKHb+0k6No/Muy77Uqt79T5JtrTZDX4
	gAknvzvpD4YQ==
X-Google-Smtp-Source: AGHT+IE30L2/jMrX7//iknNI4i/8WYK8VmjjjICdaX47Vb7tDhZeTRtCGU+Y0joFglyA+Qss2C08tQ==
X-Received: by 2002:a05:6a00:4fcb:b0:781:2271:50df with SMTP id d2e1a72fcca58-781227153f2mr13698060b3a.19.1759222151659;
        Tue, 30 Sep 2025 01:49:11 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.102.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06e72sm12894187b3a.83.2025.09.30.01.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 01:49:11 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Thangaraj.S@microchip.com,
	Rengarajan.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	o.rempel@pengutronix.de
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhanuseshukumar@gmail.com,
	syzbot+62ec8226f01cb4ca19d9@syzkaller.appspotmail.com
Subject: [PATCH] net: usb: lan78xx: Fix lost EEPROM read timeout error(-ETIMEDOUT) in lan78xx_read_raw_eeprom
Date: Tue, 30 Sep 2025 14:19:02 +0530
Message-Id: <20250930084902.19062-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported read of uninitialized variable BUG with following call stack.

lan78xx 8-1:1.0 (unnamed net_device) (uninitialized): EEPROM read operation timeout
=====================================================
BUG: KMSAN: uninit-value in lan78xx_read_eeprom drivers/net/usb/lan78xx.c:1095 [inline]
BUG: KMSAN: uninit-value in lan78xx_init_mac_address drivers/net/usb/lan78xx.c:1937 [inline]
BUG: KMSAN: uninit-value in lan78xx_reset+0x999/0x2cd0 drivers/net/usb/lan78xx.c:3241
 lan78xx_read_eeprom drivers/net/usb/lan78xx.c:1095 [inline]
 lan78xx_init_mac_address drivers/net/usb/lan78xx.c:1937 [inline]
 lan78xx_reset+0x999/0x2cd0 drivers/net/usb/lan78xx.c:3241
 lan78xx_bind+0x711/0x1690 drivers/net/usb/lan78xx.c:3766
 lan78xx_probe+0x225c/0x3310 drivers/net/usb/lan78xx.c:4707

Local variable sig.i.i created at:
 lan78xx_read_eeprom drivers/net/usb/lan78xx.c:1092 [inline]
 lan78xx_init_mac_address drivers/net/usb/lan78xx.c:1937 [inline]
 lan78xx_reset+0x77e/0x2cd0 drivers/net/usb/lan78xx.c:3241
 lan78xx_bind+0x711/0x1690 drivers/net/usb/lan78xx.c:3766

The function lan78xx_read_raw_eeprom failed to properly propagate EEPROM
read timeout errors (-ETIMEDOUT). In the fallthrough path, it first
attempted to restore the pin configuration for LED outputs and then
returned only the status of that restore operation, discarding the
original timeout error.

As a result, callers could mistakenly treat the data buffer as valid
even though the EEPROM read had actually timed out with no data or partial
data.

To fix this, handle errors in restoring the LED pin configuration separately.
If the restore succeeds, return any prior EEPROM timeout error correctly
to the caller.

Reported-by: syzbot+62ec8226f01cb4ca19d9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=62ec8226f01cb4ca19d9
Fixes: 8b1b2ca83b20 ("net: usb: lan78xx: Improve error handling in EEPROM and OTP operations")
Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note: The patch is compiled and tested using EVB-LAN7800LC.
 The Sysbot doesn't have C reproducer to get the patch tested by sysbot.

 drivers/net/usb/lan78xx.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 1ff25f57329a..d75502ebbc0d 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1079,10 +1079,13 @@ static int lan78xx_read_raw_eeprom(struct lan78xx_net *dev, u32 offset,
 	}
 
 read_raw_eeprom_done:
-	if (dev->chipid == ID_REV_CHIP_ID_7800_)
-		return lan78xx_write_reg(dev, HW_CFG, saved);
-
-	return 0;
+	if (dev->chipid == ID_REV_CHIP_ID_7800_) {
+		int rc = lan78xx_write_reg(dev, HW_CFG, saved);
+		/* If USB fails, there is nothing to do */
+		if (rc < 0)
+			return rc;
+	}
+	return ret;
 }
 
 static int lan78xx_read_eeprom(struct lan78xx_net *dev, u32 offset,
-- 
2.34.1


