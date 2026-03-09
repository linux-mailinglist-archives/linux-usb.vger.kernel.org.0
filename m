Return-Path: <linux-usb+bounces-34302-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGJjMgi5rmlIIQIAu9opvQ
	(envelope-from <linux-usb+bounces-34302-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 13:11:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4385B2388A4
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 13:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 737B6303C83F
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 12:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D393B8BA7;
	Mon,  9 Mar 2026 12:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U1Um76OF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED933AE6EB
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057933; cv=none; b=Z3yRlgv8/LH0MVI/3qjIva5S/7gaa0zJQvfa6H1mjh75TXUW6OVIhikVY9teU9AIkFfKFwYV8C7DBqN56pfQIObi2prDT1DrAb3cArMQtZ+0Ey/RgFlw/6On7zS2YmMJytdIH+/J+cgrSaJrt+ORjtn56fDuSZ9Qt29EJKj+cO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057933; c=relaxed/simple;
	bh=GsIj0V/W8/cYPN0Hgl6XmEV91oEhDLD4KTWD5WDQI9o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pda7xzFL2p3yDMIS6VwaqNZ/DxZ4TG+YNUai3nhWngzceup4BJ0/gXxs+GPb+3GQ3DoB+JtFSChtpW1F1NAHikU/Ny9GuwqlGYuYTTdylfyjXO/NJWGPQWJ+jF3dhQsstFzIHEpAwyaPXXtvncQ+wGp/COIye/pHk0764OxWQFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U1Um76OF; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ae65d5cc57so312878465ad.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 05:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773057930; x=1773662730; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=914jXMIZuPaEXfT7vA7eUV/wOyKsEtHPgtfCXws0Nlk=;
        b=U1Um76OFyZgppGOCY/VGjLTGumCX9X3RwS4FE1I+XMR0zf6tjRIaVGRiX8FUie6ocF
         HFR3pETRq8hc+xjKGMC0NPhoKS1RDitWa2zIQwOKHzHGEuluT2ne/j0jF4rkyt0Z7VOP
         1GnhO6/wu+E94a4msEuhISH04v7uFCTzLz/tt5514Vl9rtqG0KimAFuyWgZCE4fRhpp3
         b2flPYqCGfCP0yam9uZYba6T2nutzOclOYLCgf6aBAhZuDF4EPZGOi6Gx4YhujQSrKAz
         EokiVQtxpMIbgIOaqRTlUCSfAylYJltxTo3FzSS5OM6XCerv5881gmCNEpwy+J6pnnie
         ueig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773057930; x=1773662730;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=914jXMIZuPaEXfT7vA7eUV/wOyKsEtHPgtfCXws0Nlk=;
        b=lsMB1ryACabtv/jFw/OE2o6qhAwI36McuI0+AqtgNXn3hG6CNNaJu4XYXZ8G0Okg+0
         NwPHWNKcEjqVmdA2ckp52eyaveBQQZOxTlJpvb2eBR6svdzCkQf+spgVq8h1zolXcWcv
         muKkUbtMdf+Oa8p92CAwV/RKFoqG9AUxodsA6W+hb0KUp1yegoiCnHvDcHhYxTLc9RlX
         dqFwRgJjjtatL5q5hZYP/nftNtSOlHXI7fODW3BKbAUAKHJMjzCgnuprLscaaO/HgVVL
         7q5GF+P8q74hT+qsmsx3QuI9WWQvvOA+d7qNtjUMlMtOWgSTYyay7tG7x82+C3ZOFyjs
         1VBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWslB0iSCgnnzvUgbOj4yQT49MxRQDmPjVsD40dkdQg4TMZvgYJ3BZx9LRsM7LeY289ctgkA4vcLRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBmleozwG/qWjZnqFlanVc9sjMkHD9bFoC9hng7xsXODK1OW3o
	Ctn+7AtgEEQHQ4rc3Ho7ggJiVg8ef56yaAgAtGPq5ByejkOYHNrNUWoz2+ee6glCZRuO6WC7zn4
	eUqXGLw==
X-Received: from plhs17.prod.google.com ([2002:a17:903:3211:b0:2ae:5628:a179])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3bac:b0:2ae:8081:c5a0
 with SMTP id d9443c01a7336-2ae8245e0afmr118496885ad.39.1773057929786; Mon, 09
 Mar 2026 05:05:29 -0700 (PDT)
Date: Mon, 09 Mar 2026 20:04:52 +0800
In-Reply-To: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773057914; l=7722;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=GsIj0V/W8/cYPN0Hgl6XmEV91oEhDLD4KTWD5WDQI9o=; b=Tg/TDaqGuZtbKqIO9q5YE8/O1xrVFcNRF8sC7I/ibKuO/9MS/t9NKR01mAJBWXuLNchL+Foq8
 Edq0/YLe7N/CpwXZHXcksOmcjYdFxlcUTynR6mIF4mxVFZwo7MCENq5
X-Mailer: b4 0.14.3
Message-ID: <20260309-f-ncm-revert-v2-7-ea2afbc7d9b2@google.com>
Subject: [PATCH v2 7/7] usb: gadget: f_ncm: Fix net_device lifecycle with device_move
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Heidelberg <david@ixit.cz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Jon Hunter <jonathanh@nvidia.com>, LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@kernel.org
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 4385B2388A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34302-lists,linux-usb=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.920];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

