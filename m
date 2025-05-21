Return-Path: <linux-usb+bounces-24191-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A621ABF8F1
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 17:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3F677AAAFE
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 15:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2269013D8A0;
	Wed, 21 May 2025 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dOF0H0QN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBED4A3C
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840321; cv=none; b=IoYxrAPgkcFcjM7Z0OiSveL5LKS5FpD88o3aB4kf5hsKvaqxyjmbrY+EbpcTOhRZ8BAxLnqbcPybgwtN+VgM9dN3OUz+vXCAUe1oit1McjueHZxgVPv1huzhQ9O0SZmyRRsOx4x2BTswt3/YzMNSkr2VYfYkDtapHk1snaGUI08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840321; c=relaxed/simple;
	bh=3cxoLeZMgbWgj2f9urDv20Us/WwgWehuyowQY4/F/Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/kLolz7sfzeVlhNvkXr59LToBGz2uEx+OC10zNRQNgneTCK3WgcZClTlb3j1vb7YCNEgGLsI5EAxRNyfengeEi1zA4FkAWiXluH/FdNl9MD/SVswQcWOi1Qa6F5NyATXAUYf+yFephaDOQD4pyFVPei6TYGSVcYQ9aKAXCLZVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dOF0H0QN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7CFC4CEE4;
	Wed, 21 May 2025 15:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747840321;
	bh=3cxoLeZMgbWgj2f9urDv20Us/WwgWehuyowQY4/F/Eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dOF0H0QNiKEAolTW1nBgcy0wRUMBs0xhZZxYiUd1RU5iJSZx1B8INieVGc7nocTv6
	 XotWPA66AqEi0QdyaKKUaeYSfxwX+wXOvOZ0jd5+Ch/3tyyyZFFNdC3jENmUgpif5z
	 o11uEv2zBtJy0YZML6xniH6cFBcJM8/TT9HQ7VCA=
Date: Wed, 21 May 2025 17:11:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: bus: fix const issue in
 usb_serial_device_match()
Message-ID: <2025052140-amnesty-wing-b0f0@gregkh>
References: <2025052133-recreate-attitude-c564@gregkh>
 <aC3so4VSWcqLy-Nx@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC3so4VSWcqLy-Nx@hovoldconsulting.com>

On Wed, May 21, 2025 at 05:09:23PM +0200, Johan Hovold wrote:
> On Wed, May 21, 2025 at 03:41:34PM +0200, Greg Kroah-Hartman wrote:
> > usb_serial_device_match() takes a const pointer, and then decides to
> > cast it away into a non-const one, which is not a good thing to do
> > overall.  Fix this up by properly setting the pointers to be const to
> > preserve that attribute.
> 
> I think this deserves a Fixes tag as this is a recent issue introduced
> by commit d69d80484598 ("driver core: have match() callback in struct
> bus_type take a const *") (even if we only use the address of the
> pointer).

Oops, yes, that is needed, sorry about that.

> > Cc: Johan Hovold <johan@kernel.org>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> > @@ -17,7 +17,7 @@ static int usb_serial_device_match(struct device *dev,
> >  				   const struct device_driver *drv)
> >  {
> >  	const struct usb_serial_port *port = to_usb_serial_port(dev);
> > -	struct usb_serial_driver *driver = to_usb_serial_driver(drv);
> > +	const struct usb_serial_driver *driver = to_usb_serial_driver(drv);
> >  
> >  	/*
> >  	 * drivers are already assigned to ports in serial_probe so it's
> 
> Now applied with a Fixes tag added.

Great, thanks!

greg k-h

