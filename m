Return-Path: <linux-usb+bounces-36085-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEdPEGpZ12lqMwgAu9opvQ
	(envelope-from <linux-usb+bounces-36085-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 09:46:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D22213C7377
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 09:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8F773058541
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 07:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4573A3815C1;
	Thu,  9 Apr 2026 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="1JGBQGTh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D0437EFE3
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 07:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720664; cv=none; b=KY43M20sZca/8XTLIED9CrsN4+QVmRAIWkL8rkuQVRWvD7YBmxfNLWfa4efJGMvWNb0PjRT9L3/CknHWbYabY6O+UPNMYSFjSXlqDfZduFoeyIuqmGbLMhuT8OTZMFBO4OGhbq0IRAnDD1rQrlEIi7D66qEEjIUEgk/K30zfCyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720664; c=relaxed/simple;
	bh=3gkWGYY/8G6UESIXNgtwj4gwwYJPD/Hii3wbvUBRzuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gkcclHn/pFBQ54FydczgJM7UHfJ6UcEsCh/WuMbxIeiG1V58qzkRmhJWjF4RtNJJIIIGz/3HSG32IGpgjw3p32O6OJvM+iX84XlZT19/JUW4TrHQ0JPWq5oaz0/ay2h5PFEVkL0ZO8F0Jxe893Sj7nnqcEF842PM8B/T655wZcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=1JGBQGTh; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12732165d1eso9425150c88.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 00:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775720662; x=1776325462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNR3wJEnysPdwggyPnc9U2azcBoWvybE+2odZl1DK/8=;
        b=1JGBQGThUHLM1JOOsehJ1kIjyXULi9JPOqDS0BZCD2YzIFrAZ+eEYA25DduxkYPyyG
         Qi/VeZCzCXSJYFyJBIW6dT8VKUgLD+jqRxPjW9b8y1kgNfoZv1S5w7z4ffhUcq/QF+R/
         kHd+jKAE86WVMRGVOm6YHxcAd50GpVDDF0drJuiFJFOObmN3PY63re2g5ZvGdJI//RzZ
         TXiDu14tUNGYeD41Bke2pjYc17vsov+UdjAea16ptot04K0/B2970oz57od0t1T4HH7L
         A+SQVFPbvVlDya2VeM4wJevS4+nxoi32CI+Yf8Lo6Sg1n7aZht3AQ/UJeUNsqT850WBm
         4hRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720662; x=1776325462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FNR3wJEnysPdwggyPnc9U2azcBoWvybE+2odZl1DK/8=;
        b=AKAARcEyIsICyj0C6ER1k93SXZJCe77GyQDdN+PfC6af8vZhDgHXJiv9iePDzDcaUB
         VVzo6eVXtp6cYaSw15UhQ8yS75YstrchpvU4rOGVFnxcIJjAybGP6CUSy82ngTkK3WEo
         tPZzUtriqS1FPoqXz41PRI0iiWixGAILSUqSizJCdCvUuCkcQZMqsIwvM2Ff26UuJ/Is
         RJCol3ZvL9vCY9RDJIGPZXQhWrvp8m56Y9w5zdalMpqJxwZzWMdbAVPXzYIp+p1ZrQ0I
         wrJvIh3aN2m2xO/dy7FiqJsrO/hcZZui+AtwI/wLsjlmAUBTxTTMIkH4eV464BVOPwtt
         xkgg==
X-Forwarded-Encrypted: i=1; AJvYcCWMGwU7CgUIpwv3j2aOcuCzHTEJD6pF0TetNS2lQggAimHEtXgUAfIkMmIW71vsSBdRi98ZhWlLleQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzPSyZXjpTMSxpUUxAEv6VhBqDgASlksYBKBF2bazsSnXy//oS
	rT+0Oal+eWhh0HTRAzDSSZlg5z3VMVtCUkS5rkpewLVBOCKS5ig7uRsdvKxXmlTdcKt667GdZJR
	wV+Q=
X-Gm-Gg: AeBDietP8eq5dokMFZ8saD7k1++w2KxhmYUIvnqxp190T9B7ixdM/M1hq/KqshUgtK2
	iWpFrPOglkq3wDnIl8Hpu8pPxjSFI5sW6i5BgsLV6XYmSg1rCoAJYT7KXQKwexBUYI0HsGyrQML
	SBNpOTJJHS0Gc51iCRTKsckVfMMnDsEo0CC08L4NGhOCOXEcHvzZEIyEv6vliMSTo5YvPZ2oFF9
	O/enGkB7Dp9eQwDpuw0ZQdm4XT4WxiqXywL0mt3NdEif+zN1y7wwAVw9Pc8PeN1SaYSfNeOAzIU
	N02JTyoVsG4tXHHa7Iz66z5fYt7DQQb0WkSFdji7KcgPIEBlWc3QS0ovVuD54+AhTH5vaM9L/yr
	rHlk/9DHv52Qm+izXkAah0sDgYHsyuwZy3lBmT9rVo5Y2cOr2YACdnxS6TyL+IbYGOiZv8TFFHq
	3EKWH3ZTuNmMgcFFTYWf/b+456HeTO8B8sPgpVJg==
X-Received: by 2002:a05:7022:6097:b0:128:d9a1:b68b with SMTP id a92af1059eb24-12bfb767ec5mr12215983c88.33.1775720662187;
        Thu, 09 Apr 2026 00:44:22 -0700 (PDT)
Received: from katana.dragonfish-mirfak.ts.net ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bf90973b6sm25154047c88.9.2026.04.09.00.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:44:21 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	JP Hein <jp@jphein.com>
Subject: [PATCH v6 1/2] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile USB firmware
Date: Thu,  9 Apr 2026 00:42:41 -0700
Message-ID: <20260409074242.2115657-2-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409074242.2115657-1-jp@jphein.com>
References: <20260331003806.212565-1-jp@jphein.com>
 <20260409074242.2115657-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,jphein.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36085-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jphein.com:dkim,jphein.com:email,jphein.com:mid]
