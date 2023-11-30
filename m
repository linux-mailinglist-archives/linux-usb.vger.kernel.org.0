Return-Path: <linux-usb+bounces-3529-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E34F37FFFAD
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 00:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12A071C20EA3
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 23:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E243B5955E;
	Thu, 30 Nov 2023 23:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PcsNdaMk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E2D1704
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 15:44:36 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6cdd13c586fso1449586b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 15:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701387875; x=1701992675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLd4D6mSQG/joWbwU/b54aJUKA2FESFs2G7TafIy+Is=;
        b=PcsNdaMkVWR6Sez2xUDyEatVn3eH0riySSyk/DD9rDF23Q7W6qI5ffyiW8WymH4jT9
         PQc/ZkLmIMVfVfQGs7kih+X5lu61cSD5AHjAtoNZtb/NCOr/MDiOlyNsOEGHkqaNKgqY
         ZDWL1Tu1+u5pMtKjxk8GKwsJ184TqltUH0CWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701387875; x=1701992675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLd4D6mSQG/joWbwU/b54aJUKA2FESFs2G7TafIy+Is=;
        b=a7HV3uGP2EppjBGHYtXYM2zpJ7SMmwKA1ozX2vvAPBmLl4HCswh5dpziIcrYw5p5Qs
         OubMlRpprMY4HSVLOKz6GyKC7wam93yXL6YQNvJSuXVr3i/oW5F6AuYI20tk2lj9nWD2
         obKrwe9DwJaEcdZdKZm3+cbg16+lkrAGlJ08Vp+lAnQJJ6vTvGuZT94ZFzH9/m4CPdGt
         z+94TI7eFCHPGw+sEYGQXZPY+rlGpRwNOCZgw4u/0sQ7b51W1yCTj2JRkkwRcDadVEsu
         /jECznL4NS0VFPbbAzeQOhu2BH+X6uijvfZemrFp4V6gjN97Wt4KLwFL1PWaxWXE+iUB
         J7/w==
X-Gm-Message-State: AOJu0YzaUGLPZhXkD9Xj+B48IXyKDa+huG+xwp6O/gMJMV6mExJvzSOo
	ZAf7BFChdfvaTziOjeW2bvkB4r8ErIZ1IdoW4rk=
X-Google-Smtp-Source: AGHT+IF0n3Rck8JGMEe3DIUCNOxgLiieLlqRMlI0w2eWxG/jaCq8ZZLjK2DDCZjkCpsFpWkaJwa0LA==
X-Received: by 2002:a05:6a20:daaa:b0:187:c662:9b7e with SMTP id iy42-20020a056a20daaa00b00187c6629b7emr24192616pzb.25.1701387875141;
        Thu, 30 Nov 2023 15:44:35 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:11eb:92ac:94e:c791])
        by smtp.gmail.com with ESMTPSA id b24-20020aa78718000000b0068fece22469sm1756401pfo.4.2023.11.30.15.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 15:44:34 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Simon Horman <horms@kernel.org>,
	Grant Grundler <grundler@chromium.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Hayes Wang <hayeswang@realtek.com>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Brian Geffon <bgeffon@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Bastien Nocera <hadess@hadess.net>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Flavio Suligoi <f.suligoi@asem.it>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	=?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Roy Luo <royluo@google.com>,
	Stanley Chang <stanley_chang@realtek.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: core: Save the config when a device is deauthorized+authorized
Date: Thu, 30 Nov 2023 15:43:47 -0800
Message-ID: <20231130154337.1.Ie00e07f07f87149c9ce0b27ae4e26991d307e14b@changeid>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, when a USB device is deauthorized (by writing 0 to the
"authorized" field in sysfs) and then reauthorized (by writing a 1) it
loses any configuration it might have had. This is because
usb_deauthorize_device() calls:
  usb_set_configuration(usb_dev, -1);
...and then usb_authorize_device() calls:
  usb_choose_configuration(udev);
...to choose the "best" configuration.

