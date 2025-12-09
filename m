Return-Path: <linux-usb+bounces-31306-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FDCCAEF54
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 06:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2955A300F673
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 05:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD093016E0;
	Tue,  9 Dec 2025 05:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2D1o1h6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EFA2FF165
	for <linux-usb@vger.kernel.org>; Tue,  9 Dec 2025 05:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765258911; cv=none; b=rUZLzyj6oBa0J9jGzkaSRrqgk2T5XTtHRJl9tBUjRjaIEuGHuc9rAH0W+vB61pYeqwXEesJCg2HZsF/MfTsy4Jq7F3oMFY5ooI651VUd0up8UeVs4Bl/ChbmGPD21sRLIt4w48jq/Kn18OK5GmeJ/hmSzUeCl8WYQnZE16e63uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765258911; c=relaxed/simple;
	bh=41CdFHLabBujmCKkaBvRSIYs6uwj1klEYRM1b7Cgexk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LWW86fhqRImueL7lMQvHvxQGEZTOpx1OMz9M4y59hPqZPGVcqfz0NSm/LXtY9MHFRcis17mvim4JskIwZB3w615YXJ76iqkvj65HCJFvgCnF02m0Huc8JjEj7nb8/MQjcbqkXKbMutvRYNKou4CIt38HaWs41QEjCsda13jZBng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2D1o1h6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29d7b019e0eso57995925ad.2
        for <linux-usb@vger.kernel.org>; Mon, 08 Dec 2025 21:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765258909; x=1765863709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PTRFVgVHGAErXbVV5LVlpbXUuhRN9WLfw8Rm44Nxnbc=;
        b=T2D1o1h6o9LT2kd6650kNZ64da5jHArf1Qx6AlwC2nQ5YZTYlrmFpuEh+AOOjPtg6G
         4mdNWGq1KIzOSmRiCkMxX1ievAYwTPNmzZdufkIy75mPMRSpIhY07cfCIsucZkRbcbbt
         qepdgpt/srIrLDdE3TmVxR84+y+Gp5TVcnNc+bqX2DEcjRpY+H29HdwQgaB8CWm3TPhx
         nXb4j4PQt+cWbqeYWeCZlGJqOO/HhYPluDPz2EWobHZTEwzRd0HAIlfzos6/nB7t8Qxa
         UUoDzzM+2K9G5bIwOoJszTAK4EPS5gkDhAAf47cSOGh1i21XlmOIvNbCzN63fXShbDNS
         FqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765258909; x=1765863709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTRFVgVHGAErXbVV5LVlpbXUuhRN9WLfw8Rm44Nxnbc=;
        b=H4aleMkpzQzF1x3BB/3IlNGuDBMqnTd8IDWd0911tTeRX2V43WlQHCeW+JwV9vDJAL
         AH+/7qeEWBl8pz0wTwGvNJ4mtV73HfL98ujlj/hjQOf2nmRideQVJsu/RslxW65sRjNw
         3GvDoZDdZUGECGaqQe9a7sqnmknbmu9V7DCHg4jhFbRrDSKJm5JhS3S9GEoDp2J91Jjl
         xbbH00ryUTFVriWfmPv4uyphdCXRJvl9qvfAGL9rohDtXjk9iswTjYBp0e0dwU2jXJCE
         nOmD7TcuPRuR+s95gJMP4lkMU4958elDyf7zF7aZKt1zCTRA/qtX5U0trLwJpZc61vWn
         P8iw==
X-Forwarded-Encrypted: i=1; AJvYcCXb84F2NPr4KMPtjdvTihyRqaxW34NJD/lohY8LlCmGn3kge6G1CSzCRiKxRh8OQL6SJeJdAWbXq+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhZydNhwRQP/0xSz/OSEskH6GPl11UR0H5VWtqgREGuXupeRj1
	J13PWz5s87Wf+z6JQ7+AFm8wJqKx+HPb1qQmKlbfojAEaVDAuTBTDtjj
X-Gm-Gg: ASbGncvwaaA0XqwwsJ72UrQidqqGrTi5SydojwIilL9AMEG+pG8+mAboGk00nJdK6Km
	9Hn5/mzVyHak8AhvIdOkc2UgxR9vTVQI+LVVhCZ/RPCp6Y8eRYt0dfqOuLS22mCVbNrc2x6irOZ
	nOXiSSeDG3Nx+yr6nZW9OExuU1SbjdVaxWFbwtVk5AWeFHHB4f0uzJwMaDx/+ORsBTfMRrRKLzU
	aZE8LCoOJ9CWBmni7P+TGa4hLkbWbfdS5dH6+eKKBtwW1rcxv09OdFr+uX7ON0bX1qR8/PBnLaU
	wut/rBrudRaGcgfNUi2nYuww6zFX/sieiEMx7KXZzwjsjAVM6K9gXcfAv0/e7O0ssbAwMttJ3zN
	XhuqsmqMk5uT8lEWN3gqXWPOEUUF6flHjDIgWDkpOelkFWZta+2BCmaN/sMWUrYgGZI4Y6g==
X-Google-Smtp-Source: AGHT+IFcqiBHI21RrSttGZiP497t9/mOpRwkZ2oqsE5EQeAnB/xmol5gM3RYbyZHVwOJtrf+Y0s8Fg==
X-Received: by 2002:a17:903:11cf:b0:298:90f:5b01 with SMTP id d9443c01a7336-29df5f1bda3mr101903405ad.52.1765258908812;
        Mon, 08 Dec 2025 21:41:48 -0800 (PST)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49b196sm144408235ad.17.2025.12.08.21.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 21:41:47 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Date: Tue,  9 Dec 2025 13:41:41 +0800
