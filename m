Return-Path: <linux-usb+bounces-35279-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGVeLfsdv2mavAMAu9opvQ
	(envelope-from <linux-usb+bounces-35279-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 23:38:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 256332E782D
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 23:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FCA23018AE9
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 22:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC4D34D4FD;
	Sat, 21 Mar 2026 22:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="EDS4hyeY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966AA3101A2
	for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 22:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774132677; cv=none; b=PHOLJc2ntcTy41q4A0LeKjKjDzwVndvoxfXga8wVAbvBr2JghDSRUSewlmERWJ1HSUKpT7CN2yxa3ROWu3e0DQjitF7fMRkWax14ByNU3main5XwTXMtwHECu7LZdkvqiiITbzcTzYwxAeHh2fgOBZ3jm1XduyL1mpVujc2W2Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774132677; c=relaxed/simple;
	bh=n3hN8EjIlnfH3C2lt98oO/LcykKws4UXBmFmlHwwZ4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EX2N59BgXExYzCwkOedEzNG3imGCQqnJjPus3vriYAEyOxDVSex0IupGWLdjMeGbpJR8eBBVROVyI+azXtCH/mRrWGVwLYLM48NcAp7L9OyfzGag3lI8iJ+fUX740k3mCkbiamdzYDL5KYbSUnMCJY0PLiTag0eVG0Mp7FbB+eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=EDS4hyeY; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c0bb213b16so5424923eec.0
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 15:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774132676; x=1774737476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXBqF1HE5wHueBclM+C4HwjD+HdEggONELbKL5HnYuM=;
        b=EDS4hyeY6CoHvOp+hLHdONJwyNoCVtN9uObOHQVGYVNGG9E0V/hRXcrefwzhU94Ae5
         NKYxcF+KWRWsyTbzY/kvhCoZQterRfMH72PxX+NjgLeyKCpI1+h3gFEvSAqWIQa+r3x+
         a3L/s+ttEWeoTgP+TO9Mkqu8H7Mn2z7Y57Rbe5GKuWK60zwKXNpv6DudGm3kYDAZoHOl
         dt0DqgbabGB+uj1k887Xbd6C5fEoW3s0jW6R1wZyjlQ/a97qJKKUTisUNrDM2igi1Ul8
         Sz0DDDP01sCzci8F7bpGo+wX9m7+HSc6+i6m1WGSW2jmIo1bsZD4kaGhc0dp8FGPywvd
         IZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774132676; x=1774737476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vXBqF1HE5wHueBclM+C4HwjD+HdEggONELbKL5HnYuM=;
        b=GuDvg969/95t8Lf9UAdO6P/G3ZXUD5tw6jrq5roNWBM3SpB0coPUsdpDujJ5UYP3s1
         eVsuNlq2njFR1g/1AqGLhWTszu2LB8Zxuh1THJXuF/kLE93d6EC0kH9s6MAlrIJqT2RA
         hnnHlFJYRShu8qNqZbIUzM1KnjGg3ffXewN++m3MTMF0zV4arHLY3DcTwzdPrreBizIs
         KvTrGfaRBB/i0LjHLl9dyQjAhpJsLW6bFZBt0KZ5dBNUyQNHcgAdAAv9pVoZKKIRYHBV
         1c6LqZItDJJgtHL9t/umXRj88zCx/7e8SIjZ5l3kiMSzZx+6hwnf9U/lj+mTWimGvsCp
         DQsw==
X-Forwarded-Encrypted: i=1; AJvYcCVRgsh1YyczvcQR53LrzyCRTibX6k9WVyhkko+3gLrRqy+ySOKEM0tZHhwhCQiI7iCEPDSsb2A9uzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdKdwsli2EgR0xyfFoIhLh97R+tTMEJxTxf0flYsq3WknJh8eF
	de3I3hT9tPJxsuNDULhe5brxVpFYmx2dH8wzcSN8+9jFv9HpSgFqGwbopk8TTwBElg==
X-Gm-Gg: ATEYQzyERKBeTA6AC409b7Mgrn9440AjtEFa/GAgBSC/juEH2KYXtshWJKBOSD1Rsfj
	HwdSQqpjZWZCQI3DDCS6WB3RcY8zJd5mUGEJT5UvXi60b44qn4a7k8DYVXl5vU5Bmgh2DqkFKRk
	riwDN+X4Fzj1CDuFO9xIKnydoFG9NxxqGhPwicgxc0vxQkh7RTRiVMmfN4ZWthTkeW3xWuvDa2a
	QrYryZ5ZKDcVPyjQbVmxVPqqG6pT9+NTgkCxzm7/cZbagLnO9Hpl5RGd1B1oUfVy4Nz7z8MOzqu
	W4ndbj+ZlWFi3XPybTJc1AFAjQFVIe5nqKE31sp9AdZsrcuHgufSdtKqJRJ99iiJSOaAiENCtLM
	+uR9+bFDc8lHoVnXB01Fcha779W5i812rrlJqLLuSNLE0XDTQmdYcntCagQLX2Tl+/yN8fmuoW6
	SG2GQOvJr0
X-Received: by 2002:a05:7300:e2cc:b0:2be:f15:c536 with SMTP id 5a478bee46e88-2c1095f5decmr4380047eec.14.1774132675527;
        Sat, 21 Mar 2026 15:37:55 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm7982131eec.2.2026.03.21.15.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 15:37:55 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
Date: Sat, 21 Mar 2026 15:37:05 -0700
Message-ID: <20260321223713.1219297-4-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260321223713.1219297-1-jp@jphein.com>
References: <20260321223713.1219297-1-jp@jphein.com>
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
	TAGGED_FROM(0.00)[bounces-35279-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jphein.com:dkim,jphein.com:email,jphein.com:mid]
X-Rspamd-Queue-Id: 256332E782D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some USB webcams have firmware that crashes when it receives rapid
consecutive UVC control transfers (SET_CUR). The Razer Kiyo Pro
(1532:0e05) is one such device — after approximately 25 rapid control
changes, the device stops responding to USB control transfers entirely,
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
+	 * The Razer Kiyo Pro locks up after ~25 rapid consecutive SET_CUR
+	 * transfers, ultimately crashing the xHCI host controller.
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

