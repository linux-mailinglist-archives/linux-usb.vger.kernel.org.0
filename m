Return-Path: <linux-usb+bounces-32223-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C918D171C3
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 08:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27BE7303F78C
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 07:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939C62F6907;
	Tue, 13 Jan 2026 07:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqcQIYiG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48C425FA29
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 07:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768290738; cv=none; b=JdDQfC4Jwt7WUtU4tWKfCuQCV8rgg4SGhQinyYObA2nxmccvICIX4mrvHQRo7HvKh9j6uM7D+A7GW57Xj4Fa60bVKz63o/VhyYaB4bBZopqd73FkcjADv9gr6ViCkWviEeQbcwK3CiWo7TQiU9jsdJStWZpAInvmL3W0YutjQPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768290738; c=relaxed/simple;
	bh=rfSFeLW1l2qOXFvyZFstDZAIN/AdAbCfWLqpWPOh8Tw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mg+VIGM3+Z3c3FCfbfXckp5AgtrIk8qCSYH54hPc+qb0eNViMHqxqD9YI6fOwpUydnI7pZVK4ftpMPsDKZW+5u8IozWs4Wd5rRhZRthC2C5VnAMRmLB52dyI/VZCgsgNRe4sIZMXON7Um3ptpg8QBQumj0RQfPO7AGhYBrpyPX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqcQIYiG; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f39693db5so112923b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 23:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768290736; x=1768895536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XL7nw+AjWcOxXBUyMipFA/qQ4YvkY5qgv8JFfOecQM=;
        b=RqcQIYiGtsYk+dnq0TJUBWhLZPOFSlgIa/pMzmupdIEQT5gnHtvJZcVJEt3mlQbjGq
         sOGUl5YxzvfteWfGz5BjyCRKzKfHTqJtUgicNCRh2q8tpFnqX2SF7qf4TXpQRt6QZUwn
         iAp/in4RDROC/vD6vwbygn7rKsHpBVZbwyip5mSaF+6fXnUkMJygmHU9JgOz8ZqHmMAn
         fvWBNZi094GEO3ampDgTlTE7oFaN2747LUETMXfqgG0WpPNeHOKnCQHf4I1PKB1D/Mc/
         4XQh4g6D/a17Mu0s3bCXFr8gRM+Meg8qZNeIfDmQmgy7G64Iq2xZo9zQu5eZ7wbBWgDW
         hX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768290736; x=1768895536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3XL7nw+AjWcOxXBUyMipFA/qQ4YvkY5qgv8JFfOecQM=;
        b=JdYGOQEhfouqTN2FjjnVfmpFvCGmDiWNa/0vidjXYajHLie3NY0JgeS5XkI3cqzGxj
         T6OC6dzFbTjIy0XMnEoJGk7gJ7DVlHuauXyCqalU3Bpu9p02+6zark1IHlNGlahIwU93
         spL0G8MQs6cnZfB+eKaq9pRssiDLvEWqGMPk6dF+Gda2kcnMbLxjecMMY9bp1as6Vvl0
         jZcBFG+4JgA698bhGbqxCifiKaJHEbfnUZGKHlWpg9+5l3/zgxBcv1Ond6lALkZ396PD
         pSuE4ExZdY7/5h4tj+rly3PIO80NUJpgfsaGXV/VbV2lWvnoq9pwG2nYJG7lGGL377Gm
         o08g==
X-Forwarded-Encrypted: i=1; AJvYcCVT35CPmYXUkn8N8tVM6RWd9WhqNGZHWs7oNcvvsHBOkcJcbb1hfO9HmsvUOy3MYrkjTPejP1Z0SLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YytmN6Px4dFhNttvVNXAIAOzopsvc1iEpiEuRPrvy37raTde+kb
	zpbdnq49tt+8/qqV1ukqfxnvdhB/H1bncskbBgr/KyCHCxK32nG9z4Lt
X-Gm-Gg: AY/fxX5BTvCqUS7U8LVTjcmRIuqZfQXn/FegIq6Fe/+IALutG+M1ZVoEhYpwIGV9/bN
	mMe/qR2TZknpAp2uG0uKNHUm7Oa3XGzmexaZEJu5s8p7YWGGFqrPtU/c3rzQXhYbXiEYWH2Wkqh
	YQJ9Yx7TjTIRIDuxZ4lPYkzjSzw4w7OF8RV948P5rElPKxg189aE6oO0n1a+DRt/ToklElHa0Bj
	U7ORverBTrTjxbpW36O7xw/SDpLjpGGFl1tiS07c51+oR67ANaDb5N0KZuxBQHpB8t3rPrsF4kX
	8lh26FJP3Z+c5LppYuhpxud+KTiiHqO+6K37WZ0hm7VUMvpcAeao4ygx+PNmtic+hsy9LkO/tij
	fX57LX0nXCSSv/naf57HRhQ+57NIxycUCsvEPKwVtGDde9uFy/mIAGSQIdker0lTOSLIVrs++9K
	b/DcM2Ywnnqg==
X-Google-Smtp-Source: AGHT+IH35g+NqTmCXLKJNUEJcr/XNrkpz6DQ6G75N4K8gW+MPFFR1JA2M+4aAiXQQ1kkMsLHXvLOBg==
X-Received: by 2002:a05:6a21:610e:b0:356:3b05:2955 with SMTP id adf61e73a8af0-3898fa11537mr12962464637.6.1768290736125;
        Mon, 12 Jan 2026 23:52:16 -0800 (PST)
Received: from MiniPC.. ([47.246.98.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b77bsm19470214a12.33.2026.01.12.23.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 23:52:15 -0800 (PST)
From: weipeng <coderlogicwei@gmail.com>
To: syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
Date: Tue, 13 Jan 2026 15:52:10 +0800
Message-Id: <20260113075210.39425-1-coderlogicwei@gmail.com>
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

