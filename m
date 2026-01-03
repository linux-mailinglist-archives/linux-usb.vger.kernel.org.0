Return-Path: <linux-usb+bounces-31880-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0801FCEFCD2
	for <lists+linux-usb@lfdr.de>; Sat, 03 Jan 2026 09:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8F90303B7A9
	for <lists+linux-usb@lfdr.de>; Sat,  3 Jan 2026 08:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64032F4A10;
	Sat,  3 Jan 2026 08:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgXEpvok"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9CD2BD5BC
	for <linux-usb@vger.kernel.org>; Sat,  3 Jan 2026 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767429224; cv=none; b=H9Cr5Cz+Jx/ShqVierHUUm4arlNo52Ph5UDp5jRv/zhMsgtnZhi0c0we972sTbl00/mAB1U0bg4UEkZjVJFC1/UtJK16+H0qMb2tYh4g1S/bjPIygCebZXLTWoQQd+8FEMZCvTE4dGmA9XF0kjwiMIo/gG4HRssIc6EUn1D9QWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767429224; c=relaxed/simple;
	bh=PC93uMu0rTtqYTL8EEurWx5EXMnuM4BeV1/KFTTmfBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paIEQgv5xWQdelbmzfHjm++glZuy+rB/OjP2OQJ8iWtON+A7PJ4BUZ8KOWkk3dTBRXtyHC7iAJbrBI5JFjFGHssiy4OGSuSvlWPIm4jyzkMexk2eVoc4J60ak/fdxuWz+9Pv8DfOvE1xyTbevALDimLTq+ruRTuAlJPyD+HrHYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgXEpvok; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0bae9aca3so180627615ad.3
        for <linux-usb@vger.kernel.org>; Sat, 03 Jan 2026 00:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767429222; x=1768034022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHyG145kzFXnOFjXe++Sub24U1Sr0jpUyn5t+Vf48Jw=;
        b=PgXEpvokEvj/gEAjDGNV/XiN9lwieYES3UBT08ebktFVQmuoYiNU+RN0U3DEA4Yywr
         ZVp+veiKgRqeDMfaGXqJPqF9E2VsHegdHexep5pwQ9XxY299Ws50AGqrEzlN+v7khEW2
         IBr9nihckKzuAM7xsiL6fz0cS5gJvHZF1IdKFKVI7kSoxdbSMIqTTTF4CZy5K29j30Gh
         zjaSl8GX7XOdO0gHgK/9h182VFAZuQYUdGQaTxPQ9kFfb+0NzV4BOGyshlxGqWyPhcl8
         Rw4y4rK+lMLtezn2JkDs3tAesGuRijikRPFOfmEJd8wymgQEbz0DiC+Bdpa3V5npFfhe
         qcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767429222; x=1768034022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hHyG145kzFXnOFjXe++Sub24U1Sr0jpUyn5t+Vf48Jw=;
        b=LQtxi/uQcoEltOc4rssF8oLHU4HDEiJ4MHGmKo7aMcu6zOM9gB+x49wu4ldBQyjb76
         27Kj1058E0vmDqvOwnKW/Z59Y1GMWYp2n8hnJb7RzaZo3+lzS+8BbT6pNIPjF5NL26AG
         DtV1eW0r4JHXZhK4ij7Ksj/kEaJlzhLUzTIO2NgR9PPilwdvjht1y5jdrqLcUirxYpuh
         0djLxHP9+cIHj2FE2wNU/BPu+ZmdqY7QjG/sPbTc7qd2xZsub2mKBH0RYuiii5LQlMI3
         lc6p+lL8PEJT10hPnPGjnG5On3P9rexYl6yrMoSpnN9TtKVSs5vd+7RsU6AG4XKFVQ9Z
         dwtw==
X-Forwarded-Encrypted: i=1; AJvYcCXyF8NXDkHhxcerKuvNYsDsUXpr6g4glSIxTO6aRUHAps4oDPPw5u2QdBJWiJupPGyLmdY+d2z/tHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YytU1h/gmAw2AKn5yOWuaMjTIWZzThoDehNHRCRvWN/ZWv1gLBv
	/Ry509+UFpwRbWinHWKEF4mb8yqhPShkYg2c/MOfBE5MFLu9OPkyoefE
