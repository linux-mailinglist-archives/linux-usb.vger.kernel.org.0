Return-Path: <linux-usb+bounces-33046-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCkoJfFzgmnBUgMAu9opvQ
	(envelope-from <linux-usb+bounces-33046-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 23:17:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B94F2DF293
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 23:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B1B8300C7DE
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 22:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB72F36F406;
	Tue,  3 Feb 2026 22:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AX3j4OtX"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1F536214A
	for <linux-usb@vger.kernel.org>; Tue,  3 Feb 2026 22:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770157022; cv=none; b=WFPnhVTc9rxznIt7RsQI9V9GGVPj3ruLn47aDFLH6w8L7SVQX7Q+6BWAuDpl7QO+JeOf7xWGJRBu/mWlZWn9bqxzjXzap2qZk0k+2Bp8gYGTLed8vGctxx8KweA0LmCmY3ekBojmCb7VT6L8MtRy29XM0axJ7oi2cmspt/P3iw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770157022; c=relaxed/simple;
	bh=pYxYPURvz3MhNYNsewL0ZKU73YmQFgpw+7Rw6Nsrd3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JJBFcdubdU2GitGg7Qg1h4agj6KOEQfKamUvoFT4dEIAH+ft7w+8mjpUbD8AArjcCrlE/AGk33hpRRXGDq/k8LauK5KwT2a5HJklMmskB5acly/Gz1//oCc+VaHLjCUIBlFYOSZ8Ojf1ciuajAEq97X6iwuhoIX6tSacEpu0LiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AX3j4OtX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770157019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFYAOGiLZN4gRTgbQkbegN6tbXaotzgssD6BTvxd+5U=;
	b=AX3j4OtXr7tnu4DCnxTt0+2wUbxCW/dOBHtYV3nMkfca28YFJxENsR7Okqf7movhhDyGKo
	hiKvmzfNcQBv+xoCORI8XAVsiijelR/iWUNzVgYNSEwTRV9eGOWWjIac1HOypwgevI+MRr
	giglHz9h4ZkKUbY3piOIIsNEC4/9qFo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-47-VQuSGUDNPk2YMyEgj0iwDg-1; Tue,
 03 Feb 2026 17:16:55 -0500
X-MC-Unique: VQuSGUDNPk2YMyEgj0iwDg-1
X-Mimecast-MFC-AGG-ID: VQuSGUDNPk2YMyEgj0iwDg_1770157014
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B2B95195608F;
	Tue,  3 Feb 2026 22:16:53 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.51])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 01AFE180009E;
	Tue,  3 Feb 2026 22:16:51 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: "Jiayi Li" <lijiayi@kylinos.cn>,
	"Mathias Nyman" <mathias.nyman@linux.intel.com>,
	"Oliver Neukum" <oneukum@suse.com>,
	"Miao Li" <limiao@kylinos.cn>,
	=?UTF-8?q?Johannes=20Br=C3=BCderl?= <johannes.bruederl@gmail.com>,
	"Lei Huang" <huanglei@kylinos.cn>,
	"Lyude Paul" <lyude@redhat.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH 1/1] usb: core: Add quirk for Gigabyte Aorus Waterforce X II AIO coolers
Date: Tue,  3 Feb 2026 17:10:27 -0500
Message-ID: <20260203221452.198682-2-lyude@redhat.com>
In-Reply-To: <20260203221452.198682-1-lyude@redhat.com>
References: <20260203221452.198682-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33046-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kylinos.cn,linux.intel.com,suse.com,gmail.com,redhat.com,linuxfoundation.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B94F2DF293
X-Rspamd-Action: no action

The "Aorus Waterforce" is one of those fancy gaming water coolers that
comes with fun LEDs and an entire dedicated LCD screen. A minor issue I've
noticed with this cooler on Linux, is that we fail to actually
reset the device when coming out of standby, ish:

  [  281.652184] usb 7-10.4: reset high-speed USB device number 7 using xhci_hcd
  [  287.179843] usb 7-10.4: PM: dpm_run_callback(): usb_dev_resume returns -5
  [  287.179854] usb 7-10.4: PM: failed to resume async: error -5

Generally this isn't fatal, as even when the water cooler doesn't resume it
will still reconnect itself moments later:

  15:48:12 GoldenWind kernel: usb 7-10.4: USB disconnect, device number 14
  15:48:12 GoldenWind kernel: usb 7-10.4: new high-speed USB device number
     15 using xhci_hcd
  15:48:14 GoldenWind kernel: usb 7-10.4: New USB device found,
     idVendor=0414, idProduct=7a5e, bcdDevice= 2.00
  15:48:14 GoldenWind kernel: usb 7-10.4: New USB device strings: Mfr=1,
     Product=2, SerialNumber=0
  15:48:14 GoldenWind kernel: usb 7-10.4: Product: Castor3
  15:48:14 GoldenWind kernel: usb 7-10.4: Manufacturer: ITE Tech.
  15:48:14 GoldenWind kernel: hid-generic 0003:0414:7A5E.000D:
     hiddev98,hidraw2: USB HID v1.01 Device [ITE Tech. Castor3] on
     usb-0000:74:00.0-10.4/input0

My guess here is that the device simply doesn't support resets properly -
since that seems to be the only quirk I've found that actually works. Note
that the device still ends up disconnecting and reconnecting after resume,
but this seems to be normal behavior.

So, let's fix this by adding the USB_QUIRK_RESET quirk for this USB device.
This seems to work perfectly fine and prevents us from getting the
aforementioned errors on resume.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index c4d85089d19b1..9a81994ee725b 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -584,6 +584,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* INTEL VALUE SSD */
 	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
 
+	/* Gigabyte ITE Tech. Castor3 (Aorus Waterforce X II AIO coolers) */
+	{ USB_DEVICE(0x0414, 0x7a5e), .driver_info = USB_QUIRK_RESET },
+
 	{ }  /* terminating entry must be last */
 };
 
-- 
2.52.0


