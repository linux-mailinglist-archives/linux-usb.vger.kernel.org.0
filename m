Return-Path: <linux-usb+bounces-37538-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBUpLAeJCGrEuAMAu9opvQ
	(envelope-from <linux-usb+bounces-37538-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 17:11:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B69DA55C431
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 17:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08DF130046B2
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 15:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292663D88E1;
	Sat, 16 May 2026 15:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtTw8eMa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D65F33B6C2
	for <linux-usb@vger.kernel.org>; Sat, 16 May 2026 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778944256; cv=none; b=RfK8V7pVN8EAHdkXfaxEuVQp/6+XTCk1drfFc6Lx77/9Xc3Wp6udNO/DpMQQnc+64IDR85BEQmHN1NvPZQwVPS4RSZSS5fwISKlAnPXsOaQBANs0Zov6yreStbgYioU55Nesbp8tSFljIfKf0Ih9bz2BWj41IDLeq/ghcy2IMn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778944256; c=relaxed/simple;
	bh=kahacU/6BcOjz415awIGWpfs13RyKvoDn5wT6ZW5zwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZEdNHqqxX77RSmjc0kDikYFocx5eCmW7DZFmlQbvEN8RrobRfOuBlYDjbXY+aGufirM9qDTT11mLNwLaDrS9L1xdfGuv7vjJOlzzlSyuDCdaLskFH3mTS9F7JCw1xh0nio8PwoWxnJfyH/gfZmkZbZPXnAbLS3Wf4QF5ua8z688=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtTw8eMa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so4285485e9.1
        for <linux-usb@vger.kernel.org>; Sat, 16 May 2026 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778944254; x=1779549054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TdPccrNvPXbGQuUhnf3in1A23lxCPOdJ87bP+BVzD2g=;
        b=KtTw8eMaFR7fPiMK5BER8joxNMsPvMOS7VkuC8Wc49RQJE7gxaSFzCdT5jCehySI2y
         BOs0LB2rG/dCI5nIKnMtJQE65bkOxEUbUUYHIQYwN82EQOdxhODKP+V7uMMyVhOsW71J
         PEOxUQ1gFaJMQB1bJCkW9dcjTiPYBVO6cMD/C8xmp50qL5mLZwoJioTmg42wloPPzIOx
         gRJqclhtb/NrHZxWSawVnvza7XG6VKlOawaWdBE65gK/A6lnJ5F7WFwZEvUtCbY/ouk3
         lxfShStzo/FrqJ7KOJLUe/Z5ZilPgpWYjvzClPRnx7VfUIgYTh0fZhhjwbcSPHyaP1q3
         aB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778944254; x=1779549054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdPccrNvPXbGQuUhnf3in1A23lxCPOdJ87bP+BVzD2g=;
        b=XdBp+DIUwxTb9OB/TgZKFy5qPJAoKZsZgMNRbmjjE4xVq3UiyHoJQQDhjV2k9DvAvd
         RgYQ32hKgKL8TWNC9BZWHLm2lldiCeBErBRM1GOHr1lxFikbmc0VbxuJrI5w/zyWg51Q
         kzbaMcGg+JE43c6KCsEBAJHG6hUT7u84Z8cGWHqU3xunak2Y3bNP0TAfePcvr+CGUwAt
         gK2+NNmv/rkfUcx/4lZ1fuPV6zyuk75atD/zfuaVA/mwSF3ennLm/CNEKIg2UxijL7k7
         zbqkEuiMeuudzFTe9eZsOIx3Nk6mKn0QXyGiHYdfI9UqR8KvDjWZSvj2NEdU7UUMwoLx
         2JdQ==
X-Gm-Message-State: AOJu0YyNeMUkgiveqRFiMcLXrjiPPWDJFCPK4RcIagxiSph8fRhkgmxf
	i+OjPzY9hYqAJ++JnAx0KkdlIwZUmRSB2oNvQh+mxmX28IoNkjTA6+1D
X-Gm-Gg: Acq92OEOuADEbMljbMQJp8XaazLGnkNv9qQtXJNmGayist5sWnRXLwW1nS14DUQkVva
	RM3xalAj+/c+OSRMv0WmLtSa7CUqTkMVZO4A3lAqImlodfB1sn6VeJH8/gtKsDkreSF7pMLw7qc
	xfIR3Re6nxtT7dGo/GQt3gF4sYVsetXeiUzZPhe15A0Gw9MRI77+GxPI0tJDzcEWGh0dARMFZWf
	llZ+lEAV7gnnLTP8xG+x6mko+QqvpK3G5Wm2sawJ+GcGWtnxfima9zskXU3jOrdBtktSK9EhrAI
	ARcwkGGTNuIq9jjFZEx8H6nkQL4t/dwPamy2bHYnw3BiWZGUzyF/UZF/CkJ6UFP9jzLZMUpbFtd
	k1NY6gzlIWUBX3o4MRd7p/86NVwQDGZwvO7U3TXtid7+BNajBFuoYpv409svNscVyfX3T0SW0wb
	5mP/pS9GztdiF+IEcEcFL2fvQdOcNA20Q09thQFbooZP92MLQIecfD8+pmh/u/LzI=
X-Received: by 2002:a05:600c:4a1a:b0:48f:e6b9:c728 with SMTP id 5b1f17b1804b1-48fe6b9c7e4mr66947465e9.26.1778944253336;
        Sat, 16 May 2026 08:10:53 -0700 (PDT)
Received: from localhost.localdomain (i59F7ABFB.versanet.de. [89.247.171.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9adc2209sm20764153f8f.0.2026.05.16.08.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:10:52 -0700 (PDT)
From: Elliot Tester <elliotctester1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Elliot Tester <elliotctester1@gmail.com>
Subject: [PATCH v3] usb: legousbtower: remove changelog, tracked in git
Date: Sat, 16 May 2026 17:10:41 +0200
Message-ID: <20260516151041.46180-1-elliotctester1@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B69DA55C431
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37538-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elliotctester1@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The changelog in legousbtower.c is no longer maintained and has been tracked
in git for a long time, so I removed it.

---
Changes since v2:
- Added change notes for both the v1 and v2 versions of this patch.

Changes since v1:
- Added a body to the commit message explaining the rationale for the change.

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


