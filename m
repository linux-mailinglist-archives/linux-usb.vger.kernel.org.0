Return-Path: <linux-usb+bounces-15066-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB5F977684
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 03:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B861C28257E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 01:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3598A4C96;
	Fri, 13 Sep 2024 01:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDdT9SaQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12458C11;
	Fri, 13 Sep 2024 01:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726192187; cv=none; b=QwLLwJbTCuxi0iVjN57mqiUZ9PJh1BIv5x3vE4paEYb7siP2lXTP2uE/2H+ZTMXmvdcU56Nu0Kq9wbUsJV+ykCL7pCupP6uHkJbdEOxQqGM5Ksqngon5ZRNJ4YlA1dmash9D3bE+2BtCM3vBmQVN+FT7fM+F4Sw1xLicVmVbDV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726192187; c=relaxed/simple;
	bh=icKMQGUd9Nu7Njse/3GzQK//MxaXijANUk4gtiw6BM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N45DdOScPrFCpsFdv8de1byNazj/4iJG51nAOtaPiC4MZNwbzg8L8NacOyD0tINy0sdR8MhPBMEH5pSpEjW4/UAZDROQ/S0Gx8yE4T8UWvxfk45GX/czZd9nXJ8nI1JQ0z2uGws0jLv5Vu6hEarh+4mpJa5Usj+aNXJeUmHOSIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDdT9SaQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB4BC4CEC3;
	Fri, 13 Sep 2024 01:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726192187;
	bh=icKMQGUd9Nu7Njse/3GzQK//MxaXijANUk4gtiw6BM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZDdT9SaQWCGmNvAyfqocIZl2Fq38PKDvv38SNYoSnimBRQmo8vrPxIm9sonZxucnl
	 kTkkQIHzpj/rl9N+A+/hkLnVitC+qc3/EqaD9TLZapl6ym9DFENEo65H2Q825XnSQC
	 GI6NpUZ74f3Jpf0ZtA/fQIR0ErpdbyGuqR6OTXD146yk4aeXSIY4f8jqwjARP1mwKC
	 0WFeEa23GFAfPnJ7aZTthwjzmlN/RXLkCXCT95dolbIxkrr1BQOYyxzjAiDO/XpxFJ
	 Kgp10xd5haCNpDTDtXPpElNkfBd4EyaXsaygQ7tc95BfMY9V2W+PALZ1Jhj+R6fGwt
	 NsjiyXGgZhi5Q==
Date: Fri, 13 Sep 2024 09:49:40 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 3/3] usb: chipidea: udc: make isoc endpoint a bit error
 tolerant
Message-ID: <20240913014940.GD320526@nchen-desktop>
References: <20240912033551.910337-1-xu.yang_2@nxp.com>
 <20240912033551.910337-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912033551.910337-3-xu.yang_2@nxp.com>

On 24-09-12 11:35:51, Xu Yang wrote:
> When a endpoint met errors, the usb controller will firstly assert
> related error bit in status filed of dTD, then ENDPTCOMPLETE will be
> asserted. Finally, USBSTS.UEI will be set.
> 
> Due to isoc transfers are error-tolerant transfers, we can make isoc
> endpoint a bit error tolerant on device mode too. In case of error,
> it's possilbe to resume the endpoint by reprime the corresponding
> endpoint.
> 
> When error occurs, this will allow error dTD be deleted from dQH and
> giveback request to user. Then, a reprime/prime operation is executed
> depends on whether dQH is empty or not. If dQH is not empty, reprime
> will be done during dequeue process. If dQH is empty, prime will be
> done when new dTD is linked. In this way, isoc transfer can be recovered
> from a small number of errors.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/udc.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 0ab57b87b07b..b1a1be6439b6 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -683,6 +683,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  	unsigned remaining_length;
>  	unsigned actual = hwreq->req.length;
>  	struct ci_hdrc *ci = hwep->ci;
> +	bool is_isoc = hwep->type == USB_ENDPOINT_XFER_ISOC;
>  
>  	if (hwreq->req.status != -EALREADY)
>  		return -EINVAL;
> @@ -696,7 +697,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  			int n = hw_ep_bit(hwep->num, hwep->dir);
>  
>  			if (ci->rev == CI_REVISION_24 ||
> -			    ci->rev == CI_REVISION_22)
> +			    ci->rev == CI_REVISION_22 || is_isoc)
>  				if (!hw_read(ci, OP_ENDPTSTAT, BIT(n)))
>  					reprime_dtd(ci, hwep, node);
>  			hwreq->req.status = -EALREADY;
> @@ -707,7 +708,6 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  		remaining_length >>= __ffs(TD_TOTAL_BYTES);
>  		actual -= remaining_length;
>  
> -		hwreq->req.status = tmptoken & TD_STATUS;

Non-ISO dTD may need error status? You may refine code by ISO and
non-ISOC.

Peter

>  		if ((TD_STATUS_HALTED & hwreq->req.status)) {
>  			hwreq->req.status = -EPIPE;
>  			break;
> @@ -715,11 +715,13 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  			hwreq->req.status = -EPROTO;
>  			break;
>  		} else if ((TD_STATUS_TR_ERR & hwreq->req.status)) {
> -			hwreq->req.status = -EILSEQ;
> -			break;
> +			if (!is_isoc) {
> +				hwreq->req.status = -EILSEQ;
> +				break;
> +			}
>  		}
>  
> -		if (remaining_length) {
> +		if (remaining_length && !is_isoc) {
>  			if (hwep->dir == TX) {
>  				hwreq->req.status = -EPROTO;
>  				break;
> -- 
> 2.34.1
> 

