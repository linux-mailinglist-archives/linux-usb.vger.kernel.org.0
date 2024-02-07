Return-Path: <linux-usb+bounces-5988-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A76184C7D4
	for <lists+linux-usb@lfdr.de>; Wed,  7 Feb 2024 10:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8EB21F2AF14
	for <lists+linux-usb@lfdr.de>; Wed,  7 Feb 2024 09:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CCE224EF;
	Wed,  7 Feb 2024 09:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P6YFPP/P"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F87225D6
	for <linux-usb@vger.kernel.org>; Wed,  7 Feb 2024 09:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707299203; cv=none; b=YTz6Zr6WgwwoaTfqbpyrN7kgqjIGp69exXMLODPg7i5p+seVBpLfXXMEeWoANOIHsuF33Axa7sCn2slC4VstZ5Lc2QDRcs8PaZ0ZMgaXVksK+cJDbLNQSeDzSWOOzCDfTRZ5xudZsL659tPDybed1bcTzcHTRo46wz30LU6CoAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707299203; c=relaxed/simple;
	bh=iofSn4cHL8UGUn06Qwr8czhO8Kqd3IWpLgmmWqCBnoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbhRNSkczfH7NpVoplMk4VztDTEgo4zumSzhYC4Px99WLWAa93VV+ZwGoXy2LtwHd/lNK1jvuaonQYI8CHgvtoOdcoWN3V29xgphZ8OkGHurQTyMh8IyG2dOXO4Qzsq+9hAAM5sz6THkQB9VqFXGtEqcztBlwgDyqP5D28ESit8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=P6YFPP/P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF235C433F1;
	Wed,  7 Feb 2024 09:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707299203;
	bh=iofSn4cHL8UGUn06Qwr8czhO8Kqd3IWpLgmmWqCBnoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P6YFPP/PpeZFjNJplzzTeRXNtpgcJKetwKeVrVFedPIcPMPeRM+KLYpKzVGBY+NuD
	 GmKZmae3XRMByxqw8l8ADHnzkEn+Q68mgD/nug9lpgOTr7DfehgDg1k5Oq34pm/H17
	 QUVOeLhS/XEYMXxIa8GdL7ayuWsORKabcyGac3ls=
Date: Wed, 7 Feb 2024 09:46:40 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
	linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
Subject: Re: [PATCH] usb: common: add driver for USB Billboard devices
Message-ID: <2024020712-trimming-moonlit-8ca1@gregkh>
References: <20240206125623.1208161-1-niklas.neronin@linux.intel.com>
 <2024020641-relation-embattled-1fb5@gregkh>
 <ZcJQuwfXctmzZ+HX@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZcJQuwfXctmzZ+HX@kuha.fi.intel.com>

On Tue, Feb 06, 2024 at 05:31:07PM +0200, Heikki Krogerus wrote:
> On Tue, Feb 06, 2024 at 02:47:04PM +0000, Greg KH wrote:
> > On Tue, Feb 06, 2024 at 02:56:23PM +0200, Niklas Neronin wrote:
> > > This patch introduces the USB Billboard Driver. Its purpose is to display,
> > > via debugfs, basic information about connected Billboard devices.
> > 
> > Very cool, I was wondering if/when someone was going to write a kernel
> > driver for this type of hardware.
> > 
> > But why debugfs?  Normally that is locked down for root-access-only by
> > the system (rightfully so), why is this information restricted?
> > 
> > And why is this a kernel driver at all?  Why can't you just do this in
> > userspace and add support to 'lsusb' for it?
> 
> I'm to blame for that. I wanted a way to see the billboard information
> when something goes wrong with the alt mode entry in an environment
> where I don't necessarily have tools like lsusb - I think I need to
> include usbtools package to my Buildroot to get that app. I also
> proposed debugfs, because for me this would be purely for debugging
> purposes.

But you are also going to want this info in lsusb for all of the
non-root users, so why not just do it in one place?

> Later I was hoping to use this information in the Type-C drivers to
> help in situations where the alt mode entry fails and UCSI does not
> give any information about the partner (which unfortunately is the
> reality on several platforms).

Sure, but this is just debugfs, no interaction with any other kernel
code at the moment, so we have no hint anyone else might want it :(

> This is really just a proposal - perhaps we should have started with
> RFC first. But I think Niklas has done a great job in any case.

RFC might have been nice :)

Anyway, patches for lsusb are gladly accepted, let's keep this out of
debugfs for now as again, almost no one has access to it.  But if you do
want it in debugfs, please fix up the code and resubmit it with some
more justification.

thanks,

greg k-h

