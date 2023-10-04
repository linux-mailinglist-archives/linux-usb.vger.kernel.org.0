Return-Path: <linux-usb+bounces-1061-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B38117B77E6
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 08:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 6C071281515
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 06:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048265692;
	Wed,  4 Oct 2023 06:36:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E8F1856
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 06:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9356EC433C8;
	Wed,  4 Oct 2023 06:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696401416;
	bh=pa7PlYE1f7PRJnLxkIzhxGZmwYROa1YY5M3fNWKm49w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oeDiCfkA6r/wSRXjjzfbJh5Nvt3ZVWZQVDAMOnPgQD2hIP8PL3m85ZEqpwwU6vXHV
	 hppiah+BeLZB5G3+T3AF3O6oFt+SgrXxwOP4kQOq9bhL9zAvJAmTLnA4L/U/Ne8xo2
	 v4XjZyo75kC7/eKfaj2AjZZY88dg0mfvXIdl5Pcs=
Date: Wed, 4 Oct 2023 08:36:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Woo-kwang Lee <wookwang.lee@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, sj1557.seo@samsung.com
Subject: Re: [PATCH] usb: core: add bos NULL pointer checking condition
Message-ID: <2023100439-king-salute-5cd5@gregkh>
References: <CGME20231004062700epcas1p16fe36bf6b6a6e5d9d4adeaef32937480@epcas1p1.samsung.com>
 <20231004062642.16431-1-wookwang.lee@samsung.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004062642.16431-1-wookwang.lee@samsung.com>

On Wed, Oct 04, 2023 at 03:26:42PM +0900, Woo-kwang Lee wrote:
> This issue occurs when connecting Galaxy S22 and abnormal SEC Dex Adapter.
> When the abnormal adapter is connected, kernel panic always occurs after a
> few seconds.
> This occurs due to unable to get BOS descriptor, usb_release_bos_descriptor
> set dev->bos = NULL.
> 
> - usb_reset_and_verify_device
>   - hub_port_init
>   - usb_release_bos_descriptor
>     - dev->bos = NULL;
> 
> hub_port_connect_change() calls portspeed(), and portspeed() calls hub_is_s
> uperspeedplus().
> Finally, hub_is_superspeedplus() calls hdev->bos->ssp_cap.
> It needs to check hdev->bos is NULL to prevent a kernel panic.
> 
> usb 3-1: new SuperSpeed Gen 1 USB device number 16 using xhci-hcd-exynos
> usb 3-1: unable to get BOS descriptor set
> usb 3-1: Product: USB3.0 Hub
> Unable to handle kernel NULL pointer dereference at virtual address 0000018
> 
> Call trace:
>  hub_port_connect_change+0x8c/0x538
>  port_event+0x244/0x764
>  hub_event+0x158/0x474
>  process_one_work+0x204/0x550
>  worker_thread+0x28c/0x580
>  kthread+0x13c/0x178
>  ret_from_fork+0x10/0x30
> 
> - hub_port_connect_change
>   - portspeed
>     - hub_is_superspeedplus
> 
> Fixes: 0cdd49a1d1a4 ("usb: Support USB 3.1 extended port status request")
> Signed-off-by: Woo-kwang Lee <wookwang.lee@samsung.com>
> ---
>  drivers/usb/core/hub.h | 2 ++
>  1 file changed, 2 insertions(+)

Are you sure this isn't already fixed by commit f74a7afc224a ("usb: hub:
Guard against accesses to uninitialized BOS descriptors") in linux-next?

thanks,

greg k-h

