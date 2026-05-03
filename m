Return-Path: <linux-usb+bounces-36860-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Mm5CtKM92mIiwIAu9opvQ
	(envelope-from <linux-usb+bounces-36860-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 19:58:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E1D4B6E08
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 19:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C507300A8EE
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2026 17:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EA639A070;
	Sun,  3 May 2026 17:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZVRiG2S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35B0372ED0
	for <linux-usb@vger.kernel.org>; Sun,  3 May 2026 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777831110; cv=none; b=WmJOwwDnVhvbP8rYOEYR+5z/Ukzaf2+b+RPmp8HmSfAOZ95o5yP1AdnX3sJHVATu4W7I2xyOOptihxrf0BED8befbM1hxwJnC3VFJdWYqIKUIEwsBtrgFGPqxA4U3lkdyjpoC+K1EeeQ1f4CzyLEoVtP9teziIClqvOGVR6QGd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777831110; c=relaxed/simple;
	bh=QQ/RAa4RT3cIwQAcDcZRNl4GKxTZedxEXW4mJpy7BF8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g7dsyJBytYFsTorvzSJVEfX2eW5gCItcp6StOkful3OyIRF7o7+LasvaqXiVoI7P7QbP7Cl8FOD+tzjbO9JgbHfon1qy+2fGTCVRld5b9/r6FiXGut+9kBvHEIBFvaMfkt0mSKFCSQQS6VcD0JCCGaBElXGreUWtc2DGuaz6Dwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZVRiG2S; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48371104ffdso4116915e9.1
        for <linux-usb@vger.kernel.org>; Sun, 03 May 2026 10:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777831107; x=1778435907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jDJW7749iN/NL9FVxHSK0TS8okmcrwIIvNFP1bn+xqQ=;
        b=PZVRiG2SybNt0C9VBrk5BUKJBz03HYrd3QNPQfRATMJkl+V9Yfnb2OlzIpFy54mVHE
         NniCOudYRQqA83hlpC/7RSRV0KmFr4SPYLBTEQM9CO0RxtRY8Vvm7rmN8WCNlWJcQ4LQ
         xRflOmOvjRw/693TCGrfjAjzrVS/4xw6cx8b91O++wQevshgEqeVZXPd5mfRVsIJOn1m
         KSkR9/Dj5WRhWVAUDfrOn72kerjuJRAXVF4kfK8TNMeISrAZJyJXO7w+SVLEP4+QgkJi
         G5zGLzMlK4zz3GuiasPF3NvtjFqe4xDOGd757iSi3KaUMf8Jk8TK1TUzRCjjritjGTtD
         S9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777831107; x=1778435907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDJW7749iN/NL9FVxHSK0TS8okmcrwIIvNFP1bn+xqQ=;
        b=CnmAMdWSa+TierVtrHWsoX04wrqb9dNnDF1WGupthZfsAQOuIPyBHnvNzjv2khP6ZT
         VLMYUd5Ror+h/YR1nYYqJjB446LCDouD6APRR+EzMgJL+wYhxSHRGCxPjTL/TWJYfmJJ
         fzAp9LNOoO4ISxNekineR/fLHe2wREDuVkdiDqsPwvVgO86dZzG6IPToTILqsSM2UGgk
         nZRmNzRE5yBEIT8hc24mbhja8tnIijPIGnVYNJsk1mbyOeeYRRoaZCtmXd+stmVKS169
         moduXGdTO5ue3iSeh1YafIfxyaeqd2OkAZJyOMnJUpKdxW4Dyx238fvBihS5bG7PdGul
         V5EA==
X-Forwarded-Encrypted: i=1; AFNElJ8oKjBPMzXCR1GoZMcojI4mL6JEmoEC30p0GxtKzZxB8nb00OCDSfkFV8Pzdxd2YkP9naDLw8hPXRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC4iS1tiwVM8WMZKqLQ8xLgOKEe5Yy3GO67xplT83QrtrGaTNw
	Gzn0Oh7wfIrPU0KzIOByCJeUjrocETMewJUdRup/uhT8VzeKhOY4Y8YF
X-Gm-Gg: AeBDieuRXV6zpOr2c9gWwVh7XBA9hc5+ClnowLBncCvMO20GU7oDY+s90DSLkxUxiQT
	vzooBYH9nh08lFXDGokfxapfZTHHizAv4l6UDGYk25WptQQ8tlSwafnaBWog6vfVIypBiZ4Tm0T
	XBGoekGEe17ni3chnDT9uw7eCTWPRLYY32XM8Jax6qzNFLK1fUPpVxXJAvIwNbCNCPj/JOWhFfJ
	+38ISGu7VVMrYZgzozfjYek/XCX4InXb1yM0Wj45Td9CChCdN6ZZLJQop3sitjBckdREdLcF3+v
	67+o+a3feOk4t/oiFOE+RCqVchUbQIkYfCU829fK97jLJf33pVHz+CTAmXujdU/y6iGP+UicR2E
	kwVAUQC9tj3pKvWSADC+BCnc/4TUTUk9dstiuhLtnhhBosF5b7SyJWu3MdpctExQIpJwGiP7Unz
	XxxzG/H6ibQBe4EH7IdQJWyz5lEJANjtvD9oLf36Ibw+xRq+i5Rb7fqdA=
X-Received: by 2002:a05:600c:45c5:b0:488:ac4b:59d1 with SMTP id 5b1f17b1804b1-48a98673517mr54602315e9.8.1777831107155;
        Sun, 03 May 2026 10:58:27 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6ffb7sm215453545e9.5.2026.05.03.10.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 10:58:26 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH] usb: xhci: fix typo in xhci_set_port_power() comment
Date: Sun,  3 May 2026 21:57:46 +0500
Message-Id: <20260503165746.660-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 83E1D4B6E08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36860-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sozdayvek@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Fix a spelling mistake (re-aquire -> re-acquire) in the function
header comment.

No functional change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/usb/host/xhci-hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index bacd0ddd0..712eaf330 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -639,7 +639,7 @@ struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd)
 
 /*
  * xhci_set_port_power() must be called with xhci->lock held.
- * It will release and re-aquire the lock while calling ACPI
+ * It will release and re-acquire the lock while calling ACPI
  * method.
  */
 static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
-- 
2.33.0.windows.2


