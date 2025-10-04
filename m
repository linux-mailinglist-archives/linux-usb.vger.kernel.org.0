Return-Path: <linux-usb+bounces-28892-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6896ABB8912
	for <lists+linux-usb@lfdr.de>; Sat, 04 Oct 2025 06:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9ED164A6828
	for <lists+linux-usb@lfdr.de>; Sat,  4 Oct 2025 04:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2173219319;
	Sat,  4 Oct 2025 04:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6HSXS53"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B898A23CB
	for <linux-usb@vger.kernel.org>; Sat,  4 Oct 2025 04:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759550857; cv=none; b=oCZVvlvFu69Rwpv/jOpZQq3wWoHGE6nUWl/qociL66d6+lp3JWnnz7kudbbLT+vER5EpvqvPSM680wwz/62BR640WrKtzMm3np0rz+6/F56Ozy76jgqdGjOSxZSXyeP5AaPOJydZfXfCw5FDKZzIlZzgF4znULY7xvQ3YXTkkcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759550857; c=relaxed/simple;
	bh=HYJNFwgeKdoDfqPB7ktfqmxusFy0EZVeLUF1A0YhbNM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ixfu54bu4xDpZHywjTFiP+/h2zo6zZfrphOQL9UObw19XzEG6gUTs0nQL3E+RDhvq6mhUagvvBxkU1X+gURKweRjAnrxfwX7jSr/3WllND0VlmHz0745ODRM2h2KQImfjUgUQoHBLnCsuWzIX9sW5gXlVYBx9aPTAf0rLL4Cric=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6HSXS53; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b551b040930so1928478a12.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Oct 2025 21:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759550855; x=1760155655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ab/aeZgm1Ct/wesU1VWgrWdl3a/KDYSwn/hRS2/Blo=;
        b=H6HSXS53IoPzW8+shNBj13uSKueIpDhB1Kq34u9oTnTGAUb68dKT/dxzfinH7atwKo
         YaKchYTCAUPHJR+I3/ZWj7taPiDW/dz6AIyGEV/nFBzXUXvmiqdTaMh4jCgoFiB+SMUg
         oNfLY+9mPiYlOcVgsVnrRZJ9hQTFALFZQvrurc9Y2y/QpZQylxFwDilRN1B6UMt+54Bh
         r8MSTJro0+9Vp1ME3GrZmYM2vDu+bxOH99/A8VuB8HfbkVH5O/3HTBfRz/1VgmaVtdRT
         uR/c+JmXdbP6KgfvGjB72wmCrRId+u5vvPmBZDiufaw41zHgTQJkG+m4uSWz8sd20Vgx
         Y1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759550855; x=1760155655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Ab/aeZgm1Ct/wesU1VWgrWdl3a/KDYSwn/hRS2/Blo=;
        b=G1MUNLJ3wG420EhyQxmn4Jn92lm8oyOq/aexhcPb7GPWwtWm/LDHaPNe+NzGfRwpa+
         2C/zpvb/MRzpzg8M3HaF5IaOd90kBWwsAKQvPC4tuA0KoGlmjTXCd1zqk8DZ3sBE1P5u
         FqzF9qxQneLm+g4S9C40u59U582fNoM0QftIGjQYE295b+8Kiv6XmTC7tv+x+ZvtXAz4
         cvnP+nKWaIhu3MRJI07o0wHr4BjCYoogL/wASEEWcnWprasabr99CwwfMzhvMVzbgtT0
         rTSJJZC5p2LHrcXSJ08FB/CUDBOwi9ZFWpZJIDqd8QlEpuQ0N3cVQaAR7eUao6O6IZEg
         9mAw==
X-Forwarded-Encrypted: i=1; AJvYcCUk2vH5lOmLfe5Bw8dD6Klk7/lHYqguXa20WC5rG2fHXWMhSe4uSPefBn4vZRBY3/uRVkkhXp7zHpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzboJzKqdWQMz+qm/0v73BuaTO05DMJvRvN0Y9+Ac1wvBHwHMes
	zC18uEYBfk3MEZvHEVz9BCd3umwh52SnwNTYKpfdiYu59qBEl/vpzPLS
X-Gm-Gg: ASbGnctnRX3STJxijyHmcWf7PXcEY98LbIcY7M7Q5nX7O25o5v4DAulObRwu/nJXRdK
	9l8B9l5AnhGcc6igJE4o2r2MTlomM1SSaqEar0O2SgHTbcV+1/KF1rTbLkiHpLthubFy+Ocqb8A
	Rrwh18asLunL1TI4M6uO0SERHd+M+f5MJG0884o7vVxZJjMIrm8gvmOz7WVL7A3bhPddhelbV7q
	veYIRe7D4jc9fbYgR1mSkoOfu+RAeCOUhv2m0J+R7lGnWSEPzizak60uzE7iCcubcoangMxlHqm
	VULlB3DgNSZ70NetVM5hrMxv+Px7POlxU2cY7RMvuYMoZlrYYBMktVkfLqvThx9SJRNDEB0AGy7
	KvJXBcl9MDaSxVAwFE51VzC3xRzaOmKrfYCaIlv6S7rieixbIuT+VFIuy7a5R+QDgIVcnbta3KP
	Q=
X-Google-Smtp-Source: AGHT+IGTlstly6wpNIIUzXdJcqg26KC4+gE2hmAVdLheWI6xhK/cVtI6EOnrc7NPCTVjju8lAhEuEg==
X-Received: by 2002:a17:903:acd:b0:27b:defc:802d with SMTP id d9443c01a7336-28e9a5f7158mr78158925ad.28.1759550854915;
        Fri, 03 Oct 2025 21:07:34 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.90.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a4f15857sm5876142a91.1.2025.10.03.21.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 21:07:34 -0700 (PDT)
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
Cc: khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	bhanuseshukumar@gmail.com,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: usb: lan78xx: Fix lost EEPROM write timeout error(-ETIMEDOUT) in lan78xx_write_raw_eeprom
Date: Sat,  4 Oct 2025 09:37:22 +0530
Message-Id: <20251004040722.82882-1-bhanuseshukumar@gmail.com>
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
Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note:
 The patch is compiled and tested.
 The patch was suggested by Oleksij Rempel while reviewing a fix to a bug
 found by syzbot earlier.
 The review mail chain where this fix was suggested is given below.
 https://lore.kernel.org/all/aNzojoXK-m1Tn6Lc@pengutronix.de/

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


