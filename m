Return-Path: <linux-usb+bounces-34846-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLhOLmG2t2mMUgEAu9opvQ
	(envelope-from <linux-usb+bounces-34846-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 08:50:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD95295D13
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 08:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E14DF301982C
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C6234F48A;
	Mon, 16 Mar 2026 07:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MT56xu7y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A553934EEFD
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 07:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773647441; cv=none; b=JYfZQZVFVp7y4+12mLOCTkWGnOvxN7K1kCfGwPrkMuipplwsCMjxTFz5SkqdR2iwBAXYDuKXzXCMo/rxCrxW3NwIaLT9nW8RmF8es/5Qch8DsT52Bq0rl69UtdmiDv9vyAOObK0DFjo2L7Q+3cAJISI52xIZNpWkAf5KMY/yUd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773647441; c=relaxed/simple;
	bh=/RWe9PyCUXFRwSCWlayNd4QMbnC9+kpyi17Lalv4lm0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nhxvzxocMUakLKVXBA08WcFUDgfnYQNgoxLInlHbaHubZRTE6oV/wr7xLdifi94b8xzd0/MJvK13PwedKuhaRe7mGz5vYUljeBWKtU4GE2WA3bkheR/GA1YO/hLmaPwsAxMp5fLaX/dq0Ena4GvhznSaRSS2awbmOSrtihyYPSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MT56xu7y; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2aec6c572fbso347379815ad.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 00:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773647438; x=1774252238; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=70Y+37cssWLBM/QACErgvTZBS7seii+FSq2yCHS3MXI=;
        b=MT56xu7y1ycPe+nTwTGd2zeDEaYJaYAbLgUUI/0V0bZdZT7BMWCLIk5bRvolmQskNb
         63whBJLQ3s0BpAlfdjDccBts+dsbL8kUuYBULmeF9D5UfQomnCp0u6sKWbK18xTPfrPN
         lLOF960CgGXbFPxorzwkYjQ5dWU/2NL0uvbSmrSC6o36LHFZDwn762M8XgsgzloI6nmC
         7wMLSR6krcyE9dnsSJkeaaYiylSCGcehjCYMoK2CGEjtsTEqkGjN1yhsgqch8tkeoJEc
         T/Ck8Glvgjid9TuqWLhnKR8CqiPCs0C1q7SJ3+YtCblXhv+7nS6MpQ3CZ/R3LnKpT9u6
         BlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773647438; x=1774252238;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=70Y+37cssWLBM/QACErgvTZBS7seii+FSq2yCHS3MXI=;
        b=kAOjXhn9i05cXwiLey+KvJkC2nKhans2imFidckCTj82iulEPkJRbX1nQfVUvlv/tM
         ZhKd3d4R8Xc9DIlY6h/draQED1QiX63+Lj0DMRT2a7Q7tXhbYwTSXbOwgAN1zv9DKONc
         33I5+dGRbyhYUOhsOgdY6zZU+7VNpiDLh7Hg5+ULE10nOcRkFnUmj3apGTMkhjRmKsHo
         K2kJ6Kp2ZyldB7uOSv626lt+Fag1JU/vFLZ9DxWJ0GrqCiUD1b5hLd7a9yrZOXR3sxmC
         epg95/Heh97Dv4gIfkvrJD1m/KuX5cUSNSv7McUzYihL6GHoWnXcoFJzEjk5vAUwuvrZ
         ADjA==
X-Forwarded-Encrypted: i=1; AJvYcCVoaJVHI9jHiqxhr8EbGICYlJ0jhhHpEmBJOuOhimqbK8+5lD2KEj2VQfeyw5iJ2iZzZGUeuIEu9Ys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx21cXmgdL7aqHo1mVEv5XF+PQnfTm2F0GCLxUQFg1a6gYVaCYW
	1bfoLhjgdjsnn6BHqnFpsdmvOIBJoNEZ0VOKQW62pjLaXC8yiRoEpdQQ9VG5JEeTYiXs+aF/nkJ
	vvVsKbA==
X-Received: from plblh14.prod.google.com ([2002:a17:903:290e:b0:2ae:3b56:7c68])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:90f:b0:2ae:59d3:27f8
 with SMTP id d9443c01a7336-2aeca999738mr112643535ad.19.1773647437769; Mon, 16
 Mar 2026 00:50:37 -0700 (PDT)
Date: Mon, 16 Mar 2026 15:49:09 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPS1t2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mz3dSSDN280pwc3ZTUotQ0XQNjA5OkJAMTCyMzcyWgpgKgYGYF2MD o2NpaAIWD94hgAAAA
X-Change-Id: 20260316-eth-null-deref-0304bb048267
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773647436; l=2135;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=/RWe9PyCUXFRwSCWlayNd4QMbnC9+kpyi17Lalv4lm0=; b=TgvUJBTeQcaDr54lNumTEgp8wSLlfl1c9X6UN/k1ZUamWhUv2Q94uGWTtLUrpmRYWmAL3NAbc
 ba/BxZL7Q9zD97ejcNwbhb/hXgfH0+e6H2t1WQ4aGX70cyaCYZ4bZIv
X-Mailer: b4 0.14.3
Message-ID: <20260316-eth-null-deref-v1-1-07005f33be85@google.com>
Subject: [PATCH] usb: gadget: u_ether: Fix NULL pointer deref in eth_get_drvinfo
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Heidelberg <david@ixit.cz>, Val Packett <val@packett.cool>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34846-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:email]
X-Rspamd-Queue-Id: 3DD95295D13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit ec35c1969650 ("usb: gadget: f_ncm: Fix net_device lifecycle with
device_move") reparents the gadget device to /sys/devices/virtual during
unbind, clearing the gadget pointer. If the userspace tool queries on
the surviving interface during this detached window, this leads to a
NULL pointer dereference.

Unable to handle kernel NULL pointer dereference
Call trace:
 eth_get_drvinfo+0x50/0x90
 ethtool_get_drvinfo+0x5c/0x1f0
 __dev_ethtool+0xaec/0x1fe0
 dev_ethtool+0x134/0x2e0
 dev_ioctl+0x338/0x560

Add a NULL check for dev->gadget in eth_get_drvinfo(). When detached,
skip copying the fw_version and bus_info strings, which is natively
handled by ethtool_get_drvinfo for empty strings.

Suggested-by: Val Packett <val@packett.cool>
Reported-by: Val Packett <val@packett.cool>
Closes: https://lore.kernel.org/linux-usb/10890524-cf83-4a71-b879-93e2b2cc1fcc@packett.cool/
Fixes: ec35c1969650 ("usb: gadget: f_ncm: Fix net_device lifecycle with device_move")
Cc: stable@vger.kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/u_ether.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 1a9e7c495e2e..a653fae9c0cb 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -113,8 +113,10 @@ static void eth_get_drvinfo(struct net_device *net, struct ethtool_drvinfo *p)
 
 	strscpy(p->driver, "g_ether", sizeof(p->driver));
 	strscpy(p->version, UETH__VERSION, sizeof(p->version));
-	strscpy(p->fw_version, dev->gadget->name, sizeof(p->fw_version));
-	strscpy(p->bus_info, dev_name(&dev->gadget->dev), sizeof(p->bus_info));
+	if (dev->gadget) {
+		strscpy(p->fw_version, dev->gadget->name, sizeof(p->fw_version));
+		strscpy(p->bus_info, dev_name(&dev->gadget->dev), sizeof(p->bus_info));
+	}
 }
 
 /* REVISIT can also support:

---
base-commit: d0d9b1f4f5391e6a00cee81d73ed2e8f98446d5f
change-id: 20260316-eth-null-deref-0304bb048267

Best regards,
-- 
Kuen-Han Tsai <khtsai@google.com>


