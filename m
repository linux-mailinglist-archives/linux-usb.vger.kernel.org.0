Return-Path: <linux-usb+bounces-34299-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKuEBqK3rmnMIAIAu9opvQ
	(envelope-from <linux-usb+bounces-34299-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 13:05:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FC62386A7
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 13:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50745302EAA1
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 12:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CCC3A7846;
	Mon,  9 Mar 2026 12:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0my5u+6J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63243A4F2D
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 12:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057925; cv=none; b=Pt15Fp+i3bb381pYZVfpk4Pmwl7QMpWghI2Gu9gGweZ7ZHug9hTrpvwqVVf3x34NLceVc+983UKy86MjXXd8lwg9Vsjc1+So2pWrfVJT9Hwcj9bcY3w+HBDSYR/tg8QcBPpg+Q+hE6frjzXYW/XReiHP/nilgjUkRWp5Z7uhROg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057925; c=relaxed/simple;
	bh=vxQAtytnOe9iQTybVOTNQYrvkk5AYCsq3Yn5ZOWsFdM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ETwxbYFnxpCXsKDhrzgQpqS6ghpnM54pjgXzVlwQ91tCpo7vXJZvOepuw0nDjrgXxphgIU/1YIteqYhsI2W/8tAR/ay5I+lo5xGezFR1WIa/ZhuzdRjwlA4xvR8ng7VVUExqVsniSqX3m5yh+QpsbAGVCDCpHNrXQcuS6/HfxJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0my5u+6J; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ae48a21d12so58512335ad.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773057922; x=1773662722; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YtIMjWj8vbky6j7mb7WzKYLLu1mfMyKjlDVfZg0Jd9w=;
        b=0my5u+6J9N7svY308uQSfM4tOF+0dM0lh9MQxCFx1fBMumimD4GuI58x/Ck3GmXoQ2
         B0FiZPNABHL5Pu12ZXAwyLyG5wcotoaHqWUne5oAiBbp+tjqEJiJJoIH2Ch/Mmp43ew4
         v9m3bFJXUBnSFLVPOwqRfVnqEBEEnZSj0+MQmqIUuukuZP4yDPPcNauyHrQuxKuo/QoZ
         qIBICEwElshp9/+REmd+PVJG0f/f+4Pf3RZNHN5e7CW37GL8cIew3tk5upny1piWylLt
         d0QHj+sSsiDQVdpsXUE6Q0CHUCWnPVHGiKsfSbrdDNrSRzeAfVGIGUKQ2szEA49Fso4t
         j2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773057922; x=1773662722;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YtIMjWj8vbky6j7mb7WzKYLLu1mfMyKjlDVfZg0Jd9w=;
        b=wN7GA5Xk+VHdKj0xnTuOJ0zpFyr/R7ItnJP/m2ocyx79HzRWXt2roSmxmx+KWaWdNo
         p4DNzLVUDhxw/kgZoYyN+xs5WulDe6r7K09fzqZ1ov4hQiVCzUY/jQlwbq+0uTASaAgZ
         tdBpxe6xnhqTrEvc7TviA9AwHlDDeVOcEIaNXLnVFiCzXbtOTNbshQP/GBxJ3AqVHiDD
         AkXIbETuWk/TsWXxGXOcgHu2baOS3AsObWgihSBgVeRd2euOfUQdAMB7dS7BJvCzpG8W
         xTzHUtwib9/A0uKFQojWxUz9e3HJ4DIaLGEKpQWwJh2qTDwrqm1M7lwuFZabwPrpNaAQ
         TKbw==
X-Forwarded-Encrypted: i=1; AJvYcCWqQbp242Do/KurIagyeEEyMjZjaPC5YSZhE9nXZdL/gMyzSWI04mi4+J6hHp0EJNLQ+adVX/4hok0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3JSCbNEII0xDTKq4nnXf9glj9K+gaQ40gU+fnLGT1HDAtwSws
	h2n1BHW/bM51F9ZjNlA0z1bcdSw1bPh5pasgzncvx0IdsghyXr1NxhSAk0znlsC2JvJl9nwL5zP
	ewGwDCQ==
X-Received: from plbkk16.prod.google.com ([2002:a17:903:710:b0:2ae:635f:4b2b])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e790:b0:2ae:3afc:eb38
 with SMTP id d9443c01a7336-2ae8246be8cmr107239915ad.41.1773057921929; Mon, 09
 Mar 2026 05:05:21 -0700 (PDT)
Date: Mon, 09 Mar 2026 20:04:48 +0800
In-Reply-To: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773057914; l=11073;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=vxQAtytnOe9iQTybVOTNQYrvkk5AYCsq3Yn5ZOWsFdM=; b=prV7U7AyedqhnOSKcGSxBjutFmCb68hF81tZH4ecmhUK5uZmbXYcuueq6GxRybB1OEzdv0lLi
 xuicawNvqCOAcnPulkFbEHV0w6LbNnl0o0XDgmQtaXnLpnff+WFc2H6
X-Mailer: b4 0.14.3
Message-ID: <20260309-f-ncm-revert-v2-3-ea2afbc7d9b2@google.com>
Subject: [PATCH v2 3/7] Revert "usb: gadget: f_ncm: align net_device lifecycle
 with bind/unbind"
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Heidelberg <david@ixit.cz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Jon Hunter <jonathanh@nvidia.com>, LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@kernel.org
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 85FC62386A7
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
	TAGGED_FROM(0.00)[bounces-34299-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.928];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ixit.cz:email]
