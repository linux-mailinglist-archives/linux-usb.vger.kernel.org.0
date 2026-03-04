Return-Path: <linux-usb+bounces-33943-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJmtE7Xbp2kRkQAAu9opvQ
	(envelope-from <linux-usb+bounces-33943-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 08:13:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C041FB6F5
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 08:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41B37311DA8A
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 07:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C71437F8DA;
	Wed,  4 Mar 2026 07:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1LEDFH8R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C3337F009
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 07:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772608292; cv=none; b=gPS7GNJZiECe0QiMQV6e/hizniZGo1obLuAThGwnkvS89lIetv1JmCwJDB3TbPYIbfs0kL4C/+b3r5AhWrFMXA8ZIQLUJD7zlNM1DZl1GSoc7hYXgdJRaIdSiR7dpKUi9S97RV3rxbEQOrOfVojclKVnJQJSkt9yDS+ixdt85UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772608292; c=relaxed/simple;
	bh=/m3b4zqGc1iZkhOBcgJHOpbEiI99gvlL58opOGTdGyE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S8LwCgxS+XcvZMop6fhSH3GZnMdMfuLC9L39NkPRsRieGjl3H28fbKaHsdztz++r1fhrGyUD+wnVYR06b3jjtqSe0Li+1bRj3k4AiFwK0Bv6DKYUc8Hri9ciA3kRzqkWlesbWQZyZ1uZyn/Xhy8Ga19T0rUaUG2QFKnwqAxlav4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1LEDFH8R; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-827448e844eso3668150b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2026 23:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772608290; x=1773213090; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/6AkYd5gYPDrKscM6W7dnA+in+IO1rRT3m4qc7cgao=;
        b=1LEDFH8RONB+8lvf0yRrXsp+tXwH2iJ6PAfR/LO2JNt9d59h8dDd9V4wB1LdJIwbva
         zLNLiCJgoMI5Qp7AYD+XmSMHpDi4cW0e5ZYPmG5gargRwvSBhC8hvNL56VQd9++R5ai6
         5tbrcHyQ5h3pM1vUmtRxTxKEKHt7hW2ZS+C3MPUC48FDKAq/YisC9jNts4zJ0I43h7Fp
         9KOtKeeDj4OlZmyWBzq0JD97a66QgDkdk6bH2REs/GvFlWhCOURqbTrKYocBEPUe4dMa
         2wDSKEf9bZy6mPYVeYIuTYA/g6z/8cpgTgcnk0YfVDRXmG8n6AmO23zTcxpE7Ep/pWz7
         EKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772608290; x=1773213090;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/6AkYd5gYPDrKscM6W7dnA+in+IO1rRT3m4qc7cgao=;
        b=b/v2MiamCFLkfmOWWSwjSQuVbDlvtUp8KxDavoD7Pj+hZZIMzVDThQCBDtcIj5eQrT
         IVKqjZsvV18SHc7wYsjvwPQjyL9clkqKUjNdWFM4+KEhVL3rDmfMIYMBw9s8MVPo+Y+i
         KsSWql5cqvJlELfND9TlJKhcBj0oZ9zvI6A385VPCZiV4BvaOvdZjdKDGSRJ7T5Ga1iF
         Q+t38xtgOiFcSFkVmh1owBKDQJcX/nvz8HvcOvfnVpbq/T0Nxdotfijqum95Mc4hSuYp
         swMJ2J8v+h1xxEKFsm9ehbSbiT32ifFXbxoeYtixd3OJ7eY4L5/PQ1ivf+qCg+uUwOGy
         Kudg==
X-Forwarded-Encrypted: i=1; AJvYcCXDv1L0Gre1t39hGVDY1cnp73mZt2/aFo4yCVNIklQqZHdbxjKM8BWuocVhmWYIX8+hz6SV9SqDmtk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLGJ1q2e/L8bwtU10QD57/hsMAb4YHrw+GK/G9iDzAVs2CzlGr
	389toCVSQeDAhgXwO+XfQP/DaTRaUnd/NwkJzPqMNkYQRoppYVRhbJgtsfOrU4v2WrDN4Fdi+mn
	J4/mTgQ==
X-Received: from pgl37.prod.google.com ([2002:a63:b25:0:b0:c66:e983:3013])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:190f:b0:821:8492:7f66
 with SMTP id d2e1a72fcca58-82972bbe102mr792491b3a.22.1772608289739; Tue, 03
 Mar 2026 23:11:29 -0800 (PST)
Date: Wed, 04 Mar 2026 15:10:58 +0800
In-Reply-To: <20260304-f-ncm-revert-v1-0-57c9157b58af@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260304-f-ncm-revert-v1-0-57c9157b58af@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772608275; l=11207;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=/m3b4zqGc1iZkhOBcgJHOpbEiI99gvlL58opOGTdGyE=; b=sK5kDaydFnRxmdYZwz/7eTqO9/brczTL50kCRboiD0tZznzKYZ/vsOkBqGIWIR3mR9BAnh9Pc
 xFCWbZJz1X3Dp3L3ziY3wWLJrmjvs/ErKgidfQ3zZYomNO3NYkNs7jm
X-Mailer: b4 0.14.3
Message-ID: <20260304-f-ncm-revert-v1-6-57c9157b58af@google.com>
Subject: [PATCH 6/6] Revert "usb: gadget: u_ether: add gether_opts for config caching"
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Heidelberg <david@ixit.cz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: A3C041FB6F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33943-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
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


