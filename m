Return-Path: <linux-usb+bounces-32217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2ECD16DDC
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 07:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD245301D5AD
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 06:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA90366573;
	Tue, 13 Jan 2026 06:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGtT10iG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F3E30DD25
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 06:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768286433; cv=none; b=oWEBBBTH55FjM97mXWoNmYY7vg4VMVZOM5x6ikcKEgfxC5By/PrpuRzBqkyoXb5+RGrZlwjPcyNlSgK60hV6JUpagHNivrMeRT26gVRQ4hmQVx/zJ1Z5On330TMNLjCC80qNnm/lDb6GA4/KHiKANR9oY6UpliPusFu6hi4JFlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768286433; c=relaxed/simple;
	bh=+Z3tflR0QPv/AtHYde2Bbd0mWjOrz9fOlEL9zrZ6pJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IpAk6CqH437jx3rsUjKc4/3Y3IDdnlWnPm/kdZoEcU4HTBdxJ3SirAEfFYNXtxBjCweCBj+VDU5TvHBfGY8wy2E3AR/OawMBgrKKJUSZJHxNJJF2DAou4B4lJ99xC9XfqJx8hYxhkivzcK656PoTGyDXoK/B688Ospkqs+8xSq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGtT10iG; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2b04fb5c7a7so6638042eec.1
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 22:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768286431; x=1768891231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=whUZoFPva/1DPSFs6qyuipXE3Qp8iIeejIqod2xKLLQ=;
        b=QGtT10iGg83mPq5E6j8L5Ut2OpbR3KjCYOLbtX1bsP6ERkDICTZyq0c1Bt32teoiqu
         JIwl7sFhcYarGmEcxiYn6EYgByfX1QSqawNWP6FokwiKEJ1DQDCzPGx1WRWm2/hAiopU
         yQGD7TAyyz6SpESktYIDy8W20XjB6muKkjycbKjYr41GufK2a2oCEm0c++OSbwpbZ4hF
         I+hVfjdQFKy2Go2tJyGWOULua3xMdpkPtGf0nYZ4Ilh4nnc1fcdxUWUYFVWWkjCNBXVh
         VT62ZC6aH6cxw7W99Yt0VbU5XT/1RLBrDo52VpeYNnPFcdAE0Ll1RLjwUXIcbRrFQfIj
         zeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768286431; x=1768891231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whUZoFPva/1DPSFs6qyuipXE3Qp8iIeejIqod2xKLLQ=;
        b=Kltowarr7gjdxe5DXHrcyfflasHNd3Xh+phsP/v3LI+Ws9Yv5ml+N9PgbgFatCDRvU
         zHykxkI9nNUdM1lU+PVyaxSS/QmVyFHVQAJO6THFMbewGQNmJHIlJlZ4Y2z1XVsxSzjd
         5dMZRqVBy8w9nlai2DnjhbgZ6A9CD+E/ShbhS09OFfE4JKhJ1GMFrdoON4RCEKOtYdfv
         hDQvLt9GeBstFjJa/Ar0TCB/3hE0HhvjIJrjVc1/yLsZFoxpXDZhLECW5s9waZ9eNB1R
         mlxl0c1QP29KBIwXlKlBw9Fw59l3xLjIHNd48o03TG9fMVE6vxcn5VVxk6ZJnkYJN33V
         N4Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVG3IRRBCxV12eWzDNdL5/zHwPRmw9I8ck15poqAZKWmT3kAzrqn8mLoTpyf5+Cug3Qam319LFEhaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgve2IkXsuUujUHDbTeQ6TIjC8PoqFBzlhKVsN9aag5AaoumP8
	3fRWgv2u24qRY28kfUnOxezaVqQweFv4ejXPgFFh2HuoEB+A5XxVVPdF
