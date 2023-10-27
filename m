Return-Path: <linux-usb+bounces-2259-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0D07D9596
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 12:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15B111C21014
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 10:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6963B13FE4;
	Fri, 27 Oct 2023 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UASXaaCk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3745FC04
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 10:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F8FC433C7;
	Fri, 27 Oct 2023 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698403867;
	bh=JrM3Szuj+NfQM6WkAlL4tN0ivyNbl22j2w9isdZSxhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UASXaaCkSALRhcaqTuX2fJ7aL7JzbpPABnkMNnbp+4mw94VKuxjvjRT67crsv2Plv
	 p2mAakjxAuvcdOx4xgEcmBz6eYoLULfRiyjwBWxzsQRLTVfW+2Lnj317yyYELOyIYe
	 DkI58Ii+1BK20IFLRrVH3TQuCSE9Zd9H9NUr7Nlo=
Date: Fri, 27 Oct 2023 12:51:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Zubin Mithra <zsm@chromium.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: set the dma max_seg_size
Message-ID: <2023102753-spirits-aerobics-c2c6@gregkh>
References: <20231026-dwc3-v1-1-643c74771599@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026-dwc3-v1-1-643c74771599@chromium.org>

On Thu, Oct 26, 2023 at 12:28:36PM +0000, Ricardo Ribalda wrote:
> Allow devices to have dma operations beyond 4K, and avoid warnings such
> as:
> 
> DMA-API: dwc3 a600000.usb: mapping sg segment longer than device claims to support [len=86016] [max=65536]
> 
> Reported-by: Zubin Mithra <zsm@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Found while running 
> yavta -f YUYV -s 1280x720 -c  /dev/video0
> 
> with:
> 
> CONFIG_DMA_API_DEBUG=y
> ---
>  drivers/usb/dwc3/core.c | 2 ++
>  1 file changed, 2 insertions(+)

What commit id does this fix?

thanks,

greg k-h

