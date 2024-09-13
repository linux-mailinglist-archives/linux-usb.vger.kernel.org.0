Return-Path: <linux-usb+bounces-15062-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8968197765A
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 03:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42E6E285E65
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 01:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1444A28;
	Fri, 13 Sep 2024 01:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ix+68JlT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5944A06;
	Fri, 13 Sep 2024 01:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726190454; cv=none; b=Yc5PLSf/Hl9YBtW6HhGSbiUau+Y4yGcER4hEINTyUeROSuEgj83/w2Qn1AeY04k+ViIAko3c6qsx97rbkIAIYEwl+2EKyPLDf+TpJkjrgAEQ/0yRt6tEezdrc2aQken6eiZ3YejP2iWeanwvFoKZbWp1M8qFaaHHS0YAnBPVkk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726190454; c=relaxed/simple;
	bh=VcDIvEwAHrvmEiuXUDM/KAOQWTRLgSLltWnbqqhQbNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLb1GogWlHAXwklD7PNhmrBw5ZFHt3XiC2IKtuZNVAqXyK8uLVnpA2oZsUsMt5XN0AOki1lzUlGvaUURukExDjcPqXXie3qpx3igKBgQoECj4EIsbQtsq3BcT9nVxKucJpaYDRfPFO28Lq+Cn15mSl0LRWTGIyU5DUkwOo1mmqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ix+68JlT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01EDC4CEC3;
	Fri, 13 Sep 2024 01:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726190453;
	bh=VcDIvEwAHrvmEiuXUDM/KAOQWTRLgSLltWnbqqhQbNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ix+68JlTdvXksJsw3/SvpqcptI8dqDHrC6MTKqflU2y+IPobhb6rRzQ1mYWubLDXY
	 uK9eGkWicE+6IUn6feButcx/Id9og2BFq5P73kuQCsXn1SLmTbDBBbv9o4q1fd619h
	 ebZ7Pijf8Jm3fKQx57e/kYwgCLZrVPrsQOr4TfsmwH2gmvxvSNN8NP5ynYFpT5Fg8E
	 2VTBdMc9n3AYTq98ec85fS80lkCZ+fawiPDN4nghjNpDFA4+DGD/zBNRjRLp9uDqgh
	 DUlxbIlXlvKSNJSun2pz0ttBU8CjMlEFdioX3pMGPRXu0McAzNBI/BUD35UA5Wg/Dn
	 Z11bppe+/nYCQ==
Date: Fri, 13 Sep 2024 09:20:45 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 1/2] usb: chipidea: udc: limit usb request length to max
 16KB
Message-ID: <20240913012045.GA320526@nchen-desktop>
References: <20240912045150.915573-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912045150.915573-1-xu.yang_2@nxp.com>

On 24-09-12 12:51:49, Xu Yang wrote:
> Currently, the deivice controller has below limitations:
> 1. can't generate short packet interrupt if IOC not set in dTD. So if one
>    request span more than one dTDs and only the last dTD set IOC, the usb
>    request will pending there if no more data comes.
> 2. the controller can't accurately deliver data to differtent usb requests
>    in some cases due to short packet. For example: one usb request span 3
>    dTDs, then if the controller received a short packet the next packet
>    will go to 2nd dTD of current request rather than the first dTD of next
>    request.
> 

Are there any IP errata for it?

> To let the device controller work properly, one usb request should only
> correspond to one dTD. Then every dTD will set IOC. In theory, each dTD
> support up to 20KB data transfer if the offset is 0. Due to we cannot
> predetermine the offset, this will limit the usb request length to max
> 16KB. This should be fine since most of the user transfer data based on
> this size policy.
> 
> Although these limitations found on OUT eps, we can put the request to IN
> eps too, this will benefit the following patches.

Since IN endpoints have not found the problem, please limit the changes
only for OUT endpoints.

> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/ci.h  | 1 +
>  drivers/usb/chipidea/udc.c | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index 2a38e1eb6546..f8deccfc8713 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -25,6 +25,7 @@
>  #define TD_PAGE_COUNT      5
>  #define CI_HDRC_PAGE_SIZE  4096ul /* page size for TD's */
>  #define ENDPT_MAX          32
> +#define CI_MAX_REQ_SIZE	(4 * CI_HDRC_PAGE_SIZE)
>  #define CI_MAX_BUF_SIZE	(TD_PAGE_COUNT * CI_HDRC_PAGE_SIZE)
>  
>  /******************************************************************************
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index b1a1be6439b6..5d9369d01065 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -969,6 +969,11 @@ static int _ep_queue(struct usb_ep *ep, struct usb_request *req,
>  		return -EMSGSIZE;
>  	}
>  
> +	if (hwreq->req.length > CI_MAX_REQ_SIZE) {
> +		dev_err(hwep->ci->dev, "request length too big (max 16KB)\n");
> +		return -EMSGSIZE;
> +	}
> +

Since this IP is used by many vendors, it may fix by others.
I prefer add flag like CI_HDRC_SHORT_PACKET_NOT_SUPPORT, 
and set in imx platform file.

Peter


