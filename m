Return-Path: <linux-usb+bounces-9977-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D00B98B9BEF
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 15:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85147283FBC
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 13:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA0F13C67E;
	Thu,  2 May 2024 13:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LGhx2anC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1093A7441E
	for <linux-usb@vger.kernel.org>; Thu,  2 May 2024 13:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714658280; cv=none; b=JoDjCmkDAi/wFnuzw2MO1COnKzkmpipR7n1dfmD1LY31UVMbUE1vG7TnKezCtP3sTvwAk+X3tJk0MPGXAE3GXRKypG82j8F23dAvwZMo7A2Rs7Xzt9dUBExN+s7pFVtXEkG9yhd7Sve3JpJkj1lLch+uXAmZ80KLRVx3Ut8UZVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714658280; c=relaxed/simple;
	bh=lmWlMfFpkYTshaKiupURVclJUhNH26l5qVVo5ObHqcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMRqYC5mXKK8iRTi0Ur/Y2PTMZ0S7x4wWgtfLaRojJau1TcrryLBEyQYL60QdEs0H+owd8PDZRUvOYu7CwfUzoJsz6yJoqhaXHmLc07X8XEOPEy6f5XjEifA/kJWBXiQxRvFbIrki9vN8bWhQghCo3ASk6p58DOvvi4aJnCoE5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LGhx2anC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D14C32789;
	Thu,  2 May 2024 13:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714658279;
	bh=lmWlMfFpkYTshaKiupURVclJUhNH26l5qVVo5ObHqcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LGhx2anC1vTA3DRDmv8/C2VkrYeYG+ewu8aCivdRVK0h/DzqnhcA41Yj3PSEbFe5/
	 nQGQ6DtiYNwiBqS1b1458kww4KK4BFlkv4XfwynDij/s2nrpWhBPkf1V8nfrZ0LOjd
	 98O2zUWutSh/8jbgiUFg1m95WL2bcICJqCYohd1Q=
Date: Thu, 2 May 2024 15:57:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: use tty_port_register_device_serdev
Message-ID: <2024050228-emission-ointment-88de@gregkh>
References: <20240502100728.7914-1-mans@mansr.com>
 <ZjNoWq0r7CJJptRk@hovoldconsulting.com>
 <yw1xmsp8big7.fsf@mansr.com>
 <2024050204-recreate-exerciser-bd62@gregkh>
 <yw1xikzwbb3a.fsf@mansr.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yw1xikzwbb3a.fsf@mansr.com>

On Thu, May 02, 2024 at 02:24:41PM +0100, Måns Rullgård wrote:
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> 
> > On Thu, May 02, 2024 at 11:45:44AM +0100, Måns Rullgård wrote:
> >> Johan Hovold <johan@kernel.org> writes:
> >> 
> >> > On Thu, May 02, 2024 at 11:07:28AM +0100, Mans Rullgard wrote:
> >> >> Use tty_port_register_device_serdev() so that usb-serial devices
> >> >> can be used as serdev controllers.
> >> >
> >> > I'm afraid it's not that easy. The reason serdev is not enabled for
> >> > usb-serial is that there's currently no support for handling hotplug in
> >> > serdev. The device can go away from under you at any time and then you'd
> >> > crash the kernel.
> >> 
> >> Oh, that's unfortunate.  Regular serial ports can go away too, though,
> >> and that seems to be handled fine.  What am I missing?
> >
> > How is it handled?  Normal serial ports can go away but in practice,
> > it's a rare occurance, and usually people use serdev for devices where
> > the ports can not be removed (i.e. internal connections).
> 
> If I unbind a regular serial port from its driver using sysfs, a serdev
> device defined in a device tree gets removed as expected.  Binding the
> serial port makes everything come back again.  I fail to see any problem
> here.  If there is one, you'll have to be less evasive in explaining
> what it is.

Try yanking a usb-serial device out with this patch applied and see what
happens.  I'm pretty sure serdev will not handle that well, just like if
you yank out a pci serial device while it is being used.  Doing
bind/unbind is not a "surprise" removal, but a nice orderly one :)

If this does now work, nice, but I haven't seen the changes to serdev to
make this happen, I wonder what changed...

thanks,

greg k-h