The network device outlived its parent gadget device during
disconnection, resulting in dangling sysfs links and null pointer
dereference problems.

A prior attempt to solve this by removing SET_NETDEV_DEV entirely [1]
was reverted due to power management ordering concerns and a NO-CARRIER
regression.

A subsequent attempt to defer net_device allocation to bind [2] broke
1:1 mapping between function instance and network device, making it
impossible for configfs to report the resolved interface name. This
results in a regression where the DHCP server fails on pmOS.

Use device_move to reparent the net_device between the gadget device and
/sys/devices/virtual/ across bind/unbind cycles. This preserves the
network interface across USB reconnection, allowing the DHCP server to
retain their binding.

Introduce gether_attach_gadget()/gether_detach_gadget() helpers and use
__free(detach_gadget) macro to undo attachment on bind failure. The
bind_count ensures device_move executes only on the first bind.

[1] https://lore.kernel.org/lkml/f2a4f9847617a0929d62025748384092e5f35cce.camel@crapouillou.net/
[2] https://lore.kernel.org/linux-usb/795ea759-7eaf-4f78-81f4-01ffbf2d7961@ixit.cz/

Fixes: 40d133d7f542 ("usb: gadget: f_ncm: convert to new function interface with backward compatibility")
Cc: stable@kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/f_ncm.c   | 38 +++++++++++++++++++++++------------
 drivers/usb/gadget/function/u_ether.c | 22 ++++++++++++++++++++
 drivers/usb/gadget/function/u_ether.h | 26 ++++++++++++++++++++++++
 drivers/usb/gadget/function/u_ncm.h   |  2 +-
 4 files changed, 74 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 3d772c9beb91..a6fa5ed3d6cb 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1439,6 +1439,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	struct f_ncm_opts	*ncm_opts;
 
 	struct usb_os_desc_table	*os_desc_table __free(kfree) = NULL;
+	struct net_device		*net __free(detach_gadget) = NULL;
 	struct usb_request		*request __free(free_usb_request) = NULL;
 
 	if (!can_support_ecm(cdev->gadget))
@@ -1452,18 +1453,19 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 			return -ENOMEM;
 	}
 
-	mutex_lock(&ncm_opts->lock);
-	gether_set_gadget(ncm_opts->net, cdev->gadget);
-	if (!ncm_opts->bound) {
-		ncm_opts->net->mtu = (ncm_opts->max_segment_size - ETH_HLEN);
-		status = gether_register_netdev(ncm_opts->net);
-	}
-	mutex_unlock(&ncm_opts->lock);
-
-	if (status)
-		return status;
-
-	ncm_opts->bound = true;
+	scoped_guard(mutex, &ncm_opts->lock)
+		if (ncm_opts->bind_count == 0) {
+			if (!device_is_registered(&ncm_opts->net->dev)) {
+				ncm_opts->net->mtu = (ncm_opts->max_segment_size - ETH_HLEN);
+				gether_set_gadget(ncm_opts->net, cdev->gadget);
+				status = gether_register_netdev(ncm_opts->net);
+			} else
+				status = gether_attach_gadget(ncm_opts->net, cdev->gadget);
+
+			if (status)
+				return status;
+			net = ncm_opts->net;
+		}
 
 	ncm_string_defs[1].s = ncm->ethaddr;
 
@@ -1564,6 +1566,9 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	}
 	ncm->notify_req = no_free_ptr(request);
 
+	ncm_opts->bind_count++;
+	retain_and_null_ptr(net);
+
 	DBG(cdev, "CDC Network: IN/%s OUT/%s NOTIFY/%s\n",
 			ncm->port.in_ep->name, ncm->port.out_ep->name,
 			ncm->notify->name);
@@ -1655,7 +1660,7 @@ static void ncm_free_inst(struct usb_function_instance *f)
 	struct f_ncm_opts *opts;
 
 	opts = container_of(f, struct f_ncm_opts, func_inst);
