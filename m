Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5CAEAB059
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2019 03:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404263AbfIFBsb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Sep 2019 21:48:31 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38120 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbfIFBsb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Sep 2019 21:48:31 -0400
Received: by mail-oi1-f195.google.com with SMTP id 7so3659135oip.5
        for <linux-usb@vger.kernel.org>; Thu, 05 Sep 2019 18:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=26NmWxoSiKiaWbVOpt4jWAHx5xteNn77h0vhjItrDwY=;
        b=UOI8KVcPB5qfWb4iSUli9QKiZgwydaLgmK1q2sVluF9Nz6rkZO4nCcnxzBw8Zr6Qeb
         y2jkMZRXedf3ww4FeI9eBICZNzKZDqpS2PsUCJz5ajGamqe0kqo3fOLL2Mb6QlsaoA5g
         Y15JbE3jJmRMhfj794WgXwavBmJVhaA7WlHDBpH84LLsi/skzpRYx0lMx5fwXNDYwMb1
         DtC5D8jkgEgHuRVfibu5iYpCjKrgXltOB0CW9mp4Kv+cGJ02oqK5nJywSQU+sYHeC1DJ
         K/IluVOh0P+d4sSfi4UKeGzRkYsziogkw9SAUeJZS5ZumM4MPLg2xWclDZ53ds2m1SLi
         hvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=26NmWxoSiKiaWbVOpt4jWAHx5xteNn77h0vhjItrDwY=;
        b=O7xj3x94hzy7oJi/r3Ki+4LmLlf0+TwXt6ZUk8B6wuh5Aq9xvsbVXRTj05wJG4aMR3
         QyZ9ueVLEL/evIrihlgn3zibMdzTWjK2AuPho/ON1fcz4dW4iLTbv5GqimnRGt7xyb8D
         TS9Sreo8ZyPlkHNyNOQ6B4/XVFbzSK+AyOWnm4/zkWWbaUQ9+HujkHxdHtifnBfmgFza
         3PWpxzrOC8wBRGRhEEsQ+ZHR/GnFp3+KHQjKk0yqsKD+Ghd0RV4OXNHM4Yt4vIuukmy6
         c55yLItWPypn3Q0+wmQ5WS2v3WJS9Odd3mxGHoFeiNHqeTCIoKorC/sD6IAjhn6X43w+
         RLaQ==
X-Gm-Message-State: APjAAAXUs8Igd1a9u4FnuZl8pf8Kn7zbKmYp4gVcrWnxclWuLvBlvT5R
        uFJEnQlIcp8d2sr0beet7Y8=
X-Google-Smtp-Source: APXvYqx7P2jSjE2Ad18QqLNoGEQYy7ZkfKxfBED3wWHz5Q9sUbFvmCaa1P5Y513FH/GXakVgVF1/Bg==
X-Received: by 2002:aca:4e85:: with SMTP id c127mr5149513oib.21.1567734510159;
        Thu, 05 Sep 2019 18:48:30 -0700 (PDT)
Received: from chip-MS-7B92.austin.rr.com ([2605:6000:f350:3e00:fc3b:b63b:919f:ceef])
        by smtp.gmail.com with ESMTPSA id b11sm1010049oib.3.2019.09.05.18.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 18:48:29 -0700 (PDT)
From:   Charles Hyde <chip.programmer@gmail.com>
To:     Charles Hyde <chip.programmer@gmail.com>
Cc:     Charles Hyde <charles.hyde@dellteam.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Oliver Neukum <oliver@neukum.org>, linux-usb@vger.kernel.org
Subject: [PATCH v3 1/3] net: cdc_ncm: add get/set ethernet address functions
Date:   Thu,  5 Sep 2019 20:48:25 -0500
Message-Id: <20190906014827.12666-2-chip.programmer@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906014827.12666-1-chip.programmer@gmail.com>
References: <20190906014827.12666-1-chip.programmer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds support for pushing a MAC address out to USB based
ethernet controllers driven by cdc_ncm.  With this change, ifconfig can
now set the device's MAC address.  For example, the Dell Universal Dock
D6000 is driven by cdc_ncm.  The D6000 can now have its MAC address set
by ifconfig, as it can be done in Windows.  This was tested with a D6000
using ifconfig on an x86 based chromebook, where iproute2 is not
available.

