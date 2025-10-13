Return-Path: <linux-usb+bounces-29240-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 948F0BD5AEC
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 20:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2375018A72BC
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 18:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9D22D4B6D;
	Mon, 13 Oct 2025 18:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6+FqQVN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33A22D73BF
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 18:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760379451; cv=none; b=WAEwI+NHqoubOqh2D8hardw/hrcDEu2gS8okcW9y1q5Ta0oqHVntqGmw+5fgKIaOCNuybnbG7JDV6k3SZfe6z6xZUYupV6x2Kjo+n4HJmJTlV+Ec73+D5QAHrhWMUE/dwdI+4kcpgPOUPT8KYCBt0IX0IbaY7xPr9Ukp36ArVJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760379451; c=relaxed/simple;
	bh=lTRDsCs/D5gFRcFqRPKy43626K0S1gYzb3FNCfR30zs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dzmi0PDe83Dz61DpbF2H0VrvLnZmJulh/dkAvd9aYJq5zG33rTXQAo3THqIsv/kY7+bqZKdB6EdRSMeT0LaMFzmdgv8RFg+ViEUUiSsORjBHhrCQACY1QfPLsBnY2wBdde9A4dTSnpPdv63zs2PL75T8acFsxmPFa0jj6sCR0gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6+FqQVN; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b60971c17acso3615872a12.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 11:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760379449; x=1760984249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DINigu/lDIdPD/xwaJPV5YAdp8XbvaeBDX23woL7nKQ=;
        b=L6+FqQVNS0oFT9ozdBBWP7pdTaj4G3KCHy18nimmIHLGNnxTmdeVG22/16kkjGCIu8
         K+TGQgR+rrAY9MhTjFXTFjgzIPipWHMEeKMqCicF+RgbrP6gSRygqknUyj4XbIgtjBKD
         QlxjlLCQQxrqfjnjF8GJ3tYYg7NrLzQw55Vft1qQkb/Ez095yVQVGu56x1WSdWlbwsLF
         3WMfb6niwP18M4t3ZMNEY4ntCHEeELqiX7Z7oTzhgOsMCbiuIDxXYzJzJOrScK9Bijsv
         TJjKjaa952davfP+32aqougTHZBT6IlZf1gQWA9qizI9fPwU+JtVvuUKyumbryw6FKhl
         IsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760379449; x=1760984249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DINigu/lDIdPD/xwaJPV5YAdp8XbvaeBDX23woL7nKQ=;
        b=dRRgjTHykvlfplkYV9eAR7r/rqJ0XwcfqLaddewjr3oMYVBQgsTIaj5rMpjC2Dqk7n
         bJfiokn7LYGn8VP4QfPBgPr0E/OnPzACtYSn3V7LvSkRYGbXP3Z4kRbKVIys11+Rl3Cy
         uW9oq6RzRadwZ1i8NyL0KLZS4ljI34GnFU5kREMVLpXxhdrHsktsSpSbr6xQV0q7eFsM
         +Mj8eD3CtSAmOnk3sdQlkzs4KRTSBBEKWadgERXGtALwsZpwTC/ret7I9BPfmZS8Pj5f
         WZzDi1kulai0uUCnB0bJ6ILpP/dG6qAeYGO7kFwaGWEwEbidwqsVgMnaF2bn0zjdx3l0
         kLag==
X-Forwarded-Encrypted: i=1; AJvYcCV4z1+PBIGR1eITOCU84S83mMHwJCK0YVc0Azm2O4tDCOhlEyAgxsHsekTNum0yQFaVlTUmigBNvDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuAJU7sEBS9XHgPkeGv3q0+XcMzMRuHZSutdyHEeXx5uhmZaBl
	/jlZ/rUXkBZX5Abo9ZTXBoGrHCt1e6nsLsf9oZWWXAwMFlmZc2nqQ8pZ
X-Gm-Gg: ASbGnctl7TfE4Dz2Y99mRdaO+C8J+DwbhS0YCzopjWqI+8I2e1YcSpVon7qO3/mxQ8c
	rObPEInZKeK6u+vgO+Jl7GY90PDlmuCNYCynvhwVzwFnSeaw3CNAx5pnpMmNovpw3nnaoSM1Lnq
	DTrkTFrIgMo0knUe9p0m+EzA67XSrwQ+WQ0PdGDLYRRaWFbsGas0SVzyovqWfiLzNYbFK0TtmDS
	xPdGq6JlAgdjqvkkWqrY2biTFERmJU73ijfL5PL+RVd/GUbUOK2GvJvOAaOzR0BD/MRlyHPduJZ
	0NY5E6e7KdpQha5K5lqOb9VHHGJjHnqNZrMH5DvC76nY67ICrEqH4SZ+7N62z0dNMxIqnfOKZF6
	ootpjWKbrCjyBG+/qd21Dct3xzJOBwnYLp/79dbBD2yyxl55bkQyybpy6/bAU8+jdZnlBJiZRKX
	EnXQGpsnJRir+8zuL5w0VHetm0NDN0Ej+O
X-Google-Smtp-Source: AGHT+IG7x5vmQvO6Mjl28H+yolG/h8BvghF5Ba98451r81jzZMgiuy0qWbUXeKg4Zw+kpWpfF0h6HQ==
X-Received: by 2002:a17:903:2343:b0:25c:b543:2da7 with SMTP id d9443c01a7336-290272159e7mr227818555ad.9.1760379448997;
        Mon, 13 Oct 2025 11:17:28 -0700 (PDT)
Received: from debian.domain.name ([223.185.134.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f93b71sm140182275ad.114.2025.10.13.11.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 11:17:28 -0700 (PDT)
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
	khalid@kernel.org,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH net v2] net: usb: lan78xx: fix use of improperly initialized dev->chipid in lan78xx_reset
Date: Mon, 13 Oct 2025 23:46:48 +0530
Message-ID: <20251013181648.35153-1-viswanathiyyappan@gmail.com>
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

Fixes: a0db7d10b76e ("lan78xx: Add to handle mux control per chip id")
Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
v1:
Link: https://lore.kernel.org/netdev/20251001131409.155650-1-viswanathiyyappan@gmail.com/

v2:
- Add Fixes tag

 drivers/net/usb/lan78xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 42d35cc6b421..b4b086f86ed8 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -3247,10 +3247,6 @@ static int lan78xx_reset(struct lan78xx_net *dev)
 		}
 	} while (buf & HW_CFG_LRST_);
 
-	ret = lan78xx_init_mac_address(dev);
-	if (ret < 0)
-		return ret;
-
 	/* save DEVID for later usage */
 	ret = lan78xx_read_reg(dev, ID_REV, &buf);
 	if (ret < 0)
@@ -3259,6 +3255,10 @@ static int lan78xx_reset(struct lan78xx_net *dev)
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


