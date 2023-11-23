Return-Path: <linux-usb+bounces-3262-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1427F6541
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 18:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D21A1C21050
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 17:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B3D405D4;
	Thu, 23 Nov 2023 17:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XEnd+Al+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D1F3FE59
	for <linux-usb@vger.kernel.org>; Thu, 23 Nov 2023 17:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C0EC433D9;
	Thu, 23 Nov 2023 17:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700760159;
	bh=2D3aUhEExlMCoGyBeeeacQjJUG+XraZinasPd6JBJW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XEnd+Al+R2lAela/niSU367F4vosKZr3w25UtMD2C+vBQ7mtTDqd6shdG3Th7MK1w
	 sEV0HrmSPBJkl17Gsn1VN95x1gItdZsCpWWxFTF5KUTYtDZfENPNPemsasuvv+Wi9R
	 6sV80XlhTRfQajBK+lGsKWT3F2ieHOEIOO76zu5Q=
Date: Thu, 23 Nov 2023 13:55:57 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Anand Moon <linux.amoon@gmail.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] usb: misc: onboard_usb_hub: Add support for clock
 input
Message-ID: <2023112329-augmented-ecology-0753@gregkh>
References: <20231123134728.709533-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123134728.709533-1-frieder@fris.de>

On Thu, Nov 23, 2023 at 02:47:20PM +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Most onboard USB hubs have a dedicated crystal oscillator but on some
> boards the clock signal for the hub is provided by the SoC.
> 
> In order to support this, we add the possibility of specifying a
> clock in the devicetree that gets enabled/disabled when the hub
> is powered up/down.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/usb/misc/onboard_usb_hub.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index a341b2fbb7b44..e710e3c82ba9b 100644
> --- a/drivers/usb/misc/onboard_usb_hub.c
> +++ b/drivers/usb/misc/onboard_usb_hub.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2022, Google LLC
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/export.h>
>  #include <linux/gpio/consumer.h>
> @@ -60,12 +61,19 @@ struct onboard_hub {
>  	bool going_away;
>  	struct list_head udev_list;
>  	struct mutex lock;
> +	struct clk *clk;
>  };
>  
>  static int onboard_hub_power_on(struct onboard_hub *hub)
>  {
>  	int err;
>  
> +	err = clk_prepare_enable(hub->clk);
> +	if (err) {
> +		dev_err(hub->dev, "failed to enable clock: %d\n", err);
> +		return err;
> +	}

But what happens if clk is not set here?

And doesn't clk_prepare_enable() print out a message if it fails?

thanks,

greg k-h