X-Gm-Gg: AY/fxX6AL3ON5WRD6tsVq0j5hNAwfSXaqGy5hA57iss2UOUD/1rkXNlTELWuIVobVNd
	34AY/umyv/lb8/iqCIDuAX8lok4vBsAjr57pO6nUKfA4hyIoe8VS9RF1/K6kLJsZD93h2UVGrbX
	AfpYPxeRQGpE5HhHKyY8hxcreN4LT+KSGWQMX3ClDf5k5RTU4BwN1UzoAOu7Lzm+zxHxWBs1jhN
	fuyeE/jCNsKyhq9G6FZwUFTgDgDSkR2mbvWqrS7hMSEfoNX48vmfdODWUagvkvDLlMLI3BO8l7l
	VQGAeZR/4VDm14bbcOxsWsmcRC7uhnFik9x7HVzdFFJTmFYRQKpHz6zVTbABOkSUj7sDClFVN6D
	ncpTdcOLRJKxF0tv/h49Xk+TXmtaF5XbDsufwRkz7+TDdPq279i+8eOdr8XTFeLpFO4c3zs6Gsc
	3BYfhp4A==
X-Google-Smtp-Source: AGHT+IHxDotaAPgTf9hDSRmjhQO/IAis4W0EptEfWvNWpf1X8rcKBg8E34x8vTt2toQFaw/FLYg8Jg==
X-Received: by 2002:a17:903:1c7:b0:29e:76b8:41e5 with SMTP id d9443c01a7336-2a2f2830f94mr467517465ad.30.1767429221879;
        Sat, 03 Jan 2026 00:33:41 -0800 (PST)
Received: from rockpi-5b ([45.112.0.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm391700365ad.21.2026.01.03.00.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:33:41 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yongbo Zhang <giraffesnn123@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB TYPEC CLASS)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v1 3/3] usb: typec: fusb302: Switch to threaded interrupt handler
Date: Sat,  3 Jan 2026 14:01:19 +0530
Message-ID: <20260103083232.9510-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260103083232.9510-1-linux.amoon@gmail.com>
References: <20260103083232.9510-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fusb302 driver triggers a "BUG: Invalid wait context" lockdep warning
under certain configurations (such as when CONFIG_PROVE_RAW_LOCK_NESTING
is enabled). This occurs because the interrupt handler, fusb302_irq_intn,
attempts to acquire a regular spinlock (&chip->irq_lock) while running
in hardirq context can lead to invalid wait context reports if the lock is
considered "sleepable" or has incompatible nesting levels with the
underlying interrupt controller's locks.

lockdep warnings:

