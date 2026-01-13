Return-Path: <linux-usb+bounces-32210-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE3D1668E
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 04:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE1B030123C1
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 03:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82738306490;
	Tue, 13 Jan 2026 03:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqIuvTD5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD42F2FCC04
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 03:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768273882; cv=none; b=l7kzYuA9AdmknfD4mufx2OJn2VYbTbL2DV3qsZv9Uzp3LEm7z5h42A1kuuA7cczzI7YoZuWPHeL/YTOG3fMbbjG3XsHmejjHJbA4CgXxKeigJ86zy8E0XJKZRZNTrKAUqpSacQwPCX5DCSYopjjzHNtpytFS7HK92HGPx6HXD7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768273882; c=relaxed/simple;
	bh=8mDJ92GgpN/evTKlvApwiXLDeP13ZxWxae6il6IcrZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FuVxBKTcshfZyPnWM6sV6bqmAKLipF2oc44z6LozOOmAvjyQyQ7x1U2atOFlnXfEVIeEhZsPRuuCUtt6P0sH41ezZScnjQ5um14N/UBIBZPOWaG//L1kw5VQ5H5ZwoSFidBnfn4BWXh370ZgYyKcb2AM88zc7jVkAKt9Q8NTxXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqIuvTD5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29f3018dfc3so18268895ad.0
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 19:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768273880; x=1768878680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIjXaJkCkmkRfBy/0TqKde0rSQ1H4oie1IgBxhUPMVI=;
        b=HqIuvTD5wLzytKxJMyAWZpV/9sx/E9Lkuvy//4yGWkSh9WYgpidxlQS6p0rTjmsUQf
         yXWMcKp+ZKswbpfklrP5JVrSz6wB7sAH+j3WdPAPjscDCFXK3gnB5vj6QPbHSkiidecm
         QlfC4J98FmXYp8ek1YGDR9ffx0gPXA9jcwK1384NqY1jq4W2fNo/O+Z2J7a635oBjrye
         zwIP3xLxoiO2GIzBA5+dMygqrtrcYC7BBXkHYSjhSGSpxQ5f7wSKVXymAM2Rmh5iZD0R
         JeEkX1kcGkvqjP53i5dA416yZzaCi0itmjsDR7rM0nAqU0AeGz2NZkECeEeXOQom1zCc
         y5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768273880; x=1768878680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oIjXaJkCkmkRfBy/0TqKde0rSQ1H4oie1IgBxhUPMVI=;
        b=BY05C+1+5uKSO4v2c1YPCN1ECJUYSV2azcPNgV9xwt1A8t++m0V7Xe3BRWbexDE9rd
         KIWSPcAISgxIBRpcmaSZHseHPErArSQxm9PrQt/kulMMFQs/mFdYXlNh9DfR7ZF5IFcQ
         Ly6mNAsI80MVgfS2GVtskLr9sf7x3cGRwhUCyPKFqOJSNmVJju05mL5vZT5hQk4eciVR
         MW92QaPt3Vvl74vae88CCXMJVh7sCoxg3OEbyP+4dsYnhlddCEuaZqo0q9CPqTiQXFfn
         lAdhg5WBQTba4yCJioVSUbt7RjN7fYs4GPMtmY5fv61LqW6wkBc7h4Olc/AA3OS2MlSr
         AbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Xfa6eNJ4866AKWPebONgc3XkP0wu6NfoPUxZEeNuxn28k3bqXVP388NGGtIIoC0CitzGXPgYtyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2YJIabOoE/57zD8/+ztVWAc0FxjzY+96vHbWJr1o0facpBuq4
	ae8AFj1XUMEzqbBri1PbWHTLY20rQI5AHPX2VBNpsoHu3uAhkogeRk75
X-Gm-Gg: AY/fxX7OVV+/IzISrDxm6ZhgTJHXl55H5i6rbMleGlMrYndVWgr3fKU+IDm0Hcg2YGF
	oewR5z5d+rGrb3qoJYRaiWo6x13VvK5FQvCiX+hRWvFM18R+TnwTUPgTAUcMZtKdxefup0oRzN0
	blyQQVLbuI1Sah1AXbnRd3GlWXuADliaspD3s4K91JRQ2zQnBD4Ka+Qqub95Nf7Cv4fNrDkPEcJ
	v0j4dKf1tnl56uv7pUne/ATxu5TKVezfQIVk4ju6EvPwvKMH/UmL8WG2kcB/cCcDGKpJPfRxGnW
	hNjRnmy5nCQftHmIJIyNgX38OkRCckqflCprR7buONbRhkFYtVewP0IJGLd9oyubGJZxTj6TcUl
	+iHzkT4GeWJAwEGjp/0IeY0SHNmALNtQ7kCKSxK/mBa0I8WVsAHmcHoEQ3sr5aB4V39TwB85Y96
	tjJ/0sxwO6Qzd7MLh7KT1M
X-Google-Smtp-Source: AGHT+IEqS4AbOSxnmYh3TjxkquIfOjWZx1435RJ3A5F1JuKlbtfB304zSWmm+STBlOPrMttJrQM4YA==
X-Received: by 2002:a05:6a20:3d95:b0:35f:aa1b:bbfc with SMTP id adf61e73a8af0-3898f8823eemr13531932637.2.1768273880073;
        Mon, 12 Jan 2026 19:11:20 -0800 (PST)
Received: from MiniPC.. ([47.246.98.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29592sm18361498a12.22.2026.01.12.19.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 19:11:19 -0800 (PST)
From: weipeng <coderlogicwei@gmail.com>
To: syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
Date: Tue, 13 Jan 2026 11:11:14 +0800
Message-Id: <20260113031114.4030649-1-coderlogicwei@gmail.com>
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

#syz test
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

