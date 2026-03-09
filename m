Return-Path: <linux-usb+bounces-34303-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF/SM765rmlIIQIAu9opvQ
	(envelope-from <linux-usb+bounces-34303-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 13:14:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 318CB2389B8
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 13:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 528563092AC8
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 12:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1B33C199B;
	Mon,  9 Mar 2026 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZnlqewVy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898623AA1A6
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 12:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057937; cv=none; b=tfmIbTf6GNPBm/rFEnEoNcUmO9RraaZY/USrUkiqENSlGdalRlO12o6nazI1ESqqBnmKZfosGgr+nCLYwbkq4xXPp4Z9r6unRMfeBwveK3WgwIh68Rq8052603cxuG178gQk9xTA1v5s7OKtauOT3w7WxOeGLMjmeS5RDgpM7OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057937; c=relaxed/simple;
	bh=/m3b4zqGc1iZkhOBcgJHOpbEiI99gvlL58opOGTdGyE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X4v/uMW7ByPQL6FOxoBoeknEThhExRgTs3TjzR/YVrxW8uC/JtS+vq30wH6ZGwDUCb0lL9ap3yZqHWZSe1L5za5T8QaEeJXkj8+o2ubDn1sJ0G9W1NoitIuU7xUdBcssOXMz6H+gP3ClDdEJ60EN0cR44XOrb2ms4ne5HxkenXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZnlqewVy; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2adef9d486bso103308135ad.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 05:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773057928; x=1773662728; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/6AkYd5gYPDrKscM6W7dnA+in+IO1rRT3m4qc7cgao=;
        b=ZnlqewVyBJAqJ3o/liioT+rBtQGmDUX8cZHY7Grj0bO9shhQ2i965vAeE3Lwy7URVM
         41ki/pGMBWHZuPMb6ctMBNsKcmaSA9r0RyDBYUrQdhmC349hg/Yro1UOimvQVE99Dkd2
         9o0covG0y4Xv1UR9snTBeSaHzaLnzSP2jDZSdfQTdZIqLVeMsFrzPkftOrTjOOUJWxLx
         zm4GgBZ3U3YrigKfEwbOSNduEEDEwU3TA55aL1lTBPd14LEBscgX48W/VNOYLcNuHqbe
         iaQjbgnn5CYzbciLargajMsvxxN4U8q0wIhH5He01Qng0f9JaW9hV2caeCGyxj4c9pHo
         /XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773057928; x=1773662728;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/6AkYd5gYPDrKscM6W7dnA+in+IO1rRT3m4qc7cgao=;
        b=hp5XNQgjX0NSfiTfdGD9ir0GAAVlsQNKwhzo+qZOcSh0nlGPEaIqX4Jd8WP5uf+jJN
         +emzMihOxsqYax2NMrEd6/yJtSOwE69SXeyUTpRIWAT5H859PDjlucO1fvl7M9E6TSXm
         kg+aHP5jz4aF6BFZoKGY9Pc2yZ19tplAFuomebyVoODuRDdLoy0wocOJMySTob33L3NJ
         Scv8y3YvBNy+npc/J/Upf7trO8uysrKURH1VYJ3vQq2tssBt8snDYbmzfWKbePLyhjgS
         RVO1+zd4LvwZAR5kpJ9LTZah1KrVNe23+BW6B2Fuu+q5j5SvcGn3dXnx+dUFWFu1UHg9
         mIlg==
X-Forwarded-Encrypted: i=1; AJvYcCWfanZ8zNDoVOVYUPtF8l67jdsNpIVx2dyYcxwdtzEjBXurKOWHEjKqH9bLAPWpIxrP8wnQb/GVuwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQR/KSG/7NlkMHWXCv4x79zepN4zMxXo99/tZeM0FrbKVAfSCm
	hZKX66pE5vMxSS8Kjtw1pSdCs3empINO4JX/s2M3VKRJOdd9rfW73IccaxdifTz60NvbtL6nBWy
	2HWKCoA==
X-Received: from pluo12.prod.google.com ([2002:a17:903:4b0c:b0:2a9:6366:197c])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3bc7:b0:2ae:3bb2:a8cb
 with SMTP id d9443c01a7336-2ae825046e0mr105886065ad.40.1773057927790; Mon, 09
 Mar 2026 05:05:27 -0700 (PDT)
Date: Mon, 09 Mar 2026 20:04:51 +0800
In-Reply-To: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773057914; l=11207;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=/m3b4zqGc1iZkhOBcgJHOpbEiI99gvlL58opOGTdGyE=; b=4kp8mfQy1hVr+bmdAXORHtGyriFERkOL/AeLV25sn3IsDmaEp9u9IqK99qP8andRF1HDrFEXk
 YPo8DYN8ljcBwWmHiDTnHl6Rg5M4JSfjFJl8OIwDEVF2i21jjwuKEkQ
X-Mailer: b4 0.14.3
Message-ID: <20260309-f-ncm-revert-v2-6-ea2afbc7d9b2@google.com>
Subject: [PATCH v2 6/7] Revert "usb: gadget: u_ether: add gether_opts for
 config caching"
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Heidelberg <david@ixit.cz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Jon Hunter <jonathanh@nvidia.com>, LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 318CB2389B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34303-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.925];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