Message-ID: <20251209054141.1975982-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When plugging in a Dell U2725QE Thunderbolt monitor, the kernel produces
a call trace during initial enumeration. The device automatically
disconnects and reconnects ~3 seconds later, and works correctly on the
second attempt.

Issue Description:
==================
The Dell U2725QE (USB4 device 8087:b26) requires additional time during
link width negotiation from single lane to dual lane. On first plug, the
following sequence occurs:

1. Port state reaches TB_PORT_UP (link established, single lane)
2. Path activation begins immediately
3. tb_path_activate() - > tb_port_write() returns -ENOTCONN (error -107)
4. Call trace is generated at tb_path_activate()
5. Device disconnects/reconnects automatically after ~3 seconds
6. Second attempt succeeds with full dual-lane bandwidth

First attempt dmesg (failure):
-------------------------------
[   36.030347] thunderbolt 0000:c7:00.6: 2:16: available bandwidth for new USB3 tunnel 9000/9000 Mb/s
[   36.030613] thunderbolt 0000:c7:00.6: 2: USB3 tunnel creation failed
[   36.031530] thunderbolt 0000:c7:00.6: PCIe Down path activation failed
[   36.031531] WARNING: drivers/thunderbolt/path.c:589 at 0x0, CPU#12: pool-/usr/libex/3145

Second attempt dmesg (success):
--------------------------------
[   40.440012] thunderbolt 0000:c7:00.6: 2:16: available bandwidth for new USB3 tunnel 36000/36000 Mb/s
[   40.440261] thunderbolt 0000:c7:00.6: 2:16: maximum required bandwidth for USB3 tunnel 9000 Mb/s
[   40.440269] thunderbolt 0000:c7:00.6: 0:4 <-> 2:16 (USB3): activating
[   40.440271] thunderbolt 0000:c7:00.6: 0:4 <-> 2:16 (USB3): allocating initial bandwidth 9000/9000 Mb/s

The bandwidth difference (9000 vs 36000 Mb/s) indicates the first attempt
occurs while the link is still in single-lane mode.

Root Cause Analysis:
====================
The error originates from the Thunderbolt/USB4 device hardware itself:

1. Port config space read/write returns TB_CFG_ERROR_PORT_NOT_CONNECTED
2. This gets translated to -ENOTCONN in tb_cfg_get_error()
3. The port's control channel is temporarily unavailable during state
   transition from single lane to dual lane (lane bonding)

The comment in drivers/thunderbolt/ctl.c explains this is expected:
  "Port is not connected. This can happen during surprise removal.
   Do not warn."

Attempted Solutions:
====================
1. Retry logic on -ENOTCONN in tb_path_activate():
   Result: Caused host port (0:0) lockup with hundreds of "downstream
   port is locked" errors. Rejected by user.

2. Increased tb_port_wait_for_link_width() timeout from 100ms to 3000ms:
   Result: Did not resolve the issue. The timeout increase alone is
   insufficient because the port state hasn't reached TB_PORT_UP when
   lane bonding is attempted.

3. Added msleep(2000) at various points in enumeration flow:
   Locations tested:
   - Before tb_switch_configure(): Works ✓
   - Before tb_switch_add(): Works ✓
   - Before usb4_port_hotplug_enable(): Works ✓
   - After tb_switch_add(): Doesn't work ✗
   - In tb_configure_link(): Doesn't work ✗
   - In tb_switch_lane_bonding_enable(): Doesn't work ✗
   - In tb_port_wait_for_link_width(): Doesn't work ✗

   The pattern shows the delay must occur BEFORE hotplug enable, which
   happens early in tb_switch_port_hotplug_enable() -> usb4_port_hotplug_enable().

Current Workaround:
===================
Add a 2-second delay in tb_wait_for_port() when the port state reaches
TB_PORT_UP. This is the earliest point where we know:
- The link is physically established
- The device is responsive
- But lane width negotiation may still be in progress

This location is chosen because:
1. It's called during port enumeration before any tunnel creation
2. The port has just transitioned to TB_PORT_UP state
3. Allows sufficient time for lane bonding to complete
4. Avoids affecting other code paths

Testing Results:
================
With this patch:
- No call trace on first plug
- Device enumerates correctly on first attempt
- Full bandwidth (36000 Mb/s) available immediately
- No disconnect/reconnect cycle
- USB and PCIe tunnels create successfully

Without this patch:
- Call trace on every first plug
- Only 9000 Mb/s bandwidth (single lane) on first attempt
- Automatic disconnect/reconnect after ~3 seconds
- Second attempt works with 36000 Mb/s

Discussion Points for RFC:
===========================
1. Is a fixed 2-second delay acceptable, or should we poll for a
   specific hardware state?

2. Should we check PORT_CS_18_TIP (Transition In Progress) bit instead
   of using a fixed delay?

3. Is there a better location for this delay in the enumeration flow?

4. Should this be device-specific (based on vendor/device ID) or apply
   to all USB4 devices?

5. The 100ms timeout in tb_switch_lane_bonding_enable() may be too
   short for other devices as well. Should we increase it universally?

Hardware Details:
=================
Device: Dell U2725QE Thunderbolt Monitor
USB4 Router: 8087:b26 (Intel USB4 controller)
Host: AMD Thunderbolt 4 controller (0000:c7:00.6)

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
Full dmesg log available at: https://paste.ubuntu.com/p/CXs2T4XzZ3/
---
 drivers/thunderbolt/switch.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index b3948aad0b955..e0c65e5fb0dca 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -530,6 +530,8 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 			return 0;
 
 		case TB_PORT_UP:
+			msleep(2000);
+			fallthrough;
 		case TB_PORT_TX_CL0S:
 		case TB_PORT_RX_CL0S:
 		case TB_PORT_CL1:
-- 
2.43.0


