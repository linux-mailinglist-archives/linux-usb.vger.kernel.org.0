Return-Path: <linux-usb+bounces-3326-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 529F97F9244
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 11:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 849181C209C2
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 10:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4F4538A;
	Sun, 26 Nov 2023 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fjKkxhFG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488E165B
	for <linux-usb@vger.kernel.org>; Sun, 26 Nov 2023 10:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78559C433C7;
	Sun, 26 Nov 2023 10:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700994898;
	bh=FUAkUf1HPGsRCvh9R8252q79NBvhybHGAFsP7UBdKqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fjKkxhFGSbc6djr7bcrQCXUtcUjTKfoCB4c2QD7MUAi5RagWH9/F9gaQ1pct2HqYU
	 BUnbYAAC5SUV2GZJx/4GXadbRMJ+DT0AQWu0EVA5OKxi8Ea7ioFWNoI9hPVDv3NKJr
	 g18Ts2f22M/vI1WcA8uOEW2ZNkWpSVHcUwaapbms=
Date: Sun, 26 Nov 2023 10:34:55 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ren Xiao <u202112004@hust.edu.cn>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	hust-os-kernel-patches@googlegroups.com,
	Dongliang Mu <dzm91@hust.edu.cn>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: transport: Fix switch-case indentation
 typo in 'transport.c'
Message-ID: <2023112639-perjurer-suffocate-965d@gregkh>
References: <20231123063417.2625808-1-u202112004@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123063417.2625808-1-u202112004@hust.edu.cn>

On Thu, Nov 23, 2023 at 01:34:16AM -0500, Ren Xiao wrote:
> Adjusted the indentation of the switch-case code blocks which
> start from line 1051 and line 1304.
> 
> Signed-off-by: Ren Xiao <u202112004@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>  drivers/usb/storage/transport.c | 46 ++++++++++++++++-----------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