X-Rspamd-Action: no action

This reverts commit 56a512a9b4107079f68701e7d55da8507eb963d9.

This commit is being reverted as part of a series-wide revert.

By deferring the net_device allocation to the bind() phase, a single
function instance will spawn multiple network devices if it is symlinked
to multiple USB configurations.

This causes regressions for userspace tools (like the postmarketOS DHCP
daemon) that rely on reading the interface name (e.g., "usb0") from
configfs. Currently, configfs returns the template "usb%d", causing the
userspace network setup to fail.

Crucially, because this patch breaks the 1:1 mapping between the
function instance and the network device, this naming issue cannot
simply be patched. Configfs only exposes a single 'ifname' attribute per
instance, making it impossible to accurately report the actual interface
name when multiple underlying network devices can exist for that single
instance.

All configurations tied to the same function instance are meant to share
a single network device. Revert this change to restore the 1:1 mapping
by allocating the network device at the instance level (alloc_inst).

Reported-by: David Heidelberg <david@ixit.cz>
Closes: https://lore.kernel.org/linux-usb/70b558ea-a12e-4170-9b8e-c951131249af@ixit.cz/
Fixes: 56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle with bind/unbind")
Cc: stable@kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 128 ++++++++++++++++++------------------
 drivers/usb/gadget/function/u_ncm.h |   4 +-
 2 files changed, 66 insertions(+), 66 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 14fc7dce6f39..3d772c9beb91 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -83,11 +83,6 @@ static inline struct f_ncm *func_to_ncm(struct usb_function *f)
 	return container_of(f, struct f_ncm, port.func);
 }
 
-static inline struct f_ncm_opts *func_to_ncm_opts(struct usb_function *f)
-{
-	return container_of(f->fi, struct f_ncm_opts, func_inst);
-}
-
 /*-------------------------------------------------------------------------*/
 
 /*
@@ -864,7 +859,6 @@ static int ncm_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 static int ncm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 {
 	struct f_ncm		*ncm = func_to_ncm(f);
-	struct f_ncm_opts	*opts = func_to_ncm_opts(f);
 	struct usb_composite_dev *cdev = f->config->cdev;
 
 	/* Control interface has only altsetting 0 */