-	if (opts->bound)
+	if (device_is_registered(&opts->net->dev))
 		gether_cleanup(netdev_priv(opts->net));
 	else
 		free_netdev(opts->net);
@@ -1718,9 +1723,12 @@ static void ncm_free(struct usb_function *f)
 static void ncm_unbind(struct usb_configuration *c, struct usb_function *f)
 {
 	struct f_ncm *ncm = func_to_ncm(f);
+	struct f_ncm_opts *ncm_opts;
 
 	DBG(c->cdev, "ncm unbind\n");
 
+	ncm_opts = container_of(f->fi, struct f_ncm_opts, func_inst);
+
 	hrtimer_cancel(&ncm->task_timer);
 
 	kfree(f->os_desc_table);
@@ -1736,6 +1744,10 @@ static void ncm_unbind(struct usb_configuration *c, struct usb_function *f)
 
 	kfree(ncm->notify_req->buf);
 	usb_ep_free_request(ncm->notify, ncm->notify_req);
+
+	ncm_opts->bind_count--;
+	if (ncm_opts->bind_count == 0)
+		gether_detach_gadget(ncm_opts->net);
 }
 
 static struct usb_function *ncm_alloc(struct usb_function_instance *fi)
diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index c47965d850d4..1a9e7c495e2e 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -897,6 +897,28 @@ void gether_set_gadget(struct net_device *net, struct usb_gadget *g)
 }
 EXPORT_SYMBOL_GPL(gether_set_gadget);
 
+int gether_attach_gadget(struct net_device *net, struct usb_gadget *g)
+{
+	int ret;
+
+	ret = device_move(&net->dev, &g->dev, DPM_ORDER_DEV_AFTER_PARENT);
+	if (ret)
+		return ret;
+
+	gether_set_gadget(net, g);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gether_attach_gadget);
+
+void gether_detach_gadget(struct net_device *net)
+{
+	struct eth_dev *dev = netdev_priv(net);
+
+	device_move(&net->dev, NULL, DPM_ORDER_NONE);
+	dev->gadget = NULL;
+}
+EXPORT_SYMBOL_GPL(gether_detach_gadget);
+
 int gether_set_dev_addr(struct net_device *net, const char *dev_addr)
 {
 	struct eth_dev *dev;
diff --git a/drivers/usb/gadget/function/u_ether.h b/drivers/usb/gadget/function/u_ether.h
index 34be220cef77..c85a1cf3c115 100644
--- a/drivers/usb/gadget/function/u_ether.h
+++ b/drivers/usb/gadget/function/u_ether.h
@@ -150,6 +150,32 @@ static inline struct net_device *gether_setup_default(void)
  */
 void gether_set_gadget(struct net_device *net, struct usb_gadget *g);
 
+/**
+ * gether_attach_gadget - Reparent net_device to the gadget device.
+ * @net: The network device to reparent.
+ * @g: The target USB gadget device to parent to.
+ *
+ * This function moves the network device to be a child of the USB gadget
+ * device in the device hierarchy. This is typically done when the function
+ * is bound to a configuration.
+ *
+ * Returns 0 on success, or a negative error code on failure.
+ */
+int gether_attach_gadget(struct net_device *net, struct usb_gadget *g);
+
+/**
+ * gether_detach_gadget - Detach net_device from its gadget parent.
+ * @net: The network device to detach.
+ *
+ * This function moves the network device to be a child of the virtual
+ * devices parent, effectively detaching it from the USB gadget device
+ * hierarchy. This is typically done when the function is unbound
+ * from a configuration but the instance is not yet freed.
+ */
+void gether_detach_gadget(struct net_device *net);
+
+DEFINE_FREE(detach_gadget, struct net_device *, if (_T) gether_detach_gadget(_T))
+
 /**
  * gether_set_dev_addr - initialize an ethernet-over-usb link with eth address
  * @net: device representing this link
diff --git a/drivers/usb/gadget/function/u_ncm.h b/drivers/usb/gadget/function/u_ncm.h
index 49ec095cdb4b..b1f3db8b68c1 100644
--- a/drivers/usb/gadget/function/u_ncm.h
+++ b/drivers/usb/gadget/function/u_ncm.h
@@ -18,7 +18,7 @@
 struct f_ncm_opts {
 	struct usb_function_instance	func_inst;
 	struct net_device		*net;
-	bool				bound;
+	int				bind_count;
 
 	struct config_group		*ncm_interf_group;
 	struct usb_os_desc		ncm_os_desc;

-- 
2.53.0.473.g4a7958ca14-goog


