Return-Path: <linux-usb+bounces-35284-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHmgGCZlv2lJ4QMAu9opvQ
	(envelope-from <linux-usb+bounces-35284-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 04:42:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A042E8250
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 04:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B0403014951
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 03:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6806B37FF50;
	Sun, 22 Mar 2026 03:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="TXwCrfiL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6B237F8B9
	for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 03:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774150910; cv=none; b=sJDqSCw38nmOQbI9nWkNQfboiw7YtJCwkAfQEdfbUQmxy3iqQ9ZQsGLUgPMMm8wNKwcErL3BbuKmhQtCAO/qKHUxNa/p/bjjvagM4YvJQJUr+LSjbfODOTibb5lLyrbZ+AT4EPNar6+ruU/K7LDuQW6XzSU18fI/AsAqcKuruZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774150910; c=relaxed/simple;
	bh=+uXcBDTgLUgS0BJvcZZ+DkQwepeZUe5K/rY0iUeCRqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TONiYdC3vIxOrBvn+Xr3Zh1B5fk6vDBapax5Tsmo9SfndZoSbQw7Jp85qkD8E6ZbpmidWYgAb1Y0n4EX3TIs9K1ihgsUr0oIBK6JyhxoNVRcfTdJGPCRg5O9Wae5GBW7yFrKyMfc5TQ1zlhehI0upuV4HrJ/DGF3ohF0GjnbsiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=TXwCrfiL; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c0ea57fea7so3662799eec.0
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 20:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774150908; x=1774755708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Tf0Dj1hLPgZ0JGQ9nFsJkAgeKtrEv+6ZboAKFS/H4s=;
        b=TXwCrfiLOCzvK0wbktL9kPRUItBVjzIBSHrLffCq1pRd7FlL6xxN0JlvQxs/3+8vlf
         5H4AXOInu/hsR3K19741QIRRjR6AMWTze5b1rtZ2LVJsVne4KAx0N5PK3HqipzjPBLZA
         gjHN9uy+hVMEGujBkKEigx3s5Fy9a6/zJ4gMyzOKuJ0bgHr/JLhmQKqHodNomJqfZC9n
         w4XI6AI1WpkNju0tb5Y/Dzmc03l4v82GVe6mkcrxSp0A+kNmSxZRvR62WMtqZ1+pvSKl
         kJ/gVRv2VH4Q3+hLz9l36YAkroNydgBeiSEjeqKZDMoB/DJ4H0dZN/BwjnbU9uOO8SHG
         AseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774150908; x=1774755708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Tf0Dj1hLPgZ0JGQ9nFsJkAgeKtrEv+6ZboAKFS/H4s=;
        b=FYLpQJDUj9sga5/AKrtDyOVA3s8wosuY+PCRocZWfMNxCiVbNsddxew90dgxy3//rf
         gw2ygaaa5IkFeXrRcxUR6tOXnncxusqbdDio9bgAIo64OBt+r8gcHRXUVBsmywp25l2K
         9cIiKFE6ebMhE2/8jkUdAhrotDGx41MAng3ntSVIQn3KWE3semShzCOJFnwBkB1YKbQB
         GI2JjSIl93F23PPKojR3X2moGGng6rLC5SuLlS8iFagE9Ux4u7WFOzx2OD96GA3VaFZJ
         lZsLkj8uB9rFf0l3ktAcwM5xN1nIvvD235ZJuV1XHIu91EtXMe6tfY+A93omMuBUBI6L
         LFJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvj+5M3wfbD8owLbjTOQORsHYsD8SbX4q94TYnJIkq/wCII3Tx9K9/AaiNjPxRSewvMZfMOh8Dbb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7cZIBodrsDD+d+4pbHzESib/rDuD6YAEvnlFGo5/cAsuA2VWd
	m7IUzxGItS26pWv3Twazux6IMptBtZFVwe3JYJk3GBYkziL6MJ8GA4AAiFit7CIsbg==
X-Gm-Gg: ATEYQzx4bZW7vcmwth4GqN5fvbSafRwUMbBkZtC5lIlk+uoGXqde3vSUbz9elvBmlZr
	9A3DkGs+apUKGxmkTiW9+1B6ZwZHrlNLNLR0SzQ+XhI2kyW77+jsfArAE1jl9Fj/9HTVaY++Tta
	hPgLuhbTXuyX4EwIitolYhtFEkgXyJLujEHfMqs0C4bQly8BFhi+L5KnsBJfR/1QYfctbyc8v8q
	B/D6d849feVN5QMXT11j8DedEZ9moA09IKIE0g9qU+eIMYjdGj/ebe6Sul8ZWY4Ml8BWMrNXzt6
	QR/PX2mLu70x3C2ga3mujD/fb+Por3lKW3nEOUv40JSC5ZslKEg3unBhISPX67nQ1X3+ayQd7Xa
	cqq996l8KPq4BPdU6xs+vUmZG/olLCB1tZgbA9nek4r/qnTW9GgpoCCAIYorm7Vo4LzIBbiasTZ
	ZnDYB+pOwC
X-Received: by 2002:a05:7022:2591:b0:127:5c54:a124 with SMTP id a92af1059eb24-12a726db50fmr3805814c88.31.1774150907709;
        Sat, 21 Mar 2026 20:41:47 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b1961a2sm8989451eec.12.2026.03.21.20.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 20:41:47 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
Date: Sat, 21 Mar 2026 20:40:13 -0700
Message-ID: <20260322034015.3629056-4-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322034015.3629056-1-jp@jphein.com>
References: <20260322034015.3629056-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35284-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D9A042E8250
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some USB webcams have firmware that crashes when it receives rapid
consecutive UVC control transfers (SET_CUR). The Razer Kiyo Pro
(1532:0e05) is one such device — after several hundred rapid control
changes over a few seconds, the device stops responding entirely,
triggering an xHCI stop-endpoint command timeout that causes the host
controller to be declared dead, disconnecting every USB device on the
bus.

The failure is amplified by the standard UVC error-code query: when a
SET_CUR fails with EPIPE, the driver sends a second transfer (GET_CUR
on UVC_VC_REQUEST_ERROR_CODE_CONTROL) to read the UVC error code. On a
device that is already stalling, this second transfer pushes the
firmware into a full lockup.

Introduce UVC_QUIRK_CTRL_THROTTLE (0x00080000) to address both issues:

  - Enforce a minimum 50ms interval between SET_CUR control transfers,
    preventing the rapid-fire pattern that overwhelms the firmware.
    50ms allows up to 20 control changes per second, which is sufficient
    for interactive slider adjustments while keeping the device stable.

  - Skip the UVC_VC_REQUEST_ERROR_CODE_CONTROL query after EPIPE errors
    on devices with this quirk. EPIPE is returned directly without the
    follow-up query that would amplify the failure.

The UVC control path is serialized by ctrl_mutex, so last_ctrl_set_jiffies
does not require additional locking.

Cc: stable@vger.kernel.org
Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/media/usb/uvc/uvc_video.c | 33 +++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h  |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -90,6 +90,7 @@
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_CTRL_THROTTLE		0x00080000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -737,4 +738,6 @@ struct uvc_device {
 	unsigned long warnings;
 	u32 quirks;
+	/* Control transfer throttling (UVC_QUIRK_CTRL_THROTTLE) */
+	unsigned long last_ctrl_set_jiffies;
 	int intfnum;
 	char name[32];
 
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -71,10 +71,33 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 		u8 intfnum, u8 cs, void *data, u16 size)
 {
 	int ret;
 	u8 error;
 	u8 tmp;
 
+	/*
+	 * Rate-limit SET_CUR operations for devices with fragile firmware.
+	 * The Razer Kiyo Pro locks up under sustained rapid SET_CUR
+	 * transfers (hundreds without delay), crashing the xHCI controller.
+	 */
+	if (query == UVC_SET_CUR &&
+	    (dev->quirks & UVC_QUIRK_CTRL_THROTTLE)) {
+		unsigned long min_interval = msecs_to_jiffies(50);
+
+		if (dev->last_ctrl_set_jiffies &&
+		    time_before(jiffies,
+				dev->last_ctrl_set_jiffies + min_interval)) {
+			unsigned long elapsed = dev->last_ctrl_set_jiffies +
+						min_interval - jiffies;
+			msleep(jiffies_to_msecs(elapsed));
+		}
+	}
+
 	ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
 				UVC_CTRL_CONTROL_TIMEOUT);
+
+	if (query == UVC_SET_CUR &&
+	    (dev->quirks & UVC_QUIRK_CTRL_THROTTLE))
+		dev->last_ctrl_set_jiffies = jiffies;
+
 	if (likely(ret == size))
 		return 0;
 
@@ -107,6 +130,16 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
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
 
 	ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
 			       UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
--
2.43.0

