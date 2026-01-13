Return-Path: <linux-usb+bounces-32216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C82D16D4C
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 07:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0818C300F665
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 06:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AE1369208;
	Tue, 13 Jan 2026 06:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnVYc4KH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D4F31691A
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 06:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768285545; cv=none; b=uampgeQexN0WcvHZbCPgNbvqQtG7yEuOM/0bVLDdONDBLNAxHadOwDszmdwy9Ix09MxalZ0D+tasgIe+TX3N29jiO8A2yaZGjQk2M+28mgDrcNxBOd0StAyZM2iufVY0q0u9o1iTE3qjI6DMTw8RrSOsfcw3oV7v4i5Ql/uFq+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768285545; c=relaxed/simple;
	bh=VjDupaAQ+wzxEAB8mGzJ9IwSSNl1qlyOALCrKC5eg6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=os+ZP98DjtzxT3wiTVzZA7PBGzd30opMh1a8/aylCjMSbrPXwGXjPwG/iz374FmPG7vn8bzPb3PlHbdsiABPUIyGH/FXgCGF4KGrgsdD1bBCSs+2wDuGPskwYwJtuFp+HGJ43NP7d61O3dRTuPQjQCBa1njHBNKD4EE6a5KaU8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnVYc4KH; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a2bff5f774so22617335ad.2
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 22:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768285543; x=1768890343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxZQUYi23riXR8D/K/DCBmNlY17inKe4muUD5XAdLL0=;
        b=SnVYc4KHAaPrOkwouU0wQYxLO9+NF6DVxl4dfNHGa6OUembXEaapeLnS4MXG165+Ie
         SBhk3JlUr9E/J+L/mgn6mVtq9X0QXUrEnZIbH6FcQCM67UEFFlitMtmZ4Qvnfre4qnwM
         4SLNzxbft+Kwq64zgDNRTiggVx0n8Dge58fjPPaJo0AZNLGcgLv2eAxBpn762lH9329V
         Ju8CJFHjyCTism9ayIx+L4u9DqBwsbL7iQVGMvO/JnazCAvh520Yll2+LwxhPgD6Yfcv
         7I14GBI4vHt2xNVWjbDZN8cBV2MCci70NvCCdms74r1WcqoBeqFlcHwdrh1fvqI7PIFa
         xa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768285543; x=1768890343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uxZQUYi23riXR8D/K/DCBmNlY17inKe4muUD5XAdLL0=;
        b=igile54SRNp2K7LUne1ELEmaIi9DZHJXAQqqvh0PgeYs8mmSMjZOmuXSZTayNbEkA7
         YK+ujYzNIbpUm6s/K7QoVoLlWFCHzbtEB+jkowpeqWkIni5BGkO4LNlTL8gpMp2aXJCh
         t/u9BxFIzhIPws2q1wSpG9i7NxY3rejisKe4eaZ8b4pXtOHq4arLnBo5dczCcaf3qCrl
         YGepTEw2YF4JnIBx6+ZiC/Mw2FhMPkIMzdpFtxG1IgBpgZfXVDz33qCyyGXHKsu4KXK5
         WSbNF+iJUVKX9RXsIVur5rJtCpR+K2PTHMNlHIILR9ftaN75Thc5ISb1pZ/++S/LjCbx
         JtTA==
X-Forwarded-Encrypted: i=1; AJvYcCXlW+sl+EPSjsYlWvLLwB8ZTTVs/aUjO6BJqJ65T7V/jtqxNkFJKlvDypbD6hWCw6vUo5KHKIBqORE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7cG1Yo7zgj8GnUDmYb7tRyNAoiEAK5DXmcWzhgs8lZUGPlatf
	BYEUIOrXcxmlkf01nLFuNfMLvjc5mkBKrS4XLGhQ+4TJcy0pOmDOwM29nKQtRwquk0103g==
X-Gm-Gg: AY/fxX7sbwYwc8nYn0zLp8bPNu8ftw7gyMVGMfO4reBejdjf5GRlaPMWJH5NjNYFquU
	PwwXx1p2MVz6Ta0wQd97mMMs5u22BPv4RDIRUWn03CNQlJ1lKW/5HmfrRCA4KpuZCdMGG0wDJ7E
	kTnElQGdBM2Fnqgm/mt9aGQ7M0iKKB0L/kQOgxT7g0VCXCC18Jrja5t4+bAXs1BM5aeeAdbHbf/
	NzVEjNByOsPRsh9bsDe+XcAAt7OxB4uFFFJZteajiq6rX+UWAGU4080Ac1dGM2XMBAc175jjHTC
	a8pBDVlpcXA1KCxIP2/cAQFYmIEnXZ7sJhDmuwwHDPHnIh1UX68DuAk9jWhTTMJ/hraWept7mG3
	LsyoQeW4ThOaM5/HK3x0sBw1fMOG62wdIZFj6hKWU98iifwhJCCBQD5ldiegsoZKC+l1QXBw8KD
	n0WoSh9cZUqA==
