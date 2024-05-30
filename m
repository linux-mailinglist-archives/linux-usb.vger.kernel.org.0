Return-Path: <linux-usb+bounces-10703-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1408D5666
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 01:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AD741C2150B
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 23:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD66186283;
	Thu, 30 May 2024 23:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I1rKgK37"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AB3183084
	for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 23:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717112614; cv=none; b=DSSsiH3MwHRi1VTqHqtNP6vDXzhDKu9EXo+U4pVKbFNS0x26gGFwmXs7E/AoRBQOlNdXgTD2YkN22S+6Mh5noFgQjQSgaRtqYQhrKQY/08izcyvdy5Z4wnyWHYyV8HXod5VZoZW/f/dylzpN68vMokvapUOKmUNAAbJOTIZsaiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717112614; c=relaxed/simple;
	bh=uUh0scWgAAnBxAOdDHx9RouN1dRcQ02724YXzEXjoLY=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=OlL0BwKWIWprgrE4KlJZeHt31ZgzYKvKjjDN+FJDlRCg59xJxQcqo4ZBAlp6+eGbnwC5vEIdLZsJbUBtarBTFGHNyw2cQGLykGtxR/8Mv0CPRWx851PkfhiYYM3HzIHAgqxcCVSK/E4aDg4s0y/H9dOZmJd+DKaq1Zjq4pUFe3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I1rKgK37; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f60a502bb2so11365815ad.3
        for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 16:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717112611; x=1717717411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:subject:cc:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=213yq+FHXchIlGeobquZB8jFxU/5d0H9yaCh+D4OtRk=;
        b=I1rKgK37fIlXWZIsGetzPmix8j3X1QZosRNbTiMumTfRBJYCsI1TJ/mmHzCtHOOAws
         MQr5/S2mct+n6XG66oO7eDXX9l8KEkqn+7lRS24rHrpCkIWxpKiu1gGq8Z3rZa8zjUp9
         s7OPpAW9FhJTZg7Rstkpt9BuH2ZgVNPYyo1zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717112611; x=1717717411;
        h=content-transfer-encoding:mime-version:date:subject:cc:to:from
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=213yq+FHXchIlGeobquZB8jFxU/5d0H9yaCh+D4OtRk=;
        b=aXVvJnj6rM1FJvY7aOHOEq6eW6Nwuml17oolCVHGJvOSV0nxhQtrXoAzfeoW2kR+4B
         NCyJKzWjupJVKFGhZjoP1bOhVvVZOtyj5anBj1ruQHp7Thnyl6HKpGfSTqOxSxCRQRTa
         aQ371o7q3aj6a2T2Ef8Shv0QRmGiAMSrgDUHNsmRpUx+SGN1geW/xC6o4wMrzNBPcoMe
         l/wD+bd4NWmsG7Z/ythoCuv1qYa+BRHmHbEsEMhxflGlG3Um8qGvkZSPp0tM2xRSbIdt
         DvRbx6EDseZ5MUHhpeEJpMmmX/VdCOJuSbfvF+UrQC9b5MiurYU2gZYKpaBFc+f/2rWY
         OKKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmUfj5sMvP4BFKV3U7pUwpOMSzZgcVpC2uPD3FbT98x6oqpYHk8dDUHmHvSx/sVFRMk9RlnyqD3UHzsOBR3RExwRe3gHr3CfGr
X-Gm-Message-State: AOJu0YwcsLibY5NStZjiLEdi1/EVRuh2fGPcR/3uVRczqGUBPTn/1pPZ
	QWyS/X9OROklg4BuErl7+4F7hxsciOXJqAE4YBeTrr/3+bbtaNNwA/5tLUjQFQ==
X-Google-Smtp-Source: AGHT+IHIzulL1B1l4HrbVqXV+F8H37u4frOFnXNzNFoAa36TIVDnW/yMHkJcvalkHwod+UBLfL46Ig==
X-Received: by 2002:a17:902:f646:b0:1f4:ae25:3d07 with SMTP id d9443c01a7336-1f6370e6510mr3732175ad.60.1717112611373;
        Thu, 30 May 2024 16:43:31 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:564b:72b6:4827:cf6a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632416d90sm3459275ad.285.2024.05.30.16.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 16:43:30 -0700 (PDT)
Message-ID: <66590f22.170a0220.8b5ad.1750@mx.google.com>
X-Google-Original-Message-ID: <20240530164304.REPOST net-next.1.Ibeda5c0772812ce18953150da5a0888d2d875150@changeid>
From: Douglas Anderson <dianders@chromium.org>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Hayes Wang <hayeswang@realtek.com>
Cc: danielgeorgem@google.com,
	Douglas Anderson <dianders@chromium.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Grant Grundler <grundler@chromium.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH REPOST net-next 1/2] r8152: If inaccessible at resume time, issue a reset
Date: Thu, 30 May 2024 16:43:08 -0700
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we happened to get a USB transfer error during the transition to
suspend then the usb_queue_reset_device() that r8152_control_msg()
calls will get dropped on the floor. This is because
usb_lock_device_for_reset() (which usb_queue_reset_device() uses)
silently fails if it's called when a device is suspended or if too
much time passes.

Let's resolve this by resetting the device ourselves in r8152's
resume() function.

NOTE: due to timing, it's _possible_ that we could end up with two USB
resets: the one queued previously and the one called from the resume()
patch. This didn't happen in test cases I ran, though it's conceivably
possible. We can't easily know if this happened since
usb_queue_reset_device() can just silently drop the reset request. In
any case, it's not expected that this is a problem since the two
resets can't run at the same time (because of the device lock) and it
should be OK to reset the device twice. If somehow the double-reset
causes problems we could prevent resets from being queued up while
suspend is running.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Reposting now that the merge window is open as per [1].

[1] https://lore.kernel.org/r/75651199a933427a7fc3980ef8a2139f5f1f1695.camel@redhat.com

 drivers/net/usb/r8152.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 19df1cd9f072..6a3f4b2114ee 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -8554,6 +8554,19 @@ static int rtl8152_system_resume(struct r8152 *tp)
 		usb_submit_urb(tp->intr_urb, GFP_NOIO);
 	}
 
+	/* If the device is RTL8152_INACCESSIBLE here then we should do a
+	 * reset. This is important because the usb_lock_device_for_reset()
+	 * that happens as a result of usb_queue_reset_device() will silently
+	 * fail if the device was suspended or if too much time passed.
+	 *
+	 * NOTE: The device is locked here so we can directly do the reset.
+	 * We don't need usb_lock_device_for_reset() because that's just a
+	 * wrapper over device_lock() and device_resume() (which calls us)
+	 * does that for us.
+	 */
+	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+		usb_reset_device(tp->udev);
+
 	return 0;
 }
 
-- 
2.45.1.288.g0e0cd299f1-goog


