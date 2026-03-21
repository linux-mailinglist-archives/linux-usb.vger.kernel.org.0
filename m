Return-Path: <linux-usb+bounces-35278-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLoiKusdv2mavAMAu9opvQ
	(envelope-from <linux-usb+bounces-35278-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 23:38:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD72E781F
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 23:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D72C3028EFB
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 22:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A45033E351;
	Sat, 21 Mar 2026 22:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="W9Th2fm/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1168C3101A2
	for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 22:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774132659; cv=none; b=jMb+dSRsp4dWmBVxytHky7MNhNITfvvTp8SIyGBaNVd7M5dH2trNu20NSnIT0iSGCxk/bPdbAiGQa5N3npYq6Se/0KeIZGKKoWbXrx2N4UUaEDGzMA638guwxxZXr8iNW70MAKw8nV/fLWN5Djhpf7APEqD1tcpIbO4SPY54waQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774132659; c=relaxed/simple;
	bh=ZB4v3IPFDRnk0aKPXENNDAE3F/R3GHcKa0Ja8oqgihA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ipjZnr6flbeX7WBzBbm4+eBf7fpNUwPCi0M6kepL9flatI9qJycea3qf+tF9HCCuoiyCbBx8/ki9oaP/oRb305nKNSlyk3H0CM2GTZqJmhYr99wvnKoio4T+qprT24ibixfxvCoJkkNQaTxX5lwFDbOCGSc1L9j8RaYzbpssh8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=W9Th2fm/; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so1392138eec.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 15:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774132656; x=1774737456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWxv10dmacQCe02GOaZYv2taNeWbAdkdfAH3ZWq85RY=;
        b=W9Th2fm/6CV0ExkYq2CSLa1B0+JWr42lcCki+pT4AKbBJNyxV6nBP0Ey97SJvpEvkS
         9rFO/hl5eKcPDoB27CDJbQaNT5rIrspSgFZy8fF8UNO8/2NU2ILginMGojw+iitwwU6V
         BLYQo4WfLXFtsdd1ceTp2q4JmIBecZjL+UEuqfi7oskxINKb0E0pX3uyHgAl+J5kfFxM
         QM/SvI/G6QyXLghY240XmogS0pWYvJFNPhbLN7keZTv9G+9rzOlK7vDVSLO2NsuD3eW1
         VckPE9A5wUtiAA7m4xN4WTh7ovCTP0NsDS2x09YottEzf2T5j4a247/AeJKDzArDmWiY
         uDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774132656; x=1774737456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zWxv10dmacQCe02GOaZYv2taNeWbAdkdfAH3ZWq85RY=;
        b=gAy2Il/Y2OX14xRKvSWoKkn9oM9gVeMXA9AC7ldj5rgtkv7OagqXsD/TYn7cbtUZgk
         A0YdoSUHhtkWzsAVAS1IpMbLXe9aJ9d/VyQodiz968w2uEBg+v3KHX/0gS6pSzqhuHVf
         kejqNzw63uBMXZ/N+eZcQNP3B3k6qVpGWuxU0u4MsjZOjPvhpsGFF1C5yuME5ANHA0fZ
         zRoD7aq0Mu9FY5iwvq79K0PogUK8MT7m0//Uaz1NAAzuRUjt6j8XMd2GwIQyXoNoKXxp
         oGedD9HQAF6dsAz1M7+WefmArxYXTVcXRcPt8w3wTFrAe/5RgSyM7Szhjmw9SIohXLJO
         DFYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg+2FN8vdsPrIWT/67yXRFMUDA5KfSO09cZzAOx+DkyKBh23uGOL9NepA4mRN0Ofi5L3krx6ILvpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW3erMxPyy/4fNhBHs7BZLTTgL8ZBuJ569MWF2gM17NI5opIok
	vXbhYax7U2sk0MtviLXMFgb6899qA3x9U/drpd14Xc173qCo5L39Kj88Y0AcPsVjzA==
X-Gm-Gg: ATEYQzyM56ZN2Ut8Be6/0P+af55SikW95tZ8EDkvpr08pL90etneY3nrY1qM8XdDD6M
	H7EfQFkAQJrdtx8mlWhXW+NwJr3Ee4oFX1xyPaYAOrFYsikvAUwBfYD1XI/YWmpwDZzyrj7GMnM
	aE4Ho2O/OBqercbemmGZ1imOdEwk5x/BEAYKDn8dgh9hcN1xdvtWU6ZnnIpCJ8y+vE8Nji3xxsS
	hVCiKXtiGrkZ0lrzrc5yz56WfHkIpVoXtOiuFavF3n4AbnxmWm5nLQani8FQ0403pSub5diMHCL
	dmo6HkQJ3TIuwpoYNOJH2JGZI2a1HJar3KxlVnnLvR6z3gL1fUz7qAs6sz0rtoeW97VLAWhylSe
	X1LZRu0p99J+7sTTJppkdBi8SMSa7jFHrdrWTAHFw65Gqyq3/emZ3kOXJ5uyGfXCHB6Vwcw1Sld
	D78ZywP9qk
X-Received: by 2002:a05:7301:3d1a:b0:2ba:9835:112d with SMTP id 5a478bee46e88-2c109565648mr3372368eec.3.1774132656039;
        Sat, 21 Mar 2026 15:37:36 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm7982131eec.2.2026.03.21.15.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 15:37:35 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH 1/3] USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
Date: Sat, 21 Mar 2026 15:37:03 -0700
Message-ID: <20260321223713.1219297-2-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260321223713.1219297-1-jp@jphein.com>
References: <20260321223713.1219297-1-jp@jphein.com>
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
	TAGGED_FROM(0.00)[bounces-35278-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[launchpad.net:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jphein.com:dkim,jphein.com:email,jphein.com:mid]
X-Rspamd-Queue-Id: 21AD72E781F
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
other webcams with similar firmware issues (e.g., Logitech, Realtek).

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

