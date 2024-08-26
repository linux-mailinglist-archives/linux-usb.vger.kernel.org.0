Return-Path: <linux-usb+bounces-14067-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBE095E630
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 03:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C7182812F4
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 01:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE73F20ED;
	Mon, 26 Aug 2024 01:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5HeFy9S"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B604A07;
	Mon, 26 Aug 2024 01:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724634676; cv=none; b=XIxmua9gypx58Sb5Hc570Wjjkk9BolDsgNhGFJm3C5eT4NLpOZuirrqa0cY681CHABfC72XPsELWq4M5kBBHVwUoGHA+mOeMDi7B3gj8/9x0scFQUJmnacjUGbCTbBU8/RmlyhUnxafFuZIPBpoBSxLZi8rjwfoNi8UYbpcENxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724634676; c=relaxed/simple;
	bh=9qxSD6Rd+d4l3JvNvgDzZtO8m65Ariiiau/Z65aL748=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdmcSO250rwPV+XkreCPALnuB5KWftB3lx6RM3i0wwinUOtArXcwTOAPwipxupjPZ6gQrJA29SSAVXfmsbP4SAW/yA8ggOhQsAKnl7XrPWYFvbpnI/05Ih8/2j6WMYsjN5c4g7H8icxYS6K8eXq6MNbXm9Dy5gdwLcBQ1ywFerE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5HeFy9S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D65C4AF16;
	Mon, 26 Aug 2024 01:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724634676;
	bh=9qxSD6Rd+d4l3JvNvgDzZtO8m65Ariiiau/Z65aL748=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5HeFy9SGUadG2YMNc+z49+n7jAhc8Dthp91VAzIlipKeTbYfo1k9bLWrRN1/thWL
	 FgMvXfFiqoqTdWeK0E0QHJ9OhAV/CqDwCWJJL09VfOCIey+DY0V/DoWzUHIkNLSz71
	 m1SlCkoZH9RiNbuLWDS0TqXAih2kkqI1zLBKvVU3ku7ckO8hjpZrchHvIV1H0fVRdi
	 ARkegnHQNTeeQqYHvSR9tP7MFb8rwqXIfaIkOhQaQck+k87Lt/f04vT97jY0NgHAG6
	 rEe+mihZFfEGXr1gGNJeLvszjoHL91K12LsgA6aK/GwzdAIul6ZEVypR5sY52PdVcZ
	 JgPRYei+LMJgg==
Date: Mon, 26 Aug 2024 09:11:08 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: udc: enable suspend interrupt after usb
 reset
Message-ID: <20240826011108.GA807665@nchen-desktop>
References: <20240823073832.1702135-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823073832.1702135-1-xu.yang_2@nxp.com>

On 24-08-23 15:38:32, Xu Yang wrote:
> Currently, suspend interrupt is enabled before pullup enable operation.
> This will cause a suspend interrupt assert right after pullup DP. This
> suspend interrupt is meaningless, so this will ignore such interrupt
> by enable it after usb reset completed.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

> ---
>  drivers/usb/chipidea/udc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 2d7f616270c1..69ef3cd8d4f8 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -86,7 +86,7 @@ static int hw_device_state(struct ci_hdrc *ci, u32 dma)
>  		hw_write(ci, OP_ENDPTLISTADDR, ~0, dma);
>  		/* interrupt, error, port change, reset, sleep/suspend */
>  		hw_write(ci, OP_USBINTR, ~0,
> -			     USBi_UI|USBi_UEI|USBi_PCI|USBi_URI|USBi_SLI);
> +			     USBi_UI|USBi_UEI|USBi_PCI|USBi_URI);
>  	} else {
>  		hw_write(ci, OP_USBINTR, ~0, 0);
>  	}
> @@ -877,6 +877,7 @@ __releases(ci->lock)
>  __acquires(ci->lock)
>  {
>  	int retval;
> +	u32 intr;
>  
>  	spin_unlock(&ci->lock);
>  	if (ci->gadget.speed != USB_SPEED_UNKNOWN)
> @@ -890,6 +891,11 @@ __acquires(ci->lock)
>  	if (retval)
>  		goto done;
>  
> +	/* clear SLI */
> +	hw_write(ci, OP_USBSTS, USBi_SLI, USBi_SLI);
> +	intr = hw_read(ci, OP_USBINTR, ~0);
> +	hw_write(ci, OP_USBINTR, ~0, intr | USBi_SLI);
> +
>  	ci->status = usb_ep_alloc_request(&ci->ep0in->ep, GFP_ATOMIC);
>  	if (ci->status == NULL)
>  		retval = -ENOMEM;
> -- 
> 2.34.1
> 

