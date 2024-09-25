Return-Path: <linux-usb+bounces-15437-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D00986033
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 16:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 516BD1C23FE4
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 14:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6D019AA73;
	Wed, 25 Sep 2024 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mM6D8Iy1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A14217557E;
	Wed, 25 Sep 2024 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268247; cv=none; b=A3G4U9pSeqdyD2ZWphIwRZN40r2/a8u+J6RcN5WExsQvg6oWttDNB4f1qe4RBY1qtma/mdIMQMECzUv8hPregUtw46Tc5VotQcMuQGZYsLwR5aLP9m46rRzWM5I93WLjq6UbNs2WVgNoozZUh2qlUghnYU9yR2B8MWqGI/N6NCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268247; c=relaxed/simple;
	bh=Ao//b69wJj1YwLpO1XoDHrOzk/AHOqJ/Jtcmh0Jshfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3W7RhSqU2BxqP4aY/dAtJIvKKq67lHIEMJUOq3MLFn2tFXonxggFlMClaelaK0RDH/HNc0ymPrMo/tQqiTQvui8ARA4MbyVN6HqvRRO4h8gcuAJS6yKLYiGNWkVnHBBqV3rGPWqaioGq18DlrIp0OuW51GjPSChb2uPRcLGNQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mM6D8Iy1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3BEC4CEC3;
	Wed, 25 Sep 2024 12:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727268247;
	bh=Ao//b69wJj1YwLpO1XoDHrOzk/AHOqJ/Jtcmh0Jshfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mM6D8Iy1HQsiUL/lSfUKfZEl2EDrbUTHEDaPzG96ocHnLYnGKIanarV6ntkIQoIea
	 Es5XJnQykOMHXPCbUZAo45FDEyUyEtFcp1ZBphGL6hMvDwLqkxHPnECEIXeerwm3lm
	 kRblekB8C8OUf3gjnG2atksVTx72Izja0jSYhxnNx2rJfdnsuUUsQ8IXFiMHKDbvtM
	 Zl4VvnNrG28LL1f9CHSMbJ7gxH4Xc88uG7NQCoyQE2z+aWy7R/IE/L0Xw2/fz4yeeP
	 NWuYUnE5ZxaP6ovr3rRhOM8AAXzQQ4rBWK+AUXcYFHeIxipwuJT/w3HrIVuG8Q7V33
	 ckyWrzC0WKvbA==
Date: Wed, 25 Sep 2024 20:44:00 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 3/3] usb: chipidea: udc: improve error recovery for
 ISO transfer
Message-ID: <20240925124400.GC417263@nchen-desktop>
References: <20240920094056.2680590-1-xu.yang_2@nxp.com>
 <20240920094056.2680590-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920094056.2680590-3-xu.yang_2@nxp.com>

On 24-09-20 17:40:56, Xu Yang wrote:
> Impove device mode ISO transfer error tolerant by reprime the corresponding
> endpoint.
> 
> The recovery steps when error occurs:
> - Delete the error dTD from dQH and giveback request to user.
> - Do reprime if dQH is not empty.
> - Do prime when new dTD is queued if dQH is empty
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>


> 
> ---
> Changes in v2:
>  - modify commit message
>  - keep "hwreq->req.status = tmptoken & TD_STATUS"
>  - giveback status 0 to user for isoc error case
> ---
>  drivers/usb/chipidea/udc.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index c0b8745234c6..e1121db0aea0 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -823,6 +823,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  	unsigned remaining_length;
>  	unsigned actual = hwreq->req.length;
>  	struct ci_hdrc *ci = hwep->ci;
> +	bool is_isoc = hwep->type == USB_ENDPOINT_XFER_ISOC;
>  
>  	if (hwreq->req.status != -EALREADY)
>  		return -EINVAL;
> @@ -836,7 +837,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  			int n = hw_ep_bit(hwep->num, hwep->dir);
>  
>  			if (ci->rev == CI_REVISION_24 ||
> -			    ci->rev == CI_REVISION_22)
> +			    ci->rev == CI_REVISION_22 || is_isoc)
>  				if (!hw_read(ci, OP_ENDPTSTAT, BIT(n)))
>  					reprime_dtd(ci, hwep, node);
>  			hwreq->req.status = -EALREADY;
> @@ -855,11 +856,15 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  			hwreq->req.status = -EPROTO;
>  			break;
>  		} else if ((TD_STATUS_TR_ERR & hwreq->req.status)) {
> -			hwreq->req.status = -EILSEQ;
> -			break;
> +			if (is_isoc) {
> +				hwreq->req.status = 0;
> +			} else {
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

