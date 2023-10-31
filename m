Return-Path: <linux-usb+bounces-2402-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A61E7DCF22
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 15:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 886AA1C20C6C
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 14:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25131DFC6;
	Tue, 31 Oct 2023 14:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4547DEAE8
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 14:27:26 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 47F29C9
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 07:27:24 -0700 (PDT)
Received: (qmail 717038 invoked by uid 1000); 31 Oct 2023 10:27:23 -0400
Date: Tue, 31 Oct 2023 10:27:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Manan Aurora <maurora@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Badhri Jagan Sridharan <badhri@google.com>,
  Francesco Dolcini <francesco.dolcini@toradex.com>,
  linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
  manugautam@google.com
Subject: Re: [PATCH] usb: gadget: Support transfers from device memory
Message-ID: <73356479-e037-4727-9444-6ad4c89f6b75@rowland.harvard.edu>
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

You forgot to update the kerneldoc for struct usb_request.

Alan Stern