[   38.935276] [      C0] =============================
[   38.935690] [      C0] [ BUG: Invalid wait context ]
[   38.936106] [      C0] 6.19.0-rc2-2-ARM64-GCC #2 Tainted: GT
[   38.936716] [      C0] -----------------------------
[   38.937129] [      C0] kworker/0:0/8 is trying to lock:
[   38.937566] [      C0] ffff000112c04190 (&chip->irq_lock){....}-{3:3}, at: fusb302_irq_intn+0x38/0x98 [fusb302]
[   38.938450] [      C0] other info that might help us debug this:
[   38.938953] [      C0] context-{2:2}
[   38.939247] [      C0] 2 locks held by kworker/0:0/8:
[   38.939670] [      C0]  #0: ffff000100025148 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_one_work+0x224/0x4b8
[   38.940645] [      C0]  #1: ffff8000800fbd90 ((work_completion)(&(&host->detect)->work)){+.+.}-{0:0}, at: process_one_work+0x24c/0x4b8
[   38.941691] [      C0] stack backtrace:
[   38.942010] [      C0] CPU: 0 UID: 0 PID: 8 Comm: kworker/0:0 Tainted: GT   6.19.0-rc2-2-ARM64-GCC #2 PREEMPT(full)  bd73c5afc1bd41f04ef9699c14f0381f835f4deb
[   38.942017] [      C0] Tainted: [T]=RANDSTRUCT
[   38.942019] [      C0] Hardware name: Radxa ROCK 5B (DT)
[   38.942022] [      C0] Workqueue: events_freezable mmc_rescan
[   38.942031] [      C0] Call trace:
[   38.942033] [      C0]  show_stack+0x24/0x40 (C)
[   38.942041] [      C0]  dump_stack_lvl+0x90/0xd8
[   38.942047] [      C0]  dump_stack+0x1c/0x3c
[   38.942051] [      C0]  __lock_acquire+0x5e8/0x9c8
[   38.942059] [      C0]  lock_acquire+0x134/0x280
[   38.942065] [      C0]  _raw_spin_lock_irqsave+0x80/0xb0
[   38.942072] [      C0]  fusb302_irq_intn+0x38/0x98 [fusb302 634bac905a09c450b54f88b96019accd2820228f]
[   38.942082] [      C0]  __handle_irq_event_percpu+0x138/0x3f0
[   38.942088] [      C0]  handle_irq_event+0x58/0xd8
[   38.942093] [      C0]  handle_level_irq+0x108/0x190
[   38.942099] [      C0]  handle_irq_desc+0x4c/0x78
[   38.942106] [      C0]  generic_handle_domain_irq+0x24/0x40
[   38.942113] [      C0]  rockchip_irq_demux+0x128/0x240
[   38.942120] [      C0]  handle_irq_desc+0x4c/0x78
[   38.942127] [      C0]  generic_handle_domain_irq+0x24/0x40
[   38.942133] [      C0]  __gic_handle_irq_from_irqson.isra.0+0x260/0x370
[   38.942141] [      C0]  gic_handle_irq+0x68/0xa0
[   38.942146] [      C0]  call_on_irq_stack+0x48/0x68
[   38.942152] [      C0]  do_interrupt_handler+0x74/0x98
[   38.942158] [      C0]  el1_interrupt+0x88/0xb0
[   38.942165] [      C0]  el1h_64_irq_handler+0x1c/0x30
[   38.942170] [      C0]  el1h_64_irq+0x84/0x88
[   38.942175] [      C0]  arch_counter_get_cntpct+0x4/0x20 (P)
[   38.942181] [      C0]  __const_udelay+0x30/0x48
[   38.942187] [      C0]  mci_send_cmd.constprop.0+0x84/0xc8
[   38.942194] [      C0]  dw_mci_setup_bus+0x60/0x210
[   38.942200] [      C0]  dw_mci_set_ios+0x1c8/0x260
[   38.942206] [      C0]  mmc_set_initial_state+0x110/0x140
[   38.942211] [      C0]  mmc_rescan_try_freq+0x154/0x198
[   38.942216] [      C0]  mmc_rescan+0x1cc/0x278
[   38.942221] [      C0]  process_one_work+0x284/0x4b8
[   38.942225] [      C0]  worker_thread+0x264/0x3a0
[   38.942230] [      C0]  kthread+0x11c/0x138
[   38.942236] [      C0]  ret_from_fork+0x10/0x20
[   38.969307] [     T11] rockchip-dw-pcie a41000000.pcie: PCI host bridge to bus 0004:40
[   38.969995] [     T11] pci_bus 0004:40: root bus resource [bus 40-4f]

Following changes resolves the lockdep warnings and aligns the driver with best
practices for I2C-based interrupt handling.

Cc: Hans de Goede <hansg@kernel.org>
Cc: Yongbo Zhang <giraffesnn123@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Fixes: 309b6341d557 ("usb: typec: fusb302: Revert incorrect threaded irq fix")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 870a71f953f6..089722b52fbb 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1755,9 +1755,10 @@ static int fusb302_probe(struct i2c_client *client)
 		goto destroy_workqueue;
 	}
 
-	ret = request_irq(chip->gpio_int_n_irq, fusb302_irq_intn,
-			  IRQF_ONESHOT | IRQF_TRIGGER_LOW,
-			  "fsc_interrupt_int_n", chip);
+	ret = request_threaded_irq(chip->gpio_int_n_irq,
+				   NULL, fusb302_irq_intn,
+				   IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+				   "fsc_interrupt_int_n", chip);
 	if (ret < 0) {
 		dev_err(dev, "cannot request IRQ for GPIO Int_N, ret=%d", ret);
 		goto tcpm_unregister_port;
-- 
2.50.1


