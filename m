Return-Path: <linux-usb+bounces-31837-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C99CE9520
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 11:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EE4E302C8F4
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 10:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33E82DCF43;
	Tue, 30 Dec 2025 10:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hmvDQjME"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5892C2D7DDD
	for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089616; cv=none; b=tFgo3SBPVPKaL8mTsudiDQ7JUmBeJGPTqd6S4Rd44zHYEhwmiM+rAfYfYcLtTOgS7aRxAbe/muZVXUOPH3AMTC1A/NkYKXzY2oPii/2kmPzgD2a+pjeFh5hIlrN2XUQTr96aNorEPOUUKEC6ZUXb3x8CQGR4KmxMnOVijSGOntI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089616; c=relaxed/simple;
	bh=fjzdqqF7M1DPdLIRQxhjMHlueWC39nU6SrTa3Xb0wHw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mUSb/XZA0ARVqQBBr36qYyoPJeCuWKccetJwZ+fUVvGgKviLohmkyE/ipIkkiMq28yxn5QO9D/qK4uoaMC4QCzjaBLkLK83l7i2bPaJalJt236udW/S4uAZ1/r5nquyygCthvfszckc8e979UBt1W2rePN2FCJpVyRdY2ARzPjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hmvDQjME; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7d481452732so18726878b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 02:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767089613; x=1767694413; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kk89meB0ud2XOdFPAu8jbVTDVuurvx3TMcS0DOeOUAg=;
        b=hmvDQjMEkbnZTeC6rYqn8OfIULc96YIaXU6yeUq9zacmrzzuelw4IJFaG4yumzsM2f
         nAQ/A9BnosPWORmKOmbY2cYmjmT3d5ZYrcsV6MhBWLpAjnLw/Bp8kbtQMxWMHF5dJbCR
         GzgITSRDMrN/AUO20jvtwjy++2oHtKck4VrwldR+YFR0TGvTsCYK323wGYIDAXTlKiQZ
         Bz+yo6ZYLE5YZ7/mdtJEu4foTjSbdEKhmbpU97/p8dsDwsMhJ8mk4HKK0x+tHX4ubaS0
         3VaAMsCtxGT3BG4ilxuKTBEIq+/Da46FwuvPY1bFp1e/nD+PRSgzZpJFJvWHzX8GopK8
         p+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089613; x=1767694413;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kk89meB0ud2XOdFPAu8jbVTDVuurvx3TMcS0DOeOUAg=;
        b=P3oiYvhwkMF06uzLmxaQmW8vRLnKUq2Z+RnpUJju+pirfIH6/zZPfovvc7MqzJiVcq
         1K8TUkUXS6TvARxLulojZH/Rc4ud/n6vu2E6l4dzKskaUGiQjJ52QpuKB7MJ9AgwTi5N
         urRp/UZlcH/xcK4J0T62tNLyw6wf4fhdq+ubeFpR3uxOv8hTU/7y/Y3IPsmeYsE+IZb8
         dDiVvNkcLudg125OltuwTapBDufDzYmaqgfh1iiojArpzY+tAeElMtIMtgeMmXeN8owa
         Xz2nSEnJ0734skMSRxpltT1tv6JD1b5Dql0HwlJfLLu01fLzG/r+NX8LMLqo8K8oiTQw
         Pq1g==
X-Gm-Message-State: AOJu0Yy0N9MRj/3QSXhUqPS57H7y1zsWCmzBv7W8WdD9SDhGLxa3V8cM
	+++SjxCgtz+ZNPYTqGVdT2Gxb2wFnkkxckVcZlzwBiLyMlRmRiL1hkzRNuXy1LF3YGoccpFlnAT
	qk+PlHQ==
X-Google-Smtp-Source: AGHT+IGWHxYFnuval1C8ZpHUVPo7+TVbRjkOJoynJUNTc5/AEHtkyMwclyiWTmgCt0O/hlFsjOwnnYlA/EE=
X-Received: from pgtl20.prod.google.com ([2002:a65:6814:0:b0:c1d:27c6:5305])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:748e:b0:364:1318:caaf
 with SMTP id adf61e73a8af0-376aa4eaa1emr33427908637.58.1767089613485; Tue, 30
 Dec 2025 02:13:33 -0800 (PST)
