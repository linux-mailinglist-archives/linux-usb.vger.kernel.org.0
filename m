Return-Path: <linux-usb+bounces-15529-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF308987C56
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2024 03:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46CD7B21F7D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2024 01:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D06210EC;
	Fri, 27 Sep 2024 01:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYIlcArb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22B18E2A;
	Fri, 27 Sep 2024 01:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727398922; cv=none; b=GNMJxI7Srzm4IbSae08vP093IbfftpGWb0i3D+VlCzWxgQdZ/nmISCcnV1Nlay+CFtQfGBFUqEgQI7ryzfEA6ol34MeBNyfV/wxnaT9LCHA7LC1d7U1Y8vWjbmSTU/cMZOIAM7ClkjtneaDs2U0dJhyCMTdNGwABeQ4lxMxWVuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727398922; c=relaxed/simple;
	bh=QwFqsHNlpuuvWKjYk0EGwhOqVlEYCspxRg9api5E/vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSzZvagG6KXOybN4rc+X3ZaSXZ31tqKoUWCL8tAPtHPmFpRDridgMyOTYb2L6gLSsNYYZ52FjxgQZjvyEYZf6VDFBu2zRvwJ1pKr/NNrSjpcXYr62e/8shpcJ68kf5CV2xUE7dY1Q+33/Bxhke1UEjl5Wj7pXi3vlklpCFcTqZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYIlcArb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19F6C4CEC5;
	Fri, 27 Sep 2024 01:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727398922;
	bh=QwFqsHNlpuuvWKjYk0EGwhOqVlEYCspxRg9api5E/vE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tYIlcArbKedHSz8YULbnzx9fiF/+y1D8KW8Sr4L/tn+xJBVd+Yw+2TFNQN7BYG+lv
	 2mLEkX7URktppKUeQZj91I5gpHiQyzZ5jIv2/7y4Sh4jNGu1aMJGeMWm1wXY2ch7oY
	 /cq0gIY+vou5pJBMgPFs/k5T8R0u202jSMyVdf4+/48s/XEwGVhQlj753h7BJ3Qt1T
	 wwZqobY066taEEdQ5yHePn2kX9kyLzB/Xvq7wHIw08C1HI8oMh3n+hEyeJ36ROsC/L
	 FASOeMG/6A/FV3AQjExf9IK7jxrSMk+ryP3C0dgT9IVrO5APCo6W1r7NuM4prXoZ6G
	 WS/aBXS34f8aw==
Date: Fri, 27 Sep 2024 09:01:53 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 2/3] usb: chipidea: udc: improve dTD link logic
Message-ID: <20240927010153.GA438662@nchen-desktop>
References: <20240926022906.473319-1-xu.yang_2@nxp.com>
 <20240926022906.473319-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926022906.473319-2-xu.yang_2@nxp.com>

On 24-09-26 10:29:05, Xu Yang wrote:
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
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>
> 
> ---
> Changes in v2:
>  - modify comments
>  - fix kernel test robot build warning by using cpu_to_le32
>  - add fix tag and cc stable
> Changes in v3:
>  - remove fixes tag and stable maillist
> ---
>  drivers/usb/chipidea/udc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index b9ccf62e0a50..0132bb25c9b5 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -612,10 +612,17 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
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

