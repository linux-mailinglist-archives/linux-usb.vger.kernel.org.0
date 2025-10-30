Return-Path: <linux-usb+bounces-29881-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62089C1F595
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 10:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2453B4EAD0F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 09:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359EE2BFC85;
	Thu, 30 Oct 2025 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V4bWSrgF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E577342CAF
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761817186; cv=none; b=gezwp6OSsTO5WjsnGd+JTo2I0Bzd7OZf9vetHUu9EscC+a5I18m3l9iPrwr2HH2ptU+g5CjPZCHZiBAso8wFYYgZZ9RL/NfOZS+UqVAcQttEFOT68bM56IY06vvM1DqbPD7rJ/K4D7YGtn4nBZin0kvU1trbT5Ph6ljqDrjAi94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761817186; c=relaxed/simple;
	bh=ecCmwU5q6n4Y+uW5kJqayPDanKOQCZC+yACE+kp4Uc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hL2NuxwviXyRfSKgd8fotu79ps+u5jzZsLNNtsR60nEcW2dTFcIKot+dtmc0zXTQ2v1SRFMg6Lg0kB7pjZFad7OnhRc66qLHDIIZkDu45Vf7C/2cO1q6tDZtz74RE5ngLKHmzkfYfoqfOjkzR74B2+GH9FEtKTO86WUeAF3z/1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V4bWSrgF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5452C4CEF1;
	Thu, 30 Oct 2025 09:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761817186;
	bh=ecCmwU5q6n4Y+uW5kJqayPDanKOQCZC+yACE+kp4Uc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4bWSrgF+RLi7PEmkLDw7PCyNONSMZ+OPVJo62m0CVZgwKeXOQZJ3jtATtgtRCdBG
	 6hdekBuYLBKzdGe5R1sqDHtpQRE3Dg1CesDVtBvl7BYKJWZqzyVNlDpFEQ4u+uiUnl
	 wnLxZgUwg5q3RHxvzNNPP3cpL/5jaB5IbsPQ37YI=
Date: Thu, 30 Oct 2025 10:39:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Li Haifeng <omycle@gmail.com>
Cc: Felipe.Balbi@microsoft.com, linux-usb@vger.kernel.org
Subject: Re: Issue with DWC3 Gadget Driver: Stall After Transmitting Only 2KB
 Using Scatter-Gather and TRB Chaining
Message-ID: <2025103049-suing-renewably-fd67@gregkh>
References: <CAFNq8R7q-GvFgwRKewzG=ZwkbxEfhKjEsxHWXQ0q8BsSSDFcnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFNq8R7q-GvFgwRKewzG=ZwkbxEfhKjEsxHWXQ0q8BsSSDFcnQ@mail.gmail.com>

On Thu, Oct 30, 2025 at 04:49:19PM +0800, Li Haifeng wrote:
> Hello Linux USB experts,
> 
> I'm encountering an issue with the DWC3 gadget driver on a Rockchip
> RK3588 platform running Linux kernel 5.10 (from the
> rk3588_linux_release_20230114_v1.0.6 SDK). I'm developing a kernel

5.10 is _VERY_ old and obsolete and way behind in new hardware support,
especially for the dwc3 driver.  Have you tried the latest kernel
release with is many years newer?  How about 6.17?

If you are stuck with an old release for some reason, please work with
the company that gave it to you as you are paying for support from them
for it, it is their responsibility, not the community's responsibility
to manage that release.

And pleaase, do not release new devices on this old kernel version, you
are about to loose security updates in a year for it, which is not good
for the lifetime of your device.

thanks,

greg k-h