Date: Tue, 30 Dec 2025 18:13:14 +0800
In-Reply-To: <20251230-ncm-refactor-v1-0-793e347bc7a7@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251230-ncm-refactor-v1-0-793e347bc7a7@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767089609; l=11544;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=fjzdqqF7M1DPdLIRQxhjMHlueWC39nU6SrTa3Xb0wHw=; b=neR3LoFKR7LqnFMAHLQ4VRxKimfCI0cHRZHWexdzaxnvTx4RZlY7AJGbdzAXf8OmIuspQDwhe
 twmSyeAAdEuBfpDY0rMX3E6KptpDLL5cpweWe1OZA8/yWY4QLClwX7j
X-Mailer: b4 0.14.2
Message-ID: <20251230-ncm-refactor-v1-1-793e347bc7a7@google.com>
Subject: [PATCH 1/3] usb: gadget: u_ether: add gether_opts for config caching
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Prashanth K <prashanth.k@oss.qualcomm.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"

Currently, the net_device is allocated when the function instance is
created (e.g., in ncm_alloc_inst()). While this allows userspace to
configure the device early, it decouples the net_device lifecycle from
the actual USB connection state (bind/unbind). The goal is to defer
net_device creation to the bind callback to properly align the lifecycle
with its parent gadget device.

However, deferring net_device allocation would prevent userspace from
configuring parameters (like interface name or MAC address) before the
net_device exists.

Introduce a new structure, struct gether_opts, associated with the
usb_function_instance, to cache settings independently of the
net_device. These settings include the interface name pattern, MAC
addresses (device and host), queue multiplier, and address assignment
type.

New helper functions are added:
- gether_setup_opts_default(): Initializes struct gether_opts with
  defaults, including random MAC addresses.
- gether_apply_opts(): Applies the cached options from a struct
  gether_opts to a valid net_device.

To expose these options to userspace, new configfs macros
(USB_ETHER_OPTS_ITEM and USB_ETHER_OPTS_ATTR_*) are defined in
u_ether_configfs.h. These attributes are part of the function
instance's configfs group.

This refactoring is a preparatory step. It allows the subsequent patch
to safely move the net_device allocation from the instance creation
phase to the bind phase without losing the ability to pre-configure
the interface via configfs.

Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/u_ether.c          |  30 +++++
 drivers/usb/gadget/function/u_ether.h          |  28 ++++
 drivers/usb/gadget/function/u_ether_configfs.h | 176 +++++++++++++++++++++++++
 3 files changed, 234 insertions(+)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index f58590bf5e02f5f785cf5bdc287f5ce9c95e47c3..745ed2c212e3a706b0e6725731b42d34428f8b22 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -1039,6 +1039,36 @@ int gether_set_ifname(struct net_device *net, const char *name, int len)
 }
 EXPORT_SYMBOL_GPL(gether_set_ifname);
 
