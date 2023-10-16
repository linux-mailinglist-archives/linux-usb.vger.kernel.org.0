Return-Path: <linux-usb+bounces-1693-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 491887CB1BA
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 19:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A4631C20A98
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 17:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B12328BC;
	Mon, 16 Oct 2023 17:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w98KksX3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE031F61D
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 17:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B8DC433C7;
	Mon, 16 Oct 2023 17:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697479131;
	bh=AyK2SXcqdRnOrh1k76CSD8fTzBnhoJScCp2j+ldNjaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w98KksX3ig/2ARv3Elxv4giqqgt/EaFboKZhRg/4fbwkl+Sf3iqws6nUr4eZvlZG5
	 JioaV3HQppmUtn/V7vxxETIxkjur9jSBYySvG6BdzgKPtB9QQ1ivyymKyl8VDUohV/
	 RHOqVCuNC0NLcHksup7XHzjfZ9al2UoQ/7HorQgw=
Date: Mon, 16 Oct 2023 19:42:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hongren Zheng <i@zenithal.me>
Cc: Shuah Khan <shuah@kernel.org>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [PATCH v2 -next] usb/usbip: fix wrong data added to platform
 device
Message-ID: <2023101623-amaretto-sevenfold-6b5e@gregkh>
References: <ZSpHPCaQ5DDA9Ysl@Sun>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSpHPCaQ5DDA9Ysl@Sun>

On Sat, Oct 14, 2023 at 03:46:04PM +0800, Hongren Zheng wrote:
> .data of platform_device_info will be copied into .platform_data of
> struct device via platform_device_add_data.

That is crazy.

> However, vhcis[i] contains a spinlock, is dynamically allocated and
> used by other code, so it is not meant to be copied. The workaround
> was to use void *vhci as an agent, but it was removed in the commit
> suggested below.

Again, crazy, I'm amazed it works at all.

> This patch adds back the workaround and changes the way of using
> platform_data accordingly.
> 
> Reported-by: syzbot+e0dbc33630a092ccf033@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/r/00000000000029242706077f3145@google.com/
> Reported-by: syzbot+6867a9777f4b8dc4e256@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/r/0000000000007634c1060793197c@google.com/
> Fixes: b8aaf639b403 ("usbip: Use platform_device_register_full()")
> Tested-by: syzbot+6867a9777f4b8dc4e256@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/r/0000000000007ac87d0607979b6b@google.com/
> Signed-off-by: Hongren Zheng <i@zenithal.me>
> ---
>  drivers/usb/usbip/vhci_hcd.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

I'll take this now, as it fixes a reported issue, but really, the root
problem should be fixed instead.  This is not how to treat platform data
at all.

thanks,

greg k-h

