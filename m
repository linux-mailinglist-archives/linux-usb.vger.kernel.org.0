Return-Path: <linux-usb+bounces-23049-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 194B5A88D1F
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 22:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAC8017D674
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 20:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148131E1C3F;
	Mon, 14 Apr 2025 20:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="OeOYxhT5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2107E1E7C24
	for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 20:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662540; cv=none; b=lEmdNB/ke2co8mAaRK9J/F8f2mtlqf314ORkzxdDsq5+OBd5ocLLIsgX9hrPrnc47FCpU1dtYQLI2IZDjLsfzyeMhwLSQ2YraHB8dU/2xdZcygKd/GB2a+zYqfp3tt7ZvweGeGjQt3brZnqf6Y/y2eVeXdN0WgEeWRKXzfeXJVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662540; c=relaxed/simple;
	bh=GNu+kahqRURr3jBKGFOwVS7xGN4jr0+9cKSPvRimRUQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XlvICTbxTcRmGNY4dHmmyeSFzcRpdaWUEmLJkCpYcTBtySW4l9UCVhENlLkqSvVbv9ODt4vpFc5L9RnbP04cB9OAY5APdImJspEl48HO9jbzze96s/3tL9YxeySjCEmq5qqxjodWUfdWTceDdt7NL0aNus5FfVBov75AzdjV28w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=OeOYxhT5; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744662535; x=1744921735;
	bh=u5mBsTab4mA8udrpnBydbaZhEo5uyqSSg9IwaotnLuw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=OeOYxhT5w5WuFRgp4gIw7Wy+mOLcZQurVcmpRfJXhdMhIY4LVQG926gwhoFmFpIvD
	 JBXbrrmKS6zIGZ9jzODB95h0PBzWlU+fu4ilIDqsIDmhXF+4PdYDeCfV/GWQreash2
	 i58ocZmCR3rEZSaVGt1mhiUIB7eoX7yQBHDhZQK5mnwZtQlqGP4aBGwAktJbcpDoS7
	 nUIuzDSoDdM4duKeAzgGL9vmUoOjeSu/caSz9huhdXB4IbZ4AFLe4Wvtv7y5lhH2xi
	 T54m7Ixsp35Wb5aADzz9CeKuJhCaMUeTBehSHYhh+zSJY9qg2IfEd4qj3UNWhUqngx
	 J5+98TPrdDajw==
Date: Mon, 14 Apr 2025 20:28:51 +0000
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH v2 RESEND 6/6] USB: serial: ftdi_sio: Remove space before tabs
Message-ID: <20250414202750.9013-7-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
References: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: f042265354f45c23594c973a41aad8e4bbba6fba
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Remove superfluous space before tabs in defines to align with code
style.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---

v2: Split the patch into smaller patches

 drivers/usb/serial/ftdi_sio_ids.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_si=
o_ids.h
index 52be47d684ea..3d9f6ed97783 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -1022,7 +1022,7 @@
  * Kondo Kagaku Co.Ltd.
  * http://www.kondo-robot.com/EN
  */
-#define KONDO_VID =09=090x165c
+#define KONDO_VID=09=090x165c
 #define KONDO_USB_SERIAL_PID=090x0002
=20
 /*
@@ -1446,7 +1446,7 @@
 /*
  * Accesio USB Data Acquisition products (http://www.accesio.com/)
  */
-#define ACCESIO_COM4SM_PID =090xD578
+#define ACCESIO_COM4SM_PID=090xD578
=20
 /* www.sciencescope.co.uk educational dataloggers */
 #define FTDI_SCIENCESCOPE_LOGBOOKML_PID=09=090xFF18
--=20
2.34.1