Signed-off-by: Charles Hyde <charles.hyde@dellteam.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Cc: chip.programmer@gmail.com
Cc: Oliver Neukum <oliver@neukum.org>
Cc: linux-usb@vger.kernel.org
---
 drivers/net/usb/cdc_ncm.c | 74 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 50c05d0f44cb..85093579612f 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -750,6 +750,78 @@ int cdc_ncm_change_mtu(struct net_device *net, int new_mtu)
 }
 EXPORT_SYMBOL_GPL(cdc_ncm_change_mtu);
 
+/* Provide method to get MAC address from the USB device's ethernet controller.
+ * If the device supports CDC_GET_ADDRESS, we should receive just six bytes.
+ * Otherwise, use the prior method by asking for the descriptor.
+ */
+static int cdc_ncm_get_ethernet_address(struct usbnet *dev,
+					struct cdc_ncm_ctx *ctx)
+{
+	int ret;
+	char *buf;
+
+	buf = kmalloc(ETH_ALEN, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = usbnet_read_cmd(dev, USB_CDC_GET_NET_ADDRESS,
+			      USB_DIR_IN | USB_TYPE_CLASS
+			      | USB_RECIP_INTERFACE, 0,
+			      USB_REQ_SET_ADDRESS, buf, ETH_ALEN);
+	if (ret == ETH_ALEN) {
+		memcpy(dev->net->dev_addr, buf, ETH_ALEN);
+		ret = 0;	/* success */
+	} else {
+		ret = usbnet_get_ethernet_addr(dev,
+					       ctx->ether_desc->iMACAddress);
+	}
+	kfree(buf);
+	return ret;
+}
+
+/* Provide method to push MAC address to the USB device's ethernet controller.
+ * If the device does not support CDC_SET_ADDRESS, there is no harm and we
+ * proceed as before.
+ */
+static int cdc_ncm_set_ethernet_address(struct usbnet *dev,
+					struct sockaddr *addr)
+{
+	int ret;
+	char *buf;
+
+	buf = kmalloc(ETH_ALEN, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	memcpy(buf, addr->sa_data, ETH_ALEN);
+	ret = usbnet_write_cmd(dev, USB_CDC_SET_NET_ADDRESS,
+			       USB_DIR_OUT | USB_TYPE_CLASS
+			       | USB_RECIP_INTERFACE, 0,
+			       USB_REQ_SET_ADDRESS, buf, ETH_ALEN);
+	if (ret == ETH_ALEN)
+		ret = 0;	/* success */
+	else if (ret < 0)
+		dev_dbg(&dev->udev->dev, "bad MAC address put, %d\n", ret);
+
+	kfree(buf);
+	return ret;
+}
+
+/* Provide method to push MAC address to the USB device's ethernet controller.
+ */
+int cdc_ncm_set_mac_addr(struct net_device *net, void *p)
+{
+	struct usbnet *dev = netdev_priv(net);
+
+	/* Try to push the MAC address out to the device.  Ignore any errors,
+	 * to be compatible with prior versions of this source.
+	 */
+	cdc_ncm_set_ethernet_address(dev, (struct sockaddr *)p);
+
+	return eth_mac_addr(net, p);
+}
+EXPORT_SYMBOL_GPL(cdc_ncm_set_mac_addr);
+
 static const struct net_device_ops cdc_ncm_netdev_ops = {
 	.ndo_open	     = usbnet_open,
 	.ndo_stop	     = usbnet_stop,
@@ -757,7 +829,7 @@ static const struct net_device_ops cdc_ncm_netdev_ops = {
 	.ndo_tx_timeout	     = usbnet_tx_timeout,
 	.ndo_get_stats64     = usbnet_get_stats64,
 	.ndo_change_mtu	     = cdc_ncm_change_mtu,
-	.ndo_set_mac_address = eth_mac_addr,
+	.ndo_set_mac_address = cdc_ncm_set_mac_addr,
 	.ndo_validate_addr   = eth_validate_addr,
 };
 
-- 
2.20.1

