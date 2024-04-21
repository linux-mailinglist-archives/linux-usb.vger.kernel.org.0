Return-Path: <linux-usb+bounces-9527-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E73878ABEEC
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 12:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84EF828101C
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 10:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1FE10A03;
	Sun, 21 Apr 2024 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S1gN5k5Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C1D101DE
	for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2024 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713694672; cv=none; b=IuwBMEnBkR5/a0JbT4s/0BnkJA3Ca+ABTy3BaqiAPwDUyaZL+Jko3+pi8CvEHnK/73R5qSSbQ1aQjVNZLhKKVFz9bW73C7dQuZy7ktguomWz9Go52Gx0cx9ta35lvwRJ+rEVqjXNGMt58e4ESgA9yeR9prsG9fIUiYOSCd374sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713694672; c=relaxed/simple;
	bh=8ADuJyh+rmrjPxne5V9dMuAlJGCEXqQQrLSfQMmy5Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooBaTFhY/HLfji9EDOHBa3zp9oJWcXsVQXnGKOtpvp3Z/Oh89c6cUotQQDsoLrhSz1WcqDDOyQGAuFfW97qGsVMi9tVGfka8+YU7XoGcAeWJdcEW0Yr7pfA31T3KoujidV55x3M9AajkutFTQVZasNnE8eJg5MuQNuv+Cgeij1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S1gN5k5Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FBDC113CE;
	Sun, 21 Apr 2024 10:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713694671;
	bh=8ADuJyh+rmrjPxne5V9dMuAlJGCEXqQQrLSfQMmy5Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1gN5k5Q8UnBBmd80i+3oxlKICm6bU1JJWyrhYffydzezua13LmcfVaOOttwsuCLn
	 ReswMKx4MoU+ALsZovCe92kpDvwcmphSdieXUYsutFsRah2ox88kV19q2eh9O4gKW9
	 s0ieIOSghB+mqNi2OP8IT1LBNqxECZfHFh01qvHM=
Date: Sun, 21 Apr 2024 12:17:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chris Wulff <Chris.Wulff@biamp.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: gadget: f_fs: Fix a race condition when
 processing setup  packets.
Message-ID: <2024042115-aliens-twisting-664c@gregkh>
References: <CO1PR17MB541952EE4072214813CB05C8E10E2@CO1PR17MB5419.namprd17.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR17MB541952EE4072214813CB05C8E10E2@CO1PR17MB5419.namprd17.prod.outlook.com>

On Thu, Apr 18, 2024 at 04:45:12PM +0000, Chris Wulff wrote:
> If the USB driver passes a pointer into the TRB buffer for creq, this
> buffer can be overwritten with the status response as soon as the event
> is queued. This can make the final check return USB_GADGET_DELAYED_STATUS
> when it shouldn't. Instead use the stored wLength.
> 
> Signed-off-by: Chris Wulff <chris.wulff@biamp.com>
> ---
> v2: Added signoff
> 
>  drivers/usb/gadget/function/f_fs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index bffbc1dc651f..8d72acf9a760 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -3803,7 +3803,7 @@ static int ffs_func_setup(struct usb_function *f,
>  	__ffs_event_add(ffs, FUNCTIONFS_SETUP);
>  	spin_unlock_irqrestore(&ffs->ev.waitq.lock, flags);
>  
> -	return creq->wLength == 0 ? USB_GADGET_DELAYED_STATUS : 0;
> +	return ffs->ev.setup.wLength == 0 ? USB_GADGET_DELAYED_STATUS : 0;
>  }

What commit id does this fix?

And should it be backported to older kernels?

And again, please cc: the relevent maintainer/developers on your changes
so they know to read them.

thanks,

greg k-h

