Return-Path: <linux-usb+bounces-15436-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93917986031
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 16:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5573B28B7D6
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 14:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD5B172798;
	Wed, 25 Sep 2024 12:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlfGlTkM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27A2189BA5;
	Wed, 25 Sep 2024 12:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268199; cv=none; b=ngGKQobeS/pOl9kONVdps6rZDDVfTHTSqXh4NAmL9zY7AUidDgiie73BmyF4zZK4liL4rTKURWibx+wtyhwXBiLsIFmdH9Q6tmRm2DH5fnJG+dw12hxD+UXX0Uz5RNukWrBnnSy5tcDaG/wWSfYIDINXSQDc+/PH4g99FBUvvro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268199; c=relaxed/simple;
	bh=55DEg7P/EG6eoblczRYM9wqjNyVJh5awwba1Zdov68c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pd1Xb1f/FzexrPIR+vgC/KYu4jxy4UZ31SNMOgIUH6q/YXMfTolMqznS3HoVgizDGIza5xxxaR6O0mo0ezfk2iEa87Qmq3EllR2DX3whbFpxHlxKhZw+4HBgIpNCLpuNVWCA6xPk8rN+tJopxeTUvofDuDpzNSN8F9OEJONNjr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlfGlTkM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CC0C4CEC3;
	Wed, 25 Sep 2024 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727268198;
	bh=55DEg7P/EG6eoblczRYM9wqjNyVJh5awwba1Zdov68c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlfGlTkMqanK0tCToFOxBbWlKErG/Lr1iUgou17ij9FKgnUlMIpyBkMkcRZ0gFARu
	 4sCBqXLddMEyLmij0JS7fMrh9MP5YM/zPfzX4vQbKmLcr+QF3Mu7I+Kso1DLP2KQFq
	 rHGw6ViiKqpqN0QxELepFG4YfVhfOKkmXCOTM1/i6W8xyCYMkY2E0/x8XyHDpGEALz
	 3V1JVOWZODosDnMu76b7sud3yDnQ3t/hTs020j3mwjmlyUUGGrrtCSKdh2Kr5YGQuy
	 6drE0vy/DzpCtdnhzfsjCHlsjXuXTMG4vUm0kjbU3QGddaOEIE/yX1rab3D/ZGmFgU
	 Jm9iWJRN/201Q==
Date: Wed, 25 Sep 2024 20:43:10 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 2/3] usb: chipidea: udc: improve dTD link logic
Message-ID: <20240925124310.GB417263@nchen-desktop>
References: <20240920094056.2680590-1-xu.yang_2@nxp.com>
 <20240920094056.2680590-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920094056.2680590-2-xu.yang_2@nxp.com>

On 24-09-20 17:40:55, Xu Yang wrote:
> Currently, ATDTW semaphore is used to safety link new dTD to dQH. But this
> code has a bug when the endpoint is already in error before polling ATDTW
> or just met error during polling ATDTW. In that cases, ATDTW will never
> turn to 1 and the cpu will busy loop there.
> 
> When the endpoint met error, ENDPTSTAT will be cleared by HW. Therefore,
> ENDPTSTAT should also be considered during this process. In case of
> endpoint error, the current dTD should not be pushed to the head of dQH
> since some dTDs may be still not executed. Therefore, the link logic is
> also improved accordingly.
> 
> Fixes: 26c696c678c4 ("USB: Chipidea: rename struct ci13xxx variables from udc to ci")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

The same comment, do not cc stable tree, not sure if it will affect
others.

Peter
> 
> ---
> Changes in v2:
>  - modify comments
>  - fix kernel test robot build warning by using cpu_to_le32
>  - add fix tag and cc stable
> ---
>  drivers/usb/chipidea/udc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index e0092c735a75..c0b8745234c6 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -752,10 +752,17 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  		do {
>  			hw_write(ci, OP_USBCMD, USBCMD_ATDTW, USBCMD_ATDTW);
>  			tmp_stat = hw_read(ci, OP_ENDPTSTAT, BIT(n));
> -		} while (!hw_read(ci, OP_USBCMD, USBCMD_ATDTW));
> +		} while (!hw_read(ci, OP_USBCMD, USBCMD_ATDTW) && tmp_stat);
>  		hw_write(ci, OP_USBCMD, USBCMD_ATDTW, 0);
>  		if (tmp_stat)
>  			goto done;
> +
> +		/* OP_ENDPTSTAT will be clear by HW when the endpoint met
> +		 * err. This dTD don't push to dQH if current dTD point is
> +		 * not the last one in previous request.
> +		 */
> +		if (hwep->qh.ptr->curr != cpu_to_le32(prevlastnode->dma))
> +			goto done;
>  	}
>  
>  	/*  QH configuration */
> -- 
> 2.34.1
> 

