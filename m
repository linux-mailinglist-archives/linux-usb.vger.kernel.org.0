Return-Path: <linux-usb+bounces-35761-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFlYDsSJzGlXTgYAu9opvQ
	(envelope-from <linux-usb+bounces-35761-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 04:58:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9744F374132
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 04:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46B1430931B3
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 02:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C119C36493C;
	Wed,  1 Apr 2026 02:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nriXyjdO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9EB35E95A
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 02:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775011921; cv=none; b=pYi+dfYqbd8xUpwQNPo2J/+4JbTlHoOott+o3fEY3Mdh5XzbC/1wTfy0yphSejSBFAZj4ACYkYGPtcC98a3ujWMIBiHK5HGokX3kq4C/MCAhjlbtoBVzJNVp6YrxB5nZDSUrPSRgXaS9ZO3ob6fVCU0GmG6Dn1w07MvqJAubj2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775011921; c=relaxed/simple;
	bh=WY3AvRAFc36q+7OWxrfFT7SCSKFS1B6X3GV2ZaPSSvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3DIAnVpMzB/CHH/+SLZnUY2c2FWrLPvYkH6CH247AWw/squTlPbiF93JJlugk4Zp+BQXb+4PWKBloM4IiMVjqFt1hpql8ycXb6yi5pp907N7KWYvjm6sN0ztr3e6w/CzNqzWufDJgSNKo5wT3wqHvmLJvRuLzNISgyTLZAWH8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nriXyjdO; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b0c8362d93so37915335ad.3
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 19:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775011913; x=1775616713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAIzS9E7I8NyNd6SbCw+mU0sPZ4qTkkgpCBayASvU8Y=;
        b=nriXyjdOyxilMVnvirnMMvCkApwFsFZ+HaKJ1G6FTSxZtzCizBWS0ql/PCmrxspqFc
         GcV3QfsYAk0Xh9e/0YlQ8aQ5QD1aX9jU66WX/mJTSoE5B4aihmOASVDWM6P1Dy4dhnH4
         zJPgdY0v0aL9PZqkxMpogTjXWkcrwa2N8Fru1mUfCeppITYRuHqlcgTehp9B/ECP0zyQ
         dC3bNXfng/5URt9dVgcszDDQ0MI/Skp4KUZBDLUzztCl+0Jp4f22wdeYpmGiqlIJPYon
         6dyg3AlA/sly+Dz8bjruChM0WtDZfVl9d9zrYS0j56TwK+VND9+8RFyPTB5P7Lzq218h
         +vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775011913; x=1775616713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAIzS9E7I8NyNd6SbCw+mU0sPZ4qTkkgpCBayASvU8Y=;
        b=q7STGJkTH5uw7qA3BR34Yoj1O6udGmwI3DpsUnlSDmy60WeonBRgLAuyNLLMxRJA+Q
         EfLg5ZsJXcuXRzLZbnE8jGYeeJlNE2sjZ9q4yqceWIqOXklVcUQ8AENY6seHaF1QEYst
         +kHmlolkfnDdpSgzpM3afBZokMeQxp6+Jb4dbniGz7La/KMUt8ZkrvI2c6ps1hMnrZ4P
         VG3Gri5Ft8xn4TGf34Jtwqka6Ts51Myoakp0NZA6BbE/Urqv/7e5LArxNzjgSZH/CoqN
         Dbct/12yZ0Yon3IC7eVAeLgu5aVbzoEQ8NfHHLlIlkBFbscUgh5Lp/r3YTy/2Uq6aq5K
         /jJw==
X-Forwarded-Encrypted: i=1; AJvYcCW0ZW0vpIUr5cbZ6I9KmUpOvDDY7gvWOLiF6bd8sw44v/X37rNaxCUwMVViIWIwHMileleGWwAxLxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEC+wLETvD3B79W9VmSBdgG253nyLj3qEvD7Wx3G8S4EDPryh0
	W1rEJpFV8mbqAiRkEgoCSqGsDFK8Yj8Q9qbYfqpF5REq0I3FJfTt85LeOvPqgRsu5zs=
X-Gm-Gg: ATEYQzzH05EIA26GHLPzGGfIl5/t6kM0LRZ4u4fLjuu3Y52K0wmvS7WvRsGbAjtZsWd
	kSttY1WYqXS2xGqpWzPw9RuMjdlQDkxGNov7nXNjFfffQU7VCEIvWiiO3n2Ehtz8SIWoMn5X90j
	4RuqUGwD+1hpfZgMEWo31C4JOC/esZBlFKzSiGPFcavOupAtFp59SX5ilKJe/CGKsEtI9Zo7Qs0
	lyDfRTODS8Fodg/w64lMNIgYWflHQP3UhnjyAL4DIRtalZ3yZkNZBbwj3EsswvZrmMdcvQDp8+G
	Zl2muK7+AjY+tIIbdFtyu/TO+t89JHwlekbUKGoAqmzwADjCpazUG26AC4QaKB2Perjv5Mz140T
	2015KYNQUb6f1iekPg64FOljRkNW/n3j176EeZL4UXNudPD4VKXdM9zaR2hKVF4DWyO9/2nshrK
	vArVVVHlNAPzp62Q==
X-Received: by 2002:a17:903:2c04:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2b269ab37d4mr14882825ad.16.1775011912933;
        Tue, 31 Mar 2026 19:51:52 -0700 (PDT)
Received: from lgs.. ([101.32.189.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427660c7sm127730725ad.44.2026.03.31.19.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 19:51:52 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Cohen <david.a.cohen@linux.intel.com>,
	Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: ulpi: fix double free in ulpi_register_interface() error path
Date: Wed,  1 Apr 2026 10:51:42 +0800
Message-ID: <20260401025142.1398996-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35761-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9744F374132
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When device_register() fails, ulpi_register() calls put_device() on
ulpi->dev.

The device release callback ulpi_dev_release() drops the OF node
reference and frees ulpi, but the current error path in
ulpi_register_interface() then calls kfree(ulpi) again, causing a
double free.

Let put_device() handle the cleanup through ulpi_dev_release() and
avoid freeing ulpi again in ulpi_register_interface().

Fixes: 289fcff4bcdb1 ("usb: add bus type for USB ULPI")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/common/ulpi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/common/ulpi.c b/drivers/usb/common/ulpi.c
index 4a2ee447b213..d895cf6532a2 100644
--- a/drivers/usb/common/ulpi.c
+++ b/drivers/usb/common/ulpi.c
@@ -331,10 +331,9 @@ struct ulpi *ulpi_register_interface(struct device *dev,
 	ulpi->ops = ops;
 
 	ret = ulpi_register(dev, ulpi);
-	if (ret) {
-		kfree(ulpi);
+	if (ret)
 		return ERR_PTR(ret);
-	}
+
 
 	return ulpi;
 }
-- 
2.43.0


