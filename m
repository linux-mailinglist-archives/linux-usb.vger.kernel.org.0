Return-Path: <linux-usb+bounces-22064-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B31A6E5A6
	for <lists+linux-usb@lfdr.de>; Mon, 24 Mar 2025 22:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36FF23B848A
	for <lists+linux-usb@lfdr.de>; Mon, 24 Mar 2025 21:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB21C1F0E4A;
	Mon, 24 Mar 2025 21:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="gCtBmTHn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05E6146A6F
	for <linux-usb@vger.kernel.org>; Mon, 24 Mar 2025 21:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742851106; cv=none; b=hD2wijsYOXuq9QpHoNYhEN8OPEgQkAhFuT/lOeKGPqRBf3BmIc0iQYDmVB+N/CtZtNutpFJDDDjl5I+lyurM58uezAonlIWEUclxmNwr2WHngge3vYrtvg4fEA9GVQT5JNTXyYNpBx0zLtqY3Nzq31A+cl0LQasuIwZGSLWA0Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742851106; c=relaxed/simple;
	bh=8SjZa3CmHvhU+LhLOx4jffMk+jRhfpsXqV7OR3OOGAI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YDgXpOBirqy6LMfJwW3E82O4sMyo6DaILejQOP+V3hdhDVh9dCmCiWxUcncDMufxzVLf6dd6mvWGAQuZhPFtCIoOAR/fzWe+HDmInmbRmhQjXlDfV4IUp5zgRWYrs50YbPITRsLTb53ptb9N6gsa4+4HHRtb7V4Mrllg1VmiH6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=gCtBmTHn; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1742851102; x=1743110302;
	bh=1glU/OShXpOA2ephq0ZPJD8B6OeSEFrC5TU1C54+82E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gCtBmTHnVJ0SVRnuc1NIc8rTmHyTFzbeb8ItEMh2A2rknYxzz8NM9KusDqwseD7jI
	 Lt7fMHJDkSQfYHo1f0JyNMXDVzhqVxpIh8Vb4hZcVxK6RQxHnINLR70dkjygv3usiV
	 0LSb4wSFvSvYqY7i8ZZJtcRhfVT7+TyircECYZKuT5SpipHuXRNOZf00TdjNUMcGvO
	 u7YAALZx6O06pNdoPH2/9zFxgm7cZyzBpPL32hUOAFzqKaZPakONgUaCTWCEXPR0z9
	 6Jh5lguruOR2M0Wq/54mF3scdr7CrSuk0WzGCookcdf8W7BNAhV5jI00QpVDv+u62o
	 dw0lT9azuMPyg==
Date: Mon, 24 Mar 2025 21:18:17 +0000
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH v2 4/6] USB: serial: ftdi_sio: Fix indentation made with spaces
Message-ID: <20250324211619.166988-5-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20250324211619.166988-1-dominik.karol.piatkowski@protonmail.com>
References: <20250324211619.166988-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 2986eb19734a35b66280da6c320cde2257c3a419
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix indentation that was made with spaces instead of tabs to align with
code style.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---

v2: Split the patch into smaller patches

 drivers/usb/serial/ftdi_sio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index c2b9b8edcc8e..60d24152e385 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -2625,8 +2625,8 @@ static bool ftdi_tx_empty(struct usb_serial_port *por=
t)
  * WARNING: set_termios calls this with old_termios in kernel space
  */
 static void ftdi_set_termios(struct tty_struct *tty,
-=09=09             struct usb_serial_port *port,
-=09=09             const struct ktermios *old_termios)
+=09=09=09     struct usb_serial_port *port,
+=09=09=09     const struct ktermios *old_termios)
 {
 =09struct usb_device *dev =3D port->serial->dev;
 =09struct device *ddev =3D &port->dev;
--=20
2.34.1



