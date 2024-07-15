Return-Path: <linux-usb+bounces-12224-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87952931577
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 15:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8C17B21B63
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 13:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2FE18C351;
	Mon, 15 Jul 2024 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T60GL+qs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FA2172BA6
	for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 13:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721049114; cv=none; b=oMl8i7R7Jw4dRIMnbYwJdbsg2de2krI1c+mRg9GD7MJH1SmNYSNPbhZMIldD2CKzC6BtC/Te2CWOrK71cQ++HC5/+51ZfjfN1InEvp6ZjbpUr4XTtZgQ0mHkDW/aqe1NqBYzXui7uYw+X5lk3L/NIwZ0JLXtRj9D4TIAVvraM/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721049114; c=relaxed/simple;
	bh=w/7/9TTvagokP9jCmrheC/zWmi++jwech1MbOMghMSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bjm3CcINqHmBcbjGxP7jfXb0KC9bL4LaKFiptXzDmQNxIvDEQmd/a5u+5cpvWgzXzq6S6+yZbNSJ/w4l+VIEFYcANbsKhpnS/kkdkDE/6W3WZBlxgMuRyvEaIIM8yQJondRa2rPJbA2YafNiij3NG0/4Op4XfYw/6J2tdwqDfq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T60GL+qs; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a77c7d3e8bcso541039166b.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 06:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721049110; x=1721653910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0W0EZnbCTDfx8ue6jdJ/HJG+huwv9bMMjew4b0UU0A8=;
        b=T60GL+qsbJTCsPYMnEOblFMIEh2qBfSLlUYQ5alQJW4SxUin2oOPlGSslAhWNuNR5u
         pJTikGB9f5fFwzU7h5nLd/pcXKocyWuKuJvzwVCVFRQRUcMG7XgqgrVCKZcSONrX/Gqz
         IWSGIHGejLpRLoSxgkNvWMmOSKXscgdL6oZiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721049110; x=1721653910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0W0EZnbCTDfx8ue6jdJ/HJG+huwv9bMMjew4b0UU0A8=;
        b=m13iwYJzz6ES4k0wiiP5W3xFs2kDsKsZWCyAGwc7nF996tyPPIs8JPjHAOZQXAfC6I
         eAYJ/kwkXEoczaGxV7tebpRW/Sl7Ef4C73oxqdDmCg6ZfAoS/4eeSUevb1AWKkZBCL4g
         nN+N+DCjY7WhoFT4iLjWAr0H9CN5J0WI6QgmBSI41EsOF3DK0xANkMOsdcmZz9aJI6BE
         i3bQi4NCoelM0l5kk8eNnxT4xvWfxkbADchmamvZnOREKAGXHj03/vYINgJMTA3y3gEa
         FtdRUFmCtnmZHDhEixqWG7YlVS9ytq3lpYnN0a/KeE7x44JilFTSCK9Gmd7c5hIKZbbX
         sFTw==
X-Gm-Message-State: AOJu0Ywgw4bl0mzsqtQXM5WRnwalHAczFBtxSvcrWloJwmoIiUJpUio0
	p6TIWsX3kEc8KcMo8cZgS8BfVH2ropwgduDsDlqeFGVPggDD6O6LH0uNgCnY
X-Google-Smtp-Source: AGHT+IGnenYqNp8dLOVEBHndlO1qkSt5WHuyBSK7yob0HW9xjm2KHgHQheosrkDy24uL2ap1KYFAcw==
X-Received: by 2002:a17:906:6b01:b0:a77:dbf0:d29 with SMTP id a640c23a62f3a-a780b705373mr1156932166b.46.1721049109980;
        Mon, 15 Jul 2024 06:11:49 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b268a2948sm3346982a12.66.2024.07.15.06.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:11:49 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v2] usbip: Add USB_SPEED_SUPER_PLUS as valid arg
