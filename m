Return-Path: <linux-usb+bounces-37522-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIWWC45fB2pa0QIAu9opvQ
	(envelope-from <linux-usb+bounces-37522-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 20:01:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C35F3555CA1
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 20:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EACB23006452
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 18:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA563FDBF5;
	Fri, 15 May 2026 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/+loaoN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90FC3F8ED7
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 18:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778868106; cv=none; b=TeKYXWAHf+HNpFybnjVuebJ7DEaQmtnbFsaHfIG3Qm/ymJd8wDIIzQ+9zFXx9Nb0Y45jgpHaBpM+aLzE6VApcYDzARNlXr9cJup386GxUWQGSIc08ZFkgO3g7J8++JYCkOsFBoTxqUeJfd3+hrNl2naiZHySNkBx2nwz+ma4q/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778868106; c=relaxed/simple;
	bh=YvNKnsTmDTRwf9wv89GA+vaNNRxJSgRHAyhuNV/AvFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RS7JYRNvYd1QE3DvPvSlzBaYmK4rhJIIoo83vsVoyEp6fKwb/0LdQA8grY5RCJLj2BMZ1u81Bv2JxBo67w+dw8MdOsufP9mfUcQaPM0Zh6K2QFiX+qkZKichyAcAMtTxQc+21Lj0aRa1QLVhK9Oqha7ulg3Im1dda+qxEUHEtGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/+loaoN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so36195f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778868103; x=1779472903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UvCgmaHIfvSHeWaBK0t5Q33NIntnAznCcpbr2xmXE6E=;
        b=V/+loaoN+gSYvwu+9YiyRCPS180U+2dOGxzYlFKI62ZFw/KLiqwpvW9jSo9GB3BE+s
         96B3UMV1B4GxUqyrS/Wizr0hzaLwEO2ImbUxbDwvJ+oDfG/0Lb5DLyD09K7H4/17Kt8u
         7T5MWtRHPWlEBbPfMuFbdDxXfJ37yMhi0uu6FczXnBTUW9KK8rcME9aLq8tkWFS0ybQo
         TnIZARe4xl+xh744Ohzezr6somlWAdqbt5XiiZeN54ztGN8XflkWc6JpL1nZihaZpFd/
         6b2cBu7ShetXPTgsFvS2jccEw1R0zxVLYimvaxdcUC9Gkf4SQneWgXk9m9jVmDMdfVlp
         PrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778868103; x=1779472903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvCgmaHIfvSHeWaBK0t5Q33NIntnAznCcpbr2xmXE6E=;
        b=mGC7XPZpIvFWm514hFpMZRlTvBNah1yofiRQV4aBkBCNobUUK9Z4uVjHktKFHQ5CcU
         HvWWaS/gsZMPxvv3pTTaiRu6whpvAY/QtPSpDZVZsQOQ0kdKsQFfCA/16OhPk7c1ET9G
         uOUaEosipY7r5ToftJ/3yoPESUqT/u7FvFECK5g26lWuMCFKuD4oTFHoMJwS+r8eu4HE
         J19UI8T3CFaexsTkhCmHuKFRjEFQPjOkkClU+epDywSAquPqo3+2l92P18i7XLDbwon/
         fKBe0G3khIE4rYQtvAxRfy8x0KJMj21Wtdz2vqFD0yQUKL9R/vyb6XTCd9+ZBNo/UJ05
         HFjQ==
X-Gm-Message-State: AOJu0YxxjPBrqG6J+9/c17Mdk7ITQGv+QinXWR6KONk/DsauGUSh/NbH
	HRp7cs1clZqQU7O/CmNxi6LoEf8cQo46T5sRk+lIjfuqsYosuscKsqzuRpRBWcwp
X-Gm-Gg: Acq92OFs+ufCp/wFYaGWGmLJ05PY/dWL9T/EtvnccLHn5iHK/6Kv7jfl8mr+Qi/15Ge
	P9cFbfN8ay3vUXwM4A1ljrB4BQGOGE8UP6r4MDS7oyYXQv9AU4I+uW/cn+Oqjxj/zzChTNJrl94
	ZrIXbH5wVO2y6rpnomU8HKufVzlpFG4aFbLB45ymYvTWaOXK96QWhd1SdVf/uZMsuUUnQh1g5aN
	1Sp+aUE7/3mlzg2+IODfQPpr5YOmFCAQaDHPJJpQtfgrdPcK0KRCUbk6y3zms0i9yoALChdn4wv
	C1SVGn54/y14/GTbOhIBjlxPyosWmsBKpDDGyNA9EgFpImxZTY+DHDX324ePQ6bADWYmcuEOwfS
	c4V6yJNSvXNj2VRYJrlJ0ZpE8FyEhI5Ub2rQDqdav/2SJ8DWf88/qpGoKHikwTjviuO1ZaKvupp
	YFJ19eXczdvsCeXCa9u660hXWT05gkQul8tbL24+6gEu4Aq3vUi73uP6ebiDyXGptSF9DTgvYr7
	g2SXaLazBUL
X-Received: by 2002:a05:6000:22c5:b0:43c:f5a0:4e56 with SMTP id ffacd0b85a97d-45e5c5f9d94mr6683145f8f.42.1778868103070;
        Fri, 15 May 2026 11:01:43 -0700 (PDT)
Received: from localhost.localdomain (i59F7ABF2.versanet.de. [89.247.171.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed2ffdfsm14500217f8f.15.2026.05.15.11.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 11:01:42 -0700 (PDT)
From: Elliot Tester <elliotctester1@gmail.com>
To: greg@kroah.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elliot Tester <elliotctester1@gmail.com>
Subject: [PATCH] usb: legousbtower: remove changelog, tracked in git
Date: Fri, 15 May 2026 20:01:32 +0200
Message-ID: <20260515180132.27565-1-elliotctester1@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C35F3555CA1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37522-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The changelog in legousbtower.c is no longer maintained and has been tracked
in git for a long time, so I removed it.

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