X-Google-Smtp-Source: AGHT+IHGqE3Cj5daEtM7y07pGqV/M8cZPU7jgK0m2MYbTYsuWYIs0kK7N4lTacFI9yiEPdeW7SSCLw==
X-Received: by 2002:a17:902:ea01:b0:2a0:9424:7dc7 with SMTP id d9443c01a7336-2a3ee4917d2mr148398835ad.4.1768285543265;
        Mon, 12 Jan 2026 22:25:43 -0800 (PST)
Received: from MiniPC.. ([47.246.98.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm181777245ad.15.2026.01.12.22.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 22:25:42 -0800 (PST)
From: weipeng <coderlogicwei@gmail.com>
To: syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
Date: Tue, 13 Jan 2026 14:25:37 +0800
Message-Id: <20260113062537.4170377-1-coderlogicwei@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6963d09e.050a0220.eaf7.0070.GAE@google.com>
References: <6963d09e.050a0220.eaf7.0070.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mater

diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index 57dfe5f1a7d9..79b7c97514c9 100644
--- a/drivers/i2c/busses/i2c-tiny-usb.c
+++ b/drivers/i2c/busses/i2c-tiny-usb.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>

 /* include interfaces to usb layer */
 #include <linux/usb.h>
@@ -172,6 +173,8 @@ struct i2c_tiny_usb {
 	struct usb_device *usb_dev; /* the usb device for this device */
 	struct usb_interface *interface; /* the interface for this device */
 	struct i2c_adapter adapter; /* i2c related things */
+	bool disconnected; /* set to true on disconnect */
+	struct work_struct release_work; /* work struct to release the adapter */
 };

 static int usb_read(struct i2c_adapter *adapter, int cmd,
@@ -184,6 +187,11 @@ static int usb_read(struct i2c_adapter *adapter, int cmd,
 	if (!dmadata)
 		return -ENOMEM;

+	if (READ_ONCE(dev->disconnected)) {
+		kfree(dmadata);
+		return -ENODEV;
+	}
+
 	/* do control transfer */
 	ret = usb_control_msg(dev->usb_dev, usb_rcvctrlpipe(dev->usb_dev, 0),
 			       cmd, USB_TYPE_VENDOR | USB_RECIP_INTERFACE |
@@ -204,6 +212,11 @@ static int usb_write(struct i2c_adapter *adapter, int cmd,
 	if (!dmadata)
 		return -ENOMEM;

+	if (READ_ONCE(dev->disconnected)) {
+		kfree(dmadata);
+		return -ENODEV;
+	}
+
 	/* do control transfer */
 	ret = usb_control_msg(dev->usb_dev, usb_sndctrlpipe(dev->usb_dev, 0),
 			       cmd, USB_TYPE_VENDOR | USB_RECIP_INTERFACE,
@@ -219,6 +232,15 @@ static void i2c_tiny_usb_free(struct i2c_tiny_usb *dev)
 	kfree(dev);
 }

+static void i2c_tiny_usb_release(struct work_struct *work)
+{
+	struct i2c_tiny_usb *dev = container_of(work, struct i2c_tiny_usb,
+					       release_work);
+
+	i2c_del_adapter(&dev->adapter);
+	i2c_tiny_usb_free(dev);
+}
+
 static int i2c_tiny_usb_probe(struct usb_interface *interface,
 			      const struct usb_device_id *id)
 {
@@ -268,6 +290,8 @@ static int i2c_tiny_usb_probe(struct usb_interface *interface,

 	dev->adapter.dev.parent = &dev->interface->dev;

+	INIT_WORK(&dev->release_work, i2c_tiny_usb_release);
+
 	/* and finally attach to i2c layer */
 	i2c_add_adapter(&dev->adapter);

@@ -287,9 +311,9 @@ static void i2c_tiny_usb_disconnect(struct usb_interface *interface)
 {
 	struct i2c_tiny_usb *dev = usb_get_intfdata(interface);

-	i2c_del_adapter(&dev->adapter);
 	usb_set_intfdata(interface, NULL);
-	i2c_tiny_usb_free(dev);
+	WRITE_ONCE(dev->disconnected, true);
+	queue_work(system_long_wq, &dev->release_work);

 	dev_dbg(&interface->dev, "disconnected\n");
 }