Date: Mon, 15 Jul 2024 13:11:30 +0000
Message-ID: <20240715131131.3876380-1-ukaszb@chromium.org>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add USB_SPEED_SUPER_PLUS as valid argument to allow
to attach USB SuperSpeed+ devices. Update speed of
virtual HC to SuperSpeed+ as well.

Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
Changes v2->v1:
- Updated virtual HC speed to SS+,
- Updated commit message.
---
 drivers/usb/usbip/vhci_hcd.c   | 36 +++++++++++++++++-----------------
 drivers/usb/usbip/vhci_sysfs.c |  3 ++-
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 82650c11e451..fff27c529513 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -372,7 +372,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		}
 		switch (wValue) {
 		case USB_PORT_FEAT_SUSPEND:
-			if (hcd->speed == HCD_USB3) {
+			if (hcd->speed >= HCD_USB3) {
 				pr_err(" ClearPortFeature: USB_PORT_FEAT_SUSPEND req not "
 				       "supported for USB 3.0 roothub\n");
 				goto error;
@@ -388,7 +388,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_POWER:
 			usbip_dbg_vhci_rh(
 				" ClearPortFeature: USB_PORT_FEAT_POWER\n");
-			if (hcd->speed == HCD_USB3)
+			if (hcd->speed >= HCD_USB3)
 				vhci_hcd->port_status[rhport] &= ~USB_SS_PORT_STAT_POWER;
 			else
 				vhci_hcd->port_status[rhport] &= ~USB_PORT_STAT_POWER;
@@ -404,19 +404,19 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		break;
 	case GetHubDescriptor:
 		usbip_dbg_vhci_rh(" GetHubDescriptor\n");
-		if (hcd->speed == HCD_USB3 &&
+		if (hcd->speed >= HCD_USB3 &&
 				(wLength < USB_DT_SS_HUB_SIZE ||
 				 wValue != (USB_DT_SS_HUB << 8))) {
 			pr_err("Wrong hub descriptor type for USB 3.0 roothub.\n");
 			goto error;
 		}
-		if (hcd->speed == HCD_USB3)
+		if (hcd->speed >= HCD_USB3)
 			ss_hub_descriptor((struct usb_hub_descriptor *) buf);
 		else
 			hub_descriptor((struct usb_hub_descriptor *) buf);
 		break;
 	case DeviceRequest | USB_REQ_GET_DESCRIPTOR:
-		if (hcd->speed != HCD_USB3)
+		if (hcd->speed < HCD_USB3)
 			goto error;
 
 		if ((wValue >> 8) != USB_DT_BOS)
@@ -503,7 +503,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_LINK_STATE:
 			usbip_dbg_vhci_rh(
 				" SetPortFeature: USB_PORT_FEAT_LINK_STATE\n");
-			if (hcd->speed != HCD_USB3) {
+			if (hcd->speed < HCD_USB3) {
 				pr_err("USB_PORT_FEAT_LINK_STATE req not "
 				       "supported for USB 2.0 roothub\n");
 				goto error;
@@ -521,7 +521,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			usbip_dbg_vhci_rh(
 				" SetPortFeature: USB_PORT_FEAT_U2_TIMEOUT\n");
 			/* TODO: add suspend/resume support! */
-			if (hcd->speed != HCD_USB3) {
+			if (hcd->speed < HCD_USB3) {
 				pr_err("USB_PORT_FEAT_U1/2_TIMEOUT req not "
 				       "supported for USB 2.0 roothub\n");
 				goto error;
@@ -531,7 +531,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			usbip_dbg_vhci_rh(
 				" SetPortFeature: USB_PORT_FEAT_SUSPEND\n");
 			/* Applicable only for USB2.0 hub */
-			if (hcd->speed == HCD_USB3) {
+			if (hcd->speed >= HCD_USB3) {
 				pr_err("USB_PORT_FEAT_SUSPEND req not "
 				       "supported for USB 3.0 roothub\n");
 				goto error;
@@ -551,7 +551,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				pr_err("invalid port number %d\n", wIndex);
 				goto error;
 			}
-			if (hcd->speed == HCD_USB3)
+			if (hcd->speed >= HCD_USB3)
 				vhci_hcd->port_status[rhport] |= USB_SS_PORT_STAT_POWER;
 			else
 				vhci_hcd->port_status[rhport] |= USB_PORT_STAT_POWER;
@@ -564,7 +564,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				goto error;
 			}
 			/* Applicable only for USB3.0 hub */
-			if (hcd->speed != HCD_USB3) {
+			if (hcd->speed < HCD_USB3) {
 				pr_err("USB_PORT_FEAT_BH_PORT_RESET req not "
 				       "supported for USB 2.0 roothub\n");
 				goto error;
@@ -578,7 +578,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				goto error;
 			}
 			/* if it's already enabled, disable */
-			if (hcd->speed == HCD_USB3) {
+			if (hcd->speed >= HCD_USB3) {
 				vhci_hcd->port_status[rhport] = 0;
 				vhci_hcd->port_status[rhport] =
 					(USB_SS_PORT_STAT_POWER |
@@ -602,7 +602,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			}
 			if (wValue >= 32)
 				goto error;
-			if (hcd->speed == HCD_USB3) {
+			if (hcd->speed >= HCD_USB3) {
 				if ((vhci_hcd->port_status[rhport] &
 				     USB_SS_PORT_STAT_POWER) != 0) {
 					vhci_hcd->port_status[rhport] |= (1 << wValue);
@@ -616,7 +616,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		break;
 	case GetPortErrorCount:
 		usbip_dbg_vhci_rh(" GetPortErrorCount\n");
-		if (hcd->speed != HCD_USB3) {
+		if (hcd->speed < HCD_USB3) {
 			pr_err("GetPortErrorCount req not "
 			       "supported for USB 2.0 roothub\n");
 			goto error;
@@ -626,7 +626,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		break;
 	case SetHubDepth:
 		usbip_dbg_vhci_rh(" SetHubDepth\n");
-		if (hcd->speed != HCD_USB3) {
+		if (hcd->speed < HCD_USB3) {
 			pr_err("SetHubDepth req not supported for "
 			       "USB 2.0 roothub\n");
 			goto error;
@@ -646,7 +646,7 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		if (!invalid_rhport) {
 			dump_port_status_diff(prev_port_status[rhport],
 					      vhci_hcd->port_status[rhport],
-					      hcd->speed == HCD_USB3);
+					      hcd->speed >= HCD_USB3);
 		}
 	}
 	usbip_dbg_vhci_rh(" bye\n");
@@ -1154,8 +1154,8 @@ static int vhci_setup(struct usb_hcd *hcd)
 	} else {
 		vhci->vhci_hcd_ss = hcd_to_vhci_hcd(hcd);
 		vhci->vhci_hcd_ss->vhci = vhci;
-		hcd->speed = HCD_USB3;
-		hcd->self.root_hub->speed = USB_SPEED_SUPER;
+		hcd->speed = HCD_USB31;
+		hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
 	}
 
 	/*
@@ -1316,7 +1316,7 @@ static const struct hc_driver vhci_hc_driver = {
 	.product_desc	= driver_desc,
 	.hcd_priv_size	= sizeof(struct vhci_hcd),
 
-	.flags		= HCD_USB3 | HCD_SHARED,
+	.flags		= HCD_USB31 | HCD_SHARED,
 
 	.reset		= vhci_setup,
 	.start		= vhci_start,
diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index e2847cd3e6e3..d5865460e82d 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -283,6 +283,7 @@ static int valid_args(__u32 *pdev_nr, __u32 *rhport,
 	case USB_SPEED_HIGH:
 	case USB_SPEED_WIRELESS:
 	case USB_SPEED_SUPER:
+	case USB_SPEED_SUPER_PLUS:
 		break;
 	default:
 		pr_err("Failed attach request for unsupported USB speed: %s\n",
@@ -349,7 +350,7 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 	vhci_hcd = hcd_to_vhci_hcd(hcd);
 	vhci = vhci_hcd->vhci;
 
-	if (speed == USB_SPEED_SUPER)
+	if (speed >= USB_SPEED_SUPER)
 		vdev = &vhci->vhci_hcd_ss->vdev[rhport];
 	else
 		vdev = &vhci->vhci_hcd_hs->vdev[rhport];
-- 
2.45.2.993.g49e7a77208-goog


