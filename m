Return-Path: <linux-usb+bounces-32462-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC600D39C5C
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 03:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0361330078A5
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 02:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E6224469E;
	Mon, 19 Jan 2026 02:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNSe2uln"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD68632B
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 02:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768789692; cv=none; b=GaW+4QHGIijjskU7GD2jUtuotamjvAqVrsSIZP2zDtDEGxjVu4DO0MLb10wvzk/aTogolZ9f4OfU2ILWFJUEM92iI+Xx2qZM9S9zYPwjAlVCFIBXPgEjYxNNCKd2RVsW7xciD7XlbuGtSYqPcwO03uVXVVwtAqikgu7eLaghDEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768789692; c=relaxed/simple;
	bh=9w14KZHWbtXQ4bZuOIO1KWG6UqHqkSJxbWGAEo86CBA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ORrHWUlG/X8KzSPrAUVEwonjNUsFuLZV+O7dIUJwyYEt9Rgqfz8a06gj3jShlg0rpKWLCabLoHS8ANUoQSC0y1AA4Luf2s8ESMj/QIVuIxfV+gmuXi9HUOsjtmVlX8cz4InN5thd/Rq6WINWre68r93RW7ieDJatJWQdhrtceD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNSe2uln; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-34c2f335681so1958559a91.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Jan 2026 18:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768789691; x=1769394491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tnggbONwgIdaiaOJGG3BcWc+1OF/p9b8lGQ6zKeztQI=;
        b=cNSe2ulnUI2AqIPHOnCV5vwsSAEslFP1jgPBUdVwwXIKxu5rsO9SATra8Sywu9P6hJ
         LdmBr2EFPJQp0rIRhyoaG9/LCzZfXdhBTS/3pzvAw/ideiyONMv3YpRqxQ/zWWA67uYN
         JfARbd1X67/Dt4BPT1H0hSGW9ldUReuW7WYHCW6uSU2bw1BjW2iPN/Aj/ynU91kyxGx3
         Bh9o09zZjNQyh2/reH7oFrThXgxg+9w/jTLecmnDGMbWRR/JRdmMiG7l/IV1MfQ/a9yg
         DK6ukjCx1ygUjndNX2b6tcpR3/RmQnBdsyW09y0LkV/UKoFSiZ4qK3FpVpK4PKhKuLlD
         plOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768789691; x=1769394491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnggbONwgIdaiaOJGG3BcWc+1OF/p9b8lGQ6zKeztQI=;
        b=ogONhf6Um+kTZe4n53x6Az596rHrbdR7XcMnwq660LYj2aRaG4BtWbx5k30EQdOPiy
         u5Lb/Ru6IzFTR2AACod1J0hNmcP+JRZP4dkAL3RVALn2VovYpWOGx2/L2yBHCt2BKuuu
         EUuxDq0VWt7zMWK9bXUMER8sYhOl/+YQHLreoPJZSl7dfM65xMBMUnBtYvyZ03x+DqNA
         gdQ5v1/zTW6LA9WngpfujtctF+aYMaYAthWmUR6fufY+JOMwufS7F4/y3i4GeC5jkyNX
         cAH3ANXojonAOA2qB7xnBNQE82yfCBmZII5W+SXCILx9I9hpPX4uoMUiXSMgOFEfpUho
         u4+w==
X-Forwarded-Encrypted: i=1; AJvYcCXyamCOdm/oYeg1spJ/ucDkR0LZIpQ/gU8gXYJlb89a3RqNa2DRxdPcMh3BrcbrPkRnq21zMaRp67s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoMl9O0EpRAIyamWK3nLd9ABdfGehhmayb+OuSdnijSK4YVXmg
	hoOy/5snWOlrukSmKREFVp0YpoK3iEOfuhboI38vLMXMVw99kwajkYaf
X-Gm-Gg: AY/fxX6LZbqNaRS7hxpCpuobTM38dID+rfK3VxYyXySknl3OrXAPpBDLgwHWezD68Mj
	H1XMtgGW5a5bAzBNyRiy+NsMIdkzlDf2QnCxKASL94iyPpuvy17Z1C0Rm7ktHjQw4v3eGfnZnJI
	3aKD1IfbhXmZJRMFtCYHhc8v9UjmAQ3lDo7AwkNiks3oq4X6wh75ELO91J+ffonXD6foGBBqIVl
	wHIk+TqfXkk4tVOs3FS2hWeg+pW3amViYF/AqeAHXOooeh9iJU6uT8yAmmMyQxrqhBup0fYeZui
	ICezkATmaSKQ0B4PmUhH4+EkofOpmIgSXij+yKIl17GI6iSDqDDla0yYkX71u8kMM5TKNqdvbIT
	onTh5k4AR1pGEAco0MbKEhWZ+4K/jweN0Qg7KQ7oVcRbCZ5ssYO1GWVvRdfx9O7QsEBTdT4aoMS
	Y2weNZKu70HNC/TMXy
X-Received: by 2002:a17:90b:5245:b0:340:9cf1:54d0 with SMTP id 98e67ed59e1d1-3527315bad7mr7512269a91.1.1768789691050;
        Sun, 18 Jan 2026 18:28:11 -0800 (PST)
Received: from insyelu ([39.144.137.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35273277f68sm3811876a91.0.2026.01.18.18.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 18:28:10 -0800 (PST)
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
Date: Mon, 19 Jan 2026 10:28:02 +0800
Message-Id: <20260119022802.3705-1-insyelu@gmail.com>
X-Mailer: git-send-email 2.34.1
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