@@ -887,13 +881,12 @@ static int ncm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 		if (alt > 1)
 			goto fail;
 
-		scoped_guard(mutex, &opts->lock)
-			if (opts->net) {
-				DBG(cdev, "reset ncm\n");
-				opts->net = NULL;
-				gether_disconnect(&ncm->port);
-				ncm_reset_values(ncm);
-			}
+		if (ncm->netdev) {
+			DBG(cdev, "reset ncm\n");
+			ncm->netdev = NULL;
+			gether_disconnect(&ncm->port);
+			ncm_reset_values(ncm);
+		}
 
 		/*
 		 * CDC Network only sends data in non-default altsettings.
@@ -926,8 +919,7 @@ static int ncm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 			net = gether_connect(&ncm->port);
 			if (IS_ERR(net))
 				return PTR_ERR(net);
-			scoped_guard(mutex, &opts->lock)
-				opts->net = net;
+			ncm->netdev = net;
 		}
 
 		spin_lock(&ncm->lock);
@@ -1374,16 +1366,14 @@ static int ncm_unwrap_ntb(struct gether *port,
 static void ncm_disable(struct usb_function *f)
 {
 	struct f_ncm		*ncm = func_to_ncm(f);
-	struct f_ncm_opts	*opts = func_to_ncm_opts(f);
 	struct usb_composite_dev *cdev = f->config->cdev;
 
 	DBG(cdev, "ncm deactivated\n");
 
-	scoped_guard(mutex, &opts->lock)
-		if (opts->net) {
-			opts->net = NULL;
-			gether_disconnect(&ncm->port);
-		}
+	if (ncm->netdev) {
+		ncm->netdev = NULL;
+		gether_disconnect(&ncm->port);
+	}
 
 	if (ncm->notify->enabled) {
 		usb_ep_disable(ncm->notify);
@@ -1443,44 +1433,39 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 {
 	struct usb_composite_dev *cdev = c->cdev;
 	struct f_ncm		*ncm = func_to_ncm(f);
-	struct f_ncm_opts	*ncm_opts = func_to_ncm_opts(f);
 	struct usb_string	*us;
 	int			status = 0;
 	struct usb_ep		*ep;
+	struct f_ncm_opts	*ncm_opts;
 
 	struct usb_os_desc_table	*os_desc_table __free(kfree) = NULL;
-	struct net_device		*netdev __free(free_gether_netdev) = NULL;
 	struct usb_request		*request __free(free_usb_request) = NULL;
 
 	if (!can_support_ecm(cdev->gadget))
 		return -EINVAL;
 
+	ncm_opts = container_of(f->fi, struct f_ncm_opts, func_inst);
+
 	if (cdev->use_os_string) {
 		os_desc_table = kzalloc(sizeof(*os_desc_table), GFP_KERNEL);
 		if (!os_desc_table)
 			return -ENOMEM;
 	}
 
-	netdev = gether_setup_default();
-	if (IS_ERR(netdev))
-		return -ENOMEM;
-
-	scoped_guard(mutex, &ncm_opts->lock) {
-		gether_apply_opts(netdev, &ncm_opts->net_opts);
-		netdev->mtu = ncm_opts->max_segment_size - ETH_HLEN;
+	mutex_lock(&ncm_opts->lock);
+	gether_set_gadget(ncm_opts->net, cdev->gadget);
+	if (!ncm_opts->bound) {
+		ncm_opts->net->mtu = (ncm_opts->max_segment_size - ETH_HLEN);
+		status = gether_register_netdev(ncm_opts->net);
 	}
+	mutex_unlock(&ncm_opts->lock);
 
-	gether_set_gadget(netdev, cdev->gadget);
-	status = gether_register_netdev(netdev);
 	if (status)
 		return status;
 
-	/* export host's Ethernet address in CDC format */
-	status = gether_get_host_addr_cdc(netdev, ncm->ethaddr,
-					  sizeof(ncm->ethaddr));
-	if (status < 12)
-		return -EINVAL;
-	ncm_string_defs[STRING_MAC_IDX].s = ncm->ethaddr;
+	ncm_opts->bound = true;
+
+	ncm_string_defs[1].s = ncm->ethaddr;
 
 	us = usb_gstrings_attach(cdev, ncm_strings,
 				 ARRAY_SIZE(ncm_string_defs));
