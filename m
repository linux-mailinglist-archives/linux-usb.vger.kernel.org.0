Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6962524C03
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 13:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353414AbiELLsH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 May 2022 07:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353419AbiELLsF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 May 2022 07:48:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7714E3B1
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 04:47:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DB0C7B8277A
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 11:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC24C385B8;
        Thu, 12 May 2022 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652356075;
        bh=f+jAOc5W6UXjbdVSg2I2HhIr65i2cdsfYAL8oO+UdO8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CnLHDitya4yPg2Tv3jcp+zK3HKGfel32sXId3sG3Oq7Be5xh4StRccAQIMR7KWMgE
         iJnzAUaA2IiEie+O23+TT+7iNakk7lJ7YKS1IZCNOVKNO1mBU2h40RKXUr7QOtJgMq
         38RpbQjjflAeE21kEcFb6uZdbd1dWFdLljhwNw7E=
Date:   Thu, 12 May 2022 13:47:52 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        marcel@holtmann.org
Subject: Re: [PATCH v5] USB: core: skip unconfiguration if device doesn't
 support it
Message-ID: <Ynzz6Jh5OeEikvfh@kroah.com>
References: <20220504151647.471885-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504151647.471885-1-jtornosm@redhat.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 04, 2022 at 05:16:47PM +0200, Jose Ignacio Tornos Martinez wrote:
> Some devices like Bluetooth Dongles with CSR chip (i.e. USB
> Bluetooth V4.0 Dongle by Trust) hang when they are unbound from
> 'unbind' sysfs entry and can not be bound again.
> 
> For these devices, CSR chip hangs when usb configuration command
> with index 0 (used to unconfigure) is sent during disconnection.
> 
> To avoid this unwanted result, it is necessary not to send this
> command, so a new quirk has been created. By default, quirk is
> not applied for any device and needs to be enabled by user.
> 
> For these devices, athough device is not unconfigured, it is
> better to avoid device hanging to be able to operate. Even
> bluetooth can be previously turned off.
> On the other hand, this is not important if usb device is going to
> be bound again (normal behavior), i.e. with usbip.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
> V4 -> V5:
> - By default, quirk is not applied for any device and needs to be enabled
> by user if necessary.
> V3 -> V4:
> - Reorder quirk entries to be in numerical order according to the vendor
> ID and product ID.
> - Add patch version information.
> V2 -> V3:
> - Change subject (Bluetooth: btusb: CSR chip hangs when unbound ->
> USB: core: skip unconfiguration if device doesn't support it).
> - Improve quirk checking.
> - Allow to test quirk interactively.
> V1 -> V2:
> - Use quirk feature for the exception.
> 
>  Documentation/admin-guide/kernel-parameters.txt |  2 ++
>  drivers/usb/core/message.c                      | 12 +++++++++---
>  drivers/usb/core/quirks.c                       |  3 +++
>  include/linux/usb/quirks.h                      |  3 +++
>  4 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 3f1cc5e317ed..71651b888d14 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6183,6 +6183,8 @@
>  					pause after every control message);
>  				o = USB_QUIRK_HUB_SLOW_RESET (Hub needs extra
>  					delay after resetting its port);
> +				p = USB_QUIRK_SKIP_UNCONFIGURE (device doesn't
> +					support unconfigure);
>  			Example: quirks=0781:5580:bk,0a5c:5834:gij
>  
>  	usbhid.mousepoll=
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 4d59d927ae3e..9c6cd0c75f4f 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -2108,9 +2108,15 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>  	}
>  	kfree(new_interfaces);
>  
> -	ret = usb_control_msg_send(dev, 0, USB_REQ_SET_CONFIGURATION, 0,
> -				   configuration, 0, NULL, 0,
> -				   USB_CTRL_SET_TIMEOUT, GFP_NOIO);
> +	if (configuration == 0 && !cp
> +			&& (dev->quirks & USB_QUIRK_SKIP_UNCONFIGURE)) {
> +		dev_warn(&dev->dev, "device is not unconfigured!\n");
> +		ret = 0;
> +	} else
> +		ret = usb_control_msg_send(dev, 0, USB_REQ_SET_CONFIGURATION, 0,
> +					   configuration, 0, NULL, 0,
> +					   USB_CTRL_SET_TIMEOUT, GFP_NOIO);
> +
>  	if (ret && cp) {
>  		/*
>  		 * All the old state is gone, so what else can we do?
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index d3c14b5ed4a1..f4cdf85a9eb6 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -138,6 +138,9 @@ static int quirks_param_set(const char *value, const struct kernel_param *kp)
>  			case 'o':
>  				flags |= USB_QUIRK_HUB_SLOW_RESET;
>  				break;
> +			case 'p':
> +				flags |= USB_QUIRK_SKIP_UNCONFIGURE;
> +				break;
>  			/* Ignore unrecognized flag characters */
>  			}
>  		}
> diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
> index eeb7c2157c72..79cb0616f394 100644
> --- a/include/linux/usb/quirks.h
> +++ b/include/linux/usb/quirks.h
> @@ -72,4 +72,7 @@
>  /* device has endpoints that should be ignored */
>  #define USB_QUIRK_ENDPOINT_IGNORE		BIT(15)
>  
> +/* device doesn't support unconfigure. */
> +#define USB_QUIRK_SKIP_UNCONFIGURE		BIT(16)
> +
>  #endif /* __LINUX_USB_QUIRKS_H */
> -- 
> 2.35.1
> 

I'll drop this for now as there are no in-kernel users for this quirk
yet.  When there is a need for one, please resubmit it.

thanks,

greg k-h
