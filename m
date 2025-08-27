Return-Path: <linux-usb+bounces-27319-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 803DAB37DF3
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 10:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CA437C0F56
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 08:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0375F3314C6;
	Wed, 27 Aug 2025 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZaN/nhGq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCBF20ED
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 08:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756283835; cv=none; b=ACUXYcaNbOQVtn6cG4zdZxQpnNo4H7cBiF82BgYDbzjGiYtdKt5ivyOXWKXK8+QJ5f17sv4pUGKNc/2apJzRLDNBNhQ5TeVAfL1sdoUNEAGlotVgiT31qo3YPIAa85vgZnxOYY2Y5zkddl+/b7kHMHa4wpPQJQmJY90FQA0LeJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756283835; c=relaxed/simple;
	bh=9dzCyQctSb5gfPXKA+y7/2vQ+tun0+KtQsTi+l6v8tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKaOXjGA+Ng4K1m8k5bMiCjZS7Bux7ZvWnJHetjIfy/P5xcJIBegZL1zMF2s9eeVMPXWUwh3qDfaZKkSk4MyiFHnVCv13Xx4M2nLFcdMMOjrSRwoIuh6enmpAzadRLFnYGkDCLbI72zj8ZnuotHBzOgvHD4JIUawERZHK+DbyFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZaN/nhGq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B154C4CEEB;
	Wed, 27 Aug 2025 08:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756283835;
	bh=9dzCyQctSb5gfPXKA+y7/2vQ+tun0+KtQsTi+l6v8tU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZaN/nhGq+2+c/DrsWLR9QgPhR1VrPcZRBreXM0mdtrJmW4tl+7zd6Ioegx2aEGMZM
	 z3rnnyF864uy0qDmhNJRj2Cnr/2NMZrrh0LLwdzy3aUjgDdsUIUFYoihKD9GS0JZaD
	 j58g3lUQ4uBxkDlggR5TxaixWLqB1vsSzVloxvXAguPCGR1lZP7etJ0Sy9Bui36XSe
	 UFw09EwB2uwe2zSr8X86cJE5kmpqEYF5WAe3IN6zGtvMyuKJht+Flxi32Z1gUpaMpu
	 s597sq7pWgu6noDj5JINQGb2xQ98dMF3lCJ04GywzU6/llgdmsyCFnoosOm2obgP5h
	 Bj4DiBE687ShQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1urBeQ-000000001Bs-0yJq;
	Wed, 27 Aug 2025 10:37:02 +0200
Date: Wed, 27 Aug 2025 10:37:02 +0200
From: Johan Hovold <johan@kernel.org>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 220331] New: FTDI serial IO - unknown device type: 0x8312
Message-ID: <aK7DruP4nmgw0gjy@hovoldconsulting.com>
References: <bug-220331-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-220331-208809@https.bugzilla.kernel.org/>

On Thu, Jul 10, 2025 at 09:11:14AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=220331

> Issue with a newer hardware with USB DisplayLink adapter, syslog throws
> following error about unrecognized device type 0x8312:
> 
> > [    4.447826] usb 1-8.2.1: New USB device found, idVendor=17e9,
> > idProduct=ff00, bbcdDevice=83.12
> > [    4.447833] usb 1-8.2.1: New USB device strings: Mfr=1, Product=2,
> > SerialNumber
> > =3
> > [    4.447835] usb 1-8.2.1: Product: PM1000
> > [    4.447836] usb 1-8.2.1: Manufacturer: DisplayLink
> > [    4.447837] usb 1-8.2.1: SerialNumber: 9638293100007141

This does not look like an FTDI device and as far as I can see ftdi_sio
driver should not even try to bind to it currently as the VID/PID is not
in the driver's match table.

> > [    4.479297] usbcore: registered new interface driver ftdi_sio
> > [    4.479363] usbserial: USB Serial support registered for FTDI USB Serial
> > Device
> > [    4.480786] ftdi_sio 1-8.2.1:1.0: FTDI USB Serial Device converter
> > detected
> > [    4.480848] ftdi_sio ttyUSB0: unknown device type: 0x8312
> > [    4.480923] ftdi_sio 1-8.2.1:1.1: FTDI USB Serial Device converter
> > detected
> > [    4.480957] ftdi_sio ttyUSB1: unknown device type: 0x8312
> > [    4.486014] ftdi_sio ttyUSB0: unknown device type: 0x8312
> > [    4.486049] ftdi_sio ttyUSB1: unknown device type: 0x8312

Please post the output of "lsusb -v" for this device.

Johan

