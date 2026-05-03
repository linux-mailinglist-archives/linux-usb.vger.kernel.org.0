Return-Path: <linux-usb+bounces-36864-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDcAG1rZ92nymwIAu9opvQ
	(envelope-from <linux-usb+bounces-36864-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 01:25:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DA74B7BFB
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 01:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5EF73003D1E
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2026 23:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBD33B6BFD;
	Sun,  3 May 2026 23:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="tLFkoTCV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EC53A6412
	for <linux-usb@vger.kernel.org>; Sun,  3 May 2026 23:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777850707; cv=none; b=PBeW+ldtoVbvQLY0JP+Nhe27zIlod+Y17R2xJhZ7MO7UqW+9fu5RGY4pYZTN4ZM7r+GHH/n8vS70/B/8MmQAT8VJ/5UOjJP45Hlscvv8QE8nF1dUanX7i+VmD5KzZTsp3RgQAb2wvCT4QkERW2CPUp0nwnRZ+Xy/ieTry1t1tiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777850707; c=relaxed/simple;
	bh=ax/QlneOJPW/C07fAtozxCuOB9NREghfagK8LVCvkVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uYZaa5BAkiIDE/G6hCdvU1GIssSCHCfwvnJ8g7Z1gNSbghCpjBKKQhXGyUzwzS8Qe4i2R3MMluT+JkFJtPxLb0+98WdSNJw8eC8F1YV64H5F8b9zVX1f4Bx2/XnbgbltSW/dBMMMHlGATIUdT5GzWpDGUoU4RLO94MYQkHO3eUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=tLFkoTCV; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c565dd3a7so7652856c88.1
        for <linux-usb@vger.kernel.org>; Sun, 03 May 2026 16:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1777850705; x=1778455505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zu3oR09vRQkDFwrDcL3IwsvCJguXM5kG+ZQlWAVYGNg=;
        b=tLFkoTCVTwCRDiYLgV5GQQ8q4YWwzaZbQqUad7+SF8/1Ygm9TNJPSt/6uR1TJoOSRK
         OH7ZSwTjl6nT6DrSCRW/arcorEJWrH0pZ//01Ix20p88c9mnJeFlxajm7j0RGyuwdHr8
         0bOtSGBOOkXaTbH9uxJTTHxAoavCKSo/gcTHJZuTxe2R5kqXFVROYbwlTltS2gLcOYBc
         WpQLkqTrVXOLPMOrewWVf3zGGst6jcJhf1EdRI8CjdDJCkAepVVLg8B1E5vB6AAnm+Vv
         ATdSjMMD0w5/VzrIjFTWQc4gvXBrg4G5Uf8wRYMCZLycRBi1O/e/uPVW/ugcyKudWT1Z
         ORDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777850705; x=1778455505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zu3oR09vRQkDFwrDcL3IwsvCJguXM5kG+ZQlWAVYGNg=;
        b=kMpfbf2Hrz++gY8e4WBHXpH8MqHqjn7i+g4jd9LhUV9sQpbKHkHeP5l8T0z4mi98Kp
         KoxqkVXo+9OSxX4waO88TZkQ6LigPhLUBylN5KX1y6vlIyQd9Rno3hDNbb938tahD+tO
         UZfGIUPEL1Jj73hA5t64+MgE4jcQEntm65xdcjkCDYetwmhOdAwfa4HeiXPtfjNbMf9J
         n5lbk7URIWrJxYx/gCJ2T9mu+oYgBxBWr46n83o/OfS5Thhatv4hvLcg4GnL288H6Qq4
         o3Qu1kZt8rs+WdLwPNRPaO9+Y1wSH7ckW+bGR/7sb5XEXGaDLOebxzXhMsjCRd01Fawa
         OQjg==
X-Forwarded-Encrypted: i=1; AFNElJ/Elg+MRT12xxgfqeNejnbVyuXDmkEpCnb+A6WS2xbL3iGVQKqCcupWdpRCyRq5BqhV5HzL5BsG25s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL3ZBkssnUjkQMZeS9pRWhout3gDygU8PVkfPT9R+yi7M25NZc
	oUx14wvRetIHyWM5gAqI0uacM1AqIMNZhC3nnBOLeFj5LTB/fBZ2jGzYYzWAXFNj9Q==
X-Gm-Gg: AeBDietK0KAgDiCqnTbMNxhay+MOtCwUd+kR5uLbpoVmYH2+7KNYA2xAaRas5OGrauz
	IVKHD7c9iniho8uBX1KC+ZOVcHfRnjJlzzCQ3yIbOXLWVyhTzAXnohskkQTcV3qhmTSRNqD7qH6
	NkhAwTDg8KcREdnPl+TSYfH8lufzQ+E2eDPnzlnAP6gx6ug029hH7h6zbUb5UhKY7biikA/L45W
	X/B4s1fftJsSMmUlOloIimgcis9fbKccQgKR9qgnhMpEBFiytlOPFGkN89DwYgPCgj7g6Iooind
	YtBNHeC7z8AXKOZVYOnMFJyLzC9FWiyJdirpQsDUcbvrMYDvpDtiTJhvhU5Yk+hLk/aMyXhtjlE
	fQ7kFjX1iGcztZpyYeYNE8kTC+0I98HLVDFIfFxFYunVLgMDikiYsTSfAvBhvbDhDdTsKgCF7YF
	g2kDSOC7FQik07ERaW0xV+dBImwGW2vwxxU6orN/lqRMMglL02OEhuCut82WClF3HaDTeuY7h38
	uyXIMbwq6F3fk2ubMRc
X-Received: by 2002:a05:7022:220d:b0:128:d714:3ca6 with SMTP id a92af1059eb24-12dfd7ee88emr3530153c88.12.1777850704674;
        Sun, 03 May 2026 16:25:04 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8278e7dsm12432465c88.2.2026.05.03.16.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 16:25:04 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	JP Hein <jp@jphein.com>
Subject: [PATCH v8 1/2] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile USB firmware
Date: Sun,  3 May 2026 16:25:00 -0700
Message-ID: <20260503232501.302335-2-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260503232501.302335-1-jp@jphein.com>
References: <20260331003806.212565-1-jp@jphein.com>
 <20260503232501.302335-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 02DA74B7BFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,linux.intel.com,jphein.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36864-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jphein.com:email,jphein.com:dkim,jphein.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Some UVC devices have firmware that locks up under sustained rapid
USB control transfers, crashing the xHCI host controller and taking
all USB devices on the bus with it.

The Razer Kiyo Pro (1532:0e05) is the first known example: approximately
25 rapid consecutive control transfers cause the firmware to stall an
endpoint.

Add UVC_QUIRK_CTRL_THROTTLE which rate-limits all USB control transfers
to 50ms intervals in __uvc_query_ctrl(), the lowest-level UVC control
transfer function, ensuring all callers are throttled including
uvc_set_video_ctrl() which bypasses uvc_query_ctrl().

The 50ms interval was determined experimentally: the device is stable
at this rate under sustained operation, while shorter intervals
eventually trigger the firmware bug.

Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/media/usb/uvc/uvc_video.c | 20 ++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h  |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a5013a7..1d1206f 100644
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


