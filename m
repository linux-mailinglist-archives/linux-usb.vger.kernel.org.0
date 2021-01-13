Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21CFB2F4F1A
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 16:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbhAMPqi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 10:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbhAMPqh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 10:46:37 -0500
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F025C061575
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 07:45:57 -0800 (PST)
Received: by mail-pj1-x1049.google.com with SMTP id s14so1567415pjk.4
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 07:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=PCdaLK+r5E6PVOaTgDEHyeifoyAN0G6uWECWwfm2Fl4=;
        b=jS60xzFgqE7NG45HeoUePwv5m41Wh6Z0FOhZzZOWeh9itRmnBzaT+uWiteRiPCTsAr
         2O64BBXim7BeueScA6bBqd+JVthfP1GtRfyPwPB2F1jB0ijseGhBphmELxPb8ZcgcqDz
         0DZUMztRDYXFEjnRVjPEEzXEtc3ZTx6la7TPmJXBEuSv88KCUKRFr2e6j26nV0wVQg/k
         VbLFFjZZ8603jTHuGpymXGR0A+SAe8oowgZ5X4iidwOazADbEr2Uh4TTU/55aR9Ptn2P
         k9OV4Bv6svLScF2tmDaYfTNWquF8xwL90DGHi/txJ8lcpbfUU903k5APc3BVIV1tRq7b
         /5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=PCdaLK+r5E6PVOaTgDEHyeifoyAN0G6uWECWwfm2Fl4=;
        b=aNghmPX9VU69lRyodF9UIup4E0gkjx0iIf1V28F66VRJpNMH+voELTN7Q6ZQtlvaMM
         eDhOeJgAhFsejBL4qnD4yw2jQZzXIPg+aqAEdC1GxQGum5MDGuiPru8AnzC5CSg+A6Oi
         DYtp6MFyi3bEQLyIO24zTfBt6FFKQHM2yl/NyJkPyofnmytkSFlUdiWR9MRkZkFeewQ2
         sH1/xQmXE1xhwo2fGGPVfoDy/zc5isTyWEsaNHeLLGgJn9/VKsadnboNL6TecolUoKbz
         Le/AqG/F5gv+wvrazTU0ug4Ycl7E+luQD+AlEYvf2CxlBWz0EYHZQyrl5bWf5m/fR2rt
         JFNQ==
X-Gm-Message-State: AOAM531SV6k9qbK4RzXcy/jcULG3NsP//ZplNS8VSHVVAwmFc0Vz1Iky
        /YzYhAOWiEI+TFloZbkWkSYe3i2I0eYKtbNzz7pswNtqZ7cBEnHtvsjzif9lE2Ofce2SGFbqCSz
        6rb5vrxX2qUKImBTVKUqUQUGRt1PAa3pn501sMHj0YqCTJ9JzSjfqpYSjGhWFudrLYa7e
X-Google-Smtp-Source: ABdhPJz5en1Fq+KBRHv1ZDwyfM8m4+8r5hUQGe8adAPo7DPNoOnuMsg6vXimhfnQat5n3+fdY/9IG5ufZ/er
Sender: "lorenzo via sendgmr" <lorenzo@drone.tok.corp.google.com>
X-Received: from drone.tok.corp.google.com ([2401:fa00:8f:2:a6ae:11ff:fe18:6f64])
 (user=lorenzo job=sendgmr) by 2002:a17:90b:4d07:: with SMTP id
 mw7mr3145788pjb.172.1610552756856; Wed, 13 Jan 2021 07:45:56 -0800 (PST)
Date:   Thu, 14 Jan 2021 00:45:50 +0900
Message-Id: <20210113154550.789244-1-lorenzo@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH v2] usb: gadget: u_ether: support configuring interface names.
From:   Lorenzo Colitti <lorenzo@google.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org
Cc:     zenczykowski@gmail.com, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch allows the administrator to configure the interface
name of a function using u_ether (e.g., eem, ncm, rndis).

Currently, all such interfaces, regardless of function type, are
always called usb0, usb1, etc. This makes it very cumbersome to
use more than one such type at a time, because userspace cannnot
easily tell the interfaces apart and apply the right
configuration to each one. Interface renaming in userspace based
on driver doesn't help, because the interfaces all have the same
driver. Without this patch, doing this require hacks/workarounds
such as setting fixed MAC addresses on the functions, and then
renaming by MAC address, or scraping configfs after each
interface is created to find out what it is.

