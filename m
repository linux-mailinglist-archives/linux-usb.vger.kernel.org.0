Return-Path: <linux-usb+bounces-34871-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OqrAWYIuGkWYQEAu9opvQ
	(envelope-from <linux-usb+bounces-34871-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 14:40:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7940D29A9DD
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 14:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 987D6305019E
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 13:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E3B39B979;
	Mon, 16 Mar 2026 13:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OiceH/G3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0063739A078
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668092; cv=none; b=ZlZDdq131ABiSnXtTOmzJNAOIHj4dssUNEF2Ot7/EpyedEWHAqwlEn03al/v/y/rDq94dvLa3aCoAsBdFEf798G+pcnRyJDdd4TMU3gcQfjICjVC3FWfzYUMl7nwXICYeoa8KYnUij/zpghz47tfd8IiP99moL8DTugVvdk/z8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668092; c=relaxed/simple;
	bh=ZqtbkN9X0RvpKTXiACrFylvAxPZu6LxQ+9wsTyXgq08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kaey7bHTIb5OzgixJV66UkbN2zmJ5pwun0VJZwAm++4YB9zhVhGIcaPji1OWbW6ojM0r3BQ6Ar+rsjlpEl7BRMsrKPh9J6xtINt9mU3R7i0MwuPNkCrDNpyupslv2yI9UOzvJ8AeqlhMN0i+eZLYN+RTo4FGKiSbiXmFEnkI7bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OiceH/G3; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a13a06fc85so5378581e87.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 06:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773668089; x=1774272889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bVigAWa0kFOUeMtknvqHxM/1nuFW2KCUzcM3K92o58=;
        b=OiceH/G3ab3NHy4p9dksCLz87q+QYv+FiEsntgzWKueMN5vYbyP9orrP9UX2Xzto0u
         LDoVdTrPD9WdPgiscOumwGAW8wmTPpwM8t2Mmy1IRQLVP3iR0TcfFxvibHh+wdO4PjFn
         r3qFu2eI1CszRbOqG6Cx3dhTnfug9ZbmS3SsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773668089; x=1774272889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6bVigAWa0kFOUeMtknvqHxM/1nuFW2KCUzcM3K92o58=;
        b=Op1P+KBbDOLOW5w5Lg6iJvOAtShP5JjrWzQqFxEsT/zZChJ4/OjtGCxOh3xC+KR5tX
         FrKEKQFKdhyPenyGZUhzIlhwA/KGd8FSumcMrcuKGavM8f8g1CO8gsxXNb2H+sjWV7ph
         IsYMYbO+x4YkTgj245CqZipbWBGBrL/OxFuEkTo1tDtJu2iGilRNX9u0kdEbMcs6hMOo
         QIuTTT6pGnE0a1r2K3/7osMv7wc2esoHYxBXbZ9eYKwfviNPdHdVhg6w8/z4Hz6DcFvR
         RIePQeNB2uA2IBksM0K/g/uj3tRxVoF8H7+aNKr1BKLtToDUKquRtTQtiSNn4eHSUvom
         QmAA==
X-Forwarded-Encrypted: i=1; AJvYcCWWn7cVNsDZTKjJ3iDjjbmuNAfi3reEtVUkUjGCRYy0IoMr8Kqvg+MXTPB+hzwK3OW7ZKNRwe0fCRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlVbgvtr7Xr+QDpEERQfAycQPkK1Qsx6TPhrZavz5xq0exs06G
	vtYTOnVQ/AnxsU0Uvujvjkg67KHruJWAE/zwmA7M/03+yY9zBMxvIIvc7uiAJ8mUeQ==
X-Gm-Gg: ATEYQzwyvxIwsu2Nl8hwD/3v2YFa63T3NOF7ONQg6HA/78VhhwhWNIzv/QoLrWW2DMS
	15drex7oXcfP1mLr2lsgDNkJ66BnZly68gpChFwEUjWn19fRUGI/jveJ/bmF+5G0NSoCIe2vW63
	0cK6/GoK5XSmK/W7NwE3pUqJcW8sUcvoZXQ4cLbgMCDpkm4gCgoyY9ZEMK/3mJZO8rmB6+hlwek
	g9hm0+JK5llQbPRthM5bG2ryunX2T/zIflx6T+JnuoAm+ZytrhwziZIIf8miC84ODSrMSrhMdBJ
	V/ByphtNMXu5VTmWBek9b/LJhDVOhHCDlVIHoKtegKRCIsOYjVTTBDYOlJjsqWh6+gisulomGPg
	qxz2/bH6KDCYZm1h/7TvzgnI9J/+9p3Q9wOcJFibvc2u0U4n5QaCwoFRvXvoIFN1XTZHbDmFfp4
	3SuzlIVtFVjq/EnCaOINGyL2w8S8mmzrac6J55xbLTfAqZDeLYWPDnHQWY1+Loz2qdHGl8gHcL6
	g==
X-Received: by 2002:ac2:50a5:0:b0:5a1:1496:920 with SMTP id 2adb3069b0e04-5a162b124bamr3566254e87.26.1773668089070;
        Mon, 16 Mar 2026 06:34:49 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a7fsm3481473e87.76.2026.03.16.06.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:34:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Mar 2026 13:34:46 +0000
Subject: [PATCH v3 3/4] media: uvcvideo: Introduce allow_privacy_override
 module parameter
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org>
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
In-Reply-To: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34871-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-usb@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7940D29A9DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some camera modules have XU controls that can configure the behaviour of
the privacy LED.

Block mapping of those controls, unless the module is configured with
a new parameter: allow_privacy_override.

This is just an interim solution. Based on the users feedback, we will
either put the privacy controls behind a CONFIG option, or completely
block them.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 38 ++++++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_driver.c | 20 ++++++++++++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c   |  7 +++++++
 drivers/media/usb/uvc/uvcvideo.h   |  2 ++
 include/linux/usb/uvc.h            |  4 ++++
 5 files changed, 71 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b6e020b41671..3ca108b83f1d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -3001,6 +3001,35 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
 	return ret;
 }
 
+bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector)
+{
+	/*
+	 * This list is not exhaustive, it is a best effort to block access to
+	 * non documented controls that can affect user's privacy.
+	 */
+	struct privacy_control {
+		u8 entity[16];
+		u8 selector;
+	} privacy_control[] = {
+		{
+			.entity = UVC_GUID_LOGITECH_USER_HW_CONTROL_V1,
+			.selector = 1,
+		},
+		{
+			.entity = UVC_GUID_LOGITECH_PERIPHERAL,
+			.selector = 9,
+		},
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(privacy_control); i++)
+		if (!memcmp(entity, privacy_control[i].entity, 16) &&
+		    selector == privacy_control[i].selector)
+			return true;
+
+	return false;
+}
+
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 	struct uvc_xu_control_query *xqry)
 {
@@ -3045,6 +3074,15 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		return -ENOENT;
 	}
 
+	if (uvc_ctrl_is_privacy_control(entity->guid, xqry->selector) &&
+	    !uvc_allow_privacy_override_param) {
+		dev_warn_once(&chain->dev->intf->dev,
+			      "Privacy related controls can only be accessed if module parameter allow_privacy_override is true\n");
+		uvc_dbg(chain->dev, CONTROL, "Blocking access to privacy related Control %pUl/%u\n",
+			entity->guid, xqry->selector);
+		return -EACCES;
+	}
+
 	if (mutex_lock_interruptible(&chain->ctrl_mutex))
 		return -ERESTARTSYS;
 
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index b0ca81d924b6..74c9dea29d36 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -36,6 +36,7 @@ unsigned int uvc_no_drop_param = 1;
 static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
+bool uvc_allow_privacy_override_param;
 
 static struct usb_driver uvc_driver;
 
@@ -2505,6 +2506,25 @@ MODULE_PARM_DESC(trace, "Trace level bitmask");
 module_param_named(timeout, uvc_timeout_param, uint, 0644);
 MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
 
+static int param_set_privacy(const char *val, const struct kernel_param *kp)
+{
+	pr_warn_once("uvcvideo: " DEPRECATED
+		     "allow_privacy_override parameter will be eventually removed.\n");
+	return param_set_bool(val, kp);
+}
+
+static const struct kernel_param_ops param_ops_privacy = {
+	.set = param_set_privacy,
+	.get = param_get_bool,
+};
+
+param_check_bool(allow_privacy_override, &uvc_allow_privacy_override_param);
+module_param_cb(allow_privacy_override, &param_ops_privacy,
+		&uvc_allow_privacy_override_param, 0644);
+__MODULE_PARM_TYPE(allow_privacy_override, "bool");
+MODULE_PARM_DESC(allow_privacy_override,
+		 "Allow access to privacy related controls");
+
 /* ------------------------------------------------------------------------
  * Driver initialization and cleanup
  */
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index f9049e9c0d3a..6d4f027c8402 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -133,6 +133,13 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 		return -EINVAL;
 	}
 
+	if (uvc_ctrl_is_privacy_control(xmap->entity, xmap->selector) &&
+	    !uvc_allow_privacy_override_param) {
+		dev_warn_once(&chain->dev->intf->dev,
+			      "Privacy related controls can only be mapped if module parameter allow_privacy_override is true\n");
+		return -EACCES;
+	}
+
 	map = kzalloc_obj(*map);
 	if (map == NULL)
 		return -ENOMEM;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 8480d65ecb85..362110d58ca3 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -664,6 +664,7 @@ extern unsigned int uvc_no_drop_param;
 extern unsigned int uvc_dbg_param;
 extern unsigned int uvc_timeout_param;
 extern unsigned int uvc_hw_timestamps_param;
+extern bool uvc_allow_privacy_override_param;
 
 #define uvc_dbg(_dev, flag, fmt, ...)					\
 do {									\
@@ -794,6 +795,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);
 
 void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
+bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector);
 
 /* Utility functions */
 struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index dea23aabbad4..70c2a7d25236 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -49,6 +49,10 @@
 #define UVC_GUID_LOGITECH_PERIPHERAL \
 	{0x21, 0x2d, 0xe5, 0xff, 0x30, 0x80, 0x2c, 0x4e, \
 	 0x82, 0xd9, 0xf5, 0x87, 0xd0, 0x05, 0x40, 0xbd }
+#define UVC_GUID_LOGITECH_USER_HW_CONTROL_V1 \
+	{0x82, 0x06, 0x61, 0x63, 0x70, 0x50, 0xab, 0x49, \
+	 0xb8, 0xcc, 0xb3, 0x85, 0x5e, 0x8d, 0x22, 0x1f }
+
 
 /* https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls */
 #define UVC_MSXU_CONTROL_FOCUS			0x01

-- 
2.53.0.851.ga537e3e6e9-goog


