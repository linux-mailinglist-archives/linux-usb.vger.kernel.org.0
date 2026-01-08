Return-Path: <linux-usb+bounces-32085-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56383D0664E
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 23:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E6C4301FB59
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 22:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1B02F3623;
	Thu,  8 Jan 2026 22:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNyChczY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ADB33987
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 22:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767909892; cv=none; b=pX08AwtTwlisph7dFXBK/Cn7A1tk5ClpnYQx5EBqpOCeluONDXKk0caD48QwiE2v87llqW7wwKE7y9rvY5wYP3CgSzlOxrsz/WdXP+C9sV3B+awLLStGXQ3A44iOSP3xmM4zcxaAycOabzye2gXf/r4islH5loN9LMiI746gNw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767909892; c=relaxed/simple;
	bh=3Bnsu2xk/pgfhbPa7ZSc0pf63vUMOoyr5T8o0jiqxVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MC/eLkiCC2LsCdCAOXIVQhjkd5HKldhcnbNFT2Z0261qXDkq3LqwOxatUgxppECZT8Key8esXZni1g8bNmIvToSjuH+BNI+sERqcDMR8mVbggmYrSd32pqDqE7IfylUCnvgvM3QaB2BDmY6BhSAP6PfzY5naQkmtCqlCc6uHAOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNyChczY; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b7c2614f7so526637e87.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 14:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767909889; x=1768514689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i4SOpVDh+Phteqi9qJadqJv3sDWqchvj94qqNw5gMxI=;
        b=UNyChczY6HcxUcgBUoeGCRElz5pv4TBm0oB49mhhvIqsWLl4UUYVzxOwOYFuFgFrVP
         Gdhv+G2vKxwdvoe+HyUlmCIiGemt64s2kKxM6+36Jf1LUfUlQTzoHu7+SSXxqvtuqfSd
         0rI+y12hibnQTqYKQBhEU+9UzC8GeT2rESn0sfTwRn2lBoR5HuU7PJrYOuAo/mr+GIX1
         /iSFsHD+tUQrMEJEgs0wS4HywK+SDbu4Vu1AT5V7uza79STSwxiac5RfPD0g8/YTnLYv
         DwJK/FCjA0ZnHE6WQZJxsmZhYlSIjIbxqnB8ML+GElFrW80xAw67SAntGuFASW615NUj
         JI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767909889; x=1768514689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4SOpVDh+Phteqi9qJadqJv3sDWqchvj94qqNw5gMxI=;
        b=WrBXlJG++MW614m1Rlcdtlud3JPoKRn7053bjaEqQ61+M6KClHOYbHTk7QgJ++woUg
         V2hhGjHtfiB4HRf6JHtTXMBN3jnlaxAFVqvw+89D8CQpdOLmNo3JDyRPg8rWEw/86ylP
         wTO4jsFd8s5cYh4gim1qagqoH0Z+KQd/fW0PqUPQBztQUcstYIskqYloEVvlEmilVwYO
         hyUp16ew9b9+83z20mYrwP1jVTnfcc7dXO4rOV4+n5HaTDY9Gr7EMTq2ast84Kc6Vghf
         yUZSYamYjKIPNfiRZcFOv6rt4sTFcvfw19WJkjkZdbKvqQkMZiq/9vtIibl+EHAmK8cM
         fLAQ==
X-Gm-Message-State: AOJu0YzV/sSszkCTSQWMXryomaX9vPvbOs3kph6dtywAj6AKIt4rLz1D
	dL7VXbJR5++msuY9c2Aq0nxa7nvl0Ny123luWQwMhz3Ff2imEeshsPA=
X-Gm-Gg: AY/fxX6OXPjAaWWl8qXJreNx3FZqtliVaTRL6lv7QN4Gnts2IzreHp1oQIXyRm8iG3E
	jI68Ds+PkS1+2TZgvx06awAsG8A+fIZdiznxUe562EZkL718cT2mY1gqwDBDk3Q3iKqziZsAW8i
	seWDEJyAxCZUovapqgwLQrQcTK3h4d/afujCyQRIm94rPXFwR0+/xILXwX9xBZN5SXMJ1J12xcu
	DmHwaVAqEpqK0mCpKIVnxVj3/1D9uaHuHPgYgZnfEyRIbbTXqKY9nPAb6tfuH2J+81dNCXaXStU
	bsmUYqDiJAENGF34k3MChM114iBnR0GKOtqxOulqTSgLRh+hLRlfSd5PvZcYrzDT7+gOw+w8Gt3
	F5aMC/hiIGvelNeg36K/oVxr3ucWhzNZfwRukJwBFlMfpa9A+71paCG2ssn0f7OyJUuB2krYz5Y
	XUzhG3KA7oeDp1
