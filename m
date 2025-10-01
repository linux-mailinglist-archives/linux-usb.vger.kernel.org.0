Return-Path: <linux-usb+bounces-28840-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0BEBB0710
	for <lists+linux-usb@lfdr.de>; Wed, 01 Oct 2025 15:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8832217E979
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 13:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBDB2EC563;
	Wed,  1 Oct 2025 13:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBSpN/gT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86AB2EB5C4
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759324468; cv=none; b=WUw8DPC3yTTELu/Pzcycq4GBhc/3flgx3AxWHiEPWutO2uxTzBoqMp7vFtwTYaD9kyqbgMlKE5qv5sBRIQ1+e3OOb+GqxbwpXYl/NBOZrCBzG1QdfYGly0QKPNf+8p4wvdtA0TgUooDa1M+cImAWXiKYUSvaCfcjVrdN7clZRp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759324468; c=relaxed/simple;
	bh=5o423ZijRvd8zuSTV5jup258SDTngq09c6GvYer2C1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RWSHaT3HQ+rEwTOj//dG/BVA9JRuq2Ix09htSuzQUo/IMRJqCWj9618/oRQb7G7NRoEvXVjZEeZHa/AgSgvu+ZfqHAOrCMZ0aUgYhZO71/4UEYTz+m9tSXjhAInsT30X2WrI9wd/c7mSmIRglrXeG9rTRypnuioVkBBt59/tJ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBSpN/gT; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-782e93932ffso3914396b3a.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759324465; x=1759929265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCTEJhugcYnaoj/BbhJFZS8Yru0sn+mS/h4vRBTxOWU=;
        b=ZBSpN/gTcUNQzuoRLQM2ZWMU5eEII2WEGyVZYx37w4F578Zc/2UuQ3ehmZjwcjbGad
         0d60oiOJTQOVgAmFZT84oFqRhuDbwHUTwU/rsPB+NzqHZQ8Em8r0WFCbJu911liZ9sOl
         bgU31V/KjOz6571B3RhiciyPpfqdlzS6LU06DOgHrqkcqYNANKrxM+aodu7qlqB1/btq
         Oy+AMA+RpQFPcqOUI5ElWxyI8nVo742m/GxMsijimNbtoBrx2r67AUTWq87c+6WC/Fbb
         h9W7Rd3xk84k5LN0Orm0bbDVQO0VFjccD7ndHztnaPHAi/rFzr2fLS83XHD/P9WdPbZr
         h12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759324465; x=1759929265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCTEJhugcYnaoj/BbhJFZS8Yru0sn+mS/h4vRBTxOWU=;
        b=cRTBHWvCayx7OqRiuv2mSJ7QlpsypYEgOPCgSbYBU/469JlUD+nZThqFVawW8FU/ok
         xZxkm4OXT5pvw0Cf3NUosbj7AtSzU4vN081QS9d34PEmvqnA1lAu453DK5Q3gdooobBy
         EgAOJAVcgJNuVgHQtQXgylOBPhi0S6WhQ5UHv8omKDpZIMVWofojnGrnd3rA2QLpokON
         6XVJpVx3V3H7ZPEbMf1N9JuZyh5VoW8B+INlxX3EU5raVdtvLqVD3hlYD56U52RRB0QI
         qAt2EKZMeG6r3SOc/dDX+trmnFI8y4g4f72jPeQJV0GdTO8Bo7ZeXW5qQazYbBwUk5A1
         SKgw==
X-Forwarded-Encrypted: i=1; AJvYcCUbJ/ZPEU3jOL03CVFdPol2+VT0wqV+nFMXCssj3MPT/rvU6y+i5bR7Ejf1AkmXFhJbtUGN7vMxNjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxdcQ3FKy8ydFTdAJ3K6TYPQBsrv3NXbjD1FQvL4nTr3Y2IxyD
	7F1yQTBsDmFKhaLzqpLFg2XxzGP6aUt1YT7f5pzaC/jqN+lwsDuGzvPL
X-Gm-Gg: ASbGnctuN9YY0fEWRhNfdTM0XGo/tTI1Egqg9OEa9T4G0tBYskK/Lc/EnVjT33rrI3o
	7Iarve842bnfKpMPiRz4z204VWklL9nay/AIcPFQzpz922EiJzsYtsT4lTE/QP5b9NGPJ3FPxAd
	CC+fzJYSkhxTB09G3WHy2zdjgeapeNTGjqXK1l7SNuq1qFLnaEbsnTls9TShJabt993EJZsF8l1
	4TrrNMQm2JE3isvF0J+Mu8sAWUF08htOzbtJQqBgy/G33EYAUgsAaCGr5amYPhVf6f+E6IxHVG0
	QkmPizeqs1qq6fxea7IcDNl1cDxG85MKarNFE1rT8Jg0fPOec9yR4YFYf4Z26lan+cuH7dQPw6S
	LzaP9Pa++kb3S42iVird9veXdg79T2FkahKU555KYP1ytF3+QjJPWoXVF/KSmILQxNHuPhsEC14
	E4JxSTQNCp6byKmCxkYiepmymCft5F1VbOVTtQPXFGQK2rOmY=
X-Google-Smtp-Source: AGHT+IEmzoGxhoPxh6/P3t6DmI1zkLDTL0S0tBdY+wi8AVFx9T7GOFm/8D8Q0FXSalhenNgGW0DD0A==
X-Received: by 2002:a05:6a00:98f:b0:781:1a9f:2abb with SMTP id d2e1a72fcca58-78af422e5admr4501627b3a.24.1759324464584;
        Wed, 01 Oct 2025 06:14:24 -0700 (PDT)
Received: from debian.domain.name ([223.185.128.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b231ebsm16308139b3a.52.2025.10.01.06.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:14:23 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: Thangaraj.S@microchip.com,
	Rengarajan.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH net] net: usb: lan78xx: fix use of improperly initialized dev->chipid in lan78xx_reset
Date: Wed,  1 Oct 2025 18:44:09 +0530
Message-ID: <20251001131409.155650-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev->chipid is used in lan78xx_init_mac_address before it's initialized:

lan78xx_reset() {
    lan78xx_init_mac_address()
        lan78xx_read_eeprom()
            lan78xx_read_raw_eeprom() <- dev->chipid is used here

    dev->chipid = ... <- dev->chipid is initialized correctly here
}

Reorder initialization so that dev->chipid is set before calling
lan78xx_init_mac_address().

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 
KMSAN didn't detect this issue because dev->chipid is zero
initialized from alloc_etherdev

 drivers/net/usb/lan78xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 1ff25f57329a..f3831ecaaec1 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -3238,10 +3238,6 @@ static int lan78xx_reset(struct lan78xx_net *dev)
 		}
 	} while (buf & HW_CFG_LRST_);
 
-	ret = lan78xx_init_mac_address(dev);
-	if (ret < 0)
-		return ret;
-
 	/* save DEVID for later usage */
 	ret = lan78xx_read_reg(dev, ID_REV, &buf);
 	if (ret < 0)
@@ -3250,6 +3246,10 @@ static int lan78xx_reset(struct lan78xx_net *dev)
 	dev->chipid = (buf & ID_REV_CHIP_ID_MASK_) >> 16;
 	dev->chiprev = buf & ID_REV_CHIP_REV_MASK_;
 
+	ret = lan78xx_init_mac_address(dev);
+	if (ret < 0)
+		return ret;
+
 	/* Respond to the IN token with a NAK */
 	ret = lan78xx_read_reg(dev, USB_CFG0, &buf);
 	if (ret < 0)
-- 
2.47.3


