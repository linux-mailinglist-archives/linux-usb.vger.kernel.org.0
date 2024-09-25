Return-Path: <linux-usb+bounces-15439-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5098603F
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 16:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B4901F266E3
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 14:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F419A19DF85;
	Wed, 25 Sep 2024 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMEDrnbY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7939A19D89A;
	Wed, 25 Sep 2024 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268433; cv=none; b=EdN9h0tysT6HoBHtc0GPA/znneROs6DsU3EWm4cLAaCpPEdHiwAdsHo5yaqpdIACek22DWauO/QBojaH9BPeM0nFTdMv3bp67ofBjcPBAHz7cDHB4N7aLGT1FLckM4V0rDGc0WFhoZZsEdToTbfo/XtMnCQwoKj3fPP+x1//6dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268433; c=relaxed/simple;
	bh=SQKmlKEVeMIW0DNzMah6ZdkWwB+KPOT8RQV4GwZIwOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/fHrusS5J7FQNWxrCXuwDTH/yEJI7ywCd6gpTlf3xdQ64Y605a8c2a3Kt9oqdmX4Cn5wS2LnIb5I7bHGmRUZKwtIo2BYKt8rs1YoxMhqDwdCWp4DgSak/mhCBA96yv7M9QaRN8Wu/Kh07x7w52pY1a4h/NXbfQIfbgL90N7hUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMEDrnbY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07906C4CEC3;
	Wed, 25 Sep 2024 12:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727268433;
	bh=SQKmlKEVeMIW0DNzMah6ZdkWwB+KPOT8RQV4GwZIwOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMEDrnbY/gOQL9Mt78N2Z6K5amfL3b7uVFL16e4Yq6FB+z6PLRBnFw47PS9SSeOBC
	 6Rjbt1baopYM1H7x1h24i9P0iw5kCDuiUXP6bFG4MeriS8gca+KbZEoQ7jVEgmmb16
	 HWE7Z7BmEmpDvah9LJ2I0Xk1aU6PoQo42baoi8bwbVYPjMxWmPmRnAZAMasnchUJd4
	 jbpBziYRV2Dngtc+K9S/tgLl2gpbfGo7guqqg9pIkh1V42d/l6I5hc/bhc7n/ue9It
	 xAWmzd0SgpMMgN215ntZ3AHX/eWc3GsoPrGbnL6IdrzP42SKSqK/I+keYTdJYxtvTI
	 VNIZ9m6kMkMUA==
Date: Wed, 25 Sep 2024 20:47:06 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 2/3] usb: chipidea: udc: limit usb request length to
 max 16KB
Message-ID: <20240925124706.GE417263@nchen-desktop>
References: <20240923081203.2851768-1-xu.yang_2@nxp.com>
 <20240923081203.2851768-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923081203.2851768-2-xu.yang_2@nxp.com>

On 24-09-23 16:12:02, Xu Yang wrote:
> To let the device controller work properly on short packet limitations,
> one usb request should only correspond to one dTD. Then every dTD will
> set IOC. In theory, each dTD support up to 20KB data transfer if the
> offset is 0. Due to we cannot predetermine the offset, this will limit
> the usb request length to max 16KB. This should be fine since most of
> the user transfer data based on this size policy.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>
> 
> ---
> Changes in v2:
>  - limit request length only when ci->has_short_pkt_limit set
>  - modify commit message
> ---
>  drivers/usb/chipidea/ci.h  | 1 +
>  drivers/usb/chipidea/udc.c | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index e4b003d060c2..97437de52ef6 100644
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
> index 18c1882cf088..5badb39cb2bf 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -972,6 +972,12 @@ static int _ep_queue(struct usb_ep *ep, struct usb_request *req,
>  		return -EMSGSIZE;
>  	}
>  
> +	if (ci->has_short_pkt_limit &&
> +		hwreq->req.length > CI_MAX_REQ_SIZE) {
> +		dev_err(hwep->ci->dev, "request length too big (max 16KB)\n");
> +		return -EMSGSIZE;
> +	}
> +
>  	/* first nuke then test link, e.g. previous status has not sent */
>  	if (!list_empty(&hwreq->queue)) {
>  		dev_err(hwep->ci->dev, "request already in queue\n");
> -- 
> 2.34.1
> 

