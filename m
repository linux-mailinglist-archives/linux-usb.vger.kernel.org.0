Return-Path: <linux-usb+bounces-36224-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBSiKZKS3WkLfwkAu9opvQ
	(envelope-from <linux-usb+bounces-36224-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 03:04:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2174B3F4BCA
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 03:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A800030AAA51
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 01:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1C72BEFF5;
	Tue, 14 Apr 2026 01:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adrianwowk.com header.i=@adrianwowk.com header.b="egesS+I3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60F5242D7F
	for <linux-usb@vger.kernel.org>; Tue, 14 Apr 2026 01:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776128465; cv=none; b=LNqbRMLFpQvxFTXn5CDAH2D3BY5Suk29/dh3nBZ7Ug+HvHHqx+TBJKVqjgEAz1zeNCVq/xykoXvY042BUErPD5BFDlGjUF4dBluxwe0nj4cobC6jEqKkqPnBg6oDd6MIlHPgbwK0TC+Nfz6A44tKp0ec1++WeDav4xYyooQ8CUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776128465; c=relaxed/simple;
	bh=Jgh8JGtMuLPuc0fjWZmvaREZhlmPxFCuZkpbNI589XE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgJjOyxMvJClV2SsppTtuyLbCGraEP+nyluW4AaJcqNp7VDZxqSErpE9gQgMd59ywPbrsTI7d5NnTAux2jLXbPdKnJU8tIMl55rl18Aw8MOEwKv+oZqJ/8bx5euTPXPM42cr/bGNOw87SlnI1CDj+YW21K4CAleNVFk3pMe2XMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianwowk.com; spf=pass smtp.mailfrom=adrianwowk.com; dkim=pass (2048-bit key) header.d=adrianwowk.com header.i=@adrianwowk.com header.b=egesS+I3; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianwowk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adrianwowk.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dc3d28e2f3so2222663a34.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 18:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adrianwowk.com; s=google; t=1776128463; x=1776733263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWl3rPpOGMjT1OIH94kOV5+0jR8Ovo4+agJ500Odb3k=;
        b=egesS+I3CRbcvFN2B+fJ1ROHFXKWdGS10QzjZPc2eeHaTfrH3X7/+khgXd5XCgYC3d
         veioIRkcd0gXntW7pOI7Qr4/Nn8uP0ZuXMkeGm7IG8EdsGTQhNbOSHytJVpGjWQpxo/x
         F48NWGmBDUgMXQuXo8p9drPSHTXqsIvM2tAGhL4hORaS60gxeisV3wVGdF7riPncsIll
         xxnf+FoOkoDOl7MZ1Jt3r2MotlKRIWkTi2IA1SRJFPO1h+x5oXyUh1HTvfdpcf1aTSjZ
         QK/DLZxqwF8pQx3XZUgT5LPB7WByXztpiR3MN4ZtAOLoF7L89tG6PiYOci/dHWD+VD+J
         MrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776128463; x=1776733263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dWl3rPpOGMjT1OIH94kOV5+0jR8Ovo4+agJ500Odb3k=;
        b=FionLznXBui/K0qbtO4aqmlNKQXazUMnQQR8k0sv7ITtK015ftvqz2B0/lGKqv3AaS
         zPJjooJwJZEStJ4erd8o0qCHNsJotd878foIUQHF62DP4k9tmbUuBa2KIOaj9Tv2Tpk/
         1Oi/FYTx9Pk6+cDMaKoGJABNZeAAq3J0Vx0zDa4fP/cGWqGVphhVBfDF2zmYMedqj71a
         d7xg+8lxrslKemvwpVGCNUxeEv4PEKxCEL7d8m7TQ/7kBoUo6NlGEGKN9ptmhg2WNX4p
         mflejfjE+Axh8xhzdddTh6XqL5sbejlymJJ7j/EZlLW5zOrkP8rhhQG44XnO7U1yK+SM
         kgbw==
X-Forwarded-Encrypted: i=1; AFNElJ/ptl5fYC4lsGXa1Z6NhbcALw+FG5cnRtZGi4SPf02Dj/e6vA1Ilv6Q3m0GOJJqjwktDgdVf8dvKFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9qPKTVVsUbv/DyIAt1AE5fUiLM6bbcHR0utRPG/Ek1NCpzFs+
	rDT36Q7measmmhqIUkRMLHDOmhFHUNoi+UBh6Dio0pb+MmEI6PYDaNHup/IsrblHGW0=
X-Gm-Gg: AeBDietPeXRfFxzdS5zxEoGNjF+rYO65B+Ua0e0vGVnock2mZaKMYmD8GY2Hll90lZ8
	XrLRUW5jT5swO2IOXPVacP8V5nRAsx9CrYRClhrrCzKFzku681Toe7fJtYqxhuMFnXQ6jWHS5Zc
	WpcOhiJXof4TVL0jYZNubScmSMh6h34eZG7i/PX+bbQmdz3X0hFobktR1ONG09LsIbNP5elaa1y
	OetQaL2s6tOJ9E1emPVWiEEA+NGZyLeLlI0YvQ92BCI1DE46AMDJ0aextvMFCWd7b6PNXTCz0C1
	/H2YwnUD6XJGLvpAyE2ekEVuumhyYyuhmC2icJuRhR2xc8Jqceg1z37RPvpTuwzPWcgBSDGjY/7
	OlxdTuH1ikmIQylt7Q/fBdm9sycVj0g3L2k45i4Zu4Tpl1u6W5WpnupZz7LotZOPcQ9RHy2+9vo
	tbIkWqDSTSEE1pZ61riX1Q+pNs9mVwpF+r+gUCM8mF7w==
X-Received: by 2002:a05:6830:411c:b0:7d7:ecf8:6b with SMTP id 46e09a7af769-7dc27c67914mr8164751a34.2.1776128462835;
        Mon, 13 Apr 2026 18:01:02 -0700 (PDT)
Received: from linux-dev ([12.26.11.218])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc269d3255sm9964556a34.25.2026.04.13.18.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 18:01:02 -0700 (PDT)
From: Adrian Wowk <dev@adrianwowk.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org
Cc: i@zenithal.me,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrian Wowk <dev@adrianwowk.com>
Subject: [PATCH 2/2] usbip: vhci_hcd: reduce CONFIG_USBIP_VHCI_NR_HCS upper bound to 32
Date: Mon, 13 Apr 2026 20:00:50 -0500
Message-ID: <20260414010050.158064-3-dev@adrianwowk.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414010050.158064-1-dev@adrianwowk.com>
References: <20260414010050.158064-1-dev@adrianwowk.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[adrianwowk.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-36224-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[adrianwowk.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dev@adrianwowk.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[adrianwowk.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,adrianwowk.com:dkim,adrianwowk.com:email,adrianwowk.com:mid]
X-Rspamd-Queue-Id: 2174B3F4BCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Each VHCI HC instance registers two USB buses (one HS, one SS).
USB_MAXBUS in drivers/usb/core/hcd.c is hard-coded to 64, giving an
effective maximum of 32 VHCI HC instances (32 * 2 = 64 buses).

The Kconfig range for USBIP_VHCI_NR_HCS currently allows up to 128,
which will cause probe failures for any HC instance beyond the 32nd.
These probe failures trigger the NULL pointer dereference fixed in the
previous commit.

Reduce the upper bound to 32 to reflect the real maximum imposed by
USB_MAXBUS. Note that probe failures can still occur below this limit
if real hardware has already claimed enough USB bus numbers, making
the NULL check fix necessary regardless.

Signed-off-by: Adrian Wowk <dev@adrianwowk.com>
---
 drivers/usb/usbip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/Kconfig b/drivers/usb/usbip/Kconfig
index b9f94e2e278..50945b6fae1 100644
--- a/drivers/usb/usbip/Kconfig
+++ b/drivers/usb/usbip/Kconfig
@@ -40,7 +40,7 @@ config USBIP_VHCI_HC_PORTS
 
 config USBIP_VHCI_NR_HCS
 	int "Number of USB/IP virtual host controllers"
-	range 1 128
+	range 1 32
 	default 1
 	depends on USBIP_VHCI_HCD
 	help
-- 
2.53.0


