Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF11B2758F4
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 15:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgIWNoS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 09:44:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:33228 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726559AbgIWNoR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 09:44:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600868655;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=zaFxZgwCHaNkcErl7geMWUuzHB8/NPepO7loIcMVOeU=;
        b=OZslMne+vGrN9lht64ypJ3t/dQK5Tgbw5fo45hmwfZYGm7E3qcA+rvrkF+/AGbIalzLokk
        bypO2IQpONYqA+DN5My7mAOKZsnNEh00R/uGCxkxWwoNvs7fYvKkbyfwVobCahtABNOMdD
        Njd+lXZTCYhV+ZBLldxLDZdER+g+yGQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 368B0AD2C;
        Wed, 23 Sep 2020 13:44:53 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     himadrispandya@gmail.com, gregKH@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 02/14] Revert "Bluetooth: ath3k: use usb_control_msg_send() and usb_control_msg_recv()"
Date:   Wed, 23 Sep 2020 15:43:36 +0200
Message-Id: <20200923134348.23862-3-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200923134348.23862-1-oneukum@suse.com>
References: <20200923134348.23862-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit e9b20f0fe17ab06c3b55153046209987749daa48.
The API has to be changed

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/bluetooth/ath3k.c | 90 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 64 insertions(+), 26 deletions(-)

