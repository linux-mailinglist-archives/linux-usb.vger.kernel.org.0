Return-Path: <linux-usb+bounces-29068-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5C3BC76E2
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 07:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1161E350DAE
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 05:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB3E261B7F;
	Thu,  9 Oct 2025 05:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfZhyTVh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE17034BA49
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 05:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759987835; cv=none; b=qHdF9IjDbB9nOMA2/S4StVMieaJRuWrqrMT9US0s81jQy1BA83mW+7hA1EEsSqaJIqbDEXwYZxvLqMgIyDERpXI5R8pv6LzhxPv8EZdzNzkOR91oE3flWPCwaUcsq0b4E0kHa0A2XvKuFM3+1QUUkTtUnrh40HMkGxC2XYRV0gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759987835; c=relaxed/simple;
	bh=MWPOM5X1rJDtoAagIpIGV2JeSDedkvNxa+Z2Lzxv2gM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MJu7qBb25bTEUEcNTHGJDqxoJ6fsLotyybUc0l++UBoW6jdkNFUSX7nO7Hz8056ENff67FlVgpto5g4TeOuOxUP26nwIRQz8CJ1hNjDhUInZ8DYtmX2ahmZQk+JA1rL1hpAau9zU3RDOm/Bthz82oKvjamlKnj/x77GQEZqBQhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfZhyTVh; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2698384978dso3932455ad.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 22:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759987832; x=1760592632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66mxYYm1lwUDKT8s1UNwAUuURZhUpzHNJdGMWk83R+M=;
        b=KfZhyTVhhQ1Pl2vg8WinLxFIQrcN+uwKXFaa1eTGIapTnqLOqWSE/DtxOpZsx7W3tT
         smtKg/BY1arhhWEL0P5tCE+/f3xRv4PYs4p1ZC4eBR+h93nVsGlICRCMqnfCE4xecVdS
         9K1AqgGb8BvXH09ncpy8fDXTg9X1s9kQh9Q+Fysh5Q+N7JU0ckgKExNiv6FDmUJ1bLTg
         9NcN2Rjl0z2oeEY2HOdxuDoV9YZjC+GH8uBKDjoVjGRX6kMhSmi92FpnmLOkrzkksHUl
         /Bmmt7UBITWUzhMrpl4jBQyxnvuMPzVtl2qLP48/bxuqqIhhi56G5R1r+NvZGcHiD4m9
         i9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759987832; x=1760592632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66mxYYm1lwUDKT8s1UNwAUuURZhUpzHNJdGMWk83R+M=;
        b=MzSMvBnPxRX+2QzHZB57sCDXBl0wnzT3vH62AJngzWhG6lX1mwB7/Yqe9qKUcRAuXg
         yItlNBqFjLyErg70GNpR+aidtBRKc2zMeaVWXzB91wEb929ZabGxqPScBomtxGAs7Kga
         LwckQeRDGc61cQ0wC5kDcmyWGVQ4Il/6F+AGJkkKLPW2C+OSbkN4E46me8Vr0yTrD0Ue
         O4UfV3VUg/Qm+N0Ndd5ztbMkmMXzyuHG6YvwvQRRfG+caIFmVVc7edEJWDpxmVlJXUnl
         /DadQMeL+is449hnOwpToWve8GJqh3Amo6Tsskx39KgTQ3f9gs0w8Cp5BCyC/zrIqvPa
         AoaA==
X-Forwarded-Encrypted: i=1; AJvYcCXpCzC8+f1sVugoaeXatWqGHkeGeIKkY2oitslrlYNRIRWolKjVk68TyfOIFkfye13WQF06yU5DGro=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA6FurttpVU/kLwns7b9g2pU+CuR1fN0Ti/mk5xPd1GLjKihiX
	fec3ieSDa3AChAqBUJQ9kweSMfwVm+ArN48SJ/LxDckTMwuuEiK3E4q0
X-Gm-Gg: ASbGncsx8cuBYq8kKmEMIEykFJxlTKiR7dHx8kewfdHP/m6nMxHqOa6Y8eKRYZQuY5t
	uZCBeHaUZMfnxoJo0MqmjIVmuBHxzwtR647RkgcWR5OszkAbYS9xhLSwxUpsEnMR9m3fKIy0a4H
	EXqdTiHNpPUaAUxHfpSYFan3Qqf3SNM1f8TbEdX+9LHUoVn+H7Or4x4LBqHDLtHJdwU3O3UfYpg
	IKa5hURvo1Z1sxh6FSMZ8bvji70tVIYU+MM58wtnJ4TTe3VVNOkuqmnN22zf0erkUjOHlLUyDh8
	bcEoZ0w8kBk78Ale3f0GSsLcqCZ4QDSKZNoZE866gPHiAiVfLQ6r36FYY2hzNoVW9aQ7RVi4cAS
	sKAD0l3/mqOVekvBGmFIwtlUNhj7JiUN55sKHRMPRitV5QrKtT7SVWnfN4UovVwO5VHPRGZhrGL
	54zrEOyg==
X-Google-Smtp-Source: AGHT+IE96/521TZFyW+4rJmoBB3kl0SaMviXP79e4HfzlRSMb+fmXr9G8IIVQlVxI8d73u5bPmUKyQ==
X-Received: by 2002:a17:903:2408:b0:28e:7fce:667e with SMTP id d9443c01a7336-2902723f51emr92430835ad.17.1759987832087;
        Wed, 08 Oct 2025 22:30:32 -0700 (PDT)
Received: from ti-am64x-sdk.. ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de54c7sm15651395ad.10.2025.10.08.22.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 22:30:31 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	bhanuseshukumar@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] net: usb: lan78xx: Fix lost EEPROM write timeout error(-ETIMEDOUT) in lan78xx_write_raw_eeprom
Date: Thu,  9 Oct 2025 11:00:09 +0530
Message-Id: <20251009053009.5427-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function lan78xx_write_raw_eeprom failed to properly propagate EEPROM
write timeout errors (-ETIMEDOUT). In the timeout  fallthrough path, it first
attempted to restore the pin configuration for LED outputs and then
returned only the status of that restore operation, discarding the
original timeout error saved in ret.

As a result, callers could mistakenly treat EEPROM write operation as
successful even though the EEPROM write had actually timed out with no
or partial data write.

To fix this, handle errors in restoring the LED pin configuration separately.
If the restore succeeds, return any prior EEPROM write timeout error saved
in ret to the caller.

Suggested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Fixes: 8b1b2ca83b20 ("net: usb: lan78xx: Improve error handling in EEPROM and OTP operations")
cc: stable@vger.kernel.org
Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note:
 The patch is compiled and tested using EVB-LAN7800LC.
 The patch was suggested by Oleksij Rempel while reviewing a fix to a bug
 found by syzbot earlier.
 The review mail chain where this fix was suggested is given below.
 https://lore.kernel.org/all/aNzojoXK-m1Tn6Lc@pengutronix.de/

 ChangeLog:
 v1->v2:
  Added cc:stable tag as asked during v1 review.
  V1 Link : https://lore.kernel.org/all/20251004040722.82882-1-bhanuseshukumar@gmail.com/

 drivers/net/usb/lan78xx.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index d75502ebbc0d..5ccbe6ae2ebe 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1174,10 +1174,13 @@ static int lan78xx_write_raw_eeprom(struct lan78xx_net *dev, u32 offset,
 	}
 
 write_raw_eeprom_done:
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
 
 static int lan78xx_read_raw_otp(struct lan78xx_net *dev, u32 offset,
-- 
2.34.1


