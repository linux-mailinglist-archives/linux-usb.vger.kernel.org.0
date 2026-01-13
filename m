Return-Path: <linux-usb+bounces-32290-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F777D1A029
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 16:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D909F3040F06
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 15:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620193033FC;
	Tue, 13 Jan 2026 15:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CY1k08bi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CDD2DAFA8
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 15:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319278; cv=none; b=uD9SwnKn6tMFZ2t66nMCoWUBVzkJHFufKx1/8fvxZfrd3czHLcQ6eC0DJgn9//h8EMmjxKtzGe4Jlk2wSNQTB05GYh41oCU3KtjMkOrgaGg0ORy7vtl5l/46MvcbnxUY2749dSI7C613ost0Ptst8hCCT4GkiXnU40yBbRaG12A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319278; c=relaxed/simple;
	bh=JGR+5qZg2s+Oqti28ZbazP4lC2mg+1cUsJ7TerYpOjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PAhdGHUqjSfTIZxE8Xg++j8HFpsQ4l3GIOnoJZKlikN1+ff+8PE1Tk1Nsfp5q8ksXZRlDpR8sq9FpGonUybxvAxxCyM9g4ZAfzY2TPtwiXVWT5BL8apO60sXGx3R+rU4UtDxsHG6WecPPkKq22m/IM2ifOOxV6fm6qbJdIRTNDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CY1k08bi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a097cc08d5so18373465ad.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 07:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768319276; x=1768924076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLG7e56KLfl4STV1yAqf2cE5bA5JMQ4NSrfF5cK6YNo=;
        b=CY1k08biKogu1s5zKHTka3lwIpfTOAocNxhVZ30OGimvLE43EUtJSrftEw+M717BD8
         rxWaGrQ+OykSvPWhmtzyNc9Q2CuLZwiGvo2kb1owRfB173rdVjPhlK68xdXO/ypNka3S
         pNWxPDW3GsJuhuR0xTxeA14i1rXpmojIRiYOlEN3VEnFvLc7arl7PkWuOwkp3eDjtjTA
         klMwXJRJmxa4thgnZjg1l4b6U3KbFO+2gcCkNcdct+GeX65sKIpcZhai488ck00sMSer
         xpt/hDS4A5+95W/DDpa+s55P5eeMn4odpI5AFUysLU4MeFtpTNomK7RasGgnVYZ+ytdG
         29eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768319276; x=1768924076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLG7e56KLfl4STV1yAqf2cE5bA5JMQ4NSrfF5cK6YNo=;
        b=VH4H5v/9kj2uLfwoOn/g5xtzBAQjpzDWTp5Urv2YhJ5VKB6ScVXAEggp7X4wXnjec5
         xnQSla2s8//AwocIMwXVbeOb8YPtXptRox4BH8fM0UH9qVvFqPGdBKbDPApLb4KO22P7
         RMcxUdFR1n9yYEI3LNpt6ZAPuoyrutpS0XCL1AuxO26cXtDnmIhM5ozsN8t/mMKLHkaw
         IMxBtGXuVf76bHqmDDBEe8d0U6OgfNCnApAOmA5P2DhKyNDSyYbpXW+54ZoQoOJAmpo0
         N6QOfFUtjNgxIKuvETr1pUtLYF863lx1jq8VqDfZpksXLjQd0t6WMIYMKVIOQ1tSaU9G
         oJ4w==
X-Forwarded-Encrypted: i=1; AJvYcCU1AJr76KZRi96AlPg+1C1U0Mc49VMu2twlA18Wm30XAyvLqE6OLK4ewd5plxWjBFPZWMTjfVarlAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw069V8jaYYeqUhQyGuMqoRnVaaAouy0hVNRhxaYbtkVfILt3mD
	uxE51s5qTvROxURFDRt03iz+GXAy1W1MWMB/9OzzRj8dfBfszYm+ze1Z
X-Gm-Gg: AY/fxX6uXw/1dNGc+iXTyVeWfNtDk7KIPAqLOXkFxc0jrE4ahMkwQ6oHtGsBKDRAUJx
	K93EEE7KSHB01fDhH4wpL3tSUdUiMqkNoTlOsZuX1SS7trISVtzAHyr2gBkv2+eZPUlVbSwTdzM
	rAoSl9+t/FvYVhlkQ5CrqEoCprXlXa7yzLj5mEil3cKhsntNpPDH0zJstDOmu7SRny9Q62j390I
	PZejgtEXuB6xtwJ0eDH6O+jiqnwc6F5DZSXNEE8eniyqKuzJfCYzFSrTYDxENmsz2o/73vxcJ1Z
	+TC+qHS1A+fzGOlcwKbEGZpNj+Jz8uJz2xL4cQVd7KX2NC3orCbZcK3jTcEVKlqcVru+TRXS0Gh
	WiElTUN+wDHbYZovfDR2LdEtiL3HImPsLLvUGUXrReBwtjbTUn4Jx2KYuE8juFfUODLcJPUV2od
	YmZjHZCem7Tg==
