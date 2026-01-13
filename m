Return-Path: <linux-usb+bounces-32287-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C380D19FE4
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 16:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF51B300ACBD
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 15:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531972F0C49;
	Tue, 13 Jan 2026 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evzxsrmn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7759284662
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319139; cv=none; b=ILI5ysQuLGnpD4kAj3hH3RosyHRgwdLPvVDQe7Hc9s59BtBmP1yuRFjiQXWnqm3tTsh93UYKFPGVb4wVo0K6LlAMj8fdaTP3dUPcxfGz3SUuIgUQYwdPi0A9wxuvPUe5tBXK5cQ55AzhwW+GWQnPfgcSR/zx9GWbpae741aTyjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319139; c=relaxed/simple;
	bh=D9PRvkQEi5Bp3++vqpF69BAhukTBFrQ8QSN+8+DZPTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eVm8dfKBmaGR+GwSwdIOYTYLaxzl1uGxNXnmH5PJabPSdV4cSemr3vQhUa0NbvEM0rFrPXajxu5yo3N41yCMTYHKk1mveuhnITGw+T4jSRGxlXrBhWWkFMnBGW+1a/NW8PK5acT8qMHSa1iGhHl6o9LTXZnOyuHkWArr9PR3Xng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evzxsrmn; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-81f42cd476eso53937b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 07:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768319138; x=1768923938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdmWkJcsUG3zFFjgivspba9pSs2wUGX2+C5PNS6MDQo=;
        b=evzxsrmnj3W6cAE2fNss/Dcprqojj5MWfpnF4BAVpCp4kE0MLDWh30QCWnd7Zl+R/o
         Yz0Dbf+fODLreNi7ExxRb6AACT4F5HiIufOU2O0ufm6N1G1jGONjnDZXSG5DYrbS/awh
         hyvTlGSpJ7/qbwUW7qN8xTQKcG6vo/alVZXphHj3Z6RDwkFq1J0NL+m8R+Kpyai9Vg+l
         uOx7mNJ7IFo+VRkqZD5LOiITLmOXwV8rkIrf9uJ7zT56JeJp7i1eXi6dX5kiuo8Zx5+5
         Ncop14cBN/HuygWm0TbYSmVDG5hbzej+1ZQx5JDgeLoxKUpIHCLVz9lvKGZruTbStE8O
         3xCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768319138; x=1768923938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LdmWkJcsUG3zFFjgivspba9pSs2wUGX2+C5PNS6MDQo=;
        b=PKmzbuTw/rL8rSY3mJcAR4u9SkEDfpOzq3bbjrpy92/hKS3ATV2xrnH+U5y3aE6wnE
         uuikUBcJxPsMoV0lWv9JC7EkjQv0N885Vl/ism+e1ibw2l12A0XoTwaA79tJaZOm/tvT
         RcgcjASJ3Jp1E0ajmeq5/w8VrlGUGrEy3q8OEpuhulYurUVGYK/XikbjtZLxUv2GmlE5
         lLctUrEfmEQKR931om0uDvHw06U0pBVezq4R4cSeqEh5MbHMjYlk61vXqSqX47vqGbJg
         ijVhgNlCE7YYH1P6o8MV4IzdVZRuQfhXQNIgDD+4zDmVCIcmBmsb3e+9VBwZZbuTJiD9
         0Qug==
X-Forwarded-Encrypted: i=1; AJvYcCXUF/Zc0FKXsEtxwOPf14KFOyI5khBvKBErmKUgf0qHfPmOLvH9dOcI9yhC8CFVlbnNzTRhEqURjWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrCqRe/11q+J/1mSgd/tpcj5kvQ3YW4doGV9atTQBrupKA9mdF
	AhwsBhJFb2aH4Qyr3jnLvjyi5jTdlybROCdoleGY45VEw4mHXJjzUJdl
X-Gm-Gg: AY/fxX5PZVrL9xGAxycYBdd3qJZR6ogPSy2BVdvtgrkSL45h4COpHaS9MzamAEU2DlA
	zmpw8nSB3QBD2nJR7IZdicqVEvT/by1cS7qYSqtG+VwuCUY89BK94uAwQIwbfvMhTRetVxalNsT
	MNcqWASg7YAfUCGDyVvZD+0a2+WdZgmXIc+tCMZg5R7jWSyce+bzdlGS9vBO06/Aol1vYIERJN9
	Nj5mBz3l3nzrSJ6g7k3GsDV8gl8BkyEHo3sJ8GMo4fqeZshZWnk62o4Bf7Hy6BnDkeIxR/wYamU
	8YmaNV4ZBUuOj/30AWH+7SDoGVEUlHybZkAGI8RIjcV4zKvRlr01OGWw3llNEa3+v07HfWt+OXF
	m9BR7i0isy73AhwYpmiIvYDV2W9tg1et6HB6Fy5KCE4zobjv36YLZBWnYBQvI3KVKzsQ36Wc0i4
	KW/Dp0ko/rtw==
X-Google-Smtp-Source: AGHT+IEeWhKrJJVODITGTsrv7N57jSP2y4S8SL/DGWr8MPWIinUW0XtDOKbPcHJJYuM51fJRWzuXpQ==
X-Received: by 2002:a05:6a00:1acb:b0:81f:475a:d242 with SMTP id d2e1a72fcca58-81f475ad32bmr5716326b3a.4.1768319138019;
        Tue, 13 Jan 2026 07:45:38 -0800 (PST)
Received: from MiniPC.. ([47.246.98.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81d87955bb6sm13925481b3a.50.2026.01.13.07.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:45:37 -0800 (PST)
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
Date: Tue, 13 Jan 2026 23:45:30 +0800
Message-Id: <20260113154530.340123-1-coderlogicwei@gmail.com>
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

