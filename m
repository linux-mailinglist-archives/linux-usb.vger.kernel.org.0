Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A9B2758FB
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 15:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgIWNoX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 09:44:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:33570 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726665AbgIWNoV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 09:44:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600868658;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=yCv7WrZYb36PkOKNs7Oi8LaBe0UGsPc0LZvsDneuTrk=;
        b=cU22vL/X68Oa+VDQljgW/rqUvh+/xB02xswZaSpuYCvpsk2nnaU8fDtSWHSUXstSXslwP+
        pAl2KhiS8aq/jVoM6U7EnEl0wEhjitNS5wUw6JcomOn/93OUB5KMDK+PuuRV+6AWyTTkBT
        FITsjiGLqavWUhAJ9uB6g0dutQmjRlE=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 09617ADBB;
        Wed, 23 Sep 2020 13:44:56 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     himadrispandya@gmail.com, gregKH@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Subject: [RFC 14/14] Bluetooth: ath3k: use usb_control_msg_send() and usb_control_msg_recv()
Date:   Wed, 23 Sep 2020 15:43:48 +0200
Message-Id: <20200923134348.23862-15-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200923134348.23862-1-oneukum@suse.com>
References: <20200923134348.23862-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

The usb_control_msg_send() and usb_control_msg_recv() calls can return
an error if a "short" write/read happens, and they can handle data off
of the stack, so move the driver over to using those calls instead,
saving some logic when dynamically allocating memory.

v2: changed API of use usb_control_msg_send() and usb_control_msg_recv()

Cc: Marcel Holtmann <marcel@holtmann.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>
Link: https://lore.kernel.org/r/20200914153756.3412156-11-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/bluetooth/ath3k.c | 93 +++++++++++++++--------------------------------
 1 file changed, 29 insertions(+), 64 deletions(-)

