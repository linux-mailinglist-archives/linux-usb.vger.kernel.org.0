Return-Path: <linux-usb+bounces-18641-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6D89F6374
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 11:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27B5B7A7AA0
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 10:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80366198A07;
	Wed, 18 Dec 2024 10:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sundtek.de header.i=@sundtek.de header.b="ezATlpL9"
X-Original-To: linux-usb@vger.kernel.org
Received: from sundtek.de (sundtek.de [85.10.198.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62D250276
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 10:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.10.198.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734518374; cv=none; b=u7FZBNiYseeLRSol8yv1MieR30pt/ddX/FId7fKcIWvaKh/IVEB+fxG6LPU2v6MvfKicTrHrWFr1O+oEvbn7KjD2tuCdhzHnm+QCdM5oV2T16Jva5fogWNaMJiRErytX5uj3y/CUWHWeIw2gIjH5kn6IAv1/PXcemD0I/+0mFmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734518374; c=relaxed/simple;
	bh=kNJvys9W98HEREJbPMgM5B1ukuBf4BHqwc+4NXI5sPI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fZ1ZmzaOkv8TYxoCebviq1cDDFuxFkH+R8j6r9KzUFDKx6JlXWGwe77QELTRZxXTfFdJIfE85078p1/TOMv/ajWNRjztVbKaqoYHl676OmQduUSDSZWFjCKRGaYN286PsOAHg2WIpqhX9QXnIwlwAuZOwyq9cDfGZEz9TZr14gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sundtek.de; spf=pass smtp.mailfrom=sundtek.de; dkim=pass (2048-bit key) header.d=sundtek.de header.i=@sundtek.de header.b=ezATlpL9; arc=none smtp.client-ip=85.10.198.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sundtek.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sundtek.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sundtek.de;
	s=202411; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=kNJvys9W98HEREJbPMgM5B1ukuBf4BHqwc+4NXI5sPI=; b=ezATlpL9KhHOs8Gglqr6Gx8RZ9
	TFC2vFyIIcPdTvzH5RM1AtDKQkuUlwQ9+kz1L+6/Gh/RbBcKB5sh/VFN7s8Sm86wfuBtKKIz07ds6
	YpUYObTa6ViJKXQNRVoqg8w99DEIrdHi+Raq8yrqH+A3v/NTNMlEurmrD5EgPvUCjRCAW4A/mRaOS
	aeXNY3608NrkNs4aICE5U6OXaIq3KaWyZIgULSwvIzS3TyJqlg2G9cT6av9cOMwtQlMVZ6ldsfTLZ
	sjMJ7OvS2tez6NHdM9NPYRD3FiYC7TcTJ2QCPPgA3eEDN16cmTi0PVE8lEFaQgVAtYCHpKFndUx3Z
	vS/JdD4Q==;
Received: from Debian-exim by sundtek.de with spam-scanned (Exim 4.95)
	(envelope-from <linuxusb.ml@sundtek.de>)
	id 1tNr3o-00DNj4-Om
	for linux-usb@vger.kernel.org;
	Wed, 18 Dec 2024 11:13:44 +0100
X-Spam-Report: =?ISO-8859-1?Q?
	* -1.0 ALL_TRUSTED Nachricht wurde nur =fcber vertrauensw=fcrdige Rechner
	*      weitergeleitet
	* -1.9 BAYES_00 BODY: Spamwahrscheinlichkeit nach Bayes-Test: 0-1%
	*      [score: 0.0000]
	*  0.0 TVD_RCVD_IP Message was received from an IP address?=
X-Spam-Level: 
Received: from 111-254-20-73.dynamic-ip.hinet.net ([111.254.20.73] helo=[192.168.2.197])
	by sundtek.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <linuxusb.ml@sundtek.de>)
	id 1tNr3k-00DNir-6s;
	Wed, 18 Dec 2024 11:13:40 +0100
Message-ID: <4e5403bfeaa656a42f145c217ccc7e58c993bca6.camel@sundtek.de>
Subject: Re: USB Autosuspend
From: Markus Rechberger <linuxusb.ml@sundtek.de>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Date: Wed, 18 Dec 2024 18:13:35 +0800
In-Reply-To: <3e9d6d03-eed7-4f46-9926-4d395c0bc46d@rowland.harvard.edu>
References: <77b79e95c092511a695ac0b6a8eade57b12ff3db.camel@sundtek.de>
	 <3e9d6d03-eed7-4f46-9926-4d395c0bc46d@rowland.harvard.edu>
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

On Mon, 2024-11-18 at 22:11 -0500, Alan Stern wrote:
> On Mon, Nov 18, 2024 at 04:13:29PM +0800, Markus Rechberger wrote:
> > Hi,
> >=20
> > we repeatedly received issues from customers with usb autosuspend,
> > our
> > devices are randomly disconnected on some systems, it did not
> > happen
> > many times but if more than 4-5 customers report this there's
> > usually
> > some real issue behind that.
> >=20
> > I'm asking here because the Libreelec distribution recently got my
> > attention that they seem to set usb autosuspend to -1 during boot
> > time
> > so they probably figured that out much earlier with other devices.
> > I have never experienced that issue on an Ivy or Haswell based
> > system.
> >=20
> > Were there some issues with particular kernel versions in the past
> > or
> > are there any issues known in general with USB autosuspend?
>=20
> I'm not aware of any such issues.
>=20
> Do you think you can get kernel debugging logs from your customers=20
> showing examples of these disconnections?
>=20

one customer just replied his problem is gone since he disabled auto
suspend (that was the latest one). He tested it since the last mail to
the mailing list.

Do you want any particular logfiles / logging from him?

Best Regards,
Markus

> Alan Stern
>=20


