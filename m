Return-Path: <linux-usb+bounces-35295-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHHPKgJpwGlkHgQAu9opvQ
	(envelope-from <linux-usb+bounces-35295-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 23:11:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1731B2EAF9A
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 23:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 846AC3026C0C
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 22:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E1A37E30F;
	Sun, 22 Mar 2026 22:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="HHdBm2Wg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A8736E473
	for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 22:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774217400; cv=none; b=OZCF+72466iC15qxuVwkFy3K2l6TJpQ8VPe7NW2i2q4kv+6vD2ySXibPmI7M5IfTvu107nHDftKQgZUWSWqJ+6w+ITeR8E4q3quaeRezBMZ+d46QBXGTO9IjNttfr7AE9yMaLkqfi8zo6rk+VCU69vrgkzcECg0FbYJDOZZynQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774217400; c=relaxed/simple;
	bh=7wFkGd6VA37qdOsrbmByN9HQYNCM6sLyLCW7T70qvJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxzOF5Pbi3jOpB/vta9tCEWQHC/Sr6W027toxe8xGl5+TrVE8U6qeCGrVmJIWq+ef7xJAI9a89ibKpc5pIo+onsm2T5qEYPlvUh/AMuQN8MxhqAMXo/Rq9S/Ez2HGyFRkptpONq4/+yGBikCXrd2G7jfTRgIpmjLhVOK5hygIc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=HHdBm2Wg; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12a80c36350so678727c88.1
        for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 15:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774217398; x=1774822198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWjML3pDjgXrTqMQEMMGGoK2UUmjpDjeGQXYnhY9w1Y=;
        b=HHdBm2WgcSeMcWN3yng6TT3UtLAA6elpR4FpFPP2DA4tORBrVvX/aMHC7M9fqIUz3F
         wzyfSnj9kQ+7JHNi0A4J1tPDDc8dzLvGVuVC14gsbBA598MZRLT73SqsAzUFYEFB/uW3
         tgtGZn5EqgvcdyDpBxXY+XVcQfbPCoVVDxTSsYNTwl3sv+Li4K5bfqsyHCph5D7ZkEMy
         AI0xkG9Dg3b/FW+1S2AEZVvuLZ/Q4petdXzVsiqNh+zMaGYhi2QaNmKl4azjqYu9NrKp
         YUgl5kIsX3IOoeTPMzTUOpMEi1VeQ5NYkv+RnTdijwIVT48q3ilBa/l8o7Lj+y4fFPCc
         evZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774217398; x=1774822198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QWjML3pDjgXrTqMQEMMGGoK2UUmjpDjeGQXYnhY9w1Y=;
        b=LHKDbyMs39i2j4CafdPifw+vwVifI/y1vFH8LHgQwKIkwafwty7HKD9KHzuu0h7HF7
         n1TrSrhO/pLD8xmxdHODn9mI8vVZuGhKRC1LsXlVnJJEw4w/8IJzvafUmccEQCm6awr8
         5M9QNct7cp7UIHlDR2kwectwgPzFZ/oNroxjs0Ue9E+qcHuqqvBunJ84LEYRATbCnxdN
         WPPePH4K3AJkj12T50stOQeT8wCd3sHiX4elkMgsjMneit0tRNRUhXSO34eHDibsd0KC
         9dIGmOtk6LVaKp4ymnN04ZL/4MIEQzvjZYilNQk6Iz+f4t2XoPE+bxjKxaT8cqkHB7g+
         8aeA==
X-Forwarded-Encrypted: i=1; AJvYcCWngL4kLMPzGyJbUSfej5pAEvCQPF/FqWWE4l5p1xbXbrtuusmNqERY3FtBofUXKXcj/pKdA83lIsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfLJtaeLcqj8Ge1OBIWsgHg7b1HUMslh8xqI2FkI1kjrN+AcOG
	6abGGL0Dx0E7TQ/vri2JriA+Y97pMLiibGC3fIDoM3MSq/3V24Ako3rfqPtCPdJ9MQ==
X-Gm-Gg: ATEYQzwU/LaCIE0reBnDGESZShg0fokQ1GD1gdqSEMXnKnFpcHOTnyqUmelPYmLrdj5
	Ufm9afqQDvKBbD3GFRbR1iqeEtQJfhMscZEwN6/KFwb0Qkwn8uMCm1AbGvSCLOOgPZgIoFHmILH
	VqgMfusXzgsh2SWJMbnVLrnIZ0i/DP+O3dyP0THWspRdfHloYm5KMp1i82lNRdAYNZDn8q26xEo
	mAgj4hQNjMo7ejIBtkIqlJRfW3GU2YaX6/3Wbhvu5Ow7dNlX0YbiCZZ487lad5VG9vGIn1JiJWm
	Q1gSrkSkA8hUEbwKIfB/1VxxfgqAK17BhjT/z1z/ZuHazCTEEYBJaPCHtzfjau/caDVJMinqtoP
	/zu9e+pkq9iY1YD966wRhbd2XMNWwp/SwHm8qkyD/dVcRVOg4/1iaPm3edwKsgrgp5BdvlmHVV2
	L0n6/oONlx
X-Received: by 2002:a05:7022:5f04:b0:128:e693:b61c with SMTP id a92af1059eb24-12a726b29dcmr2149405c88.27.1774217397835;
        Sun, 22 Mar 2026 15:09:57 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a7330d1c5sm7707766c88.0.2026.03.22.15.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 15:09:57 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH v3 3/3] media: uvcvideo: add quirks for Razer Kiyo Pro webcam
Date: Sun, 22 Mar 2026 15:09:40 -0700
Message-ID: <20260322220940.1462189-4-jp@jphein.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35295-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[launchpad.net:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jphein.com:dkim,jphein.com:email,jphein.com:mid]
X-Rspamd-Queue-Id: 1731B2EAF9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has
two failure modes that cascade into full xHCI host controller death,
disconnecting every USB device on the bus:

  1. LPM/autosuspend resume: the device fails to reinitialize its UVC
     endpoints on resume, producing EPIPE on SET_CUR. The stalled
     endpoint triggers an xHCI stop-endpoint timeout.

  2. Rapid control transfers: sustained rapid SET_CUR operations
     (hundreds over several seconds) overwhelm the firmware.

Add the device to the UVC driver table with:

  - UVC_QUIRK_CTRL_THROTTLE: rate-limit SET_CUR (50ms interval) and
    skip error-code queries after EPIPE to prevent crash trigger #2.

  - UVC_QUIRK_DISABLE_AUTOSUSPEND: prevent USB autosuspend transitions
    that trigger crash #1. Same approach as Insta360 Link.

  - UVC_QUIRK_NO_RESET_RESUME: avoid the fragile reset-during-resume
    path. Same approach as Logitech Rally Bar.

Cc: stable@vger.kernel.org
Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2061177
Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2920,5 +2920,22 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
+
+	/*
+	 * Razer Kiyo Pro -- firmware crashes under rapid control transfers
+	 * and on LPM/autosuspend resume, cascading into xHCI controller
+	 * death that disconnects all USB devices on the bus.
+	 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x1532,
+	  .idProduct		= 0x0e05,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_CTRL_THROTTLE
+					| UVC_QUIRK_DISABLE_AUTOSUSPEND
+					| UVC_QUIRK_NO_RESET_RESUME) },
+
 	/* Kurokesu C1 PRO */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
--
2.43.0

