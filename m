Return-Path: <linux-usb+bounces-18420-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABD59EE519
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 12:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5CD7166CB3
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 11:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29173211A25;
	Thu, 12 Dec 2024 11:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="snYy0gvB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD6E290F
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 11:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734003150; cv=none; b=PwNt4bb3rsmBfsqcxJtezItIHHWZRnMgKWrS446JYlY4R5ngokkMKMJyecppLMPchPgo4LYzWZcl7GOg/0iG52qwnCec0uDboFMDxSelzJnfbQwssom9Jo8KoqVBR0nA8aO1yOBbF3K7jU52YKQI+HTSBMMJHfUXzl4xfh2XgkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734003150; c=relaxed/simple;
	bh=aHI53pK/rE6a5QcKEoq7G609QVOkHR0zW9UX8PHU2is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=db9XuNjDn9Dif3pZmvQPBj1UJ8B78dPgstbGyp0N1OlFpb0p3VlMNSJnBpTyeTklhksjXnL94+4o7HTJ5VAhE49r2Y6yC1tk8maToT3YK6YX9ZdmUZSWNUmE701diPDoRohaiAPYmsq5nNIw9XMpcr6vUmdotjv5k1zjc4q7NBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=snYy0gvB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50291C4CED4;
	Thu, 12 Dec 2024 11:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734003149;
	bh=aHI53pK/rE6a5QcKEoq7G609QVOkHR0zW9UX8PHU2is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=snYy0gvBysbKXqha2U/pT5NTpmgaQO2Vg0GSn4EliVk/f7XXLNZ3IaHBWdnVeN70j
	 9e3OEyETSq1QsCB52ifKeUJ4Xc0AEUBX7b57VAzrDgGIuASAoEoy+GEykEqzP9w9WW
	 WCy2j00uIYzA94cZrQ6LLLK0pk8bYYDlCzSUCxgo=
Date: Thu, 12 Dec 2024 12:32:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: configfs: Ignore trailing LF for user
 strings to cdev
Message-ID: <2024121213-alibi-jury-2ba4@gregkh>
References: <20241212111004.7901-1-ingo.rohloff@lauterbach.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212111004.7901-1-ingo.rohloff@lauterbach.com>

On Thu, Dec 12, 2024 at 12:10:04PM +0100, Ingo Rohloff wrote:
> Since commit c033563220e0f7a8
> ("usb: gadget: configfs: Attach arbitrary strings to cdev")
> a user can provide extra string descriptors to a USB gadget via configfs.
> 
> For "manufacturer", "product", "serialnumber", setting the string via
> configfs ignores a trailing LF.
> 
> For the arbitrary strings the LF was not ignored.
> 
> This patch ignores a trailing LF to make this consistent with the existing
> behavior for "manufacturer", ...  string descriptors.
> 
> Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> ---
>  drivers/usb/gadget/configfs.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Shouldn't this get a Fixes: tag and cc: stable?

thanks,

greg k-h

