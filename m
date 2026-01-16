Return-Path: <linux-usb+bounces-32415-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58874D2A369
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 03:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF3B4301E92B
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 02:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E545933890A;
	Fri, 16 Jan 2026 02:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIzBcoIi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFB11FECAB
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 02:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768531063; cv=none; b=iqAc5in1fnLwGbLwbqGqZ84ahla/YLyOmpR2BHPHnIdrByYpMM0v7Z1dz0MkdeP1YJdnV+i0db9gAkbsw0xd6OY6mYXNsOJSL9Lrn1SpLGcxxjiyj0K9I6iY1hzlFP/RsEj5UKtTMT71B1Gu3loafGQoxo/jRmHWC8a1fBIHGxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768531063; c=relaxed/simple;
	bh=9w14KZHWbtXQ4bZuOIO1KWG6UqHqkSJxbWGAEo86CBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cBfMUZ7tXCEark7jLChBpDLDTgpEkrb88GWAOkPv7ppw6d7WhvJHUvNZjZ4EFlxZ3MSCc4R+ifnCSkL3/CQKmlgwfoYcZupa+ifB7nMTopeJyLo7QfXlug07OEGNTLuX7ATZArPdQ4+wdqWRPfnoAv159kyKI5YxFWA/T3s5NVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIzBcoIi; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-29f2676bb21so15116995ad.0
        for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 18:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768531061; x=1769135861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnggbONwgIdaiaOJGG3BcWc+1OF/p9b8lGQ6zKeztQI=;
        b=BIzBcoIiHMp9c/VWTFTrtg5r2qFm//qVuw+466OevwllPK542DoN8bMZ7jAt5kBN2a
         yuz9soixBndmthQgPYWnQ3o/cCL3kSK0yBAD+Ab8ERXVQobOcZtTEx+Mp7Hs8gsw80wG
         2kCWeJCqFgE/HfaVYIsxOJkx1OvD5vuZSLYeJ40GVqyJsVh1TgQWk012tRG2V29FTQI7
         jMY3G+e5j3EfAa4+Z0m6d2RQzA2dyB/sFt6a+57FpdOqyvRK1wpMU3a6D+69SNoAoKCW
         brw13blUDkt0E5/kEmfztTUUkx31L7kJSCfmMAL831ocw4pMR2A9t1cTO9l3rxuwaiW+
         i2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768531061; x=1769135861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tnggbONwgIdaiaOJGG3BcWc+1OF/p9b8lGQ6zKeztQI=;
        b=Xqhkg1WWvxmRJCrZui+lmnF3r7vJ3J52qxkCu9ygmKg+atkxVFS6t+revWQDvb06QJ
         ORDhZh92C5kXuO3UmS3FV5rT0GXcNqH8QHFuxgi4fyUCl538OKBgzPojWqJveX976Uz0
         3KMuBrJFgse6mS+zR+Ivgv8xe6s9TtYZjN0e8TmHpQN0NT9Mbh1znqSYdAwuGRc97AH6
         ZgYT1VzkSyNOxizl8Et2J68+PS41TviajVNWZnXrm+rX+EX+PaPCAPR0MfbGKDBtlepm
         4mxtgGPmOw3cXSLLljl9DNqylpkZI3jKWkxQBCpL/kE+F/U9zioayOTslRThvwCA8uKs
         Mdaw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ3MN61Z2Zu3yOZxcMp5V+wLgtjOv/qCd0YXyT6SITzMX+wj/uqRV4s060LJgoobpbin7gaWso6Uc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlwx6iIF73uyCG5SVnYtSxv6HXGjcAUybb4ZZfxSruekoX61ZS
	vt2pkmFdwKsNK8XjxG/ir+pgx6Vbh7TxeblUkdfmmznDdxY3QkUIwqdwEaDDcyzv1X41JA==
X-Gm-Gg: AY/fxX4Q0gkK+hCdDIkLEmLdJ5IPoz+Z7qXHpdkrDYcEeJZ0rAUFE/6JQhVauI1jrQN
	YaNzgaopsFDCjAtUrDWwfbWF+dZc35Q4eZljZR/PCOfxx4B/ijAwG+or2OBt0tA1HrLKDU0P3kW
	joHfxCFqFNyqC8pEcs1pj48SYuNZ55MSA6J4pzWolqZAfwWysjO6M7vL2ldJ62ZgSwObnx1usyO
	2wY05pYKxYUVL+Fjs6kOr07O4H10FbMBN2kNmlge7qUddOnZkWsGHPWPQZgw8vWn9dxFaESVu2M
	DH0+4HRxS3IhMkQ1cYSXX+rpvrJeQBGLzl1aLf97Z0b1jPNH04wJNBAFnURKrfULUGe4dAm1oXB
	p1N6RYbmRJIXa/s/obJoiTQ54Ce9NYMctu/tVl6If0CbR2yZLnaIrMBajdEcMJ8EnoIA8YxWPTH
	uXDQi2VOq1Dq6GxoDs
X-Received: by 2002:a17:902:d48c:b0:295:425a:350e with SMTP id d9443c01a7336-2a718858410mr9787685ad.8.1768531061495;
        Thu, 15 Jan 2026 18:37:41 -0800 (PST)
Received: from insyelu ([111.55.152.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190eeefasm5842615ad.43.2026.01.15.18.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 18:37:41 -0800 (PST)
From: insyelu <insyelu@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	nic_swsd@realtek.com,
	tiwai@suse.de
Cc: hayeswang@realtek.com,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	insyelu <insyelu@gmail.com>
Subject: [PATCH v2] net: usb: r8152: fix transmit queue timeout
Date: Fri, 16 Jan 2026 10:37:25 +0800
Message-Id: <20260116023725.8095-1-insyelu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114025622.24348-1-insyelu@gmail.com>
References: <20260114025622.24348-1-insyelu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the TX queue length reaches the threshold, the netdev watchdog
immediately detects a TX queue timeout.

This patch updates the trans_start timestamp of the transmit queue
on every asynchronous USB URB submission along the transmit path,
ensuring that the network watchdog accurately reflects ongoing
transmission activity.

Signed-off-by: insyelu <insyelu@gmail.com>
---
v2: Update the transmit timestamp when submitting the USB URB.
---
 drivers/net/usb/r8152.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index fa5192583860..880b59ed5422 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -2449,6 +2449,8 @@ static int r8152_tx_agg_fill(struct r8152 *tp, struct tx_agg *agg)
 	ret = usb_submit_urb(agg->urb, GFP_ATOMIC);
 	if (ret < 0)
 		usb_autopm_put_interface_async(tp->intf);
+	else
+		netif_trans_update(tp->netdev);
 
 out_tx_fill:
 	return ret;
-- 
2.34.1


