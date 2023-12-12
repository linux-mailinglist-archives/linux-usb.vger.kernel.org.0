Return-Path: <linux-usb+bounces-4037-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F10D80EAB2
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 12:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 193371F21E30
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 11:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5545DF0F;
	Tue, 12 Dec 2023 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l95MWKBC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C930E5D900
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 11:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0778BC433CB;
	Tue, 12 Dec 2023 11:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702381386;
	bh=VP19Xc7SO6DDWq37DiHzwVRgMzvOpshvCngKBktf3sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l95MWKBCI4nz06TAy83lmX56dxCSVrQR/fo1ACWa0ZsGpfeL1BaBdxlxlEJViahnk
	 F4WjBqyDJ6+CJFFK09J0GrzmnjP4iSHv6QkKFNvHYWRYEwIW2YLguz/nEOYNtOle3D
	 24rIw2DmizSNFN0cADz0scNhe5OJz59oWlu34d1A=
Date: Tue, 12 Dec 2023 12:43:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: shitao <shitao@kylinos.cn>
Cc: alcooperx@gmail.com, chunfeng.yun@mediatek.com,
	justin.chen@broadcom.com, kernel-bot@kylinos.cn,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: bdc: fix comment typo
Message-ID: <2023121244-peso-gleaming-14c0@gregkh>
References: <2023121251-attest-shout-cbaa@gregkh>
 <20231212111754.3115465-1-shitao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212111754.3115465-1-shitao@kylinos.cn>

On Tue, Dec 12, 2023 at 07:17:54PM +0800, shitao wrote:
> Fix comment typo in bdc_core.c file.
> "dynamic" is misspelled as "dyanmic".
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: shitao <shitao@kylinos.cn>
> ---
> Hi, 
> according to your suggestion, I have split it into two patches and added some simple instructions. 
> This is a change that fixes the misspelling of "dynamic" in bdc_core.c file. 
> thanks.
>  drivers/usb/gadget/udc/bdc/bdc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> index 35a652807fca..874122f8baa3 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> @@ -361,7 +361,7 @@ int bdc_reinit(struct bdc *bdc)
>  	return ret;
>  }
>  
> -/* Allocate all the dyanmic memory */
> +/* Allocate all the dynamic memory */
>  static int bdc_mem_alloc(struct bdc *bdc)
>  {
>  	u32 page_size;
> -- 
> 2.34.1
> 
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

