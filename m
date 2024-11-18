Return-Path: <linux-usb+bounces-17682-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6149D0AA0
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 09:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D722AB2189A
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 08:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6086A14BF8F;
	Mon, 18 Nov 2024 08:13:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from sundtek.de (sundtek.de [85.10.198.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A347418E25
	for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.10.198.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731917618; cv=none; b=kqU1/0QgsFXYpmXOysAK5PGZD7Ka4q9rTJhx1v+UZ9bLnqkQpV5rywC/ILcHEaALpQrPDFBQfAnOH+3fe1Tp0Ix1CuaMdI6E0EqH2cARUMkP7NgUui3VHggy4gUE4axjPiiDDGGlWUU5SWE4bZZ8qNk0KSnNcnGw9u1ThXGVaK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731917618; c=relaxed/simple;
	bh=IYo4JUx9YwDL9Ip2iaqMzJ9qIIwhfj0QiZNZ86B0IM0=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=W48O1ww4TSnrwqoPr8SSklW+g6q7fGIdiI6kn0lgPSlMcgYxHAQnWIMe48yyLWeyx6fYo102uV4Bs4+uaAHOFApeBEip/kQDH9aC/G1+FxZcuWYO/imO8Ogthw1RhRccSXAO+6UKRjZ8deE5+BXFcQGoT+B3ZUmUy4m2rv8dj+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sundtek.de; spf=pass smtp.mailfrom=sundtek.de; arc=none smtp.client-ip=85.10.198.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sundtek.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sundtek.de
Received: from Debian-exim by sundtek.de with spam-scanned (Exim 4.95)
	(envelope-from <linuxusb.ml@sundtek.de>)
	id 1tCwt2-000991-U5
	for linux-usb@vger.kernel.org;
	Mon, 18 Nov 2024 09:13:34 +0100
Received: from 220-143-194-41.dynamic-ip.hinet.net ([220.143.194.41] helo=[192.168.2.197])
	by sundtek.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <linuxusb.ml@sundtek.de>)
	id 1tCwt2-00098y-Hx;
	Mon, 18 Nov 2024 09:13:32 +0100
Message-ID: <77b79e95c092511a695ac0b6a8eade57b12ff3db.camel@sundtek.de>
Subject: USB Autosuspend
From: Markus Rechberger <linuxusb.ml@sundtek.de>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>
Date: Mon, 18 Nov 2024 16:13:29 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: linuxusb.ml@sundtek.de
X-SA-Exim-Scanned: No (on sundtek.de); SAEximRunCond expanded to false

Hi,

we repeatedly received issues from customers with usb autosuspend, our
devices are randomly disconnected on some systems, it did not happen
many times but if more than 4-5 customers report this there's usually
some real issue behind that.

I'm asking here because the Libreelec distribution recently got my
attention that they seem to set usb autosuspend to -1 during boot time
so they probably figured that out much earlier with other devices.
I have never experienced that issue on an Ivy or Haswell based system.

Were there some issues with particular kernel versions in the past or
are there any issues known in general with USB autosuspend?

Best Regards,
Markus

