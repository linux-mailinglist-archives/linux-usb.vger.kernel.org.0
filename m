Return-Path: <linux-usb+bounces-31952-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 378E8CF7A58
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 10:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C03D53018C86
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 09:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3905230BF6A;
	Tue,  6 Jan 2026 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MUGSD37s"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C931A9B58;
	Tue,  6 Jan 2026 09:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767693495; cv=none; b=St0p7XiIOJwcqo1nx2wAPJPJcEH7JL1CqyI3EjKQZ2dyAZjNdZ9Il7zciiH5H1zMgXOzhHWATBFYFpgldovNEUSfOcBZYO+GUVQWpI7OKsuFVVFodIkAauLSFKvE1F0hgCfwmy74r+jIM1DaOPB9CxqWlCEuvnpAPiFS2GzOVhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767693495; c=relaxed/simple;
	bh=zecyD6jx1N+YYyhD3IIwywJFs3ybeeH+jiAxERRpko8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcilgaAjtUMijfYl8T2gDGObunX2bgF3ZOVS3glwVbavq82ITwZj2XjZSaD//fEtxXg040YLfxgbiPu6UI2ZCPub5W3HkvxpmPZ0aBui7EJrwBlK355b4gfFtS3Pa54lL8KrtNjnSX0KuHjPXfb5ZGKzBkDJf0aa4DEHHiFOJQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MUGSD37s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92952C116C6;
	Tue,  6 Jan 2026 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767693494;
	bh=zecyD6jx1N+YYyhD3IIwywJFs3ybeeH+jiAxERRpko8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUGSD37sBazey+mwoPVHrUPHATezjF1NVs087X+pbMGLilTvaH9xrxoO+7lrKWeh9
	 3n240cdwkn5d+Od3q9hADgTjPXK9WOXJCcFUnXNhTFHIL4GLfj2F8R3N/ki2dAJtM5
	 RVHDxKqFCUak1IlUCxDwscZHoNNWt/PbXoj125J4=
Date: Tue, 6 Jan 2026 10:58:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] usb: dwc3: Log dwc3 instance name in traces
Message-ID: <2026010652-dissuade-reproduce-008d@gregkh>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
 <20260105115325.1765176-4-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105115325.1765176-4-prashanth.k@oss.qualcomm.com>

On Mon, Jan 05, 2026 at 05:23:25PM +0530, Prashanth K wrote:
> When multiple DWC3 controllers are being used, trace events from
> different instances get mixed up making debugging difficult as
> there's no way to distinguish which instance generated the trace.
> 
> Append the base address of dwc3 controller to trace events, so that
> the source instance is clearly identifiable.
> 
> Example trace output,
> before ->  dwc3_event: event (00000101): Reset [U0]
> after  ->  dwc3_event: 0a600000: event (00000101): Reset [U0]
> 
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/core.c   |  6 ++-
>  drivers/usb/dwc3/core.h   |  2 +
>  drivers/usb/dwc3/ep0.c    |  2 +-
>  drivers/usb/dwc3/gadget.c |  2 +-
>  drivers/usb/dwc3/io.h     |  4 +-
>  drivers/usb/dwc3/trace.h  | 88 ++++++++++++++++++++++++---------------
>  6 files changed, 66 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 670a9d4bfff2..3aa85f5f1c47 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -158,7 +158,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
>  	dwc3_writel(dwc, DWC3_GCTL, reg);
>  
>  	dwc->current_dr_role = mode;
> -	trace_dwc3_set_prtcap(mode);
> +	trace_dwc3_set_prtcap(dwc, mode);
>  }
>  EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
>  
> @@ -2193,6 +2193,10 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>  	dwc_res = *res;
>  	dwc_res.start += DWC3_GLOBALS_REGS_START;
>  
> +	/* Store the physical base address for logging in trace */
> +	snprintf(dwc->base_addr, sizeof(dwc->base_addr), "%08llx",
> +		 (unsigned long long)res->start);

I think start is defined as resource_size_t, which is really
phys_addr_t, which is then either a u64 or u32, so why not just use u64
here?

And are you _sure_ it is ok to expose that to userspace?


> +
>  	if (dev->of_node) {
>  		struct device_node *parent = of_get_parent(dev->of_node);
>  
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 23188b910528..c16e47273ea0 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1178,6 +1178,7 @@ struct dwc3_glue_ops {
>   * @wakeup_pending_funcs: Indicates whether any interface has requested for
>   *			 function wakeup in bitmap format where bit position
>   *			 represents interface_id.
> + * @base_addr: The HW base address of DWC3 controller.

You already have this pointer to the resource in dwc3 somewhere, so why
are you storing this as a char string and not just always using the
"real" resource instead?

And also, document this as ONLY needed for debugging things, that's not
obvious here at all.

thanks,

greg k-h

