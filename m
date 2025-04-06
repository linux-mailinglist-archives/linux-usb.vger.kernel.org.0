Return-Path: <linux-usb+bounces-22612-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 502E2A7D063
	for <lists+linux-usb@lfdr.de>; Sun,  6 Apr 2025 22:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE27016C64F
	for <lists+linux-usb@lfdr.de>; Sun,  6 Apr 2025 20:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6C61ACEBE;
	Sun,  6 Apr 2025 20:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CLkNsWgZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7C31A3147
	for <linux-usb@vger.kernel.org>; Sun,  6 Apr 2025 20:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743972058; cv=none; b=gvs0tkIiNoAOcRkvW8r36kLlurCxS2cuPNmlPEjZaGo5aCZvDoppIZB9t2LaDmq5Ah3SYXK0TiWeSPlN7LrS1kiKcGkAQHiHp7kK6eGVvEJXGGHbthG2oLtHDgpdtmr4ukjLW6rXFeQwKs1Af67VTi1XXP8iBJXTGv7o+yYEQBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743972058; c=relaxed/simple;
	bh=uPYcgZ3omwIzurOp+2cX3SXPc6HbP09vKi4vWgSXMaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KxyuBQqgCD5ljrOmMkd64umDPNWqUkWQqY4UipIVLcGnXru7JUgAy2Jk2qy/pI/b1sFowYqTfVaLbrmsZ11CAcaiwUX7KgcLiaD2gyzD0H7fZ1d/HHt3qmdl8RbxgZfdbXgVX9XDQaBKXpyQbQ2zz10a9f1DYCEL3DbQeGpJNNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CLkNsWgZ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3978ef9a778so507560f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 06 Apr 2025 13:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743972055; x=1744576855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B3QgOOpj7+iSDBUkQvomYjpZ7VjRT58FtT28ljc6yyM=;
        b=CLkNsWgZaGfSz2fFWVeXF8lMCJGT9u6LRDHAi4Z0Grsq6YLmpqCtk/hgIvxJ4pAC63
         p4NZBrXPr2hyMtmeyOghTqsjw2XSRrfNotmFMUEivXxen+fiB9qq0iNxWBlWlOVVi8zc
         yenwWTlEPLpsKqfBQWm53Uc4LbU37GmPAVP59mkjYOAWliEp9H3Jpy71Afua1YAuKbgT
         IlBkpgyp0FPLRB5yJy96N98Qd7X42dIJqbNMW8bWWGhu5UoH78bmxWjN+rARLFJdeccy
         NqHPpWbcAHD1FUoF7KqJGFUB35KJxm4oVtXA4batMqC0RaLRHl/YMobHimk/yUfDzMZw
         Qgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743972055; x=1744576855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3QgOOpj7+iSDBUkQvomYjpZ7VjRT58FtT28ljc6yyM=;
        b=mT9UoRmhEEW3JaaXiKt4YMb8xse6mA2Sxn4lQkja5ZknyJeFSEwFoPdJsuWaVYnavc
         /OZ/4bWfd9wQ4DQvxwClvoOuqFr5bsOPR7wCLFTgZzElTCv8rWMT9NQGSc+X/nOD4IAB
         dFGOPrQutLeHjtwW/9276v0dvbe1ksmlUkpsX/6IwWAuohHKAY+0Y3weM6kBgCbzPcXK
         v0J1U32X36tTZILyVPaivi0WJAF006pQDWg0ZVJDuL6RDo+isfPoU99IrzYRQ4G46SYJ
         Nj34wb5vP2YV54KJxG3FmUWYQX6YZZmJXgm7WvCSLN1mUGHZHWmf1jx95VlzOLWKHah/
         yLjA==
X-Forwarded-Encrypted: i=1; AJvYcCWt581fY3xY4S4xl+K69So0wHtudN3dUsg7WKU/6dCya7SNNM2y6R/89DvggILQNzHn21m6FAhdbf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw27J6XDLqcGzP1C5NiNIWx0fsh6cpt8xoKDIGTQkRcYu5nIaTH
	RXdCeyhs+kpmCTAAKgGfgrWLPNO7yrwmQTJ7303TqtABU7VmAprGresmMPUSPEY=
X-Gm-Gg: ASbGncvvk6ld/YbpH1PpE+FVOc/4FJHGkYLIY+ZI8d5tFzN+I3BFOX54GJFFuYxC7uC
	0fK5cOv+grLTWjCFdUtMwTbUML4yn8a0N5umGZgAZYb4HmDd0y2EKlLYItveKMCp2z1xlP/7Vm4
	IeIUQR8OmaDuaJ5d5WpYsJu0PoOOycgGpjSvtZgJp6e6agtVzjH2WdREGHtGYTZIdVgOXVDneTi
	47VFg5Es3D+iWqEiun3tMknJ/xy1xDI6Qi4YCPYCH4Hco3hBv6VYDwGIytTKSFSKEBWk5VTmphy
	ICqiZXs0dSlLynep8FzmbykfJWw5Xy3kGorOf8uUWcIj/nmgL2mKjw==
X-Google-Smtp-Source: AGHT+IFchdRno11RgL9CU1ownDwZEuJHgz79IyNA8LtlWkkc0l/WAoB/U9KiTsDOjehHkL0ncSktpg==
X-Received: by 2002:a05:6000:2505:b0:39b:f12c:3862 with SMTP id ffacd0b85a97d-39cb35ac4camr2855921f8f.2.1743972054936;
        Sun, 06 Apr 2025 13:40:54 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0dbesm113167335e9.33.2025.04.06.13.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:40:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] usb: typec: tcpci: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:40:50 +0200
Message-ID: <20250406204051.63446-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index fd1b80593367..29a4aa89d1a1 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -536,7 +536,10 @@ static int max_tcpci_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, ret,
 				     "IRQ initialization failed\n");
 
-	device_init_wakeup(chip->dev, true);
+	ret = devm_device_init_wakeup(chip->dev);
+	if (ret)
+		return dev_err_probe(chip->dev, ret, "Failed to init wakeup\n");
+
 	return 0;
 }
 
-- 
2.45.2


