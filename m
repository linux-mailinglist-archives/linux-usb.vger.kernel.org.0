Return-Path: <linux-usb+bounces-1509-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7047C7041
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 16:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 880981C20F7F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 14:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3D931A61;
	Thu, 12 Oct 2023 14:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcd4XL1k"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22C41EA95
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 14:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0BCC433C8;
	Thu, 12 Oct 2023 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697120890;
	bh=9NRzGriIdVw7J/qyLb/puVHqGx9a7Bn3c8C+RlHyPJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jcd4XL1kHu4ZxukZiedKOO9vymcQSdsub7HU+XzAdVwAHHgHAOktFo5kS0VC6K/sD
	 7Pz2bGGBSXuz8RRlzkpQbdFFN0Xu4pR5g9EbKkWQikKFsUIa9Qchbk1XuvA8hUUyHW
	 vcrC3QhqN3L7C8E+Bwd5XIZexWkZiZExpL5Sq8FCU8jEHxpuM6inTl9FSh5RofZF8a
	 hIBuT22XFHVvySvFuiNXPjFZSq9wf8d/Uy1RuH3NOU4E2CLABBime600XHUZDMe0XQ
	 xa3NFI9JmOLZzFGALVkO5jbICC3eG2IENFPUWMXni63pQyRpp88VPQGY5w+9cntOf+
	 SZsz5/QgjpQmQ==
Date: Thu, 12 Oct 2023 22:28:00 +0800
From: Peter Chen <peter.chen@kernel.org>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Geis <pgwipeout@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: chipidea: Fix DMA overwrite for Tegra
Message-ID: <20231012142800.GB1010588@nchen-desktop>
References: <cover.1695934946.git.mirq-linux@rere.qmqm.pl>
 <ef8466b834c1726f5404c95c3e192e90460146f8.1695934946.git.mirq-linux@rere.qmqm.pl>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef8466b834c1726f5404c95c3e192e90460146f8.1695934946.git.mirq-linux@rere.qmqm.pl>

On 23-09-28 23:06:03, Michał Mirosław wrote:
> Tegra USB controllers seem to issue DMA in full 32-bit words only and thus
> may overwrite unevenly-sized buffers.  One such occurrence is detected by
> SLUB when receiving a reply to a 1-byte buffer (below).  Fix this by
> allocating a bounce buffer also for buffers with sizes not a multiple of 4.
> 
> =============================================================================
> BUG kmalloc-64 (Tainted: G    B             ): kmalloc Redzone overwritten
> -----------------------------------------------------------------------------
> 
> 0x8555cd02-0x8555cd03 @offset=3330. First byte 0x0 instead of 0xcc
> Allocated in usb_get_status+0x2b/0xac age=1 cpu=3 pid=41
>  __kmem_cache_alloc_node+0x12f/0x1e4
>  __kmalloc+0x33/0x8c
>  usb_get_status+0x2b/0xac
>  hub_probe+0x5e9/0xcec
>  usb_probe_interface+0xbf/0x21c
>  really_probe+0xa5/0x2c4
>  __driver_probe_device+0x75/0x174
>  driver_probe_device+0x31/0x94
>  __device_attach_driver+0x65/0xc0
>  bus_for_each_drv+0x4b/0x74
>  __device_attach+0x69/0x120
>  bus_probe_device+0x65/0x6c
>  device_add+0x48b/0x5f8
>  usb_set_configuration+0x37b/0x6b4
>  usb_generic_driver_probe+0x37/0x68
>  usb_probe_device+0x35/0xb4
> Slab 0xbf622b80 objects=21 used=18 fp=0x8555cdc0 flags=0x800(slab|zone=0)
> Object 0x8555cd00 @offset=3328 fp=0x00000000
> 
> Redzone  8555ccc0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Redzone  8555ccd0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Redzone  8555cce0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Redzone  8555ccf0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Object   8555cd00: 01 00 00 00 cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Object   8555cd10: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Object   8555cd20: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Object   8555cd30: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Redzone  8555cd40: cc cc cc cc                                      ....
> Padding  8555cd74: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a              ZZZZZZZZZZZZ
> CPU: 3 PID: 41 Comm: kworker/3:1 Tainted: G    B              6.6.0-rc1mq-00118-g59786f827ea1 #1115
> Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> Workqueue: usb_hub_wq hub_event
> [<8010ca28>] (unwind_backtrace) from [<801090a5>] (show_stack+0x11/0x14)
> [<801090a5>] (show_stack) from [<805da2fb>] (dump_stack_lvl+0x4d/0x7c)
> [<805da2fb>] (dump_stack_lvl) from [<8026464f>] (check_bytes_and_report+0xb3/0xe4)
> [<8026464f>] (check_bytes_and_report) from [<802648e1>] (check_object+0x261/0x290)
> [<802648e1>] (check_object) from [<802671b1>] (free_to_partial_list+0x105/0x3f8)
> [<802671b1>] (free_to_partial_list) from [<80268613>] (__kmem_cache_free+0x103/0x128)
> [<80268613>] (__kmem_cache_free) from [<80425a67>] (usb_get_status+0x73/0xac)
> [<80425a67>] (usb_get_status) from [<80421b31>] (hub_probe+0x5e9/0xcec)
> [<80421b31>] (hub_probe) from [<80428bbb>] (usb_probe_interface+0xbf/0x21c)
> [<80428bbb>] (usb_probe_interface) from [<803ee13d>] (really_probe+0xa5/0x2c4)
> [<803ee13d>] (really_probe) from [<803ee3d1>] (__driver_probe_device+0x75/0x174)
> [<803ee3d1>] (__driver_probe_device) from [<803ee501>] (driver_probe_device+0x31/0x94)
> usb 1-1: device descriptor read/8, error -71
> 
> Fixes: fc53d5279094 ("usb: chipidea: tegra: Support host mode")
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Acked-by: Peter Chen <peter.chen@kernel.org>
> ---
>  drivers/usb/chipidea/host.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index 08af26b762a2..abddd39d1ff1 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -411,12 +411,13 @@ static int ci_hdrc_alloc_dma_aligned_buffer(struct urb *urb, gfp_t mem_flags)
>  	const unsigned int ci_hdrc_usb_dma_align = 32;
>  	size_t kmalloc_size;
>  
> -	if (urb->num_sgs || urb->sg || urb->transfer_buffer_length == 0 ||
> -	    !((uintptr_t)urb->transfer_buffer & (ci_hdrc_usb_dma_align - 1)))
> +	if (urb->num_sgs || urb->sg || urb->transfer_buffer_length == 0)
> +		return 0;
> +	if (!((uintptr_t)urb->transfer_buffer & (ci_hdrc_usb_dma_align - 1)) && !(urb->transfer_buffer_length & 3))
>  		return 0;
>  
>  	/* Allocate a buffer with enough padding for alignment */
> -	kmalloc_size = urb->transfer_buffer_length +
> +	kmalloc_size = ALIGN(urb->transfer_buffer_length, 4) +
>  		       sizeof(struct ci_hdrc_dma_aligned_buffer) +
>  		       ci_hdrc_usb_dma_align - 1;
>  
> -- 
> 2.39.2
> 

-- 

Thanks,
Peter Chen