X-Google-Smtp-Source: AGHT+IEAZ1pqhe1enwna7K9yUTqow1DIRZxBT99FC1IJFj3acuKitelrzzMk0FCBxTjk87b9c9fnJw==
X-Received: by 2002:ac2:4281:0:b0:59b:7291:9cd9 with SMTP id 2adb3069b0e04-59b72919f66mr1568730e87.48.1767909888779;
        Thu, 08 Jan 2026 14:04:48 -0800 (PST)
Received: from DESKTOP-BKIPFGN ([45.43.86.16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b66697eaesm2323710e87.53.2026.01.08.14.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 14:04:47 -0800 (PST)
From: Kery Qi <qikeyu2017@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Kery Qi <qikeyu2017@gmail.com>
Subject: [PATCH] usb: core: hub: avoid NULL deref in usb_disconnect()
Date: Fri,  9 Jan 2026 06:04:37 +0800
Message-ID: <20260108220437.1930-1-qikeyu2017@gmail.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_disconnect() assumes that usb_hub_to_struct_hub(udev->parent)
always returns a valid struct usb_hub when udev->parent is set.
However, usb_hub_to_struct_hub() can return NULL if the parent hub
is already unconfigured/disconnected (e.g. actconfig == NULL or
maxchild == 0).

In that case, usb_disconnect() would dereference hub->ports[...]
and hub->child_usage_bits, causing a NULL pointer dereference and
kernel crash during device disconnect.

Guard the hub-specific port handling with a NULL check and only
touch port_dev links and the child_usage_bits/pm runtime reference
when a valid hub is present.
Fixes: 7027df36e418 ("usb: resume child device when port is powered on")

Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 drivers/usb/core/hub.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index be50d03034a9..444e04ea433e 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2348,19 +2348,21 @@ void usb_disconnect(struct usb_device **pdev)
 	if (udev->parent) {
 		port1 = udev->portnum;
 		hub = usb_hub_to_struct_hub(udev->parent);
-		port_dev = hub->ports[port1 - 1];
+		if (hub) {
+			port_dev = hub->ports[port1 - 1];
 
-		sysfs_remove_link(&udev->dev.kobj, "port");
-		sysfs_remove_link(&port_dev->dev.kobj, "device");
+			sysfs_remove_link(&udev->dev.kobj, "port");
+			sysfs_remove_link(&port_dev->dev.kobj, "device");
 
-		/*
-		 * As usb_port_runtime_resume() de-references udev, make
-		 * sure no resumes occur during removal
-		 */
-		if (!test_and_set_bit(port1, hub->child_usage_bits))
-			pm_runtime_get_sync(&port_dev->dev);
+			/*
+			 * As usb_port_runtime_resume() de-references udev, make
+			 * sure no resumes occur during removal
+			 */
+			if (!test_and_set_bit(port1, hub->child_usage_bits))
+				pm_runtime_get_sync(&port_dev->dev);
 
-		typec_deattach(port_dev->connector, &udev->dev);
+			typec_deattach(port_dev->connector, &udev->dev);
+		}
 	}
 
 	usb_remove_ep_devs(&udev->ep0);
@@ -2385,8 +2387,9 @@ void usb_disconnect(struct usb_device **pdev)
 	*pdev = NULL;
 	spin_unlock_irq(&device_state_lock);
 
-	if (port_dev && test_and_clear_bit(port1, hub->child_usage_bits))
-		pm_runtime_put(&port_dev->dev);
+	if (hub)
+		if (port_dev && test_and_clear_bit(port1, hub->child_usage_bits))
+			pm_runtime_put(&port_dev->dev);
 
 	hub_free_dev(udev);
 
-- 
2.34.1