+void gether_setup_opts_default(struct gether_opts *opts, const char *name)
+{
+	opts->qmult = QMULT_DEFAULT;
+	snprintf(opts->name, sizeof(opts->name), "%s%%d", name);
+	eth_random_addr(opts->dev_mac);
+	opts->addr_assign_type = NET_ADDR_RANDOM;
+	eth_random_addr(opts->host_mac);
+}
+EXPORT_SYMBOL_GPL(gether_setup_opts_default);
+
+void gether_apply_opts(struct net_device *net, struct gether_opts *opts)
+{
+	struct eth_dev *dev = netdev_priv(net);
+
+	dev->qmult = opts->qmult;
+
+	if (opts->ifname_set) {
+		strscpy(net->name, opts->name, sizeof(net->name));
+		dev->ifname_set = true;
+	}
+
+	memcpy(dev->host_mac, opts->host_mac, sizeof(dev->host_mac));
+
+	if (opts->addr_assign_type == NET_ADDR_SET) {
+		memcpy(dev->dev_mac, opts->dev_mac, sizeof(dev->dev_mac));
+		net->addr_assign_type = opts->addr_assign_type;
+	}
+}
+EXPORT_SYMBOL_GPL(gether_apply_opts);
+
 void gether_suspend(struct gether *link)
 {
 	struct eth_dev *dev = link->ioport;
diff --git a/drivers/usb/gadget/function/u_ether.h b/drivers/usb/gadget/function/u_ether.h
index 34be220cef77c49262b2098771c211326d038407..63a0240df4d749bd91c9dd6743406075093a3168 100644
--- a/drivers/usb/gadget/function/u_ether.h
+++ b/drivers/usb/gadget/function/u_ether.h
@@ -38,6 +38,31 @@
 
 struct eth_dev;
 
+/**
+ * struct gether_opts - Options for Ethernet gadget function instances
+ * @name: Pattern for the network interface name (e.g., "usb%d").
+ *        Used to generate the net device name.
+ * @qmult: Queue length multiplier for high/super speed.
+ * @host_mac: The MAC address to be used by the host side.
+ * @dev_mac: The MAC address to be used by the device side.
+ * @ifname_set: True if the interface name pattern has been set by userspace.
+ * @addr_assign_type: The method used for assigning the device MAC address
+ *                    (e.g., NET_ADDR_RANDOM, NET_ADDR_SET).
+ *
+ * This structure caches network-related settings provided through configfs
+ * before the net_device is fully instantiated. This allows for early
+ * configuration while deferring net_device allocation until the function
+ * is bound.
+ */
+struct gether_opts {
+	char			name[IFNAMSIZ];
+	unsigned int		qmult;
+	u8			host_mac[ETH_ALEN];
+	u8			dev_mac[ETH_ALEN];
+	bool			ifname_set;
+	unsigned char		addr_assign_type;
+};
+
 /*
  * This represents the USB side of an "ethernet" link, managed by a USB
  * function which provides control and (maybe) framing.  Two functions
@@ -259,6 +284,9 @@ int gether_set_ifname(struct net_device *net, const char *name, int len);
 
 void gether_cleanup(struct eth_dev *dev);
 
+void gether_setup_opts_default(struct gether_opts *opts, const char *name);
+void gether_apply_opts(struct net_device *net, struct gether_opts *opts);
+
 void gether_suspend(struct gether *link);
 void gether_resume(struct gether *link);
 
diff --git a/drivers/usb/gadget/function/u_ether_configfs.h b/drivers/usb/gadget/function/u_ether_configfs.h
index f558c3139ebe50d67b63a92cdc4bc0786998e23a..a3696797e074a79eafccfdf565b7af47485e4ce0 100644
--- a/drivers/usb/gadget/function/u_ether_configfs.h
+++ b/drivers/usb/gadget/function/u_ether_configfs.h
@@ -13,6 +13,12 @@
 #ifndef __U_ETHER_CONFIGFS_H
 #define __U_ETHER_CONFIGFS_H
 
+#include <linux/cleanup.h>
+#include <linux/if_ether.h>
+#include <linux/mutex.h>
+#include <linux/netdevice.h>
+#include <linux/rtnetlink.h>
+
 #define USB_ETHERNET_CONFIGFS_ITEM(_f_)					\
 	static void _f_##_attr_release(struct config_item *item)	\
 	{								\
@@ -197,4 +203,174 @@ out:									\
 									\
 	CONFIGFS_ATTR(_f_##_opts_, _n_)
 
+#define USB_ETHER_OPTS_ITEM(_f_)						\
+	static void _f_##_attr_release(struct config_item *item)		\
+	{									\
+		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
+										\
+		usb_put_function_instance(&opts->func_inst);			\
+	}									\
+										\
+	static struct configfs_item_operations _f_##_item_ops = {		\
+		.release	= _f_##_attr_release,				\
+	}
+
+#define USB_ETHER_OPTS_ATTR_DEV_ADDR(_f_)					\
+	static ssize_t _f_##_opts_dev_addr_show(struct config_item *item,	\
+						char *page)			\
+	{									\
+		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
+										\
+		guard(mutex)(&opts->lock);					\
+		return sysfs_emit(page, "%pM\n", opts->net_opts.dev_mac);	\
+	}									\
+										\
+	static ssize_t _f_##_opts_dev_addr_store(struct config_item *item,	\
+						 const char *page, size_t len)	\
+	{									\
+		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
+		u8 new_addr[ETH_ALEN];						\
+		const char *p = page;						\
+										\
+		guard(mutex)(&opts->lock);					\
+		if (opts->refcnt)						\
+			return -EBUSY;						\
+										\
+		for (int i = 0; i < ETH_ALEN; i++) {				\
+			unsigned char num;					\
+			if ((*p == '.') || (*p == ':'))				\
+				p++;						\
+			num = hex_to_bin(*p++) << 4;				\
+			num |= hex_to_bin(*p++);				\
+			new_addr[i] = num;					\
+		}								\
+		if (!is_valid_ether_addr(new_addr))				\
+			return -EINVAL;						\
+		memcpy(opts->net_opts.dev_mac, new_addr, ETH_ALEN);		\
+		opts->net_opts.addr_assign_type = NET_ADDR_SET;			\
+		return len;							\
+	}									\
+										\
+	CONFIGFS_ATTR(_f_##_opts_, dev_addr)
+
+#define USB_ETHER_OPTS_ATTR_HOST_ADDR(_f_)					\
+	static ssize_t _f_##_opts_host_addr_show(struct config_item *item,	\
+						 char *page)			\
+	{									\
+		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
+										\
+		guard(mutex)(&opts->lock);					\
+		return sysfs_emit(page, "%pM\n", opts->net_opts.host_mac);	\
+	}									\
+										\
+	static ssize_t _f_##_opts_host_addr_store(struct config_item *item,	\
+						  const char *page, size_t len)	\
+	{									\
+		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
+		u8 new_addr[ETH_ALEN];						\
+		const char *p = page;						\
+										\
+		guard(mutex)(&opts->lock);					\
+		if (opts->refcnt)						\
+			return -EBUSY;						\
+										\
+		for (int i = 0; i < ETH_ALEN; i++) {				\
+			unsigned char num;					\
+			if ((*p == '.') || (*p == ':'))				\
+				p++;						\
+			num = hex_to_bin(*p++) << 4;				\
+			num |= hex_to_bin(*p++);				\
+			new_addr[i] = num;					\
+		}								\
+		if (!is_valid_ether_addr(new_addr))				\
+			return -EINVAL;						\
+		memcpy(opts->net_opts.host_mac, new_addr, ETH_ALEN);		\
+		return len;							\
+	}									\
+										\
+	CONFIGFS_ATTR(_f_##_opts_, host_addr)
+
+#define USB_ETHER_OPTS_ATTR_QMULT(_f_)						\
+	static ssize_t _f_##_opts_qmult_show(struct config_item *item,		\
+					     char *page)			\
+	{									\
+		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
+										\
+		guard(mutex)(&opts->lock);					\
+		return sysfs_emit(page, "%u\n", opts->net_opts.qmult);		\
+	}									\
+										\
+	static ssize_t _f_##_opts_qmult_store(struct config_item *item,		\
+					      const char *page, size_t len)	\
+	{									\
+		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
+		u32 val;							\
+		int ret;							\
+										\
+		guard(mutex)(&opts->lock);					\
+		if (opts->refcnt)						\
+			return -EBUSY;						\
+										\
+		ret = kstrtou32(page, 0, &val);					\
+		if (ret)							\
+			return ret;						\
+										\
+		opts->net_opts.qmult = val;					\
+		return len;							\
+	}									\
+										\
+	CONFIGFS_ATTR(_f_##_opts_, qmult)
+
+#define USB_ETHER_OPTS_ATTR_IFNAME(_f_)						\
+	static ssize_t _f_##_opts_ifname_show(struct config_item *item,		\
+					      char *page)			\
+	{									\
+		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
+		const char *name;						\
+										\
+		guard(mutex)(&opts->lock);					\
+		rtnl_lock();							\
+		if (opts->net_opts.ifname_set)					\
+			name = opts->net_opts.name;				\
+		else if (opts->net)						\
+			name = netdev_name(opts->net);				\
+		else								\
+			name = "(inactive net_device)";				\
+		rtnl_unlock();							\
+		return sysfs_emit(page, "%s\n", name);				\
+	}									\
+										\
+	static ssize_t _f_##_opts_ifname_store(struct config_item *item,	\
+					       const char *page, size_t len)	\
+	{									\
+		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
+		char tmp[IFNAMSIZ];						\
+		const char *p;							\
+		size_t c_len = len;						\
+										\
+		if (c_len > 0 && page[c_len - 1] == '\n')			\
+			c_len--;						\
+										\
+		if (c_len >= sizeof(tmp))					\
+			return -E2BIG;						\
+										\
+		strscpy(tmp, page, c_len + 1);					\
+		if (!dev_valid_name(tmp))					\
+			return -EINVAL;						\
+										\
+		/* Require exactly one %d */					\
+		p = strchr(tmp, '%');						\
+		if (!p || p[1] != 'd' || strchr(p + 2, '%'))			\
+			return -EINVAL;						\
+										\
+		guard(mutex)(&opts->lock);					\
+		if (opts->refcnt)						\
+			return -EBUSY;						\
+		strscpy(opts->net_opts.name, tmp, sizeof(opts->net_opts.name));	\
+		opts->net_opts.ifname_set = true;				\
+		return len;							\
+	}									\
+										\
+	CONFIGFS_ATTR(_f_##_opts_, ifname)
+
 #endif /* __U_ETHER_CONFIGFS_H */

-- 
2.52.0.351.gbe84eed79e-goog


