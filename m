Return-Path: <linux-usb+bounces-35285-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF6HFUFlv2lJ4QMAu9opvQ
	(envelope-from <linux-usb+bounces-35285-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 04:42:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D257A2E8273
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 04:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C562D30238D3
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 03:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DFA37F8D8;
	Sun, 22 Mar 2026 03:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="Uy7gR8Ew"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C69D37FF62
	for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 03:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774150914; cv=none; b=u7wY4QxZ2wgociklge4F3B1dQ2DqwFeP52zpl+ieo8x3oWibfR58Q6e9Twd/jBjaSG8/Gq9lwAJeDSymeQN+BfOxmx/Ry7hqRPYCp/SaG3EOpDhcUu18Mm+dz4VxZ5aFSsrSYgP73wAE17iZCI7HGNHWje3+f7qRiu4hVhWXcSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774150914; c=relaxed/simple;
	bh=f40iPRYm5U2gOyJUY6EAVOFQmR5PmoEAY+zzqQV2+M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LqsxBEMzvoCFir+tZeXLcwQw/ORTFYJEP8TnLo8dRWg7dhyu7Ncj1VWptLLxXWO5XbZGfZ2rvG4z96rGpB5nTUXo08LHbtOLdLAhUXsBxerCHjnzkuK/FBvv3VLZsgq3L8N5jGvaCixxrPlsMQII6mk9Kx+yu1u447gBcQnttkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=Uy7gR8Ew; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c0f754e756so3030826eec.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 20:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774150911; x=1774755711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QN721lRtWmbi9bOhPWGdYKhIZ/wWA3W0RLJU7AVYzQs=;
        b=Uy7gR8EwefPT62ZHjwl3TFLDTRueGmLqEcML2pajNVhRi5vASbOPq/Uzfk4BtSkT7L
         YjX4FKHPWEQpHBdnp+Ap8EI6lFgjN7LMO4FT3LspUVhaPszz0d4ML4wYIj1iYwOph9mf
         PmfRYj6RJvH9PTaDG10pD6lIH0Zc2xfLWHxfrNUJC2a03sdhP3jvhb7hH2LqOYwDb9Rk
         iOvEvaV140ZouBEEfK/Yt/wCg5STpkiur+oIxJvH752ah3thCdUTZpSqxFMLQYs7WEzp
         uB/ubM2evrkUZSpzvRdUSvEWLYVx4Y7xWEk+M1Jqrstir5BUwSrdq9hPXSupyxWFlCJM
         OvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774150911; x=1774755711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QN721lRtWmbi9bOhPWGdYKhIZ/wWA3W0RLJU7AVYzQs=;
        b=BeKOUlg5gz4og/DQmR8MmXHOXLcJLzDu/+WDw/Hgnv+BCNakzC9/srdBFA1iPqN4Qo
         9C7BoLWKXHTZB8qBvDPmHoG//WfwvpxiQszNChKcXsKY1rhWFa8vaP2vEFg9cMq9n7DV
         /KgKvztdUsX8DJhF4mb5nd4kZdCgsht1R9uJAwv73nYRNMzJCCdGB6YnKQMvqoRD0TLu
         FPr1UrrRVz/pg1tEj63jKXIL9NVlg87u9r0wAfyQmG6dwxaWWdNMfn2e8B3bTm8uh1ed
         zvl+nSEj6wUDVX68nb7e7dyR1WfEZN7XO/2jAHw68KkoLw4USfyKRkZKI3JcbiXDTljr
         UgjA==
X-Forwarded-Encrypted: i=1; AJvYcCXmzfMSJbiKonNFpESQig4dkZBPmc+dKr5pkcsD5j0E0ayt5t+9YCU6zi7SQl7jvOyeX4pjA5E6gWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7kNZuzE3Du76Umdo+Uawe5nLjvFP9k1tMtFWPQsnoxXqR/JJJ
	y1512y3GaeyX/tBRiUliqx+GAYpaUcMUiA4VGXcn4Kum3FFbms98aJIVrlvjL7aN2fQJrADR9jK
	bUiA=
X-Gm-Gg: ATEYQzw3EYC46m5mcRJi6zzEezzq4B31F6MTwYptZPxhLiPXbvQzrxV9d66oQKaw6oZ
	GOVCdXnZ9O+Wdcano01VuI3uQphCm6g9FWknrllL8EzHQoH/v3WdJJIKcUpnNJaz77vTNlbES/J
	+Eyno9Yohjw6kaHB6rCBjzdHk5gp6p9a3QOe/6mRM8/KqsiI54rZ63rk67xotKcJgr/7zqhs8Ca
	wHWqAjzR7KISV9vHO9DkdLtBheeiB2MtWeHGx0wtkQhn1qhueJGO4z8NDhwmeMIOj7C+G2AIQfq
	v+WT5GhNQjnQ4NoY8TvnGZidyINz/jZHf/SaPC5cvA70GzlFIB/KYlBu1G3vTxgxcwmN474FPJI
	sQ2apn8ALoroCjPEkhFgIfxXhsDa0cSGPzAZyO6F7jKLaO48a7muQdGbqXs88tfZMBUuJI7JL4p
	TZxw5Oov+9
X-Received: by 2002:a05:7300:6dac:b0:2ba:6854:8d4d with SMTP id 5a478bee46e88-2c109752e05mr3936274eec.20.1774150911255;
        Sat, 21 Mar 2026 20:41:51 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b1961a2sm8989451eec.12.2026.03.21.20.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 20:41:50 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH 3/3] media: uvcvideo: add quirks for Razer Kiyo Pro webcam
Date: Sat, 21 Mar 2026 20:40:14 -0700
Message-ID: <20260322034015.3629056-5-jp@jphein.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35285-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,launchpad.net:url,jphein.com:dkim,jphein.com:email,jphein.com:mid]
X-Rspamd-Queue-Id: D257A2E8273
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
+	 * Razer Kiyo Pro — firmware crashes under rapid control transfers
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