@@ -1578,8 +1563,6 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 		f->os_desc_n = 1;
 	}
 	ncm->notify_req = no_free_ptr(request);
-	ncm->netdev = no_free_ptr(netdev);
-	ncm->port.ioport = netdev_priv(ncm->netdev);
 
 	DBG(cdev, "CDC Network: IN/%s OUT/%s NOTIFY/%s\n",
 			ncm->port.in_ep->name, ncm->port.out_ep->name,
@@ -1594,19 +1577,19 @@ static inline struct f_ncm_opts *to_f_ncm_opts(struct config_item *item)
 }
 
 /* f_ncm_item_ops */
-USB_ETHER_OPTS_ITEM(ncm);
+USB_ETHERNET_CONFIGFS_ITEM(ncm);
 
 /* f_ncm_opts_dev_addr */
-USB_ETHER_OPTS_ATTR_DEV_ADDR(ncm);
+USB_ETHERNET_CONFIGFS_ITEM_ATTR_DEV_ADDR(ncm);
 
 /* f_ncm_opts_host_addr */
-USB_ETHER_OPTS_ATTR_HOST_ADDR(ncm);
+USB_ETHERNET_CONFIGFS_ITEM_ATTR_HOST_ADDR(ncm);
 
 /* f_ncm_opts_qmult */
-USB_ETHER_OPTS_ATTR_QMULT(ncm);
+USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(ncm);
 
 /* f_ncm_opts_ifname */
-USB_ETHER_OPTS_ATTR_IFNAME(ncm);
+USB_ETHERNET_CONFIGFS_ITEM_ATTR_IFNAME(ncm);
 
 static ssize_t ncm_opts_max_segment_size_show(struct config_item *item,
 					      char *page)
@@ -1672,27 +1655,34 @@ static void ncm_free_inst(struct usb_function_instance *f)
 	struct f_ncm_opts *opts;
 
 	opts = container_of(f, struct f_ncm_opts, func_inst);
+	if (opts->bound)
+		gether_cleanup(netdev_priv(opts->net));
+	else
+		free_netdev(opts->net);
 	kfree(opts->ncm_interf_group);
 	kfree(opts);
 }
 
 static struct usb_function_instance *ncm_alloc_inst(void)
 {
-	struct usb_function_instance *ret;
+	struct f_ncm_opts *opts;
 	struct usb_os_desc *descs[1];
 	char *names[1];
 	struct config_group *ncm_interf_group;
 
-	struct f_ncm_opts *opts __free(kfree) = kzalloc_obj(*opts);
+	opts = kzalloc_obj(*opts);
 	if (!opts)
 		return ERR_PTR(-ENOMEM);
-
-	opts->net = NULL;
 	opts->ncm_os_desc.ext_compat_id = opts->ncm_ext_compat_id;
-	gether_setup_opts_default(&opts->net_opts, "usb");
 
 	mutex_init(&opts->lock);
 	opts->func_inst.free_func_inst = ncm_free_inst;
+	opts->net = gether_setup_default();
+	if (IS_ERR(opts->net)) {
+		struct net_device *net = opts->net;
+		kfree(opts);
+		return ERR_CAST(net);
+	}
 	opts->max_segment_size = ETH_FRAME_LEN;
 	INIT_LIST_HEAD(&opts->ncm_os_desc.ext_prop);
 
@@ -1703,22 +1693,26 @@ static struct usb_function_instance *ncm_alloc_inst(void)
 	ncm_interf_group =
 		usb_os_desc_prepare_interf_dir(&opts->func_inst.group, 1, descs,
 					       names, THIS_MODULE);
-	if (IS_ERR(ncm_interf_group))
+	if (IS_ERR(ncm_interf_group)) {
+		ncm_free_inst(&opts->func_inst);
 		return ERR_CAST(ncm_interf_group);
+	}
 	opts->ncm_interf_group = ncm_interf_group;
 
-	ret = &opts->func_inst;
-	retain_and_null_ptr(opts);
-	return ret;
+	return &opts->func_inst;
 }
 
 static void ncm_free(struct usb_function *f)
 {
-	struct f_ncm_opts *opts = func_to_ncm_opts(f);
+	struct f_ncm *ncm;
+	struct f_ncm_opts *opts;
 
-	scoped_guard(mutex, &opts->lock)
-		opts->refcnt--;
-	kfree(func_to_ncm(f));
+	ncm = func_to_ncm(f);
+	opts = container_of(f->fi, struct f_ncm_opts, func_inst);
+	kfree(ncm);
+	mutex_lock(&opts->lock);
+	opts->refcnt--;
+	mutex_unlock(&opts->lock);
 }
 
 static void ncm_unbind(struct usb_configuration *c, struct usb_function *f)
