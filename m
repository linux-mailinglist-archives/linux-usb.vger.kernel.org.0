Return-Path: <linux-usb+bounces-3743-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7945B805B34
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 18:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25704281D5B
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 17:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2A668B62;
	Tue,  5 Dec 2023 17:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ed+fczkA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AF53E483
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 17:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F253C433A9;
	Tue,  5 Dec 2023 17:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701797645;
	bh=jgbfGbZsBewA51hOqnV3bW8oStFg/dIzf/WIRR7nJ1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ed+fczkAv4EknCnLYlOvj2wiiJNrkWIgDfUzHEIAZG7ya5RsdMc0xMe9jBzcbl3du
	 oJPL8B8kemEQcMD2/WjDoIsiepE51ryxa7bVvouNiqx9q/k1uH+Vg0OpYQaSSDC3mF
	 buifRcZXf4IqzZszVKuUicz6PTYPipl34IyydYzM=
Date: Wed, 6 Dec 2023 02:33:58 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: benjamin.tissoires@redhat.com, ivan.orlov0322@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	john@keeping.me.uk, lee@kernel.org
Subject: Re: [PATCH 1/1] usb: gadget: f_hid: fix report descriptor allocation
Message-ID: <2023120650-scroll-studio-1083@gregkh>
References: <20231205085404.175-1-aladyshev22@gmail.com>
 <20231205085404.175-2-aladyshev22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205085404.175-2-aladyshev22@gmail.com>

On Tue, Dec 05, 2023 at 11:54:03AM +0300, Konstantin Aladyshev wrote:
> The commit "usb: gadget: f_hid: fix f_hidg lifetime vs cdev"
> (89ff3dfac604614287ad5aad9370c3f984ea3f4b) has introduced a bug
> that leads to hid device corruption after the replug operation.

Nit, this should be written as
	89ff3dfac604 ("usb: gadget: f_hid: fix f_hidg lifetime vs cdev")
right?

> Reverse device managed memory allocation for the report descriptor
> to fix the issue.
> 
> Tested:
> This change was tested on the AMD EthanolX CRB server with the BMC
> based on the OpenBMC distribution. The BMC provides KVM functionality
> via the USB gadget device:
> - before: KVM page refresh results in a broken USB device,
> - after: KVM page refresh works without any issues.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

We need a Fixes: tag here and also a cc: stable so that this gets
properly backported.

> ---
>  drivers/usb/gadget/function/f_hid.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
> index ea85e2c701a1..3c8a9dd585c0 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -92,6 +92,7 @@ static void hidg_release(struct device *dev)
>  {
>  	struct f_hidg *hidg = container_of(dev, struct f_hidg, dev);
>  
> +	kfree(hidg->report_desc);
>  	kfree(hidg->set_report_buf);
>  	kfree(hidg);
>  }
> @@ -1287,9 +1288,9 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
>  	hidg->report_length = opts->report_length;
>  	hidg->report_desc_length = opts->report_desc_length;
>  	if (opts->report_desc) {
> -		hidg->report_desc = devm_kmemdup(&hidg->dev, opts->report_desc,
> -						 opts->report_desc_length,
> -						 GFP_KERNEL);
> +		hidg->report_desc = kmemdup(opts->report_desc,
> +					    opts->report_desc_length,
> +					    GFP_KERNEL);

Yet one more reason why devm_*() functions are dangerous to use :(

Nice fix.

thanks,

greg k-h

