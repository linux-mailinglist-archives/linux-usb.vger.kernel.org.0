Return-Path: <linux-usb+bounces-9972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 012968B997A
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 12:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 312561C20F3A
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 10:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E345E091;
	Thu,  2 May 2024 10:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kmTmrvzQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1629856B7B
	for <linux-usb@vger.kernel.org>; Thu,  2 May 2024 10:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714647283; cv=none; b=qKc2B4iM79FqMdWQXQ9u6O4aPRmHYLu0jFllpOynLSp6qQ2L+y4M/M17ZZCExJ37lVQTRt9RcRKZI+QTKPYWQMelAIz1soaR8Ocflj1bVcTnjKfeTjSUvAgrKFErLkw01dzICuoofhS/HTiMyBc475MurMZZRBg0Pf6R39BEsTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714647283; c=relaxed/simple;
	bh=mFjq/ifnBqNev0YMd3Y/GcESWFORD7xvByocsgi28E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJ60JUpQwMO8+h3Ou+XVsiIfAZajRStYUxx87fCX3RoOtQo7L7Ww2QNVzOeFgsJaKjoXkr0LTMh4pFr4e6HY39xX5XBo2cAcagoD2cFS1fVCPbvPBykGHdJCh/wxt7vmPlk+mPx/HwodGHIOngxT7FFoOHn55F7QuW9wy4nXLIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kmTmrvzQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F290AC113CC;
	Thu,  2 May 2024 10:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714647282;
	bh=mFjq/ifnBqNev0YMd3Y/GcESWFORD7xvByocsgi28E0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kmTmrvzQYlfAVUFd39La/CXCZ17PNX78JUC/6KcrYUG+TYK4OSSU9nmalBFTwckiM
	 0xxRBOj/yyttL3/l4+Cf1sZdHAeAx2p88bUhfVVhXgH3iWKSfBYFSDrJZWyGmHitvP
	 b7EVW6SwtmaIC6hhLS3MbLWPIdpv63n85iPdRMf8=
Date: Thu, 2 May 2024 12:54:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: use tty_port_register_device_serdev
Message-ID: <2024050204-recreate-exerciser-bd62@gregkh>
References: <20240502100728.7914-1-mans@mansr.com>
 <ZjNoWq0r7CJJptRk@hovoldconsulting.com>
 <yw1xmsp8big7.fsf@mansr.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yw1xmsp8big7.fsf@mansr.com>

On Thu, May 02, 2024 at 11:45:44AM +0100, Måns Rullgård wrote:
> Johan Hovold <johan@kernel.org> writes:
> 
> > On Thu, May 02, 2024 at 11:07:28AM +0100, Mans Rullgard wrote:
> >> Use tty_port_register_device_serdev() so that usb-serial devices
> >> can be used as serdev controllers.
> >
> > I'm afraid it's not that easy. The reason serdev is not enabled for
> > usb-serial is that there's currently no support for handling hotplug in
> > serdev. The device can go away from under you at any time and then you'd
> > crash the kernel.
> 
> Oh, that's unfortunate.  Regular serial ports can go away too, though,
> and that seems to be handled fine.  What am I missing?

How is it handled?  Normal serial ports can go away but in practice,
it's a rare occurance, and usually people use serdev for devices where
the ports can not be removed (i.e. internal connections).

thanks,

greg k-h