This generally works OK and it looks like the above design was chosen
on purpose. In commit 93993a0a3e52 ("usb: introduce
usb_authorize/deauthorize()") we can see some discussion about keeping
the old config but it was decided not to bother since we can't save it
for wireless USB anyway. It can be noted that as of commit
1e4c574225cc ("USB: Remove remnants of Wireless USB and UWB") wireless
USB is removed anyway, so there's really not a good reason not to keep
the old config.

Unfortunately, throwing away the old config breaks when something has
decided to choose a config other than the normal "best" config.
Specifically, it can be noted that as of commit ec51fbd1b8a2 ("r8152:
add USB device driver for config selection") that the r8152 driver
subclasses the generic USB driver and selects a config other than the
one that would have been selected by usb_choose_configuration(). This
logic isn't re-run after a deauthorize + authorize and results in the
r8152 driver not being re-bound.

Let's change things to save the old config when we deauthorize and
then restore it when we re-authorize. We'll disable this logic for
wireless USB where we re-fetch the descriptor after authorization.

Fixes: ec51fbd1b8a2 ("r8152: add USB device driver for config selection")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Although this seems to work for me and doesn't seem too terrible, I
could certainly imagine that USB folks might want something different
in terms of style or general approach. If there's some other way we
should be tackling this problem then please yell. I guess worst case
we could also revert the r8152 changes to subclass the generic USB
driver until this problem is solved, though that doesn't seem
wonderful.

 drivers/usb/core/hub.c     | 19 ++++++++++++++++---
 drivers/usb/core/message.c |  2 ++
 include/linux/usb.h        |  3 +++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index b4584a0cd484..4afbbfa279ae 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2653,12 +2653,20 @@ int usb_new_device(struct usb_device *udev)
  */
 int usb_deauthorize_device(struct usb_device *usb_dev)
 {
+	int old_configuration;
+
 	usb_lock_device(usb_dev);
 	if (usb_dev->authorized == 0)
 		goto out_unauthorized;
 
+	/*
+	 * Keep the `saved_configuration` in a local since
+	 * usb_set_configuration() will clobber it.
+	 */
+	old_configuration = usb_dev->saved_configuration;
 	usb_dev->authorized = 0;
 	usb_set_configuration(usb_dev, -1);
+	usb_dev->saved_configuration = old_configuration;
 
 out_unauthorized:
 	usb_unlock_device(usb_dev);
@@ -2685,7 +2693,10 @@ int usb_authorize_device(struct usb_device *usb_dev)
 	/* Choose and set the configuration.  This registers the interfaces
 	 * with the driver core and lets interface drivers bind to them.
 	 */
-	c = usb_choose_configuration(usb_dev);
+	if (usb_dev->saved_configuration != -1)
+		c = usb_dev->saved_configuration;
+	else
+		c = usb_choose_configuration(usb_dev);
 	if (c >= 0) {
 		result = usb_set_configuration(usb_dev, c);
 		if (result) {
@@ -5077,10 +5088,12 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 					retval);
 		goto fail;
 	}
-	if (initial)
+	if (initial) {
 		udev->descriptor = *descr;
-	else
+		udev->saved_configuration = -1;
+	} else {
 		*dev_descr = *descr;
+	}
 	kfree(descr);
 
 	/*
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 077dfe48d01c..015522068300 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1998,6 +1998,8 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 	struct usb_hcd *hcd = bus_to_hcd(dev->bus);
 	int n, nintf;
 
+	dev->saved_configuration = configuration;
+
 	if (dev->authorized == 0 || configuration == -1)
 		configuration = 0;
 	else {
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 8c61643acd49..6b989b8b2f01 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -644,6 +644,7 @@ struct usb3_lpm_parameters {
  *	parent->hub_delay + wHubDelay + tTPTransmissionDelay (40ns)
  *	Will be used as wValue for SetIsochDelay requests.
  * @use_generic_driver: ask driver core to reprobe using the generic driver.
+ * @saved_configuration: The last value passed to usb_set_configuration().
  *
  * Notes:
  * Usbcore drivers should not set usbdev->state directly.  Instead use
@@ -729,6 +730,8 @@ struct usb_device {
 
 	u16 hub_delay;
 	unsigned use_generic_driver:1;
+
+	int saved_configuration;
 };
 
 #define to_usb_device(__dev)	container_of_const(__dev, struct usb_device, dev)
-- 
2.43.0.rc2.451.g8631bc7472-goog


