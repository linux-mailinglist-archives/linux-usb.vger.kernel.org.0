Return-Path: <linux-usb+bounces-36183-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIXdFPWm3GkEUgkAu9opvQ
	(envelope-from <linux-usb+bounces-36183-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 10:19:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E72743E8FEF
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 10:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46E2E301ECFA
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 08:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C7A3A545A;
	Mon, 13 Apr 2026 08:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EistVyB8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447053A5422
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067971; cv=none; b=UD2O4KseT7h5kh05oSTFi6b4zKkeahDv+ATepHijHxAAfLAN8ChKIuYZyAUdSZha6DK7t/VvJY37XI1hX2XBMkpXEzZLIdpryQzAHkfl6drjbmvYnG7Z88OrHiq9YzPPw1iw0SldZjAya5IWfNWQqNRjDCEefq9GwkpYG+kYYQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067971; c=relaxed/simple;
	bh=sNBz93ijFoNpeBDvZd30Inim2xYdS40WT3Qk1L5xZ0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=duRU0lPFhAEhlPMzCqZnknYTa2v7aeOIfTQKjZtQQqv+aQfNhl7XPQejPlIofPGDLutwWs9tmzKrv6QIlmO0I/NgnYPb9wLcbHdpI44IP5phGxbodgC9+5P6kcqIRHbnSP9CPTq7b+czW4Q3M1osU/rT0SDaMdT/m+xkbZtwA4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EistVyB8; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f37c09352so507282b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 01:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067970; x=1776672770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nyoodP8vqkF/vXwMMM18I+0DFbSTH1wXaH4sVIn9OTo=;
        b=EistVyB8V9Nj5khpByM809Gdzn3kYRfZdf6H90OwxWEAPKOpxWDVmp7y5Z63sjA+tK
         B4dg1Pa7j9+ojuyPCsu8G7Cag9yc/fWbs1Xw6xVXzsakfVoLPIudjbdlaitZXGVLRL2c
         s5tU7UvKuuKrT+h5CvAvBKTnnooddxU/nOfEGlxTrjHsL2GaV9kBmmcJHCuVvgKSaXVl
         +GGDJpt62/iffu72Ie/ZuhmgW4K9nt87vqM8zbXB4vwg9LtwUxfYCNESbJroNM2DxUyV
         vabOc9YwpVgB79RXkXsGLWpEp+wg7ojfhH/fK4hZcmRIdQVA6r96nNfs8KCyDkcC89Yw
         I9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067970; x=1776672770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyoodP8vqkF/vXwMMM18I+0DFbSTH1wXaH4sVIn9OTo=;
        b=jRid25QODrhUFIPdlMblLScEPiTiSU4fL5MSU2bNkOgnxtUgYrMmVkNj7+Uar5Zy/k
         5Bw8gXMiweOXWmjQIovhRhSkqRvKo1lO4twIuCAaVLOXlVETMtj+UM800kaa+V4O1s5R
         Jw3CuICDlfUMWYnW40DrqDvUrpccsqwsAN9bB86YxQwb2KPKiijenCBAP/4Bz0y+aKPZ
         od89z9pWYNSeK5F487G9c1aJNnFLpTAk4GHpmBViF24S+Q6IM8MMtsrmzTcNiXEMb7bx
         CPhC8oRIMOXVXnbBlKNxbM+dq3mCX91vHtpcEta43Owp8pgh+iIGT02rNTHCIg9SFpSX
         R9xw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZSBqk+dqViKkWYDi6F715LZhnJmMue9RVr0NLS+egcjWV3FgErf72v8bKVbTFui7HQf+sVaQKKV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQyoUJH0vWYQ0MRxNM3se72yuedWyTKJFX6/K5yFkFFmQz1ZiO
	PY/NxymQWiwonr0t2jduhSe1wSt7bQ6I8wHotktaua9cyFkS5qj9wnca
X-Gm-Gg: AeBDievyaqRD0SvPFf3nMDenHiQnWvAbeoz7qXqxj75WuPt6FhXaY2ka9dnf0T83Lzv
	F+fhbTk9tpHucQU41umL7AAVeLZOYiHgfoBcrEqgLT8ruj+WaC0lhzYVRCTTOuNt8+2BA0j+Uuo
	yhq3QeVf6wG3sWSeKx/i8/ocOa9a9rLZCLcI7ByDpliblqDjEhcySUv3v/Kc55F1rTb+bGNXWjo
	AElvA2YVO0FJDqUUTs9F5NRrZQWLDKDSyfB0i3I2f58sB1WpoTc7Y9pL8Yfd4/xRp8aDq0L1eU3
	Ndsb7/pl17kR+cx85m8Qp4x35xUeXB2iA12DKjBINadOXRxCE7F8upSXf1thwhOxBybsKiuTidz
	SIcNEzVxXTD1/ksDRqDSJUJvjNPbkjGRpIzbatiiloStdyisyYNED5LlMly4lfQd6dApb03j8Kp
	NscoLDa1hsVIVXX1V6KoGL
X-Received: by 2002:a05:6a00:6ca2:b0:829:6f7d:3086 with SMTP id d2e1a72fcca58-82f0d10b638mr9335907b3a.11.1776067969577;
        Mon, 13 Apr 2026 01:12:49 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b5a79sm11026725b3a.30.2026.04.13.01.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:12:49 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	William Wu <william.wu@rock-chips.com>,
	Yuhao Jiang <danisjiang@gmail.com>,
	Ben Hoff <hoff.benjamin.k@gmail.com>,
	Terry Junge <linuxhid@cosmicgizmosystems.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	John Keeping <john@keeping.me.uk>,
	Lee Jones <lee@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] usb: gadget: f_hid: fix device reference leak in hidg_alloc()
Date: Mon, 13 Apr 2026 16:12:37 +0800
Message-ID: <20260413081237.2677048-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36183-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[linuxfoundation.org,suse.com,kernel.org,rock-chips.com,gmail.com,cosmicgizmosystems.com,collabora.com,keeping.me.uk,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E72743E8FEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

hidg_alloc() initializes hidg->dev with device_initialize() before
calling dev_set_name(). If dev_set_name() fails, the function currently
jumps to err_unlock and returns without calling put_device().

This leaves the device reference unbalanced and prevents hidg_release()
from being called. Calling put_device() here is also safe, since
hidg_release() only frees resources owned by hidg.

Route the dev_set_name() failure path through err_put_device so the
device reference is dropped properly.

Fixes: 89ff3dfac604 ("usb: gadget: f_hid: fix f_hidg lifetime vs cdev")
Cc: stable@vger.kernel.org
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - correct Fixes tag to 89ff3dfac604
  - add Reviewed-by from Johan Hovold

 drivers/usb/gadget/function/f_hid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3ddfd4f66f0b..2734ebd35bda 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1610,7 +1610,7 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 	hidg->dev.devt = MKDEV(major, opts->minor);
 	ret = dev_set_name(&hidg->dev, "hidg%d", opts->minor);
 	if (ret)
-		goto err_unlock;
+		goto err_put_device;
 
 	hidg->bInterfaceSubClass = opts->subclass;
 	hidg->bInterfaceProtocol = opts->protocol;
@@ -1647,7 +1647,6 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 
 err_put_device:
 	put_device(&hidg->dev);
-err_unlock:
 	mutex_unlock(&opts->lock);
 	return ERR_PTR(ret);
 }
-- 
2.43.0


