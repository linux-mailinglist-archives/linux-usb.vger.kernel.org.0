Return-Path: <linux-usb+bounces-33987-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKvfHwRaqGlxtgAAu9opvQ
	(envelope-from <linux-usb+bounces-33987-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 17:12:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FAC203E97
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 17:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C52D33FBCD7
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 15:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D6A35CB68;
	Wed,  4 Mar 2026 15:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPHsC22g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088732ABCA
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772638979; cv=none; b=e7KO8bpMKxftuKKD9HNmHsbE1WFCGpvdpGeu7Hr/c+cGKUqTEaN2EJYjwPL4EUS8dCmtZ499u/2YY8qnFWZzkjbGN5RtXzGpfKc/XGfPTVO9fdeqUaVq0ZTqEeIWKx21b/nGAOhozDCXGh6SXfaYJW6jbdS8AZB0WK2nStga2nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772638979; c=relaxed/simple;
	bh=HtPb39DNehF0QWemJ+b+lT+x3hgbR04jVkvsXQHYQQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s0StmIcacrQhiagygj2uFG0ci70mRxiYQunnyhPc0AzTTfMbj9W7ax/yznSPL/bZzf1rgasEHaLBre7nYCZt7CqsfYko0sLbNdvdkiHAlFJEbja+rwqEj2vO6M8TNB/RxXmN9z0vLzJe1iKfhZLNLuJdNcegGn04lfJXjOgssUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPHsC22g; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2addb31945aso51365555ad.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 07:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772638977; x=1773243777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4TjlFikyBnPQa3i9X3yH8EGu5EvTUdPSojCgwU8GdFA=;
        b=iPHsC22gnsBhancnIVu7Bnn+0ohuwF/HqIEBe7FjrEbxCsmIwqcMxCClwgu8Nb7Txo
         6zs4HekLGQmOTAYD28OVhHXC/LWbKrC5NLstPpwF6ll9QrdC5e/7gams0JkC1ffmVYQ7
         Wfi99b4MaBOOQUtFVPELzfEAAem4SYBSZLF+Yapzht5aJu0aTmNsYKhdH4iLpc3UC9IH
         CAToJKZDOu4qaZ5WItauzFxO5hjvNqeKeddFRwiJCQbrPe2BjfQoVpfaYwt4C7j1+CNJ
         Gs/MLTQGsZR3O8qhT3/Pc8+2FgZ/zeP5fXU3ZNBPEDDAfc+uYCiDqzCHRwv+D1dKy9O3
         mlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772638977; x=1773243777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TjlFikyBnPQa3i9X3yH8EGu5EvTUdPSojCgwU8GdFA=;
        b=AUKIOzwzTbDPEfoEXFOoyBWUYxe0dIQNRiUMeyuw7KYm4Z+tzfTwLH5KlYmdAUlh1T
         WJArbmekZws8xvXISSmxsA/zV1WDJJTvV4DtH9zix/gTl5nDtwVG6gBP4L5qZGe8nmA9
         2WGSb7Oe7DBJ8Eu05zN4h3cgemi8tP9haMoNYqA64e6cSYk9H3Mg8du/bPrpD28aRRF4
         hemCer1tqMBjaF+bK4R1v1cKTxqgRcl58OBvDVdLNFq/qjIR0XciRPzZS82PGwKf+fG/
         z72sXH2PcF2IYZ/VxTQ3KAA0/GfJBVy0NdLDnJ9yHnm57H0PC5Jew0DAva7tcBIZz3ok
         IWuQ==
X-Gm-Message-State: AOJu0Yx3R5jwLHXMgJf0obaQK1fVJwtFrLS+JvLdowS0cguXaQ+ReiD1
	UEElQMwuTd61NghR1IS862qO2NptaUVDI34vGEzvvWUnQsWClcxa9Mt7sDUDZDN1
X-Gm-Gg: ATEYQzwkfdti6aiKmhp0ADoUr26QV7vTp/9Tw1JlHCZEB4afxV9RHeVOPybhcJnE/Ko
	kw5J+B/YEAPpiIaBS/DE3vqzxrzJJl8a9DjtHEed3URTCwIp6UZD6Zt+xNNm7mlVW4aVmMxmgyc
	hOFhUfyEHgnzvjEOUCMVAjJUrC+OD+4lOZh+jSZLBLuDvCibln+3Pq94LOfAjpYhwBKNz3eB8hx
	r2R6zJvXsdO3kF1U4tLzhXrOSPWk7YHoMmfqcn9wPGptHRTrs1Z+lvA2PTzTXT6vz8BdeYm5meJ
	hpNUIUN33fTDKH2gaVyhqPu22yTnwOpxt13LE9dNDzbiP8s9G+FSO6N3Uo6CHx7tePsbL6PsbfS
	bXnaJ83NbjUM2N2wDyi2I6M4pmceJjfHLHIbAtY66zxwg5IFwDgce3pP2l6H3UufiWStx7kC+i/
	PGUhCzgQ9As+U2oXDNGVAKFed/W+53z4wxpQYwBcC09H7frvFf57H27qo2IxAi3s5lnAUCJph/v
	ZAJvvGP4LMgLhzw
X-Received: by 2002:a17:903:2c04:b0:2ae:4fc2:d951 with SMTP id d9443c01a7336-2ae6aaae1e1mr27463395ad.27.1772638976926;
        Wed, 04 Mar 2026 07:42:56 -0800 (PST)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b36e1sm199354965ad.9.2026.03.04.07.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 07:42:56 -0800 (PST)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH v2] usb: core: remove unnecessary goto in usb_create_newid_files()
Date: Wed,  4 Mar 2026 07:42:16 -0800
Message-ID: <20260304154216.2750-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D5FAC203E97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33987-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[marusikadamenko@gmail.com,linux-usb@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The goto to 'exit' only returns the already initialized variable
'error', which would be 0. At that point it could not yet be anything
else. Replacing with an early return 0 removes the
need for the label entirely.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
v2: fix missing return statement at end of function
---
 drivers/usb/core/driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 2574e65bc640..752ff84a8dc1 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -186,7 +186,7 @@ static int usb_create_newid_files(struct usb_driver *usb_drv)
 	int error = 0;
 
 	if (usb_drv->no_dynamic_id)
-		goto exit;
+		return 0;
 
 	if (usb_drv->probe != NULL) {
 		error = driver_create_file(&usb_drv->driver,
@@ -199,7 +199,7 @@ static int usb_create_newid_files(struct usb_driver *usb_drv)
 						&driver_attr_new_id);
 		}
 	}
-exit:
+
 	return error;
 }
 
-- 
2.53.0


