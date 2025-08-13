Return-Path: <linux-usb+bounces-26782-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2E6B240D6
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 08:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 048932A2599
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 05:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C112BF016;
	Wed, 13 Aug 2025 05:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBj06Sxt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ECC223DF5;
	Wed, 13 Aug 2025 05:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755064685; cv=none; b=UqcQ9JgTY1+v9I8UnMTz8NOZj8sQOMCJN4io61euoU2n4vgtp7LntnrIePFERV5/HG9s0m2Ra7hAdZ83oiuF7nMj+oz046agJfE34vpuNwtGrQSwwS2OU4aKfvJjRGWA4sboU1YSGaxJFucANW+q9hBoxC75Ow8r4McuEOPFNqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755064685; c=relaxed/simple;
	bh=DNJSU8lMsOO0RxeTjd8HYxrCW47ClBVgu5D1ztShDig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLTKFgFcw2k2q9I1Sc6KWLOvHdGkUvJcEuEWfYB6BQNjCxCeoRPGaaTmSl/+CO+zioakFXoxU7bUc+RgTGpGg+B0nVo4qOnC9fINiIJz7ZpWt0bkxtoeFOwi+1+4DsmifWdMjC5cyenPiNtkHeYqHm1K4+rUy4XZAQIVwI+tZFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBj06Sxt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5089EC4CEEB;
	Wed, 13 Aug 2025 05:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755064684;
	bh=DNJSU8lMsOO0RxeTjd8HYxrCW47ClBVgu5D1ztShDig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CBj06SxtTAvh+0DcxIjwg/9eCaSZH2bCVlRikhngWzr616sAIwOXVaOXj6PfCsK71
	 uE/NMiYxLerxHOASfISZwNX2FlJXtjk1he8AoGo2kRTfVLKKP8cr6Zlx5eM52OnpId
	 r6Ol13ylI1m/r5Gsp8w61Z2/pdIGOxtWqedCPtZ0BUFwF2rRBd/f4OdGBdAC54/fgO
	 kB1KfJCB9OfRVjHWRa8IJLFmiTqV1H7/1tExp5Duk/trYriDZMcc/AGKWz0jdYUq+F
	 0PSKqYghWj+1jUuoVS1prpLLnszyKOa7vpp/Gpsw3gHmcR684Vo3TllAJo/zZmrbzh
	 JmRxLqTlqQeGQ==
Date: Wed, 13 Aug 2025 13:58:00 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: imx: improve usbmisc_imx7d_pullup()
Message-ID: <20250813055800.GA1143162@nchen-desktop>
References: <20250811100833.862876-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811100833.862876-1-xu.yang_2@nxp.com>

On 25-08-11 18:08:33, Xu Yang wrote:
> When add workaround for ERR051725, the usbmisc will put PHY to
> Non-driving mode (OPMODE = 01) after stopping the device controller
> and put PHY back to Normal mode (OPMODE = 00) after starting the device
> controller.
> 
> However, this will bring issue for host controller. Because the PHY may
> stay in Non-driving mode after switching the role from device to host.
> Then the port will not work if USB device is attached. To fix this issue,
> improving the workaround by putting PHY to Non-driving mode for a certain
> period and back to Normal mode finally. To make host detect a disconnect
> signal, the period should be at least 125us (a micro-frame time) for
> high-speed link.
> 
> And only working as high-speed mode will need workaround for ERR051725.
> So this will also filter the pullup event for high-speed.
> 
> Fixes: 11992b410083 ("usb: chipidea: imx: implement workaround for ERR051725")
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c |  3 ++-
>  drivers/usb/chipidea/usbmisc_imx.c | 23 ++++++++++++++++-------
>  2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index e1ec9b38f5b9..d7c2a1a3c271 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -338,7 +338,8 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
>  			schedule_work(&ci->usb_phy->chg_work);
>  		break;
>  	case CI_HDRC_CONTROLLER_PULLUP_EVENT:
> -		if (ci->role == CI_ROLE_GADGET)
> +		if (ci->role == CI_ROLE_GADGET &&
> +		    ci->gadget.speed == USB_SPEED_HIGH)
>  			imx_usbmisc_pullup(data->usbmisc_data,
>  					   ci->gadget.connected);
>  		break;
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 3d20c5e76c6a..b1418885707c 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -1068,15 +1068,24 @@ static void usbmisc_imx7d_pullup(struct imx_usbmisc_data *data, bool on)
>  	unsigned long flags;
>  	u32 val;
>  
> +	if (on)
> +		return;
> +
>  	spin_lock_irqsave(&usbmisc->lock, flags);
>  	val = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
> -	if (!on) {
> -		val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK;
> -		val |= MX7D_USBNC_USB_CTRL2_OPMODE(1);
> -		val |= MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
> -	} else {
> -		val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
> -	}
> +	val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK;
> +	val |= MX7D_USBNC_USB_CTRL2_OPMODE(1);
> +	val |= MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
> +	writel(val, usbmisc->base + MX7D_USBNC_USB_CTRL2);
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> +
> +	/* Last for at least 1 micro-frame to let host see disconnect signal */
> +	usleep_range(125, 150);
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +	val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK;
> +	val |= MX7D_USBNC_USB_CTRL2_OPMODE(0);
> +	val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
>  	writel(val, usbmisc->base + MX7D_USBNC_USB_CTRL2);
>  	spin_unlock_irqrestore(&usbmisc->lock, flags);
>  }
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

