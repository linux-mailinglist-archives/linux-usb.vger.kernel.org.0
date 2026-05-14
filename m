Return-Path: <linux-usb+bounces-37448-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPlmEEEZBmrGegIAu9opvQ
	(envelope-from <linux-usb+bounces-37448-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 20:49:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EFF546090
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 20:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C83F3080F8B
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 18:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6A03AB48C;
	Thu, 14 May 2026 18:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8rmO3wy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949583A63EF
	for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 18:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784442; cv=none; b=prEzvMLWCmq7SvOPBChcJ1u2cvS6IDguuWCFMGfJicHj9pggMrCTqQQc84rZO/KkmPQprgl3ml5wPDMfHdgn4rlZ++5hyvXRd0Q4YCb8wHxm3d5X9LaGYZzj9RIjQSFlyIgVG5LXMOe1DSjiHvuvHR2FUrilimrQIQXqf/aNdo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784442; c=relaxed/simple;
	bh=PXleffKKvqlmp6s3J3lS7BHPzFKx9hjbspdIkU+hgGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t3zGC77+0BeRtJN1ZREJm6hgZRLJFIdqLFUXQoxpb+P8dM2kJc+ZRF0eTKNmFqTTP7JRsX4VZm4gAx/ppnLR+krQXY/A2/GruHutR00zF8rGzRTenkk0UgNMgr9s+q1yK5NBuwDQXVCaN+ktw6w1vlTP6DFXuFtXvdnxQQg98qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8rmO3wy; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45562c41ec7so4222577f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778784438; x=1779389238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E5hxioPcpxhJryPlY0AXrvD+cYZhEDbBbZHCOeCb2HI=;
        b=O8rmO3wymXwXT99oxF/TRsOEJnQrmAwbTOVlN3c6IBJlNKoMBVxnovd5mTVaK3FBWW
         zuMgpLhreOFycou8G7myGU1iuODjN+ucQsBHa6lEeGHj8VucdF+Xb4Dill5l/Wk/JEx5
         71EJPAE3AyrLVLpO8YFDnVn8oHEMjpcFixI0HOIj7mVgWkf4F/fwJCgF0fLETb3C+6oX
         WM7UJFshj/JVpIzTdPSMTub6weHUTCs7LAKtzp0xAmUBKlS6TohOhECCPZdicTkU6pcK
         wz2fdlPj6XQ/wKbKyHTyvys4JfLupSX+0iAdT7tZOdT/1yUxh6vk1IXWOVGoS4iN9Hhf
         ppDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778784438; x=1779389238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5hxioPcpxhJryPlY0AXrvD+cYZhEDbBbZHCOeCb2HI=;
        b=KceL7vOa5ZoylC/Qiw8kjFj0WyPyHKloTSkhXi125gK8A8CSRvNwgLYgBA3YjWYgw0
         y+1joJZPHK7stVXcm2CnmzAtzp6ufH6DWglISAcQCLATpaJeEK/nISq1tvBjuX2zK7Kz
         2DJbycyq6moaCjoEaI4KPJR1y8rbQuWJo3oaiDRnZ1YJ3nf24T6BNyKXNTxQ8QfGZRcP
         6tFEAcKFV502uN6MgirboAK62k7UWvdv1XUDy6urbRmuBa1caMb6Tng10UeaWvrNYdzo
         Hliwgczjrn0uO/W+Vs9fWKP9swquAzXs2Hk26gNpTwr0iefFUyyA6XOXQby0CkEKQa5n
         dDTw==
X-Gm-Message-State: AOJu0YxLqA5waEcIuzANPzQ8wjgX/5vEr0CNNXrn5JBXHnO3+g+HGfJD
	rChYzdoQ/PZiZFKfogI1YW2AzJc384Zm0pIstQnbgvJZFhQt5deBtiPc
X-Gm-Gg: Acq92OEhfBJO+d9KHV9bBsG8uSa/QvuDr6FnTYiZPV5n/9Bh0qdIFiWdAuaGjFhBaEi
	7/oVq/vpJSaoWJrl/j33sAbzTQnbX2lyLUH0WFwyasqghf+aHZfNjmhCtAPcbQaKWJLXhEvcYQZ
	/UQi2BtxIW0zWy4KSviykzTy8lAhWB4xUNkX3foMOAdjFiKgzxElF9qVIVcHtezl6jFEUeyA/Ky
	TiM/TUc1S81GOJWcTCB/5DFqE0SdmAqC/AaeVzC2a4Ng8pqQtFG3w1xNI68P4hBM776fwV7oqZV
	x+ZhqX3tt2ABcS0UTDTcgyrASwEozzvfZrngTL8ZvRaH9w9zRxRF0H6DSiS1Qvf9qay2YpgkNF1
	HDj6FrVPJ9ye9vL7nHa2/JE/I+QakB85Hw9PkeF2gp2eCMRealjeyyog1LWuMO2xdhD3wA1Gx/s
	9f88MDL/Yjw8WZ/VcRJo/N2u+MCtx7DZ4+AOqte2swTHE+46nmqTIbZdiT3Vv0b/E=
X-Received: by 2002:a05:6000:310e:b0:450:e33b:23de with SMTP id ffacd0b85a97d-45e5c5a5ca4mr381061f8f.2.1778784437491;
        Thu, 14 May 2026 11:47:17 -0700 (PDT)
Received: from localhost.localdomain (i59F7ABEB.versanet.de. [89.247.171.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed2f738sm8446530f8f.16.2026.05.14.11.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 11:47:17 -0700 (PDT)
From: Elliot Tester <elliotctester1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elliot Tester <elliotctester1@gmail.com>
Subject: [PATCH] usb: legousbtower: remove changelog, tracked in git
Date: Thu, 14 May 2026 20:47:06 +0200
Message-ID: <20260514184706.101545-1-elliotctester1@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 93EFF546090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37448-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elliotctester1@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kroah.com:email]
X-Rspamd-Action: no action

Signed-off-by: Elliot Tester <elliotctester1@gmail.com>
---
 drivers/usb/misc/legousbtower.c | 61 ---------------------------------
 1 file changed, 61 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 052ffc2e7..e34777c68 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -8,67 +8,6 @@
  * derived from USB Skeleton driver - 0.5
  * Copyright (C) 2001 Greg Kroah-Hartman (greg@kroah.com)
  *
- * History:
- *
- * 2001-10-13 - 0.1 js
- *   - first version
- * 2001-11-03 - 0.2 js
- *   - simplified buffering, one-shot URBs for writing
- * 2001-11-10 - 0.3 js
- *   - removed IOCTL (setting power/mode is more complicated, postponed)
- * 2001-11-28 - 0.4 js
- *   - added vendor commands for mode of operation and power level in open
- * 2001-12-04 - 0.5 js
- *   - set IR mode by default (by oversight 0.4 set VLL mode)
- * 2002-01-11 - 0.5? pcchan
- *   - make read buffer reusable and work around bytes_to_write issue between
- *     uhci and legusbtower
- * 2002-09-23 - 0.52 david (david@csse.uwa.edu.au)
- *   - imported into lejos project
- *   - changed wake_up to wake_up_interruptible
- *   - changed to use lego0 rather than tower0
- *   - changed dbg() to use __func__ rather than deprecated __func__
- * 2003-01-12 - 0.53 david (david@csse.uwa.edu.au)
- *   - changed read and write to write everything or
- *     timeout (from a patch by Chris Riesen and Brett Thaeler driver)
- *   - added ioctl functionality to set timeouts
- * 2003-07-18 - 0.54 davidgsf (david@csse.uwa.edu.au)
- *   - initial import into LegoUSB project
- *   - merge of existing LegoUSB.c driver
- * 2003-07-18 - 0.56 davidgsf (david@csse.uwa.edu.au)
- *   - port to 2.6 style driver
- * 2004-02-29 - 0.6 Juergen Stuber <starblue@users.sourceforge.net>
- *   - fix locking
- *   - unlink read URBs which are no longer needed
- *   - allow increased buffer size, eliminates need for timeout on write
- *   - have read URB running continuously
- *   - added poll
- *   - forbid seeking
- *   - added nonblocking I/O
- *   - changed back __func__ to __func__
- *   - read and log tower firmware version
- *   - reset tower on probe, avoids failure of first write
- * 2004-03-09 - 0.7 Juergen Stuber <starblue@users.sourceforge.net>
- *   - timeout read now only after inactivity, shorten default accordingly
- * 2004-03-11 - 0.8 Juergen Stuber <starblue@users.sourceforge.net>
- *   - log major, minor instead of possibly confusing device filename
- *   - whitespace cleanup
- * 2004-03-12 - 0.9 Juergen Stuber <starblue@users.sourceforge.net>
- *   - normalize whitespace in debug messages
- *   - take care about endianness in control message responses
- * 2004-03-13 - 0.91 Juergen Stuber <starblue@users.sourceforge.net>
- *   - make default intervals longer to accommodate current EHCI driver
- * 2004-03-19 - 0.92 Juergen Stuber <starblue@users.sourceforge.net>
- *   - replaced atomic_t by memory barriers
- * 2004-04-21 - 0.93 Juergen Stuber <starblue@users.sourceforge.net>
- *   - wait for completion of write urb in release (needed for remotecontrol)
- *   - corrected poll for write direction (missing negation)
- * 2004-04-22 - 0.94 Juergen Stuber <starblue@users.sourceforge.net>
- *   - make device locking interruptible
- * 2004-04-30 - 0.95 Juergen Stuber <starblue@users.sourceforge.net>
- *   - check for valid udev on resubmitting and unlinking urbs
- * 2004-08-03 - 0.96 Juergen Stuber <starblue@users.sourceforge.net>
- *   - move reset into open to clean out spurious data
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-- 
2.54.0


