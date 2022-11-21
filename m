Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2416319B1
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 07:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiKUGVQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 01:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiKUGVP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 01:21:15 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4B329C9B
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 22:21:14 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id b11so9568467pjp.2
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 22:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L7+eqek/E/WnqdTO067PuTCEyXCliseIp9lN/F5T2O4=;
        b=ZKk0StmpbeGK016qCI8yukcq0kjSwsVRgEDhsd3qv/+fSh5pCk+JobvB0b3YXjtCVl
         awhHREbDL+19v+bGncU+okf+vipgkMWoxkFaMAH8xgRpXQ2XDk3fo0AAFZI9WEsOS6ZO
         rOIMdMWmO7sYarTeLF7+IhqjMe3EMj4H4bzuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7+eqek/E/WnqdTO067PuTCEyXCliseIp9lN/F5T2O4=;
        b=Np/8Ft3pg7provFcLZni/flOaFUnxd1vxhV10ILIE0tFWqMTvuB6mnITCGOM0ipGa9
         Pnnp9Q66GfZMbHG23DtOFCxss6KO2twJvAQpzPr6aV6+gVYb2VM04YEw6T6GTCSa6+nI
         kbDgnbzkK3+Zxis9pm1J4p+v60DNlNE/KqBckkeT0PgXUM6Rgw+7IU3NpYZj6UTqhejm
         Vb8wtBeZnBxx2utFNXf6LFuvtQbMp1+iYNOcAJR56L8SJSH7pWDbNv3b7NpYZafK13gL
         yiaoV2MrnYLXeyj9Ms8ukSebMAIPLQIqHHTOoDWQDcmbuuo7nGxCufYcrc9F4YsM5+9g
         41DA==
X-Gm-Message-State: ANoB5pnAbX9DHHz04LX8Rz6F1PypfrKLJ0q1CPaOiYy6iGIUwLujCeRa
        7yMzA5oBZ54fxsHwstflowblGoFzIzGkBQ==
X-Google-Smtp-Source: AA0mqf41wGsKF+KvurHLgTWrzpNLuSkLYdFgJLDTYAoZT6VdvaoReQISDx5+eq3DZYIJB+B09WRmDA==
X-Received: by 2002:a17:90a:7004:b0:218:8757:8f2b with SMTP id f4-20020a17090a700400b0021887578f2bmr13906217pjk.221.1669011673897;
        Sun, 20 Nov 2022 22:21:13 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id p188-20020a625bc5000000b0056e32a2b88esm7672980pfb.219.2022.11.20.22.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 22:21:13 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Benson Leung <bleung@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: typec: pd: Add symlink to linked device
Date:   Mon, 21 Nov 2022 06:20:39 +0000
Message-Id: <20221121062106.2569297-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There exists a symlink from a device to its USB Power Delivery object,
but not the other way around. Add a symlink from the USB PD object to
the device which it's associated with, and call it "device".

This is helpful to identify said device (a Type-C peripheral for
example) during uevents, since during USB PD object
creation/destruction, a uevent is generated for the PD object,
but not the device linked to it.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Benson Leung <bleung@chromium.org>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 .../ABI/testing/sysfs-class-usb_power_delivery       |  6 ++++++
 drivers/usb/typec/pd.c                               | 12 ++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-usb_power_delivery b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
index ce2b1b563cb3..e7d19193875f 100644
--- a/Documentation/ABI/testing/sysfs-class-usb_power_delivery
+++ b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
@@ -4,6 +4,12 @@ Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
 		Directory for USB Power Delivery devices.
 
+What:		/sys/class/usb_power_delivery/.../device
+Date:		November 2022
+Contact:	Prashant Malani <pmalani@chromium.org>
+Description:
+		Symbolic link to the directory of the device to which the USB PD object is linked.
+
 What:		/sys/class/usb_power_delivery/.../revision
 Date:		May 2022
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
index dc72005d68db..ed073d922655 100644
--- a/drivers/usb/typec/pd.c
+++ b/drivers/usb/typec/pd.c
@@ -656,7 +656,8 @@ EXPORT_SYMBOL_GPL(usb_power_delivery_unregister);
  * @dev: The device.
  *
  * This function can be used to create a symlink named "usb_power_delivery" for
- * @dev that points to @pd.
+ * @dev that points to @pd. It also creates another symlink named "device" which
+ * points from @pd to @dev.
  */
 int usb_power_delivery_link_device(struct usb_power_delivery *pd, struct device *dev)
 {
@@ -669,6 +670,12 @@ int usb_power_delivery_link_device(struct usb_power_delivery *pd, struct device
 	if (ret)
 		return ret;
 
+	ret = sysfs_create_link(&pd->dev.kobj, &dev->kobj, "device");
+	if (ret) {
+		sysfs_remove_link(&dev->kobj, "usb_power_delivery");
+		return ret;
+	}
+
 	get_device(&pd->dev);
 	get_device(dev);
 
@@ -681,13 +688,14 @@ EXPORT_SYMBOL_GPL(usb_power_delivery_link_device);
  * @pd: The USB PD instance.
  * @dev: The device.
  *
- * Remove the symlink that was previously created with pd_link_device().
+ * Remove the symlinks that were previously created with pd_link_device().
  */
 void usb_power_delivery_unlink_device(struct usb_power_delivery *pd, struct device *dev)
 {
 	if (IS_ERR_OR_NULL(pd) || !dev)
 		return;
 
+	sysfs_remove_link(&pd->dev.kobj, "device");
 	sysfs_remove_link(&dev->kobj, "usb_power_delivery");
 	put_device(&pd->dev);
 	put_device(dev);
-- 
2.38.1.584.g0f3c55d4c2-goog

