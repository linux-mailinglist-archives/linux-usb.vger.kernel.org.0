Return-Path: <linux-usb+bounces-31242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0777BCAB4F5
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 13:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE83530847B8
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 12:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D5A2F2610;
	Sun,  7 Dec 2025 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/p2mTnO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94092C11CA
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765111761; cv=none; b=TB4e5yYQu3uOBvKqfHxelEp9HbO2q5s4/pzt7r8vXJaAp1G+qOs7+x+My3GtAgbb11RKONdxxb7EeiPlLyvtZj9/04omSCTGcJ5pNugVfhj228Rz2bruWiQwDtrCMkN39PACtnMg2M/EWiEV0+zyCCqYdWDwXMzKXqq14htgCd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765111761; c=relaxed/simple;
	bh=bQFpEG3o9LQ536f6JxBdq8z7Y1JAJhEjOJQfUO1giYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lk7dtXqeX954SPkU3iG34VTME/7Cr7AdvjohYHNBE3rG9fjjabBfmnDZY1vxBDZpBeuCqw7kxPVeE18Pj98qYtf3JhlDWjcWGlhIjdNgJLFdyOUWwXWoHY/jzSLV66JF04qQoCjYeNbK7oVo5aDBfLUZx/+Q7xik4iClCTEhOy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/p2mTnO; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b735b7326e5so565759066b.0
        for <linux-usb@vger.kernel.org>; Sun, 07 Dec 2025 04:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765111757; x=1765716557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+8cllFdmmZn50x4l8XYZK9RXQXxmWBAkLfGXs7iEf0=;
        b=K/p2mTnOjDFUbX8/I2xpJm10EtLnLD8QLDQvtpy8kyIhN4Ejetp8vQF8g22nI/Plhj
         SeZ2TPtUYVjktIIC8GNr4bbUe11bcxCSHrIadLm4dYu2jx808hzOtw7O0twqYqsTPDPs
         p3mY6tU/OSl1kZMgEIm2lkLRncky9bf24MSpRZPmJ1DG/bUyUWAhUQq6ImTlNF4OFH0W
         Bmo+6ej4h8lDxUt0REVbr/Xvu1e1rUBNhnOLnxaw0XkS3rHuS1D5Sp2KFs44hRCK+rCF
         bWxLFU2KHGuohLT2rQxKTOq7IoA/n8JGlpDH59FpIrvrsCSdV+s+KQPii7RvOJ+G/2/1
         ES0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765111757; x=1765716557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v+8cllFdmmZn50x4l8XYZK9RXQXxmWBAkLfGXs7iEf0=;
        b=fo6bILMMenH+epPB4F1Av/jNhdO+pZzLFD+X0/gfjLSTqfH9NY8BRMzedbXAvBrfhL
         km4/Q39+BABdb4nplXf3y2wwPoY8l49koVzBXX/sVyOGv9R23B3Cs8ZmsZfJQqVoVTfx
         XERyD4I3JAlYI5bbyzZ5/7I8mCChFoIZuEmEFEz77wMrA4ERUPyKtO344WlmiWnSpXS0
         mUW9envGo4/z19gZ7nPXWGqUCLLozlyfOEcSYMQytphTFQ+Vm4UjNCbd7/eK5HFEbsrz
         XHDGvACehW6FKYjCe3Uqw5ZOM35auyp8J2JSFUPCvr/Lf1XeRutN37iatTh6jCZYzHD3
         qbdg==
X-Forwarded-Encrypted: i=1; AJvYcCWvYn4S0FbLDlxUqLodhyKXNVwdvZlu7pznSkP4ZiqBeWt5wKB//f9W+UB1danf+NE3McZSPyR1ATo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTaXiC8RkTB+EWm2WK3164HLSeEQz/WygWE7Ss+/ulhyc1GanP
	WwZ3QJssR4F4NhImVt4YrwwrTHQkYPJzxRv4hN4NkrnDVitRkL9SC6Nx
X-Gm-Gg: ASbGnct0hXyvgaaOXVU8b091aDxBVU0Y0mkB6mb9xApxlZTdfq8va6K76BrLEPVOg+z
	jkT4mqQeYaQzK5qmCLnfOdrNKkw2aB5uFSHdcjEoUke6R82HD/kc27ZXDCdRTM7oZpYrusqP7SL
	vmeoF5hAj1EwxIh+SWQTivFZofsD2OnzSgZXcGmsmBWBWpyfKTUZVuXuYTXH1ukQQ5kwrNnxTKv
	emt0M/bBG/q2ekqeXD6n0z7BUz0KABFa4uJV6bKL8bnQNNHoIjNJhItw25lTn+vJzkiNeHxWiCw
	kjGf5rdR7mspjmpvMLvSUq+YLnFCKWx2IZVH1UxTMhKCRBTrwptgn3aZxGvzqXuCjFQZsUq6e/H
	zFr2WwCa7+4ARP74iAoqFqiB+1fiv71nHRikPIl5CCaVWrKQs7bZncxtcrPiCm0DbFanW2PRzZM
	hjwBpwql3tLhOF+jA26R/lILz3XobDMdb7F5ymI/aJURn+jGzsN9Z805AxcC33k9rykj0XtztVb
	AZdd3orniX0SsT0
X-Google-Smtp-Source: AGHT+IE8fOENHVwPtQI3pGjpRrNOqeblBeyp2cP1u+Su1TipXnFYjjo9bgkVLkCyRo2mgZyc5c7Cfw==
X-Received: by 2002:a17:907:3f8e:b0:b71:60a3:a8b9 with SMTP id a640c23a62f3a-b7a23b7f165mr540412066b.29.1765111756891;
        Sun, 07 Dec 2025 04:49:16 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445967fsm848078366b.10.2025.12.07.04.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 04:49:16 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] usb: host: ohci-platform: Drop ohci_resume from ohci_platform_suspend()
Date: Sun,  7 Dec 2025 12:47:27 +0000
Message-ID: <20251207124742.96526-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
References: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

As per the suspend_devices_and_enter(), if .suspend() fails, it invoke the
.resume() callback. Currently ohci_resume() is called in 2 times if the
reset_control_assert fails in ohci_platform_suspend(). Drop the duplicate
ohci_resume() from ohci_platform_suspend() callback, as it is called
later from ohci_platform_resume() callback.

Also, drop the other duplicate callback pdata->power_on().

Fixes: e4d9da32bf60 ("usb: host: ohci-platform: Call reset assert/deassert on suspend/resume")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/host/ohci-platform.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index 2e4bb5cc2165..5342cffbee47 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -281,15 +281,7 @@ static int ohci_platform_suspend(struct device *dev)
 	if (pdata->power_suspend)
 		pdata->power_suspend(pdev);
 
-	ret = reset_control_assert(priv->resets);
-	if (ret) {
-		if (pdata->power_on)
-			pdata->power_on(pdev);
-
-		ohci_resume(hcd, false);
-	}
-
-	return ret;
+	return reset_control_assert(priv->resets);
 }
 
 static int ohci_platform_resume_common(struct device *dev, bool hibernated)
-- 
2.43.0


