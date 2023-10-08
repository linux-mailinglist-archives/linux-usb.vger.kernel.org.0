Return-Path: <linux-usb+bounces-1236-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D52A7BCC75
	for <lists+linux-usb@lfdr.de>; Sun,  8 Oct 2023 07:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6D341C2094F
	for <lists+linux-usb@lfdr.de>; Sun,  8 Oct 2023 05:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB6F522F;
	Sun,  8 Oct 2023 05:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sHit2g7Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCFD187E
	for <linux-usb@vger.kernel.org>; Sun,  8 Oct 2023 05:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D6EC433C8;
	Sun,  8 Oct 2023 05:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696743940;
	bh=k2Tp/2pw/wYfqDV0JO1BVMHffzwaiBRA32OT6uvgPjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHit2g7QZF1FAQWtSEwyyAeX0eAwcUExUPA2svTniYufAR8TVU6eerCfoEWXrLgm6
	 w02C7+Y5G66OfU5edwgqmE9nTW8/4g/DJQOb2FhYXbqoEwkk//l39+bgN/IafYbeRW
	 LZftwFc/N8ISJ/sxr69btDKwIDM14yMn801IBi8A=
Date: Sun, 8 Oct 2023 07:45:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jayant Chowdhary <jchowdhary@google.com>
Cc: corbet@lwn.net, laurent.pinchart@ideasonboard.com,
	dan.scally@ideasonboard.com, kieran.bingham@ideasonboard.com,
	linux-usb@vger.kernel.org, inux-doc@vger.kernel.org,
	etalvala@google.com, arakesh@google.com
Subject: Re: uvc gadget: Making upper bound of number of usb requests
 allocated configurable through configfs
Message-ID: <2023100834-statistic-richly-49ef@gregkh>
References: <edad1597-48da-49d2-a089-da2487cac889@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edad1597-48da-49d2-a089-da2487cac889@google.com>

On Fri, Oct 06, 2023 at 03:03:56PM -0700, Jayant Chowdhary wrote:
> Hi Everyone,
> 
> We had been seeing the UVC gadget driver receive isoc errors while
> sending packets to the usb endpoint - resulting in glitches being shown
> on linux hosts. My colleague Avichal Rakesh and others had a very
> enlightening discussion at
> https://lore.kernel.org/linux-usb/8741b7cb-54ec-410b-caf5-697f81e8ad64@google.com/T/
> 
> 
> The conclusion that we came to was : usb requests with actual uvc frame
> data were missing their scheduled uframes in the usb controller. As a
> mitigation, we started sending 0 length usb requests when there was no
> uvc frame buffer available to get data from. Even with this mitigation,
> we are seeing glitches - albeit at a lower frequency.
> 
> After some investigation, it is seen that we’re getting isoc errors when
> the worker thread serving video_pump() work items, doesn’t get scheduled
> for longer periods of time - than usual - in most cases > 6ms.
> This is close enough to the 8ms limit that we have when the number of usb
> requests in the queue is 64 (since we have a 125us uframe period). In order
> to tolerate the scheduling delays better, it helps to increase the number of
> usb requests in the queue . In that case, we have more 0 length requests
> given to the udc driver - and as a result we can wait longer for uvc
> frames with valid data to get processed by video_pump(). I’m attaching a
> patch which lets one configure the upper bound on the number of usb
> requests allocated through configfs. Please let me know your thoughts.
> I can formalize  the patch if it looks okay.

Why do you want to limit the upper bound?  Why not just not submit so
many requests from userspace as you control that, right?


> 
> Thank you
> 
> Jayant
> 
> ---
>  .../ABI/testing/configfs-usb-gadget-uvc       |  2 ++
>  Documentation/usb/gadget-testing.rst          | 21 ++++++++++++-------
>  drivers/usb/gadget/function/f_uvc.c           |  4 +++-
>  drivers/usb/gadget/function/u_uvc.h           |  1 +
>  drivers/usb/gadget/function/uvc.h             |  3 +++
>  drivers/usb/gadget/function/uvc_configfs.c    |  2 ++
>  drivers/usb/gadget/function/uvc_queue.c       |  5 ++++-
>  7 files changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc
> b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> index 4feb692c4c1d..9bc58440e1b7 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> @@ -7,6 +7,8 @@ Description:    UVC function directory
>          streaming_maxburst    0..15 (ss only)
>          streaming_maxpacket    1..1023 (fs), 1..3072 (hs/ss)
>          streaming_interval    1..16
> +         streaming_max_usb_requests 64..256
> +
>          function_name        string [32]
>          ===================    =============================
> 
> diff --git a/Documentation/usb/gadget-testing.rst
> b/Documentation/usb/gadget-testing.rst
> index 29072c166d23..24a62ba8e870 100644
> --- a/Documentation/usb/gadget-testing.rst
> +++ b/Documentation/usb/gadget-testing.rst
> @@ -790,14 +790,19 @@ Function-specific configfs interface
>  The function name to use when creating the function directory is "uvc".
>  The uvc function provides these attributes in its function directory:
> 
> -    =================== ================================================
> -    streaming_interval  interval for polling endpoint for data transfers
> -    streaming_maxburst  bMaxBurst for super speed companion descriptor
> -    streaming_maxpacket maximum packet size this endpoint is capable of
> -                sending or receiving when this configuration is
> -                selected
> -    function_name       name of the interface
> -    =================== ================================================
> +    =================== ===========================================
> +    streaming_interval         interval for polling endpoint for data
> +                    transfers
> +    streaming_maxburst          bMaxBurst for super speed companion
> +                    descriptor
> +    streaming_maxpacket         maximum packet size this endpoint is
> +                    capable of sending or receiving when
> +                    this configuration is selected
> +        streaming_max_usb_requests  upper bound for the number of usb
> requests
> +                        the gadget driver will allocate for
> +                    sending to the endpoint.
> +    function_name            name of the interface

Note, your patch is whitespace damaged and line-wrapped, making it
really really hard to read and impossible to apply.

thanks,

greg k-h

