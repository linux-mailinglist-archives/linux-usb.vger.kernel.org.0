Return-Path: <linux-usb+bounces-36312-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFT3DnTX42krLQEAu9opvQ
	(envelope-from <linux-usb+bounces-36312-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 21:11:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 798BC42206B
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 21:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBE2A3054C1A
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 19:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7DC331209;
	Sat, 18 Apr 2026 19:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exponent-digital.20251104.gappssmtp.com header.i=@exponent-digital.20251104.gappssmtp.com header.b="XkLxoPOY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B1D331A77
	for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2026 19:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776539396; cv=none; b=nPzQjfk+vajAhBCtGqvBydRhXiT2nlm8Ex5yzkfnfHqCNtBX6hIWE5+DMWwUamVssRoKh+MdgakEJNIJELgO3oqAB/23lU4QcyRBE96K/TYyY7A+qMcMHafGV03a4cSBsbv875UQ/aowh0z+isosY+QQOUqae2VgvJhResTrTyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776539396; c=relaxed/simple;
	bh=6phJpfo1/TgeG8CqA+xEvmPHdhxQxxft5quGLReGZHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8S3Dr8AQf0jn4ZWiE0Mj2Q3Vp6r1vFkmpGZbDfDFAlfZjatsEp/zooqhy7fknpK8Ek2qKSOCKDR14/gFRItTglWFLfh5pdzcyJcifrN4HRIsyjmfUEEXB28voWhmmcRGzEGo6Md5oqo2Vr3DzPKPICtMEaFNBOFgIFmsy+8bjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exponent.digital; spf=pass smtp.mailfrom=exponent.digital; dkim=pass (2048-bit key) header.d=exponent-digital.20251104.gappssmtp.com header.i=@exponent-digital.20251104.gappssmtp.com header.b=XkLxoPOY; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exponent.digital
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exponent.digital
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3591cc98871so770984a91.3
        for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2026 12:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exponent-digital.20251104.gappssmtp.com; s=20251104; t=1776539393; x=1777144193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Re1Tn3EYlmJfQ0pcPCyVC6b+63SUz0TaqbSl7xgqkiY=;
        b=XkLxoPOYYMkbgFHcqqze0SaVjE04qGPrjTqyx0pHXeGY+BGlpuyNi+12ANIfxovjXk
         HFMPgf6MWMRvHR7OqToaVkdlCkRt9w8CWt4e3nIencN5ND3VvGDiID3kZ9N+ycx5CSWW
         V8s5fElOV6IsyVamRPsbtC0BeUVUIoyOdb0ApbZknuT/E9LKkfTLAApOBLBCMVDcs/Uj
         RCbt2ATm1KoF7seP2594DEfd2VfctXMu0tAykEh/wlkvtAAArZ+mifkQ6SvkhqECaRXz
         3b0XBxdVcBkxe15u4g5xfDFp3twtJUcYEnvyH0vIPfYVcAefz8nQk7C90UfqXMqDRaQW
         VKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776539393; x=1777144193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Re1Tn3EYlmJfQ0pcPCyVC6b+63SUz0TaqbSl7xgqkiY=;
        b=dB0c+mqZZ4fmZ4a76+DA8IfV498uBGIzOmIJY8W6sOqMkbk1umlMmFL+Grg/tO/BR2
         C/6WTZCP7/tybBPncPqpus2eDvCspG+lBWLh6WJ2PgG6mhAepm9X2YddLzHkI/RI/ARk
         ERTMPuK2zziQNO62pytlJHfGkNaVrb+Imsg8X9/4ZjuOEw38+vIcs1lvOl5xQDjNquzW
         bGDtohth38u9tuzUVwp2bxVLQjUCvhdkvCwc1sCgMqQ1GgddMhhhQhg9/gI4fBRkHTI0
         b045lZ6WRI1WVFL3F0N+wbHZW8nRgFj1vNwXNw7UpgNHSCpclzNEXdEIkRgnE2am4WKT
         wuSw==
X-Gm-Message-State: AOJu0Yya22DHrEY+Qp85LzNGdGya/wbapzbXb1WEOL9TvDY+6DH/6uX3
	ZlImIN4O65QxgkJPfjVDrCwaR6DcdQXkHJ914xhvzAgVkQLXb5sD/y2OM5d+Sm5BTtM=
X-Gm-Gg: AeBDiet2ycsmNN7o0t4w0IZgx++Fk6mE4ncJHgC/Ua34e/nxnXPtTi0pmrLfY6/pt9T
	Yb0GsIqRefhuVkZ0mOEW6wlNG3oMpjyXn2Q2ufFdsiwZmVzsFQfdFRxlBSBEiAhyoLY/aKCqAuC
	qAsjLF7OqiDLY+uwf59ItLjDNpG/rfzOgwD7gwkoS1u1ydFNzpKpNOcuSzDyULaqdvjAsG2w5Dw
	Jed+3weQQzd7YoTpaoCsW7SiRFHZEKguPuTL1ToLqwzLv5ABpn0DQ3iNe2/ujHZQ6lSz2qHX2aK
	Muq2x9ijw05Ho74gFU+g19YdN9To98znIUHxQswmk+1c/dnCQAEFNO/ovIlq/dLPRvGLp3SdQUW
	DUBz3/dZRep4dm34yU60dq5SaYgOeE8kfBwdb4ld3k3ECW4HVuH8Y4Z4FxkR4xk1PK1ZoKfH7Uz
	2m5Jgi1P3TKEh3LQozGAne5qXe/6n8Ihc97Un4doj/DO8wnJGS
X-Received: by 2002:a17:90a:d09:b0:361:45df:102 with SMTP id 98e67ed59e1d1-36145df0c75mr3987589a91.17.1776539392671;
        Sat, 18 Apr 2026 12:09:52 -0700 (PDT)
Received: from yohji.localdomain ([101.100.136.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36145fe05f4sm2043031a91.0.2026.04.18.12.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 12:09:52 -0700 (PDT)
From: Taylor Hewetson <taylor@exponent.digital>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taylor Hewetson <taylor@exponent.digital>
Subject: USB: core: sanitize string descriptors against C0 control characters
Date: Sun, 19 Apr 2026 07:08:58 +1200
Message-ID: <20260418190858.19865-1-taylor@exponent.digital>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418025823.21767-1-taylor@exponent.digital>
References: <20260418025823.21767-1-taylor@exponent.digital>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[exponent-digital.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[exponent-digital.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36312-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[exponent.digital];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taylor@exponent.digital,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,exponent-digital.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 798BC42206B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some USB devices report string descriptors with a declared length
greater than the actual string, leaving uninitialized firmware memory
- often including C0 control characters such as 0x18 - appended to
the returned string. This has been observed on the ASUS ROG Azoth
2.4GHz dongle (USB ID 0b05:1a85), where the trailing bytes make their
way into hid->uniq and then /sys/class/input/inputN/uniq.

Downstream userspace components then reject the device. systemd's
sd-device property_is_valid() treats any string property containing
control characters as invalid and refuses to set ID_SERIAL_SHORT,
which in turn prevents the device from being tagged with seat. On
GNOME Wayland, mutter silently declines to open input devices that
are missing this tagging, leaving the keyboard visible and producing
keycodes at the kernel layer but dead to the user in a graphical
session.

Truncate the returned UTF-8 string at the first C0 control character
(0x00..0x1F) or DEL (0x7F). Printable Unicode beyond ASCII is left
intact, so legitimate non-ASCII serials (e.g. European manufacturers)
continue to work. Callers that previously received a string with
trailing garbage now receive the clean leading portion, which is
well-formed UTF-8 and safe for all downstream consumers.

Signed-off-by: Taylor Hewetson <taylor@exponent.digital>
---

Changes since v1:
 - Move the sanitization from drivers/hid/usbhid/hid-core.c to
   drivers/usb/core/message.c so that all usb_string() callers
   benefit, not just usbhid. (Greg KH)
 - Broaden the scope from "ASUS Azoth workaround" to "well-formed
   string guarantee for usb_string()"; update commit message
   accordingly.

v1: https://lore.kernel.org/all/20260418025823.21767-1-taylor@exponent.digital/

--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1052,6 +1052,25 @@
 			UTF16_LITTLE_ENDIAN, buf, size);
 	buf[err] = 0;
 
+	/*
+	 * Some devices report string descriptors with a declared length
+	 * greater than the actual serial, leaving uninitialized firmware
+	 * memory (often including C0 control characters) appended to the
+	 * returned string. Truncate at the first control character so
+	 * callers get a clean, well-formed string.
+	 */
+	{
+		int i;
+		for (i = 0; i < err; i++) {
+			unsigned char c = buf[i];
+			if (c < 0x20 || c == 0x7f) {
+				buf[i] = 0;
+				err = i;
+				break;
+			}
+		}
+	}
+
 	if (tbuf[1] != USB_DT_STRING)
 		dev_dbg(&dev->dev,
 			"wrong descriptor type %02x for string %d (\"%s\")\n",

