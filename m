Return-Path: <linux-usb+bounces-1111-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDCF7B9B53
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 09:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 96BD82819E4
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 07:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20131539E;
	Thu,  5 Oct 2023 07:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XDuG4qOy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811C07F
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 07:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E236C433BA;
	Thu,  5 Oct 2023 07:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696490532;
	bh=jUfZTGY+kqGGT0qdvtXa/BI0w4/Qe8O769xiXTh1Lw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDuG4qOyAI6SDULiYIDfJ7F+3i6I4BC0ubcw2u4vUMDe/2tUGp9zSD2r1XmPd9cjL
	 pwkYyfgIRbIxWx+cfz33VTYVk0WND5Y2yGEBpWFAH3ZvC9bSOSue+GODPOM4qcPJVP
	 hZUr97OTE5TBO4SBz+rHoNsEgTZx5hO+/SahJaco=
Date: Thu, 5 Oct 2023 09:22:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonas Blixt <jonas.blixt@actia.se>
Cc: shuah@kernel.org, valentina.manea.m@gmail.com,
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: usbip: fix stub_dev hub disconnect
Message-ID: <2023100548-kleenex-deceased-624e@gregkh>
References: <20230615092810.1215490-1-jonas.blixt@actia.se>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615092810.1215490-1-jonas.blixt@actia.se>

On Thu, Jun 15, 2023 at 11:28:10AM +0200, Jonas Blixt wrote:
> If a hub is disconnected that has device(s) that's attached to the usbip layer
> the disconnect function might fail because it tries to release the port
> on an already disconnected hub.
> 
> Fixes: 6080cd0e9239 ("staging: usbip: claim ports used by shared devices")
> Signed-off-by: Jonas Blixt <jonas.blixt@actia.se>
> ---
> v2:
>  - Clarify comment
> v1:
>  Link to v1: https://lore.kernel.org/linux-usb/20230615092205.GA1212960@W388ANL/T/#m575e37dc404067797eadf4444857366c73ba3420
> ---
>  drivers/usb/usbip/stub_dev.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
> index 2305d425e6c9..2170c95c8dab 100644
> --- a/drivers/usb/usbip/stub_dev.c
> +++ b/drivers/usb/usbip/stub_dev.c
> @@ -427,8 +427,13 @@ static void stub_disconnect(struct usb_device *udev)
>  	/* release port */
>  	rc = usb_hub_release_port(udev->parent, udev->portnum,
>  				  (struct usb_dev_state *) udev);
> -	if (rc) {
> -		dev_dbg(&udev->dev, "unable to release port\n");
> +	/*
> +	 * NOTE: If a HUB disconnect triggered disconnect of the down stream
> +	 * device usb_hub_release_port will return -ENODEV so we can safely ignore
> +	 * that error here.
> +	 */
> +	if (rc && (rc != -ENODEV)) {
> +		dev_dbg(&udev->dev, "unable to release port (%i)\n", rc);
>  		return;
>  	}
>  
> -- 
> 2.25.1
> 

Shuah, what ever happened to this change, is it correct or was something
else applied to fix it?

thanks,

greg k-h

