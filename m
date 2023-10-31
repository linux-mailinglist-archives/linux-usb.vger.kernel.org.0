Return-Path: <linux-usb+bounces-2382-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFACD7DC62B
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 07:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A47F28170D
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 06:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050C2DDDA;
	Tue, 31 Oct 2023 06:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zh2A5CVZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1C1D535
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 06:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CA8C433CA;
	Tue, 31 Oct 2023 06:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698732048;
	bh=iB7SU7X4lCstBjTo8XyyKak/6Jb9SnOPNn+3KyJ7p0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zh2A5CVZRru44YRIKIqWgBlvs+Eka4zB5nuE+V1uSdIzn+2pyUyu8fNZoXzVlJeb3
	 jK88r+MzXmF/B9wcDF+a0H03NTf4zlODNJbAy8VhyW48AnY9vQUFXafHtFCKMZzIt3
	 Q/LqauFxEy+LhgzZAEaZX3fI/h4nUR9xzrdK+h6U=
Date: Tue, 31 Oct 2023 07:00:43 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Manan Aurora <maurora@google.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	manugautam@google.com
Subject: Re: [PATCH] usb: gadget: Support transfers from device memory
Message-ID: <2023103156-clapping-shed-4626@gregkh>
References: <20231031035403.661938-1-maurora@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031035403.661938-1-maurora@google.com>

On Tue, Oct 31, 2023 at 03:54:02AM +0000, Manan Aurora wrote:
> USB gadget stack only supports usb_request objects that point to buffers
> located in memory. Support use cases where data is transferred from
> physical addresses in device mmio regions
> 
> Added a bit "pre_mapped" to usb_request to bypass dma_map_single and
> dma_map_sg for such requests
> 
> The caller must determine the dma address for the request before queuing
> it
> 
> Signed-off-by: Manan Aurora <maurora@google.com>
> ---
>  drivers/usb/gadget/udc/core.c | 4 ++--
>  include/linux/usb/gadget.h    | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index ded9531f141b..236165ba08f4 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -900,7 +900,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_activate);
>  int usb_gadget_map_request_by_dev(struct device *dev,
>  		struct usb_request *req, int is_in)
>  {
> -	if (req->length == 0)
> +	if (req->pre_mapped || req->length == 0)
>  		return 0;
>  
>  	if (req->num_sgs) {
> @@ -948,7 +948,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_map_request);
>  void usb_gadget_unmap_request_by_dev(struct device *dev,
>  		struct usb_request *req, int is_in)
>  {
> -	if (req->length == 0)
> +	if (req->pre_mapped || req->length == 0)
>  		return;
>  
>  	if (req->num_mapped_sgs) {
> diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> index a771ccc038ac..6bc035439098 100644
> --- a/include/linux/usb/gadget.h
> +++ b/include/linux/usb/gadget.h
> @@ -111,6 +111,7 @@ struct usb_request {
>  	unsigned		zero:1;
>  	unsigned		short_not_ok:1;
>  	unsigned		dma_mapped:1;
> +	unsigned		pre_mapped:1;
>  
>  	void			(*complete)(struct usb_ep *ep,
>  					struct usb_request *req);
> -- 
> 2.42.0.820.g83a721a137-goog
> 
> 

You can not add features/functionality that no in-kernel driver uses, so
this can not be accepted as-is, sorry.  Please submit it as part of a
patch series where it is actually used, otherwise we have no idea if
this is even something that we should do or not.

thanks,

greg k-h

