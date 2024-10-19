Return-Path: <linux-usb+bounces-16436-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 362E49A4B9A
	for <lists+linux-usb@lfdr.de>; Sat, 19 Oct 2024 08:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB062284AD7
	for <lists+linux-usb@lfdr.de>; Sat, 19 Oct 2024 06:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A719B1D79B6;
	Sat, 19 Oct 2024 06:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A+jIzWWs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200CD17C22A
	for <linux-usb@vger.kernel.org>; Sat, 19 Oct 2024 06:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729320448; cv=none; b=tJjev1BZ7OUFFkGTaJt3m1kXO8A9XnV2BNPRiyhlhDbplyZWpUEogiLno1rHBDMkbhL4FnK7+IvNOUZTYyfDaIdenVPzaWvLX/SYwBgBhiuw0YZMBzbs74LlN2WNUlFBQg7hMPezJ3zF0etDp1/FXvN17tWniX42f0LlXFvbGC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729320448; c=relaxed/simple;
	bh=K2I0hf0aygjdF29JZJBQfV0Wfzcoc/h3CIoVfD5Q2FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COHNhQCEiZq6XYAufzhq+ZRU6Gbp3AkZQGz//Hn1zkFjMpo5mI5mPaFmpaERupPpCT4mnAhUhDOfFVxUT/jArTth2h8jbObAqv5gosJBjklxtQJJPDAgMf08biXauvflJnUyJfZGhSBpbfSXVvTMIh3PIcQePuIKCtf6sRoaKGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A+jIzWWs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4456AC4CEC5;
	Sat, 19 Oct 2024 06:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729320447;
	bh=K2I0hf0aygjdF29JZJBQfV0Wfzcoc/h3CIoVfD5Q2FA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+jIzWWscVOaeosA7Md2+hKhcZfQfQdvT2K8CvDDba49HS1Nu5fZRbq3Lb3xfSDjf
	 ToBXpRa+huNGjERJq71mHJ+5xRLCskwc2Ug6W/uVDwgKkqy0VRGzhZzXIIRb9MlIy3
	 zQRLwA6dufP+xkjtkna4EZyMS2m9LgTWrF/3WB1Y=
Date: Sat, 19 Oct 2024 08:47:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pixiae <pxiaegbayn@use.startmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Usb IP Failing to connect depending of program being runned even
 when the connection talks are identical
Message-ID: <2024101946-usage-worst-bac3@gregkh>
References: <50f9a086-d873-44d2-bdda-a8e00dd2421e@startmail.com>
 <2024101824-shakable-portfolio-9cfb@gregkh>
 <830fb71a-d259-4414-ad42-73a858a3bce6@use.startmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <830fb71a-d259-4414-ad42-73a858a3bce6@use.startmail.com>

On Fri, Oct 18, 2024 at 10:56:45AM -0600, Pixiae wrote:
> Dear Greg KH,
> 
> 
> > Why not just use the in-kernel device code instead of creating your own?
> 
> Do you mean that, why I don't write a kernel module?

Yes, what's wrong with the existing usbip client code in Linux?

> If that is what you mean, I don't want to have to share the code of my
> device if I ever want to share my device, would be one reason.

Then it's going to be hard, if not impossible, for us to help you,
sorry, as this is a group for Linux kernel issues.

best of luck!

greg k-h