X-Google-Smtp-Source: AGHT+IGkRjFEL6W2YjWNd0yft2/9hiWeqiW+eqseTZoOG4oidzGNAwJjkYPG/10sw7ofC5Xz3yUawg==
X-Received: by 2002:a05:6a20:c997:b0:35d:3476:d255 with SMTP id adf61e73a8af0-3898fa065a6mr14797074637.4.1768319275979;
        Tue, 13 Jan 2026 07:47:55 -0800 (PST)
Received: from MiniPC.. ([47.246.98.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f44a94e98sm5663498b3a.69.2026.01.13.07.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:47:55 -0800 (PST)
From: weipeng <coderlogicwei@gmail.com>
To: syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com,
	oneukum@suse.com
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
Date: Tue, 13 Jan 2026 23:47:48 +0800
Message-Id: <20260113154748.341096-1-coderlogicwei@gmail.com>
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

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index 57dfe5f1a7d9..30679c2b787b 100644
--- a/drivers/i2c/busses/i2c-tiny-usb.c
+++ b/drivers/i2c/busses/i2c-tiny-usb.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 /* include interfaces to usb layer */
 #include <linux/usb.h>
@@ -172,6 +173,9 @@ struct i2c_tiny_usb {
 	struct usb_device *usb_dev; /* the usb device for this device */
 	struct usb_interface *interface; /* the interface for this device */
 	struct i2c_adapter adapter; /* i2c related things */
+	bool disconnected; /* set to true on disconnect */
+	struct work_struct release_work; /* work struct to release the adapter */
+	struct mutex usb_lock; /* lock for usb operations */
 };
 
 static int usb_read(struct i2c_adapter *adapter, int cmd,
@@ -184,11 +188,20 @@ static int usb_read(struct i2c_adapter *adapter, int cmd,
 	if (!dmadata)
 		return -ENOMEM;
 
+	mutex_lock(&dev->usb_lock);
+	if (dev->disconnected) {
+		mutex_unlock(&dev->usb_lock);
+		kfree(dmadata);
+		return -ENODEV;
+	}
+
 	/* do control transfer */
 	ret = usb_control_msg(dev->usb_dev, usb_rcvctrlpipe(dev->usb_dev, 0),
 			       cmd, USB_TYPE_VENDOR | USB_RECIP_INTERFACE |
 			       USB_DIR_IN, value, index, dmadata, len, 2000);
 
+	mutex_unlock(&dev->usb_lock);
+
 	memcpy(data, dmadata, len);
 	kfree(dmadata);
 	return ret;
@@ -204,11 +217,20 @@ static int usb_write(struct i2c_adapter *adapter, int cmd,
 	if (!dmadata)
 		return -ENOMEM;
 
+	mutex_lock(&dev->usb_lock);
+	if (dev->disconnected) {
+		mutex_unlock(&dev->usb_lock);
+		kfree(dmadata);
+		return -ENODEV;
+	}
+
 	/* do control transfer */
 	ret = usb_control_msg(dev->usb_dev, usb_sndctrlpipe(dev->usb_dev, 0),
 			       cmd, USB_TYPE_VENDOR | USB_RECIP_INTERFACE,
 			       value, index, dmadata, len, 2000);
 
+	mutex_unlock(&dev->usb_lock);
+
 	kfree(dmadata);
 	return ret;
 }
@@ -219,6 +241,15 @@ static void i2c_tiny_usb_free(struct i2c_tiny_usb *dev)
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
@@ -239,6 +270,7 @@ static int i2c_tiny_usb_probe(struct usb_interface *interface,
 
 	dev->usb_dev = usb_get_dev(interface_to_usbdev(interface));
 	dev->interface = interface;
+	mutex_init(&dev->usb_lock);
 
 	/* save our data pointer in this interface device */
 	usb_set_intfdata(interface, dev);
@@ -268,6 +300,8 @@ static int i2c_tiny_usb_probe(struct usb_interface *interface,
 
 	dev->adapter.dev.parent = &dev->interface->dev;
 
+	INIT_WORK(&dev->release_work, i2c_tiny_usb_release);
+
 	/* and finally attach to i2c layer */
 	i2c_add_adapter(&dev->adapter);
 
@@ -287,9 +321,12 @@ static void i2c_tiny_usb_disconnect(struct usb_interface *interface)
 {
 	struct i2c_tiny_usb *dev = usb_get_intfdata(interface);
 
-	i2c_del_adapter(&dev->adapter);
+	mutex_lock(&dev->usb_lock);
 	usb_set_intfdata(interface, NULL);
-	i2c_tiny_usb_free(dev);
+	dev->disconnected = true;
+	mutex_unlock(&dev->usb_lock);
+
+	queue_work(system_long_wq, &dev->release_work);
 
 	dev_dbg(&interface->dev, "disconnected\n");
 }

