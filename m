Return-Path: <linux-usb+bounces-29176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ADFBD076E
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 18:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CAA624EAB83
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 16:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4CF2EFDBA;
	Sun, 12 Oct 2025 16:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Yfvx6U1e"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081942D6E43
	for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 16:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760286095; cv=none; b=YJvViB/fWCij2tqitVkWlSYzH70ZgsWJVIADnWcZudt7KXS4VCxWvafCk+/PvBAqI5wMoO4qgXjDb73v/iOZfbyvO10fzgFhIttbDdA7KyIl36EcR+RLXxLNLu++a8ZFKw0wqtxGuGaW3HLYdwl/VO3nQthnn3F6DTHLjz6vWTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760286095; c=relaxed/simple;
	bh=siuYGyKWzJMIuaTMKzFFdO2xodN/gtsZWSmBWTVmaHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Md+5VrvaZgcku7BBTd4QktY/8VQJQCkB42KmUs350yyXu+GAj7jIvBWFdid+r3aci3RM1mJIHlrnVz25ojRfPyuaxxyDm65ytc0N83uCQrRxkJvVb/T99N+RjwcpThllHMeB84JpAoK36062V1cBTJ26ZUsTxtVavo2C6tH75yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Yfvx6U1e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36414C4CEE7;
	Sun, 12 Oct 2025 16:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760286092;
	bh=siuYGyKWzJMIuaTMKzFFdO2xodN/gtsZWSmBWTVmaHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yfvx6U1eS2INxrmznHZZqgvQTeLXfpdDucvs92cCYyzOOT4f/Cn0l8IFGU39ywQ/t
	 t8SufUzY2MgB9IeQkKL0tVf2jhSF+/23UaVz4dkWJXNs80WmSGx0TknOrX6qXZKlwU
	 EYscvV2bnPMNl75tJLFOfBtEaRYgl2r6LB+PrHjc=
Date: Sun, 12 Oct 2025 18:21:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Henrie <alexhenrie24@gmail.com>
Cc: linux-usb@vger.kernel.org, oneukum@suse.com,
	Johan Hovold <johan@kernel.org>, vojtech@suse.cz
Subject: Re: ttyACM versus ttyUSB
Message-ID: <2025101238-mastiff-decibel-4b4f@gregkh>
References: <CAMMLpeRU72CMxHdF-rO9y1Nvzj9nPnuQTOZWcCrM4fOJ1byacw@mail.gmail.com>
 <2025101243-ongoing-truce-3aa5@gregkh>
 <CAMMLpeRrO_E3_c98OB9XvpiGNjhTetrw2ucFyaq5BByPWh58SA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMMLpeRrO_E3_c98OB9XvpiGNjhTetrw2ucFyaq5BByPWh58SA@mail.gmail.com>

On Sun, Oct 12, 2025 at 09:55:27AM -0600, Alex Henrie wrote:
> On Sun, Oct 12, 2025 at 12:07 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Oct 11, 2025 at 11:00:00PM -0600, Alex Henrie wrote:
> > > Dear kernel developers,
> > >
> > > I am very curious and I haven't been able to find a definitive answer
> > > anywhere: Why is the cdc-acm driver separate from the general
> > > usbserial driver? There are lots of drivers that use usbserial, each
> > > with its own unique protocol. What makes ACM so special that it needs
> > > to be separated out as /dev/ttyACM* instead of going with everything
> > > else in /dev/ttyUSB*?
> > >
> > > I can think of several possible reasons, but I'd really like to know
> > > what reasons matter to the kernel architects/maintainers.
> >
> > cdc-acm implements the USB specification for that protocol, which is
> > defined by the USB group.  All of the usb-serial drivers do NOT follow
> > that protocol and use their own vendor-specific ways of talking to the
> > device.
> 
> OK, so it's just a matter of policy that drivers for standard USB
> protocols name the device nodes differently than drivers for
> vendor-defined USB protocols do?

These drivers are decades old, originally written in 1999 and handled
different hardware types so they got different device nodes.  Just like
many different serial drivers today have different named device nodes,
it was just following that well-known practice at the time.

And that practice continues today, when people write new serial/tty
drivers, they usually name the device nodes something new, much to many
of us arguing that maybe they shouldn't do that and they should learn
from our past history :)

Also, cdc-acm does not support as wide of a range of devices as the
usb-serial driver does, which can handle multiple-port devices and full
hardware line controls, which cdc-acm can not as it's not part of the
spec for that protocol.

There was a time that cdc-acm almost did not become a specification due
to internal arguments at USB-IF, which is why the usb-serial devices all
were using custom vendor protocols first, before cdc-acm eventually got
ratified.

Hope this helps,

greg k-h

