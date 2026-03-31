Return-Path: <linux-usb+bounces-35709-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMH4DJUXy2lrDwYAu9opvQ
	(envelope-from <linux-usb+bounces-35709-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 02:38:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9CA362B82
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 02:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B9BA304C2D1
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 00:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9CA2D5925;
	Tue, 31 Mar 2026 00:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="R+qyK77g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184582C0F81
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 00:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917494; cv=none; b=eOeQdtNKya2fpgeTS/Xd97TdC6FjoWgMSW6YnLlk5EHMFbc5l+fiBrPeTcuI1Iy09pxXmzJ/F1HFtyX0uJcqsMrvBGfrLG8DtwZJZpozZkWf1OPnE+BRiD7RXyKjIIINKKf6a1t8hFqjKHcWTQrGLrfHc5NCHECt63LmVJtzg7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917494; c=relaxed/simple;
	bh=I/Eif1ZRTDEQrnMNfjbO5VHLbe1G0lSEoJ2HP69/lqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0gwI//sWHbWBHiKPABsUiJIJC5OMct3TnJhBKYdfMd8oO2krGjSU50nFFhpkpN3zCoFJV+VMMl/rLA3YLryEMWpUm1SmhwgPRQe0QHax0siDAj7xnQUlUuUiimkxzsYGk5bxWBWXU+Jc8UtvMgi4vsZxZqjYuCcey97ADfKEj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=R+qyK77g; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12776bebe9fso2058453c88.1
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 17:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774917492; x=1775522292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDFymdpKeXfGYj2x1HV3pjSU2EJtPwV7qvFYD8NzPH0=;
        b=R+qyK77geQ2gbFIKiUkXOILkT3qEvYDYid5CXTKI7g0DeDhiohTbaPn8Qm2IUu+rSy
         XdHRB1q/k7otYUyWAu3GWWx4EfcmtGZsy59XMfV/kLcZs4snPDK2jqzEO/W4c0vczwSk
         zRQLp1/w3yI8jv8GeRC3kjfjvIaJC4zIe3xLQVfr1F5tNMYrrUQdtdkB2BWfUZdqPo6t
         PRkPi+Jj8d0+0kILnYAgTrQ7i1/0cxsk7/yE2lcs9k3Z22cN2SnwE4EAk1P/rrorvuZH
         GTs+0IyF+1IZBvz724lfzQKKulyI97l+NT3UXIGlu+/p1QO74uVe3N0JkB2ckEME7FPr
         QwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917492; x=1775522292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EDFymdpKeXfGYj2x1HV3pjSU2EJtPwV7qvFYD8NzPH0=;
        b=PMPml/rs+pk3aw9fmUFgZNqg8TJeiaRUdWm7CjeoZIGycf0LxEYgUfvRyrQ0D5OHll
         1yMq2hETM/G9pdeUlulShnDFRhffM7aLYdGNbm39TFhAXSOiVMf0jukz8tWd1p075amw
         7ED1CokSuHzVehW+QFcnLOIxIbroBSKRx6qdg5PsJZvhMCxxbzwFvmGxs909MYNhspGP
         rLI2p941fTlopZfH1KHVdpQRPoUMND45vc5lFNA08n2FaHFV/OiHfzPec+tBXFc1Qy1F
         nhifdl/lpoSW+S/ep1pU577V7u7//5oINqsz1chr3NwdY0AKVFjh4bd2Y/zNjsuYB7dz
         ScmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUndZ9P9j2QyaQMQv8Mln7Qd8gCJFd3Oy867ygkHlD6YfDouscMTZZ12AzgjJIAU6HjySro+NevnhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYIoIW/tp/OqaDqBlroXEVFUexlciWGPW9PZnt8E6nbxUOoFfL
	MoCemjWxIVacER/gr7EEUKToudzM+CHQLy7dwq8n0IlQfL1tZn4mG2pkerb9Rtc4pQ==
X-Gm-Gg: ATEYQzypEq6iQ8N6mCdcjZP9gEwhLkua7ee+QCAmnhsm6nhaMxuKh8tTy9CbAJC/1WO
	UmaY2iYMmRMFUeQsE5di07J8wFFa+3ps8KcNHx8+LqzwyVvRRi7NqEhASlzbfLVDXQ1oG1LEsea
	qZMd57Ic5/gweso3H/qRdI0KcZXeMId89cV/IbazAHtz9V2Dz0BP6cDPX/ubceucLrF01KWaAhU
	uraRE/d66N1r/AhMlmKTmPmQFcoBMNt35KTI9oNvRmabZb+vb4k7/2sN0f8v1KFV829bNRC+MDj
	TOWqApeIgNg6czeBKB/zMA7aVnEKoQSpZCkP26wkrx2ppDl9dgyoY0jDFUaF8kcnvHT2jzqq/a6
	ohZD5JQqG77SzkebWhRqp5jYhpzBENLXp5y4tsXfZk0rUMWXAwdrF26xo9NUoAoSsIRVOv/Un0N
	3K0LoAgyiDGA==
X-Received: by 2002:a05:7022:4589:b0:127:1492:e370 with SMTP id a92af1059eb24-12ab284c058mr8507096c88.5.1774917492054;
        Mon, 30 Mar 2026 17:38:12 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab9864810sm9343057c88.12.2026.03.30.17.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:38:11 -0700 (PDT)
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
Subject: [PATCH v5 3/3] media: uvcvideo: add quirks for Razer Kiyo Pro webcam
Date: Mon, 30 Mar 2026 17:38:06 -0700
Message-ID: <20260331003806.212565-4-jp@jphein.com>
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
	TAGGED_FROM(0.00)[bounces-35709-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 9E9CA362B82
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
index b0ca81d92..e8b4de942 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2920,6 +2920,23 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
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