diff --git a/drivers/bluetooth/ath3k.c b/drivers/bluetooth/ath3k.c
index 1472cccfd0b3..4ce270513695 100644
--- a/drivers/bluetooth/ath3k.c
+++ b/drivers/bluetooth/ath3k.c
@@ -212,16 +212,19 @@ static int ath3k_load_firmware(struct usb_device *udev,
 
 	BT_DBG("udev %p", udev);
 
+	pipe = usb_sndctrlpipe(udev, 0);
+
 	send_buf = kmalloc(BULK_SIZE, GFP_KERNEL);
 	if (!send_buf) {
 		BT_ERR("Can't allocate memory chunk for firmware");
 		return -ENOMEM;
 	}
 
-	err = usb_control_msg_send(udev, 0, USB_REQ_DFU_DNLOAD, USB_TYPE_VENDOR,
-				   0, 0, firmware->data, FW_HDR_SIZE,
-				   USB_CTRL_SET_TIMEOUT);
-	if (err) {
+	memcpy(send_buf, firmware->data, FW_HDR_SIZE);
+	err = usb_control_msg(udev, pipe, USB_REQ_DFU_DNLOAD, USB_TYPE_VENDOR,
+			      0, 0, send_buf, FW_HDR_SIZE,
+			      USB_CTRL_SET_TIMEOUT);
+	if (err < 0) {
 		BT_ERR("Can't change to loading configuration err");
 		goto error;
 	}
@@ -256,17 +259,44 @@ static int ath3k_load_firmware(struct usb_device *udev,
 
 static int ath3k_get_state(struct usb_device *udev, unsigned char *state)
 {
-	return usb_control_msg_recv(udev, 0, ATH3K_GETSTATE,
-				    USB_TYPE_VENDOR | USB_DIR_IN, 0, 0,
-				    state, 1, USB_CTRL_SET_TIMEOUT);
+	int ret, pipe = 0;
+	char *buf;
+
+	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	pipe = usb_rcvctrlpipe(udev, 0);
+	ret = usb_control_msg(udev, pipe, ATH3K_GETSTATE,
+			      USB_TYPE_VENDOR | USB_DIR_IN, 0, 0,
+			      buf, sizeof(*buf), USB_CTRL_SET_TIMEOUT);
+
+	*state = *buf;
+	kfree(buf);
+
+	return ret;
 }
 
 static int ath3k_get_version(struct usb_device *udev,
 			struct ath3k_version *version)
 {
-	return usb_control_msg_recv(udev, 0, ATH3K_GETVERSION,
-				    USB_TYPE_VENDOR | USB_DIR_IN, 0, 0,
-				    version, sizeof(*version), USB_CTRL_SET_TIMEOUT);
+	int ret, pipe = 0;
+	struct ath3k_version *buf;
+	const int size = sizeof(*buf);
+
+	buf = kmalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	pipe = usb_rcvctrlpipe(udev, 0);
+	ret = usb_control_msg(udev, pipe, ATH3K_GETVERSION,
+			      USB_TYPE_VENDOR | USB_DIR_IN, 0, 0,
+			      buf, size, USB_CTRL_SET_TIMEOUT);
+
+	memcpy(version, buf, size);
+	kfree(buf);
+
+	return ret;
 }
 
 static int ath3k_load_fwfile(struct usb_device *udev,
@@ -286,10 +316,13 @@ static int ath3k_load_fwfile(struct usb_device *udev,
 	}
 
 	size = min_t(uint, count, FW_HDR_SIZE);
+	memcpy(send_buf, firmware->data, size);
 
-	ret = usb_control_msg_send(udev, 0, ATH3K_DNLOAD, USB_TYPE_VENDOR, 0, 0,
-				   firmware->data, size, USB_CTRL_SET_TIMEOUT);
-	if (ret) {
+	pipe = usb_sndctrlpipe(udev, 0);
+	ret = usb_control_msg(udev, pipe, ATH3K_DNLOAD,
+			USB_TYPE_VENDOR, 0, 0, send_buf,
+			size, USB_CTRL_SET_TIMEOUT);
+	if (ret < 0) {
 		BT_ERR("Can't change to loading configuration err");
 		kfree(send_buf);
 		return ret;
@@ -322,19 +355,23 @@ static int ath3k_load_fwfile(struct usb_device *udev,
 	return 0;
 }
 
-static void ath3k_switch_pid(struct usb_device *udev)
+static int ath3k_switch_pid(struct usb_device *udev)
 {
-	usb_control_msg_send(udev, 0, USB_REG_SWITCH_VID_PID, USB_TYPE_VENDOR,
-			     0, 0, NULL, 0, USB_CTRL_SET_TIMEOUT);
+	int pipe = 0;
+
+	pipe = usb_sndctrlpipe(udev, 0);
+	return usb_control_msg(udev, pipe, USB_REG_SWITCH_VID_PID,
+			USB_TYPE_VENDOR, 0, 0,
+			NULL, 0, USB_CTRL_SET_TIMEOUT);
 }
 
 static int ath3k_set_normal_mode(struct usb_device *udev)
 {
 	unsigned char fw_state;
-	int ret;
+	int pipe = 0, ret;
 
 	ret = ath3k_get_state(udev, &fw_state);
-	if (ret) {
+	if (ret < 0) {
 		BT_ERR("Can't get state to change to normal mode err");
 		return ret;
 	}
@@ -344,9 +381,10 @@ static int ath3k_set_normal_mode(struct usb_device *udev)
 		return 0;
 	}
 
-	return usb_control_msg_send(udev, 0, ATH3K_SET_NORMAL_MODE,
-				    USB_TYPE_VENDOR, 0, 0, NULL, 0,
-				    USB_CTRL_SET_TIMEOUT);
+	pipe = usb_sndctrlpipe(udev, 0);
+	return usb_control_msg(udev, pipe, ATH3K_SET_NORMAL_MODE,
+			USB_TYPE_VENDOR, 0, 0,
+			NULL, 0, USB_CTRL_SET_TIMEOUT);
 }
 
 static int ath3k_load_patch(struct usb_device *udev)
@@ -359,7 +397,7 @@ static int ath3k_load_patch(struct usb_device *udev)
 	int ret;
 
 	ret = ath3k_get_state(udev, &fw_state);
-	if (ret) {
+	if (ret < 0) {
 		BT_ERR("Can't get state to change to load ram patch err");
 		return ret;
 	}
@@ -370,7 +408,7 @@ static int ath3k_load_patch(struct usb_device *udev)
 	}
 
 	ret = ath3k_get_version(udev, &fw_version);
-	if (ret) {
+	if (ret < 0) {
 		BT_ERR("Can't get version to change to load ram patch err");
 		return ret;
 	}
@@ -411,13 +449,13 @@ static int ath3k_load_syscfg(struct usb_device *udev)
 	int clk_value, ret;
 
 	ret = ath3k_get_state(udev, &fw_state);
-	if (ret) {
+	if (ret < 0) {
 		BT_ERR("Can't get state to change to load configuration err");
 		return -EBUSY;
 	}
 
 	ret = ath3k_get_version(udev, &fw_version);
-	if (ret) {
+	if (ret < 0) {
 		BT_ERR("Can't get version to change to load ram patch err");
 		return ret;
 	}
@@ -491,7 +529,7 @@ static int ath3k_probe(struct usb_interface *intf,
 			return ret;
 		}
 		ret = ath3k_set_normal_mode(udev);
-		if (ret) {
+		if (ret < 0) {
 			BT_ERR("Set normal mode failed");
 			return ret;
 		}
-- 
2.16.4

