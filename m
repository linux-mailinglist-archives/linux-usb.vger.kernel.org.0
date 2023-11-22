Return-Path: <linux-usb+bounces-3178-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1776E7F456C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 13:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E4FAB2113C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 12:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C871BDD6;
	Wed, 22 Nov 2023 12:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L8PF9xHL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB574BABA
	for <linux-usb@vger.kernel.org>; Wed, 22 Nov 2023 12:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65E0C433C9;
	Wed, 22 Nov 2023 12:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700655038;
	bh=wl0JFYvB32NP7y30q+NX9TJJbF3cXUAoYsHbwutxyDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8PF9xHLNQicGYNp8JtaNyx/n8NDLkfwt2tBPdzukJLzsRucicY7f/SIUft+4P54x
	 7RuPTI8ETjaKi9ABpt5831/IdepwzgPfvCET6UsbhBN2/ZpPgdnZEt/TGd5IkwUPgW
	 mRsQpX+OmnWmBwBINOlxM69RtI6EUvVlshgHQMhs=
Date: Wed, 22 Nov 2023 12:10:34 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Kunwu Chan <chentao@kylinos.cn>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au,
	andriy.shevchenko@linux.intel.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kunwu.chan@hotmail.com,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: aspeed: Check return value of kasprintf in
 ast_vhub_alloc_epn
Message-ID: <2023112236-bullseye-pranker-491e@gregkh>
References: <20231122014212.304254-1-chentao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122014212.304254-1-chentao@kylinos.cn>

On Wed, Nov 22, 2023 at 09:42:12AM +0800, Kunwu Chan wrote:
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
> 
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/epn.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> index 148d7ec3ebf4..e0854e878411 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> @@ -826,6 +826,8 @@ struct ast_vhub_ep *ast_vhub_alloc_epn(struct ast_vhub_dev *d, u8 addr)
>  	ep->vhub = vhub;
>  	ep->ep.ops = &ast_vhub_epn_ops;
>  	ep->ep.name = kasprintf(GFP_KERNEL, "ep%d", addr);
> +	if (!ep->ep.name)
> +		return NULL;

This will break things if this ever triggers.  How was this tested?  The
"slot" for this device will still be seen as used and so the resources
never freed and then you can run out of space for real devices, right?

Looks like the other error handling in this function below this call is
also broken, can you fix that up too?

thanks,

greg k-h

