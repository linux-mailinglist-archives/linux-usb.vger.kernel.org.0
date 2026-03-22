Return-Path: <linux-usb+bounces-35293-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP6XKdxowGlkHgQAu9opvQ
	(envelope-from <linux-usb+bounces-35293-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 23:10:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EB22EAF67
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 23:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 432C2301C3F6
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 22:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCBA37F001;
	Sun, 22 Mar 2026 22:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="rhJ2XEyn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82DE372B53
	for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 22:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774217393; cv=none; b=D7vF2+d9XHN7KGoxRKQpZZo0Bg5osZvpqSSz91c2VfKJBakkI99+msKY+Q4qRC5KsQzxmDq0EadjZ+HlRhGaPhY5ViA+ANo78uEmTYLL3vgcy4sM6/eP9Gntbh++YtE26syiHDsu1qRzmKJ/k1rDxrOpPitf5rcvQctF8qlAzdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774217393; c=relaxed/simple;
	bh=wehqK6rLH1PC9vgBn24Kw3MFbqIl5qgphsugM3D76v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KY5JLaj0mJW26N4md8ThzkmLouVaO/wOA/xCGEIa+E+AgQCPox832HeIjxZTztrZ9O9JD5BLhfKhZLMZJsOUVMy1toGy7idTNJwij21mz0PYBpsGzi0WeGDgBwIg7pXMuoNDGq24ibfEJ5BvlzwKaLg3/l85oD7EitwL1czqe+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=rhJ2XEyn; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so3261354eec.1
        for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 15:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774217391; x=1774822191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+6TeIDvGKnGgJzVgLjcCJqKLNQPeYlw80XeDdHbaRI=;
        b=rhJ2XEynBFoKbnuVNc7PdBHSQk6jqfGMQO7SJ5f0UkLz2MvSjajqra3x8VkitqxJg6
         fEO0LOzD397yecZQzUmQSV4J8PXsN1rheRUMQs9gELLw4VS1Y3Wuh2sOirL/ynW/PV1p
         6eAHi6HJwiYGX69poD1dda8LEFTy9b0clciYKZQ5Lr+uiHhBvqP2JMfyTMBHBIMBoBkZ
         P5tE06pYM69Q0MqDRmi/P86vb4HcsAORoynz6sfGfNQOjwnZtc8MH9UlT1AxjXIXXd1x
         G4WJ9RaG3GXNP9HH/pFKlhrlosDbVaY6N4vKSaizHDWcPCWUykDri/sdNwpUD5UQLCI3
         R45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774217391; x=1774822191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t+6TeIDvGKnGgJzVgLjcCJqKLNQPeYlw80XeDdHbaRI=;
        b=nrv9IMieE/dC6ydrPjp+JuaC7IqBSzHxBdT0n9Z8KnvPYoaeECaQAPnNpf1K9v7+pp
         bznxOIcw+XMWmJpXBS+T7H25u74TUGZtNVSrbNBoAhTmOZWiINrfY+RSdpj7Lfog/LCD
         CqQI0bk7v5kf3uoQSXYo7R2rbzTfKquRYxhp52/ZcdFaE1IK5UTYMF37nasDsFdmZl4U
         pxsZ0XLTeKpeD1pkEiQ17G7JBgC3F5G3SvR4obvR6Btil7W0NDEmIim6GQoBUotOzQjV
         +wvQTNmivihsukBNs7Fw284iXKM8ltQe63vAitC0NlZ4wy1oymAQmNVLbFBG9xkvF7iT
         JzRw==
X-Forwarded-Encrypted: i=1; AJvYcCWSfeuKKlxwLIGTRByiXpn1usSlbCnSwacDMQW6rudQyMAv+gNWOibAxKYOLI5b10dBDOd2KyrvP1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOTZuDXAL9+jWkMrLToKe6hdFYKxnmAuQCyOuhUEnCvlnbysJN
	+CTGGmQM3pOlOuu+s027gkkCqKMR+j3qUoog9pmOrD+uKFab2Xrq+HdCVAWVUuZ9cw==
X-Gm-Gg: ATEYQzzbmYnzQVU4Bq/PFygP1bXxcU228SyjDonlxAYtCtgY0SlbjyX/i5O0nZmQXeM
	dy53k0WNrG4BKFpfx6YQcQ21CXCk/CCnSH8WHagjl1cWY6XYVsPD95bO8OFhVJyPJjojkap0OQZ
	gWdnYQTxxQi2Q+r2FI9DFC2bETFeYLShz4APBlJyDJLupdznmgh3DHZldZ/6bA8yCSZuoHEGf0u
	fK1suC68qSvjbHRTtiTD0z8bocsTi5MQ66NabWbMaikfDm48xk5g6b+8pWMFck8y9nGBbdQDndn
	I9TACxPnessYIqUw/cBavQAeDnaLCBDUl2v/oBE/ZhgHqGAuLGoXvpWBrhMaqJOnGKXm2LpMlJG
	GURJ/WKW7XCM7WiTbAzwB5NTzb8VEKzpwc7ub2AVa6fupwfuRxssdJxFcmEmP2ILCbznYogquq8
	AyVXAaNd4B
X-Received: by 2002:a05:7022:23a2:b0:119:e56b:c75c with SMTP id a92af1059eb24-12a726d817fmr4897386c88.33.1774217390776;
        Sun, 22 Mar 2026 15:09:50 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a7330d1c5sm7707766c88.0.2026.03.22.15.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 15:09:50 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH v3 1/3] USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
Date: Sun, 22 Mar 2026 15:09:38 -0700
Message-ID: <20260322220940.1462189-2-jp@jphein.com>
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
	TAGGED_FROM(0.00)[bounces-35293-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 47EB22EAF67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Razer Kiyo Pro (1532:0e05) is a USB 3.0 UVC webcam whose firmware
does not handle USB Link Power Management transitions reliably. When LPM
is active, the device can enter a state where it fails to respond to
control transfers, producing EPIPE (-32) errors on UVC probe control
SET_CUR requests. In the worst case, the stalled endpoint triggers an
xHCI stop-endpoint command that times out, causing the host controller
to be declared dead and every USB device on the bus to be disconnected.

This has been reported as Ubuntu Launchpad Bug #2061177. The failure
mode is:

  1. UVC probe control SET_CUR returns -32 (EPIPE)
  2. xHCI host not responding to stop endpoint command
  3. xHCI host controller not responding, assume dead
  4. All USB devices on the affected xHCI controller disconnect

Disabling LPM prevents the firmware from entering the problematic low-
power states that precede the stall. This is the same approach used for
other webcams with similar firmware issues (e.g., Logitech HD Webcam C270).

Cc: stable@vger.kernel.org
Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2061177
Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/usb/core/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -493,6 +493,8 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Razer - Razer Blade Keyboard */
 	{ USB_DEVICE(0x1532, 0x0116), .driver_info =
 			USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
+	/* Razer - Razer Kiyo Pro Webcam */
+	{ USB_DEVICE(0x1532, 0x0e05), .driver_info = USB_QUIRK_NO_LPM },
 
 	/* Lenovo ThinkPad OneLink+ Dock twin hub controllers (VIA Labs VL812) */
 	{ USB_DEVICE(0x17ef, 0x1018), .driver_info = USB_QUIRK_RESET_RESUME },
--
2.43.0

