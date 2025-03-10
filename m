Return-Path: <linux-usb+bounces-21587-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A13A592C9
	for <lists+linux-usb@lfdr.de>; Mon, 10 Mar 2025 12:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CD9C188D9C6
	for <lists+linux-usb@lfdr.de>; Mon, 10 Mar 2025 11:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3085220697;
	Mon, 10 Mar 2025 11:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e596ZNS/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1AA28EA
	for <linux-usb@vger.kernel.org>; Mon, 10 Mar 2025 11:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741606553; cv=none; b=gOSrw4Z/cDHAK47fTSz7w/YqyNzFk26X0BrnXKOIvHaLbE74N2RtxFCNaUqKOSt85KEEB/anpUI5MXMsNJJ3WDnl+gon4NtWuYmhw7qlDMeyX2efEENkzsElGrs37tlVp2YUVPlNhSHniBvgx9IUlZKfkSsBrXHSeWU6AX99Kpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741606553; c=relaxed/simple;
	bh=e4/CNaRL1BoG/giqEP5yJ3djvUceivhW5nbAXb7lYpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKX3vH87ZxjV8TiM90lb9cwcoD1po24KFRObGgLVJDayfuD9Vyrk/wZBeYLYi0i9CyT/3CEMEToc9TXMD+Zp9zEeIwizhnATkw6lsifp8rVARourVWOGjLyY/XnXb+jV3l7bLzdeb660zj+Jjw5NRchRTWaMbiSHltJin2ll8lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e596ZNS/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3741DC4CEE5;
	Mon, 10 Mar 2025 11:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741606552;
	bh=e4/CNaRL1BoG/giqEP5yJ3djvUceivhW5nbAXb7lYpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e596ZNS/xE2Znw4EiVDBwbbuQyX9nexyYjdTcp1C9mCeIJA5hLGA5XKR4Rwr5WfsI
	 OprXUkrLiNbw9BOokLFmac8dY2MA+VuNy6M0CJiTADft3Tgf02eAUvZFOHc8ft/Qr0
	 K8t41Kac0uAep7FceHCYTcvIPLdc6bkimSpAT6J8=
Date: Mon, 10 Mar 2025 12:35:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fix for v6.14-rc7
Message-ID: <2025031042-shrank-magnesium-de43@gregkh>
References: <20250310110148.GZ3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310110148.GZ3713119@black.fi.intel.com>

On Mon, Mar 10, 2025 at 01:01:48PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:
> 
>   Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.14-rc7
> 
> for you to fetch changes up to 502843396ec2a3eb4f58a2e4618a4a85fc5e0f46:
> 
>   thunderbolt: Prevent use-after-free in resume from hibernate (2025-03-07 14:00:58 +0200)

Pulled and pushed out, thanks.

greg k-h

