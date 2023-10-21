Return-Path: <linux-usb+bounces-2034-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEAF7D1C8A
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 12:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 243DFB214C2
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 10:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFC2DDCC;
	Sat, 21 Oct 2023 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tUv6KTAb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F6D1C36
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 10:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC7CC433C7;
	Sat, 21 Oct 2023 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697883758;
	bh=ToAEgXlfHA448dyTcRbcIuRZGw4ucPqYueINjAW3PAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUv6KTAbF7QSNJFZavgBBycNL/4PZ8qLx70WfCMG19kUlAX0LLtjBoZX0+C1zOs/Z
	 u8o4Q4J84YRjawSarbUbF+sHc5TZflSfXobAVoIjF0bAsPHIS4L3KHXTVDml+LVDQU
	 zjrT/txLOnP0d0CX4pEBQFWC/hgZ8wYJIY0ECj7M=
Date: Sat, 21 Oct 2023 12:22:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Milan Broz <gmazyland@gmail.com>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-scsi@vger.kernel.org, stern@rowland.harvard.edu,
	oneukum@suse.com
Subject: Re: [PATCH 5/7] usb-storage,uas: do not convert device_info for
 64-bit platforms
Message-ID: <2023102103-plaything-dispute-b246@gregkh>
References: <20231006125445.122380-1-gmazyland@gmail.com>
 <20231016072604.40179-1-gmazyland@gmail.com>
 <20231016072604.40179-6-gmazyland@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016072604.40179-6-gmazyland@gmail.com>

On Mon, Oct 16, 2023 at 09:26:02AM +0200, Milan Broz wrote:
> This patch optimizes the previous one for 64-bit platforms, where
> unsigned long is 64-bit, so we do not need to convert quirk flags
> to 32-bit index.
> 
> Signed-off-by: Milan Broz <gmazyland@gmail.com>
> ---
>  drivers/usb/storage/Makefile  | 3 +++
>  drivers/usb/storage/mkflags.c | 9 +++++++++
>  drivers/usb/storage/usb-ids.h | 4 ++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/storage/Makefile b/drivers/usb/storage/Makefile
> index 612678f108d0..62ebaa76ef95 100644
> --- a/drivers/usb/storage/Makefile
> +++ b/drivers/usb/storage/Makefile
> @@ -57,6 +57,9 @@ $(obj)/usual-tables.o: $(obj)/usb-ids.c
>  $(obj)/uas.o: $(obj)/usb-ids-uas.c
>  clean-files		:= usb-ids.c usb-ids-uas.c
>  HOSTCFLAGS_mkflags.o	:= -I $(srctree)/include/
> +ifdef CONFIG_64BIT
> +HOSTCFLAGS_mkflags.o	+= -D CONFIG_64BIT
> +endif
>  hostprogs		+= mkflags
>  
>  quiet_cmd_mkflag_storage = FLAGS   $@
> diff --git a/drivers/usb/storage/mkflags.c b/drivers/usb/storage/mkflags.c
> index 2514ffef0154..08c37d2e52d6 100644
> --- a/drivers/usb/storage/mkflags.c
> +++ b/drivers/usb/storage/mkflags.c
> @@ -89,11 +89,15 @@ static struct svals vals[] = {
>  
>  static unsigned long get_device_info(uint64_t flags, unsigned int idx)
>  {
> +#ifndef CONFIG_64BIT
>  	if (flags < HI32)
>  		return (unsigned long)flags;
>  
>  	/* Use index that will be processed in usb_stor_di2flags */
>  	return HI32 + idx;
> +#else
> +	return flags;
> +#endif

Please try to keep #ifdef out of .c files, it makes maintenance a real
pain and is not the kernel coding style at all.

thanks,

greg k-h