@@ -1742,15 +1736,13 @@ static void ncm_unbind(struct usb_configuration *c, struct usb_function *f)
 
 	kfree(ncm->notify_req->buf);
 	usb_ep_free_request(ncm->notify, ncm->notify_req);
-
-	ncm->port.ioport = NULL;
-	gether_cleanup(netdev_priv(ncm->netdev));
 }
 
 static struct usb_function *ncm_alloc(struct usb_function_instance *fi)
 {
 	struct f_ncm		*ncm;
 	struct f_ncm_opts	*opts;
+	int status;
 
 	/* allocate and initialize one new instance */
 	ncm = kzalloc(sizeof(*ncm), GFP_KERNEL);
@@ -1758,12 +1750,22 @@ static struct usb_function *ncm_alloc(struct usb_function_instance *fi)
 		return ERR_PTR(-ENOMEM);
 
 	opts = container_of(fi, struct f_ncm_opts, func_inst);
+	mutex_lock(&opts->lock);
+	opts->refcnt++;
 
-	scoped_guard(mutex, &opts->lock)
-		opts->refcnt++;
+	/* export host's Ethernet address in CDC format */
+	status = gether_get_host_addr_cdc(opts->net, ncm->ethaddr,
+				      sizeof(ncm->ethaddr));
+	if (status < 12) { /* strlen("01234567890a") */
+		kfree(ncm);
+		mutex_unlock(&opts->lock);
+		return ERR_PTR(-EINVAL);
+	}
 
 	spin_lock_init(&ncm->lock);
 	ncm_reset_values(ncm);
+	ncm->port.ioport = netdev_priv(opts->net);
+	mutex_unlock(&opts->lock);
 	ncm->port.is_fixed = true;
 	ncm->port.supports_multi_frame = true;
 
diff --git a/drivers/usb/gadget/function/u_ncm.h b/drivers/usb/gadget/function/u_ncm.h
index d99330fe31e8..49ec095cdb4b 100644
--- a/drivers/usb/gadget/function/u_ncm.h
+++ b/drivers/usb/gadget/function/u_ncm.h
@@ -15,13 +15,11 @@
 
 #include <linux/usb/composite.h>
 
-#include "u_ether.h"
-
 struct f_ncm_opts {
 	struct usb_function_instance	func_inst;
 	struct net_device		*net;
+	bool				bound;
 
-	struct gether_opts		net_opts;
 	struct config_group		*ncm_interf_group;
 	struct usb_os_desc		ncm_os_desc;
 	char				ncm_ext_compat_id[16];

-- 
2.53.0.473.g4a7958ca14-goog