diff --git a/drivers/bluetooth/ath3k.c b/drivers/bluetooth/ath3k.c
index 4ce270513695..759d7828931d 100644
--- a/drivers/bluetooth/ath3k.c
+++ b/drivers/bluetooth/ath3k.c
@@ -212,19 +212,16 @@ static int ath3k_load_firmware(struct usb_device *udev,
 
 	BT_DBG("udev %p", udev);
 
-	pipe = usb_sndctrlpipe(udev, 0);
-
 	send_buf = kmalloc(BULK_SIZE, GFP_KERNEL);
 	if (!send_buf) {
 		BT_ERR("Can't allocate memory chunk for firmware");
 		return -ENOMEM;
 	}
 
-	memcpy(send_buf, firmware->data, FW_HDR_SIZE);
-	err = usb_control_msg(udev, pipe, USB_REQ_DFU_DNLOAD, USB_TYPE_VENDOR,
-			      0, 0, send_buf, FW_HDR_SIZE,
-			      USB_CTRL_SET_TIMEOUT);
-	if (err < 0) {
+	err = usb_control_msg_send(udev, 0, USB_REQ_DFU_DNLOAD, USB_TYPE_VENDOR,
+				   0, 0, firmware->data, FW_HDR_SIZE,
+				   USB_CTRL_SET_TIMEOUT, GFP_KERNEL);
+	if (err) {
 		BT_ERR("Can't change to loading configuration err");
 		goto error;
 	}
@@ -259,44 +256,19 @@ static int ath3k_load_firmware(struct usb_device *udev,
 
 static int ath3k_get_state(struct usb_device *udev, unsigned char *state)
 {
-	int ret, pipe = 0;
-	char *buf;
-
-	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	pipe = usb_rcvctrlpipe(udev, 0);
-	ret = usb_control_msg(udev, pipe, ATH3K_GETSTATE,
-			      USB_TYPE_VENDOR | USB_DIR_IN, 0, 0,
-			      buf, sizeof(*buf), USB_CTRL_SET_TIMEOUT);
-
-	*state = *buf;
-	kfree(buf);
-
-	return ret;
+	return usb_control_msg_recv(udev, 0, ATH3K_GETSTATE,
+				    USB_TYPE_VENDOR | USB_DIR_IN, 0, 0,
+				    state, 1, USB_CTRL_SET_TIMEOUT,
+				    GFP_KERNEL);
 }
 
 static int ath3k_get_version(struct usb_device *udev,
 			struct ath3k_version *version)
 {
-	int ret, pipe = 0;
-	struct ath3k_version *buf;
-	const int size = sizeof(*buf);
-
-	buf = kmalloc(size, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	pipe = usb_rcvctrlpipe(udev, 0);
-	ret = usb_control_msg(udev, pipe, ATH3K_GETVERSION,
-			      USB_TYPE_VENDOR | USB_DIR_IN, 0, 0,
-			      buf, size, USB_CTRL_SET_TIMEOUT);
-
-	memcpy(version, buf, size);
-	kfree(buf);
-
-	return ret;
+	return usb_control_msg_recv(udev, 0, ATH3K_GETVERSION,
+				    USB_TYPE_VENDOR | USB_DIR_IN, 0, 0,
+				    version, sizeof(*version), USB_CTRL_SET_TIMEOUT,
+				    GFP_KERNEL);
 }
 
 static int ath3k_load_fwfile(struct usb_device *udev,
@@ -316,13 +288,11 @@ static int ath3k_load_fwfile(struct usb_device *udev,
 	}
 
 	size = min_t(uint, count, FW_HDR_SIZE);
-	memcpy(send_buf, firmware->data, size);
 
-	pipe = usb_sndctrlpipe(udev, 0);
-	ret = usb_control_msg(udev, pipe, ATH3K_DNLOAD,
-			USB_TYPE_VENDOR, 0, 0, send_buf,
-			size, USB_CTRL_SET_TIMEOUT);
-	if (ret < 0) {
+	ret = usb_control_msg_send(udev, 0, ATH3K_DNLOAD, USB_TYPE_VENDOR, 0, 0,
+				   firmware->data, size, USB_CTRL_SET_TIMEOUT,
+				   GFP_KERNEL);
+	if (ret) {
 		BT_ERR("Can't change to loading configuration err");
 		kfree(send_buf);
 		return ret;
@@ -355,23 +325,19 @@ static int ath3k_load_fwfile(struct usb_device *udev,
 	return 0;
 }
 
-static int ath3k_switch_pid(struct usb_device *udev)
+static void ath3k_switch_pid(struct usb_device *udev)
 {
-	int pipe = 0;
-
-	pipe = usb_sndctrlpipe(udev, 0);
-	return usb_control_msg(udev, pipe, USB_REG_SWITCH_VID_PID,
-			USB_TYPE_VENDOR, 0, 0,
-			NULL, 0, USB_CTRL_SET_TIMEOUT);
+	usb_control_msg_send(udev, 0, USB_REG_SWITCH_VID_PID, USB_TYPE_VENDOR,
+			     0, 0, NULL, 0, USB_CTRL_SET_TIMEOUT, GFP_KERNEL);
 }
 
 static int ath3k_set_normal_mode(struct usb_device *udev)
 {
 	unsigned char fw_state;
-	int pipe = 0, ret;
+	int ret;
 
 	ret = ath3k_get_state(udev, &fw_state);
-	if (ret < 0) {
+	if (ret) {
 		BT_ERR("Can't get state to change to normal mode err");
 		return ret;
 	}
@@ -381,10 +347,9 @@ static int ath3k_set_normal_mode(struct usb_device *udev)
 		return 0;
 	}
 
-	pipe = usb_sndctrlpipe(udev, 0);
-	return usb_control_msg(udev, pipe, ATH3K_SET_NORMAL_MODE,
-			USB_TYPE_VENDOR, 0, 0,
-			NULL, 0, USB_CTRL_SET_TIMEOUT);
+	return usb_control_msg_send(udev, 0, ATH3K_SET_NORMAL_MODE,
+				    USB_TYPE_VENDOR, 0, 0, NULL, 0,
+				    USB_CTRL_SET_TIMEOUT, GFP_KERNEL);
 }
 
 static int ath3k_load_patch(struct usb_device *udev)
@@ -397,7 +362,7 @@ static int ath3k_load_patch(struct usb_device *udev)
 	int ret;
 
 	ret = ath3k_get_state(udev, &fw_state);
-	if (ret < 0) {
+	if (ret) {
 		BT_ERR("Can't get state to change to load ram patch err");
 		return ret;
 	}
@@ -408,7 +373,7 @@ static int ath3k_load_patch(struct usb_device *udev)
 	}
 
 	ret = ath3k_get_version(udev, &fw_version);
-	if (ret < 0) {
+	if (ret) {
 		BT_ERR("Can't get version to change to load ram patch err");
 		return ret;
 	}
@@ -449,13 +414,13 @@ static int ath3k_load_syscfg(struct usb_device *udev)
 	int clk_value, ret;
 
 	ret = ath3k_get_state(udev, &fw_state);
-	if (ret < 0) {
+	if (ret) {
 		BT_ERR("Can't get state to change to load configuration err");
 		return -EBUSY;
 	}
 
 	ret = ath3k_get_version(udev, &fw_version);
-	if (ret < 0) {
+	if (ret) {
 		BT_ERR("Can't get version to change to load ram patch err");
 		return ret;
 	}
@@ -529,7 +494,7 @@ static int ath3k_probe(struct usb_interface *intf,
 			return ret;
 		}
 		ret = ath3k_set_normal_mode(udev);
-		if (ret < 0) {
+		if (ret) {
 			BT_ERR("Set normal mode failed");
 			return ret;
 		}
-- 
2.16.4

