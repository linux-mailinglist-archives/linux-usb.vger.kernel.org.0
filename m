Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 980FF518A1C
	for <lists+linux-usb@lfdr.de>; Tue,  3 May 2022 18:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239529AbiECQkd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 May 2022 12:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235042AbiECQkc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 May 2022 12:40:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CC327B14
        for <linux-usb@vger.kernel.org>; Tue,  3 May 2022 09:36:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3A786B81D8D
        for <linux-usb@vger.kernel.org>; Tue,  3 May 2022 16:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B28C385A9;
        Tue,  3 May 2022 16:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1651595817;
        bh=XCYKGr2mIwCdwE8ed8ZjXKTAPzlD4UXmKofp7F2HegI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KQtCylA2f4f1anZRyJPoXgwYyaFoFDR8ZGKBPcd1CX3u3IDaa+kutVmj304iYxS+3
         c51hR/RIkSGTSDGkyYeqK9UFVZcEPCCLUqPECyrp+x9TvuUPw/62+Mre71e8MeTfmE
         rY/vK/bBqX8jj0eQZhyPRB5JZKYSxqxGn9xDM28I=
Date:   Tue, 3 May 2022 18:36:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        marcel@holtmann.org
Subject: Re: [PATCH] USB: core: skip unconfiguration if device doesn't
 support it
Message-ID: <YnFaJ2/NW2v0oYXh@kroah.com>
References: <20220503153057.105128-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503153057.105128-1-jtornosm@redhat.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 03, 2022 at 05:30:57PM +0200, Jose Ignacio Tornos Martinez wrote:
> Bluetooth Dongles with CSR chip (i.e. USB Bluetooth V4.0 Dongle by
> Trust) hang when they are unbound from 'unbind' sysfs entry and
> can not be bound again.
> 
> The reason is CSR chip hangs when usb configuration command with
> index 0 (used to unconfigure) is sent during disconnection.
> 
> To avoid this unwanted result, it is necessary not to send this
> command for CSR chip, so a new quirk has been created.
> 
> Athough device is not unconfigured, it is better to avoid device
> hanging to be able to operate. Even bluetooth can be previously
> turned off.
> On the other hand, this is not important if usb device is going to
> be bound again (normal behavior), i.e. with usbip.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  2 ++
>  drivers/usb/core/message.c                      | 12 +++++++++---
>  drivers/usb/core/quirks.c                       |  6 ++++++
>  include/linux/usb/quirks.h                      |  3 +++
>  4 files changed, 20 insertions(+), 3 deletions(-)
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
> index d3c14b5ed4a1..7d42fdc7404c 100644
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
> @@ -510,6 +513,9 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* INTEL VALUE SSD */
>  	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
>  
> +	/* CSR Bluetooth */
> +	{ USB_DEVICE(0x0a12, 0x0001), .driver_info = USB_QUIRK_SKIP_UNCONFIGURE },
> +
>  	{ }  /* terminating entry must be last */
>  };
>  
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

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
