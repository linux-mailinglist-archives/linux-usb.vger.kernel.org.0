Return-Path: <linux-usb+bounces-31347-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB42CB14B9
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 23:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B144A304791F
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 22:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804402EA493;
	Tue,  9 Dec 2025 22:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Thl7bYNE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5C22BD11;
	Tue,  9 Dec 2025 22:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765319491; cv=none; b=qM1A2m0qjCu0OaImekA5g8c7c/a7lSxE4J2f0KJsDbxpMugNQHrIQ5JT6ejsrXWhqrYOecizLPrenXQwARWq1FlCFjfclgGcQdUn2m5ks7gLihXrp8Wi9yGPIharW6NWaXov6z6O90JaaZda6HRb5ge0WxdJb1C44FNPFFQcFXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765319491; c=relaxed/simple;
	bh=YMYNTULoE1bIg0iXTvcT8JKk/HRg0xEHn9+7P7my0Is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCyVDBMd5boUSRW018r+fuTFk+pxgVxeqvYY/Ik96taN+ULaInXiWi8ZVkcY2DYg9YwRZMXDxRnfyg91royuhfjU6DEoh0RDiRfL8b+wGfbs7duB/5N725Z3EBOlnMDn8wMcoJwyJ0zkTOMnVT8/RC2Aa/CZ5J8/1wCAOdgOnfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Thl7bYNE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A26C4CEF5;
	Tue,  9 Dec 2025 22:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765319490;
	bh=YMYNTULoE1bIg0iXTvcT8JKk/HRg0xEHn9+7P7my0Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Thl7bYNEsNmHR8v9P29/veeSmJI9qvFNd1caWZ5jQLM+AduMjtFUYY9hn1d9tInsM
	 9lE06Jv39ccS0/31gNEG0kVM4P7w5sviWM+E0xkyV/Avs6qjP8D1TPx4f4RBfcsC/H
	 3E00vPjJNyWOirxtHdE5j/7rT+TO7etn6mFs9rgB5xsksvjI7nkYrbXYlBOL11qTJ9
	 /bAbYsdAQ2Zsy109c7H7qMEo0C4+b9Cd6ZX8q+K9j7fY/3R4tg4tTITr9lL+yX3uuc
	 1OW+BZbFFJvHLdxvZqlMqHog4V54jRbuoL/+SDmG5kXIKOi8NAGHzzcbV5W/96EHSz
	 TkIPth3JWXhTw==
Date: Tue, 9 Dec 2025 16:31:27 -0600
From: Rob Herring <robh@kernel.org>
To: adrianhoyin.ng@altera.com
Cc: gregkh@linuxfoundation.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org, Thinh.Nguyen@synopsys.com,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] usb: dwc3: Add support for Agilex5 in
 dwc3-generic-platform driver
Message-ID: <20251209223127.GA1242261-robh@kernel.org>
References: <cover.1765249127.git.adrianhoyin.ng@altera.com>
 <a9db62422d39ac51cb26b73c5537ca2f8130f7a3.1765249127.git.adrianhoyin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9db62422d39ac51cb26b73c5537ca2f8130f7a3.1765249127.git.adrianhoyin.ng@altera.com>

On Tue, Dec 09, 2025 at 02:25:11PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> 
> Adds support for Agilex5 in the dwc3-generic-platform driver. Extends
> generic driver to support configurable driver data to enable dwc3 core
> property configuration from glue driver.
> 
> Agilex5 DWC3 wrapper has a 40-bit DMA address bus limitation. When SMMU
> is enabled, using the default 64-bit DMA mask can cause DMA addresses to
> be truncated, leading to translation faults.
> 
> This patch adds a `dma_addressable_bits` field in struct dwc3, allowing
> the glue driver to set a 40-bit DMA mask during probe.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  drivers/usb/dwc3/core.c              |  6 +++++-
>  drivers/usb/dwc3/core.h              |  5 +++++
>  drivers/usb/dwc3/dwc3-generic-plat.c | 20 +++++++++++++++++++-
>  3 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index ae140c356295..1fca55637844 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -2243,7 +2243,11 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>  
>  	if (!dwc->sysdev_is_parent &&
>  	    DWC3_GHWPARAMS0_AWIDTH(dwc->hwparams.hwparams0) == 64) {
> -		ret = dma_set_mask_and_coherent(dwc->sysdev, DMA_BIT_MASK(64));
> +		if (!dwc->dma_addressable_bits)
> +			dwc->dma_addressable_bits = 64;
> +
> +		ret = dma_set_mask_and_coherent(dwc->sysdev,
> +						DMA_BIT_MASK(dwc->dma_addressable_bits));
>  		if (ret)
>  			goto err_disable_clks;
>  	}
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index a5fc92c4ffa3..a09800fe6577 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1180,6 +1180,10 @@ struct dwc3_glue_ops {
>   * @wakeup_pending_funcs: Indicates whether any interface has requested for
>   *			 function wakeup in bitmap format where bit position
>   *			 represents interface_id.
> + * @dma_addressable_bits: The number of address bits the device can drive on
> + *			the DMA bus. The driver uses this value to program DMA masks and
> + *			ensure DMA buffers are allocated within the device’s reachable
> + *			address space.
>   */
>  struct dwc3 {
>  	struct work_struct	drd_work;
> @@ -1414,6 +1418,7 @@ struct dwc3 {
>  	struct dentry		*debug_root;
>  	u32			gsbuscfg0_reqinfo;
>  	u32			wakeup_pending_funcs;
> +	u32			dma_addressable_bits;
>  };
>  
>  #define INCRX_BURST_MODE 0
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index d96b20570002..e9650df6cf81 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -20,6 +20,11 @@ struct dwc3_generic {
>  	struct reset_control	*resets;
>  };
>  
> +struct dwc3_generic_config {
> +	u32 flags;
> +};
> +
> +#define DWC3_HAS_40BIT_DMA_QUIRK BIT(0)

Quirk flags are good, but if we have 10 different address sizes that's 
10 flags. Just make a dma_addressable_bits field here too, and then it 
is just a straight assignment.

Rob

