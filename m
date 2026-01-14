Return-Path: <linux-usb+bounces-32329-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A44D1E7B5
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 12:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56A0D30299EB
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 11:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866D0395DA5;
	Wed, 14 Jan 2026 11:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I/b5z5+R"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151E238A28A;
	Wed, 14 Jan 2026 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768390943; cv=none; b=g5chYCgqGC4C4Cs9/PwKl2FaGIAhIam6v77m5U5GyxiDWcgr+9Ch7TDk98qJtn8x8nb8Jz3bQAfi2sK1gVPD6RECaEb7MPshqgUNG1pkbrI+5H5Z1BUp8txhGGGt0zCOBthkr182y+7hU5xZ6aw/2bicmjn4ZBMBnDV7HpcOdro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768390943; c=relaxed/simple;
	bh=vqQWgXDK9WnuSnWUEaurZTgbMLGQ8XxQlxrMHDnQ1Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvIFTHou/3ycBv29Rf+SN5QxQk0sr5b9Jffnxsx4Lv7zg5+hhwai59mKe12BsOWXxx2fWL/IzXrD/84RsMtlaD/kGg20qkJRQXaFWsZZTt4gErL3qh4r4kYuvZP731bygZyvwAqVNCFcZM+TUBqm3YkJ8Q+JUKOJrvwztcETAFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I/b5z5+R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B7EC4CEF7;
	Wed, 14 Jan 2026 11:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768390942;
	bh=vqQWgXDK9WnuSnWUEaurZTgbMLGQ8XxQlxrMHDnQ1Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/b5z5+RVOK3XQfzbVpJev9DRQCRAAQIy9sdnznKOtD1wvJygqhcmvZWrXVQiFmy6
	 UJG/AxLKQpDxFz01KljQraqJPkzFJGMI4Oh1SO/q2cUnYgC5PdxBJ2Y6o4nghr4Jb6
	 qmL+6pjAILy/Xioq4GckHlkYVoQtLsMrZquSdf7s=
Date: Wed, 14 Jan 2026 12:42:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Message-ID: <2026011406-coyness-latter-aee4@gregkh>
References: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
 <20260114100748.2950103-4-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114100748.2950103-4-prashanth.k@oss.qualcomm.com>

On Wed, Jan 14, 2026 at 03:37:48PM +0530, Prashanth K wrote:
> When multiple DWC3 controllers are being used, trace events from
> different instances get mixed up making debugging difficult as
> there's no way to distinguish which instance generated the trace.
> 
> Use the register base address of dwc3 controller and append it to
> trace events, so that the source instance is clearly identifiable.
> 
> Example trace output,
> before ->  dwc3_event: event (00000101): Reset [U0]
> after  ->  dwc3_event: 0a600000: event (00000101): Reset [U0]
> 
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/core.c   |  5 ++-
>  drivers/usb/dwc3/core.h   |  2 +
>  drivers/usb/dwc3/ep0.c    |  2 +-
>  drivers/usb/dwc3/gadget.c |  2 +-
>  drivers/usb/dwc3/io.h     |  4 +-
>  drivers/usb/dwc3/trace.h  | 88 ++++++++++++++++++++++++---------------
>  6 files changed, 65 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 670a9d4bfff2..125616489e04 100644
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
> @@ -2193,6 +2193,9 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>  	dwc_res = *res;
>  	dwc_res.start += DWC3_GLOBALS_REGS_START;
>  
> +	/* Store the base register address for using it in traces later */
> +	dwc->address = (u32)res->start;

And shouldn't this be dwc_res.start?  Why ignore
DWC3_GLOBALS_REGS_START?

And because of that, shouldn't this go below:

> +
>  	if (dev->of_node) {
>  		struct device_node *parent = of_get_parent(dev->of_node);

That if statement, which will change the real resource start range
value?

thanks,

greg k-h

