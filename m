Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0982F5709
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 02:59:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbhANB6N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 20:58:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729566AbhAMXnV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 18:43:21 -0500
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3102FC061575
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 15:42:29 -0800 (PST)
Received: by mail-qk1-x74a.google.com with SMTP id l138so2895495qke.4
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 15:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=0r3B8eTwYCB8pf4+wZLM/Wl3Cy6lSUjOGNDawS3+VY4=;
        b=Bh9eyjD54vV5Bsh2jWYs8Y7YEJL3B7StYIBU5r057tJvx9Wn2tM8Bsymd8TK47yPGG
         OmqSjPEt4/0OpIdz5wSobGlJBKPHgONVRtISfOccETPpBUX7Pi0SD8XDZM8gT8WDGjev
         3lQzGR3XTS2COEcEEDymsM51e7NR08TIIva6jD9nZSc9QwZQmcs4JMMuGtDHPKCq5MiC
         fKU79hmLZfJZOpT5U3MVriY+rrtSCtSudwxpZN+EiuqtSAr6UQ3aesU5iS4s1ac4gQLy
         cw3z0LrLDdhZzhSvkmT2cNSfe8BfYYljfMO0DUsITq69f3UI5CTFRWnVTLExZU0kiVjo
         XBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=0r3B8eTwYCB8pf4+wZLM/Wl3Cy6lSUjOGNDawS3+VY4=;
        b=HCfXCOSdGcC8R6EKRk+/aOQnJ3oTZzngNQJB/2UUzIszZFHFE0iURXaXP6cYTvT36y
         +i4SLpfgXHc+Wj/2PZuA4J/ntmfqidz/ZLwDpMR+T3h2+fru2rYgbuMrwj16iDN1pKVE
         XqW/6BW4fx2o4Kg2onOl71pavJ+hhNzOMROMzhnDLG3ClgNQpR5UoWQo9gFEkIIX1Jdp
         aMMnT3M9cM5QkEHgJn3DDwGQ+X9zDv8RImFgVReKO+pFPZIE5PeXYi3/8QT7zc18E6QR
         O8m+4WA+/WmiWBxFTRVn0wYNKVZP6f4qNuSNe3CblcL2q8CSFgELRbBSxJQWXFnIcYUy
         Yh6g==
X-Gm-Message-State: AOAM532Sr3dD8oE+2WSDec7tufT2CCHtDRMS2KtzIABQ/07xmwwZbsC4
        d+3yT7CyosA8CRdqRwxchncSzlxKqVRglDukndtM3tcDxaV9PH4tZP1klPD2ZGQMPjjT9PR1g7X
        g8rHCSnJE+0fATsHHobVODh5bTbfbMwu6pWm24Lg6+HUnt8ecxktKQo7x0OOTNV639Ki6
X-Google-Smtp-Source: ABdhPJwTBwLyP0VRFm/UnMUEWnLqYIrY2dM3i4v/TsnxxnsoyzY4vdUJn2n62Z3VOPsZ5BYkcGeC1YdB7F1c
Sender: "lorenzo via sendgmr" <lorenzo@drone.tok.corp.google.com>
X-Received: from drone.tok.corp.google.com ([2401:fa00:8f:2:a6ae:11ff:fe18:6f64])
 (user=lorenzo job=sendgmr) by 2002:a25:5f06:: with SMTP id
 t6mr5887937ybb.136.1610581348272; Wed, 13 Jan 2021 15:42:28 -0800 (PST)
Date:   Thu, 14 Jan 2021 08:42:22 +0900
Message-Id: <20210113234222.3272933-1-lorenzo@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH v3] usb: gadget: u_ether: support configuring interface names.
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
 Documentation/usb/gadget-testing.rst          | 30 ++++++++---------
 drivers/usb/gadget/function/u_ether.c         | 33 ++++++++++++++++++-
 drivers/usb/gadget/function/u_ether.h         | 12 +++++++
 .../usb/gadget/function/u_ether_configfs.h    | 15 ++++++++-
 4 files changed, 73 insertions(+), 17 deletions(-)

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
index c019f2b0c0af..d1d044d9f859 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -80,6 +80,7 @@ struct eth_dev {
 
 	bool			zlp;
 	bool			no_skb_reserve;
+	bool			ifname_set;
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