This reverts commit e065c6a7e46c2ee9c677fdbf50035323d2de1215.

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
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/u_ether.c          |  30 -----
 drivers/usb/gadget/function/u_ether.h          |  28 ----
 drivers/usb/gadget/function/u_ether_configfs.h | 176 -------------------------
 3 files changed, 234 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 15685b2f8887..c47965d850d4 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -1040,36 +1040,6 @@ int gether_set_ifname(struct net_device *net, const char *name, int len)
 }
 EXPORT_SYMBOL_GPL(gether_set_ifname);
 
-void gether_setup_opts_default(struct gether_opts *opts, const char *name)
-{
-	opts->qmult = QMULT_DEFAULT;
-	snprintf(opts->name, sizeof(opts->name), "%s%%d", name);
-	eth_random_addr(opts->dev_mac);
-	opts->addr_assign_type = NET_ADDR_RANDOM;
-	eth_random_addr(opts->host_mac);
-}
-EXPORT_SYMBOL_GPL(gether_setup_opts_default);
-
-void gether_apply_opts(struct net_device *net, struct gether_opts *opts)
-{
-	struct eth_dev *dev = netdev_priv(net);
-
-	dev->qmult = opts->qmult;
-
-	if (opts->ifname_set) {
-		strscpy(net->name, opts->name, sizeof(net->name));
-		dev->ifname_set = true;
-	}
-
-	memcpy(dev->host_mac, opts->host_mac, sizeof(dev->host_mac));
-
-	if (opts->addr_assign_type == NET_ADDR_SET) {
-		memcpy(dev->dev_mac, opts->dev_mac, sizeof(dev->dev_mac));
-		net->addr_assign_type = opts->addr_assign_type;
-	}
-}
-EXPORT_SYMBOL_GPL(gether_apply_opts);
-
 void gether_suspend(struct gether *link)
 {
 	struct eth_dev *dev = link->ioport;
diff --git a/drivers/usb/gadget/function/u_ether.h b/drivers/usb/gadget/function/u_ether.h
index 63a0240df4d7..34be220cef77 100644
--- a/drivers/usb/gadget/function/u_ether.h
+++ b/drivers/usb/gadget/function/u_ether.h
@@ -38,31 +38,6 @@
 
 struct eth_dev;
 
-/**
- * struct gether_opts - Options for Ethernet gadget function instances
- * @name: Pattern for the network interface name (e.g., "usb%d").
- *        Used to generate the net device name.
- * @qmult: Queue length multiplier for high/super speed.
- * @host_mac: The MAC address to be used by the host side.
- * @dev_mac: The MAC address to be used by the device side.
- * @ifname_set: True if the interface name pattern has been set by userspace.
- * @addr_assign_type: The method used for assigning the device MAC address
- *                    (e.g., NET_ADDR_RANDOM, NET_ADDR_SET).
- *
- * This structure caches network-related settings provided through configfs
- * before the net_device is fully instantiated. This allows for early
- * configuration while deferring net_device allocation until the function
- * is bound.
- */
-struct gether_opts {
-	char			name[IFNAMSIZ];
-	unsigned int		qmult;
-	u8			host_mac[ETH_ALEN];
-	u8			dev_mac[ETH_ALEN];
-	bool			ifname_set;
-	unsigned char		addr_assign_type;
-};
-
 /*
  * This represents the USB side of an "ethernet" link, managed by a USB
  * function which provides control and (maybe) framing.  Two functions
@@ -284,9 +259,6 @@ int gether_set_ifname(struct net_device *net, const char *name, int len);
 
 void gether_cleanup(struct eth_dev *dev);
 
-void gether_setup_opts_default(struct gether_opts *opts, const char *name);
-void gether_apply_opts(struct net_device *net, struct gether_opts *opts);
-
 void gether_suspend(struct gether *link);
 void gether_resume(struct gether *link);
 
diff --git a/drivers/usb/gadget/function/u_ether_configfs.h b/drivers/usb/gadget/function/u_ether_configfs.h
index 39d3a261496d..51f0d79e5eca 100644
--- a/drivers/usb/gadget/function/u_ether_configfs.h
+++ b/drivers/usb/gadget/function/u_ether_configfs.h
@@ -13,12 +13,6 @@
 #ifndef __U_ETHER_CONFIGFS_H
 #define __U_ETHER_CONFIGFS_H
 
-#include <linux/cleanup.h>
-#include <linux/if_ether.h>
-#include <linux/mutex.h>
-#include <linux/netdevice.h>
-#include <linux/rtnetlink.h>
-
 #define USB_ETHERNET_CONFIGFS_ITEM(_f_)					\
 	static void _f_##_attr_release(struct config_item *item)	\
 	{								\
@@ -203,174 +197,4 @@ out:									\
 									\
 	CONFIGFS_ATTR(_f_##_opts_, _n_)
 
-#define USB_ETHER_OPTS_ITEM(_f_)						\
-	static void _f_##_attr_release(struct config_item *item)		\
-	{									\
-		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
-										\
-		usb_put_function_instance(&opts->func_inst);			\
-	}									\
-										\
-	static struct configfs_item_operations _f_##_item_ops = {		\
-		.release	= _f_##_attr_release,				\
-	}
-
-#define USB_ETHER_OPTS_ATTR_DEV_ADDR(_f_)					\
-	static ssize_t _f_##_opts_dev_addr_show(struct config_item *item,	\
-						char *page)			\
-	{									\
-		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
-										\
-		guard(mutex)(&opts->lock);					\
-		return sysfs_emit(page, "%pM\n", opts->net_opts.dev_mac);	\
-	}									\
-										\
-	static ssize_t _f_##_opts_dev_addr_store(struct config_item *item,	\
-						 const char *page, size_t len)	\
-	{									\
-		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
-		u8 new_addr[ETH_ALEN];						\
-		const char *p = page;						\
-										\
-		guard(mutex)(&opts->lock);					\
-		if (opts->refcnt)						\
-			return -EBUSY;						\
-										\
-		for (int i = 0; i < ETH_ALEN; i++) {				\
-			unsigned char num;					\
-			if ((*p == '.') || (*p == ':'))				\
-				p++;						\
-			num = hex_to_bin(*p++) << 4;				\
-			num |= hex_to_bin(*p++);				\
-			new_addr[i] = num;					\
-		}								\
-		if (!is_valid_ether_addr(new_addr))				\
-			return -EINVAL;						\
-		memcpy(opts->net_opts.dev_mac, new_addr, ETH_ALEN);		\
-		opts->net_opts.addr_assign_type = NET_ADDR_SET;			\
-		return len;							\
-	}									\
-										\
-	CONFIGFS_ATTR(_f_##_opts_, dev_addr)
-
-#define USB_ETHER_OPTS_ATTR_HOST_ADDR(_f_)					\
-	static ssize_t _f_##_opts_host_addr_show(struct config_item *item,	\
-						 char *page)			\
-	{									\
-		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
-										\
-		guard(mutex)(&opts->lock);					\
-		return sysfs_emit(page, "%pM\n", opts->net_opts.host_mac);	\
-	}									\
-										\
-	static ssize_t _f_##_opts_host_addr_store(struct config_item *item,	\
-						  const char *page, size_t len)	\
-	{									\
-		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
-		u8 new_addr[ETH_ALEN];						\
-		const char *p = page;						\
-										\
-		guard(mutex)(&opts->lock);					\
-		if (opts->refcnt)						\
-			return -EBUSY;						\
-										\
-		for (int i = 0; i < ETH_ALEN; i++) {				\
-			unsigned char num;					\
-			if ((*p == '.') || (*p == ':'))				\
-				p++;						\
-			num = hex_to_bin(*p++) << 4;				\
-			num |= hex_to_bin(*p++);				\
-			new_addr[i] = num;					\
-		}								\
-		if (!is_valid_ether_addr(new_addr))				\
-			return -EINVAL;						\
-		memcpy(opts->net_opts.host_mac, new_addr, ETH_ALEN);		\
-		return len;							\
-	}									\
-										\
-	CONFIGFS_ATTR(_f_##_opts_, host_addr)
-
-#define USB_ETHER_OPTS_ATTR_QMULT(_f_)						\
-	static ssize_t _f_##_opts_qmult_show(struct config_item *item,		\
-					     char *page)			\
-	{									\
-		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
-										\
-		guard(mutex)(&opts->lock);					\
-		return sysfs_emit(page, "%u\n", opts->net_opts.qmult);		\
-	}									\
-										\
-	static ssize_t _f_##_opts_qmult_store(struct config_item *item,		\
-					      const char *page, size_t len)	\
-	{									\
-		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
-		u32 val;							\
-		int ret;							\
-										\
-		guard(mutex)(&opts->lock);					\
-		if (opts->refcnt)						\
-			return -EBUSY;						\
-										\
-		ret = kstrtou32(page, 0, &val);					\
-		if (ret)							\
-			return ret;						\
-										\
-		opts->net_opts.qmult = val;					\
-		return len;							\
-	}									\
-										\
-	CONFIGFS_ATTR(_f_##_opts_, qmult)
-
-#define USB_ETHER_OPTS_ATTR_IFNAME(_f_)						\
-	static ssize_t _f_##_opts_ifname_show(struct config_item *item,		\
-					      char *page)			\
-	{									\
-		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
-		const char *name;						\
-										\
-		guard(mutex)(&opts->lock);					\
-		rtnl_lock();							\
-		if (opts->net_opts.ifname_set)					\
-			name = opts->net_opts.name;				\
-		else if (opts->net)						\
-			name = netdev_name(opts->net);				\
-		else								\
-			name = "(inactive net_device)";				\
-		rtnl_unlock();							\
-		return sysfs_emit(page, "%s\n", name);				\
-	}									\
-										\
-	static ssize_t _f_##_opts_ifname_store(struct config_item *item,	\
-					       const char *page, size_t len)	\
-	{									\
-		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
-		char tmp[IFNAMSIZ];						\
-		const char *p;							\
-		size_t c_len = len;						\
-										\
-		if (c_len > 0 && page[c_len - 1] == '\n')			\
-			c_len--;						\
-										\
-		if (c_len >= sizeof(tmp))					\
-			return -E2BIG;						\
-										\
-		strscpy(tmp, page, c_len + 1);					\
-		if (!dev_valid_name(tmp))					\
-			return -EINVAL;						\
-										\
-		/* Require exactly one %d */					\
-		p = strchr(tmp, '%');						\
-		if (!p || p[1] != 'd' || strchr(p + 2, '%'))			\
-			return -EINVAL;						\
-										\
-		guard(mutex)(&opts->lock);					\
-		if (opts->refcnt)						\
-			return -EBUSY;						\
-		strscpy(opts->net_opts.name, tmp, sizeof(opts->net_opts.name));	\
-		opts->net_opts.ifname_set = true;				\
-		return len;							\
-	}									\
-										\
-	CONFIGFS_ATTR(_f_##_opts_, ifname)
-
 #endif /* __U_ETHER_CONFIGFS_H */

-- 
2.53.0.473.g4a7958ca14-goog


