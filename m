Return-Path: <linux-usb+bounces-19681-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C883A1A72F
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 16:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74390188A558
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 15:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E60221146E;
	Thu, 23 Jan 2025 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RU/nq7Zg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AFEF4F1;
	Thu, 23 Jan 2025 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646722; cv=none; b=hGPsK3jfj8KrTcYHOEIRFszxLZI+gm75rtszAZOoTvWJEH3gicaKuif1ba4lTIpi8FeJwDbc+Eol0OzXPWI3gveFsbpfECARVLZ+D98Uqto+5f/0SCiXLQOpuA+dj0wqAf/cYi0LesDcTOHQQRgwFzMbRi2lLWN8YL7vFNt5iD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646722; c=relaxed/simple;
	bh=o1wUViI7/efytF2VXyqxtxXyfv6FPhTed+OvZ/XZKfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVR8/AZTzvIHKlNmkSkU7PelZIs1xOCxAe6kZ4MQruudWNlG/3lEOIIWBavT91Eg3pSjWdZSMSg7FN60AzqHBSVWb9VAzqGnCZ5mCb6NHGoJo7PeXzHJ1KxdHm4PKgE+xzeCl1u+GcZ4rFXErZOwpGkOU4peG4/B5nxW/8TLVKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RU/nq7Zg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867B5C4CED3;
	Thu, 23 Jan 2025 15:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737646721;
	bh=o1wUViI7/efytF2VXyqxtxXyfv6FPhTed+OvZ/XZKfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RU/nq7ZgHA9eBXW7VCfCU3xt+AhQ3CQU1FAI3t6Hp1dFc0CUQI2Gzsd8y1pO4SJau
	 47+6ooJHbLoNo6mLh4IP14T79jlELpF8LbTo885wko9y7jgW4wnJaaYiD2mOE8jrdR
	 HUGBSEw2oNLULhN3J9ysNKmbDuhnAJAwj7/cLRIM=
Date: Thu, 23 Jan 2025 16:38:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Usman Akinyemi <usmanakinyemi202@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2] usb: dwc3: Fix documentation warning for sg member
Message-ID: <2025012309-catfight-tightly-32f9@gregkh>
References: <20250123080102.1632517-1-usmanakinyemi202@gmail.com>
 <20250123151335.15878-1-usmanakinyemi202@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123151335.15878-1-usmanakinyemi202@gmail.com>

On Thu, Jan 23, 2025 at 08:43:35PM +0530, Usman Akinyemi wrote:
> The 'sg' member in struct dwc3_request was undocumented, causing a
> documentation warning when building the kernel docs.
> 
> This patch adds a description for the 'sg' field, resolving the warning.
> 
> Fixes: 61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>
> ---
>  drivers/usb/dwc3/core.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index ee73789326bc..0c417a12e6f4 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -941,6 +941,7 @@ struct dwc3_hwparams {
>   * @request: struct usb_request to be transferred
>   * @list: a list_head used for request queueing
>   * @dep: struct dwc3_ep owning this request
> + * @sg: pointer to a scatterlist for DMA operations
>   * @start_sg: pointer to the sg which should be queued next
>   * @num_pending_sgs: counter to pending sgs
>   * @remaining: amount of data remaining
> -- 
> 2.48.0

Wait, what kernel is this based on?  This structure does not have the
@sg field in it anymore in linux-next, so why is this warning still
showing up?

confused,

greg k-h

