Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9FC22D697
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 12:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgGYKMh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 06:12:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:49734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726572AbgGYKMh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 25 Jul 2020 06:12:37 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FD78206D7;
        Sat, 25 Jul 2020 10:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595671955;
        bh=zV9TTaB7RVFcpd6P8B0dWyD9xT4cj7S77iuef3Vqzyw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TIUmk2KDTbc5E80Sm8E57stlG3k3OYM+Zfz3n2tXHhJy/+JzHwZ8SYFUcVAx6kR/+
         M9I9Q0VxAaYr87H0gg2QpWnST8nkFho/eb5wfONeU+oOSFOa0MTqugc5biKkjXUJ6H
         ycdx+XuP2tH22iNAMIdEeNOZCQpz1dwEqQwwAISg=
Date:   Sat, 25 Jul 2020 12:12:35 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 07/12] usb: common: Add function to get num_lanes and
 transfer rate
Message-ID: <20200725101235.GA1093846@kroah.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
 <d86ccd4f97469cfe67cbce549b37d4df7cd8cb27.1595631457.git.thinhn@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d86ccd4f97469cfe67cbce549b37d4df7cd8cb27.1595631457.git.thinhn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 24, 2020 at 04:39:11PM -0700, Thinh Nguyen wrote:
> Add a new common function to parse maximum_speed property string for
> the specified number of lanes and transfer rate.
> 
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
> Changes in v3:
> - Add new function to parse "maximum-speed" for lanes and transfer rate
> - Remove separate functions getting num_lanes and transfer rate properties

No, why have you split this into a single function that for some reason
"can not fail"?

> Changes in v2:
> - New commit
> 
>  drivers/usb/common/common.c | 47 ++++++++++++++++++++++++++++++++++++++++++---
>  include/linux/usb/ch9.h     | 25 ++++++++++++++++++++++++
>  2 files changed, 69 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> index 1433260d99b4..53b4950c49e4 100644
> --- a/drivers/usb/common/common.c
> +++ b/drivers/usb/common/common.c
> @@ -77,18 +77,59 @@ const char *usb_speed_string(enum usb_device_speed speed)
>  }
>  EXPORT_SYMBOL_GPL(usb_speed_string);
>  
> -enum usb_device_speed usb_get_maximum_speed(struct device *dev)
> +void usb_get_maximum_speed_and_num_lanes(struct device *dev,
> +					 enum usb_device_speed *speed,
> +					 enum usb_phy_gen *gen,
> +					 u8 *num_lanes)

What is wrong with just having multiple different functions instead?

>  {
>  	const char *maximum_speed;
> +	enum usb_device_speed matched_speed = USB_SPEED_UNKNOWN;
> +	enum usb_phy_gen matched_gen = USB_PHY_GEN_UNKNOWN;
> +	u8 matched_num_lanes = 0;
>  	int ret;
>  
>  	ret = device_property_read_string(dev, "maximum-speed", &maximum_speed);
>  	if (ret < 0)
> -		return USB_SPEED_UNKNOWN;
> +		goto done;
>  
>  	ret = match_string(speed_names, ARRAY_SIZE(speed_names), maximum_speed);
> +	if (ret >= 0) {
> +		matched_speed = ret;
> +		goto done;
> +	}
> +
> +	if (strncmp("super-speed-plus-gen2x2", maximum_speed, 23) == 0) {
> +		matched_speed = USB_SPEED_SUPER_PLUS;
> +		matched_gen = USB_PHY_GEN_2;
> +		matched_num_lanes = 2;
> +	} else if (strncmp("super-speed-plus-gen2x1", maximum_speed, 23) == 0) {
> +		matched_speed = USB_SPEED_SUPER_PLUS;
> +		matched_gen = USB_PHY_GEN_2;
> +		matched_num_lanes = 1;
> +	} else if (strncmp("super-speed-plus-gen1x2", maximum_speed, 23) == 0) {

Where are all of these device properties documented?



> +		matched_speed = USB_SPEED_SUPER_PLUS;
> +		matched_gen = USB_PHY_GEN_1;
> +		matched_num_lanes = 2;
> +	}
> +
> +done:
> +	if (speed)
> +		*speed = matched_speed;
> +
> +	if (num_lanes)
> +		*num_lanes = matched_num_lanes;
> +
> +	if (gen)
> +		*gen = matched_gen;



> +}
> +EXPORT_SYMBOL_GPL(usb_get_maximum_speed_and_num_lanes);
> +
> +enum usb_device_speed usb_get_maximum_speed(struct device *dev)
> +{
> +	enum usb_device_speed speed;
>  
> -	return (ret < 0) ? USB_SPEED_UNKNOWN : ret;
> +	usb_get_maximum_speed_and_num_lanes(dev, &speed, NULL, NULL);

Here's an example of why this isn't a good function.

It isn't self-describing.  Why do you pass in 3 pointers yet the name
only contains 2 things?

usb_get_maximum_speed_and_num_lanes_and_generation() shows that this is
not a good thing, right?

Again, 3 different functions please.

> +	return speed;
>  }
>  EXPORT_SYMBOL_GPL(usb_get_maximum_speed);
>  
> diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
> index 01191649a0ad..46cfd72e7082 100644
> --- a/include/linux/usb/ch9.h
> +++ b/include/linux/usb/ch9.h
> @@ -57,6 +57,13 @@ enum usb_link_protocol {
>  	USB_LP_SSP = 1,
>  };
>  
> +/* USB phy signaling rate gen */
> +enum usb_phy_gen {
> +	USB_PHY_GEN_UNKNOWN,
> +	USB_PHY_GEN_1,
> +	USB_PHY_GEN_2,
> +};
> +
>  /**
>   * struct usb_sublink_speed - sublink speed attribute
>   * @id: sublink speed attribute ID (SSID)
> @@ -95,6 +102,24 @@ extern const char *usb_ep_type_string(int ep_type);
>   */
>  extern const char *usb_speed_string(enum usb_device_speed speed);
>  
> +/**
> + * usb_get_maximum_speed_and_num_lanes - Get maximum requested speed and number
> + * of lanes for a given USB controller.

You forgot that it also determines the "gen".

thanks,

greg k-h
