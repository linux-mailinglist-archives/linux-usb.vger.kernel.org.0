Return-Path: <linux-usb+bounces-4025-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E58BF80E8FA
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 11:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C9371F2194D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 10:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D66A5B5B7;
	Tue, 12 Dec 2023 10:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iPXFmG93"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E6959539
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 10:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC61C433C8;
	Tue, 12 Dec 2023 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702376492;
	bh=bBdsJ1LFHIAiNvuKQ5c872B4cUZ1SzBz3JpEuXPCcuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iPXFmG93uJ75RElaOyg4kQqMjdOkE78zjP7doLMl+g2h85P/Psu1gL+xUKrXJFr9l
	 XpeickXl7jbSgK3VLgIg/gR5qKA/hY5QeG5UVFy30XX3w2NwKTcPwenK4fCRxvZkRb
	 ppaPB0Ox37BuGmDkF+hBDZMqmIZoxfilw8Gjdoo4=
Date: Tue, 12 Dec 2023 11:21:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: shitao <shitao@kylinos.cn>
Cc: alcooperx@gmail.com, chunfeng.yun@mediatek.com,
	justin.chen@broadcom.com, kernel-bot@kylinos.cn,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: mtu3: fix comment typo
Message-ID: <2023121216-shabby-hastily-f094@gregkh>
References: <2023121236-earful-email-ea09@gregkh>
 <20231212100657.3115089-1-shitao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212100657.3115089-1-shitao@kylinos.cn>

On Tue, Dec 12, 2023 at 06:06:57PM +0800, shitao wrote:
> Fix comment typo in mtu3_qmu.c file.
> "empty" is misspelled as "emtpy".
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: shitao <shitao@kylinos.cn>
> ---
>  drivers/usb/mtu3/mtu3_qmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
> index 3d77408e3133..03f26589b056 100644
> --- a/drivers/usb/mtu3/mtu3_qmu.c
> +++ b/drivers/usb/mtu3/mtu3_qmu.c
> @@ -221,7 +221,7 @@ static struct qmu_gpd *advance_deq_gpd(struct mtu3_gpd_ring *ring)
>  	return ring->dequeue;
>  }
>  
> -/* check if a ring is emtpy */
> +/* check if a ring is empty */
>  static bool gpd_ring_empty(struct mtu3_gpd_ring *ring)
>  {
>  	struct qmu_gpd *enq = ring->enqueue;
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

