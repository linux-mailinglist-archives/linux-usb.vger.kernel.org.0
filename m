Return-Path: <linux-usb+bounces-24242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D83A1AC1567
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 22:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 404671C00857
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 20:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4237C2BF3C9;
	Thu, 22 May 2025 20:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="poEzFVVv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234C82BE7D3
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 20:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944684; cv=none; b=UU4p8B2QfkuIKpAE7/KmoGKuoYBru00LlFfHdSOSEZ+tH7+7rCbaSHM7g/eUiwxTgCkEMQRPKswoLiO8OwW0Vq8nM+etivy13NYfui80PT2L2rmtAkWZWOoWQRjWegCYRU29lC56jo90+9Wu7e299dNV5+qN4UM5lX0AFb7KW7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944684; c=relaxed/simple;
	bh=ykfx4zEfkPJfD8WwsU5C8Nk1yDWEBwjY87/MbjpxZOA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hv+gtGFowKSdbCc+BeVYsUkCHiub4Biu6Tjw3LZH7b5AMiH1LaijrK5STg5D3IPgtt/RmEatbPjGLWGxfBqSDLIzWH6B+zMr9LdzNfHDh/H9yY+o/3n/zjW1gbybxAkK5yitqr/hVaY45GActbH8veDoDJtT6Zyw3CKqT6N3AY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch; spf=pass smtp.mailfrom=protonmail.ch; dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b=poEzFVVv; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1747944673; x=1748203873;
	bh=I98BSED0n9TGha8/hIe2pFeSKwv/4ehj3ZCQsbq0MQ0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=poEzFVVv2x98r5cakyfArfJw713PobMRyFWYA072hzMToOI+CA678zpS6biyCwOly
	 bFJgFdkWO9Dru5j6Qg6xvh5EIQx2eWcrU1NkOcoU4cD+o3u3YnPK12joQmFce0mIxf
	 gpX1ZCKwT0TMApH6Vz2v58tWfdGJlPo7gVjQdMt2cjO6PhBnTMzSSGLPw+5spkXrWF
	 e8vhtrOkQZ9hnTWQQblh9pQrBD6KCD2hHCdXjW7FYwPNkTSoU8hNSd0PIwZJO3Ih1w
	 vEFXPmlj/g4wrKrgCLX24GwWdkDzA7ZxQ304hz3dkoAtxCkCK4a7iDkmyQApQPgUON
	 rbhj063KFLFDQ==
Date: Thu, 22 May 2025 20:11:07 +0000
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From: Kampalus <kampalus@protonmail.ch>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: quirks: disable LPM for Xiaomi fastboot
Message-ID: <NlJ7bhWZBDatLxx8gt6X9CKi8u2oiRtCatIn6yHo68o8KUYM-qBCqPyNLSbCQx6th39-0uMLtTk18AYC4TQFj-aHEt2Xw9rPJzWMFgWexmI=@protonmail.ch>
Feedback-ID: 30624081:user:proton
X-Pm-Message-ID: c2f17cec743f1b7a1b8a126421e90d6d4547ed5f
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Both Xiaomi smartphones and AMD Ryzen systems have sketchy USB setups. When=
 combined, fastboot
fails to read and write data properly. Disabling Link Power Management work=
s around that.

Despite only being useful for certain setups, let's enable this globally as=
 it does
not hurt healthy setups.

Signed-off-by: Kampalus <kampalus@protonmail.ch>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 13171454f..57f747776 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -552,6 +552,9 @@ static const struct usb_device_id usb_quirk_list[] =3D =
{
 =09/* INTEL VALUE SSD */
 =09{ USB_DEVICE(0x8086, 0xf1a5), .driver_info =3D USB_QUIRK_RESET_RESUME }=
,
=20
+=09/* Xiaomi smartphones in fastboot mode */
+=09{ USB_DEVICE(0x18d1, 0xd00d), .driver_info =3D USB_QUIRK_NO_LPM },
+
 =09{ }  /* terminating entry must be last */
 };
=20
--=20
2.46.0

