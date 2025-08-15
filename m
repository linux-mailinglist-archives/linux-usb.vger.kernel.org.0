Return-Path: <linux-usb+bounces-26906-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB3BB27E10
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 12:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F56DB637B0
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 10:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBBB2FD7B5;
	Fri, 15 Aug 2025 10:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TJp4MPWx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B6E1917E3
	for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 10:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755252852; cv=none; b=hWOr4fAsRvel+UwTw+vHCIoR/yt3wdq8axiRd2NoEBu4dxtGCWWZz4jphqNcFdlIcD+bJHi9hRGLl+2eZC5gTj2+9FDyVDv4KXbRYRqbcWZFPTGAZh6KtsQsIjZd35vDBFkOXJN/aPKR7eA37D5zN2jIwj8CNNEU2sr7qY2WfMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755252852; c=relaxed/simple;
	bh=GKG3vxRct+7Wx8Tdr6SaductEeY1e/EHpW5i6HB9tpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qrge+M3JLS6jkzxy5b98Ow7sL2PV8s9NBikbOOTsoVh+PbzVJm0WzqiKpB7uzfsuZN8wuFTZaf85uVpui5y8smBxC8LxA/wds14EC7rD/2ZNxDScyRqbNg17mPf0UIuRQcidhOW7Ik5FryKH5Z+IMLq9xOXXyotIIKAErzUV01A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TJp4MPWx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD54C4CEEB;
	Fri, 15 Aug 2025 10:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755252852;
	bh=GKG3vxRct+7Wx8Tdr6SaductEeY1e/EHpW5i6HB9tpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TJp4MPWx0UhU+5f1/hXt8jWxKGKtCbV7w8YfTwstTyjnEo+x9dqnZB1Lxvc4juQEg
	 P7mVeeL176ll2TuaBdpSWkb5dQLJw8IVd45yRRPoORN4j7XOG+OnHi98LmMNM7Gsfe
	 vgbYKmLl/DmJCA3D1pQZ5hyuoFcD7Pwjk7pXXdLA=
Date: Fri, 15 Aug 2025 12:14:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>,
	Oliver Neukum <oneukum@suse.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/1] USB: Check no positive return values from
 pm_runtime_resume_and_get()
Message-ID: <2025081502-universal-dropout-be0e@gregkh>
References: <20250811062403.2116464-1-sakari.ailus@linux.intel.com>
 <2025081330-droplet-napping-6843@gregkh>
 <aJ7_CMzCVwPEMSOj@kekkonen.localdomain>
 <2025081502-opacity-rewire-447b@gregkh>
 <aJ8GlTon-wfFzsry@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJ8GlTon-wfFzsry@kekkonen.localdomain>

On Fri, Aug 15, 2025 at 10:06:13AM +0000, Sakari Ailus wrote:
> On Fri, Aug 15, 2025 at 11:38:28AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Aug 15, 2025 at 09:34:00AM +0000, Sakari Ailus wrote:
> > > Hi Greg,
> > > 
> > > On Wed, Aug 13, 2025 at 04:43:05PM +0200, Greg Kroah-Hartman wrote:
> > > > On Mon, Aug 11, 2025 at 09:24:03AM +0300, Sakari Ailus wrote:
> > > > > pm_runtime_resume_and_get() always returns a negative error code or zero;
> > > > > there's no need to check for positive values such as returned by
> > > > > pm_runtime_get_sync(). Simply drop the check.
> > > > > 
> > > > > Fixes: 7626c52b6b46 ("usb: usb_autopm_get_interface use modern helper")
> > > > > Cc: stable@vger.kernel.org
> > > > 
> > > > If there is no need for this check, why does this need to be backported
> > > > to stable kernels?
> > > 
> > > It's not necessary IMO.
> > > 
> > > The practice lately has been to add Cc: stable if the Fixes: tag is there.
> > 
> > If it actually fixes a bug.
> > 
> > > But there was no actual bug in this case, just that this change ideally
> > > would have been part of the original patch.
> > 
> > Then it's not really a "fix" so that tag does not need to be there
> > either :)
> 
> I agree, both should be removed. Can you drop them or should I send v2?

Please send a v2.

thanks,

greg k-h

