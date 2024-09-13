Return-Path: <linux-usb+bounces-15065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 590F1977671
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 03:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04EA61F24A56
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 01:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712514A21;
	Fri, 13 Sep 2024 01:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oa1tvMMW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA63F443D;
	Fri, 13 Sep 2024 01:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726191443; cv=none; b=RL9p01NuhpKmV5Z7jcaTfHfEm9TDFTCc0ru00a2ghsBVf3Ibm2zdMVnn9vlAXhOTJEO61U07yQcDxJFt4O4JtzwA2EYr/SZgV9zuzQg+GtECu14tB/2Us3cw8YSDwo+8Y5KaYdkkLZk2vH3SBw2w77784VBxSow3kbPA9J1uIuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726191443; c=relaxed/simple;
	bh=jz5MU2fEBqlytD2yEL+1mY05RDv/+DG0NXzAQquujUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1KsrzSFWJGwBd/56XqA6ywnLJuQJ1t4zhqcWOF751xkD1VNqHVL0QhuYonhE+njxktfJzR4XBT/Pnu+MjVftiz/QB+Jfbe2gP4UVpY6VJwefxAzuL+E0dwKH/iYYKchqhLl6Kp8e5ItCkOWDHgvN5OHCdVDIsiYZgJKq7dwp98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oa1tvMMW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FD2C4CEC3;
	Fri, 13 Sep 2024 01:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726191442;
	bh=jz5MU2fEBqlytD2yEL+1mY05RDv/+DG0NXzAQquujUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oa1tvMMWHiRISujZNOIN3QYA9rW7MS9BKoGRkUlAtbtO0GbGQLU16dEv0o+6lqayw
	 Yp+Ir+IQsw4ElLczSv2CXrQc+6oN0XAptdXLYnDTDhZCNIHe+OzOYa0uoAMygkZo1S
	 sNNpZ7DBGCMO2lPd7DMFlkkqdn+jOihDsbQpXEPTuUzelE0UsXo8pmtJ/OFu9+4XZd
	 iXhSniDB5WedvKvcA0Bxt2vr3caGDkyXfpGk/dDcmTqHGNjlv25wZkYICZ+idnHswC
	 IjEfk/HoZv9Xwl7W7KRzhMt+fdvETEC3kl7SoCWApgVc3KjDWNvoxU9Fk/6AhPFNYF
	 fNKNKLAfVp1Ag==
Date: Fri, 13 Sep 2024 09:37:16 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 1/3] usb: chipidea: udc: handle USB Error Interrupt if
 IOC not set
Message-ID: <20240913013716.GC320526@nchen-desktop>
References: <20240912033551.910337-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912033551.910337-1-xu.yang_2@nxp.com>

On 24-09-12 11:35:49, Xu Yang wrote:
> As per USBSTS register description about UEI:
> 
>   When completion of a USB transaction results in an error condition, this
>   bit is set by the Host/Device Controller. This bit is set along with the
>   USBINT bit, if the TD on which the error interrupt occurred also had its
>   interrupt on complete (IOC) bit set.
> 
> Currently, device controller will do nothing when endpoints met transfer
> error if IOC didn't set on that error dTD since UI didn't assert too. This
> will also handle UEI event as same as USBSTS.UI for such cases.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.com>

> ---
>  drivers/usb/chipidea/udc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 69ef3cd8d4f8..b9ccf62e0a50 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -2063,7 +2063,7 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
>  			}
>  		}
>  
> -		if (USBi_UI  & intr)
> +		if ((USBi_UI | USBi_UEI) & intr)
>  			isr_tr_complete_handler(ci);
>  
>  		if ((USBi_SLI & intr) && !(ci->suspended)) {
> -- 
> 2.34.1
> 

