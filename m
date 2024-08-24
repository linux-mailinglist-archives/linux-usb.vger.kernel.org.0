Return-Path: <linux-usb+bounces-14033-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FE995DC53
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 08:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 559B61F2264A
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 06:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF46B14EC73;
	Sat, 24 Aug 2024 06:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="nG91sv1r"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3711F762EB
	for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2024 06:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724482276; cv=none; b=Y7sedBlLmQ3P+uwU+LJQDccm73n4/OMNjIHBQUIpRDQlvdHBvyt3l8BycZn8vrcsdq6zXfh+ZE7bIgPKak4ZFG7MhndHoCrcBCPYLSvK9tqgZTyj+kl4kPuKW83VbUkJhr1gaf67HRU3kmPY8wr2T8milhdHDR5mCBeIUqtWW0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724482276; c=relaxed/simple;
	bh=OsC8X32x+u7rmaG1B9ycDZv/+N0FAOKPjGVokQDQArY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sd862UdFCbITEV6GsneHss9m5SbGY74BKHTykSxZWv5/PEePco+lFgvtOq8WxvdScCOD0nRdUfJ+01hhgAt5p+B4paAhS7Kk11ladPwU8X+FtpJcpBfMJvEHOd9KXLhZGnwOK/fjbIcVSuL5AjBzSbtf3kErOQz7rRAyd+5Zkso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=nG91sv1r; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id 966311249242; Sat, 24 Aug 2024 08:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1724482270; bh=OsC8X32x+u7rmaG1B9ycDZv/+N0FAOKPjGVokQDQArY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=nG91sv1rS5ns9M1GiYmaoBgBBWloK+7XWOxXrOGpzL0Y4ERRRw7wxM3vw6PiV+dQA
	 MuFaGyMLZYnQXn/TDr7kr7Z0dTYmZKi+O4ILDaKFDJEBsY4TNBWXG4mPZLbZJFHbIF
	 EDeF+oRK34oVjw+qTSD5TsJSZGcLSxzzXWRN79WonZMTPW3qebFK6COrgymvnMGiPk
	 Q7tpXzYx51rEi+nI6MYycXGion2TXzbCoDtpn4js52dQXZ8J010EmPH/7QahpYS7fT
	 dNB/pL+KutpCoajnfrn76yqmf0a5e83HWGDxQSJTlLfjOcNeYD+uux2WrbZ0NatDUn
	 AO/90SFfunLoQ==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id 97355124203B
	for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2024 08:51:03 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 8AD0676CA50; Sat, 24 Aug 2024 08:51:03 +0200 (CEST)
Date: Sat, 24 Aug 2024 08:51:03 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: linux-usb@vger.kernel.org
Subject: Re: Strange issues with USB device
Message-ID: <ZsmC1+ko50RcvE9a@alphanet.ch>
References: <ZsjgmCjHdzck9UKd@alphanet.ch>
 <20240824084437.342426dd@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240824084437.342426dd@foxbook>

Hello,

On Sat, Aug 24, 2024 at 08:44:37AM +0200, Micha?? Pecio wrote:
> What sort of kernel is this?

5.10.0-32-amd64 #1 SMP Debian 5.10.223-1 (2024-08-10) x86_64 GNU/Linux

If required, I can try a backport 6.x, or even compile manually
a last stable 6.x

> Looks like there are some stream-related xhci_hcd bugs here. You may
> have more luck with UAS disabled if you need this system working ASAP.

There is no urgency, but yes, I will try that.

> Not only SMART is failing, but also ordinary block reads and maybe
> writes as well, so it could potentially be a risk of data loss.

I am test-qualifying this system for a few weeks now, and that bug
only happened under very high load, apparently.  So far no data
corruption (data comparison is part of the test).

> For debugging, it would help to have a reliable trigger, like "happens
> every time I run smartctl manually" or "every time I do it while
> 'cat /dev/sdc >/dev/null'" or at least "often while <some workload>".

This seems to be encountered when I do an array check with mdadm,
and when I adjust the min and max speed to the max.

> I am able to find the PCI adapter responsible for a USB bus like this:
> 
> $ ls -d /sys/bus/pci/devices/*/usb8
> /sys/bus/pci/devices/0000:02:00.0/usb8

Thank you.

