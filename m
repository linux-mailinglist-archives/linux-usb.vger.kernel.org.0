Return-Path: <linux-usb+bounces-35294-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ/5De9owGlkHgQAu9opvQ
	(envelope-from <linux-usb+bounces-35294-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 23:10:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BB52EAF8B
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 23:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47DFF3022075
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 22:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2501037CD29;
	Sun, 22 Mar 2026 22:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="lM1NhBj0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70557372B53
	for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 22:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774217397; cv=none; b=ImTpY6T43QLjCFZDf6Q3CuI7kaXt/3wQ6h4esAmv9DyQ8fIOqWIzwKyM8qlTT0bGyn41rKexUGM3nOhZifjHqlsuBXunwE/R1RBTCyH6ofA6qZ+lX6zv11tcwu8Fbh2eyRP8TSpWf390LqCK7jmLkGZ/RyqssNYeGA1C3SuQwic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774217397; c=relaxed/simple;
	bh=2hwtz7ko/sn+/2Pn67hEoIQ7ueVgPh9I2hP9YwyrtyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwzeeHrCdaNzwDLn9GAwxmSRVRRF5nALhHHt8IRY1ZuF3HzACZkaabW02drYJZADga9q4lwgasBFToJZZmoioQRAD04/+jsSgHpgHQJazg/XqK57sEWZGCs9NTSAChl2VK7IR99Ofzk07UsZpdY9CysjLGSVV+G4SQgH/TG+6FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=lM1NhBj0; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c10a2e2cd1so1178940eec.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774217395; x=1774822195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HEksHgroj9vtVfNrNfn3qqblz/mRdSgEMEkB3jZTqc=;
        b=lM1NhBj0jY+aUzAKXL67M4AanLCRPSoc3uIfwWzgCZDOvbD1IEMJSDSu8hh0i9Htci
         TU6XyNz5enb647gQjFT4jgA5t9NlGvuVjJyqYXUQmxdFckMT7gRylq0o7ouoTB/HN67p
         jfrMeCBwaAXRszr6DsoIIDDT7wfu3TalX1L9fHtVZHxM20Nao4NdwWAA1xWE7gJbWxQg
         EBuwFkowSowUi8IjMsJhVojv1QX5ILFqOsfU/7vlkymubF6cscAnmSPrn03XN2wjj7q8
         Po6irP7wNTXk9832yHyq/HD0xnDXi659/gbIo3r7dXdXNZU3DyDs9ICubjkIBT2dQ3NL
         AAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774217395; x=1774822195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5HEksHgroj9vtVfNrNfn3qqblz/mRdSgEMEkB3jZTqc=;
        b=ZvOfDygjwhq/9O8Btxc815EriwCAQWi1GbGqXB/GkN8gP8DdO8YxuepEdi29qRYBjg
         tQz7oGefE5Qz+a4735uiHnX4kBzzaKuS85648QMeolBk2qrmAsg4968hcc1tSyCvl6sc
         aExcrwkuIE8GkHAXrYBo5EoecD71skbd2Lu5zWsWgWGW9vPy2r3jFmqHsc0I7YkC7LAs
         rlw4QFn26+dQsw/B7cluBqMkLAWsyW/EMNRcp2yfmayLPhpY2B4cV+h73gyjKLqgL2Ni
         lo+GhCZwYOrwqg2lNztgv8Lml7DocxsLDS+Yo42MlNHm4YJk+eQGTGqgFK8t5lPpJbVZ
         FNHA==
X-Forwarded-Encrypted: i=1; AJvYcCWaTPGUObboR/umkJc8lvKaPDlQB1Gt/gRj0LQDuik9tTI9XMCucBpu83aghbPcWLDsh7sR3fn8Xyc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1QtAEGQdVGvSNZo+pwUWDs0AJPvRtr9pVXwchN6boipMT7d7y
	gR37kJ54VWEkM+H9o4Rr/e024KWvHlPKTNG8ONq5E6VS8QyFbDp+sCnIwxfmYI2P3w==
X-Gm-Gg: ATEYQzwGq5Y5HdFonEAYY/OAd9YyqznjlAD16gU+oagdKgmEs8yW/JarDuCQhqV5i5A
	w7hj/wdiVnigk0tpC1/uY4nQRrpKSIfc/JQQst1NU8Ew9Xc1O3V9yCaNzuiDVIQU6uQ7+b0EiN7
	/47yS2mkK9XmNblduCMTEIqdYS26NpUIMRUn3BL+auk4IS5RcAEao9XHl/pq0+kk2r7PQuOQ0TS
	5knCLmOq4K8j5lm789uacE9Q14Nu5v65BiC1U5qx3Ye+cC7BvhGi978h2BMw38kpiqpfv9YTW5L
	8Fw/F1XVhhmA+DU6LpAPorvvaC1Clmg96+vhgakGLX2uLdHvOUQKfXvHjjZwKIfLae3Ojm6UkZ3
	9cElzmETsM8kAfHRiWRvBXFcXIOSyMwYePM+tMSK0xltcsTj9ieJJHpciy+wXIGHGZC0+gSOH3N
	pYGl6rDcrt
X-Received: by 2002:a05:7022:e09:b0:11a:3734:3db3 with SMTP id a92af1059eb24-12a726cfc0bmr5304659c88.32.1774217394533;
        Sun, 22 Mar 2026 15:09:54 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a7330d1c5sm7707766c88.0.2026.03.22.15.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 15:09:54 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH v3 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
Date: Sun, 22 Mar 2026 15:09:39 -0700
Message-ID: <20260322220940.1462189-3-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322220940.1462189-1-jp@jphein.com>
References: <20260322220940.1462189-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35294-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jphein.com:dkim,jphein.com:email,jphein.com:mid]
X-Rspamd-Queue-Id: D0BB52EAF8B
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
 drivers/media/usb/uvc/uvc_video.c | 33 +++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h  |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -90,5 +90,6 @@
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_CTRL_THROTTLE		0x00080000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -737,5 +738,7 @@ struct uvc_device {
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
@@ -71,11 +71,34 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
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
 
@@ -107,8 +130,18 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
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