Setting the interface name is done by writing to the same
"ifname" configfs attribute that reports the interface name after
the function is bound. The write must contain an interface
pattern such as "usb%d" (which will cause the net core to pick
the next available interface name starting with "usb").
This patch does not allow writing an exact interface name (as
opposed to a pattern) because if the interface already exists at
bind time, the bind will fail and the whole gadget will fail to
activate. This could be allowed in a future patch.

For compatibility with current userspace, when reading an ifname
that has not currently been set, the result is still "(unnamed
net_device)". Once a write to ifname happens, then reading ifname
will return whatever was last written.

Tested by configuring an rndis function and an ncm function on
the same gadget, and writing "rndis%d" to ifname on the rndis
function and "ncm%d" to ifname on the ncm function. When the
gadget was bound, the rndis interface was rndis0 and the ncm
interface was ncm0.

Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
---
 Documentation/usb/gadget-testing.rst          | 30 +++++++--------
 drivers/usb/gadget/function/u_ether.c         | 37 +++++++++++++++++--
 drivers/usb/gadget/function/u_ether.h         | 12 ++++++
 .../usb/gadget/function/u_ether_configfs.h    | 15 +++++++-
 4 files changed, 75 insertions(+), 19 deletions(-)

diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 2eeb3e9299e4..2085e7b24eeb 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -91,9 +91,9 @@ The ECM function provides these attributes in its function directory:
 
 and after creating the functions/ecm.<instance name> they contain default
 values: qmult is 5, dev_addr and host_addr are randomly selected.
-Except for ifname they can be written to until the function is linked to a
-configuration. The ifname is read-only and contains the name of the interface
-which was assigned by the net core, e. g. usb0.
+The ifname can be written to if the function is not bound. A write must be an
+interface pattern such as "usb%d", which will cause the net core to choose the
+next free usbX interface. By default, it is set to "usb%d".
 
 Testing the ECM function
 ------------------------
@@ -131,9 +131,9 @@ The ECM subset function provides these attributes in its function directory:
 
 and after creating the functions/ecm.<instance name> they contain default
 values: qmult is 5, dev_addr and host_addr are randomly selected.
-Except for ifname they can be written to until the function is linked to a
-configuration. The ifname is read-only and contains the name of the interface
-which was assigned by the net core, e. g. usb0.
+The ifname can be written to if the function is not bound. A write must be an
+interface pattern such as "usb%d", which will cause the net core to choose the
+next free usbX interface. By default, it is set to "usb%d".
 
 Testing the ECM subset function
 -------------------------------
@@ -171,9 +171,9 @@ The EEM function provides these attributes in its function directory:
 
 and after creating the functions/eem.<instance name> they contain default
 values: qmult is 5, dev_addr and host_addr are randomly selected.
-Except for ifname they can be written to until the function is linked to a
-configuration. The ifname is read-only and contains the name of the interface
-which was assigned by the net core, e. g. usb0.
+The ifname can be written to if the function is not bound. A write must be an
+interface pattern such as "usb%d", which will cause the net core to choose the
+next free usbX interface. By default, it is set to "usb%d".
 
 Testing the EEM function
 ------------------------
@@ -453,9 +453,9 @@ The NCM function provides these attributes in its function directory:
 
 and after creating the functions/ncm.<instance name> they contain default
 values: qmult is 5, dev_addr and host_addr are randomly selected.
-Except for ifname they can be written to until the function is linked to a
-configuration. The ifname is read-only and contains the name of the interface
-which was assigned by the net core, e. g. usb0.
+The ifname can be written to if the function is not bound. A write must be an
+interface pattern such as "usb%d", which will cause the net core to choose the
+next free usbX interface. By default, it is set to "usb%d".
 
 Testing the NCM function
 ------------------------
@@ -591,9 +591,9 @@ The RNDIS function provides these attributes in its function directory:
 
 and after creating the functions/rndis.<instance name> they contain default
 values: qmult is 5, dev_addr and host_addr are randomly selected.
-Except for ifname they can be written to until the function is linked to a
-configuration. The ifname is read-only and contains the name of the interface
-which was assigned by the net core, e. g. usb0.
+The ifname can be written to if the function is not bound. A write must be an
+interface pattern such as "usb%d", which will cause the net core to choose the
+next free usbX interface. By default, it is set to "usb%d".
 
 Testing the RNDIS function
 --------------------------
diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index c019f2b0c0af..a4ade7983402 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -78,8 +78,9 @@ struct eth_dev {
 	unsigned long		todo;
 #define	WORK_RX_MEMORY		0
 
-	bool			zlp;
-	bool			no_skb_reserve;
+	bool			zlp:1;
+	bool			no_skb_reserve:1;
+	bool			ifname_set:1;
 	u8			host_mac[ETH_ALEN];
 	u8			dev_mac[ETH_ALEN];
 };
@@ -1004,15 +1005,45 @@ EXPORT_SYMBOL_GPL(gether_get_qmult);
 
 int gether_get_ifname(struct net_device *net, char *name, int len)
 {
+	struct eth_dev *dev = netdev_priv(net);
 	int ret;
 
 	rtnl_lock();
-	ret = scnprintf(name, len, "%s\n", netdev_name(net));
+	ret = scnprintf(name, len, "%s\n",
+			dev->ifname_set ? net->name : netdev_name(net));
 	rtnl_unlock();
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gether_get_ifname);
 
+int gether_set_ifname(struct net_device *net, const char *name, int len)
+{
+	struct eth_dev *dev = netdev_priv(net);
+	char tmp[IFNAMSIZ];
+	const char *p;
+
+	if (name[len - 1] == '\n')
+		len--;
+
+	if (len >= sizeof(tmp))
+		return -E2BIG;
+
+	strscpy(tmp, name, len + 1);
+	if (!dev_valid_name(tmp))
+		return -EINVAL;
+
+	/* Require exactly one %d, so binding will not fail with EEXIST. */
+	p = strchr(name, '%');
+	if (!p || p[1] != 'd' || strchr(p + 2, '%'))
+		return -EINVAL;
+
+	strncpy(net->name, tmp, sizeof(net->name));
+	dev->ifname_set = true;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gether_set_ifname);
+
 /*
  * gether_cleanup - remove Ethernet-over-USB device
  * Context: may sleep
diff --git a/drivers/usb/gadget/function/u_ether.h b/drivers/usb/gadget/function/u_ether.h
index 10dd640684e2..40144546d1b0 100644
--- a/drivers/usb/gadget/function/u_ether.h
+++ b/drivers/usb/gadget/function/u_ether.h
@@ -244,6 +244,18 @@ unsigned gether_get_qmult(struct net_device *net);
  */
 int gether_get_ifname(struct net_device *net, char *name, int len);
 
+/**
+ * gether_set_ifname - set an ethernet-over-usb link interface name
+ * @net: device representing this link
+ * @name: new interface name
+ * @len: length of @name
+ *
+ * This sets the interface name of this ethernet-over-usb link.
+ * A single terminating newline, if any, is ignored.
+ * Returns zero on success, else negative errno.
+ */
+int gether_set_ifname(struct net_device *net, const char *name, int len);
+
 void gether_cleanup(struct eth_dev *dev);
 
 /* connect/disconnect is handled by individual functions */
diff --git a/drivers/usb/gadget/function/u_ether_configfs.h b/drivers/usb/gadget/function/u_ether_configfs.h
index bd92b5703013..3dfb460908fa 100644
--- a/drivers/usb/gadget/function/u_ether_configfs.h
+++ b/drivers/usb/gadget/function/u_ether_configfs.h
@@ -148,7 +148,20 @@ out:									\
 		return ret;						\
 	}								\
 									\
-	CONFIGFS_ATTR_RO(_f_##_opts_, ifname)
+	static ssize_t _f_##_opts_ifname_store(struct config_item *item, \
+					       const char *page, size_t len)\
+	{								\
+		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);	\
+		int ret = -EBUSY;					\
+									\
+		mutex_lock(&opts->lock);				\
+		if (!opts->refcnt)					\
+			ret = gether_set_ifname(opts->net, page, len);	\
+		mutex_unlock(&opts->lock);				\
+		return ret ?: len;					\
+	}								\
+									\
+	CONFIGFS_ATTR(_f_##_opts_, ifname)
 
 #define USB_ETHER_CONFIGFS_ITEM_ATTR_U8_RW(_f_, _n_)			\
 	static ssize_t _f_##_opts_##_n_##_show(struct config_item *item,\
-- 
2.30.0.284.gd98b1dd5eaa7-goog