X-Gm-Gg: AY/fxX58KofddRwJUbvWmW+3e0muzul7cx7jiMsfN6mW3+VOwC+/5iaRF9EvGgG+k/p
	UfCFAXT3mePe0aIkkajjHoIxKNm7zax9tUQy5euCqV/a0hyR6U2YwOmRwYm27JAszxJUa4dRMcg
	H9LGCJ5kQp4/UTLbt9c79Nw+ZL43p7IM9wkFd/GRoJ5JM4Dfq/XBwleymuucVNhwFBQtdBFRrDe
	kYctqWE1/e9Om6JFZxC5ckvOBToxWbfSrRY3zODZlE4C8711ku7351vC2936KUvNZGCHRTo/poY
	I0bQNj3P1hAis3jntEWndWtwEONii7sDFZ0zTTKPbz3taFcpNSK67gsbYYeHZoEy3HV1W3XgoIu
	YrbCjd6Q7CFnR1oMwH7X0Xpb005yJdV5SxvfHMHwPPL/b21r2mMerQqZndG6JQUGtI82ep/nVAp
	GU9a2wb8soScz45sEqLsf1PosxpuHYyGrKWCDqVv738+h9L/vKjbclUL67alSXLYphgV48VJWtv
	m60waqAoYkiZNw1sS17eGQRHa48QqOTjXQPeAZrf0QYKupeMDKLq75sL7M3FwYWknTou9nTCFkh
	T+c9
X-Google-Smtp-Source: AGHT+IGPO+RR2k2lWqN1OBFQOL1/b6w1FynFekD9M3vfPiG17tDe926KBgpNLC1VR/Gl1O4Os+tcQw==
X-Received: by 2002:a05:7300:c99:b0:2b0:5342:e00a with SMTP id 5a478bee46e88-2b17d251c0bmr18093494eec.15.1768286430816;
        Mon, 12 Jan 2026 22:40:30 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078dd78sm16913729eec.19.2026.01.12.22.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 22:40:30 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Liu Junliang <liujunliang_ljl@163.com>
Subject: [PATCH net-next] net: usb: dm9601: remove broken SR9700 support
Date: Mon, 12 Jan 2026 22:39:24 -0800
Message-ID: <20260113063924.74464-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SR9700 chip sends more than one packet in a USB transaction,
like the DM962x chips can optionally do, but the dm9601 driver does not
support this mode, and the hardware does not have the DM962x
MODE_CTL register to disable it, so this driver drops packets on SR9700
devices. The sr9700 driver correctly handles receiving more than one
packet per transaction.

While the dm9601 driver could be improved to handle this, the easiest
way to fix this issue in the short term is to remove the SR9700 device
ID from the dm9601 driver so the sr9700 driver is always used. This
device ID should not have been in more than one driver to begin with.

The "Fixes" commit was chosen so that the patch is automatically
included in all kernels that have the sr9700 driver, even though the
issue affects dm9601.

Fixes: c9b37458e956 ("USB2NET : SR9700 : One chip USB 1.1 USB2NET SR9700Device Driver Support")
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/net/usb/dm9601.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/usb/dm9601.c b/drivers/net/usb/dm9601.c
index 8b6d6a1b3c2e..2b4716ccf0c5 100644
--- a/drivers/net/usb/dm9601.c
+++ b/drivers/net/usb/dm9601.c
@@ -603,10 +603,6 @@ static const struct usb_device_id products[] = {
 	USB_DEVICE(0x0fe6, 0x8101),	/* DM9601 USB to Fast Ethernet Adapter */
 	.driver_info = (unsigned long)&dm9601_info,
 	 },
-	{
-	 USB_DEVICE(0x0fe6, 0x9700),	/* DM9601 USB to Fast Ethernet Adapter */
-	 .driver_info = (unsigned long)&dm9601_info,
-	 },
 	{
 	 USB_DEVICE(0x0a46, 0x9000),	/* DM9000E */
 	 .driver_info = (unsigned long)&dm9601_info,
-- 
2.43.0


