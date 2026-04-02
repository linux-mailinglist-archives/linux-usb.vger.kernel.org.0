Return-Path: <linux-usb+bounces-35905-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO8WDvGuzml+pQYAu9opvQ
	(envelope-from <linux-usb+bounces-35905-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 20:01:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8A738CD22
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 20:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88ED73029ADC
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 18:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770F21FCFFC;
	Thu,  2 Apr 2026 18:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="roERPF/W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF00936C0CD
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775152815; cv=none; b=CUUPnW2+eEXD4DXW4nZpNQRo2RmdTbk+bfS2H0gR4HynBaTu3L3fW4PDqeC4htzWEnIWYa1u7R4abdIl3I2bBlsTem/uIhFXmp4vbr8URPqykEDUo2+7OoE+tUSHl3IEoGB3n6rvor7BeQCJaxsAq65LXrUwL4mQIps6iBp1TY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775152815; c=relaxed/simple;
	bh=8bupjfUocC26fZ9+vDNIVZ+9yNEJBseln4RkmXNA7Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FjvLWTWMlB1+pf6ipJedCIQW0kYR8FKnmmlpvebyCNK8wj9M4x059YL9lDhxHF2gq/DBwnJ/wuvqMTRofCmUlYv05gsIaGuatKGuBjIo1sQSf0BlcOY1cgWbyypTjizkKmYfzcy+MK/U2W9g7okLe2pVsamTO3t4IWoiaWHb9dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=roERPF/W; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79ed2fc6ac7so9000837b3.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 11:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775152813; x=1775757613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zt7vlx+cjI66ioF65ZU6UWgXA9N3wmD47EJ6HdwFLZY=;
        b=roERPF/WQN85MiAvRRAL4fZLF3kHrlH51IUnxQrbDmbMNp2V5qYq5wpjGE6+e67t75
         9leOLUxTza89kZDO9SY36uUOykhTI5I5Dc0+yrrkn77JS7Mz+gGW1b5QB6sFKnzBc/G6
         z32SwRaxHFPYR/9o4Qu3Ht4/zmZX7tD12/FBvNt++ouQ12vl51vqk2IMFZYBl8cQMD+1
         ezJeP4F/nNNc3fzFKwCLMbC9cXtJ5xTDpFO98yWnTPdrQVxAdG+mh1Bd0qE+ZPntXEXs
         C3QOCWuiaHK8FYl4ylzjpDIHjCWgm/iOOxrmM586zpG6tnwEj5p0JMQsoq0wTzFDzNFL
         8DDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775152813; x=1775757613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zt7vlx+cjI66ioF65ZU6UWgXA9N3wmD47EJ6HdwFLZY=;
        b=WX6gjO77W4HRYxhJSiSwBpss1xNLhKfXwvzTRFQA11lsrwBOTHlJ/thkqRCnwtIFra
         GinKwobknbaO1Q1+H38vZPf55MVmOKBM1jU5SF0V+HrutfpKoCLQr7GIB0JAu1TDfPw1
         MHqI7TU8z6dSGMCFtZ/Apc/NSAm8ZwgMh1x7dxUU8ziZQKi8HicjPFb3XfJs0SqFPu80
         yfR0iPvNAN92pC6CIbKS6iMh9i7THCPhaHj+IflF01E9tjF2PaF2ZECdIgZrBz1D3FWQ
         u6xRFRYytwksK9L9kvWBx12niKE0BNmPYXpGPNgY06rS0JidhMzh9M+5cPVGAhmIWdTH
         /dwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1xPz+Kq4l/WSRp4K72Vmi5XhRSqch6VPZAuA+9xtbHhjgQFQOZif9f7uGXp+GqPf6w7ZV73DNNw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFstndEEUgqz+eJbV4w9LAbMk6rxmgSMZOUlfg0T1YLV6SrS8v
	iB3yxEOglh1mEZZ61PUzgzIEixSmwQy7dm0xr4SoSa8wxxLipR6o1TVW
X-Gm-Gg: AeBDiet2f2K92Ix9+M7qz2RYMML5/HGCgyA9TYJwZJeEm3w6qQ4JqFGKc85VZEnF8+v
	Ur04XeYIECFqNcLoYF5vMWTaJXVXr+qvWoSkjuKLoVHILXH57JRqUO4OuONi5GRijRyT0a+vXRS
	r2/OoshF/YCyBRvfSF1Prd9+1ftqwvwdncfgeZNU5nbsucAJd9jQBL/TjHaSL8pGQIoPQa4S22w
	rXpzuewboHnoaxjv6+W+3hoU1uxK+OeqiZrU2siGzvIpOXk5vYih6a3H0sJ4zU2iRzqOz/+DKVy
	YNfeNTiJcRc03vHLuoU4d0weTJj1BSgJk5eHymp1oXQC1hZBXsNJ9YJUl72l9wDBY4JA3zRUKp3
	ddEGkqn7u8pqjvSSvKjWx2rLl+mmcM8445SycUqIjvL8nkKODs3W/8zQfDgDoBE7esun2kR5fEq
	8XdMOh3wAaU1Ai3J0grC3NTQS3zlcgBQmvmUTAXLg8ZY5THUDIBegyHPLM15+6X7qyOlfDovDLX
	l4Cab5lZmmVo8d3OLpDmTQO
X-Received: by 2002:a05:690c:89:b0:79a:c630:c40b with SMTP id 00721157ae682-7a4d90a3374mr2463047b3.48.1775152811908;
        Thu, 02 Apr 2026 11:00:11 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e42fd37sm13481747b3.1.2026.04.02.11.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:00:11 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org,
	sigmaepsilon92@gmail.com
Cc: peter@korsgaard.com,
	mhklinux@outlook.com,
	linuxhid@cosmicgizmosystems.com,
	danisjiang@gmail.com,
	kees@kernel.org,
	hoff.benjamin.k@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] usb: gadget: f_hid: Add missing error code
Date: Thu,  2 Apr 2026 13:00:08 -0500
Message-ID: <20260402180008.64233-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com];
	FREEMAIL_CC(0.00)[korsgaard.com,outlook.com,cosmicgizmosystems.com,gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35905-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD8A738CD22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently in cdev_alloc() error path no error code is assigned.

Assign error code '-ENOMEM'.

Detected by Smatch:
drivers/usb/gadget/function/f_hid.c:1291 hidg_bind()
warn: missing error code 'status'

Fixes: 81ebd43cc0d6d ("usb: gadget: f_hid: don't call cdev_init while cdev in use")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/usb/gadget/function/f_hid.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index e0c3f39ee95e..c5a12a6760ea 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1278,8 +1278,10 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 
 	/* create char device */
 	hidg->cdev = cdev_alloc();
-	if (!hidg->cdev)
+	if (!hidg->cdev) {
+		status = -ENOMEM;
 		goto fail_free_all;
+	}
 	hidg->cdev->ops = &f_hidg_fops;
 
 	status = cdev_device_add(hidg->cdev, &hidg->dev);
-- 
2.53.0


