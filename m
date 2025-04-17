Return-Path: <linux-usb+bounces-23190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AB4A91942
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 12:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C011F7AD2EA
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 10:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340C822A7EE;
	Thu, 17 Apr 2025 10:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zy9MUeks"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4826A55
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744885522; cv=none; b=muIt65oPRm+m5AeVoo8uSwzz8hGBudWatfIXa3DZ9TVGd4XP9xmyaPQMoBKdL926p9dG6mIomPQaelbBBjAZSpqzf6Bp2baGZTL/DRq3Fb62ac22Z8rlHfOggNIWYYWboK6XIuTcoJ0Bo25wsBHprYRg+M+utp+WB6U3zFM1tY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744885522; c=relaxed/simple;
	bh=rxU2HvtafSEO2ljlJz1GS6GQv97MHFuBEiSzq6Am7kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1BV5OCychXv7+8RXtVcfefJQkdyagJtLwjOqMSu0R7eC9ZQ/wrN7yM4XvIbQrsZ2Va6C1Su3We2Eu4dn6ijSz3Z6tNDaoZcaUIuApRhZezxbDJGfWpTRzR0S7/dj2DvGKSWzsbo1wuERlnOfXKyHs9jxJF2HNk2YiwzOM6KeuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Zy9MUeks; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92244C4CEE4;
	Thu, 17 Apr 2025 10:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744885522;
	bh=rxU2HvtafSEO2ljlJz1GS6GQv97MHFuBEiSzq6Am7kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zy9MUeksjJgeqM9DNUpAt5rdOluow0Km9b7wC6nMmea000i7BnoeHEO/3f0a1KzJK
	 HUz83Hk6MfjuqLuOYv8tvoGzw28lnOnyKEynX9H9vlNGVzpaDrospDY2iO+gZknCz+
	 HSrG03bKLMfiOen0ED1UDaqh7bgN5Jt8ZSL86SOs=
Date: Thu, 17 Apr 2025 12:25:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>
Subject: Re: [PATCH v2 4/4] Documentation/admin-guide: Document
 Thunderbolt/USB4 tunneling events
Message-ID: <2025041712-cupbearer-playhouse-d035@gregkh>
References: <20250417090426.221773-1-mika.westerberg@linux.intel.com>
 <20250417090426.221773-5-mika.westerberg@linux.intel.com>
 <2025041759-slimy-subzero-a6ba@gregkh>
 <20250417100456.GC88033@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417100456.GC88033@black.fi.intel.com>

On Thu, Apr 17, 2025 at 01:04:56PM +0300, Mika Westerberg wrote:
> On Thu, Apr 17, 2025 at 11:39:38AM +0200, Greg KH wrote:
> > On Thu, Apr 17, 2025 at 12:04:26PM +0300, Mika Westerberg wrote:
> > > From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> > > 
> > > Add documentation about the Thunderbolt/USB4 tunneling events to the
> > > user’s and administrator’s guide.
> > > 
> > > Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > ---
> > >  Documentation/admin-guide/thunderbolt.rst | 33 +++++++++++++++++++++++
> > >  1 file changed, 33 insertions(+)
> > > 
> > > diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
> > > index d0502691dfa1..f0368ab6bd1f 100644
> > > --- a/Documentation/admin-guide/thunderbolt.rst
> > > +++ b/Documentation/admin-guide/thunderbolt.rst
> > > @@ -296,6 +296,39 @@ information is missing.
> > >  To recover from this mode, one needs to flash a valid NVM image to the
> > >  host controller in the same way it is done in the previous chapter.
> > >  
> > > +Tunneling events
> > > +----------------
> > > +The driver sends ``KOBJ_CHANGE`` events to userspace when there is a
> > > +tunneling change in the ``thunderbolt_domain``. The notification carries
> > > +following environment variables::
> > > +
> > > +  TUNNEL_EVENT=<EVENT>
> > > +  TUNNEL_DETAILS=0:12 <-> 1:20 (USB3)
> > 
> > I'm ok with this, but wow TUNNEL_DETAILS is going to be hard to parse by
> > userspace, right?  Is this something that it is supposed to do something
> > with?
> 
> Yes, the reason it looks like that is because it matches the "format" we
> use in the logging (in dmesg). For instance:
> 
> [   35.400488] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): activating
> [   35.401237] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): DP IN maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
> [   35.401239] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): DP OUT maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
> [   35.401493] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): bandwidth allocation mode supported
> [   35.402528] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): non-reduced bandwidth 8100 Mb/s x4 = 25920 Mb/s
> [   35.402773] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): maximum bandwidth through allocation mode 20000 Mb/s x4 = 77575 Mb/s
> [   35.402775] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): granularity 500 Mb/s
> [   35.403029] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): estimated bandwidth 103500 Mb/s
> [   35.404693] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): bandwidth allocation mode enabled

Kernel logs are not supposed to always be parsable, so this is fine :)

> This allows matching the event with dmesg tunnel logs. If you think this is
> not good we can change it.

It depends on what you are expecting userspace to do with this
information.  If it's a simple "here's some debugging information you
might like to look at" then it's fine.  If it is "here is some
information that you need to take a programatic action based on", then
that's different.

thanks,

greg k-h

