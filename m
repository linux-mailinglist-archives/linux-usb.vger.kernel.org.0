Return-Path: <linux-usb+bounces-23048-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A2AA88D1D
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 22:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3C4216D218
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 20:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376241F1518;
	Mon, 14 Apr 2025 20:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="euMvOCjK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B20B1E5B88
	for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 20:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662533; cv=none; b=lu1nHb0NkN+L1qW6aQqACE4EcYd03yrmGJ4u+QpzbbYN4slUpYAf7uRFsuftSY5yDrekg9fR1s6x6bd/uvRlj+8mcehb5uyrFgMftTczxuI9HtoLv4NErQZqECdoUx090UzS2TcPczNiRw8gjIKL3lkxCdGhuQPg5JgMeCwmihA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662533; c=relaxed/simple;
	bh=c4E++3f2MDMsNPMEJdXDfgwYQoGSbwjYzUZTLh3w6c8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LRAeIrmsBuAQ2nd1Ov1ah/oDS4c1BZUzmdFjWja8SLeKPg8ryk/Na3JhAMqgPWO4b7mPIjDtAI/yynDnq0E9tvsLRSkwAyKWtjkHxFMOKEgZ9pRs1X2JlfnhRtneJv3MvV733YiQdaliUz3g0np9ycOpyZrL0YIP8WKFaDP6l4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=euMvOCjK; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744662529; x=1744921729;
	bh=6DixGtBaeZaFqPX3S+avGICBN1tFkPrHCpETt4l8pPk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=euMvOCjKsRb8msU8eb+xhR2aYQhqovaS6hsIfkXEEuMt2ttrfwyMKPjbdGPjndzvq
	 zepiPpmN2bkZLn5hdB2/a45FcW8Xar0/v6AfaI8NWMvkQQ0p1y6tE/FWi3tqp+N07G
	 dlOxdnWxs2OI+uEATDOYrw9mwzlP8AABDB47uzqwOIXo+VJErvrKYwzAtoHcUDwbxY
	 KXRtJ9KT4dixOT/Dy8ZJVs+IDb0ypdKyKI/L+wPiDjIIzzSdp+v3vI5IIYlQw8hXRt
	 3Z7cGdfl/cipHh9qXzT+euHUscPG2dl/2YaQvvCcY9nkmZ7IZEKGe60/axw8k1BmvU
	 1nb9rSiPn3wWQ==
Date: Mon, 14 Apr 2025 20:28:44 +0000
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH v2 RESEND 5/6] USB: serial: ftdi_sio: Fix misaligned block comment
Message-ID: <20250414202750.9013-6-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
References: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 0f7ef7f73454445c0ecfd37ef81b80e1bf3078aa
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

One of the block comments was misaligned. Fix it to align with code
style.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---

v2: Split the patch into smaller patches

 drivers/usb/serial/ftdi_sio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/ftdi_sio.h b/drivers/usb/serial/ftdi_sio.h
index 55ea61264f91..d671d2194c64 100644
--- a/drivers/usb/serial/ftdi_sio.h
+++ b/drivers/usb/serial/ftdi_sio.h
@@ -95,7 +95,7 @@
  *
  * The Purge RX and TX buffer commands affect nothing except the buffers
  *
-   */
+ */
=20
 /* FTDI_SIO_SET_BAUDRATE */
 #define FTDI_SIO_SET_BAUDRATE_REQUEST_TYPE 0x40
--=20
2.34.1



