Return-Path: <linux-usb+bounces-35708-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCaOE4EXy2lrDwYAu9opvQ
	(envelope-from <linux-usb+bounces-35708-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 02:38:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCC4362B59
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 02:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E8473041794
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 00:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F42392D12ED;
	Tue, 31 Mar 2026 00:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="Jsqod4oK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EC829BDBF
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 00:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917493; cv=none; b=UEJxZe2P/um++HNqk7keB1B6CGfsdTE6emaqcwKHTL0PoNeMfhQpoU4a9Kx1ARoHJG926ttMJga11F0RIXiOfhic9rwQJy0LthR8MW5uemQLKc3bVH0g+O2nsT24RuTR7ccY5gq5oXn6oNab/I79zcjNBVyW4ihUA1u/10pEgy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917493; c=relaxed/simple;
	bh=fsTHyWOUvDIlejGCT9LsXLY/uwNu3171UnVIx7oqPKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aCftSHZVKixjiVomY2/1NHe0FTWRcAWuunh7mDssEEP0r9hcxxiEF8ctoFEevtgWuM1lLQt7MwY6Cl+/vk1LhhekKRiPe8HD0Buuyl6l/F7yRCIiMhZailZxPOBoDluX/2w1wYIZxiFgfrpaTtNlGckfW+QhCiYrlcn07Cy/asI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=Jsqod4oK; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-126ea4e9694so1549865c88.1
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 17:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774917491; x=1775522291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZwt0R/IQ/cE7o40rmBPpv+gSd79siNpA7SF/5ZqoKk=;
        b=Jsqod4oKgtdHtk+KUfFPa6lDdr18ON0KFGbzeYGVgfThFxgxUZGSqhMFMVFHpc2tU9
         sqbTWYZ167ptOBIfZO6k74AihaINyqTAkMm+7NP4eYxnFy60RzRhP30kzZbXOncBaH33
         oPQqU7Mdo0ONIW+unLri7+8UhR5h+FddMvdidX5leoXNW78TsfPYkqk05SlhmrSXEUBR
         tHFSWYTUeTfGnKjZJ6B81O0NSiBbMXnPiFIwxUHJ7wQ9zwetwyhqr2x4O2AXS54m5m5c
         T+dEd/0qh22prZMYF2VQPPZY40puyHdXWButX6Wv7A7XCSP0acQUdYQUo9EtbZ1LfdvD
         UauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917491; x=1775522291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DZwt0R/IQ/cE7o40rmBPpv+gSd79siNpA7SF/5ZqoKk=;
        b=nm/glsF5rctwAaKdZWhAXQNTChC8dOMwPBuW9MDcIpgc6UcXfhb5wiSHqCAyc5hjzb
         bc8Vk7J9bwseo/BEhcjHe//d61lE/tU+saPxpq/LMldCfV3ro3pdhXnVHzB59hqsO/nd
         1NYcu5+wssKanwDBlE2vqpeOPqNcExr8roAAT+Drz9N3rrfM+gOdTD8ar8yyg1ZS8whB
         Kj6ZdeC0o2WdBdRcMPKREvWUs/SRb2IBTk93O2tuYzAIiZsqeuRClYTcKHDLYYkjwyWz
         SaQR9fodBXgxvDHWPAriozPRZzOhEO3CEdl7yYGRnwXEBeoWKc6NSo6OCem9EiEvVDZP
         UmZA==
X-Forwarded-Encrypted: i=1; AJvYcCVudqW9rxNdMWfZ45W60wexSMktKuEKA+GfXe0S+mf4GLavXvTgES/pdC3BkXMZcfXYbgE7xsxeYrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPoKlSOahWK3iBqnWNJLUJZ/pSSQxRAEiM1VyuDUtOWmx/oocc
	IerFQe7wnJi/lCJ7R5Y0o1bqIssu66+uIH2CeXGKJVnM+d6rxRKb6tht3SVgoFcO0w==
X-Gm-Gg: ATEYQzyRLXluxyYOrYCq1CNdUfdHNL33Nk0+lwBGFTVF0RIwcds7kycPzRua6VUSgyv
	94xFOL6E/6/dvBOezSKV0HqKHjpIrIJIWfFL4VZRxK2Rh8jrTArPT/eVuSS2Rw7fB/zQO2Yv6Ty
	rpkUT9/Q4+OEnNC5ZbLuxXh1+7rplKeVBkRmCaYc/Hzurs9039mmo9wnE+K5vCAxdoQ+lE7xD6H
	qguQgDHHJVO0Dw04AfvP3j8xbtbAGU6zXEOzBCBxIIqMUef5IOiLl49bk27OAZtzGmcvKKNW7/h
	nFDyE6XyGSKsYrZB5eObbPVpLM3DYmCgPUNFAmOEbpDKgcq1sMteNGjVC9o6gF0LX2UxR8RcieA
	NRKCnkxR/4Ll9Qk6ShJ3ChXHlpbNKUBhrf08Snnewmj8VEUmX2u48awIOqCE9wG0izRE0JVhWQb
	FZGBg8PSrs6g==
X-Received: by 2002:a05:701b:230c:b0:12a:b932:8221 with SMTP id a92af1059eb24-12ab9328744mr3647965c88.5.1774917490924;
        Mon, 30 Mar 2026 17:38:10 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab9864810sm9343057c88.12.2026.03.30.17.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:38:10 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	JP Hein <jp@jphein.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
Date: Mon, 30 Mar 2026 17:38:05 -0700
Message-ID: <20260331003806.212565-3-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331003806.212565-1-jp@jphein.com>
References: <20260331003806.212565-1-jp@jphein.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,jphein.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35708-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jphein.com:dkim,jphein.com:email,jphein.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EBCC4362B59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some USB webcams have firmware that crashes when it receives rapid
consecutive UVC control transfers (SET_CUR). The Razer Kiyo Pro
(1532:0e05) is one such device -- after several hundred rapid control
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
 drivers/media/usb/uvc/uvc_video.c | 32 +++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h  |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 40c76c051..9f402f55e 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -75,8 +75,30 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
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
 	if (likely(ret == size))
 		return 0;
 
@@ -108,6 +130,16 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
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
index 8480d65ec..cafc71457 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -81,6 +81,7 @@
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_CTRL_THROTTLE		0x00080000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -579,6 +580,8 @@ struct uvc_device {
 	struct usb_interface *intf;
 	unsigned long warnings;
 	u32 quirks;
+	/* Control transfer throttling (UVC_QUIRK_CTRL_THROTTLE) */
+	unsigned long last_ctrl_set_jiffies;
 	int intfnum;
 	char name[32];
 
-- 
2.43.0


