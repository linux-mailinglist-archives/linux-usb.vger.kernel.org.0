Return-Path: <linux-usb+bounces-16809-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBD79B4112
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 04:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24EEFB21E5F
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 03:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438001F9EBD;
	Tue, 29 Oct 2024 03:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vIalFU81"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A339F16F84F
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 03:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730172959; cv=none; b=VhKULI+D0LxBjjjO/OY9jk5BbPxsDjJY6HrjEb7KDO/1ooXSiGh4UhjX+jm0lfHTx7kucUbRz9jq2T9EzMtLrVrlacqS8YSiHGvAXrtP7L8VvqbyvnGXbHza6KhWC4VqUfnp6qeY0rqNNPS08MpQjnLeFLP8FCzMXdU9AYlQM+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730172959; c=relaxed/simple;
	bh=OT2Ud4HFs9UnlSfVUySBuiRhF2pGkaG/K14Lbc2+mNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3COUiPm+UnquaC9tqQmx2H3v0JhNL4GuBrF6gpPtjtnmyedcB7UoP5US6i5f6X/KMBmxyv84TBibvxW/QdHUccfqbwxTNsDvYWRnS1b5qLgfWJ6yBBTEkpqUOpdGkKXecUB5X9rm+l+gCGB/+2fpDoDuVmpble3gj4GZszLgaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vIalFU81; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C98C4CECD;
	Tue, 29 Oct 2024 03:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730172959;
	bh=OT2Ud4HFs9UnlSfVUySBuiRhF2pGkaG/K14Lbc2+mNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vIalFU81ddvrAfVZ3ua1XUYcgxcjhatyaKlsfXgdrSyxg/FNtLoqQYENoznll7Ja4
	 ZnwupZ13WyuIeUQKiYzWblsmY8BZUxWwHBs/0cNudr3Q+otrqdA2s9yQ6eWjwyUV1C
	 rk/DJ6zW+8MzdyJlvXmHXcsRJqlvSDHQIjmD3iwg=
Date: Tue, 29 Oct 2024 04:35:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: peter.chen@kernel.org, pawell@cadence.com, rogerq@kernel.org,
	linux-usb@vger.kernel.org, chenridong@huawei.com,
	wangweiyang2@huawei.com
Subject: Re: [PATCH] usb: cdns3: avoid possible null_ptr_deref in
 cdns3_gadget_ep_queue
Message-ID: <2024102917-wand-shanty-bbbc@gregkh>
References: <20241025064331.1049538-1-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025064331.1049538-1-chenridong@huaweicloud.com>

On Fri, Oct 25, 2024 at 06:43:31AM +0000, Chen Ridong wrote:
> From: Chen Ridong <chenridong@huawei.com>
> 
> The cdns3_gadget_ep_alloc_request functions may return NULL
> when memory is out of use. To void possible null_ptr_deref,
> return ENOMEM when cdns3_gadget_ep_alloc_request returns NULL.
> 
> Signed-off-by: Chen Ridong <chenridong@huawei.com>
> ---
>  drivers/usb/cdns3/cdns3-gadget.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
> index fd1beb10bba7..982e8e0759e8 100644
> --- a/drivers/usb/cdns3/cdns3-gadget.c
> +++ b/drivers/usb/cdns3/cdns3-gadget.c
> @@ -2657,6 +2657,10 @@ static int cdns3_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
>  		struct cdns3_request *priv_req;
>  
>  		zlp_request = cdns3_gadget_ep_alloc_request(ep, GFP_ATOMIC);
> +		if (!zlp_request) {
> +			spin_unlock_irqrestore(&priv_dev->lock, flags);
> +			return -ENOMEM;

Are you sure this is ok?  What about the resources that have been
allocated before this return would interrupt them?  How was this tested?

thanks,

greg k-h

