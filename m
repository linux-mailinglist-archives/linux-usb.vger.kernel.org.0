Return-Path: <linux-usb+bounces-11336-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B2D908C1E
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 14:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3C902846F5
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 12:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCEAD199EA1;
	Fri, 14 Jun 2024 12:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0dZODCDN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BA1195F1D
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 12:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718369751; cv=none; b=EvDOD+D5nFbw2ZaZRXwTbKFrj0rS5pm1rO1/+2QRN8sg71BiPF2YZAqF5zP2cQi5cUp1VAgxsPKCHzc467d19pprzHzU1oj/GhVDkVZ3yp5OcNnJf2NQWETy/u/vwboAYthGOwm78xjx+iYK//BLrBqHd6nI+fxFxIwAYWOQkbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718369751; c=relaxed/simple;
	bh=HN4JsOxPYhL1hCnGN42f9LlRvWz1GnWbaNtjOf5lD5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBMa+Ti++oV6wyc+ET8Ethx+DBxVJY01skFEabYkUzWJzWVPC7ijkVjiTLOPJKBOTv5z79kyhNNy/ZaYoixX0TgkvTUk8VgNpnTKCvoi9gaSXc4FDt6hcdkU+e4cJtyyffaehcy0YuIJm2fVSRxxgaYOPQicmMlN9qCExER4oMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0dZODCDN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD24C2BD10;
	Fri, 14 Jun 2024 12:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718369750;
	bh=HN4JsOxPYhL1hCnGN42f9LlRvWz1GnWbaNtjOf5lD5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0dZODCDNipYQNfFOCgx83oB42sWInVrCzQdyv578XtonRBDPJctgEa3iARx449ooI
	 +nMdI5niaGjfpNo7lIVziPpZryIi3i1MwxaM6e3FflSaL7Fu94puWfaVU6m0lA6V6y
	 4gEBeC+oL5W+jNimkx0FJPI7NWLzFNkNqA8vbmM8=
Date: Fri, 14 Jun 2024 14:55:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/6] thunderbolt: Sideband access and retimer lane
 margining support
Message-ID: <2024061435-down-amniotic-ffba@gregkh>
References: <20240614121512.1361184-1-mika.westerberg@linux.intel.com>
 <2024061449-wilt-goliath-8248@gregkh>
 <20240614123753.GR1421138@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614123753.GR1421138@black.fi.intel.com>

On Fri, Jun 14, 2024 at 03:37:53PM +0300, Mika Westerberg wrote:
> On Fri, Jun 14, 2024 at 02:19:58PM +0200, Greg KH wrote:
> > On Fri, Jun 14, 2024 at 03:15:06PM +0300, Mika Westerberg wrote:
> > > Hi all,
> > > 
> > > This series adds USB4 link sideband access through debugfs. This can be
> > > used to run port operations etc. from userspace usable for example in
> > > manufacturing. The other feature is receiver lane margining support for
> > > retimers with similar use case.
> > > 
> > > Mika Westerberg (6):
> > >   thunderbolt: Move usb4_port_margining_caps() declaration into correct place
> > >   thunderbolt: Make usb4_port_sb_read/write() available outside of usb4.c
> > >   thunderbolt: Add sideband register access to debugfs
> > >   thunderbolt: Split out margining from USB4 port
> > >   thunderbolt: Make margining functions accept target and retimer index
> > >   thunderbolt: Add receiver lane margining support for retimers
> > > 
> > >  drivers/thunderbolt/Kconfig   |  11 +-
> > >  drivers/thunderbolt/debugfs.c | 623 ++++++++++++++++++++++++++--------
> > >  drivers/thunderbolt/retimer.c |  53 +--
> > >  drivers/thunderbolt/sb_regs.h |   9 +
> > >  drivers/thunderbolt/tb.h      |  45 ++-
> > >  drivers/thunderbolt/usb4.c    | 183 +++++-----
> > >  6 files changed, 655 insertions(+), 269 deletions(-)
> > 
> > No hint as to what changed from v1?
> 
> Oh, crap. I added it but added for the v1 cover letter by accident :(
> Sorry about that. The changelog is below:
> 
> Previous version can be found:
> 
>   https://lore.kernel.org/linux-usb/20240610100627.3521887-1-mika.westerberg@linux.intel.com/
> 
> Changes from previous version:
> 
>   - Do not store debugfs dentry pointer, instead look it up when needed.

Great, thanks for the change, looks good!

greg k-h