X-Rspamd-Queue-Id: D22213C7377
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some UVC devices have firmware that locks up under sustained rapid
USB control transfers, crashing the xHCI host controller and taking
all USB devices on the bus with it.

The Razer Kiyo Pro (1532:0e05) is the first known example: approximately
25 rapid consecutive control transfers cause the firmware to stall an
endpoint. The kernel's standard UVC error recovery (GET_CUR on
UVC_VC_REQUEST_ERROR_CODE_CONTROL) then sends a second transfer to the
already-stalling device, amplifying the failure into complete firmware
lockup and xHCI controller death.

Add UVC_QUIRK_CTRL_THROTTLE which:
  - Rate-limits all USB control transfers to 50ms intervals in
    __uvc_query_ctrl(), the lowest-level UVC control transfer function,
    ensuring all callers are throttled including uvc_set_video_ctrl()
    which bypasses uvc_query_ctrl()
  - Skips the error-code query after EPIPE to avoid amplifying stalls

The 50ms interval was determined experimentally: the device is stable
at this rate under sustained operation, while shorter intervals
eventually trigger the firmware bug.

Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/media/usb/uvc/uvc_video.c | 30 ++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h  |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a5013a7..cee93ac 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -36,6 +36,26 @@ static int __uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	u8 type = USB_TYPE_CLASS | USB_RECIP_INTERFACE;
 	unsigned int pipe;
 
+	/*
+	 * Rate-limit control transfers for devices with fragile firmware.
+	 * The Razer Kiyo Pro locks up under sustained rapid control
+	 * transfers (hundreds without delay), crashing the xHCI controller.
+	 * Throttle in this low-level function to cover all callers,
+	 * including uvc_set_video_ctrl() which bypasses uvc_query_ctrl().
+	 */
+	if (dev->quirks & UVC_QUIRK_CTRL_THROTTLE) {
+		unsigned long min_interval = msecs_to_jiffies(50);
+
+		if (dev->last_ctrl_jiffies &&
+		    time_before(jiffies,
+				dev->last_ctrl_jiffies + min_interval)) {
+			unsigned long wait = dev->last_ctrl_jiffies +
+					     min_interval - jiffies;
+			msleep(jiffies_to_msecs(wait));
+		}
+		dev->last_ctrl_jiffies = jiffies;
+	}
+
 	pipe = (query & 0x80) ? usb_rcvctrlpipe(dev->udev, 0)
 			      : usb_sndctrlpipe(dev->udev, 0);
 	type |= (query & 0x80) ? USB_DIR_IN : USB_DIR_OUT;
@@ -108,6 +128,16 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 		return ret < 0 ? ret : -EPIPE;
 	}
 
+	/*
+	 * Skip the error code query for devices that crash under load.
+	 * The standard error-code query (GET_CUR on
+	 * UVC_VC_REQUEST_ERROR_CODE_CONTROL) sends a second USB transfer to
+	 * a device that is already stalling, which can amplify the failure
+	 * into a full firmware lockup and xHCI controller death.
+	 */
+	if (dev->quirks & UVC_QUIRK_CTRL_THROTTLE)
+		return -EPIPE;
+
 	/* Reuse data[0] to request the error code. */
 	tmp = *(u8 *)data;
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 757254f..31f2af5 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -78,6 +78,7 @@
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_CTRL_THROTTLE		0x00080000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -583,6 +584,8 @@ struct uvc_device {
 	struct usb_interface *intf;
 	unsigned long warnings;
 	u32 quirks;
+	/* UVC control transfer throttling (UVC_QUIRK_CTRL_THROTTLE) */
+	unsigned long last_ctrl_jiffies;
 	int intfnum;
 	char name[32];
 
-- 
2.43.0


