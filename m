Return-Path: <linux-usb+bounces-3770-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC088065B2
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 04:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABEFEB203CF
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 03:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B4BD292;
	Wed,  6 Dec 2023 03:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YIQ0ECqQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58DFC8F5
	for <linux-usb@vger.kernel.org>; Wed,  6 Dec 2023 03:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24730C433C9;
	Wed,  6 Dec 2023 03:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701833942;
	bh=I58oH3gxaXTUpHLr44iFAtoJDHEru7JOv1e8S71m5zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YIQ0ECqQT8hbMvrqpOzxYPz7G9yKPp/RgU8FHNILKdDyJno0My3V3wxFoWrJWsGvo
	 Ix/RkIyAhokLtuxzUxKLGKVQ+f2lw9vDEvBkAQb15LnkgAppWu2CiMae6R2Tkxo7rP
	 j2RPl1DxZ+byeBOsS1CQGqNsac9fvtgMgD397Zb4=
Date: Wed, 6 Dec 2023 12:38:59 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Simon Holesch <simon@holesch.de>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usbip: Don't submit special requests twice
Message-ID: <2023120641-krypton-presume-a375@gregkh>
References: <20231130231650.22410-1-simon@holesch.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130231650.22410-1-simon@holesch.de>

On Fri, Dec 01, 2023 at 12:10:13AM +0100, Simon Holesch wrote:
> Skip submitting URBs, when identical requests were already sent in
> tweak_special_requests(). Instead call the completion handler directly
> to return the result of the URB.
> 
> Even though submitting those requests twice should be harmless, there
> are USB devices that react poorly to some duplicated requests.
> 
> One example is the ChipIdea controller implementation in U-Boot: The
> second SET_CONFIURATION request makes U-Boot disable and re-enable all
> endpoints. Re-enabling an endpoint in the ChipIdea controller, however,
> was broken until U-Boot commit b272c8792502 ("usb: ci: Fix gadget
> reinit").
> 
> Signed-off-by: Simon Holesch <simon@holesch.de>
> ---
> 
> Changes in v3:
> - handle errors in tweak_* routines: send URB if tweaking fails
> 
> Changes in v2:
> - explain change in commit message
> 
> Thanks again for the feedback!
> 
>  drivers/usb/usbip/stub_rx.c | 73 +++++++++++++++++++++++--------------
>  1 file changed, 46 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index fc01b31bbb87..76a6f46b8676 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -144,53 +144,62 @@ static int tweak_set_configuration_cmd(struct urb *urb)
>  	if (err && err != -ENODEV)
>  		dev_err(&sdev->udev->dev, "can't set config #%d, error %d\n",
>  			config, err);
> -	return 0;
> +	return err;
>  }
>  
>  static int tweak_reset_device_cmd(struct urb *urb)
>  {
>  	struct stub_priv *priv = (struct stub_priv *) urb->context;
>  	struct stub_device *sdev = priv->sdev;
> +	int err;
>  
>  	dev_info(&urb->dev->dev, "usb_queue_reset_device\n");
>  
> -	if (usb_lock_device_for_reset(sdev->udev, NULL) < 0) {
> +	err = usb_lock_device_for_reset(sdev->udev, NULL)

You didn't actually build this change, so how was it tested?

{sigh}

greg k-h

